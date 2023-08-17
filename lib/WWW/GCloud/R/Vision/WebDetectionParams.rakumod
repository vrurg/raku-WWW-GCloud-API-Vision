use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/ImageContext#webdetectionparams
unit class WWW::GCloud::R::Vision::WebDetectionParams;

use WWW::GCloud::Record;

also is gc-record;

has Bool:D $.includeGeoResults is required;
