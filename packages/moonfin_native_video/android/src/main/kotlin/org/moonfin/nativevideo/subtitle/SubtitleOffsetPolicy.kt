package org.moonfin.nativevideo.subtitle

// Kept free of Android and media3 imports so these run under plain JVM tests.

/** The furthest the user can push subtitles either way. */
internal const val MAX_MANUAL_SUBTITLE_DELAY_MS = 5000L

private const val MIME_MEDIA3_CUES = "application/x-media3-cues"

private val SHIFTED_TEXT_MIMES = setOf(
    MIME_MEDIA3_CUES,
    "application/pgs",
    "application/vobsub",
    "application/dvbsubs",
    "text/x-ssa",
    "application/x-subrip",
    "text/vtt",
    "application/x-mp4-vtt",
    "application/ttml+xml",
)

private val CLOSED_CAPTION_MIMES = setOf(
    "application/cea-608",
    "application/cea-708",
    "application/x-mp4-cea-608",
)

internal fun clampManualDelayMs(delayMs: Long): Long =
    delayMs.coerceIn(-MAX_MANUAL_SUBTITLE_DELAY_MS, MAX_MANUAL_SUBTITLE_DELAY_MS)

/**
 * Whether a track muxed into the content follows the subtitle delay.
 *
 * Closed captions stay put. They ride the video's own timeline already, and
 * the app lists them apart from subtitles. Their own mime types are not in
 * the shifted set, and a parsed cues track names the format it came from in
 * [codecs], which is how captions parsed during extraction are told apart.
 */
internal fun shiftsEmbeddedFormat(sampleMimeType: String?, codecs: String?): Boolean {
    val mime = sampleMimeType ?: return false
    if (mime == MIME_MEDIA3_CUES && codecs in CLOSED_CAPTION_MIMES) return false
    return mime in SHIFTED_TEXT_MIMES
}

internal enum class SourceTree {
    /** The player builds the source from the media item itself. */
    PLAYER_ITEM,

    /** The app builds the source so subtitle timing can be shifted. */
    CUSTOM_TREE,
}

/**
 * Which way a source is built. Live TV, previews and audio never get the
 * tree, so their playback is untouched by any of this. Video gets it when a
 * sideloaded subtitle exists, when the user has set a delay, or once it is in
 * place for this source, since taking it out again would mean a re-prepare
 * for nothing.
 */
internal fun sourceTreeFor(
    isLive: Boolean,
    isPreview: Boolean,
    mediaType: String,
    externalCount: Int,
    manualDelayMs: Long,
    hasEmbeddedWrapper: Boolean,
): SourceTree {
    if (isLive || isPreview || mediaType == "audio") return SourceTree.PLAYER_ITEM
    if (externalCount > 0 || manualDelayMs != 0L || hasEmbeddedWrapper) return SourceTree.CUSTOM_TREE
    return SourceTree.PLAYER_ITEM
}

/**
 * The merging period prefixes every child track id with the child's index,
 * so the id a sideloaded track was given comes back as "1:10000". Either
 * spelling is that track.
 */
internal fun externalFormatIdMatches(formatId: String?, targetId: String): Boolean =
    formatId != null && (formatId == targetId || formatId.endsWith(":$targetId"))

internal fun syncDelaysPayload(audioDelayMs: Long, subtitleDelayMs: Long): Map<String, Any> = mapOf(
    "event" to "syncDelays",
    "audioDelayMs" to audioDelayMs,
    "subtitleDelayMs" to subtitleDelayMs,
)
