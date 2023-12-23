use v6.e.PREVIEW;
unit role WWW::GCloud::RR::Vision::BatchAnnotateResponse[::RESP-TYPE];

use JSON::Class:auth<zef:vrurg>;

also is json(:implicit);

has RESP-TYPE @.responses;