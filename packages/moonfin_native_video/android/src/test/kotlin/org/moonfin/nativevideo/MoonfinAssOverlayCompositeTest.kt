package org.moonfin.nativevideo

import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Rect
import io.github.peerless2012.ass.AssFrame
import io.github.peerless2012.ass.AssTex
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotSame
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.moonfin.nativevideo.MoonfinAssOverlayTestHarness.Piece
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import org.robolectric.annotation.GraphicsMode

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28, 35], manifest = Config.NONE)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
class MoonfinAssOverlayCompositeTest {

    // libass colors are RGBA with an inverted alpha byte: 0x00 is opaque.
    private val red = 0xFF000000.toInt()
    private val blue = 0x0000FF00

    @Test
    fun flattensImagesIntoOneTintedBitmapAndRecyclesThePieces() {
        val h = MoonfinAssOverlayTestHarness()
        h.overlay.syncNativeAssTrack(Any())
        val frame = h.alphaFrame(
            Piece(x = 10, y = 20, w = 4, h = 2, assColor = red),
            // Drawn later, so it covers the red where they overlap.
            Piece(x = 12, y = 21, w = 2, h = 2, assColor = blue),
        )

        h.publishFrame(frame)

        assertSame(frame, h.visibleFrame())
        val composite = requireNotNull(h.cachedComposite())
        assertEquals(10, composite.left)
        assertEquals(20, composite.top)
        assertEquals(4, composite.bitmap.width)
        assertEquals(3, composite.bitmap.height)
        assertEquals(Color.RED, composite.bitmap.getPixel(0, 0))
        assertEquals(Color.RED, composite.bitmap.getPixel(1, 1))
        assertEquals(Color.BLUE, composite.bitmap.getPixel(2, 1))
        assertEquals(Color.BLUE, composite.bitmap.getPixel(3, 2))
        assertEquals(Color.TRANSPARENT, composite.bitmap.getPixel(0, 2))
        assertEquals(listOf(Rect(10, 20, 14, 22), Rect(12, 21, 14, 23)), composite.ink)
        frame.images!!.forEach { assertTrue(it.bitmap!!.isRecycled) }
    }

    @Test
    fun manyBusyFramesRecycleEveryImageAndKeepABoundedPool() {
        val h = MoonfinAssOverlayTestHarness()
        h.overlay.syncNativeAssTrack(Any())
        val frames = (0 until 200).map { n ->
            h.alphaFrame(
                *Array(40) { i -> Piece(x = i * 3 + n % 7, y = 900 + i % 5, w = 8, h = 12, assColor = red) },
            )
        }

        frames.forEach { frame ->
            h.publishFrame(frame)
            h.buffers.markDrawn(h.cachedComposite()?.bitmap)
        }

        frames.forEach { frame -> frame.images!!.forEach { assertTrue(it.bitmap!!.isRecycled) } }
        assertTrue("buffers: ${h.buffers.size}", h.buffers.size <= 3)
    }

    @Test
    fun pixellessFrameReplacesTheCaptionForLaterUnchangedRenders() {
        val h = MoonfinAssOverlayTestHarness()
        h.overlay.syncNativeAssTrack(Any())
        h.publishFrame(h.alphaFrame(Piece(x = 5, y = 5, w = 3, h = 3, assColor = red)))

        // ass-kt leaves the bitmap null for a zero-sized image. libass still
        // counts this as its latest output, so an unchanged render must not
        // bring the earlier caption back.
        val pixelless = AssFrame(arrayOf(AssTex(1, 1, 0, 0, red, null)), changed = 2)
        h.publishFrame(pixelless)
        h.publishFrame(AssFrame(images = null, changed = 0))

        assertSame(pixelless, h.visibleFrame())
        assertNull(h.cachedComposite())
    }

    @Test
    fun failedFlattenDoesNotLetAnUnchangedRenderBringBackTheOldCaption() {
        val h = MoonfinAssOverlayTestHarness()
        h.overlay.syncNativeAssTrack(Any())
        h.publishFrame(h.alphaFrame(Piece(x = 5, y = 5, w = 3, h = 3, assColor = red)))

        // A bounding box too wide for one bitmap makes the composite fail.
        val failing = h.alphaFrame(
            Piece(x = -1_100_000_000, y = 0, w = 1, h = 1, assColor = red),
            Piece(x = 1_100_000_000, y = 0, w = 1, h = 1, assColor = red),
        )
        h.publishFrame(failing)
        h.publishFrame(AssFrame(images = null, changed = 0))

        assertSame(failing, h.visibleFrame())
        assertNull(h.cachedComposite())
        assertTrue(failing.images!!.all { it.bitmap!!.isRecycled })
    }

