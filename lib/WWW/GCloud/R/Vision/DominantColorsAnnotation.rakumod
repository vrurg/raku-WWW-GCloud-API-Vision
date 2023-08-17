use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#dominantcolorsannotation
unit class WWW::GCloud::R::Vision::DominantColorsAnnotation;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::ColorInfo;

also is gc-record;

has WWW::GCloud::R::Vision::ColorInfo:D @.colors;
