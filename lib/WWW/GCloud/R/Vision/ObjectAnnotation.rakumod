use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#objectannotation
unit class WWW::GCloud::R::Vision::ObjectAnnotation;

use WWW::GCloud::Record;
use WWW::GCloud::RR::Vision::ObjAnnotation;

also is gc-record;
also does WWW::GCloud::RR::Vision::ObjAnnotation;
