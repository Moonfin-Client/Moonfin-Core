package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class DisplayModeChooserTest {

    private fun mode(id: Int, width: Int, height: Int, rate: Float) =
        DisplayModeOption(id, width, height, rate)

    // A 4K set that only reaches 24Hz once it drops to 1080p. At 4K it
    // offers nothing but 50 and 60.
    private val fourKOnly24AtHd = listOf(
        mode(1, 3840, 2160, 60f),
        mode(2, 3840, 2160, 50f),
        mode(3, 1920, 1080, 60f),
        mode(4, 1920, 1080, 50f),
        mode(5, 1920, 1080, 24f),
        mode(6, 1280, 720, 60f),
    )
    private val fourKCurrent = mode(1, 3840, 2160, 60f)

    @Test
    fun `scale on tv drops to the resolution that offers 24Hz`() {
        val chosen = DisplayModeChooser.choose(
            modes = fourKOnly24AtHd,
            currentMode = fourKCurrent,
            contentFrameRate = 23.976f,
            allowResolutionChange = true,
            videoWidth = 1920,
            videoHeight = 800,
        )
        assertEquals(5, chosen?.modeId)
    }

    @Test
    fun `scale on device stays at 4K and reports no mode rather than guessing`() {
        val chosen = DisplayModeChooser.choose(
            modes = fourKOnly24AtHd,
            currentMode = fourKCurrent,
            contentFrameRate = 23.976f,
            allowResolutionChange = false,
            videoWidth = 1920,
            videoHeight = 800,
        )
        assertNull(chosen)
    }

    @Test
    fun `a mode below the video's own resolution is never chosen`() {
        val chosen = DisplayModeChooser.choose(
            modes = listOf(
                mode(1, 3840, 2160, 60f),
                mode(2, 1280, 720, 24f),
            ),
            currentMode = mode(1, 3840, 2160, 60f),
            contentFrameRate = 23.976f,
            allowResolutionChange = true,
            videoWidth = 1920,
            videoHeight = 800,
        )
        assertNull(chosen)
    }

    @Test
    fun `50Hz is never substituted for 24fps content`() {
        val chosen = DisplayModeChooser.choose(
            modes = listOf(
                mode(1, 1920, 1080, 60f),
                mode(2, 1920, 1080, 50f),
            ),
            currentMode = mode(1, 1920, 1080, 60f),
            contentFrameRate = 23.976f,
            allowResolutionChange = true,
            videoWidth = 1920,
            videoHeight = 1080,
        )
        assertNull(chosen)
    }

    @Test
    fun `the exact rate wins over a mode that doubles it`() {
        // 48Hz would show every frame twice and judder just as little, but
        // matching outright is the simpler thing to ask a display for.
        val chosen = DisplayModeChooser.choose(
            modes = listOf(
                mode(1, 1920, 1080, 60f),
                mode(2, 1920, 1080, 24f),
                mode(3, 1920, 1080, 48f),
            ),
            currentMode = mode(1, 1920, 1080, 60f),
            contentFrameRate = 24f,
            allowResolutionChange = false,
            videoWidth = 1920,
            videoHeight = 1080,
        )
        assertEquals(2, chosen?.modeId)
    }

    @Test
    fun `unknown video dimensions still switch on rate alone`() {
        val chosen = DisplayModeChooser.choose(
            modes = fourKOnly24AtHd,
            currentMode = mode(3, 1920, 1080, 60f),
            contentFrameRate = 23.976f,
            allowResolutionChange = true,
            videoWidth = 0,
            videoHeight = 0,
        )
        assertEquals(5, chosen?.modeId)
    }

    @Test
    fun `60Hz is not treated as a multiple of 23_976`() {
        assertFalse(DisplayModeChooser.isRefreshRateMultiple(60f, 23.976f))
        assertFalse(DisplayModeChooser.isRefreshRateMultiple(59.94f, 23.976f))
        assertTrue(DisplayModeChooser.isRefreshRateMultiple(23.976f, 23.976f))
        assertTrue(DisplayModeChooser.isRefreshRateMultiple(47.952f, 23.976f))
        assertTrue(DisplayModeChooser.isRefreshRateMultiple(60f, 30f))
    }

    @Test
    fun `a container's loose rate snaps onto the standard one`() {
        assertEquals(23.976f, DisplayModeChooser.normalizeFrameRate(23.976025f), 0.0001f)
        assertEquals(25f, DisplayModeChooser.normalizeFrameRate(25.0002f), 0.0001f)
        // Far enough from any standard to be left alone.
        assertEquals(40f, DisplayModeChooser.normalizeFrameRate(40f), 0.0001f)
    }
}
