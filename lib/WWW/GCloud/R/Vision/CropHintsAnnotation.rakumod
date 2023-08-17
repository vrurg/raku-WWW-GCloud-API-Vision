use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#crophintsannotation
unit class WWW::GCloud::R::Vision::CropHintsAnnotation;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::CropHint;

also is gc-record;

has WWW::GCloud::R::Vision::CropHint:D @.cropHints;
