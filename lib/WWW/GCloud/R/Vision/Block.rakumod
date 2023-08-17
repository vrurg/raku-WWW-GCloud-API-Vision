use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#block
unit class WWW::GCloud::R::Vision::Block;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::TextProperty;
use WWW::GCloud::R::Vision::BoundingPoly;
use WWW::GCloud::R::Vision::Paragraph;
use WWW::GCloud::API::Vision::Types;

also is gc-record;


has WWW::GCloud::R::Vision::TextProperty $.property;
has WWW::GCloud::R::Vision::BoundingPoly $.boundingBox;
has WWW::GCloud::R::Vision::Paragraph:D @.paragraphs;
has GCVBlockType(Str) $.blockType;
has Real $.confidence;