use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::Operations;

use WWW::GCloud::Record;
use WWW::GCloud::RR::Paginatable;
use WWW::GCloud::R::Vision::Operation;

also is gc-record;
also does WWW::GCloud::RR::Paginatable[WWW::GCloud::R::Vision::Operation];