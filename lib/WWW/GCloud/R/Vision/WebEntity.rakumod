use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#webentity
unit class WWW::GCloud::R::Vision::WebEntity;

use WWW::GCloud::Record;
use WWW::GCloud::RR::Vision::Scorable;

also is gc-record;
also does WWW::GCloud::RR::Vision::Scorable;

has Str $.entityId;
has Str $.description;