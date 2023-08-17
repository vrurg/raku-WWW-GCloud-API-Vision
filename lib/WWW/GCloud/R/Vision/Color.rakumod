use v6.e.PREVIEW;
# https://cloud.google.com/vision/docs/reference/rest/v1/AnnotateImageResponse#Color
unit class WWW::GCloud::R::Vision::Color;

use Color;
use WWW::GCloud::Record;
use WWW::GCloud::X;

also is gc-record;

has Real $.red;
has Real $.green;
has Real $.blue;
has Real $.alpha;

method Color {
    without $!red // $!green // $!blue // $!alpha {
        # TODO Replace with a dedicated exception
        self.die: "Cannot create a Color instance from a "
                    ~ ::?CLASS.^name
                    ~ " object because a color channel is undefined"
    }
    Color.new: rgbad => [ $!red, $!green, $!blue, $!alpha ]
}