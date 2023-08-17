use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::ProductSearchParams;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::BoundingPoly;

also is gc-record;

has WWW::GCloud::R::Vision::BoundingPoly $.boundingPoly;
has Str $.productSet;
has Str:D @.productCategories;
has Str $.filter;
