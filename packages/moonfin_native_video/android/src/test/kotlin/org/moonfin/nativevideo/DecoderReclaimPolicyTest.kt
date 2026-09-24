package org.moonfin.nativevideo

import androidx.media3.common.PlaybackException
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class DecoderReclaimPolicyTest {

    private val reclaimed = PlaybackException.ERROR_CODE_DECODING_RESOURCES_RECLAIMED

    @Test
    fun `a reclaimed decoder is asked for again`() {
        assertTrue(
            DecoderReclaimPolicy.shouldRetry(
                errorCode = reclaimed,
                retriesSoFar = 0,
                playerLive = true,
            ),
        )
    }

    @Test
    fun `asking stops at the cap`() {
        assertTrue(
            DecoderReclaimPolicy.shouldRetry(
                errorCode = reclaimed,
                retriesSoFar = DecoderReclaimPolicy.MAX_RETRIES - 1,
                playerLive = true,
            ),
        )
        assertFalse(
            DecoderReclaimPolicy.shouldRetry(
                errorCode = reclaimed,
                retriesSoFar = DecoderReclaimPolicy.MAX_RETRIES,
                playerLive = true,
            ),
        )
    }

    @Test
    fun `a player on its way out is left alone`() {
        assertFalse(
            DecoderReclaimPolicy.shouldRetry(
                errorCode = reclaimed,
                retriesSoFar = 0,
                playerLive = false,
            ),
        )
    }

    @Test
    fun `every other failure is left to the retries that own it`() {
        for (errorCode in listOf(
            PlaybackException.ERROR_CODE_AUDIO_TRACK_INIT_FAILED,
            PlaybackException.ERROR_CODE_AUDIO_TRACK_WRITE_FAILED,
            PlaybackException.ERROR_CODE_DECODING_FAILED,
            PlaybackException.ERROR_CODE_DECODING_FORMAT_UNSUPPORTED,
            PlaybackException.ERROR_CODE_PARSING_CONTAINER_MALFORMED,
            PlaybackException.ERROR_CODE_IO_UNSPECIFIED,
        )) {
            assertFalse(
                "$errorCode should not be treated as a reclaimed decoder",
                DecoderReclaimPolicy.shouldRetry(
                    errorCode = errorCode,
                    retriesSoFar = 0,
                    playerLive = true,
                ),
            )
        }
    }
}
