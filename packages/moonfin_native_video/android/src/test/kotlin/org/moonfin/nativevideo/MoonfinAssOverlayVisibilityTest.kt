package org.moonfin.nativevideo

import io.github.peerless2012.ass.AssFrame
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28, 35], manifest = Config.NONE)
class MoonfinAssOverlayVisibilityTest {
    @Test
    fun firstNewTrackBitmapSurvivesAndUnchangedRetryCannotReplaceIt() {
        val h = MoonfinAssOverlayTestHarness()

        h.overlay.syncNativeAssTrack(Any())
        val previousGeneration = h.generation
        val oldFrame = h.frame(6, 9)
        h.publishFrame(oldFrame, previousGeneration)
        assertSame(oldFrame, h.cachedFrame())

        // B's native selection is now recorded before the render task can
        // snapshot its generation. An already-finished A frame is stale.
        h.overlay.syncNativeAssTrack(Any())
        val currentGeneration = h.generation
        assertTrue(currentGeneration > previousGeneration)
        // A's bitmap stays cached but is hidden until its owner is reselected.
        assertSame(oldFrame, h.cachedFrame())
        assertTrue(h.visibleFrame() == null)
        h.publishFrame(oldFrame, previousGeneration)
        assertSame(oldFrame, h.cachedFrame())

        val firstB = h.frame(12, 26)
        h.publishFrame(firstB, currentGeneration)
        assertSame(firstB, h.cachedFrame())
        assertSame(firstB, h.visibleFrame())

        // Native libass returns changed=0 with no image array on retry.
        // That can't reconstruct a B bitmap lost in the ownership handover.
        h.publishFrame(AssFrame(images = null, changed = 0), currentGeneration)
        assertSame(firstB, h.cachedFrame())
    }

    @Test
    fun rapidAssTrackABARetainsTheLastRenderedImage() {
        val h = MoonfinAssOverlayTestHarness()
        val a = Any()
        val b = Any()
        val frameA = h.frame(37, 42, changed = 2)

        assertTrue(h.overlay.syncNativeAssTrack(a))
        h.publishFrame(frameA)
        assertSame(frameA, h.visibleFrame())

        // B was selected but never rendered, so libass's next render for A
        // reports unchanged and doesn't supply a replacement bitmap.
        assertTrue(h.overlay.syncNativeAssTrack(b))
        assertSame(frameA, h.cachedFrame())
        assertTrue(h.visibleFrame() == null)

        assertTrue(h.overlay.syncNativeAssTrack(a))
        assertSame(frameA, h.visibleFrame())
        h.publishFrame(AssFrame(images = null, changed = 0))
        assertSame(frameA, h.cachedFrame())
        assertSame(frameA, h.visibleFrame())
    }

    @Test
    fun identicalPixelsTransferBitmapOwnershipAfterRenderingAnotherTrack() {
        val h = MoonfinAssOverlayTestHarness()
        val a = Any()
        val b = Any()
        val frameA = h.frame(21, 34, changed = 2)

        h.overlay.syncNativeAssTrack(a)
        h.publishFrame(frameA)
        h.overlay.syncNativeAssTrack(b)
        assertTrue(h.visibleFrame() == null)

        // libass compared B's pixels to A's most recent native render and
        // returned unchanged, but the identical image is valid for B too.
        h.publishFrame(AssFrame(images = null, changed = 0))
        assertSame(frameA, h.cachedFrame())
        assertSame(frameA, h.visibleFrame())

        // The same result must work in the opposite direction.
        h.overlay.syncNativeAssTrack(a)
        assertTrue(h.visibleFrame() == null)
        h.publishFrame(AssFrame(images = null, changed = 0))
        assertSame(frameA, h.visibleFrame())
    }

