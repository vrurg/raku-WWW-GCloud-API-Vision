use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#locationinfo
unit class WWW::GCloud::R::Vision::LocationInfo;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::LatLng;

also is gc-record;

has WWW::GCloud::R::Vision::LatLng $.latLng;
