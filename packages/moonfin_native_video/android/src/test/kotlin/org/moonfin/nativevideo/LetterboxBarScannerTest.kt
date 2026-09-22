package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class LetterboxBarScannerTest {
    @Test
    fun findsLetterboxBarsAtSourceSize() {
        val width = 192
        val height = 108
        val bar = 14
        val pixels = letterboxFrame(width, height, bar)
        val rect = LetterboxBarScanner.scanArgb(
            pixels = pixels,
            width = width,
            height = height,
            sourceWidth = 1920,
            sourceHeight = 1080,
        )
        assertNotNull(rect)
        assertEquals(0, rect!!.x)
        assertEquals(1920, rect.w)
        assertEquals(140, rect.y)
        assertEquals(800, rect.h)
    }

    @Test
    fun findsPillarbox() {
        val width = 192
        val height = 108
        val bar = 24
        val pixels = IntArray(width * height)
        val content = 0xFF808080.toInt()
        for (y in 0 until height) {
            for (x in bar until width - bar) {
                pixels[y * width + x] = content
            }
        }
        val rect = LetterboxBarScanner.scanArgb(
            pixels = pixels,
            width = width,
            height = height,
            sourceWidth = 1920,
            sourceHeight = 1080,
        )
        assertNotNull(rect)
        assertEquals(0, rect!!.y)
        assertEquals(1080, rect.h)
        assertEquals(240, rect.x)
        assertEquals(1440, rect.w)
    }

    @Test
    fun allBlackIsNull() {
        val pixels = IntArray(64 * 36)
        assertNull(
            LetterboxBarScanner.scanArgb(
                pixels = pixels,
                width = 64,
                height = 36,
                sourceWidth = 1920,
                sourceHeight = 1080,
            ),
        )
    }

    @Test
    fun fullFrameHasNoInset() {
        val width = 64
        val height = 36
        val pixels = IntArray(width * height) { 0xFF808080.toInt() }
        val rect = LetterboxBarScanner.scanArgb(
            pixels = pixels,
            width = width,
            height = height,
            sourceWidth = 1920,
            sourceHeight = 1080,
        )
        assertNotNull(rect)
        assertEquals(0, rect!!.x)
        assertEquals(0, rect.y)
        assertEquals(1920, rect.w)
        assertEquals(1080, rect.h)
    }

    @Test
    fun lumaThresholdMatchesCropdetect() {
        assertTrue(LetterboxBarScanner.luma(0xFF000000.toInt()) <= LetterboxBarScanner.LUMA_LIMIT)
        assertTrue(LetterboxBarScanner.luma(0xFF101010.toInt()) <= LetterboxBarScanner.LUMA_LIMIT)
        assertTrue(LetterboxBarScanner.luma(0xFF808080.toInt()) > LetterboxBarScanner.LUMA_LIMIT)
    }
}

class LetterboxCropLayoutTest {
    @Test
    fun coverZoomsLetterboxIntoSixteenByNine() {
        val bounds = LetterboxCropLayout.compute(
            containerWidth = 1920,
            containerHeight = 1080,
            sourceWidth = 1920f,
            sourceHeight = 1080f,
            cropX = 0f,
            cropY = 138f,
            cropW = 1920f,
            cropH = 804f,
            cover = true,
        )
        assertTrue(bounds.width > 1920)
        assertTrue(bounds.left < 0)
        assertTrue(bounds.top < 0)
        val scale = bounds.width / 1920f
        val cropTopOnScreen = bounds.top + 138f * scale
        val cropHeightOnScreen = 804f * scale
        assertEquals(0.0, cropTopOnScreen.toDouble(), 1.5)
        assertEquals(1080.0, cropHeightOnScreen.toDouble(), 1.5)
    }

    @Test
    fun fitKeepsCenteredLetterbox() {
        val bounds = LetterboxCropLayout.compute(
            containerWidth = 1920,
            containerHeight = 1080,
            sourceWidth = 1920f,
            sourceHeight = 1080f,
            cropX = 0f,
            cropY = 138f,
            cropW = 1920f,
            cropH = 804f,
            cover = false,
        )
        assertEquals(1920, bounds.width)
        assertEquals(1080, bounds.height)
        assertEquals(0, bounds.left)
        assertEquals(0, bounds.top)
    }
}

private fun letterboxFrame(width: Int, height: Int, bar: Int): IntArray {
    val pixels = IntArray(width * height)
    val content = 0xFF808080.toInt()
    for (y in bar until height - bar) {
        for (x in 0 until width) {
            pixels[y * width + x] = content
        }
    }
    return pixels
}
