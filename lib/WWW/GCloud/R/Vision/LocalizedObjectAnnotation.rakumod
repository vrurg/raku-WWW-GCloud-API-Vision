use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#localizedobjectannotation
unit class WWW::GCloud::R::Vision::LocalizedObjectAnnotation;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::BoundingPoly;
use WWW::GCloud::RR::Vision::ObjAnnotation;
use WWW::GCloud::RR::Vision::Scorable;

also is gc-record;
also does WWW::GCloud::RR::Vision::ObjAnnotation;
also does WWW::GCloud::RR::Vision::Scorable;

has WWW::GCloud::R::Vision::BoundingPoly $.boundingPoly;