package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class LiveRateCorrectionTest {

    private fun started(atMs: Long = 0L) = LiveRateCorrection().apply { begin(atMs) }

    // Live relays load at about real time, so media loaded tracks the clock.
    private fun LiveRateCorrection.reading(atMs: Long, fps: Float, fits: Boolean = false) =
        onReading(nowMs = atMs, loadedMs = atMs, fps = fps, fits = fits)

    private fun LiveRateCorrection.take(atMs: Long) = takeDue(nowMs = atMs, loadedMs = atMs)

    @Test
    fun `a wrong starting rate is corrected as soon as a reading arrives`() {
        val correction = started()
        correction.reading(3_000L, 29.97f)
        assertTrue(correction.isEarlyPending())
        assertEquals(3_000L, correction.nextCheckAtMs())
        assertEquals(29.97f, correction.take(3_000L)!!, 0.001f)
    }

    @Test
    fun `the early correction ignores the cooldown and loaded media`() {
        val correction = started()
        correction.noteSwitch(500L)
        correction.onReading(nowMs = 4_000L, loadedMs = 9_000L, fps = 23.976f, fits = false)
        assertEquals(23.976f, correction.takeDue(nowMs = 4_000L, loadedMs = 9_000L)!!, 0.001f)
    }

    @Test
    fun `there is only one early correction`() {
        val correction = started()
        correction.reading(2_000L, 29.97f)
        correction.take(2_000L)
        correction.reading(6_000L, 25f)
        assertFalse(correction.isEarlyPending())
        assertNull(correction.take(6_000L))
    }

    @Test
    fun `a programme change waits five seconds and the cooldown`() {
        val correction = started()
        correction.noteSwitch(1_000L)
        correction.reading(60_000L, 23.976f)
        // Stable after 65 s, but the start switch's cooldown runs to 121 s.
        assertEquals(121_000L, correction.nextCheckAtMs())
        assertNull(correction.take(65_000L))
        assertEquals(23.976f, correction.take(121_000L)!!, 0.001f)
    }

    @Test
    fun `a programme change after the cooldown waits only for stability`() {
        val correction = started()
        correction.noteSwitch(1_000L)
        correction.reading(300_000L, 25f)
        assertEquals(305_000L, correction.nextCheckAtMs())
        assertNull(correction.take(304_999L))
        assertEquals(25f, correction.take(305_000L)!!, 0.001f)
    }

    @Test
    fun `a burst of loaded media does not count as time held`() {
        val correction = started()
        // A whole segment loads at once: media is far ahead of the clock.
        correction.onReading(nowMs = 300_000L, loadedMs = 1_000_000L, fps = 25f, fits = false)
        // Five seconds pass on the clock but nothing more has loaded.
        assertNull(correction.takeDue(nowMs = 305_000L, loadedMs = 1_000_000L))
        assertEquals(25f, correction.takeDue(nowMs = 306_000L, loadedMs = 1_005_000L)!!, 0.001f)
    }

    @Test
    fun `loaded media alone does not count as time held`() {
        val correction = started()
        correction.onReading(nowMs = 300_000L, loadedMs = 0L, fps = 25f, fits = false)
        assertNull(correction.takeDue(nowMs = 301_000L, loadedMs = 9_000L))
    }

    @Test
    fun `a seek back restarts the media hold`() {
        val correction = started()
        correction.onReading(nowMs = 300_000L, loadedMs = 50_000L, fps = 25f, fits = false)
        assertNull(correction.takeDue(nowMs = 305_000L, loadedMs = 10_000L))
        assertNull(correction.takeDue(nowMs = 306_000L, loadedMs = 14_000L))
        assertEquals(25f, correction.takeDue(nowMs = 307_000L, loadedMs = 15_000L)!!, 0.001f)
    }

    @Test
    fun `a second change inside the cooldown waits for it`() {
        val correction = started()
        correction.reading(300_000L, 25f)
        correction.take(305_000L)
        correction.reading(360_000L, 29.97f)
        assertEquals(425_000L, correction.nextCheckAtMs())
    }

    @Test
    fun `a rate the current mode fits clears what was pending`() {
        val correction = started()
        correction.reading(100_000L, 23.976f)
        correction.reading(102_000L, 29.97f, fits = true)
        assertNull(correction.nextCheckAtMs())
        assertNull(correction.take(200_000L))
    }

    @Test
    fun `a short bumper at another rate never switches`() {
        val correction = started()
        correction.reading(100_000L, 25f)
        // The programme's own rate is back before five seconds pass.
        correction.reading(103_000L, 29.97f, fits = true)
        assertNull(correction.take(106_000L))
    }

    @Test
    fun `an unusable reading clears what was pending`() {
        val correction = started()
        correction.reading(100_000L, 25f)
        correction.onUnusableReading()
        assertNull(correction.nextCheckAtMs())
    }

    @Test
    fun `a different new rate restarts the stability wait`() {
        val correction = started()
        correction.reading(100_000L, 25f)
        correction.reading(103_000L, 23.976f)
        assertEquals(108_000L, correction.nextCheckAtMs())
    }

    @Test
    fun `the same rate reported again keeps its original start`() {
        val correction = started()
        correction.reading(100_000L, 25f)
        correction.reading(103_000L, 25.01f)
        assertEquals(105_000L, correction.nextCheckAtMs())
    }

    @Test
    fun `a new source starts over and a cancelled one does nothing`() {
        val correction = started()
        correction.reading(2_000L, 25f)
        correction.take(2_000L)
        correction.begin(500_000L)
        correction.reading(502_000L, 29.97f)
        assertTrue(correction.isEarlyPending())

        correction.cancel()
        correction.reading(503_000L, 25f)
        assertNull(correction.nextCheckAtMs())
        assertNull(correction.take(900_000L))
    }

    @Test
    fun `nothing happens before begin`() {
        val correction = LiveRateCorrection()
        correction.reading(1_000L, 25f)
        assertNull(correction.nextCheckAtMs())
    }

    @Test
    fun `invalid rates are ignored`() {
        val correction = started()
        correction.reading(1_000L, Float.NaN)
        correction.reading(1_000L, 0f)
        assertNull(correction.nextCheckAtMs())
    }
}
