package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class PassthroughSilenceRecoveryTest {

    private fun playingPassthrough(
        recovery: PassthroughSilenceRecovery,
        nowMs: Long,
    ) {
        recovery.onConfigure(passthrough = true, nowMs = nowMs)
        recovery.onPlay(nowMs)
    }

    @Test
    fun `advancing position never triggers on a healthy device`() {
        val recovery = PassthroughSilenceRecovery()
        playingPassthrough(recovery, 0)
        var now = 0L
        for (i in 1..500) {
            now += 10
            assertFalse(recovery.onPosition(i * 10_000L, true, now))
        }
        assertFalse(recovery.isBroken)
        assertFalse(recovery.shouldHoldWrites(now))
    }

    @Test
    fun `frozen pcm position never triggers`() {
        val recovery = PassthroughSilenceRecovery()
        recovery.onConfigure(passthrough = false, nowMs = 0)
        recovery.onPlay(0)
        recovery.onPosition(5_000L, true, 10)
        assertFalse(recovery.onPosition(5_000L, true, 5_000))
        assertFalse(recovery.isBroken)
    }

    @Test
    fun `frozen position while paused never triggers`() {
        val recovery = PassthroughSilenceRecovery()
        playingPassthrough(recovery, 0)
        recovery.onPosition(5_000L, true, 10)
        recovery.onPause()
        assertFalse(recovery.onPosition(5_000L, true, 60_000))
    }

    @Test
    fun `frozen position without pending data never triggers`() {
        val recovery = PassthroughSilenceRecovery()
        playingPassthrough(recovery, 0)
        recovery.onPosition(5_000L, false, 10)
        assertFalse(recovery.onPosition(5_000L, false, 5_000))
    }

    @Test
    fun `unset position sentinel never triggers`() {
        val recovery = PassthroughSilenceRecovery()
        playingPassthrough(recovery, 0)
        assertFalse(recovery.onPosition(Long.MIN_VALUE, true, 5_000))
        assertFalse(recovery.onPosition(Long.MIN_VALUE, true, 10_000))
    }

    @Test
    fun `dead track is detected once the threshold passes`() {
        val recovery = PassthroughSilenceRecovery()
        playingPassthrough(recovery, 0)
        recovery.onPosition(5_000L, true, 10)
        assertFalse(recovery.onPosition(5_000L, true, 500))
        assertTrue(recovery.onPosition(5_000L, true, 900))
        assertTrue(recovery.isBroken)
    }

    @Test
    fun `no second detection while the first recovery is pending`() {
        val recovery = PassthroughSilenceRecovery()
        playingPassthrough(recovery, 0)
        recovery.onPosition(5_000L, true, 10)
        assertTrue(recovery.onPosition(5_000L, true, 900))
        assertFalse(recovery.onPosition(5_000L, true, 1_200))
    }

    @Test
    fun `write hold arms on the flush after detection and then clears`() {
        val recovery = PassthroughSilenceRecovery()
        playingPassthrough(recovery, 0)
        recovery.onPosition(5_000L, true, 10)
        assertTrue(recovery.onPosition(5_000L, true, 900))
        recovery.onFlush(1_000)
        assertTrue(recovery.shouldHoldWrites(1_100))
        assertTrue(recovery.shouldHoldWrites(1_249))
        assertFalse(recovery.shouldHoldWrites(1_251))
    }

    @Test
    fun `flushes before any detection never hold writes`() {
        val recovery = PassthroughSilenceRecovery()
        playingPassthrough(recovery, 0)
        recovery.onFlush(100)
        assertFalse(recovery.shouldHoldWrites(101))
    }

    @Test
    fun `hold grows while recoveries keep failing`() {
        val recovery = PassthroughSilenceRecovery(recoveryMinIntervalMs = 1_000)
        playingPassthrough(recovery, 0)
        recovery.onPosition(5_000L, true, 10)
        assertTrue(recovery.onPosition(5_000L, true, 900))
        recovery.onFlush(1_000)
        assertFalse(recovery.shouldHoldWrites(1_300))

        // Still frozen after the rebuild, so the second hold is longer.
        recovery.onPosition(5_000L, true, 1_400)
        assertTrue(recovery.onPosition(5_000L, true, 2_200))
        recovery.onFlush(2_300)
        assertTrue(recovery.shouldHoldWrites(2_700))
        assertFalse(recovery.shouldHoldWrites(2_900))
    }

    @Test
    fun `movement resets the failure streak`() {
        val recovery = PassthroughSilenceRecovery(recoveryMinIntervalMs = 1_000)
        playingPassthrough(recovery, 0)
        recovery.onPosition(5_000L, true, 10)
        assertTrue(recovery.onPosition(5_000L, true, 900))
        recovery.onFlush(1_000)
        // The rebuild worked, the position moves between two real samples.
        recovery.onPosition(6_000L, true, 1_400)
        assertFalse(recovery.onPosition(7_000L, true, 1_500))
        // A later dead track starts from the first hold step again.
        assertTrue(recovery.onPosition(7_000L, true, 5_000))
        recovery.onFlush(5_100)
        assertTrue(recovery.shouldHoldWrites(5_300))
        assertFalse(recovery.shouldHoldWrites(5_400))
    }

    @Test
    fun `recoveries stop after the failure cap`() {
        val recovery = PassthroughSilenceRecovery(
            recoveryMinIntervalMs = 100,
            maxConsecutiveFailures = 2,
        )
        playingPassthrough(recovery, 0)
        var now = 10L
        recovery.onPosition(5_000L, true, now)
        var fired = 0
        repeat(10) {
            now += 1_000
            if (recovery.onPosition(5_000L, true, now)) {
                fired += 1
                recovery.onFlush(now)
            }
        }
        assertEquals(2, fired)
    }

    @Test
    fun `resume on a proven broken route rebuilds proactively`() {
        val recovery = PassthroughSilenceRecovery(recoveryMinIntervalMs = 1_000)
        playingPassthrough(recovery, 0)
        recovery.onPosition(5_000L, true, 10)
        assertTrue(recovery.onPosition(5_000L, true, 900))
        recovery.onFlush(1_000)
        assertFalse(recovery.onPosition(6_000L, true, 1_400))

        recovery.onPause()
        assertTrue(recovery.onPlay(10_000))
    }

    @Test
    fun `resume on a healthy route never rebuilds proactively`() {
        val recovery = PassthroughSilenceRecovery()
        playingPassthrough(recovery, 0)
        recovery.onPosition(5_000L, true, 10)
        recovery.onPause()
        assertFalse(recovery.onPlay(60_000))
    }

    @Test
    fun `paused wall time is not counted toward the threshold`() {
        val recovery = PassthroughSilenceRecovery()
        playingPassthrough(recovery, 0)
        recovery.onPosition(5_000L, true, 10)
        recovery.onPause()
        recovery.onPlay(60_000)
        // The freeze clock starts at the first sample after the resume, so a
        // long pause never counts toward the threshold.
        recovery.onPosition(5_000L, true, 60_400)
        assertFalse(recovery.onPosition(5_000L, true, 61_000))
        assertTrue(recovery.onPosition(5_000L, true, 61_200))
    }

    @Test
    fun `reset keeps the broken mark but clears the stream state`() {
        val recovery = PassthroughSilenceRecovery(recoveryMinIntervalMs = 100)
        playingPassthrough(recovery, 0)
        recovery.onPosition(5_000L, true, 10)
        assertTrue(recovery.onPosition(5_000L, true, 900))
        recovery.onReset(1_000)
        assertTrue(recovery.isBroken)
        assertFalse(recovery.shouldHoldWrites(1_001))
        // The next stream on the same route still gets the protections.
        playingPassthrough(recovery, 2_000)
        recovery.onPosition(1_000L, true, 2_010)
        assertTrue(recovery.onPosition(1_000L, true, 2_900))
    }
}
