use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/BatchAnnotateFilesResponse#AnnotateFileResponse
unit class WWW::GCloud::R::Vision::AnnotateFileResponse;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::InputConfig;
use WWW::GCloud::R::Vision::AnnotateImageResponse;
use WWW::GCloud::R::Status;

also is gc-record;

has WWW::GCloud::R::Vision::InputConfig $.inputConfig;
has WWW::GCloud::R::Vision::AnnotateImageResponse:D @.responses;
has Int $.totalPages;
has WWW::GCloud::R::Status $.error;