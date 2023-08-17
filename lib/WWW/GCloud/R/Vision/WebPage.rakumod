use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#webpage
unit class WWW::GCloud::R::Vision::WebPage;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::WebImage;
use WWW::GCloud::RR::Vision::Scorable;

also is gc-record;
also does WWW::GCloud::RR::Vision::Scorable;

has Str $.url;
has Str $.pageTitle;
has WWW::GCloud::R::Vision::WebImage:D @.fullMatchingImages;
has WWW::GCloud::R::Vision::WebImage:D @.partialMatchingImages;