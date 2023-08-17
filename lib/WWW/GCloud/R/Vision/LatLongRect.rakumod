use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::LatLongRect;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::LatLng;

also is gc-record;

has WWW::GCloud::R::Vision::LatLng $.minLatLng;
has WWW::GCloud::R::Vision::LatLng $.maxLatLng;