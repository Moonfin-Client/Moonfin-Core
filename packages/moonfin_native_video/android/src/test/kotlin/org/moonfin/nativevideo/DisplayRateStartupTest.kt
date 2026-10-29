package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class DisplayRateStartupTest {

    @Test
    fun `evidence and release require the active source token`() {
        val startup = DisplayRateStartup()
        startup.begin(sourceToken = 7, playWhenReady = true)

        assertFalse(startup.decide(sourceToken = 6))
        assertEquals(DisplayRateStartup.Phase.WAITING, startup.phase)
        assertFalse(startup.release(sourceToken = 7))
        assertTrue(startup.decide(sourceToken = 7))
        assertFalse(startup.release(sourceToken = 6))
        assertEquals(DisplayRateStartup.Phase.SETTLING, startup.phase)
        assertTrue(startup.release(sourceToken = 7))
        assertEquals(DisplayRateStartup.Phase.RELEASED, startup.phase)
    }

    @Test
    fun `decide and release each succeed only once`() {
        val startup = DisplayRateStartup()
        startup.begin(sourceToken = 11, playWhenReady = false)

        assertTrue(startup.decide(sourceToken = 11))
        assertFalse(startup.decide(sourceToken = 11))
        assertTrue(startup.release(sourceToken = 11))
        assertFalse(startup.release(sourceToken = 11))
    }

    @Test
    fun `late evidence after release is ignored`() {
        val startup = DisplayRateStartup()
        startup.begin(sourceToken = 3, playWhenReady = true)
        assertTrue(startup.decide(sourceToken = 3))
        assertTrue(startup.release(sourceToken = 3))

        assertFalse(startup.decide(sourceToken = 3))
        assertEquals(DisplayRateStartup.Phase.RELEASED, startup.phase)
        assertFalse(startup.audioBlocked)
        assertFalse(startup.awaitingEvidence)
    }

    @Test
    fun `play and pause intent can change while waiting or settling`() {
        val startup = DisplayRateStartup()
        startup.begin(sourceToken = 4, playWhenReady = true)

        startup.requestPlayWhenReady(false)
        assertFalse(startup.playWhenReady)
        assertTrue(startup.decide(sourceToken = 4))
        startup.requestPlayWhenReady(true)
        assertTrue(startup.playWhenReady)
        startup.requestPlayWhenReady(false)
        assertFalse(startup.playWhenReady)
    }

    @Test
    fun `cancel prevents a queued release from opening the gate`() {
        val startup = DisplayRateStartup()
        startup.begin(sourceToken = 21, playWhenReady = true)
        assertTrue(startup.decide(sourceToken = 21))

        startup.cancel()

        assertFalse(startup.release(sourceToken = 21))
        assertEquals(DisplayRateStartup.Phase.IDLE, startup.phase)
        assertFalse(startup.audioBlocked)
        assertNull(startup.sourceToken)
        assertFalse(startup.playWhenReady)
    }

    @Test
    fun `replacement source rejects callbacks from the previous source`() {
        val startup = DisplayRateStartup()
        startup.begin(sourceToken = 31, playWhenReady = true)
        startup.begin(sourceToken = 32, playWhenReady = false)

        assertFalse(startup.decide(sourceToken = 31))
        assertFalse(startup.release(sourceToken = 31))
        assertEquals(32, startup.sourceToken)
        assertTrue(startup.audioBlocked)
        assertTrue(startup.awaitingEvidence)
        assertFalse(startup.playWhenReady)
        assertTrue(startup.decide(sourceToken = 32))
        assertTrue(startup.release(sourceToken = 32))
    }

    @Test
    fun `play intent changes after release do not mutate terminal state`() {
        val startup = DisplayRateStartup()
        startup.begin(sourceToken = 41, playWhenReady = true)
        assertTrue(startup.decide(sourceToken = 41))
        assertTrue(startup.release(sourceToken = 41))

        startup.requestPlayWhenReady(false)

        assertTrue(startup.playWhenReady)
        assertEquals(DisplayRateStartup.Phase.RELEASED, startup.phase)
    }
}