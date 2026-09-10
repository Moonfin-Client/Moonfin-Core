package org.moonfin.nativevideo

import kotlin.math.abs
import kotlin.math.roundToInt

/** A display mode reduced to the facts the choice turns on. */
internal data class DisplayModeOption(
    val modeId: Int,
    val width: Int,
    val height: Int,
    val refreshRate: Float,
)

/**
 * Picks the display mode to play a given frame rate on.
 *
 * Kept apart from the player so the decision can be exercised against real
 * television mode lists without an Android display.
 */
internal object DisplayModeChooser {
    private const val MIN_WIDTH = 1280
    private const val MIN_HEIGHT = 720

    private val STANDARD_RATES =
        floatArrayOf(23.976f, 24f, 25f, 29.97f, 30f, 50f, 59.94f, 60f)

    /** Snaps a rate a container states loosely onto the broadcast standard. */
    fun normalizeFrameRate(frameRate: Float): Float {
        var closest = frameRate
        var closestDelta = Float.MAX_VALUE
        for (candidate in STANDARD_RATES) {
            val delta = abs(candidate - frameRate)
            if (delta < closestDelta) {
                closest = candidate
                closestDelta = delta
            }
        }
        return if (closestDelta <= 0.08f) closest else frameRate
    }

    /**
     * Whether every content frame lands on a whole number of display frames.
     *
     * 60Hz is deliberately not a multiple of 23.976: the 2.5 ratio is what
     * produces 3:2 pulldown judder.
     */
    fun isRefreshRateMultiple(refreshRate: Float, contentFrameRate: Float): Boolean {
        if (!refreshRate.isFinite() || refreshRate <= 0f || contentFrameRate <= 0f) {
            return false
        }
        val ratio = refreshRate / contentFrameRate
        val rounded = ratio.roundToInt().toFloat()
        return rounded >= 1f && abs(ratio - rounded) <= 0.02f
    }

    /**
     * The best mode for [contentFrameRate], or null when the display has none.
     *
     * Only a whole multiple of the content rate qualifies. There is no closest
     * rate fallback on purpose, because moving a 60Hz screen to 50Hz for 24fps
     * content trades one cadence error for a worse one.
     *
     * With [allowResolutionChange] off the display stays at its current
     * resolution and the device scales the picture. With it on the mode may
     * also change resolution, never below the video's own, preferring the one
     * closest to the video so the television scales instead. That is what
     * reaches 24Hz on a 4K set that only offers it at 1080p.
     */
    fun choose(
        modes: List<DisplayModeOption>,
        currentMode: DisplayModeOption,
        contentFrameRate: Float,
        allowResolutionChange: Boolean,
        videoWidth: Int,
        videoHeight: Int,
    ): DisplayModeOption? {
        // Without known dimensions the distance below would rank the smallest
        // mode first, so resolution stops being a tiebreak until they arrive.
        val rankByResolution = allowResolutionChange && videoWidth > 0

        return modes
            .filter { mode ->
                val sameResolution = mode.width == currentMode.width &&
                    mode.height == currentMode.height
                val resolutionAllowed = sameResolution || (
                    allowResolutionChange &&
                        mode.width >= MIN_WIDTH && mode.height >= MIN_HEIGHT &&
                        mode.width >= videoWidth && mode.height >= videoHeight
                    )
                resolutionAllowed && isRefreshRateMultiple(mode.refreshRate, contentFrameRate)
            }
            .minWithOrNull(
                compareBy<DisplayModeOption> { abs(it.refreshRate - contentFrameRate) }
                    .thenBy { if (rankByResolution) abs(it.width - videoWidth) else 0 }
                    .thenByDescending { it.refreshRate },
            )
    }
}
