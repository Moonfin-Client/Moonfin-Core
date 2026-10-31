package org.moonfin.nativevideo

import kotlin.math.abs

/** The evidence that supplied a selected display rate. */
internal enum class RateSource(val wireValue: String) {
    HEADER("header"),
    MEASURED("measured"),
    SERVER_REAL("serverReal"),
    SERVER_AVERAGE("serverAverage"),
    SERVER_HINT("serverHint"),
    NONE("none"),
}

/** Available evidence for a one-time display-rate decision. */
internal data class RateInputs(
    val serverRealFps: Float? = null,
    val serverAverageFps: Float? = null,
    val serverInterlaced: Boolean? = null,
    val header: StreamRateEvidence? = null,
    val measured: FrameCadence? = null,
    val legacyFps: Float? = null,
)

/** The chosen picture/display rate and whether trusted scan evidence doubled it. */
internal data class RateChoice(
    val fps: Float?,
    val source: RateSource,
    val fieldRateApplied: Boolean = false,
)

/** Selects a display rate from current-stream evidence without taking display actions. */
internal object DisplayRateDecision {
    const val MIN_FAST_INTERVALS = 12
    const val MIN_FULL_INTERVALS = 120

    private const val MIN_RATE_FPS = 1.0
    private const val MAX_RATE_FPS = 120.0
    private const val FIELD_RATE_TOLERANCE_FPS = 0.05
    private const val RATE_CHANGE_THRESHOLD = 0.01
    private const val SNAP_TOLERANCE = 0.01
    private val RATE_29_97 = 30_000.0 / 1001.0

    fun choose(inputs: RateInputs): RateChoice {
        // MPEG-2 sequence and picture headers state the rate directly, so they
        // outrank timestamps; measuring is for streams without usable headers.
        val header = inputs.header
            ?.takeIf { it.scanType != StreamScanType.UNKNOWN && isValidRate(it.frameRate.toDouble()) }
        if (header != null) {
            val pictureRate = header.frameRate.toDouble()
            val applyFieldRate = header.scanType.isFieldScanned() && isFieldRatePictureFps(pictureRate)
            return RateChoice(
                fps = (if (applyFieldRate) pictureRate * 2.0 else pictureRate).toFloat(),
                source = RateSource.HEADER,
                fieldRateApplied = applyFieldRate,
            )
        }

        val measured = inputs.measured
        val measuredFps = measuredRate(measured)
        if (measured != null && measuredFps != null && isUsable(measured, measuredFps)) {
            return RateChoice(measuredFps.toFloat(), RateSource.MEASURED)
        }

        validRate(inputs.serverRealFps)?.let { return RateChoice(it, RateSource.SERVER_REAL) }
        validRate(inputs.serverAverageFps)?.let { return RateChoice(it, RateSource.SERVER_AVERAGE) }
        validRate(inputs.legacyFps)?.let { return RateChoice(it, RateSource.SERVER_HINT) }
        return RateChoice(null, RateSource.NONE)
    }

    /** Diagnostic comparison only; callers must decide separately whether to act. */
    fun isRateChange(decided: RateChoice, reading: RateChoice): Boolean {
        val oldRate = decided.fps?.toDouble()?.takeIf(::isValidRate) ?: return false
        val newRate = reading.fps?.toDouble()?.takeIf(::isValidRate) ?: return false
        return abs(newRate - oldRate) / oldRate > RATE_CHANGE_THRESHOLD
    }

    private fun measuredRate(cadence: FrameCadence?): Double? {
        cadence ?: return null
        return when (cadence.kind) {
            FrameCadence.Kind.UNIFORM -> standardUniformRate(cadence)
            FrameCadence.Kind.GRID, FrameCadence.Kind.PULLDOWN_23 -> cadence.gridHz ?: return null
            FrameCadence.Kind.IRREGULAR -> return null
        }
    }

    /**
     * The standard rate a uniform cadence sits on. A window that spans a
     * programme change or holds a few odd intervals has a mean between rates,
     * while the dominant interval still lands on the grid. The snap follows
     * the grid and unit, never the nearest standard number, and applies only
     * when the dominant interval is within [SNAP_TOLERANCE] of that period.
     */
    private fun standardUniformRate(cadence: FrameCadence): Double {
        val grid = cadence.gridHz ?: return cadence.meanFps
        val unit = cadence.units.firstOrNull()?.first?.takeIf { it >= 1 } ?: return cadence.meanFps
        val snapped = grid / unit
        val periodUs = 1_000_000.0 / snapped
        val closeEnough = cadence.dominantIntervalUs > 0 &&
            abs(cadence.dominantIntervalUs - periodUs) / periodUs <= SNAP_TOLERANCE
        return if (closeEnough) snapped else cadence.meanFps
    }

    private fun isUsable(cadence: FrameCadence, fps: Double): Boolean {
        val grid = cadence.gridHz ?: return false
        if (!isValidRate(grid) || !isValidRate(fps)) return false
        return cadence.intervals >= MIN_FULL_INTERVALS ||
            (cadence.kind == FrameCadence.Kind.UNIFORM && cadence.intervals >= MIN_FAST_INTERVALS)
    }

    private fun isFieldRatePictureFps(fps: Double): Boolean =
        abs(fps - 25.0) <= FIELD_RATE_TOLERANCE_FPS ||
            abs(fps - RATE_29_97) <= FIELD_RATE_TOLERANCE_FPS

    private fun validRate(fps: Float?): Float? =
        fps?.takeIf { isValidRate(it.toDouble()) }

    private fun isValidRate(fps: Double): Boolean =
        fps.isFinite() && fps in MIN_RATE_FPS..MAX_RATE_FPS
}
