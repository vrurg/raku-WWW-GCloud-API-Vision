use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#imageproperties
unit class WWW::GCloud::R::Vision::ImageProperties;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::DominantColorsAnnotation;

also is gc-record;

has WWW::GCloud::R::Vision::DominantColorsAnnotation $.dominantColors;