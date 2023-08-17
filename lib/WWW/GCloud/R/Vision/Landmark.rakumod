use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#landmark
unit class WWW::GCloud::R::Vision::Landmark;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::Position;

also is gc-record;

has Str $.type;
has WWW::GCloud::R::Vision::Position $.position;