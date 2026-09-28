package org.moonfin.nativevideo

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class ResumeWedgePolicyTest {

    private fun decide(
        stillBuffering: Boolean = true,
        playWhenReady: Boolean = true,
        bufferedAheadMs: Long = 18_000L,
        isLiveSource: Boolean = false,
        playerLive: Boolean = true,
    ) = ResumeWedgePolicy.shouldReprepare(
        stillBuffering = stillBuffering,
        playWhenReady = playWhenReady,
        bufferedAheadMs = bufferedAheadMs,
        isLiveSource = isLiveSource,
        playerLive = playerLive,
    )

    @Test
    fun `a resume still buffering with the film loaded is prepared again`() {
        assertTrue(decide())
    }

    @Test
    fun `a resume that started playing is left alone`() {
        assertFalse(decide(stillBuffering = false))
    }

    @Test
    fun `a network that ran dry is left to the loader`() {
        assertFalse(decide(bufferedAheadMs = 2_000L))
    }

    @Test
    fun `the runway floor itself counts as loaded`() {
        assertTrue(decide(bufferedAheadMs = ResumeWedgePolicy.RUNWAY_FLOOR_MS))
    }

    @Test
    fun `a viewer who paused again keeps their pause`() {
        assertFalse(decide(playWhenReady = false))
    }

    @Test
    fun `live sources and a player going away are never prepared`() {
        assertFalse(decide(isLiveSource = true))
        assertFalse(decide(playerLive = false))
    }
}
