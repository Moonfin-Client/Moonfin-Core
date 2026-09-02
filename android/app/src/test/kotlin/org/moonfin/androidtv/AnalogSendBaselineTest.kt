package org.moonfin.androidtv

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class AnalogSendBaselineTest {
    @Test
    fun `sub-threshold samples accumulate against the last sent value`() {
        var lastSent = 0

        fun offer(value: Int): Boolean {
            val publish = analogMovedPastSendBaseline(value, lastSent)
            if (publish) lastSent = value
            return publish
        }

        // Steps too small to publish on their own, so each one only counts
        // because the baseline stayed where the core last saw it.
        val step = ANALOG_MIN_SEND_DELTA / 2
        assertFalse(offer(step))
        // Exactly the delta is still not past it.
        assertFalse(offer(step * 2))
        assertTrue(offer(step * 3))
    }
}
