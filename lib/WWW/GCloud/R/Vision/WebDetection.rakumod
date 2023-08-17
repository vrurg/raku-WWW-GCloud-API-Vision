use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#webdetection
unit class WWW::GCloud::R::Vision::WebDetection;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::WebEntity;
use WWW::GCloud::R::Vision::WebImage;
use WWW::GCloud::R::Vision::WebPage;
use WWW::GCloud::R::Vision::WebLabel;

also is gc-record;

has WWW::GCloud::R::Vision::WebEntity:D @.webEntities;
has WWW::GCloud::R::Vision::WebImage:D @.fullMatchingImages;
has WWW::GCloud::R::Vision::WebImage:D @.partialMatchingImages;
has WWW::GCloud::R::Vision::WebPage:D @.pagesWithMatchingImages;
has WWW::GCloud::R::Vision::WebImage:D @.visuallySimilarImages;
has WWW::GCloud::R::Vision::WebLabel:D @.bestGuessLabels;
