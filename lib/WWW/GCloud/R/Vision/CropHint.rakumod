use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#crophint
unit class WWW::GCloud::R::Vision::CropHint;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::BoundingPoly;

also is gc-record;

has WWW::GCloud::R::Vision::BoundingPoly $.boundingPoly;
has Real $.confidence;
has Real $.importanceFraction;