    @Test
    fun staleFrameIsRecycledWithoutBeingShown() {
        val h = MoonfinAssOverlayTestHarness()
        h.overlay.syncNativeAssTrack(Any())
        val staleGeneration = h.generation
        h.overlay.syncNativeAssTrack(Any())
        val frame = h.alphaFrame(Piece(x = 5, y = 5, w = 3, h = 3, assColor = red))

        h.publishFrame(frame, staleGeneration)

        assertNull(h.cachedFrame())
        frame.images!!.forEach { assertTrue(it.bitmap!!.isRecycled) }
    }

    @Test
    fun softwareDrawsShowTheCompositeButDoNotFreeBuffers() {
        val h = MoonfinAssOverlayTestHarness()
        h.overlay.syncNativeAssTrack(Any())
        h.publishFrame(h.alphaFrame(Piece(x = 5, y = 6, w = 3, h = 3, assColor = red)))
        val first = requireNotNull(h.cachedComposite()).bitmap
        h.buffers.markDrawn(first)
        h.publishFrame(h.alphaFrame(Piece(x = 5, y = 6, w = 3, h = 3, assColor = blue)))

        val snapshot = Bitmap.createBitmap(20, 20, Bitmap.Config.ARGB_8888)
        repeat(3) { h.overlay.draw(Canvas(snapshot)) }
        h.publishFrame(h.alphaFrame(Piece(x = 5, y = 6, w = 3, h = 3, assColor = red)))

        assertEquals(Color.BLUE, snapshot.getPixel(6, 7))
        assertEquals(Color.TRANSPARENT, snapshot.getPixel(4, 7))
        // Only hardware draws prove hwui let go of the first buffer.
        assertNotSame(first, h.cachedComposite()?.bitmap)
    }

    @Test
    fun drawnBufferIsReusedOnlyAfterTwoLaterDraws() {
        val buffers = AssCompositeBuffers()
        val first = buffers.acquire(10, 10, current = null)
        buffers.markDrawn(first)

        val second = buffers.acquire(10, 10, current = first)
        assertNotSame(first, second)
        buffers.markDrawn(second)

        // The draw that replaced it in the display list may not have synced yet.
        val third = buffers.acquire(10, 10, current = second)
        assertNotSame(first, third)
        assertNotSame(second, third)
        buffers.markDrawn(third)

        // Two draws later, it's safe to hand out again.
        assertSame(first, buffers.acquire(10, 10, current = third))
    }

    @Test
    fun neverDrawnBufferIsReusedAtOnce() {
        val buffers = AssCompositeBuffers()
        val shown = buffers.acquire(10, 10, current = null)
        buffers.markDrawn(shown)
        // A frame rendered into this one was replaced before onDraw ran.
        val skipped = buffers.acquire(10, 10, current = shown)

        assertSame(skipped, buffers.acquire(10, 10, current = shown))
    }

    @Test
    fun reusedBufferIsResizedAndCleared() {
        val buffers = AssCompositeBuffers()
        val first = buffers.acquire(30, 20, current = null)
        first.eraseColor(Color.RED)
        val other = buffers.acquire(30, 20, current = first)

        val reused = buffers.acquire(12, 7, current = other)

        assertSame(first, reused)
        assertEquals(12, reused.width)
        assertEquals(7, reused.height)
        assertEquals(Bitmap.Config.ARGB_8888, reused.config)
        assertEquals(Color.TRANSPARENT, reused.getPixel(5, 5))
    }

    @Test
    fun poolStaysBoundedAndNeverReturnsTheBitmapOnScreenWhenNothingIsDrawn() {
        val buffers = AssCompositeBuffers()
        var current: Bitmap? = null
        repeat(50) { n ->
            buffers.markDrawn(current)
            // Growing captions force fresh allocations rather than reuse.
            val next = buffers.acquire(100 + n * 70, 50, current)
            assertNotSame(current, next)
            current = next
        }
        assertTrue("buffers: ${buffers.size}", buffers.size <= 3)
    }
}
