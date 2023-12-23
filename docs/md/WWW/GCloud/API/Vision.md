# NAME

`WWW::GCloud::API::Vision` - `WWW::GCloud` implementation of [Google Vision API](https://cloud.google.com/vision/docs/reference/rest)

# SYNOPSIS

``` raku
use v6.e.PREVIEW;
use WWW::GCloud;
use WWW::GCloud::API::Vision;
use WWW::GCloud::API::Vision::Types;

my $gcloud = WWW::GCloud.new;
my $images = $gcloud.vision.images;

my $queue = $images.annotation-queue;
given $queue {
    .project("my-project-id");
    # Create a new request to OCR-annotate an image. Subsequent calls to .request will queue new requests.
    .request(
        :file("my-image.ext"), # Can be a PNG, TIFF, GIF.
        feature => ( :type(GCVFDocument), :model<builtin/latest> ),
        # If several features to be added at once:
        # features => [...],
        -> $request {
            # Here we can do things with the request object itself.
            $request.feature(GCVFLogo); # Also search the image for logos.
            # If there is something special about the input config...
            # $request.set-input-config(...);

            # If the image is a multi-page one. .pages is an Array[UInt:D] attribute.
            # $request.pages = 1,3;
        }
    );
}

await $queue
        .start
        .andthen({
            say "Annotate completed."
            # .result is an instance of WWW::GCloud::R::Vision::BatchAnnotateImagesResponse
        });
```

# DESCRIPTION

This module lacks complete documentation due to me not currently able to write it. Please, see some notes for [`WWW::GCloud`](https://raku.land/zef:vrurg/WWW::GCloud) framework. And look into *exmaples/* where I tried to provide meaningful code to follow.

## Status

This module is pre-beta, pre-anything. It is incomplete and likely not well thought out at places. But it already lets you do a lot with your storages.

If there is anything you need but it is missing then, please, consider implementing it and submitting a PR. Any other approach would barely proces any outcome for what I do apologize\!

Either way, this module can be used as a reference implementation for a `WWW::GGCloud` API.

Do not hesitate to get in touch with me would you need any help. I know it could be annoying when a complex module has little to none docs. I'll do my best to fix the situation. But until then feel free to open an issue in the [GitHub repository](https://github.com/vrurg/raku-WWW-GCloud-API-Vision/issues), even if it's just a question.

# COPYRIGHT

(c) 2023, Vadim Belman <vrurg@cpan.org>

# LICENSE

Artistic License 2.0

See the [*LICENSE*](../../../../../LICENSE) file in this distribution.
