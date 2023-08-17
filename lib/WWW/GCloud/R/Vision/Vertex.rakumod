use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::Vertex;

use WWW::GCloud::Record;

also is gc-record;

has Int $.x;
has Int $.y;

method gist {
    "($!x, $!y)"
}

method Str { self.gist }