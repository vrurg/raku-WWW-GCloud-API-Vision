use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/locations.operations#resource:-operation
unit class WWW::GCloud::R::Vision::Operation;

use AttrX::Mooish;
use WWW::GCloud::Record;
use WWW::GCloud::R::Status;

also is gc-record;

has Str $.name;
has %.metadata;
has Bool $.done;
has WWW::GCloud::R::Status $.error;
has %.response;

has Str $!shortname is mooish(:lazy);
has Str $!project is mooish(:lazy);

method !build-shortname {
    $!name.split("/").tail
}

method !build-project {
    # The initial name, returned by asyncBatchAnnotate, is "projects/<project>/operations/<op>". But when an operations
    # status is retrieved via operations.get the name is plain "operations/<op>".
    (my $parts := $!name.split("/").cache).head eq 'projects'
        ?? $parts[1]
        !! Nil
}

method shortname { $!shortname }
method project   { $!project }
method set-project(Str:D $!project) { self }