package org.moonfin.nativevideo

/**
 * Gives each video frame its own vsync.
 *
 * A file with bunched timestamps (frames in pairs a few milliseconds apart,
 * then a long gap) puts two frames on one vsync, and the second replaces the
 * first before it is shown: about a quarter of the frames on a 50Hz display.
 * Holding a frame back to one vsync after the previous release avoids that.
 *
 * A frame is held at most one vsync. Once frames have been held
 * [MAX_HELD_IN_A_ROW] times in a row the source is faster than the display, so
 * the next frame goes at its own time and the compositor drops the older one.
 * Otherwise a 60fps source on a 59.94Hz display would stay a vsync behind the
 * audio for good.
 */
internal class VsyncPacer {
    private var lastReleaseNs = NONE
    private var heldInARow = 0

    /** [releaseNs], or one vsync after the previous release when it would land on the same vsync. */
    fun pace(releaseNs: Long, vsyncNs: Long): Long {
        var result = releaseNs
        if (vsyncNs > 0L && lastReleaseNs != NONE && heldInARow < MAX_HELD_IN_A_ROW) {
            val earliest = lastReleaseNs + vsyncNs
            // Release times sit on a vsync grid that jitters slightly, so a
            // collision shows up as a delay of about one vsync and a frame
            // that already has its own vsync as a delay near zero.
            if (earliest - releaseNs in (vsyncNs / 2)..(vsyncNs * 3 / 2)) {
                result = earliest
            }
        }
        heldInARow = if (result != releaseNs) heldInARow + 1 else 0
        lastReleaseNs = result
        return result
    }

    companion object {
        const val MAX_HELD_IN_A_ROW = 6

        private const val NONE = Long.MIN_VALUE
    }
}
