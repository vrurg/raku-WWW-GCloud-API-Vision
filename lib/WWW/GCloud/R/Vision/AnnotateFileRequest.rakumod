use v6.e.PREVIEW;
unit class WWW::GCloud::R::Vision::AnnotateFileRequest;

use WWW::GCloud::Record;
use WWW::GCloud::RR::Vision::AnnotateFile;

also is gc-record;
also does WWW::GCloud::RR::Vision::AnnotateFile;

has UInt:D @.pages;