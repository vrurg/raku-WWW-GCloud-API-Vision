use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::ImageSource;

use JSON::Class:auth<zef:vrurg>;
use WWW::GCloud::Record;
use WWW::GCloud::Types;

also is gc-record;

has GCUri:D(Str) $.imageUri is required handles <Str> is json(:to-json<to-json>, :from-json<from-json>);

multi method COERCE(UriStr:D $uri) {
    self.new: imageUri => GCUri.parse($uri)
}

multi method COERCE(GCUri:D $uri) {
    self.new: imageUri => $uri;
}