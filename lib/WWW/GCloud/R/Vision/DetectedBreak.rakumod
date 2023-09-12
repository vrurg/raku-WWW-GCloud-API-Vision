use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#detectedbreak
unit class WWW::GCloud::R::Vision::DetectedBreak;

use JSON::Marshal;
use WWW::GCloud::Record;
use WWW::GCloud::API::Vision::Types;

also is gc-record;

has GCVBreakType(Str) $.type;
has Bool $.isPrefix;