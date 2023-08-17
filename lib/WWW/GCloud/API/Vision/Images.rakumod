use v6.e.PREVIEW;
unit class WWW::GCloud::API::Vision::Images;

use WWW::GCloud::API::Vision::AnnotationQueue;
use WWW::GCloud::R::Vision::AnnotateImageRequest;
use WWW::GCloud::R::Vision::AnnotateImageResponse;
use WWW::GCloud::R::Vision::BatchAnnotateImagesResponse;
use WWW::GCloud::R::Vision::Operation;
use WWW::GCloud::Resource;

also does WWW::GCloud::Resource;

proto method annotate(|) {*}
multi method annotate( ::?CLASS:D:
                       WWW::GCloud::R::Vision::AnnotateImageRequest:D @requests,
                       Str:D :$project,
                       Str :$parent )
{
    my %body = :@requests;
    %body<parent> = $_ with $parent;
    my $api = $.api;

    $api.post: $api.method-url("images:annotate"),
               %body,
               headers => [
                    'x-goog-user-project' => $project,
               ],
               as => WWW::GCloud::R::Vision::BatchAnnotateImagesResponse
}
multi method annotate(::?CLASS:D: WWW::GCloud::API::Vision::AnnotationQueue:D $queue) {
    use Cro::Uri;
    my $api = $.api;
    without (my $project = $queue.project) {
        return Promise.broken( WWW::GCloud::API::Vision::X::AQ::NoProject.new )
    }
    $api.post: $api.method-url("images:annotate"),
               $queue,
               headers => [
                    'x-goog-user-project' => $project,
               ],
               as => WWW::GCloud::R::Vision::BatchAnnotateImagesResponse,
}

proto method asyncBatchAnnotate(|) {*}
multi method asyncBatchAnnotate( ::?CLASS:D:
                                 WWW::GCloud::R::Vision::AnnotateImageRequest:D @requests,
                                 WWW::GCloud::R::Vision::OutputConfig:D :output-config(:$outputConfig),
                                 Str:D :$project,
                                 Str :$parent )
{
    my %body = :@requests, :$outputConfig;
    %body<parent> = $_ with $parent;
    my $api = $.api;

    $api.post: $api.method-url("images:asyncBatchAnnotate"),
               %body,
               headers => [
                    'x-goog-user-project' => $project,
               ],
               as => WWW::GCloud::R::Vision::Operation
}
multi method asyncBatchAnnotate(::?CLASS:D: WWW::GCloud::API::Vision::AnnotationQueue:D $queue) {
    my $api = $.api;
    without (my $project = $queue.project) {
        return Promise.broken( WWW::GCloud::API::Vision::X::AQ::NoProject.new )
    }
    $api.post: $api.method-url("images:asyncBatchAnnotate"),
               $queue,
               headers => [
                    'x-goog-user-project' => $project,
               ],
               as => WWW::GCloud::R::Vision::Operation
}

method annotation-queue(::?CLASS:D: Bool:D :async(:$batch) = False, Str :$project) {
    my $output-config = False;
    my &runner;

    if $batch {
        $output-config = True;
        &runner = { $:resource.asyncBatchAnnotate: $:queue };
    }
    else {
        &runner = { $:resource.annotate: $:queue };
    }

    WWW::GCloud::API::Vision::AnnotationQueue[WWW::GCloud::R::Vision::AnnotateImageRequest, &runner, :$output-config]
        .new: :resource(self), :$project
}
