package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class DisplayRateDecisionTest {

    @Test
    fun `Rush-style mixed 59_94 grid beats the misleading server average`() {
        // Rush's observed presentation deltas use one, two and four steps on
        // the 59.94 grid; 90 kHz intervals below reflect those measured bins.
        val rushIntervals90Khz = longArrayOf(1501, 1502, 1501, 1502, 3003, 3003, 6006)
        val intervals = LongArray(120) { rushIntervals90Khz[it % rushIntervals90Khz.size] * 1_000_000 / 90_000 }
        val cadence = FrameCadenceClassifier.classify(intervals)

        assertEquals(FrameCadence.Kind.GRID, cadence.kind)
        assertEquals(60_000.0 / 1001, cadence.gridHz!!, 1e-6)
        val choice = DisplayRateDecision.choose(
            RateInputs(
                serverAverageFps = 41.947f,
                measured = cadence,
            ),
        )

        assertEquals(60_000f / 1001f, choice.fps!!, 1e-4f)
        assertEquals(RateSource.MEASURED, choice.source)
        assertFalse(choice.fieldRateApplied)
    }

    @Test
    fun `current progressive header overrides a stale live server hint`() {
        val choice = DisplayRateDecision.choose(
            RateInputs(
                serverRealFps = 23.976f,
                header = StreamRateEvidence(29.97f, StreamScanType.PROGRESSIVE),
            ),
        )

        assertEquals(29.97f, choice.fps!!, 0.001f)
        assertEquals(RateSource.HEADER, choice.source)
        assertFalse(choice.fieldRateApplied)
    }

    @Test
    fun `interlaced header chooses field rate for 29_97 pictures`() {
        val choice = DisplayRateDecision.choose(
            RateInputs(header = StreamRateEvidence(30_000f / 1001f, StreamScanType.INTERLACED)),
        )

        assertEquals(60_000f / 1001f, choice.fps!!, 0.001f)
        assertEquals(RateSource.HEADER, choice.source)
        assertTrue(choice.fieldRateApplied)
    }

    @Test
    fun `repeated fields header doubles 25 picture rate`() {
        val choice = DisplayRateDecision.choose(
            RateInputs(header = StreamRateEvidence(25f, StreamScanType.REPEATED_FIELDS)),
        )

        assertEquals(50f, choice.fps!!, 0f)
        assertTrue(choice.fieldRateApplied)
    }

    @Test
    fun `interlaced 30 picture rate uses 60 field rate`() {
        val choice = DisplayRateDecision.choose(
            RateInputs(header = StreamRateEvidence(30f, StreamScanType.INTERLACED)),
        )

        assertEquals(60f, choice.fps!!, 0f)
        assertTrue(choice.fieldRateApplied)
    }

    @Test
    fun `field-rate rule does not double 50 or 59_94 picture rates`() {
        listOf(50f, 60_000f / 1001f).forEach { pictureRate ->
            val choice = DisplayRateDecision.choose(
                RateInputs(header = StreamRateEvidence(pictureRate, StreamScanType.INTERLACED)),
            )

            assertEquals(pictureRate, choice.fps!!, 0f)
            assertFalse(choice.fieldRateApplied)
        }
    }

    @Test
    fun `interlaced header outranks a matching uniform measured cadence`() {
        val choice = DisplayRateDecision.choose(
            RateInputs(
                header = StreamRateEvidence(29.97f, StreamScanType.INTERLACED),
                measured = uniformCadence(30_000.0 / 1001.0),
            ),
        )

        assertEquals(60_000f / 1001f, choice.fps!!, 0.001f)
        assertEquals(RateSource.HEADER, choice.source)
        assertTrue(choice.fieldRateApplied)
    }

    @Test
    fun `server interlace flag alone never doubles a measured rate`() {
        val serverOnly = DisplayRateDecision.choose(
            RateInputs(
                serverInterlaced = true,
                measured = uniformCadence(25.0),
            ),
        )

        assertEquals(25f, serverOnly.fps!!, 0.001f)
        assertEquals(RateSource.MEASURED, serverOnly.source)
        assertFalse(serverOnly.fieldRateApplied)
    }

    @Test
    fun `header wins over a disagreeing measured cadence`() {
        val choice = DisplayRateDecision.choose(
            RateInputs(
                header = StreamRateEvidence(24_000f / 1001f, StreamScanType.PROGRESSIVE),
                measured = uniformCadence(30_000.0 / 1001.0),
            ),
        )

        assertEquals(24_000f / 1001f, choice.fps!!, 0.001f)
        assertEquals(RateSource.HEADER, choice.source)
        assertFalse(choice.fieldRateApplied)
    }

    @Test
    fun `stray one-unit intervals do not override interlaced 29_97 header evidence`() {
        val cadence = strayIntervalCadence()
        val header = StreamRateEvidence(30_000f / 1001f, StreamScanType.INTERLACED)

        val withHeader = DisplayRateDecision.choose(RateInputs(header = header, measured = cadence))
        val decided = DisplayRateDecision.choose(RateInputs(header = header))

        assertEquals(60_000f / 1001f, withHeader.fps!!, 0.001f)
        assertEquals(RateSource.HEADER, withHeader.source)
        assertTrue(withHeader.fieldRateApplied)
        assertFalse(DisplayRateDecision.isRateChange(decided, withHeader))
    }

    @Test
    fun `the same stray-interval cadence without a header snaps to 29_97 by its dominant interval`() {
        val choice = DisplayRateDecision.choose(RateInputs(measured = strayIntervalCadence()))

        assertEquals(30_000f / 1001f, choice.fps!!, 0.001f)
        assertEquals(RateSource.MEASURED, choice.source)
    }

    @Test
    fun `a programme change in header evidence from 29_97 interlaced to 23_976 progressive is a rate change`() {
        val before = DisplayRateDecision.choose(
            RateInputs(header = StreamRateEvidence(30_000f / 1001f, StreamScanType.INTERLACED)),
        )
        val after = DisplayRateDecision.choose(
            RateInputs(header = StreamRateEvidence(24_000f / 1001f, StreamScanType.PROGRESSIVE)),
        )

        assertEquals(24_000f / 1001f, after.fps!!, 0.001f)
        assertEquals(RateSource.HEADER, after.source)
        assertTrue(DisplayRateDecision.isRateChange(before, after))
    }

    @Test
    fun `interlaced and repeated fields at 29_97 choose the same rate`() {
        val interlaced = DisplayRateDecision.choose(
            RateInputs(header = StreamRateEvidence(30_000f / 1001f, StreamScanType.INTERLACED)),
        )
        val repeated = DisplayRateDecision.choose(
            RateInputs(header = StreamRateEvidence(30_000f / 1001f, StreamScanType.REPEATED_FIELDS)),
        )

        assertFalse(DisplayRateDecision.isRateChange(interlaced, repeated))
    }

    @Test
    fun `unknown header scan type is not evidence`() {
        val choice = DisplayRateDecision.choose(
            RateInputs(
                serverRealFps = 23.976f,
                header = StreamRateEvidence(29.97f, StreamScanType.UNKNOWN),
            ),
        )

        assertEquals(23.976f, choice.fps!!, 0.001f)
        assertEquals(RateSource.SERVER_REAL, choice.source)
    }

    @Test
    fun `pulldown measurements without a header never double`() {
        val pulldown = FrameCadenceClassifier.classify(
            LongArray(120) { if (it % 2 == 0) 33_367L else 50_050L },
        )
        val choice = DisplayRateDecision.choose(RateInputs(measured = pulldown))

        assertEquals(FrameCadence.Kind.PULLDOWN_23, pulldown.kind)
        assertEquals(60_000f / 1001f, choice.fps!!, 0.001f)
        assertFalse(choice.fieldRateApplied)
    }

    @Test
    fun `weak uniform and irregular measurements fall back to header evidence`() {
        val weak = uniformCadence(30_000.0 / 1001.0, intervals = 11)
        val irregular = FrameCadenceClassifier.classify(
            LongArray(120) { longArrayOf(37_100L, 44_900L, 29_300L)[it % 3] },
        )
        val header = StreamRateEvidence(25f, StreamScanType.PROGRESSIVE)

        assertEquals(
            RateSource.HEADER,
            DisplayRateDecision.choose(RateInputs(header = header, measured = weak)).source,
        )
        assertEquals(
            RateSource.HEADER,
            DisplayRateDecision.choose(RateInputs(header = header, measured = irregular)).source,
        )
    }

    @Test
    fun `fast uniform measurement needs twelve intervals and other timing needs a full window`() {
        val eleven = uniformCadence(25.0, intervals = 11)
        val twelve = uniformCadence(25.0, intervals = 12)
        val grid119 = gridCadence(intervals = 119)
        val grid120 = gridCadence(intervals = 120)

        assertEquals(RateSource.NONE, DisplayRateDecision.choose(RateInputs(measured = eleven)).source)
        assertEquals(RateSource.MEASURED, DisplayRateDecision.choose(RateInputs(measured = twelve)).source)
        assertEquals(RateSource.NONE, DisplayRateDecision.choose(RateInputs(measured = grid119)).source)
        assertEquals(RateSource.MEASURED, DisplayRateDecision.choose(RateInputs(measured = grid120)).source)
    }

    @Test
    fun `invalid bounds are skipped and nullable legacy hint remains a fallback`() {
        val legacy = DisplayRateDecision.choose(
            RateInputs(serverRealFps = Float.NaN, serverAverageFps = 121f, legacyFps = 24f),
        )
        val noRate = DisplayRateDecision.choose(
            RateInputs(serverRealFps = 0f, serverAverageFps = Float.POSITIVE_INFINITY),
        )
        val inclusiveBounds = DisplayRateDecision.choose(
            RateInputs(serverRealFps = 1f, serverAverageFps = 120f),
        )

        assertEquals(24f, legacy.fps!!, 0f)
        assertEquals(RateSource.SERVER_HINT, legacy.source)
        assertEquals(null, noRate.fps)
        assertEquals(RateSource.NONE, noRate.source)
        assertEquals(1f, inclusiveBounds.fps!!, 0f)
        assertEquals(RateSource.SERVER_REAL, inclusiveBounds.source)
    }

    @Test
    fun `measured fps outside supported bounds is rejected`() {
        val invalidMeasured = FrameCadence(
            kind = FrameCadence.Kind.UNIFORM,
            meanFps = 0.6,
            gridHz = 120.0,
            units = listOf(200 to 120),
            dominantIntervalUs = 1_666_667,
            dominantShare = 1.0,
            intervals = 120,
        )
        val choice = DisplayRateDecision.choose(
            RateInputs(serverRealFps = 24f, measured = invalidMeasured),
        )

        assertEquals(24f, choice.fps!!, 0f)
        assertEquals(RateSource.SERVER_REAL, choice.source)
    }

    @Test
    fun `server evidence follows real then average then legacy priority`() {
        assertEquals(
            RateSource.SERVER_REAL,
            DisplayRateDecision.choose(RateInputs(serverRealFps = 24f, serverAverageFps = 25f, legacyFps = 30f)).source,
        )
        assertEquals(
            RateSource.SERVER_AVERAGE,
            DisplayRateDecision.choose(RateInputs(serverAverageFps = 25f, legacyFps = 30f)).source,
        )
        assertEquals(
            RateSource.SERVER_HINT,
            DisplayRateDecision.choose(RateInputs(legacyFps = 30f)).source,
        )
    }

    @Test
    fun `diagnostic rate change ignores half percent but reports change above one percent`() {
        assertFalse(
            DisplayRateDecision.isRateChange(
                RateChoice(24f, RateSource.HEADER),
                RateChoice(24.12f, RateSource.MEASURED),
            ),
        )
        assertTrue(
            DisplayRateDecision.isRateChange(
                RateChoice(24f, RateSource.HEADER),
                RateChoice(24.3f, RateSource.MEASURED),
            ),
        )
        assertFalse(
            DisplayRateDecision.isRateChange(
                RateChoice(null, RateSource.NONE),
                RateChoice(24f, RateSource.MEASURED),
            ),
        )
    }

    @Test
    fun `uniform cadence with stray intervals resolves to the standard rate it sits on`() {
        val straddling = FrameCadence(
            kind = FrameCadence.Kind.UNIFORM,
            meanFps = 23.855,
            gridHz = 120_000.0 / 1001,
            units = listOf(5 to 118, 4 to 1, 9 to 1),
            dominantIntervalUs = 41_708,
            dominantShare = 0.98,
            intervals = 120,
        )

        val choice = DisplayRateDecision.choose(RateInputs(measured = straddling))

        assertEquals(24_000f / 1001f, choice.fps!!, 0.0005f)
        assertEquals(RateSource.MEASURED, choice.source)
        assertFalse(choice.fieldRateApplied)
    }

    @Test
    fun `plain uniform cadences keep their standard rates`() {
        val onFiftyGrid = FrameCadence(
            kind = FrameCadence.Kind.UNIFORM,
            meanFps = 25.0,
            gridHz = 50.0,
            units = listOf(2 to 120),
            dominantIntervalUs = 40_000,
            dominantShare = 1.0,
            intervals = 120,
        )

        assertEquals(
            24_000f / 1001f,
            DisplayRateDecision.choose(RateInputs(measured = uniformCadence(24_000.0 / 1001.0))).fps!!,
            0.0005f,
        )
        assertEquals(25f, DisplayRateDecision.choose(RateInputs(measured = onFiftyGrid)).fps!!, 0.0005f)
        assertEquals(
            60_000f / 1001f,
            DisplayRateDecision.choose(RateInputs(measured = uniformCadence(60_000.0 / 1001.0))).fps!!,
            0.0005f,
        )
    }

    @Test
    fun `uniform cadence without a grid or units falls back to its mean`() {
        val noUnits = FrameCadence(
            kind = FrameCadence.Kind.UNIFORM,
            meanFps = 25.0,
            gridHz = 50.0,
            units = emptyList(),
            dominantIntervalUs = 40_000,
            dominantShare = 1.0,
            intervals = 120,
        )

        assertEquals(25f, DisplayRateDecision.choose(RateInputs(measured = noUnits)).fps!!, 0.0005f)
    }

    @Test
    fun `dominant interval more than one percent from the grid period is not snapped`() {
        val longGaps = FrameCadence(
            kind = FrameCadence.Kind.UNIFORM,
            meanFps = 24.0,
            gridHz = 25.0,
            units = listOf(1 to 114, 2 to 6),
            dominantIntervalUs = 41_667,
            dominantShare = 0.95,
            intervals = 120,
        )

        assertEquals(24f, DisplayRateDecision.choose(RateInputs(measured = longGaps)).fps!!, 0.0005f)
    }

    @Test
    fun `true 24 and 25 uniform cadences keep their own rates`() {
        assertEquals(24f, DisplayRateDecision.choose(RateInputs(measured = uniformCadence(24.0))).fps!!, 0.0005f)
        assertEquals(25f, DisplayRateDecision.choose(RateInputs(measured = uniformCadence(25.0))).fps!!, 0.0005f)
    }

    @Test
    fun `a 23_9 reading on the 23_976 grid snaps to 23_976 and never to 25`() {
        val slightlyLow = FrameCadence(
            kind = FrameCadence.Kind.UNIFORM,
            meanFps = 23.9,
            gridHz = 120_000.0 / 1001,
            units = listOf(5 to 120),
            dominantIntervalUs = 41_708,
            dominantShare = 1.0,
            intervals = 120,
        )

        val fps = DisplayRateDecision.choose(RateInputs(measured = slightlyLow)).fps!!

        assertEquals(24_000f / 1001f, fps, 0.0005f)
        assertTrue(fps != 25f)
    }

    @Test
    fun `interlaced header doubles 29_97 even when the measured cadence is off`() {
        val straddling = FrameCadence(
            kind = FrameCadence.Kind.UNIFORM,
            meanFps = 29.9,
            gridHz = 60_000.0 / 1001,
            units = listOf(2 to 118, 1 to 2),
            dominantIntervalUs = 33_367,
            dominantShare = 0.98,
            intervals = 120,
        )

        val choice = DisplayRateDecision.choose(
            RateInputs(
                header = StreamRateEvidence(29.97f, StreamScanType.INTERLACED),
                measured = straddling,
            ),
        )

        assertEquals(60_000f / 1001f, choice.fps!!, 0.001f)
        assertEquals(RateSource.HEADER, choice.source)
        assertTrue(choice.fieldRateApplied)
    }

    private fun strayIntervalCadence() = FrameCadence(
        kind = FrameCadence.Kind.UNIFORM,
        meanFps = 30.478,
        gridHz = 60_000.0 / 1001,
        units = listOf(2 to 116, 1 to 4),
        dominantIntervalUs = 33_370,
        dominantShare = 0.97,
        intervals = 120,
    )

    private fun uniformCadence(fps: Double, intervals: Int = 120): FrameCadence =
        FrameCadenceClassifier.classify(LongArray(intervals) { index ->
            val startUs = Math.round(index * 1_000_000.0 / fps)
            val endUs = Math.round((index + 1) * 1_000_000.0 / fps)
            endUs - startUs
        })

    private fun gridCadence(intervals: Int): FrameCadence {
        val fieldPeriodUs = 1_000_000.0 * 1001 / 60_000
        val units = intArrayOf(1, 1, 2, 2, 3)
        var fields = 0L
        val samples = LongArray(intervals) { index ->
            val startUs = Math.round(fields * fieldPeriodUs)
            fields += units[index % units.size]
            Math.round(fields * fieldPeriodUs) - startUs
        }
        return FrameCadenceClassifier.classify(samples)
    }
}
