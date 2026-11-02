package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class DoviInterceptModeTest {

    @Test fun readsTheProfileFromBothCodecPrefixes() {
        assertEquals(7, dolbyVisionProfile("dvhe.07.06"))
        assertEquals(8, dolbyVisionProfile("dvh1.08.06"))
        assertNull(dolbyVisionProfile("dvhe.05.06"))
        assertNull(dolbyVisionProfile("hvc1.2.4.L150.B0"))
        assertNull(dolbyVisionProfile(null))
    }

    @Test fun profile7KeepsItsOwnModeWithoutAStripRequest() {
        assertEquals(DoviCompatMode.CONVERT, doviInterceptMode(7, DoviCompatMode.CONVERT, false))
        assertEquals(DoviCompatMode.STRIP, doviInterceptMode(7, DoviCompatMode.STRIP, false))
        assertNull(doviInterceptMode(7, DoviCompatMode.NATIVE, false))
        assertNull(doviInterceptMode(7, DoviCompatMode.OFF, false))
    }

    @Test fun profile8IsOnlyTouchedWhenStripIsAskedFor() {
        assertNull(doviInterceptMode(8, DoviCompatMode.CONVERT, false))
        assertEquals(DoviCompatMode.STRIP, doviInterceptMode(8, DoviCompatMode.OFF, true))
    }

    @Test fun stripOverridesTheProfile7Mode() {
        assertEquals(DoviCompatMode.STRIP, doviInterceptMode(7, DoviCompatMode.CONVERT, true))
        assertEquals(DoviCompatMode.STRIP, doviInterceptMode(7, DoviCompatMode.NATIVE, true))
    }

    @Test fun nonDolbyVisionTracksAreLeftAlone() {
        assertNull(doviInterceptMode(null, DoviCompatMode.CONVERT, true))
    }
}
