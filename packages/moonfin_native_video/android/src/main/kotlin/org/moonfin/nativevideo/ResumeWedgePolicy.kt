package org.moonfin.nativevideo

/**
 * Decides whether a resume that fell straight back into buffering is stuck.
 *
 * Some Android TV devices, a Fire TV 4K among them, come back from a long
 * pause to a decoder or bitstream track that never starts again, and the
 * player sits buffering with the film already loaded. A seek in place only
 * flushes whatever is stuck. Preparing the source again at the same spot
 * builds the decoder and the audio track from scratch, which is how the same
 * title started fine in the first place.
 *
 * The caller owns the player, so this stays a plain object a JVM test can drive.
 */
object ResumeWedgePolicy {
    /**
     * How long a resume gets before its buffering counts as stuck. The catch
     * up a decoder does after a pause settles well inside it.
     */
    const val CHECK_DELAY_MS = 3_000L

    /** Loaded media past the playhead that rules out a network that ran dry. */
    const val RUNWAY_FLOOR_MS = 10_000L

    /**
     * Live sources are left alone because preparing one again can land on the
     * live edge rather than where the viewer was, and [playerLive] stops a
     * recovery preparing a player nobody will watch.
     */
    fun shouldReprepare(
        stillBuffering: Boolean,
        playWhenReady: Boolean,
        bufferedAheadMs: Long,
        isLiveSource: Boolean,
        playerLive: Boolean,
    ): Boolean =
        stillBuffering &&
            playWhenReady &&
            !isLiveSource &&
            playerLive &&
            bufferedAheadMs >= RUNWAY_FLOOR_MS
}
