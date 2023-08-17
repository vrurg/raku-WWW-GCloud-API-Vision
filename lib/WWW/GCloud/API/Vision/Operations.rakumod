use v6.e.PREVIEW;
unit class WWW::GCloud::API::Vision::Operations;

use WWW::GCloud::R::Vision::Operation;
use WWW::GCloud::R::Vision::Operations;
use WWW::GCloud::Resource;

also does WWW::GCloud::Resource;

proto method get(|) {*}
multi method get(::?CLASS:D: WWW::GCloud::R::Vision::Operation:D $op) {
    (my $api = $.api)
        .get( $api.method-url('operations/' ~ $op.shortname),
              headers => [
                    'x-goog-user-project' => $op.project,
              ],
              as => WWW::GCloud::R::Vision::Operation )
        .andthen({ .result.set-project($op.project) })
}
multi method get(::?CLASS:D: Str:D $project, Str:D $name) {
    (my $api = $.api)
        .get( $api.method-url('operations/' ~ $name),
              headers => [
                    'x-goog-user-project' => $project,
              ],
              as => WWW::GCloud::R::Vision::Operation )
        .andthen({ .result.set-project($project) })
}

method list(::?CLASS:D: Str:D $project) {
    $.api.paginate:
        "get", "operations",
        headers => [
            'x-goog-user-project' => $project,
        ],
        as => WWW::GCloud::R::Vision::Operations
}