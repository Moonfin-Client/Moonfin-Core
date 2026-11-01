package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Test

class DisplayModeSettleTest {

    private val settle = DisplayModeSettle(quietMs = 1_500L, maxWaitMs = 7_000L, startedAtMs = 0L)

    @Test
    fun `a change pushes the start a full quiet period past it`() {
        assertEquals(1_500L, settle.delayAfterChange(nowMs = 0L))
        assertEquals(1_500L, settle.delayAfterChange(nowMs = 2_000L))
    }

    @Test
    fun `a change near the cap only waits until the cap`() {
        assertEquals(1_000L, settle.delayAfterChange(nowMs = 6_000L))
    }

    @Test
    fun `a change past the cap starts right away`() {
        assertEquals(0L, settle.delayAfterChange(nowMs = 9_000L))
    }

    @Test
    fun `once HDMI audio has gone the start waits for it and runs the moment it returns`() {
        val held = DisplayModeSettle(quietMs = 1_500L, maxWaitMs = 8_000L, startedAtMs = 0L, audioReturnSettleMs = 0L)
        held.noteHdmiAudio(present = false)
        assertEquals(6_000L, held.delayAfterChange(nowMs = 2_000L))
        held.noteHdmiAudio(present = true)
        assertEquals(0L, held.delayAfterChange(nowMs = 5_000L))
    }

    @Test
    fun `the viewer's own start delay still applies after HDMI audio returns`() {
        val held = DisplayModeSettle(quietMs = 1_500L, maxWaitMs = 8_000L, startedAtMs = 0L, audioReturnSettleMs = 500L)
        held.noteHdmiAudio(present = false)
        held.noteHdmiAudio(present = true)
        assertEquals(500L, held.delayAfterChange(nowMs = 5_000L))
        // Running out of time still starts at the cap.
        assertEquals(200L, held.delayAfterChange(nowMs = 7_800L))
    }

    @Test
    fun `the away state is visible so a restarted hold can carry it`() {
        val held = DisplayModeSettle(quietMs = 1_500L, maxWaitMs = 8_000L, startedAtMs = 0L, audioReturnSettleMs = 0L)
        assertEquals(false, held.isHdmiAudioAway)
        held.noteHdmiAudio(present = false)
        assertEquals(true, held.isHdmiAudioAway)
        held.noteHdmiAudio(present = true)
        assertEquals(false, held.isHdmiAudioAway)
    }

    @Test
    fun `an expected drop keeps the start waiting past the quiet period`() {
        val held = DisplayModeSettle(
            quietMs = 1_500L, maxWaitMs = 8_000L, startedAtMs = 0L,
            audioReturnSettleMs = 0L, expectHdmiAudioDrop = true, hdmiAudioDropWindowMs = 3_000L,
        )
        // Quiet would release at 1.5s; the drop is announced around 2s.
        assertEquals(3_000L, held.delayAfterChange(nowMs = 0L))
        assertEquals(1_500L, held.delayAfterChange(nowMs = 1_500L))
        held.noteHdmiAudio(present = false)
        assertEquals(true, held.sawHdmiAudioDrop)
        assertEquals(6_000L, held.delayAfterChange(nowMs = 2_000L))
        held.noteHdmiAudio(present = true)
        assertEquals(0L, held.delayAfterChange(nowMs = 4_000L))
    }

    @Test
    fun `an expected drop that never comes releases when the window ends`() {
        val held = DisplayModeSettle(
            quietMs = 1_500L, maxWaitMs = 8_000L, startedAtMs = 0L,
            expectHdmiAudioDrop = true, hdmiAudioDropWindowMs = 3_000L,
        )
        assertEquals(1_500L, held.delayAfterChange(nowMs = 2_500L))
        assertEquals(1_500L, held.delayAfterChange(nowMs = 4_000L))
    }

    @Test
    fun `HDMI audio that never left changes nothing`() {
        val held = DisplayModeSettle(quietMs = 1_500L, maxWaitMs = 8_000L, startedAtMs = 0L, audioReturnSettleMs = 500L)
        held.noteHdmiAudio(present = true)
        assertEquals(1_500L, held.delayAfterChange(nowMs = 1_000L))
    }

    @Test
    fun `HDMI audio leaving again after it returned waits again`() {
        val held = DisplayModeSettle(quietMs = 1_500L, maxWaitMs = 8_000L, startedAtMs = 0L, audioReturnSettleMs = 500L)
        held.noteHdmiAudio(present = false)
        held.noteHdmiAudio(present = true)
        held.noteHdmiAudio(present = false)
        assertEquals(4_000L, held.delayAfterChange(nowMs = 4_000L))
    }
}
