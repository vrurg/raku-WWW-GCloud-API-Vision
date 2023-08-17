use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::InputConfig;

use WWW::GCloud::API::Storage::Types;
use WWW::GCloud::R::Vision::GcsSource;
use WWW::GCloud::RR::Vision::Contentish;
use WWW::GCloud::Record;
use WWW::GCloud::Types;
use WWW::GCloud::Utils;

also is gc-record;
also does WWW::GCloud::RR::Vision::Contentish[:mime-type];

has WWW::GCloud::R::Vision::GcsSource $.gcsSource;
has Str $.mimeType;

proto method new(|) {*}

multi method new(GCSUriStr :content(:gcs-source(:$gcsSource)), *%profile) {
    self.bless: |%profile, gcsSource => WWW::GCloud::R::Vision::GcsSource.new( :uri($gcsSource) )
}

multi method new(GCUri:D :content(:gcs-source(:$gcsSource)), *%profile) {
    self.bless: |%profile, gcsSource => WWW::GCloud::R::Vision::GcsSource.new( :uri($gcsSource) )
}

multi method new(|c) { self.bless: |c }