use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest#rest-resource:-v1.files
unit class WWW::GCloud::API::Vision::Files;

use WWW::GCloud::API::Storage::Types;
use WWW::GCloud::API::Vision::AnnotationQueue;
use WWW::GCloud::R::Storage::Buckets;
use WWW::GCloud::R::Vision::AnnotateFileRequest;
use WWW::GCloud::R::Vision::AsyncAnnotateFileRequest;
use WWW::GCloud::R::Vision::BatchAnnotateFilesResponse;
use WWW::GCloud::R::Vision::Operation;
use WWW::GCloud::Record;
use WWW::GCloud::Resource;
use WWW::GCloud::X;

also does WWW::GCloud::Resource;

proto method annotate(|) {*}
multi method annotate( ::?CLASS:D:
                       WWW::GCloud::R::Vision::AnnotateFileRequest:D @requests,
                       Str:D :$project,
                       Str :$parent )
{
    my %body = :@requests;
    %body<parent> = $_ with $parent;
    my $api = $.api;

    $api.post: $api.method-url("files:annotate"),
               %body,
               headers => [
                    'x-goog-user-project' => $project,
               ],
               as => WWW::GCloud::R::Vision::BatchAnnotateFilesResponse
}
multi method annotate(::?CLASS:D: WWW::GCloud::API::Vision::AnnotationQueue:D $queue) {
    use Cro::Uri;
    my $api = $.api;
    without (my $project = $queue.project) {
        return Promise.broken( WWW::GCloud::API::Vision::X::AQ::NoProject.new )
    }
    $api.post: $api.method-url("files:annotate"),
               $queue,
               headers => [
                    'x-goog-user-project' => $project,
               ],
               as => WWW::GCloud::R::Vision::BatchAnnotateFilesResponse,
}

proto method asyncBatchAnnotate(|) {*}
multi method asyncBatchAnnotate( ::?CLASS:D:
                                 WWW::GCloud::R::Vision::AsyncAnnotateFileRequest:D @requests,
                                 Str:D :$project,
                                 Str :$parent )
{
    my %body = :@requests;
    %body<parent> = $_ with $parent;
    my $api = $.api;

    $api.post: $api.method-url("files:asyncBatchAnnotate"),
               %body,
               headers => [
                    'x-goog-user-project' => $project,
               ],
               as => WWW::GCloud::R::Vision::Operation
}
multi method asyncBatchAnnotate(::?CLASS:D: WWW::GCloud::API::Vision::AnnotationQueue:D $queue) {
    my $api = $.api;
    $api.post: $api.method-url("files:asyncBatchAnnotate"),
               $queue,
               headers => [
                    'x-goog-user-project' => $queue.project,
               ],
               as => WWW::GCloud::R::Vision::Operation
}

method annotation-queue(::?CLASS:D: Bool:D :async(:$batch) = False, Str :$project) {
    my Mu $type;
    my &runner;

    if $batch {
        $type := WWW::GCloud::R::Vision::AsyncAnnotateFileRequest;
        &runner = { $:resource.asyncBatchAnnotate: $:queue };
    }
    else {
        $type := WWW::GCloud::R::Vision::AnnotateFileRequest;
        &runner = { $:resource.annotate: $:queue };
    }

    WWW::GCloud::API::Vision::AnnotationQueue[$type, &runner].new: :resource(self), :$project
}