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

    private val fourKRefreshModes = listOf(
        mode(1, 3840, 2160, 23.976f),
        mode(2, 3840, 2160, 29.97f),
        mode(3, 3840, 2160, 59.94f),
    )

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
    fun `film keeps its own rate over a mode that doubles it`() {
        // 48Hz would show every frame twice and judder just as little, but
        // film stays at its own rate; only 25 and 29.97/30 prefer double.
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
    fun `29_97 content stays on the current 59_94 mode`() {
        val chosen = DisplayModeChooser.choose(
            modes = fourKRefreshModes,
            currentMode = fourKRefreshModes[0],
            contentFrameRate = 29.97f,
            allowResolutionChange = false,
            videoWidth = 3840,
            videoHeight = 2160,
            displayMode = fourKRefreshModes[2],
        )
        assertEquals(3, chosen?.modeId)
    }

    @Test
    fun `59_94 content stays on the current 59_94 mode`() {
        val chosen = DisplayModeChooser.choose(
            modes = fourKRefreshModes,
            currentMode = fourKRefreshModes[0],
            contentFrameRate = 59.94f,
            allowResolutionChange = false,
            videoWidth = 3840,
            videoHeight = 2160,
            displayMode = fourKRefreshModes[2],
        )
        assertEquals(3, chosen?.modeId)
    }

    @Test
    fun `25fps content stays on the current 50Hz mode`() {
        val mode50 = mode(1, 1920, 1080, 50f)
        val chosen = DisplayModeChooser.choose(
            modes = listOf(mode50, mode(2, 1920, 1080, 25f)),
            currentMode = mode(3, 1920, 1080, 60f),
            contentFrameRate = 25f,
            allowResolutionChange = false,
            videoWidth = 1920,
            videoHeight = 1080,
            displayMode = mode50,
        )
        assertEquals(1, chosen?.modeId)
    }

    @Test
    fun `23_976 content still switches from the current 59_94 mode`() {
        val chosen = DisplayModeChooser.choose(
            modes = fourKRefreshModes,
            currentMode = fourKRefreshModes[0],
            contentFrameRate = 23.976f,
            allowResolutionChange = false,
            videoWidth = 3840,
            videoHeight = 2160,
            displayMode = fourKRefreshModes[2],
        )
        assertEquals(1, chosen?.modeId)
    }

    @Test
    fun `24fps content still switches from the current 60Hz mode`() {
        val modes = listOf(mode(1, 1920, 1080, 24f), mode(2, 1920, 1080, 60f))
        val chosen = DisplayModeChooser.choose(
            modes = modes,
            currentMode = modes[0],
            contentFrameRate = 24f,
            allowResolutionChange = false,
            videoWidth = 1920,
            videoHeight = 1080,
            displayMode = modes[1],
        )
        assertEquals(1, chosen?.modeId)
    }

    @Test
    fun `scale on tv switches from a carried 720p mode for 4k video`() {
        val modes = listOf(
            mode(1, 1280, 720, 59.94f),
            mode(2, 3840, 2160, 29.97f),
            mode(3, 3840, 2160, 59.94f),
        )
        val chosen = DisplayModeChooser.choose(
            modes = modes,
            currentMode = mode(4, 3840, 2160, 59.94f),
            contentFrameRate = 29.97f,
            allowResolutionChange = true,
            videoWidth = 3840,
            videoHeight = 2160,
            displayMode = modes[0],
        )
        assertEquals(3, chosen?.modeId)
    }

    @Test
    fun `without a current mode 29_97 content prefers 59_94`() {
        val chosen = DisplayModeChooser.choose(
            modes = fourKRefreshModes,
            currentMode = fourKRefreshModes[0],
            contentFrameRate = 29.97f,
            allowResolutionChange = false,
            videoWidth = 3840,
            videoHeight = 2160,
        )
        assertEquals(3, chosen?.modeId)
    }

    @Test
    fun `29_97 content switches from a film mode to 59_94 rather than 29_97`() {
        val chosen = DisplayModeChooser.choose(
            modes = fourKRefreshModes,
            currentMode = fourKRefreshModes[0],
            contentFrameRate = 29.97f,
            allowResolutionChange = false,
            videoWidth = 3840,
            videoHeight = 2160,
            displayMode = fourKRefreshModes[0],
        )
        assertEquals(3, chosen?.modeId)
    }

    @Test
    fun `25fps content prefers 50Hz over 25Hz`() {
        val modes = listOf(mode(1, 1920, 1080, 25f), mode(2, 1920, 1080, 50f))
        val chosen = DisplayModeChooser.choose(
            modes = modes,
            currentMode = modes[0],
            contentFrameRate = 25f,
            allowResolutionChange = false,
            videoWidth = 1920,
            videoHeight = 1080,
        )
        assertEquals(2, chosen?.modeId)
    }

    @Test
    fun `scale on tv moves a fitting 4k mode down to the video's resolution`() {
        val modes = listOf(mode(1, 3840, 2160, 60f), mode(2, 1920, 1080, 60f))
        val chosen = DisplayModeChooser.choose(
            modes = modes,
            currentMode = modes[0],
            contentFrameRate = 60f,
            allowResolutionChange = true,
            videoWidth = 1920,
            videoHeight = 1080,
            displayMode = modes[0],
        )
        assertEquals(2, chosen?.modeId)
    }

    @Test
    fun `scale on tv keeps a fitting mode already at the video's resolution`() {
        val modes = listOf(mode(1, 3840, 2160, 59.94f), mode(2, 1920, 1080, 59.94f), mode(3, 1920, 1080, 29.97f))
        val chosen = DisplayModeChooser.choose(
            modes = modes,
            currentMode = modes[0],
            contentFrameRate = 29.97f,
            allowResolutionChange = true,
            videoWidth = 1920,
            videoHeight = 1080,
            displayMode = modes[1],
        )
        assertEquals(2, chosen?.modeId)
    }

    @Test
    fun `scale on tv without the video's size stays at the display's resolution`() {
        val modes = listOf(
            mode(4, 3840, 2160, 59.94f),
            mode(16, 1920, 1080, 59.94f),
            mode(18, 1280, 720, 59.94f),
        )
        val chosen = DisplayModeChooser.choose(
            modes = modes,
            currentMode = modes[0],
            contentFrameRate = 29.97f,
            allowResolutionChange = true,
            videoWidth = 0,
            videoHeight = 0,
            displayMode = modes[2],
        )
        assertEquals(18, chosen?.modeId)
    }

    @Test
    fun `a rate fits the display whatever its resolution`() {
        val modes = listOf(mode(1, 1920, 1080, 59.94f), mode(2, 1280, 720, 23.976f))
        assertTrue(DisplayModeChooser.refreshRateFits(59.94f, 29.97f, modes))
        assertFalse(DisplayModeChooser.refreshRateFits(59.94f, 23.976f, modes))
        // 60Hz only passes when nothing in the 1000/1001 family is offered.
        assertFalse(DisplayModeChooser.refreshRateFits(60f, 29.97f, modes))
        assertTrue(DisplayModeChooser.refreshRateFits(60f, 29.97f, listOf(mode(3, 1920, 1080, 60f))))
    }

    @Test
    fun `59_94 content does not double to 119_88`() {
        val modes = listOf(mode(1, 1920, 1080, 59.94f), mode(2, 1920, 1080, 119.88f))
        val chosen = DisplayModeChooser.choose(
            modes = modes,
            currentMode = modes[0],
            contentFrameRate = 59.94f,
            allowResolutionChange = false,
            videoWidth = 1920,
            videoHeight = 1080,
            displayMode = mode(3, 1920, 1080, 60f),
        )
        assertEquals(1, chosen?.modeId)
    }

    @Test
    fun `a current 60Hz mode is not kept for 59_94 content when 59_94 exists`() {
        val modes = listOf(mode(1, 3840, 2160, 60f), mode(2, 3840, 2160, 59.94f))
        val chosen = DisplayModeChooser.choose(
            modes = modes,
            currentMode = modes[0],
            contentFrameRate = 59.94f,
            allowResolutionChange = false,
            videoWidth = 3840,
            videoHeight = 2160,
            displayMode = modes[0],
        )
        assertEquals(2, chosen?.modeId)
    }

    @Test
    fun `a current 24Hz mode is not kept for 23_976 content when 23_976 exists`() {
        val modes = listOf(mode(1, 1920, 1080, 24f), mode(2, 1920, 1080, 23.976f))
        val chosen = DisplayModeChooser.choose(
            modes = modes,
            currentMode = modes[0],
            contentFrameRate = 23.976f,
            allowResolutionChange = false,
            videoWidth = 1920,
            videoHeight = 1080,
            displayMode = modes[0],
        )
        assertEquals(2, chosen?.modeId)
    }

    @Test
    fun `a near mode in use stays when the display has no exact one`() {
        val modes = listOf(mode(1, 1920, 1080, 60f), mode(2, 1920, 1080, 30f))
        val chosen = DisplayModeChooser.choose(
            modes = modes,
            currentMode = modes[0],
            contentFrameRate = 29.97f,
            allowResolutionChange = false,
            videoWidth = 1920,
            videoHeight = 1080,
            displayMode = modes[0],
        )
        assertEquals(1, chosen?.modeId)
    }

    @Test
    fun `exact multiples separate the 1000_1001 rates from their integer siblings`() {
        assertTrue(DisplayModeChooser.isExactRefreshRateMultiple(59.94f, 29.97f))
        assertTrue(DisplayModeChooser.isExactRefreshRateMultiple(59.94006f, 29.97003f))
        assertTrue(DisplayModeChooser.isExactRefreshRateMultiple(50f, 25f))
        assertTrue(DisplayModeChooser.isExactRefreshRateMultiple(23.976f, 23.976f))
        assertFalse(DisplayModeChooser.isExactRefreshRateMultiple(60f, 29.97f))
        assertFalse(DisplayModeChooser.isExactRefreshRateMultiple(60f, 59.94f))
        assertFalse(DisplayModeChooser.isExactRefreshRateMultiple(24f, 23.976f))
        assertFalse(DisplayModeChooser.isExactRefreshRateMultiple(59.94f, 23.976f))
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
