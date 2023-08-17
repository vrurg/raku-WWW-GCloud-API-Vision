use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#colorinfo
unit class WWW::GCloud::R::Vision::ColorInfo;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::Color;
use WWW::GCloud::RR::Vision::Scorable;

also is gc-record;
also does WWW::GCloud::RR::Vision::Scorable;

has WWW::GCloud::R::Vision::Color $.color;
has Real $.pixelFraction;