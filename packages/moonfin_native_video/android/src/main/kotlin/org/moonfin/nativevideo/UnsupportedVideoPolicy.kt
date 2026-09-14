package org.moonfin.nativevideo

/**
 * Whether the video has to be given up so playback can recover.
 *
 * Media3 hands a Dolby Vision AV1 track to a plain AV1 decoder, but for a full
 * range PQ one it offers no decoder at all. Nothing throws when that happens.
 * The track is left unselected, the video renderer never starts, and the audio
 * plays on over a black screen, so the selection is the only signal there is.
 *
 * Selection is also what keeps this quiet on video that is about to play. A
 * track that exceeds what its decoder claims still gets selected, and would
 * have read as unsupported.
 */
internal fun shouldReportUnsupportedVideo(
    mediaType: String,
    isPreview: Boolean,
    alreadyReported: Boolean,
    hasVideoTrack: Boolean,
    videoSelected: Boolean,
): Boolean =
    mediaType != "audio" &&
        !isPreview &&
        !alreadyReported &&
        hasVideoTrack &&
        !videoSelected
