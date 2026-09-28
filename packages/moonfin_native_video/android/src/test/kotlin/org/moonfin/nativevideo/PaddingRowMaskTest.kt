package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Test

class PaddingRowMaskTest {

    @Test
    fun `heights that are a multiple of 8 get no mask`() {
        for (height in listOf(1080, 1920, 2160, 800, 1608)) {
            assertEquals("height $height", 0, PaddingRowMask.heightPx(height, height))
        }
    }

    @Test
    fun `a 1606 row picture covers its 2 padded rows at full size`() {
        assertEquals(2, PaddingRowMask.heightPx(1606, 1606))
    }

    @Test
    fun `the mask scales with the picture and never drops below a pixel`() {
        // 1606 drawn at half size on a 1080p UI puts the 2 rows in 1 pixel.
        assertEquals(1, PaddingRowMask.heightPx(1606, 803))
        assertEquals(1, PaddingRowMask.heightPx(1606, 4))
    }

    @Test
    fun `nothing is covered before there's a picture`() {
        assertEquals(0, PaddingRowMask.heightPx(0, 803))
        assertEquals(0, PaddingRowMask.heightPx(1606, 0))
    }
}
