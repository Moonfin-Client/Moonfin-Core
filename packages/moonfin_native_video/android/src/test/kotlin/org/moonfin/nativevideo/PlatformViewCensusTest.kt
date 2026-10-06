package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Test

class PlatformViewCensusTest {

    @Test
    fun `no views reads as none`() {
        assertEquals("none", describeViews(emptyMap()))
    }

    @Test
    fun `kinds come out in name order with a count past one`() {
        assertEquals(
            "media3-main,media3-preview*2",
            describeViews(mapOf("media3-preview" to 2, "media3-main" to 1)),
        )
    }
}
