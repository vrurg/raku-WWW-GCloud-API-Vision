use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#page
unit class WWW::GCloud::R::Vision::Page;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::TextProperty;
use WWW::GCloud::R::Vision::Block;

also is gc-record;

has WWW::GCloud::R::Vision::TextProperty $.property;
has Int $.width;
has Int $.height;
has WWW::GCloud::R::Vision::Block:D @.blocks;
has Real $.confidence;