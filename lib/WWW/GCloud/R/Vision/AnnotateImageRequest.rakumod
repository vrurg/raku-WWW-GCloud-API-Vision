use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::AnnotateImageRequest;

use WWW::GCloud::Record;
use WWW::GCloud::Types;
use WWW::GCloud::RR::Vision::AnnotateRequest;
use WWW::GCloud::R::Vision::Image;

also is gc-record;
also does WWW::GCloud::RR::Vision::AnnotateRequest;

has WWW::GCloud::R::Vision::Image $.image;

my subset Contentish of Any where Any:U | IO::Path | IO::Handle | Blob | Str;

submethod REQUEST-PROFILE( % ( IO::Path(Str) :file(:$path),
                               UriStrOrObj :gcs-source(:gcsSource(:$uri)),
                               Contentish :$content,
                               *% ),
                           %into
                           --> Nil)
{
    %into<image> :=
        WWW::GCloud::R::Vision::Image.new:
            |(:content($_) with $path),
            |(:source($_) with $uri),
            |(:$content with $content)
}