use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::ImageContext;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::LatLongRect;
use WWW::GCloud::R::Vision::CropHintsParams;
use WWW::GCloud::R::Vision::ProductSearchParams;
use WWW::GCloud::R::Vision::WebDetectionParams;
use WWW::GCloud::R::Vision::TextDetectionParams;

also is gc-record;

has WWW::GCloud::R::Vision::LatLongRect $.latLongRect;
has Str:D @.languageHints;
has WWW::GCloud::R::Vision::CropHintsParams $.cropHintsParams;
has WWW::GCloud::R::Vision::ProductSearchParams $.productSearchParams;
has WWW::GCloud::R::Vision::WebDetectionParams $.webDetectionParams;
has WWW::GCloud::R::Vision::TextDetectionParams $.textDetectionParams;
