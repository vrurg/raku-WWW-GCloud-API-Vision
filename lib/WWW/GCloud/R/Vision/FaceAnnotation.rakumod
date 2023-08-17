use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#FaceAnnotation
unit class WWW::GCloud::R::Vision::FaceAnnotation;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::BoundingPoly;
use WWW::GCloud::R::Vision::Landmark;
use WWW::GCloud::API::Vision::Types;

also is gc-record;

has WWW::GCloud::R::Vision::BoundingPoly $.boundingPoly;
has WWW::GCloud::R::Vision::BoundingPoly $.fdBoundingPoly;
has WWW::GCloud::R::Vision::Landmark:D @.landmarks;
has Real $.rollAngle;
has Real $.panAngle;
has Real $.tiltAngle;
has Real $.detectionConfidence;
has Real $.landmarkingConfidence;
has GCVLikelihood $.joyLikelihood;
has GCVLikelihood $.sorrowLikelihood;
has GCVLikelihood $.angerLikelihood;
has GCVLikelihood $.surpriseLikelihood;
has GCVLikelihood $.underExposedLikelihood;
has GCVLikelihood $.blurredLikelihood;
has GCVLikelihood $.headwearLikelihood;