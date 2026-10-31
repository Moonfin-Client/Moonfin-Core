package org.moonfin.nativevideo

import java.util.PriorityQueue
import kotlin.math.abs
import kotlin.math.roundToLong

/**
 * The presentation timing of a run of video frames, as the frames' own
 * timestamps describe it.
 *
 * A container's frame rate is a sample count over a duration, so a 3:2
 * pulldown transfer whose frames alternate 33 and 50 ms apart reads as
 * 23.976 while only a 59.94 Hz display shows every frame for a whole number
 * of refreshes. This keeps the timing itself: the coarsest standard refresh
 * grid every interval lands on, and how many refreshes each interval spans.
 */
internal data class FrameCadence(
    val kind: Kind,
    val meanFps: Double,
    /** The coarsest standard refresh rate every interval is a multiple of, null when none fits. */
    val gridHz: Double?,
    /** Interval lengths in [gridHz] refreshes, with how often each occurred, most common first. */
    val units: List<Pair<Int, Int>>,
    val dominantIntervalUs: Long,
    val dominantShare: Double,
    val intervals: Int,
) {
    enum class Kind(val wireValue: String) {
        /** One interval length throughout. */
        UNIFORM("uniform"),

        /** Alternating two and three refreshes, film on a 59.94 or 60 Hz grid. */
        PULLDOWN_23("pulldown23"),

        /** Several interval lengths that all sit on one refresh grid. */
        GRID("grid"),

        /** No standard refresh grid fits. */
        IRREGULAR("irregular"),
    }

    /**
     * Whether [other] describes the same timing, so reporting it again would
     * say nothing new. Variable timing on one grid (a LaserDisc transfer that
     * mixes video and film, say) shifts its mix of intervals from window to
     * window; only a change of kind or grid is news there.
     */
    fun sameShapeAs(other: FrameCadence?): Boolean {
        if (other == null || kind != other.kind || gridHz != other.gridHz) return false
        return when (kind) {
            Kind.UNIFORM, Kind.PULLDOWN_23 -> abs(meanFps - other.meanFps) < SAME_RATE_FPS
            Kind.GRID, Kind.IRREGULAR -> true
        }
    }

    fun unitsText(): String = units.joinToString(",") { "${it.first}x${it.second}" }

    private companion object {
        const val SAME_RATE_FPS = 0.05
    }
}

internal object FrameCadenceClassifier {
    /** Ascending, with each 1000/1001 rate right before its integer sibling. */
    private val GRIDS_HZ = doubleArrayOf(
        24_000.0 / 1001, 24.0, 25.0, 30_000.0 / 1001, 30.0,
        48_000.0 / 1001, 48.0, 50.0, 60_000.0 / 1001, 60.0,
        120_000.0 / 1001, 120.0,
    )

    // Timestamps rounded to whole milliseconds, as some remuxers write them,
    // miss a 59.94 Hz grid by up to about 0.7 ms per interval.
    private const val MAX_MEAN_ERROR_US = 600.0
    private const val MAX_ERROR_US = 1_500L
    private const val SIBLING_MATCH_TOLERANCE = 3e-4
    private const val DOMINANT_BIN_US = 500L
    private const val UNIFORM_SHARE = 0.95
    private const val PULLDOWN_MINOR_SHARE = 0.2

    fun classify(intervalsUs: LongArray): FrameCadence {
        require(intervalsUs.isNotEmpty()) { "No intervals to classify" }
        val n = intervalsUs.size
        val meanFps = n * 1_000_000.0 / intervalsUs.sum()

        val bins = intervalsUs.groupBy { (it + DOMINANT_BIN_US / 2) / DOMINANT_BIN_US }
        val dominant = bins.values.maxBy { it.size }
        val dominantUs = dominant.average().roundToLong()
        val dominantShare = dominant.size.toDouble() / n

        val gridHz = bestGrid(intervalsUs)
            ?: return FrameCadence(
                FrameCadence.Kind.IRREGULAR, meanFps, null, emptyList(),
                dominantUs, dominantShare, n,
            )
        val periodUs = 1_000_000.0 / gridHz
        val units = intervalsUs
            .asList()
            .groupingBy { Math.round(it / periodUs).toInt() }
            .eachCount()
            .entries
            .sortedWith(compareByDescending<Map.Entry<Int, Int>> { it.value }.thenBy { it.key })
            .map { it.key to it.value }

        val kind = when {
            units[0].second >= n * UNIFORM_SHARE -> FrameCadence.Kind.UNIFORM
            isPulldown(units, n) -> FrameCadence.Kind.PULLDOWN_23
            else -> FrameCadence.Kind.GRID
        }
        return FrameCadence(kind, meanFps, gridHz, units, dominantUs, dominantShare, n)
    }