    @Test
    fun emptySelectedTrackHidesWithoutDiscardingLastNativeBitmap() {
        val h = MoonfinAssOverlayTestHarness()
        val a = Any()
        val b = Any()
        val frameA = h.frame(54, 63, changed = 2)

        h.overlay.syncNativeAssTrack(a)
        h.publishFrame(frameA)
        h.overlay.syncNativeAssTrack(b)

        // The ASS track exists from its header, but its first dialogue hasn't
        // loaded, so rendering B returns null without advancing libass's image.
        h.publishFrame(null)
        assertSame(frameA, h.cachedFrame())
        assertTrue(h.visibleFrame() == null)

        h.overlay.syncNativeAssTrack(a)
        assertTrue(h.visibleFrame() == null)
        h.publishFrame(AssFrame(images = null, changed = 0))
        assertSame(frameA, h.visibleFrame())

        // A genuinely empty current cue must hide its pixels too,
        // even though the previous bitmap remains available if libass needs it.
        h.publishFrame(null)
        assertSame(frameA, h.cachedFrame())
        assertTrue(h.visibleFrame() == null)
        h.publishFrame(null)
        assertTrue(h.visibleFrame() == null)
    }

    @Test
    fun offRenderRetainsBitmapUntilActiveTrackRendersAgain() {
        val h = MoonfinAssOverlayTestHarness()
        val track = Any()

        assertTrue(h.overlay.syncNativeAssTrack(track))
        val currentGeneration = h.generation
        val cue = h.frame(15, 25)
        h.publishFrame(cue, currentGeneration)

        h.overlay.setPrimaryVisible(false)
        assertTrue(!h.overlay.syncNativeAssTrack(null))
        // No active track: a null native return must not erase the cached cue.
        h.publishFrame(null, currentGeneration, active = false)
        assertSame(cue, h.cachedFrame())
        assertTrue(h.visibleFrame() == null)

        // Selecting the same track again is still an activation transition:
        // the player listener must ask for a render at the latest timestamp.
        assertTrue(h.overlay.syncNativeAssTrack(track))
        val resumedGeneration = h.generation
        assertTrue(resumedGeneration > currentGeneration)
        h.overlay.setPrimaryVisible(true)
        // A late Off-time result can't overwrite the reactivated track.
        h.publishFrame(null, currentGeneration, active = false)
        assertSame(cue, h.cachedFrame())
        h.publishFrame(AssFrame(images = null, changed = 0), resumedGeneration)
        assertSame(cue, h.cachedFrame())
        assertSame(cue, h.visibleFrame())

        // If playback crossed the cue's end while Off, the active render
        // returns an empty changed frame, which must clear the old caption.
        h.publishFrame(AssFrame(emptyArray(), changed = 2), resumedGeneration)
        assertTrue(h.visibleFrame() == null)
    }

    @Test
    fun differentAssTracksHideCachedFramesWithoutPlaybackTicks() {
        val h = MoonfinAssOverlayTestHarness()
        val trackA = Any()
        val trackB = Any()
        val frameA = h.frame(30, 40)

        assertTrue(h.overlay.syncNativeAssTrack(trackA))
        h.publishFrame(frameA)
        assertSame(frameA, h.visibleFrame())
        assertTrue(!h.overlay.syncNativeAssTrack(trackA))
        assertSame(frameA, h.visibleFrame())

        // A genuinely different ASS track hides A immediately while retaining
        // its cached bitmap in case A is selected again before B renders.
        assertTrue(h.overlay.syncNativeAssTrack(trackB))
        assertTrue(h.visibleFrame() == null)
        assertSame(frameA, h.cachedFrame())
        assertTrue(!h.overlay.syncNativeAssTrack(trackB))

        assertTrue(h.overlay.syncNativeAssTrack(trackA))
        assertSame(frameA, h.visibleFrame())
    }

    @Test
    fun primaryOffImmediatelyUpdatesAssVisibilityWithoutAFrameTick() {
        val h = MoonfinAssOverlayTestHarness()
        val track = Any()
        val frame = h.frame(18, 28)

        assertTrue(h.overlay.syncNativeAssTrack(track))
        h.publishFrame(frame)
        assertSame(frame, h.visibleFrame())

        h.overlay.setPrimaryVisible(false)
        assertTrue(h.visibleFrame() == null)
        h.overlay.setPrimaryVisible(false)
        assertTrue(h.visibleFrame() == null)

        // Restoring the same ASS track must not depend on a new video frame.
        h.overlay.setPrimaryVisible(true)
        assertSame(frame, h.visibleFrame())
    }
}
