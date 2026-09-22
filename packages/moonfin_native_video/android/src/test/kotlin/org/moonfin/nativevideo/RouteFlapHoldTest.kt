package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.moonfin.nativevideo.RouteFlapHold.Notify
import org.moonfin.nativevideo.RouteFlapHold.Write

class RouteFlapHoldTest {

    private fun bitstream(maxHoldMs: Long = 5_000L): RouteFlapHold =
        RouteFlapHold(maxHoldMs).also { it.onConfigure(bitstream = true) }

    @Test
    fun `a dead bitstream track opens a hold and swallows the error`() {
        val hold = bitstream()
        assertTrue(hold.onDeadTrack(0))
        assertEquals(Write.HOLD, hold.writeDecision(supportedNow = false, nowMs = 100))
    }

    @Test
    fun `a dead offloaded track is not held`() {
        val hold = RouteFlapHold().also { it.onConfigure(bitstream = false) }
        assertFalse(hold.onDeadTrack(0))
        assertEquals(Write.WRITE, hold.writeDecision(supportedNow = false, nowMs = 100))
    }

    @Test
    fun `a dead decoded pcm track is rebuilt instead of reported`() {
        val hold = RouteFlapHold().also {
            it.onConfigure(bitstream = false, rebuildOnDeadTrack = true)
        }
        assertTrue(hold.onDeadTrack(0))
        // The sink answers yes for raw PCM even on a dead track, so the next
        // write rebuilds instead of waiting the route out.
        assertEquals(Write.REBUILD, hold.writeDecision(supportedNow = true, nowMs = 100))
        hold.onRebuilt()
        assertEquals(Write.WRITE, hold.writeDecision(supportedNow = true, nowMs = 200))
    }

    @Test
    fun `a decoded pcm rebuild that never takes still rethrows`() {
        val hold = RouteFlapHold().also {
            it.onConfigure(bitstream = false, rebuildOnDeadTrack = true)
        }
        hold.onDeadTrack(0)
        assertEquals(Write.REBUILD, hold.writeDecision(supportedNow = true, nowMs = 1_000))
        assertEquals(Write.RETHROW, hold.writeDecision(supportedNow = true, nowMs = 5_000))
    }

    @Test
    fun `decoded pcm still forwards every capability change`() {
        val hold = RouteFlapHold().also {
            it.onConfigure(bitstream = false, rebuildOnDeadTrack = true)
        }
        assertEquals(Notify.FORWARD, hold.onCapabilitiesChanged(supportedNow = false, nowMs = 0))
        assertEquals(Notify.FORWARD, hold.onCapabilitiesChanged(supportedNow = true, nowMs = 1))
    }

    @Test
    fun `the hold ends when the route comes back and the rebuild takes`() {
        val hold = bitstream()
        hold.onDeadTrack(0)
        assertEquals(Write.REBUILD, hold.writeDecision(supportedNow = true, nowMs = 1_800))
        hold.onRebuilt()
        assertEquals(Write.WRITE, hold.writeDecision(supportedNow = true, nowMs = 1_900))
    }

    @Test
    fun `a failed rebuild keeps holding inside the same window`() {
        val hold = bitstream()
        hold.onDeadTrack(0)
        assertEquals(Write.REBUILD, hold.writeDecision(supportedNow = true, nowMs = 1_000))
        // The rebuild threw, so nothing was reported and the next write
        // tries again on the window the dead track opened.
        assertEquals(Write.HOLD, hold.writeDecision(supportedNow = false, nowMs = 1_100))
        assertEquals(Write.RETHROW, hold.writeDecision(supportedNow = false, nowMs = 5_000))
    }

    @Test
    fun `the hold expires at maxHoldMs and rethrows`() {
        val hold = bitstream()
        hold.onDeadTrack(0)
        assertEquals(Write.HOLD, hold.writeDecision(supportedNow = false, nowMs = 4_999))
        assertEquals(Write.RETHROW, hold.writeDecision(supportedNow = false, nowMs = 5_000))
        assertEquals(Write.WRITE, hold.writeDecision(supportedNow = false, nowMs = 5_001))
    }

    @Test
    fun `a route back right at expiry still rethrows`() {
        // The player's own recovery reselects against live capabilities, so
        // with the route back it lands on passthrough again anyway.
        val hold = bitstream(maxHoldMs = 1_000)
        hold.onDeadTrack(0)
        assertEquals(Write.RETHROW, hold.writeDecision(supportedNow = true, nowMs = 1_000))
    }

    @Test
    fun `support lost on a bitstream input is deferred`() {
        val hold = bitstream()
        assertEquals(Notify.DEFER, hold.onCapabilitiesChanged(supportedNow = false, nowMs = 0))
    }

