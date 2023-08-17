use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#entityannotation
unit class WWW::GCloud::R::Vision::EntityAnnotation;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::BoundingPoly;
use WWW::GCloud::R::Vision::LocationInfo;
use WWW::GCloud::R::Vision::Property;
use WWW::GCloud::RR::Vision::Scorable;

also is gc-record;
also does WWW::GCloud::RR::Vision::Scorable;

has Str $.mid;
has Str $.locale;
has Str $.description;
has Real $.confidence;
has Real $.topicality;
has WWW::GCloud::R::Vision::BoundingPoly $.boundingPoly;
has WWW::GCloud::R::Vision::LocationInfo:D @.locations;
has WWW::GCloud::R::Vision::Property:D @.properties;