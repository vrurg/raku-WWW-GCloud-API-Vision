use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#paragraph
unit class WWW::GCloud::R::Vision::Paragraph;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::TextProperty;
use WWW::GCloud::R::Vision::BoundingPoly;
use WWW::GCloud::R::Vision::Word;

also is gc-record;

has WWW::GCloud::R::Vision::TextProperty $.property;
has WWW::GCloud::R::Vision::BoundingPoly $.boundingBox;
has WWW::GCloud::R::Vision::Word:D @.words;
has Real $.confidence;