use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse
unit class WWW::GCloud::R::Vision::AnnotateImageResponse;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::FaceAnnotation;
use WWW::GCloud::R::Vision::EntityAnnotation;
use WWW::GCloud::R::Vision::LocalizedObjectAnnotation;
use WWW::GCloud::R::Vision::TextAnnotation;
use WWW::GCloud::R::Vision::SafeSearchAnnotation;
use WWW::GCloud::R::Vision::ImageProperties;
use WWW::GCloud::R::Vision::CropHintsAnnotation;
use WWW::GCloud::R::Vision::WebDetection;
use WWW::GCloud::R::Vision::ProductSearchResults;
use WWW::GCloud::R::Vision::ImageAnnotationContext;
use WWW::GCloud::R::Status;

also is gc-record;

has WWW::GCloud::R::Vision::FaceAnnotation:D @.faceAnnotations;
has WWW::GCloud::R::Vision::EntityAnnotation:D @.landmarkAnnotations;
has WWW::GCloud::R::Vision::EntityAnnotation:D @.logoAnnotations;
has WWW::GCloud::R::Vision::EntityAnnotation:D @.labelAnnotations;
has WWW::GCloud::R::Vision::LocalizedObjectAnnotation:D @.localizedObjectAnnotations;
has WWW::GCloud::R::Vision::EntityAnnotation:D @.textAnnotations;
has WWW::GCloud::R::Vision::TextAnnotation $.fullTextAnnotation;
has WWW::GCloud::R::Vision::SafeSearchAnnotation $.safeSearchAnnotation;
has WWW::GCloud::R::Vision::ImageProperties $.imagePropertiesAnnotation;
has WWW::GCloud::R::Vision::CropHintsAnnotation $.cropHintsAnnotation;
has WWW::GCloud::R::Vision::WebDetection $.webDetection;
has WWW::GCloud::R::Vision::ProductSearchResults $.productSearchResults;
has WWW::GCloud::R::Vision::ImageAnnotationContext $.context;
has WWW::GCloud::R::Status $.error;
