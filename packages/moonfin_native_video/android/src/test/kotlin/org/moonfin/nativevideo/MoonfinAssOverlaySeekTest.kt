package org.moonfin.nativevideo

import java.util.concurrent.TimeUnit
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28, 35], manifest = Config.NONE)
class MoonfinAssOverlaySeekTest {
    @Test
    fun pausedSeekUsesDestinationAndSubtitleDelayWithoutClockTick() {
        val h = MoonfinAssOverlayTestHarness()
        h.overlay.timeOffsetUs = 200_000L

        // The ass-media clock may drop the seek's timestamp while paused.
        // The explicit request must use the new playback position instead.
        h.overlay.renderAtPlaybackPosition(12_345L)
        assertEquals(12_345_000L, h.lastPresentationTimeUs)
        assertEquals(12_145_000L, h.pendingTimeUs)

        h.overlay.renderAtPlaybackPosition(-1L)
        assertEquals(12_145_000L, h.pendingTimeUs)
    }

    @Test
    fun hiddenSeekUpdatesTheTimeUsedWhenAssIsReactivated() {
        val h = MoonfinAssOverlayTestHarness()
        h.overlay.timeOffsetUs = 250_000L
        h.overlay.setPrimaryVisible(false)
        h.overlay.rememberPlaybackPosition(9_500L)

        assertEquals(9_500_000L, h.lastPresentationTimeUs)
        assertEquals(9_250_000L, h.pendingTimeUs)

        h.overlay.setPrimaryVisible(true)
        h.overlay.redrawCurrentAssFrame()
        assertEquals(9_250_000L, h.pendingTimeUs)
    }

    @Test
    fun newerTimeDuringAnInFlightRenderQueuesAnotherFrame() {
        val h = MoonfinAssOverlayTestHarness()
        val executor = RecordingExecutor()
        h.useExecutor(executor)

        h.pendingTimeUs = 1_000_000L
        h.renderScheduled.set(true)
        h.renderPending.set(true)
        val worker = Thread(h.renderTask, "ass-pending-time-test")
        synchronized(h.handler) {
            worker.start()
            // The worker clears pending before it enters the native lock.
            val deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5)
            while (h.renderPending.get() && System.nanoTime() < deadline) Thread.yield()
            assertFalse("render task did not start", h.renderPending.get())

            // Same native track, but a seek changes the requested timestamp
            // while the earlier render is still blocked on the handler.
            h.pendingTimeUs = 9_000_000L
            h.renderPending.set(true)
        }
        worker.join(5_000)
        assertFalse("render task did not finish", worker.isAlive)
        assertEquals(1, executor.requests.size)
        assertTrue(h.renderScheduled.get())
    }

    @Test
    fun lateDialogueRedrawsPausedSeekButNotAfterResumeOrPrimaryOff() {
        val h = MoonfinAssOverlayTestHarness()
        h.overlay.syncNativeAssTrack(Any())
        h.overlay.timeOffsetUs = 100_000L
        h.overlay.renderAtPlaybackPosition(12_000L, waitForDialogue = true)

        // Model an initial blank render before the destination's ASS dialogue
        // is extracted. A late chunk must request that same delayed timestamp.
        h.pendingTimeUs = -1L
        h.overlay.onAssDialogueLoaded()
        assertEquals(11_900_000L, h.pendingTimeUs)

        // The loader may continue reading once normal playback resumes.
        h.overlay.stopAwaitingPausedSeekDialogue()
        h.pendingTimeUs = -1L
        h.overlay.onAssDialogueLoaded()
        assertEquals(-1L, h.pendingTimeUs)

        // A hidden primary must not wake the renderer for late dialogue.
        h.overlay.renderAtPlaybackPosition(13_000L, waitForDialogue = true)
        h.overlay.setPrimaryVisible(false)
        h.pendingTimeUs = -1L
        h.overlay.onAssDialogueLoaded()
        assertEquals(-1L, h.pendingTimeUs)
    }
}
