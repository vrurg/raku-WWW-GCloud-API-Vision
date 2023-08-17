use v6.e.PREVIEW;
use WWW::GCloud::API::Vision;
use WWW::GCloud::API::Vision::Types;
use WWW::GCloud;
use Data::Dump;

sub MAIN(Str:D $project, IO::Path:D(Str) $file, Bool :$image) {
    my $gcloud = WWW::GCloud.new;

    my $vision = $gcloud.vision;

    my $exit-code = 1;

    my $resource = $image ?? $vision.images !! $vision.files;

    # my $*WWW-GCLOUD-DUMP-BODY = 1;
    await $resource
        .annotation-queue(:!async)
            .project($project)
            .request(
                :$file,
                feature => ( :type(GCVFDocument), :model<builtin/latest> ),
                { # The only argument passed into this block is an instance of annotation queue.
                    .feature: GCVFLogo;
                    .feature: GCVFLabel;
                    .feature: GCVFObjectLocalization;
                    # my WWW::GClout::R::Vision::ImageContext:D $.img-ctx .= new: ...;
                    # .set-image-context($img-ctx);

                    # If can't be created with just .request arguments
                    # .set-input-config(...);

                    # .pages = 1, 3;
                })

            # If there is another file then a subsequent .request call will add it to the queue
            # .request(
            #     :$file2,
            #     feature => ( :type(GCVFDocument), :model<builtin/latest> ),
            #     -> $annotate-request {
            #         .add-feature: :type(GCVFLogo);
            #         # my WWW::GClout::R::Vision::ImageContext:D $.img-ctx .= new: ...;
            #         # .set-image-context($img-ctx);

            #         #@.pages = 1, 3;
            #     });

            .start
                .andthen({
                    say "Annotated '$file'.";
                    say Dump( .result,
                              :skip-methods,
                              :no-postfix,
                              overrides => %(
                                  DateTime => sub ($d) { $d.gist },
                                  'WWW::GCloud::Types::GCUri' => sub ($uri) { "'" ~ ($uri // "<no-URI>") ~ "'" },
                                  'WWW::GCloud::R::Vision::NormalizedVertex' => sub ($v) { ~($v // "()") },
                                  'WWW::GCloud::R::Vision::Vertex' => sub ($v) { ~($v // "()") },
                              ) );
                    $exit-code = 0;
                })
                .orelse({
                    note "!FAILED!";
                    note .cause;
                });

    exit $exit-code
}
