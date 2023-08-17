use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#textannotation
unit class WWW::GCloud::R::Vision::TextAnnotation;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::Page;

also is gc-record;

has Str $.text;
has WWW::GCloud::R::Vision::Page:D @.pages;