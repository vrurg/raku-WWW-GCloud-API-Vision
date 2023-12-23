use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::Operations;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::Operation;

also is gc-record( :paginating(WWW::GCloud::R::Vision::Operation) );