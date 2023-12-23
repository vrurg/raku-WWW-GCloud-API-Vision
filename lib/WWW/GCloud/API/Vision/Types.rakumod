use v6.e.PREVIEW;
unit module WWW::GCloud::API::Vision::Types;

use Cro::Uri;
use JSON::Class:auth<zef:vrurg>;

# https://cloud.google.com/vision/docs/reference/rest/v1/Feature#type
# https://cloud.google.com/vision/docs/features-list
enum GCVFeatureType is export (
    GCVFUnspecified => "TYPE_UNSPECIFIED",
    GCVFFace => "FACE_DETECTION",
    GCVFLandmark => "LANDMARK_DETECTION",
    GCVFLogo => "LOGO_DETECTION",
    GCVFLabel => "LABEL_DETECTION",
    GCVFText => "TEXT_DETECTION",
    GCVFDocument => "DOCUMENT_TEXT_DETECTION",
    GCVFSafeSearch => "SAFE_SEARCH_DETECTION",
    GCVFImageProperties => "IMAGE_PROPERTIES",
    GCVFCropHints => "CROP_HINTS",
    GCVFWeb => "WEB_DETECTION",
    GCVFProduct => "PRODUCT_SEARCH",
    GCVFObjectLocalization => "OBJECT_LOCALIZATION",
);

enum GCVLikelihood is export ( GCVLUnknown => "UNKNOWN",
                               GCVLVeryUnlikely => "VERY_UNLIKELY",
                               GCVLUnlikely => "UNLIKELY",
                               GCVLPossible => "POSSIBLE",
                               GCVLLikely => "LIKELY",
                               GCVLVeryLikely => "VERY_LIKELY" );

enum GCVBreakType is export ( GCVBrkUnknown => "UNKNOW",
                              GCVBrkSpace => "SPACE",
                              GCVBrkSureSpace => "SURE_SPACE",
                              GCVBrkEolSureSpace => "EOL_SURE_SPACE",
                              GCVBrkHyphen => "HYPHEN",
                              GCVBrkLineBreak => "LINE_BREAK" );

enum GCVBlockType is export ( GCVBlkUnknown => "UNKNOWN",
                              GCVBlkText => "TEXT",
                              GCVBlkTable => "TABLE",
                              GCVBlkPicture => "PICTURE",
                              GCVBlkRuler => "RULER",
                              GCVBlkBarCode => "BARCODE" );