    private fun isPulldown(units: List<Pair<Int, Int>>, n: Int): Boolean {
        if (units.size < 2) return false
        val (first, second) = units[0] to units[1]
        return setOf(first.first, second.first) == setOf(2, 3) &&
            second.second >= n * PULLDOWN_MINOR_SHARE &&
            first.second + second.second >= n * UNIFORM_SHARE
    }

    /** Whether the two rates are a 1000/1001 rate and its integer sibling, in either order. */
    fun areSiblings(aHz: Double, bHz: Double): Boolean {
        for (index in GRIDS_HZ.indices) {
            val sibling = siblingOf(index) ?: continue
            val low = GRIDS_HZ[index]
            if ((nearRate(aHz, low) && nearRate(bHz, sibling)) ||
                (nearRate(aHz, sibling) && nearRate(bHz, low))
            ) {
                return true
            }
        }
        return false
    }

    private fun nearRate(hz: Double, grid: Double): Boolean =
        hz.isFinite() && abs(hz - grid) / grid <= SIBLING_MATCH_TOLERANCE

    /** The integer sibling of the 1000/1001 grid at [index], or null if it has none. */
    private fun siblingOf(index: Int): Double? {
        val sibling = GRIDS_HZ.getOrNull(index + 1) ?: return null
        return sibling.takeIf { abs(it / GRIDS_HZ[index] - 1.001) < 1e-4 }
    }

    private fun bestGrid(intervalsUs: LongArray): Double? {
        for (index in GRIDS_HZ.indices) {
            if (meanError(intervalsUs, GRIDS_HZ[index]) == null) continue
            // 24 fps content also lands within a few dozen microseconds of
            // the 23.976 grid each interval, so tell the siblings apart by how
            // far each drifts over the whole run. Rounded timestamps can't
            // fake that, since their rounding errors cancel out.
            val sibling = siblingOf(index)
            if (sibling != null &&
                meanError(intervalsUs, sibling) != null &&
                drift(intervalsUs, sibling) < drift(intervalsUs, GRIDS_HZ[index])
            ) {
                return sibling
            }
            return GRIDS_HZ[index]
        }
        return null
    }

    /** How far the run's total length is from the same intervals laid exactly on the [hz] grid. */
    private fun drift(intervalsUs: LongArray, hz: Double): Double {
        val periodUs = 1_000_000.0 / hz
        var units = 0L
        for (interval in intervalsUs) units += Math.round(interval / periodUs)
        return abs(intervalsUs.sum() - units * periodUs)
    }

    private fun meanError(intervalsUs: LongArray, hz: Double): Double? {
        val periodUs = 1_000_000.0 / hz
        var total = 0.0
        for (interval in intervalsUs) {
            val units = Math.round(interval / periodUs)
            if (units < 1) return null
            val error = abs(interval - units * periodUs)
            if (error > MAX_ERROR_US) return null
            total += error
        }
        val mean = total / intervalsUs.size
        return if (mean <= MAX_MEAN_ERROR_US) mean else null
    }
}

/**
 * Turns a stream of frame timestamps into occasional [FrameCadence] reports:
 * one when the timing first settles, one whenever it changes, and a heartbeat
 * every [heartbeatUs] of media time so a long steady stretch still shows up.
 * Media time rather than windows, because a demuxer can read minutes ahead in
 * a second.
 *
 * Demuxers hand frames over in decode order, so [reorderDepth] holds that
 * many back and releases the earliest, which restores presentation order for
 * any stream whose reordering is shallower than that. A backwards or very long
 * step is a discontinuity: the window starts over without reporting.
 *
 * Not thread-safe; each stage owns one and feeds it from a single thread.
 */
