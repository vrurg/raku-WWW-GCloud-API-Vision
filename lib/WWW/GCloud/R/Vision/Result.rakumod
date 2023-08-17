use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#result
unit class WWW::GCloud::R::Vision::Result;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::Product;
use WWW::GCloud::RR::Vision::Scorable;

also is gc-record;
also does WWW::GCloud::RR::Vision::Scorable;

has WWW::GCloud::R::Vision::Product $.product;
has Str $.image;