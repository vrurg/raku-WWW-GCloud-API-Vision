use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#property
unit class WWW::GCloud::R::Vision::Property;

use JSON::Class:auth<zef:vrurg>;
use WWW::GCloud::Record;

also is gc-record;

has Str $.name;
has Str $.strValue is json(:name("value"));
has Str $.uint64Value;

method Pair {
    return Pair without $!name;
    Pair.new($!name, self.value)
}

method key {
    $!name;
}

method value {
    $!strValue // ($!uint64Value andthen .Int) // Nil
}

method kv {
    self.key, self.value
}