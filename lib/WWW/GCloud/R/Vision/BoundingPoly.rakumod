use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/projects.locations.products.referenceImages#boundingpoly
unit class WWW::GCloud::R::Vision::BoundingPoly;

use WWW::GCloud::Record;
use WWW::GCloud::R::Vision::Vertex;
use WWW::GCloud::R::Vision::NormalizedVertex;

also is gc-record;

has WWW::GCloud::R::Vision::Vertex:D @.vertices;
has WWW::GCloud::R::Vision::NormalizedVertex:D @.normalizedVertices;