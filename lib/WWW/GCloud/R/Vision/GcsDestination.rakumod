use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/OutputConfig#gcsdestination
unit class WWW::GCloud::R::Vision::GcsDestination;

use WWW::GCloud::Record;
use WWW::GCloud::API::Storage::Types;
use WWW::GCloud::RR::Vision::Uri;

also is gc-record;
also does WWW::GCloud::RR::Vision::Uri[GCSUri:D, GCSUriStr];
