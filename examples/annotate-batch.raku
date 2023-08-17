use v6.e.PREVIEW;
use WWW::GCloud::API::Storage::Types;
use WWW::GCloud::API::Storage;
use WWW::GCloud::API::Vision::Types;
use WWW::GCloud::API::Vision;
use WWW::GCloud::R::Vision::BatchAnnotateFilesResponse;
use WWW::GCloud::R::Vision::BatchAnnotateImagesResponse;
use WWW::GCloud::Types;
use WWW::GCloud::Utils;
use WWW::GCloud;

# Reference implementation of async/batch annotation.
# Here we take a list of files to annotate, upload them into $bucket-path/sources/. Add a request per file into the
# async annotation queue. After submitting the queue for processing we use the received Operation object to monitor
# annotation status. When complete we download results. The uploaded files are removed from the bucket when the app
# ends.

sub MAIN(Str:D $project, Str:D $bucket-path, *@files, Bool :$image) {
    my $gcloud = WWW::GCloud.new;
    my $vis = $gcloud.vision;
    my $objects = $gcloud.storage.objects;
    my $exit-code = 1;

    my proto sub uri-path(|) {*}
    multi sub uri-path(GCSUriStr $path) { $path }
    multi sub uri-path(GCSUri $path) { $path }
    multi sub uri-path(Str:D $path) { 'gs://' ~ $path }

    my sub auto-dir($bpath) {
        my WWW::GCloud::R::Storage::Object $meta;
        my $folder = uri-path($bpath);
        if await $objects.exists(:$folder) {
            $meta = await $objects.get(:$folder);
        }
        else {
            say "Creating folder '$folder'";
            $meta = await $objects.insert(:$folder);
        }
        $meta;
    }

    my $dest-meta = auto-dir($bucket-path);
    my $dest-uri = GCSUri.new: :scheme<gs>, :authority($dest-meta.bucket), :path("/" ~ $dest-meta.name);
    my $sources-uri = $dest-uri.add: "sources/";
    my $sources-meta = auto-dir($sources-uri);
    my $out-uri = $dest-uri.add: "ual-";

    say "Will upload into " ~ $sources-uri;

    my $resource = $image ?? $vis.images !! $vis.files;

    my $queue = $resource.annotation-queue(:async, :$project);
    my $oconfig = $queue.output-config($out-uri, :batch-size(50));

    my @cleanup-queue;

    for @files -> IO:D() $file {

        my $gcsSource = $sources-uri.add($file.basename);

        say "GCS URL for '$file': ", ~$gcsSource;

        await $objects.insert( $gcsSource,
                               $file,
                               meta => {
                                    metadata => { :purpose<test> } } )
                .upload
                .andthen({
                    say "Done uploading " ~ $gcsSource;
                    @cleanup-queue.push: $gcsSource;
                });

        my %req-profile;

        unless $image {
            %req-profile<mime-type> = mime-type($file);
            my $out-uri = $dest-uri.add: $file.basename ~ "_";
            %req-profile<outputConfig> =
                WWW::GCloud::R::Vision::OutputConfig.new(gcsDestination => $out-uri);
        }

        $queue.request:
            :$gcsSource,
            feature => { :type(GCVFDocument), :model<builtin/latest> },
            |%req-profile;
    }

    my $op;
    await $queue.start
            .andthen({
                note $op = .result;
            });

    while !$op.done {
        sleep 1;
        say "Operation status: ", ($op = await $vis.operations.get($op)).to-json;
    }

    my \response-type = $image
        ?? WWW::GCloud::R::Vision::BatchAnnotateImagesResponse
        !! WWW::GCloud::R::Vision::AnnotateFileResponse;

    say "Fetching results.";
    for $op.response<responses>.list -> %out-resp {
        my $out-uri = GCSUri.parse: %out-resp<outputConfig><gcsDestination><uri>;

        for $objects.list($out-uri.bucket, $out-uri.object ~ '*').list {
            say "Candidate file: '", .name, "'";
            my $res = await $objects.get($out-uri.bucket, .name, :media)
                                .andthen({
                                    response-type.from-json(await .result.body-text)
                                });
            say " > completed ", $res.responses.elems, " requests.";

            for $res.responses -> $response {
                say "   * ", GCSUri($response.context.uri).basename;
            }
        }
    }

    LEAVE {
        for @cleanup-queue -> $gcs-uri {
            await $objects.delete($gcs-uri)
                    .andthen({
                        say "Removed " ~ $gcs-uri;
                    });
        }
    }
}