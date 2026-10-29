package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class FrameCadenceTest {

    private fun uniform(fps: Double, n: Int = 120): LongArray {
        // Accumulate exact times and difference them, as a 90 kHz clock would.
        val times = LongArray(n + 1) { Math.round(it * 1_000_000.0 / fps) }
        return LongArray(n) { times[it + 1] - times[it] }
    }

    private fun repeatPattern(pattern: LongArray, n: Int = 120): LongArray =
        LongArray(n) { pattern[it % pattern.size] }

    @Test
    fun `steady 23_976 is uniform on its own grid`() {
        val cadence = FrameCadenceClassifier.classify(uniform(24_000.0 / 1001))
        assertEquals(FrameCadence.Kind.UNIFORM, cadence.kind)
        assertEquals(24_000.0 / 1001, cadence.gridHz!!, 1e-6)
        assertEquals(1, cadence.units[0].first)
        assertEquals(23.976, cadence.meanFps, 0.001)
    }

    @Test
    fun `steady 24 is told apart from 23_976`() {
        val cadence = FrameCadenceClassifier.classify(uniform(24.0))
        assertEquals(24.0, cadence.gridHz!!, 1e-6)
    }

    @Test
    fun `steady 29_97 and 59_94 land on their own grids`() {
        assertEquals(
            30_000.0 / 1001,
            FrameCadenceClassifier.classify(uniform(30_000.0 / 1001)).gridHz!!,
            1e-6,
        )
        val sixty = FrameCadenceClassifier.classify(uniform(60_000.0 / 1001))
        assertEquals(FrameCadence.Kind.UNIFORM, sixty.kind)
        assertEquals(60_000.0 / 1001, sixty.gridHz!!, 1e-6)
    }

    @Test
    fun `3-2 pulldown averages 23_976 but sits on the 59_94 grid`() {
        val cadence = FrameCadenceClassifier.classify(repeatPattern(longArrayOf(33_367, 50_050)))
        assertEquals(FrameCadence.Kind.PULLDOWN_23, cadence.kind)
        assertEquals(60_000.0 / 1001, cadence.gridHz!!, 1e-6)
        assertEquals(23.976, cadence.meanFps, 0.01)
    }

    @Test
    fun `millisecond-rounded pulldown, as in the Rounders MP4, still reads as pulldown`() {
        // Real 2:3 presentation times on the 59.94 grid, rounded to whole
        // milliseconds the way that file's remuxer wrote them.
        val field = 1_000_000.0 * 1001 / 60_000
        var fields = 0
        val times = LongArray(121) { index ->
            val roundedMs = Math.round(fields * field / 1000)
            fields += if (index % 2 == 0) 2 else 3
            roundedMs * 1000
        }
        val cadence = FrameCadenceClassifier.classify(LongArray(120) { times[it + 1] - times[it] })
        assertEquals(FrameCadence.Kind.PULLDOWN_23, cadence.kind)
        assertEquals(60_000.0 / 1001, cadence.gridHz!!, 1e-6)
    }

    @Test
    fun `per-GOP timestamps on a stale 29_97 duration read as a 29_97 grid with a long step`() {
        // Eleven frames 33.367 ms apart, then the next I-frame back on its
        // real time: 12 frames per 500.5 ms, the X-Files capture.
        val gop = LongArray(12) { if (it < 11) 33_367 else 500_500 - 11 * 33_367 }
        val cadence = FrameCadenceClassifier.classify(repeatPattern(gop))
        assertEquals(FrameCadence.Kind.GRID, cadence.kind)
        assertEquals(30_000.0 / 1001, cadence.gridHz!!, 1e-6)
        assertEquals(listOf(1, 4), cadence.units.map { it.first })
        assertEquals(23.976, cadence.meanFps, 0.01)
        assertEquals(33_367.0, cadence.dominantIntervalUs.toDouble(), 2.0)
    }

    @Test
    fun `timing on no standard grid is irregular`() {
        val cadence = FrameCadenceClassifier.classify(repeatPattern(longArrayOf(37_100, 44_900, 29_300)))
        assertEquals(FrameCadence.Kind.IRREGULAR, cadence.kind)
        assertNull(cadence.gridHz)
    }

    @Test
    fun `the observer restores presentation order from decode order`() {
        val observer = FrameCadenceObserver(reorderDepth = 4, windowIntervals = 60)
        val frame = 41_708L
        var report: FrameCadence? = null
        // I P B B P B B ... : each P is sent ahead of the two B-frames it precedes.
        var index = 0
        while (index < 200) {
            for (time in longArrayOf(index + 2L, index + 0L, index + 1L)) {
                report = observer.onFrame(time * frame) ?: report
            }
            index += 3
        }
        assertNotNull(report)
        assertEquals(FrameCadence.Kind.UNIFORM, report!!.kind)
        assertEquals(0, observer.discontinuities)
    }

    @Test
    fun `a steady stream reports once, then again on a change and on the heartbeat`() {
        val observer = FrameCadenceObserver(reorderDepth = 0, windowIntervals = 10, heartbeatUs = 1_000_000)
        var time = 0L
        fun feed(intervalUs: Long, frames: Int): List<FrameCadence> {
            val out = mutableListOf<FrameCadence>()
            repeat(frames) {
                time += intervalUs
                observer.onFrame(time)?.let(out::add)
            }
            return out
        }
        assertEquals(1, feed(41_708, 21).size)
        assertTrue(feed(41_708, 10).isEmpty())
        // Over a second of media time since the report: the heartbeat.
        assertEquals(1, feed(41_708, 10).size)
        val changed = feed(33_367, 10)
        assertEquals(1, changed.size)
        assertEquals(30_000.0 / 1001, changed[0].gridHz!!, 1e-6)
    }

    @Test
    fun `a jump is a discontinuity, not an interval`() {
        val observer = FrameCadenceObserver(reorderDepth = 0, windowIntervals = 10)
        var time = 0L
        repeat(5) { time += 41_708; assertNull(observer.onFrame(time)) }
        time += 10_000_000
        assertNull(observer.onFrame(time))
        assertEquals(1, observer.discontinuities)
        val reports = (1..10).mapNotNull { time += 41_708; observer.onFrame(time) }
        assertEquals(1, reports.size)
        assertEquals(FrameCadence.Kind.UNIFORM, reports[0].kind)
    }

    @Test
    fun `a reset reports the same cadence afresh`() {
        val observer = FrameCadenceObserver(reorderDepth = 0, windowIntervals = 10)
        var time = 0L
        fun steady() = (1..11).mapNotNull { time += 41_708; observer.onFrame(time) }
        assertEquals(1, steady().size)
        observer.reset()
        assertEquals(1, steady().size)
    }

    @Test
    fun `twelve uniform 29_97 intervals report early once per reset`() {
        val observer = FrameCadenceObserver(reorderDepth = 0)
        var time = 0L
        val first = (0..FrameCadenceObserver.DEFAULT_FAST_INTERVALS).mapNotNull {
            observer.onFrame(time).also { time += 33_367 }
        }
        assertEquals(1, first.size)
        assertEquals(12, first.single().intervals)
        assertEquals(FrameCadence.Kind.UNIFORM, first.single().kind)
        assertEquals(30_000.0 / 1001, first.single().gridHz!!, 1e-6)

        val steadyWindow = (1..FrameCadenceObserver.DEFAULT_WINDOW_INTERVALS)
            .mapNotNull { observer.onFrame(time).also { time += 33_367 } }
        assertTrue(steadyWindow.isEmpty())

        observer.reset()
        time = 0L
        val afterReset = (0..FrameCadenceObserver.DEFAULT_FAST_INTERVALS).mapNotNull {
            observer.onFrame(time).also { time += 33_367 }
        }
        assertEquals(1, afterReset.size)
        assertEquals(12, afterReset.single().intervals)
    }

    @Test
    fun `fast threshold equal to window uses successive full windows`() {
        val observer = FrameCadenceObserver(
            reorderDepth = 0,
            windowIntervals = 12,
            fastIntervals = 12,
        )
        var time = 0L
        val reports = mutableListOf<FrameCadence>()
        observer.onFrame(time)
        for (fps in doubleArrayOf(30_000.0 / 1001, 24_000.0 / 1001, 25.0)) {
            val intervalUs = (1_000_000.0 / fps).toLong()
            repeat(12) {
                time += intervalUs
                observer.onFrame(time)?.let(reports::add)
            }
        }

        assertEquals(3, reports.size)
        assertEquals(30_000.0 / 1001, reports[0].gridHz!!, 1e-6)
        assertEquals(24_000.0 / 1001, reports[1].gridHz!!, 1e-6)
        assertEquals(25.0, reports[2].gridHz!!, 1e-6)
        assertTrue(reports.all { it.intervals == 12 })
    }

    @Test
    fun `fast report waits for sixteen reordered frames plus twelve intervals`() {
        val observer = FrameCadenceObserver(reorderDepth = 16)
        var time = 0L
        val reports = mutableListOf<FrameCadence>()
        repeat(28) {
            observer.onFrame(time).also { time += 33_367 }?.let(reports::add)
        }
        assertTrue(reports.isEmpty())
        observer.onFrame(time)?.let(reports::add)
        assertEquals(1, reports.size)
        assertEquals(12, reports.single().intervals)
    }

    @Test
    fun `mixed intervals do not use the fast uniform report`() {
        val observer = FrameCadenceObserver(reorderDepth = 0)
        var time = 0L
        val reports = (0..FrameCadenceObserver.DEFAULT_FAST_INTERVALS).mapNotNull {
            val report = observer.onFrame(time)
            time += if (it % 2 == 0) 33_367 else 50_050
            report
        }
        assertTrue(reports.isEmpty())
    }

    @Test
    fun `fast interval collection starts over after a discontinuity`() {
        val observer = FrameCadenceObserver(reorderDepth = 0)
        var time = 0L
        repeat(8) {
            observer.onFrame(time)
            time += 33_367
        }
        time += 10_000_000
        assertNull(observer.onFrame(time))
        time += 33_367
        val reports = (0..FrameCadenceObserver.DEFAULT_FAST_INTERVALS).mapNotNull {
            observer.onFrame(time).also { time += 33_367 }
        }
        assertEquals(1, reports.size)
        assertEquals(12, reports.single().intervals)
    }

    @Test
    fun `variable timing on one grid reports once, not every window`() {
        val observer = FrameCadenceObserver(reorderDepth = 0, windowIntervals = 12)
        // Video and film mixed on the 59.94 grid, the mix shifting each window.
        val field = 1_000_000.0 * 1001 / 60_000
        val mixes = listOf(intArrayOf(1, 1, 2, 2, 4), intArrayOf(2, 2, 2, 4, 1), intArrayOf(1, 1, 1, 2, 1))
        var fields = 0L
        var reports = 0
        repeat(40) { window ->
            repeat(12) { frame ->
                fields += mixes[window % mixes.size][frame % 5]
                if (observer.onFrame(Math.round(fields * field)) != null) reports++
            }
        }
        assertEquals(1, reports)
    }

    @Test
    fun `stages agree on variable timing that shares a grid`() {
        val field = 1_000_000.0 * 1001 / 60_000
        fun on(units: IntArray) = FrameCadenceClassifier.classify(
            LongArray(120) { Math.round(units[it % units.size] * field) },
        )
        val demux = on(intArrayOf(1, 1, 2, 4))
        val output = on(intArrayOf(2, 2, 1, 4, 2))
        assertEquals(FrameCadence.Kind.GRID, demux.kind)
        assertTrue(FrameTimingProbe.matches(demux, output))
    }

    @Test
    fun `readings agree on the same rate and differ on a rewritten one`() {
        val input = FrameCadenceClassifier.classify(uniform(24_000.0 / 1001))
        val stale = FrameCadenceClassifier.classify(
            repeatPattern(LongArray(12) { if (it < 11) 33_367 else 500_500 - 11 * 33_367 }),
        )
        assertTrue(FrameTimingProbe.matches(input, FrameCadenceClassifier.classify(uniform(24_000.0 / 1001))))
        assertFalse(FrameTimingProbe.matches(input, stale))
    }

    @Test
    fun `seek reset accepts the current source while source reset rejects its old token`() {
        val probe = FrameTimingProbe { }
        val cadence = FrameCadenceClassifier.classify(uniform(30_000.0 / 1001))
        val report = CadenceReport(
            cadence = cadence,
            sampleMimeType = "video/mpeg2",
            formatFrameRate = 30_000f / 1001,
            lastTimestampUs = 1_001_000,
            discontinuities = 0,
        )
        val oldGeneration = probe.generationToken
        probe.onDemuxReport(report, oldGeneration)
        assertNotNull(probe.latest(FrameTimingStage.DEMUX))

        probe.resetForDiscontinuity()
        assertNull(probe.latest(FrameTimingStage.DEMUX))
        assertEquals(oldGeneration, probe.generationToken)
        probe.onDemuxReport(report, oldGeneration)
        assertNotNull(probe.latest(FrameTimingStage.DEMUX))

        probe.reset()
        assertNull(probe.latest(FrameTimingStage.DEMUX))
        assertTrue(probe.generationToken != oldGeneration)
        probe.onDemuxReport(report, oldGeneration)
        assertNull(probe.latest(FrameTimingStage.DEMUX))
        probe.onDemuxReport(report, probe.generationToken)
        assertNotNull(probe.latest(FrameTimingStage.DEMUX))
    }
}