    @Test
    fun `support back inside the window is swallowed and ends the deferral`() {
        val hold = bitstream()
        hold.onCapabilitiesChanged(supportedNow = false, nowMs = 0)
        assertEquals(Notify.SWALLOW, hold.onCapabilitiesChanged(supportedNow = true, nowMs = 1_800))
        assertFalse(hold.onDeferredNotifyDue())
    }

    @Test
    fun `support lost past the window is forwarded`() {
        val hold = bitstream()
        hold.onCapabilitiesChanged(supportedNow = false, nowMs = 0)
        assertTrue(hold.onDeferredNotifyDue())
    }

    @Test
    fun `support back after a forwarded loss is forwarded too`() {
        // This is the recovery back onto passthrough the player did before
        // any of this existed, and it has to keep working.
        val hold = bitstream()
        hold.onCapabilitiesChanged(supportedNow = false, nowMs = 0)
        hold.onDeferredNotifyDue()
        assertEquals(Notify.FORWARD, hold.onCapabilitiesChanged(supportedNow = true, nowMs = 6_000))
    }

    @Test
    fun `a dead track during a deferred loss joins the same window`() {
        val hold = bitstream()
        hold.onCapabilitiesChanged(supportedNow = false, nowMs = 0)
        assertTrue(hold.onDeadTrack(1_000))
        assertEquals(Write.HOLD, hold.writeDecision(supportedNow = false, nowMs = 4_999))
        // Expiry is measured from the loss at 0, not the dead track at 1000.
        assertEquals(Write.RETHROW, hold.writeDecision(supportedNow = false, nowMs = 5_000))
        // The rethrow already makes the player reselect, so the deferred
        // notification must not add a second reselect on top.
        assertFalse(hold.onDeferredNotifyDue())
    }

    @Test
    fun `a route back during a joined window resumes writes and ends it`() {
        val hold = bitstream()
        hold.onCapabilitiesChanged(supportedNow = false, nowMs = 0)
        hold.onDeadTrack(1_000)
        assertEquals(Notify.SWALLOW, hold.onCapabilitiesChanged(supportedNow = true, nowMs = 1_800))
        // The listener side is done, the write side still owns the window.
        assertEquals(Write.REBUILD, hold.writeDecision(supportedNow = true, nowMs = 1_810))
        hold.onRebuilt()
        assertEquals(Write.WRITE, hold.writeDecision(supportedNow = true, nowMs = 1_900))
    }

    @Test
    fun `repeated losses never extend the window`() {
        val hold = bitstream()
        hold.onCapabilitiesChanged(supportedNow = false, nowMs = 0)
        assertEquals(Notify.SWALLOW, hold.onCapabilitiesChanged(supportedNow = false, nowMs = 3_000))
        // A dead track joining now still expires on the first loss's clock.
        hold.onDeadTrack(3_100)
        assertEquals(Write.RETHROW, hold.writeDecision(supportedNow = false, nowMs = 5_000))
    }

    @Test
    fun `pcm input always forwards`() {
        val hold = RouteFlapHold().also { it.onConfigure(bitstream = false) }
        assertEquals(Notify.FORWARD, hold.onCapabilitiesChanged(supportedNow = false, nowMs = 0))
        assertEquals(Notify.FORWARD, hold.onCapabilitiesChanged(supportedNow = true, nowMs = 1))
    }

    @Test
    fun `a new configure starts from a clean belief`() {
        val hold = bitstream()
        hold.onCapabilitiesChanged(supportedNow = false, nowMs = 0)
        hold.onDeferredNotifyDue()
        // The renderer reconfigured, so it was just told yes again.
        hold.onConfigure(bitstream = true)
        assertEquals(Notify.SWALLOW, hold.onCapabilitiesChanged(supportedNow = true, nowMs = 100))
        assertEquals(Notify.DEFER, hold.onCapabilitiesChanged(supportedNow = false, nowMs = 200))
    }

    @Test
    fun `reset clears everything`() {
        val hold = bitstream()
        hold.onCapabilitiesChanged(supportedNow = false, nowMs = 0)
        hold.onDeadTrack(100)
        hold.onReset()
        assertEquals(Write.WRITE, hold.writeDecision(supportedNow = false, nowMs = 9_999))
        assertFalse(hold.onDeferredNotifyDue())
        // Until the next configure says otherwise, the input is not bitstream.
        assertEquals(Notify.FORWARD, hold.onCapabilitiesChanged(supportedNow = false, nowMs = 10_000))
    }

    @Test
    fun `both dead object codes are recognised`() {
        assertTrue(RouteFlapHold.isDeadObjectCode(-6))
        assertTrue(RouteFlapHold.isDeadObjectCode(-32))
        assertFalse(RouteFlapHold.isDeadObjectCode(-1))
        assertFalse(RouteFlapHold.isDeadObjectCode(0))
    }
}
