use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#symbol
unit class WWW::GCloud::R::Vision::Symbol;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::TextProperty;
use WWW::GCloud::R::Vision::BoundingPoly;

also is gc-record;

has WWW::GCloud::R::Vision::TextProperty $.property;
has WWW::GCloud::R::Vision::BoundingPoly $.boundingBox;
has Str $.text;
has Real $.confidence;
