use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::SafeSearchAnnotation;

use JSON::Marshal;
use WWW::GCloud::Record;
use WWW::GCloud::API::Vision::Types;

also is gc-record;

has GCVLikelihood(Str) $.adult;
has GCVLikelihood(Str) $.spoof;
has GCVLikelihood(Str) $.medical;
has GCVLikelihood(Str) $.violence;
has GCVLikelihood(Str) $.racy;