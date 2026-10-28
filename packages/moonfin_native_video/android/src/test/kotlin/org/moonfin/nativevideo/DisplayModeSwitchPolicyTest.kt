package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class DisplayModeSwitchPolicyTest {

    @Test
    fun `a video after a video keeps the mode the last one set`() {
        assertTrue(
            DisplayModeSwitchPolicy.keepModeForNextSource(
                isMainPlayer = true,
                switchingEnabled = true,
                nextIsAudio = false,
                nextFrameRateKnown = true,
            ),
        )
    }

    @Test
    fun `audio gives the display back`() {
        assertFalse(
            DisplayModeSwitchPolicy.keepModeForNextSource(
                isMainPlayer = true,
                switchingEnabled = true,
                nextIsAudio = true,
                nextFrameRateKnown = true,
            ),
        )
    }

    @Test
    fun `a video with no known rate gives the display back`() {
        assertFalse(
            DisplayModeSwitchPolicy.keepModeForNextSource(
                isMainPlayer = true,
                switchingEnabled = true,
                nextIsAudio = false,
                nextFrameRateKnown = false,
            ),
        )
    }

    @Test
    fun `with switching off there is no mode to keep`() {
        assertFalse(
            DisplayModeSwitchPolicy.keepModeForNextSource(
                isMainPlayer = true,
                switchingEnabled = false,
                nextIsAudio = false,
                nextFrameRateKnown = true,
            ),
        )
    }

    @Test
    fun `a preview never owns the mode`() {
        assertFalse(
            DisplayModeSwitchPolicy.keepModeForNextSource(
                isMainPlayer = false,
                switchingEnabled = true,
                nextIsAudio = false,
                nextFrameRateKnown = true,
            ),
        )
    }

    @Test
    fun `asking for the mode the display is already in renegotiates nothing`() {
        assertFalse(
            DisplayModeSwitchPolicy.requestChangesPhysicalMode(
                currentModeId = 2,
                targetModeId = 2,
            ),
        )
    }

    @Test
    fun `the first reading of the display is only a baseline`() {
        assertFalse(
            DisplayModeSwitchPolicy.observedModeChange(
                previousModeId = null,
                currentModeId = 2,
            ),
        )
    }

    @Test
    fun `a display that reports the same mode has not switched`() {
        assertFalse(
            DisplayModeSwitchPolicy.observedModeChange(
                previousModeId = 2,
                currentModeId = 2,
            ),
        )
    }

    @Test
    fun `a display whose mode moved is renegotiating whoever asked`() {
        assertTrue(
            DisplayModeSwitchPolicy.observedModeChange(
                previousModeId = 4,
                currentModeId = 2,
            ),
        )
    }

    @Test
    fun `with switching off a mode change is never ours to recover`() {
        assertFalse(
            DisplayModeSwitchPolicy.ownsObservedModeChange(
                switchingEnabled = false,
                holdingMode = true,
                msSinceOwnRestore = 100L,
            ),
        )
    }

    @Test
    fun `a mode change nobody here asked for is left alone`() {
        assertFalse(
            DisplayModeSwitchPolicy.ownsObservedModeChange(
                switchingEnabled = true,
                holdingMode = false,
                msSinceOwnRestore = null,
            ),
        )
    }

    @Test
    fun `a change while this player holds the mode is part of its session`() {
        assertTrue(
            DisplayModeSwitchPolicy.ownsObservedModeChange(
                switchingEnabled = true,
                holdingMode = true,
                msSinceOwnRestore = null,
            ),
        )
    }

    @Test
    fun `the renegotiation after our own restore is ours until it lands`() {
        assertTrue(
            DisplayModeSwitchPolicy.ownsObservedModeChange(
                switchingEnabled = true,
                holdingMode = false,
                msSinceOwnRestore = 200L,
            ),
        )
        assertFalse(
            DisplayModeSwitchPolicy.ownsObservedModeChange(
                switchingEnabled = true,
                holdingMode = false,
                msSinceOwnRestore = DisplayModeSwitchPolicy.OWN_RESTORE_WINDOW_MS,
            ),
        )
    }

    // A 4K set that only reaches 24Hz at 1080p, the case scale on tv is for.
    private val fourKOnly24AtHd = listOf(
        DisplayModeOption(1, 3840, 2160, 60f),
        DisplayModeOption(2, 3840, 2160, 50f),
        DisplayModeOption(3, 1920, 1080, 60f),
        DisplayModeOption(5, 1920, 1080, 24f),
    )
    private val viewersFourK = DisplayModeOption(1, 3840, 2160, 60f)
    private val heldFromHdFilm = DisplayModeOption(5, 1920, 1080, 24f)

    @Test
    fun `a held mode is not where the next choice starts from`() {
        assertEquals(
            viewersFourK,
            DisplayModeSwitchPolicy.chooserReference(
                baseMode = viewersFourK,
                displayMode = heldFromHdFilm,
                holdingMode = true,
            ),
        )
    }

    @Test
    fun `without a held mode the choice starts from the display`() {
        assertEquals(
            heldFromHdFilm,
            DisplayModeSwitchPolicy.chooserReference(
                baseMode = viewersFourK,
                displayMode = heldFromHdFilm,
                holdingMode = false,
            ),
        )
    }

    @Test
    fun `a 4K film after a 1080p one is not sent out at 1080p on scale on tv`() {
        fun chooseFrom(reference: DisplayModeOption) = DisplayModeChooser.choose(
            modes = fourKOnly24AtHd,
            currentMode = reference,
            contentFrameRate = 23.976f,
            allowResolutionChange = true,
            videoWidth = 3840,
            videoHeight = 2160,
        )
        // Starting from the held 1080p24 mode would downscale the 4K video.
        assertEquals(5, chooseFrom(heldFromHdFilm)?.modeId)
        val reference = DisplayModeSwitchPolicy.chooserReference(
            baseMode = viewersFourK,
            displayMode = heldFromHdFilm,
            holdingMode = true,
        )
        assertNull(chooseFrom(reference))
    }

    @Test
    fun `asking for a different mode renegotiates the link`() {
        assertTrue(
            DisplayModeSwitchPolicy.requestChangesPhysicalMode(
                currentModeId = 2,
                targetModeId = 5,
            ),
        )
    }

    @Test
    fun `no matching mode keeps a mode carried over from the last video`() {
        // The viewer's own mode doesn't fit either, so handing it back would
        // only blink the TV under the new channel's audio.
        assertFalse(
            DisplayModeSwitchPolicy.restoreOnNoMatch(
                holdingMode = true,
                heldForCurrentSource = false,
                resolutionScaling = false,
                heldResolutionMatchesBase = true,
            ),
        )
    }

    @Test
    fun `no matching mode keeps the mode this video already chose`() {
        // Rush: 59.94 chosen from the server rate, then the MOV's 41.947
        // sample-count average fits nothing. Restoring renegotiated HDMI
        // under the opening AC-3 passthrough track.
        assertFalse(
            DisplayModeSwitchPolicy.restoreOnNoMatch(
                holdingMode = true,
                heldForCurrentSource = true,
                resolutionScaling = true,
                heldResolutionMatchesBase = false,
            ),
        )
    }

    @Test
    fun `scale on tv gives back a carried-over mode at the wrong resolution`() {
        assertTrue(
            DisplayModeSwitchPolicy.restoreOnNoMatch(
                holdingMode = true,
                heldForCurrentSource = false,
                resolutionScaling = true,
                heldResolutionMatchesBase = false,
            ),
        )
    }

    @Test
    fun `no matching mode with nothing held changes nothing`() {
        assertFalse(
            DisplayModeSwitchPolicy.restoreOnNoMatch(
                holdingMode = false,
                heldForCurrentSource = false,
                resolutionScaling = true,
                heldResolutionMatchesBase = false,
            ),
        )
    }
}
