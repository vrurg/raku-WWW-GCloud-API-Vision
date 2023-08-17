use v6.e.PREVIEW;
unit role WWW::GCloud::RR::Vision::Contentish[Bool :$mime-type = False];

use MIME::Base64;
use WWW::GCloud::Utils;

has Str $.content;

submethod TWEAK {
    with $!content {
        $!content but role :: {
            method gist {
                nextsame if self.chars < 24;
                self.substr(0, 10) ~ "..." ~ self.substr(*-10)
            }
        }
    }
}

method !fixup-profile(IO::Path:D :$content, Str :mime-type(:$mimeType), *%profile) is raw {
    %( |%profile,
        |(mimeType => ($mimeType // mime-type($content)) if $mime-type),
        content => $content.slurp(:bin, :close) )
}

multi method new(IO::Handle:D :$content!, *%profile) {
    my proto sub benc(|) {*}
    multi sub benc(Str:D \buf)  is raw { MIME::Base64.encode-str(buf, :oneline, :eol('')) }
    multi sub benc(Blob:D \buf) is raw { MIME::Base64.encode(buf, :oneline, :eol(''))     }
    # We're rather agnostic about the $content handle mode. Try to handle both strings and blobs, whaterver got slurped
    # in.
    self.new: |%profile, content => benc($content.slurp)
}

multi method new(Blob:D :$content!, *%profile) {
    self.new: |%profile, content => MIME::Base64.encode($content, :oneline, :eol(''))
}

# ::?CLASS.new("/path/to/file")
multi method new(IO::Path:D(Str) $content, *%profile) {
    self.new: |self!fixup-profile(:$content, |%profile)
}

multi method new(IO::Path:D :$content!, *%profile) {
    self.new: |self!fixup-profile(:$content, |%profile)
}