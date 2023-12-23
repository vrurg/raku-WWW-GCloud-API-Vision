use v6.e.PREVIEW;
# Representation of files and image annotation request REST calls, like in
# https://cloud.google.com/vision/docs/reference/rest/v1/files/annotate or
# https://cloud.google.com/vision/docs/reference/rest/v1/images/asyncBatchAnnotate
unit class WWW::GCloud::API::Vision::AnnotationQueue;

use JSON::Class:auth<zef:vrurg>;
use JSON::Class::Attr:auth<zef:vrurg>;

use WWW::GCloud::API::Storage::Types;
use WWW::GCloud::API::Vision::X;
use WWW::GCloud::R::Vision::Feature;
use WWW::GCloud::R::Vision::InputConfig;
use WWW::GCloud::R::Vision::OutputConfig;
use WWW::GCloud::RR::Vision::AnnotateRequest;
use WWW::GCloud::Record;
use WWW::GCloud::Resource;
use WWW::GCloud::Types;

also is gc-record;

has WWW::GCloud::Resource:D $.resource is required is json(:skip);

has Str $.parent;
has Str $!project is built is json(:skip);

my role Typed[::REQ-TYPE WWW::GCloud::RR::Vision::AnnotateRequest, &runner, Bool :$output-config] is json(:implicit) {
    has REQ-TYPE:D @.requests;
    has WWW::GCloud::R::Vision::OutputConfig $.outputConfig;

    method request( ::?CLASS:D: &request-composer?, *%profile --> ::?CLASS:D ) is raw
    {
        my %p = |(:$!outputConfig if $output-config && $!outputConfig);
        my REQ-TYPE:D $req .= new:
                                |(:$!outputConfig if $output-config && $!outputConfig),
                                |REQ-TYPE.new-profile(%profile);
        .($req) with &request-composer;
        @!requests.push: $req;
        self
    }

    proto method output-config(|) {*}
    multi method output-config { $!outputConfig }
    multi method output-config(GCSUri:D(GCSUriStr) $gcsDestination, Int :$batchSize) {
        $!outputConfig = WWW::GCloud::R::Vision::OutputConfig.new(:$gcsDestination, :$batchSize)
    }
    multi method output-config(Str:D $bucket-path, Int :$batchSize) {
        my $gcsDestination = $bucket-path ~~ UriStr ?? $bucket-path !! 'gs://' ~ $bucket-path;
        $!outputConfig = WWW::GCloud::R::Vision::OutputConfig.new(:$gcsDestination, :$batchSize);
    }

    method start {
        &runner.(:$.resource, :queue(self))
    }

    # If $output-config then we need it in JSON.
    unless $output-config {
        ::?CLASS.HOW does my role :: {
            method json-attr-register(Mu \obj, JSON::Class::Attr:D \attr) {
                if attr.name eq '$!outputConfig' {
                    nextwith(obj, attr.clone(:skip))
                }
                nextsame
            }
        }
    }
}

method ^parameterize( Mu:U \req,
                      WWW::GCloud::RR::Vision::AnnotateRequest:U \of,
                      &runner,
                      Bool :$output-config )
                    is raw
{
    my \typed-req = req.^mixin( Typed[of, &runner, :$output-config] );
    typed-req.^set_name(req.^name ~ "[" ~ of.^name ~ "]");
    typed-req
}

proto method project(|) {*}
multi method project(::?CLASS:D:) { $!project }
multi method project(::?CLASS:D: Str:D $!project) { self }