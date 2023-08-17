use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::Position;

use WWW::GCloud::Record;

also is gc-record;

has Real:D $.x is required;
has Real:D $.y is required;
has Real:D $.z is required;