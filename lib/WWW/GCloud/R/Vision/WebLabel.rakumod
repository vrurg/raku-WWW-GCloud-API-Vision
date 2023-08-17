use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#weblabel
unit class WWW::GCloud::R::Vision::WebLabel;

use WWW::GCloud::Record;

also is gc-record;

has Str $.label;
has Str $.languageCode;