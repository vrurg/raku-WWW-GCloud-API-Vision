use v6.e.PREVIEW;
unit module WWW::GCloud::API::Vision::Types;

use Cro::Uri;
use WWW::GCloud::Record;

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

my role GCVLCoercer {
    my @str-repr = <UNKNOWN VERY_UNLIKELY UNLIKELY POSSIBLE LIKELY VERY_LIKELY>;
    my %repr-map = @str-repr.antipairs;

    multi method COERCE(Str:D $from) {
        nextsame unless %repr-map.EXISTS-KEY($from);
        self.^enum_from_value(%repr-map{$from});
    }

    method to-json(::?CLASS:D:) {
        @str-repr[self]
    }
}

enum GCVLikelihood does GCVLCoercer is export
    <GCVLUnknown GCVLVeryUnlikely GCVLUlikely GCVLPossible GCVLLikely GCVLVeryLikely>;

enum GCVBreakType is export (
    GCVBrkUnknown => "UNKNOW",
    GCVBrkSpace => "SPACE",
    GCVBrkSureSpace => "SURE_SPACE",
    GCVBrkEolSureSpace => "EOL_SURE_SPACE",
    GCVBrkHyphen => "HYPHEN",
    GCVBrkLineBreak => "LINE_BREAK",
);

enum GCVBlockType is export (
    GCVBlkUnknown => "UNKNOWN",
    GCVBlkText => "TEXT",
    GCVBlkTable => "TABLE",
    GCVBlkPicture => "PICTURE",
    GCVBlkRuler => "RULER",
    GCVBlkBarCode => "BARCODE",
);