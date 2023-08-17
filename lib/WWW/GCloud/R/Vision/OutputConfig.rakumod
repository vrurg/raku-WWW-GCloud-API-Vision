use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/OutputConfig
unit class WWW::GCloud::R::Vision::OutputConfig;

use WWW::GCloud::Record;
use WWW::GCloud::API::Storage::Types;
use WWW::GCloud::R::Vision::GcsDestination;

also is gc-record;

has WWW::GCloud::R::Vision::GcsDestination:D(GCSUri(GCSUriStr)) $.gcsDestination is required;
has UInt $.batchSize;

multi method COERCE(GCSUriStr:D $gs-dest) {
    self.new: gcsDestination => WWW::GCloud::R::Vision::GcsDestination.new(uri => GCSUri.parse($gs-dest))
}
multi method COERCE(GCSUri:D $gs-dest) {
    self.new: gcsDestination => WWW::GCloud::R::Vision::GcsDestination.new(uri => $gs-dest)
}