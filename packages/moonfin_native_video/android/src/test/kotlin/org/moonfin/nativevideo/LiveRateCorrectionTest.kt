package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class LiveRateCorrectionTest {
    private val epoch = CorrectionProgress.Epoch("period", 0, 0)
    private fun sample(positionMs: Long, sampleEpoch: CorrectionProgress.Epoch = epoch) =
        CorrectionProgress.Sample(sampleEpoch, positionMs)
    private fun evidence(fps: Float, fieldRateApplied: Boolean = false, scan: StreamScanType? = null) =
        RateEvidence(RateChoice(fps, RateSource.MEASURED, fieldRateApplied), scan)
    private fun started() = LiveRateCorrection().apply { begin(0L) }

    @Test fun `early correction keeps its original immutable evidence`() {
        val correction = started()
        val original = evidence(59.94f, fieldRateApplied = true, scan = StreamScanType.INTERLACED)
        correction.onReading(2_000L, null, original, fits = false)
        correction.onReading(3_000L, null, evidence(59.95f, fieldRateApplied = true, scan = StreamScanType.INTERLACED), fits = false)
        assertEquals(original, correction.takeDue(2_000L, null))
    }

    @Test fun `stable correction requires both wall time and advancing comparable media`() {
        val correction = started()
        correction.onReading(300_000L, sample(18_000L), evidence(25f), fits = false)
        assertNull(correction.takeDue(305_000L, sample(18_000L)))
        assertNull(correction.takeDue(306_000L, sample(22_999L)))
        assertEquals(25f, correction.takeDue(307_000L, sample(23_000L))!!.choice.fps!!, 0.001f)
    }

    @Test fun `burst loading and insufficient wall time cannot pass stability`() {
        val correction = started()
        correction.onReading(300_000L, sample(1_000_000L), evidence(25f), fits = false)
        assertNull(correction.takeDue(301_000L, sample(1_010_000L)))
        assertNull(correction.takeDue(301_000L, sample(1_010_000L)))
        assertEquals(25f, correction.takeDue(305_000L, sample(1_010_000L))!!.choice.fps!!, 0.001f)
    }

    @Test fun `epoch change and backward movement restart the media baseline`() {
        val correction = started()
        correction.onReading(300_000L, sample(50_000L), evidence(25f), fits = false)
        val replacementEpoch = CorrectionProgress.Epoch("replacement-period", 0, 0)
        assertNull(correction.takeDue(305_000L, sample(60_000L, replacementEpoch)))
        assertNull(correction.takeDue(306_000L, sample(59_000L, replacementEpoch)))
        assertNull(correction.takeDue(307_000L, sample(63_999L, replacementEpoch)))
        assertNull(correction.takeDue(308_000L, sample(64_000L, replacementEpoch)))
        assertEquals(25f, correction.takeDue(311_000L, sample(65_000L, replacementEpoch))!!.choice.fps!!, 0.001f)
    }

    @Test fun `missing comparable media withholds programme correction`() {
        val correction = started()
        correction.onReading(300_000L, null, evidence(25f), fits = false)
        assertNull(correction.takeDue(306_000L, sample(10_000L)))
        assertEquals(311_000L, correction.nextCheckAtMs())
        assertEquals(25f, correction.takeDue(311_000L, sample(15_000L))!!.choice.fps!!, 0.001f)
    }

    @Test fun `timeline gap drops the old baseline before coordinates return`() {
        val correction = started()
        correction.onReading(300_000L, sample(10_000L), evidence(25f), fits = false)
        assertNull(correction.takeDue(301_000L, null))
        assertNull(correction.takeDue(305_000L, sample(30_000L)))
        assertNull(correction.takeDue(309_999L, sample(34_999L)))
        assertEquals(25f, correction.takeDue(310_000L, sample(35_000L))!!.choice.fps!!, 0.001f)
    }

    @Test fun `backward movement before the deadline restarts wall and media stability`() {
        val correction = started()
        correction.onReading(300_000L, sample(10_000L), evidence(25f), fits = false)
        correction.takeDue(301_000L, sample(14_000L))
        assertNull(correction.takeDue(302_000L, sample(12_000L)))
        assertNull(correction.takeDue(306_999L, sample(16_999L)))
        assertEquals(25f, correction.takeDue(307_000L, sample(17_000L))!!.choice.fps!!, 0.001f)
    }

    @Test fun `cooldown and early window retain approved timing`() {
        val correction = started()
        correction.noteSwitch(1_000L)
        correction.onReading(60_000L, sample(10_000L), evidence(23.976f), fits = false)
        assertEquals(121_000L, correction.nextCheckAtMs())
        assertNull(correction.takeDue(65_000L, sample(15_000L)))
        assertEquals(23.976f, correction.takeDue(121_000L, sample(20_000L))!!.choice.fps!!, 0.001f)
    }

    @Test fun `early window is clock based and can be spent only once`() {
        val correction = started()
        correction.onReading(3_000L, null, evidence(29.97f), fits = false)
        assertEquals(29.97f, correction.takeDue(3_000L, null)!!.choice.fps!!, 0.001f)
        correction.onReading(6_000L, sample(6_000L), evidence(25f), fits = false)
        assertNull(correction.takeDue(6_000L, sample(6_000L)))
    }

    @Test fun `a wrong starting rate is corrected as soon as its reading arrives`() {
        val correction = started()
        correction.onReading(3_000L, null, evidence(29.97f), fits = false)
        assertTrue(correction.isEarlyPending())
        assertEquals(3_000L, correction.nextCheckAtMs())
        assertEquals(29.97f, correction.takeDue(3_000L, null)!!.choice.fps!!, 0.001f)
    }

    @Test fun `early correction ignores cooldown and media progress`() {
        val correction = started()
        correction.noteSwitch(500L)
        correction.onReading(4_000L, sample(9_000L), evidence(23.976f), fits = false)
        assertEquals(23.976f, correction.takeDue(4_000L, null)!!.choice.fps!!, 0.001f)
    }

    @Test fun `a later candidate waits five seconds and cooldown from last switch`() {
        val correction = started()
        correction.noteSwitch(1_000L)
        correction.onReading(300_000L, sample(10_000L), evidence(25f), fits = false)
        assertEquals(305_000L, correction.nextCheckAtMs())
        assertNull(correction.takeDue(304_999L, sample(14_999L)))
        assertEquals(25f, correction.takeDue(305_000L, sample(15_000L))!!.choice.fps!!, 0.001f)
    }

    @Test fun `a second programme change observes the previous correction cooldown`() {
        val correction = started()
        correction.onReading(300_000L, sample(0L), evidence(25f), fits = false)
        correction.takeDue(305_000L, sample(5_000L))
        correction.onReading(360_000L, sample(60_000L), evidence(29.97f), fits = false)
        assertEquals(425_000L, correction.nextCheckAtMs())
    }

    @Test fun `different rate restarts both stability clocks while same evidence does not`() {
        val correction = started()
        correction.onReading(100_000L, sample(0L), evidence(25f), fits = false)
        correction.onReading(103_000L, sample(3_000L), evidence(25f), fits = false)
        assertEquals(105_000L, correction.nextCheckAtMs())
        correction.onReading(104_000L, sample(4_000L), evidence(23.976f), fits = false)
        assertEquals(109_000L, correction.nextCheckAtMs())
    }

    @Test fun `a provenance change at the same rate restarts candidate with new evidence`() {
        val correction = started()
        correction.onReading(300_000L, sample(0L), evidence(25f, scan = StreamScanType.UNKNOWN), fits = false)
        val interlaced = evidence(25f, scan = StreamScanType.INTERLACED)
        correction.onReading(303_000L, sample(3_000L), interlaced, fits = false)
        assertEquals(308_000L, correction.nextCheckAtMs())
        assertEquals(interlaced, correction.takeDue(308_000L, sample(8_000L)))
    }

    @Test fun `same measured rate within tolerance keeps its original candidate time`() {
        val correction = started()
        correction.onReading(100_000L, sample(0L), evidence(25f), fits = false)
        correction.onReading(103_000L, sample(3_000L), evidence(25.01f), fits = false)
        assertEquals(105_000L, correction.nextCheckAtMs())
    }

    @Test fun `an unusable reading clears its pending candidate`() {
        val correction = started()
        correction.onReading(100_000L, sample(0L), evidence(25f), fits = false)
        correction.onUnusableReading()
        assertNull(correction.nextCheckAtMs())
        assertNull(correction.takeDue(200_000L, sample(100_000L)))
    }

    @Test fun `no candidate exists until begin and cancellation clears pending work`() {
        val correction = LiveRateCorrection()
        correction.onReading(1_000L, sample(0L), evidence(25f), fits = false)
        assertNull(correction.nextCheckAtMs())
        correction.begin(10_000L)
        correction.onReading(11_000L, sample(0L), evidence(Float.NaN), fits = false)
        assertNull(correction.nextCheckAtMs())
        correction.onReading(12_000L, sample(0L), evidence(25f), fits = false)
        correction.cancel()
        assertNull(correction.takeDue(20_000L, sample(10_000L)))
    }

    @Test fun `replacement source starts a fresh early window and canceled source is inert`() {
        val correction = started()
        correction.onReading(2_000L, null, evidence(25f), fits = false)
        correction.takeDue(2_000L, null)
        correction.begin(500_000L)
        correction.onReading(502_000L, null, evidence(29.97f), fits = false)
        assertTrue(correction.isEarlyPending())
        correction.cancel()
        correction.onReading(503_000L, sample(503_000L), evidence(25f), fits = false)
        assertNull(correction.nextCheckAtMs())
        assertNull(correction.takeDue(900_000L, sample(900_000L)))
    }

    @Test fun `nonpositive and out of range rates are ignored`() {
        val correction = started()
        listOf(0f, -1f, 121f, Float.NaN).forEach { fps ->
            correction.onReading(1_000L, null, evidence(fps), fits = false)
        }
        assertNull(correction.nextCheckAtMs())
    }

    @Test fun `unusable and fitting readings clear candidates and cancel disables policy`() {
        val correction = started()
        correction.onReading(100_000L, sample(0L), evidence(25f), fits = false)
        correction.onReading(101_000L, sample(1_000L), evidence(29.97f), fits = true)
        assertNull(correction.nextCheckAtMs())
        correction.onReading(102_000L, sample(2_000L), evidence(25f), fits = false)
        correction.cancel()
        assertNull(correction.takeDue(200_000L, sample(100_000L)))
    }
}
