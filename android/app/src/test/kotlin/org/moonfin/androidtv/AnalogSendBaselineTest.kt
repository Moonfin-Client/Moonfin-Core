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

        assertFalse(offer(52))
        assertFalse(offer(103))
        assertTrue(offer(154))
    }
}
