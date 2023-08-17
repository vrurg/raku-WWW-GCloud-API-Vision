use v6.e.PREVIEW;
use WWW::GCloud::Types;
use Cro::Uri;
unit role WWW::GCloud::RR::Vision::Uri[::URI-TYPE Cro::Uri:U $ = GCUri:D, ::CONSTRAINT Mu $ = Str:D];

use JSON::Marshal;
use JSON::Unmarshal;
use WWW::GCloud::API::Storage::Types;

has URI-TYPE(CONSTRAINT) $.uri is marshalled-by('to-json') is unmarshalled-by('from-json');

multi method COERCE(CONSTRAINT $uri) {
    self.new: :$uri
}
multi method COERCE(URI-TYPE $uri) {
    self.new: :$uri
}

multi method COERCE(Cro::Uri:D $uri) {
    self.new: uri => URI-TYPE.parse(~$uri)
}