use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/projects.locations.products#resource:-product
unit class WWW::GCloud::R::Vision::Product;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::KeyValue;

also is gc-record;

has Str $.name;
has Str $.displayName;
has Str $.description;
has Str $.productCategory;
has WWW::GCloud::R::Vision::KeyValue:D @.productLabels;