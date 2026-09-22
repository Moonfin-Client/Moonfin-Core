package org.moonfin.nativevideo

import androidx.media3.common.PlaybackException

/**
 * Decides whether a decoder the platform took back is worth asking for again.
 *
 * Android hands codecs to whatever needs them, so a player left paused long
 * enough for the screensaver to want one comes back to a dead decoder.
 * Preparing the same source again is the one recovery, so all that is left to
 * decide is when to stop asking.
 *
 * The caller owns the player, so this stays a plain object a JVM test can drive.
 */
object DecoderReclaimPolicy {
    /**
     * Two asks. The first covers the ordinary case, where whatever took the
     * codec has since finished with it, and a device that still cannot hand one
     * back will not on another try.
     */
    const val MAX_RETRIES = 2

    /**
     * A reclaim can land as the view is going away, and [playerLive] is what
     * stops the recovery preparing a player nobody will watch.
     */
    fun shouldRetry(errorCode: Int, retriesSoFar: Int, playerLive: Boolean): Boolean =
        errorCode == PlaybackException.ERROR_CODE_DECODING_RESOURCES_RECLAIMED &&
            playerLive &&
            retriesSoFar < MAX_RETRIES
}
