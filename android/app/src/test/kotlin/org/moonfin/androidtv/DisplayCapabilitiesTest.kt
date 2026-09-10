package org.moonfin.androidtv

import android.view.Display
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class DisplayCapabilitiesTest {

    @Test
    fun `known hdr types map to the names dart expects`() {
        val names = DisplayCapabilities.hdrTypeNames(
            intArrayOf(
                Display.HdrCapabilities.HDR_TYPE_DOLBY_VISION,
                Display.HdrCapabilities.HDR_TYPE_HDR10,
                Display.HdrCapabilities.HDR_TYPE_HDR10_PLUS,
                Display.HdrCapabilities.HDR_TYPE_HLG,
            ),
        )
        assertEquals(listOf("DOLBY_VISION", "HDR10", "HDR10_PLUS", "HLG"), names)
    }

    @Test
    fun `an unknown hdr type survives as its number`() {
        assertEquals(listOf("99"), DisplayCapabilities.hdrTypeNames(intArrayOf(99)))
    }

    @Test
    fun `a null array is not the same as an empty one`() {
        // Both come back empty here, the difference is carried by the
        // "answered" fact, which is what keeps a display that couldn't reply
        // from being recorded as one that reported no HDR.
        assertTrue(DisplayCapabilities.hdrTypeNames(null).isEmpty())
        assertTrue(DisplayCapabilities.hdrTypeNames(intArrayOf()).isEmpty())
    }

    @Test
    fun `suspended and vr states still count as powered on`() {
        assertEquals(DisplayCapabilities.STATE_ON, DisplayCapabilities.displayStateName(Display.STATE_ON))
        assertEquals(
            DisplayCapabilities.STATE_ON,
            DisplayCapabilities.displayStateName(Display.STATE_ON_SUSPEND),
        )
        assertEquals(DisplayCapabilities.STATE_ON, DisplayCapabilities.displayStateName(Display.STATE_VR))
    }

    @Test
    fun `off and dozing states are not powered on`() {
        assertEquals(DisplayCapabilities.STATE_OFF, DisplayCapabilities.displayStateName(Display.STATE_OFF))
        assertEquals(
            DisplayCapabilities.STATE_DOZE,
            DisplayCapabilities.displayStateName(Display.STATE_DOZE),
        )
        assertEquals(
            DisplayCapabilities.STATE_DOZE,
            DisplayCapabilities.displayStateName(Display.STATE_DOZE_SUSPEND),
        )
    }

    @Test
    fun `an unrecognized state reports unknown rather than guessing`() {
        assertEquals(DisplayCapabilities.STATE_UNKNOWN, DisplayCapabilities.displayStateName(0))
        assertEquals(DisplayCapabilities.STATE_UNKNOWN, DisplayCapabilities.displayStateName(42))
    }
}
