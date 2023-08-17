use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/projects.locations.products#KeyValue
unit class WWW::GCloud::R::Vision::KeyValue;

use WWW::GCloud::Record;

also is gc-record;

has Str:D $.key is required where 0 < *.chars <= 128;
has Str:D $.value is required where 0 < *.chars <= 128;

method Pair {
    Pair.new($!key, $!value)
}