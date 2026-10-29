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

    // 60 against 59.94 is 0.1% off, so this separates the 1000/1001 rates
    // from their integer siblings while still accepting a loosely stated rate.
    private const val EXACT_RATIO_TOLERANCE = 0.0005f

    // 25 and 29.97/30 fps content prefers a mode at twice its rate, so 29.97,
    // 59.94 and interlaced channels all share 59.94 and changing between them
    // never switches. Film keeps its own rate.
    private const val DOUBLE_RATE_MIN_FPS = 24.5f
    private const val DOUBLE_RATE_MAX_FPS = 30.5f

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
     * Whether [refreshRate] is a whole multiple in the content's own rate
     * family. 60Hz passes [isRefreshRateMultiple] for 29.97 content, but it
     * repeats a frame about every 17 seconds; 59.94Hz never does.
     */
    fun isExactRefreshRateMultiple(refreshRate: Float, contentFrameRate: Float): Boolean {
        if (!isRefreshRateMultiple(refreshRate, contentFrameRate)) return false
        val ratio = refreshRate / contentFrameRate
        val rounded = ratio.roundToInt().toFloat()
        return abs(ratio / rounded - 1f) <= EXACT_RATIO_TOLERANCE
    }

    /**
     * The best mode for [contentFrameRate], or null when the display has none.
     *
     * Only a whole multiple of the content rate qualifies. There is no closest
     * rate fallback on purpose, because moving a 60Hz screen to 50Hz for 24fps
     * content trades one cadence error for a worse one.
     *
     * A mode in the content's exact rate family beats a near one (59.94 over
     * 60 for 29.97), and 25 and 29.97/30 fps content prefers twice its rate
     * (59.94 for 29.97), so channels at 29.97, 59.94 and interlaced 29.97
     * share one mode. Film keeps its own rate. The [displayMode] in use stays
     * when it already fits exactly and, with resolution changes allowed, no
     * mode is closer to the video's resolution.
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
        displayMode: DisplayModeOption? = null,
    ): DisplayModeOption? {
        val currentResolutionMatches = { mode: DisplayModeOption ->
            mode.width == currentMode.width && mode.height == currentMode.height
        }
        val displayModeQualifies = displayMode?.let { mode ->
            val resolutionAllowed = if (allowResolutionChange && videoWidth > 0 && videoHeight > 0) {
                mode.width >= MIN_WIDTH && mode.height >= MIN_HEIGHT &&
                    mode.width >= videoWidth && mode.height >= videoHeight
            } else {
                currentResolutionMatches(mode)
            }
            resolutionAllowed && isRefreshRateMultiple(mode.refreshRate, contentFrameRate)
        } == true
        // Without known dimensions the distance below would rank the smallest
        // mode first, so resolution stops being a tiebreak until they arrive.
        val rankByResolution = allowResolutionChange && videoWidth > 0

        val candidates = modes.filter { mode ->
            val sameResolution = mode.width == currentMode.width &&
                mode.height == currentMode.height
            val resolutionAllowed = sameResolution || (
                allowResolutionChange &&
                    mode.width >= MIN_WIDTH && mode.height >= MIN_HEIGHT &&
                    mode.width >= videoWidth && mode.height >= videoHeight
                )
            resolutionAllowed && isRefreshRateMultiple(mode.refreshRate, contentFrameRate)
        }
        val exact = candidates.filter { isExactRefreshRateMultiple(it.refreshRate, contentFrameRate) }
        if (displayModeQualifies && displayMode != null) {
            // Scale on TV still moves to a mode nearer the video's resolution.
            val resolutionBest = !rankByResolution || exact.none {
                abs(it.width - videoWidth) < abs(displayMode.width - videoWidth)
            }
            // The mode already in use stays when it fits exactly, so there is
            // no switch and no hold. Without an exact mode anywhere, a near one
            // already in use is as good as any other near one.
            val fitsExactly = isExactRefreshRateMultiple(displayMode.refreshRate, contentFrameRate)
            if (resolutionBest && (fitsExactly || exact.isEmpty())) return displayMode
        }

        return exact.ifEmpty { candidates }
            .minWithOrNull(
                compareBy<DisplayModeOption> { multiplePreference(it.refreshRate, contentFrameRate) }
                    .thenBy { if (rankByResolution) abs(it.width - videoWidth) else 0 }
                    // Without the video's size there is no reason to change
                    // resolution, so the one the display is at wins.
                    .thenBy {
                        val atDisplayResolution = displayMode != null &&
                            it.width == displayMode.width && it.height == displayMode.height
                        if (rankByResolution || atDisplayResolution) 0 else 1
                    }
                    .thenBy { abs(it.refreshRate / contentFrameRate - (it.refreshRate / contentFrameRate).roundToInt()) }
                    .thenByDescending { it.refreshRate },
            )
    }

    /**
     * Whether a display at [refreshRate] already shows [contentFrameRate]
     * correctly, whatever its resolution: an exact multiple, or a near one when
     * [modes] offers nothing exact.
     */
    fun refreshRateFits(
        refreshRate: Float,
        contentFrameRate: Float,
        modes: List<DisplayModeOption>,
    ): Boolean {
        if (isExactRefreshRateMultiple(refreshRate, contentFrameRate)) return true
        return isRefreshRateMultiple(refreshRate, contentFrameRate) &&
            modes.none { isExactRefreshRateMultiple(it.refreshRate, contentFrameRate) }
    }

    /** Lower is better: twice the rate first for 25 and 29.97/30 fps, then the rate itself. */
    private fun multiplePreference(refreshRate: Float, contentFrameRate: Float): Int {
        val multiple = (refreshRate / contentFrameRate).roundToInt()
        return if (contentFrameRate in DOUBLE_RATE_MIN_FPS..DOUBLE_RATE_MAX_FPS) {
            when (multiple) {
                2 -> 0
                1 -> 1
                else -> multiple
            }
        } else {
            multiple
        }
    }
}
