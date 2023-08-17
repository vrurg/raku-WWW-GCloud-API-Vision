use v6.e.PREVIEW;
unit module WWW::GCloud::API::Vision::X;

use WWW::GCloud::X;

# AQ stands for annotation queue
class AQ::NoProject does WWW::GCloud::X::Core {
    method message {
        "Cannot start annotation queue: no project defined. Consider using .project() method to set it."
    }
}