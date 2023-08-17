use v6.e.PREVIEW;
unit role WWW::GCloud::RR::Vision::AnnotateFile;
use experimental :will-complain;

use MIME::Base64;
use WWW::GCloud::RR::Vision::AnnotateRequest;
use WWW::GCloud::R::Vision::InputConfig;
use WWW::GCloud::API::Storage::Types;

also does WWW::GCloud::RR::Vision::AnnotateRequest;

has WWW::GCloud::R::Vision::InputConfig $.inputConfig;

my subset Contentish of Any where Any:U | IO::Path | IO::Handle | Blob | Str;
my subset GCSource of Any where Any:U | GCSUriStr | GCSUri:D;

submethod REQUEST-PROFILE( % ( IO::Path(Str) :file(:$path),
                               GCSource :uri(:gcs-source(:$gcsSource)),
                               Contentish :$content,
                               Str :mime-type(:$mimeType),
                               *% ),
                           %into
                           --> Nil)
{
    %into<inputConfig> :=
        WWW::GCloud::R::Vision::InputConfig.new:
            :$mimeType,
            |(:content($_) with $path),
            |(:$gcsSource with $gcsSource),
            |(:$content with $content)
}

proto method set-input-config(|) {*}

multi method set-input-config(::?CLASS:D: WWW::GCloud::R::Vision::InputConfig:D $!inputConfig) { self }

multi method set-input-config(::?CLASS:D: |c) {
    $!inputConfig = self.create(WWW::GCloud::R::Vision::InputConfig, |c);
    self
}