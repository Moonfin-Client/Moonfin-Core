# Embedded ASS fixture

`embedded-ass.mkv` contains four seconds of generated solid-color H.264 video
and an ASS track with invented text. It contains no commercial media, audio,
accounts, or personal metadata. The sign is red-orange and top-aligned; italic
yellow dialogue is bottom-aligned. Both styles specify a black outline.

The source ASS and matching renderer captures are linked from the pull request.
The video was generated with FFmpeg's `color` source at 320×180 and 24 fps, using
libx264 CRF 0. The ASS was muxed without conversion. The native test checks that
embedded ASS retains its own track header when external-header support changes.
