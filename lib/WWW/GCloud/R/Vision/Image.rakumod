use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::Image;

use MIME::Base64;
use WWW::GCloud::Record;
use WWW::GCloud::Types;
use WWW::GCloud::R::Vision::ImageSource;
use WWW::GCloud::RR::Vision::Contentish;

also is gc-record;
also does WWW::GCloud::RR::Vision::Contentish;

has WWW::GCloud::R::Vision::ImageSource(UriStrOrObj:D) $.source;

proto method new(|) {*}

multi method new(UriStrOrObj:D :content(:gcs-source(:gcsSource(:$uri))), *%profile) {
    self.bless: |%profile, source => WWW::GCloud::R::Vision::ImageSource.new(imageUri => $uri)
}

multi method new(|c) { self.bless: |c }