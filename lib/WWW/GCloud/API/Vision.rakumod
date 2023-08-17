use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest
unit class WWW::GCloud::API::Vision:ver($?DISTRIBUTION.meta<ver>):auth($?DISTRIBUTION.meta<auth>):api($?DISTRIBUTION.meta<api>);

use AttrX::Mooish;
use WWW::GCloud;
use WWW::GCloud::API;
use WWW::GCloud::Utils;
use WWW::GCloud::API::Vision::Files;
use WWW::GCloud::API::Vision::Images;
use WWW::GCloud::API::Vision::Operations;

also does WWW::GCloud::API['vision'];

has $.base-url = 'https://vision.googleapis.com/v1';

has WWW::GCloud::API::Vision::Files:D $.files is mooish(:lazy);
has WWW::GCloud::API::Vision::Images:D $.images is mooish(:lazy);
has WWW::GCloud::API::Vision::Operations:D $.operations is mooish(:lazy);

method build-files {
    self.create: WWW::GCloud::API::Vision::Files
}

method build-images {
    self.create: WWW::GCloud::API::Vision::Images
}

method build-operations {
    self.create: WWW::GCloud::API::Vision::Operations
}

method method-url(Str:D $method-path) {
    ~ $.api-url.clone: path => "/" ~ (|$.api-url.path-segments.grep(?*), $method-path).join("/")
}

our sub META6 { $?DISTRIBUTION.meta }