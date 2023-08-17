use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#productsearchresults
unit class WWW::GCloud::R::Vision::ProductSearchResults;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::Result;
use WWW::GCloud::R::Vision::GroupedResult;

also is gc-record;

has Str $.indexTime;
has WWW::GCloud::R::Vision::Result:D @.results;
has WWW::GCloud::R::Vision::GroupedResult:D @.productGroupedResults;