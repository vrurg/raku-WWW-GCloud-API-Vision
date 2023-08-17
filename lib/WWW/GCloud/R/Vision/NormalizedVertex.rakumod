use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::NormalizedVertex;

use WWW::GCloud::Record;

also is gc-record;

has Real $.x;
has Real $.y;

method gist {
    "($!x, $!y)"
}

method Str { self.gist }