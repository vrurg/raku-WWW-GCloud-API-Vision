use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::SafeSearchAnnotation;

use JSON::Marshal;
use WWW::GCloud::Record;
use WWW::GCloud::API::Vision::Types;

also is gc-record;

has GCVLikelihood(Str) $.adult is marshalled-by('to-json');
has GCVLikelihood(Str) $.spoof is marshalled-by('to-json');
has GCVLikelihood(Str) $.medical is marshalled-by('to-json');
has GCVLikelihood(Str) $.violence is marshalled-by('to-json');
has GCVLikelihood(Str) $.racy is marshalled-by('to-json');