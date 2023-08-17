use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#word
unit class WWW::GCloud::R::Vision::Word;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::TextProperty;
use WWW::GCloud::R::Vision::BoundingPoly;
use WWW::GCloud::R::Vision::Symbol;

also is gc-record;

has WWW::GCloud::R::Vision::TextProperty $.property;
has WWW::GCloud::R::Vision::BoundingPoly $.boundingBox;
has WWW::GCloud::R::Vision::Symbol:D @.symbols;
has Real $.confidence;