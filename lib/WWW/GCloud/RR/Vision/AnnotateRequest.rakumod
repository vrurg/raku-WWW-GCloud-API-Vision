use v6.e.PREVIEW;
unit role WWW::GCloud::RR::Vision::AnnotateRequest;

use JSON::Class:auth<zef:vrurg>;
use Method::Also;

use WWW::GCloud::API::Vision::Types;
use WWW::GCloud::R::Vision::Feature;
use WWW::GCloud::R::Vision::ImageContext;

also is json(:implicit);

has WWW::GCloud::R::Vision::Feature:D @.features is required;
has WWW::GCloud::R::Vision::ImageContext $.imageContext;

submethod REQUEST-PROFILE( % ( WWW::GCloud::R::Vision::Feature() :$feature,
                              WWW::GCloud::R::Vision::Feature:D() :@features,
                              *% ),
                           %into
                           --> Nil)
{
    @features = my WWW::GCloud::R::Vision::Feature:D @ = $_, |@features with $feature;
    %into<features> := @features;
}

method new-profile(%from --> Hash:D) is raw {
    my %into;
    self.WALK(:name<REQUEST-PROFILE>, :roles, :!methods).(%from, %into);
    %into
}

proto method feature(|) is also<add-feature> {*}

multi method feature( ::?CLASS:D: WWW::GCloud::R::Vision::Feature:D $feature) {
    @!features.push: $feature;
    self
}

multi method feature( ::?CLASS:D:
                      GCVFeatureType:D :$type,
                      Str :$model,
                      UInt :max-results(:$maxResults)
                      --> ::?CLASS:D )
{
    @!features.push: WWW::GCloud::R::Vision::Feature.new(:$type, :$model, :$maxResults);
    self
}

multi method feature( ::?CLASS:D:
                      GCVFeatureType:D $type,
                      Str $model?,
                      UInt :max-results(:$maxResults)
                      --> ::?CLASS:D )
{
    @!features.push: WWW::GCloud::R::Vision::Feature.new(:$type, :$model, :$maxResults);
    self
}

method set-image-context(::?CLASS:D: WWW::GCloud::R::Vision::ImageContext:D $!imageContext --> ::?CLASS:D) { self }