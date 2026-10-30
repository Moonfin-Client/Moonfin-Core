package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class DisplayRateSessionTest {
    private fun hold(
        session: DisplayRateSession,
        token: Int = 1,
        kind: DisplayRateSession.HoldKind = DisplayRateSession.HoldKind.STARTUP,
        nowMs: Long = 100,
        completion: () -> Unit = {},
    ) = session.installHold(
        sourceToken = token,
        kind = kind,
        quietMs = 250,
        maxWaitMs = 2_000,
        nowMs = nowMs,
        startDelayMs = 0,
        expectHdmiAudioDrop = true,
        hdmiAudioDropWindowMs = 500,
        completion = completion,
    )

    @Test
    fun `startup timeout decision and mapped track gate are source scoped`() {
        val session = DisplayRateSession()
        session.beginSource(7, playWhenReady = true)
        assertTrue(session.beginStartup(7, playWhenReady = true))

        // The adapter's measurement timeout and evidence callbacks converge here.
        assertTrue(session.decideStartup(7))
        assertFalse(session.releaseStartup(7, tracksMapped = false))
        assertEquals(DisplayRateStartup.Phase.SETTLING, session.startup.phase)
        assertFalse(session.releaseStartup(6, tracksMapped = true))
        assertTrue(session.releaseStartup(7, tracksMapped = true))
        assertFalse(session.releaseStartup(7, tracksMapped = true))
    }

    @Test
    fun `hold is detached once before callback and stale ids cannot complete it`() {
        val session = DisplayRateSession()
        session.beginSource(3, playWhenReady = true)
        val order = mutableListOf<String>()
        val first = hold(session, token = 3) { order += "completion" }!!

        assertFalse(session.matchesHold(3, first.id + 1))
        assertTrue(session.completeHold(3, first.id) {
            assertNull(session.hold)
            order += "unregister"
        })
        assertFalse(session.completeHold(3, first.id) { order += "stale unregister" })
        assertEquals(listOf("unregister", "completion"), order)
    }

    @Test
    fun `preference replacement gets a fresh settle window but keeps route away state`() {
        val session = DisplayRateSession()
        session.beginSource(4, playWhenReady = true)
        val old = hold(session, token = 4, nowMs = 100)!!
        old.settle.noteHdmiAudio(present = false)

        var replacementCompleted = false
        val replacement = hold(session, token = 4, kind = DisplayRateSession.HoldKind.CORRECTION,
            nowMs = 450) { replacementCompleted = true }!!

        assertTrue(replacement.id > old.id)
        assertEquals(450L, replacement.settle.startedAtMs)
        assertTrue(replacement.settle.isHdmiAudioAway)
        assertFalse(session.matchesHold(4, old.id))
        assertFalse(session.completeHold(4, old.id) { error("stale hold must not unregister or complete") })
        assertTrue(session.takeHold(4, replacement.id)!!.completion.let {
            it(); replacementCompleted
        })
    }

    @Test
    fun `HDMI return shortens settling and the hold deadline always ends the wait`() {
        val session = DisplayRateSession()
        session.beginSource(8, playWhenReady = true)
        val held = session.installHold(
            sourceToken = 8,
            kind = DisplayRateSession.HoldKind.CORRECTION,
            quietMs = 250,
            maxWaitMs = 1_000,
            nowMs = 100,
            startDelayMs = 80,
            expectHdmiAudioDrop = false,
            hdmiAudioDropWindowMs = 0,
            completion = {},
        )!!
        held.settle.noteHdmiAudio(present = false)
        assertEquals(1_000L - (500L - 100L), held.settle.delayAfterChange(500))
        held.settle.noteHdmiAudio(present = true)
        assertTrue(held.settle.delayAfterChange(500) <= 80L)
        assertEquals(0L, held.settle.delayAfterChange(1_100))
    }

    @Test
    fun `replacement source and stop invalidate callbacks without resuming`() {
        val session = DisplayRateSession()
        session.beginSource(5, playWhenReady = true)
        var completions = 0
        val old = hold(session, token = 5) { completions++ }!!

        session.beginSource(6, playWhenReady = false)
        assertFalse(session.matchesHold(5, old.id))
        assertNull(session.takeHold(5, old.id))
        assertEquals(0, completions)
        assertFalse(session.desiredPlayWhenReady)

        val current = hold(session, token = 6) { completions++ }!!
        session.cancelSource()
        assertNull(session.takeHold(6, current.id))
        assertEquals(0, completions)
    }

    @Test
    fun `source replaced during adapter detach cannot run old completion`() {
        val session = DisplayRateSession()
        session.beginSource(12, playWhenReady = true)
        var completions = 0
        val held = hold(session, token = 12) { completions++ }!!

        assertFalse(session.completeHold(12, held.id) {
            session.beginSource(13, playWhenReady = false)
        })
        assertEquals(0, completions)
        assertEquals(13, session.sourceToken)
    }

    @Test
    fun `viewer pause clears route ownership and prevents late ready auto resume`() {
        val session = DisplayRateSession()
        session.beginSource(9, playWhenReady = true)
        session.beginCorrection(9)

        // The adapter receives an explicit pause even if the player was already paused.
        session.requestPlayback(false)
        val completedIntent = session.completeCorrection(9)!!
        assertFalse(completedIntent)
        // A late STATE_READY callback cannot override the explicit paused intent.
        assertFalse(session.shouldResumeAfterDisplayModeSwitch(
            wasPlayingBeforeSwitch = true,
            playerPlayWhenReady = false,
        ))

        // A late noisy callback after correction completion must also respect the
        // same viewer intent when HDMI is reported as returned.
        session.correctionIntent.recordSystemPause(nowMs = 300, reason = 2)
        var routeResumed = false
        assertEquals(RateCorrectionIntent.RouteResume.NONE,
            session.handleAudioDeviceAdded(350, hasHdmiDevice = true, resumeWindowMs = 1_000) {
                routeResumed = true
            })
        assertFalse(routeResumed)
    }

    @Test
    fun `display mode recovery remains available for current play intent`() {
        val session = DisplayRateSession()
        session.beginSource(10, playWhenReady = true)
        assertTrue(session.shouldResumeAfterDisplayModeSwitch(
            wasPlayingBeforeSwitch = true,
            playerPlayWhenReady = false,
        ))
        session.requestPlayback(false)
        assertFalse(session.shouldResumeAfterDisplayModeSwitch(
            wasPlayingBeforeSwitch = true,
            playerPlayWhenReady = false,
        ))
    }

    @Test
    fun `HDMI route recovery resumes only desired play and defers during a hold`() {
        val session = DisplayRateSession()
        session.beginSource(11, playWhenReady = true)
        session.beginCorrection(11)
        session.correctionIntent.recordSystemPause(100, reason = 2)
        var routeResumed = false
        assertEquals(RateCorrectionIntent.RouteResume.DEFERRED_TO_CORRECTION,
            session.handleAudioDeviceAdded(150, hasHdmiDevice = true, resumeWindowMs = 1_000) {
                routeResumed = true
            })
        assertFalse(routeResumed)

        session.completeCorrection(11)
        session.correctionIntent.recordSystemPause(200, reason = 2)
        assertEquals(RateCorrectionIntent.RouteResume.RESUME,
            session.handleAudioDeviceAdded(250, hasHdmiDevice = true, resumeWindowMs = 1_000) {
                routeResumed = true
            })
        assertTrue(routeResumed)
    }

    @Test
    fun `prepare and correction use saved intent instead of temporary player pause`() {
        val session = DisplayRateSession()
        session.beginSource(14, playWhenReady = true)
        assertFalse(session.shouldPlayAfterPrepare(requestedPlayWhenReady = false))
        assertTrue(session.beginCorrection(14))
        assertTrue(session.correctionIntent.playWhenReady)
        assertFalse(session.shouldPlayAfterPrepare(requestedPlayWhenReady = true))
        assertEquals(true, session.completeCorrection(14))
        assertTrue(session.shouldPlayAfterPrepare(requestedPlayWhenReady = true))

        session.requestPlayback(false)
        assertFalse(session.shouldPlayAfterPrepare(requestedPlayWhenReady = true))
    }

    @Test
    fun `internal pause callback matches source player and expected reason`() {
        val session = DisplayRateSession()
        val player = Any()
        val replacementPlayer = Any()
        session.beginSource(15, playWhenReady = true)
        session.markInternalPause(player, expectedReason = 4)

        assertFalse(session.consumeInternalPause(replacementPlayer, reason = 4))
        assertFalse(session.consumeInternalPause(player, reason = 5))
        assertTrue(session.consumeInternalPause(player, reason = 4))
        assertFalse(session.consumeInternalPause(player, reason = 4))

        session.markInternalPause(player, expectedReason = 4)
        session.requestPlayback(false)
        session.requestPlayback(true)
        assertTrue(session.consumeInternalPause(player, reason = 4))
        assertTrue(session.desiredPlayWhenReady)

        session.markInternalPause(player, expectedReason = 4)
        session.beginSource(18, playWhenReady = true)
        assertFalse(session.consumeInternalPause(player, reason = 4))
    }

    @Test
    fun `posted audio rekick resumes only the same active source and player without a hold`() {
        val session = DisplayRateSession()
        val player = Any()
        val replacementPlayer = Any()
        session.beginSource(16, playWhenReady = true)
        assertTrue(session.canResumeAudioRekick(16, player, player))
        assertFalse(session.canResumeAudioRekick(16, player, replacementPlayer))

        session.beginCorrection(16)
        assertFalse(session.canResumeAudioRekick(16, player, player))
        session.completeCorrection(16)
        session.requestPlayback(false)
        assertFalse(session.canResumeAudioRekick(16, player, player))
        session.beginSource(17, playWhenReady = true)
        assertFalse(session.canResumeAudioRekick(16, player, player))
    }

    @Test
    fun `startup play after system pause skips a redundant internal false setter`() {
        val session = DisplayRateSession()
        val player = Any()
        session.beginSource(19, playWhenReady = true)
        session.beginStartup(19, playWhenReady = true)
        session.correctionIntent.recordSystemPause(100, reason = 2)
        session.requestPlayback(true)

        var setterInvoked = false
        assertFalse(session.pauseInternally(player, actualPlayWhenReady = false, expectedReason = 1) {
            setterInvoked = true
        })
        assertFalse(setterInvoked)
        assertTrue(session.decideStartup(19))
        assertTrue(session.releaseStartup(19, tracksMapped = true))
        assertTrue(session.startup.playWhenReady)
        assertTrue(session.desiredPlayWhenReady)
    }

    @Test
    fun `real internal pause records callback before setter and preserves play intent`() {
        val session = DisplayRateSession()
        val player = Any()
        session.beginSource(20, playWhenReady = true)

        var setterInvoked = false
        assertTrue(session.pauseInternally(player, actualPlayWhenReady = true, expectedReason = 1) {
            setterInvoked = true
            assertTrue(session.consumeInternalPause(player, reason = 1))
        })
        assertTrue(setterInvoked)
        assertFalse(session.consumeInternalPause(player, reason = 1))
        assertTrue(session.desiredPlayWhenReady)
    }
}
