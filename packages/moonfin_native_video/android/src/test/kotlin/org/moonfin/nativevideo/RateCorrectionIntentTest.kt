package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class RateCorrectionIntentTest {
    @Test fun `pause and play requests update intent synchronously through the hold`() {
        val intent = RateCorrectionIntent()
        intent.begin(7, playWhenReady = true)
        val player = Any()
        assertTrue(intent.request(7, playWhenReady = false))
        intent.markInternalPause(player, expectedReason = 1)
        assertTrue(intent.consumeInternalPause(player, reason = 1))
        assertTrue(intent.request(7, playWhenReady = true))
        intent.markInternalPause(player, expectedReason = 1)
        assertTrue(intent.consumeInternalPause(player, reason = 1))
        assertEquals(true, intent.complete(7))
        assertNull(intent.complete(7))
    }

    @Test fun `delayed self pause survives viewer pause and play requests`() {
        val intent = RateCorrectionIntent()
        intent.begin(8, playWhenReady = true)
        val player = Any()
        intent.markInternalPause(player, expectedReason = 1)
        assertTrue(intent.viewerRequest(8, playWhenReady = false))
        assertTrue(intent.viewerRequest(8, playWhenReady = true))
        assertTrue(intent.consumeInternalPause(player, reason = 1))
        assertEquals(true, intent.complete(8))
    }

    @Test fun `cancel and replacement reject completion from a retired source`() {
        val intent = RateCorrectionIntent()
        intent.begin(9, playWhenReady = true)
        val player = Any()
        intent.begin(10, playWhenReady = false)
        assertFalse(intent.request(9, playWhenReady = true))
        assertNull(intent.complete(9))
        intent.markInternalPause(player, expectedReason = 1)
        intent.cancel()
        assertFalse(intent.consumeInternalPause(player, reason = 1))
        assertNull(intent.complete(10))
    }

    @Test fun `explicit pause clears a route resume without changing a newer source intent`() {
        val intent = RateCorrectionIntent()
        intent.begin(12, playWhenReady = true)
        intent.recordSystemPause(100L, reason = 2)

        // requestPlayback(false) calls viewerRequest synchronously. The token
        // can be stale during replacement, but the viewer still owns intent.
        assertFalse(intent.viewerRequest(11, playWhenReady = false))
        var resumed = false
        val action = intent.handleAudioDeviceAdded(200L, true, 1_000L, correctionHolding = false) {
            resumed = true
        }

        assertEquals(RateCorrectionIntent.RouteResume.NONE, action)
        assertFalse(resumed)
        assertEquals(true, intent.complete(12))
    }

    @Test fun `route return during correction hold defers player mutation and preserves viewer pause`() {
        val intent = RateCorrectionIntent()
        intent.begin(13, playWhenReady = true)
        assertTrue(intent.viewerRequest(13, playWhenReady = false))
        // A late system callback may arrive after the explicit pause. The
        // correction hold must still prevent route recovery from playing.
        intent.recordSystemPause(100L, reason = 2)

        var playerPlayWhenReady = false
        val action = intent.handleAudioDeviceAdded(200L, true, 1_000L, correctionHolding = true) {
            playerPlayWhenReady = true
        }

        assertEquals(RateCorrectionIntent.RouteResume.DEFERRED_TO_CORRECTION, action)
        assertFalse(playerPlayWhenReady)
        assertEquals(false, intent.complete(13))
    }
}
