use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::BatchAnnotateImagesResponse;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::AnnotateImageResponse;
use WWW::GCloud::RR::Vision::BatchAnnotateResponse;

also is gc-record;
also does WWW::GCloud::RR::Vision::BatchAnnotateResponse[WWW::GCloud::R::Vision::AnnotateImageResponse];

