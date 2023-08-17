use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#groupedresult
unit class WWW::GCloud::R::Vision::GroupedResult;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::BoundingPoly;
use WWW::GCloud::R::Vision::Result;
use WWW::GCloud::R::Vision::ObjectAnnotation;

also is gc-record;

has WWW::GCloud::R::Vision::BoundingPoly $.boundingPoly;
has WWW::GCloud::R::Vision::Result:D @.results;
has WWW::GCloud::R::Vision::ObjectAnnotation:D @.objectAnnotations;