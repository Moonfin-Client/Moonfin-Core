package org.moonfin.nativevideo

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class PictureSamplingTrustTest {

    @Test
    fun `a surface still reading black past the timeout is given up on`() {
        assertTrue(
            pictureSamplingCannotSeeSurface(
                samplingProven = false,
                firstBlackAtMs = 1_000L,
                nowMs = 1_000L + PICTURE_TRUST_TIMEOUT_MS,
            ),
        )
    }

    @Test
    fun `a short run of black is still believed`() {
        assertFalse(
            pictureSamplingCannotSeeSurface(
                samplingProven = false,
                firstBlackAtMs = 1_000L,
                nowMs = 1_000L + PICTURE_TRUST_TIMEOUT_MS - 1,
            ),
        )
    }

    @Test
    fun `a surface that has shown a picture keeps its black readings`() {
        assertFalse(
            pictureSamplingCannotSeeSurface(
                samplingProven = true,
                firstBlackAtMs = 1_000L,
                nowMs = 1_000L + PICTURE_TRUST_TIMEOUT_MS * 10,
            ),
        )
    }

    @Test
    fun `nothing is decided before the first black reading`() {
        assertFalse(
            pictureSamplingCannotSeeSurface(
                samplingProven = false,
                firstBlackAtMs = 0L,
                nowMs = 90_000L,
            ),
        )
    }
}
