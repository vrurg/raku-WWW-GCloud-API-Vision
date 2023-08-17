use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#imageannotationcontext
unit class WWW::GCloud::R::Vision::ImageAnnotationContext;

use WWW::GCloud::Record;
use WWW::GCloud::RR::Vision::Uri;

also is gc-record;
also does WWW::GCloud::RR::Vision::Uri;

has Int $.pageNumber;