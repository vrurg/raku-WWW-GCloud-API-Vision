use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#textproperty
unit class WWW::GCloud::R::Vision::TextProperty;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::DetectedLanguage;
use WWW::GCloud::R::Vision::DetectedBreak;

also is gc-record;

has WWW::GCloud::R::Vision::DetectedLanguage:D @.detectedLanguages;
has WWW::GCloud::R::Vision::DetectedBreak $.detectedBreak;