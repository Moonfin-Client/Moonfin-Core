package org.moonfin.nativevideo

/**
 * Gives each video frame its own vsync.
 *
 * A file with bunched timestamps (frames in pairs a few milliseconds apart,
 * then a long gap) puts two frames on one vsync, and the second replaces the
 * first before it is shown: about a quarter of the frames on a 50Hz display.
 * Pushing a frame back to one vsync after the previous release avoids that.
 */
internal class VsyncPacer {
    private var lastReleaseNs = NONE

    /** [releaseNs], or one vsync after the previous release if that is a short push back. */
    fun pace(releaseNs: Long, vsyncNs: Long): Long {
        var result = releaseNs
        if (vsyncNs > 0L && lastReleaseNs != NONE) {
            val earliest = lastReleaseNs + vsyncNs
            val delayNs = earliest - releaseNs
            val maxDelayNs = minOf(MAX_DELAY_VSYNCS * vsyncNs, MAX_DELAY_NS)
            if (delayNs in 1L..maxDelayNs) {
                result = earliest
            }
        }
        lastReleaseNs = result
        return result
    }

    companion object {
        // Bounds the added latency so audio sync can't drift. A source faster
        // than the display exceeds it and releases its surplus frames unpaced.
        const val MAX_DELAY_VSYNCS = 2L

        // Keeps low refresh rates in check, where two vsyncs would be
        // noticeable (two 24Hz vsyncs are 83ms).
        const val MAX_DELAY_NS = 45_000_000L

        private const val NONE = Long.MIN_VALUE
    }
}
