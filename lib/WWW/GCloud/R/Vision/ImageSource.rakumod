use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::ImageSource;

use JSON::Marshal;
use JSON::Unmarshal;
use WWW::GCloud::Record;
use WWW::GCloud::Types;

also is gc-record;

has GCUri:D(Str) $.imageUri is required handles <Str>
                             is marshalled-by('to-json')
                             is unmarshalled-by('from-json');

multi method COERCE(UriStr:D $uri) {
    self.new: imageUri => GCUri.parse($uri)
}

multi method COERCE(GCUri:D $uri) {
    self.new: imageUri => $uri;
}