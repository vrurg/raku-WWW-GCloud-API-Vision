use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::Vertex;

use WWW::GCloud::Record;

also is gc-record;

has Int $.x;
has Int $.y;

multi method gist(::?CLASS:D:) {
    "($!x, $!y)"
}

multi method Str(::?CLASS:D:) { self.gist }