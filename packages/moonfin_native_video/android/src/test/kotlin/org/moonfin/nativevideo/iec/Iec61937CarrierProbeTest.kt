package org.moonfin.nativevideo.iec

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class Iec61937CarrierProbeTest {

    @Test fun platformYesNeverOpensATrack() {
        var opened = 0
        val supported = Iec61937CarrierProbe.decide(
            highBitRate = true,
            platformSays = { true },
            opensTrack = {
                opened++
                false
            },
        )
        assertTrue(supported)
        assertEquals(0, opened)
    }

    @Test fun highBitRateNoFallsBackToATrack() {
        assertTrue(
            Iec61937CarrierProbe.decide(highBitRate = true, platformSays = { false }, opensTrack = { true }),
        )
        assertFalse(
            Iec61937CarrierProbe.decide(highBitRate = true, platformSays = { false }, opensTrack = { false }),
        )
    }

    @Test fun stereoNoStaysNoWithoutATrack() {
        var opened = 0
        val supported = Iec61937CarrierProbe.decide(
            highBitRate = false,
            platformSays = { false },
            opensTrack = {
                opened++
                true
            },
        )
        assertFalse(supported)
        assertEquals(0, opened)
    }
}
