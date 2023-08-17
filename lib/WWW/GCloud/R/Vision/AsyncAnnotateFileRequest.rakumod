use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AsyncAnnotateFileRequest
unit class WWW::GCloud::R::Vision::AsyncAnnotateFileRequest;
use experimental :will-complain;

use WWW::GCloud::Record;
use WWW::GCloud::API::Storage::Types;
use WWW::GCloud::R::Vision::OutputConfig;
use WWW::GCloud::RR::Vision::AnnotateFile;

also is gc-record;
also does WWW::GCloud::RR::Vision::AnnotateFile;

has WWW::GCloud::R::Vision::OutputConfig $.outputConfig;

submethod TWEAK(WWW::GCloud::R::Vision::OutputConfig :output-config(:$!outputConfig)) {}

submethod REQUEST-PROFILE( % ( :gcs-destination(:$gcsDestination) where Any:U | GCSUriStr | GCSUri:D,
                               WWW::GCloud::R::Vision::OutputConfig :output-config(:$outputConfig) is copy,
                               UInt :batch-size(:$batchSize),
                               *% ),
                           %into
                           --> Nil)
{
    $outputConfig //= WWW::GCloud::R::Vision::OutputConfig.new(:$gcsDestination, :$batchSize) with $gcsDestination;
    %into<outputConfig> := $_ with $outputConfig;
}

proto method output-config(|) {*}
multi method output-config { $!outputConfig }
multi method output-config(Str:D $bucket-path, Int :batch-size(:$batchSize)) {
    my $gcsDestination = $bucket-path ~~ GCSUriStr ?? $bucket-path !! 'gs://' ~ $bucket-path;
    $!outputConfig = WWW::GCloud::R::Vision::OutputConfig.new(:$gcsDestination, :$batchSize);
}