internal class FrameCadenceObserver(
    private val reorderDepth: Int,
    private val windowIntervals: Int = DEFAULT_WINDOW_INTERVALS,
    private val heartbeatUs: Long = DEFAULT_HEARTBEAT_US,
    private val fastIntervals: Int = DEFAULT_FAST_INTERVALS,
) {
    private val pending = PriorityQueue<Long>()
    private val intervals = LongArray(windowIntervals)
    private var count = 0
    private var previousUs = NONE
    private var lastReported: FrameCadence? = null
    private var lastReportedAtUs = NONE
    private var fastAttempted = false

    init {
        require(reorderDepth >= 0) { "reorderDepth must not be negative" }
        require(windowIntervals > 0) { "windowIntervals must be positive" }
        require(fastIntervals > 0) { "fastIntervals must be positive" }
    }

    var discontinuities = 0
        private set

    /** The latest timestamp in presentation order, or [NONE] before the first. */
    var lastTimestampUs = NONE
        private set

    /** Feeds one frame; returns a cadence worth reporting, or null. */
    fun onFrame(timeUs: Long): FrameCadence? {
        if (reorderDepth <= 0) return accept(timeUs)
        pending.add(timeUs)
        if (pending.size <= reorderDepth) return null
        return accept(pending.poll()!!)
    }

    /** Forgets everything, so the next settled cadence is reported afresh (a seek or new source). */
    fun reset() {
        pending.clear()
        count = 0
        previousUs = NONE
        lastReported = null
        lastReportedAtUs = NONE
        lastTimestampUs = NONE
        discontinuities = 0
        fastAttempted = false
    }

    private fun accept(timeUs: Long): FrameCadence? {
        val previous = previousUs
        previousUs = timeUs
        lastTimestampUs = timeUs
        if (previous == NONE) return null
        val interval = timeUs - previous
        if (interval <= 0L || interval > MAX_INTERVAL_US) {
            discontinuities++
            count = 0
            return null
        }
        intervals[count++] = interval

        // A short custom window retains its full-window behavior instead of
        // treating that window as an early fast sample or overflowing it.
        if (!fastAttempted && fastIntervals < windowIntervals && count >= fastIntervals) {
            fastAttempted = true
            val initial = intervals.copyOf(fastIntervals)
            val mean = initial.average()
            if (initial.all { abs(it - mean) <= FAST_UNIFORM_TOLERANCE_US }) {
                val cadence = FrameCadenceClassifier.classify(initial)
                if (cadence.kind == FrameCadence.Kind.UNIFORM) {
                    lastReported = cadence
                    lastReportedAtUs = timeUs
                    return cadence
                }
            }
        }
        if (count < windowIntervals) return null
        count = 0

        val cadence = FrameCadenceClassifier.classify(intervals)
        // A backwards jump (a seek the extractor wasn't told about) restarts
        // the heartbeat rather than silencing it.
        val sinceReportUs = timeUs - lastReportedAtUs
        // Consumers may defer close-rate decisions until a full window. The
        // first full report upgrades the early reading even if its shape is unchanged.
        val upgradesFastReport = lastReported?.intervals?.let { it < windowIntervals } == true
        if (!upgradesFastReport && cadence.sameShapeAs(lastReported) && lastReportedAtUs != NONE &&
            sinceReportUs in 0 until heartbeatUs
        ) {
            return null
        }
        lastReported = cadence
        lastReportedAtUs = timeUs
        return cadence
    }

    companion object {
        const val NONE = Long.MIN_VALUE

        /** About five seconds at 24 fps, two at 60. */
        const val DEFAULT_WINDOW_INTERVALS = 120
        const val DEFAULT_FAST_INTERVALS = 12
        const val DEFAULT_HEARTBEAT_US = 60_000_000L
        // Whole-millisecond timestamps, as some IPTV origins write them, put
        // each interval up to about 0.7 ms off the true one (33 and 34 ms for
        // 30 fps), so the early reading has to allow that much.
        const val FAST_UNIFORM_TOLERANCE_US = 750.0

        /** Longer than any real frame interval, shorter than a seek or splice usually jumps. */
        const val MAX_INTERVAL_US = 500_000L
    }
}
