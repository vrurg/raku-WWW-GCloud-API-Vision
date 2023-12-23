use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/Feature
unit class WWW::GCloud::R::Vision::Feature;

use WWW::GCloud::Record;
use WWW::GCloud::API::Vision::Types;

also is gc-record;

has GCVFeatureType(Str) $.type;
has Int $.maxResults;
has Str $.model;

multi method new(GCVFeatureType:D(Str) $type) {
    self.new: :$type
}
multi method new(%p (GCVFeatureType:D(Str) :type($), Int :max-results(:maxResults($)), Str :model($))) {
    self.new: |%p
}
multi method new(@c (GCVFeatureType:D(Str) :type($), Int :max-results(:maxResults($)), Str :model($)) ) {
    self.new: |@c.Capture
}