use v6.e.PREVIEW;
unit role WWW::GCloud::RR::Vision::ObjAnnotation;

use JSON::Class:auth<zef:vrurg>;

use WWW::GCloud::RR::Vision::Scorable;

also is json(:implicit);

has Str $.mid;
has Str $.languageCode;
has Str $.name;