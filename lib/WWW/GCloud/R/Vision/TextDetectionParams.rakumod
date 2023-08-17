use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/ImageContext#textdetectionparams
unit class WWW::GCloud::R::Vision::TextDetectionParams;

use WWW::GCloud::Record;

also is gc-record;

has Bool $.enableTextDetectionConfidenceScore;
has Str:D @.advancedOcrOptions;