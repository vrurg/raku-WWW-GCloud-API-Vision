use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::DetectedLanguage;

use WWW::GCloud::Record;

also is gc-record;

has Str $.languageCode;
has Real $.confidence;