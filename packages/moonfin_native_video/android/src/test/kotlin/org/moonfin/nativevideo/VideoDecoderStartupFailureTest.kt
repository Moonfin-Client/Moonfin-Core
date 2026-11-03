package org.moonfin.nativevideo

import androidx.media3.common.C
import androidx.media3.common.PlaybackException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Test

class VideoDecoderStartupFailureTest {
    private val policy = VideoDecoderStartupFailure()
    private val token = 17

    private fun begin() = policy.beginSource(token)

    private fun failure(
        code: Int = PlaybackException.ERROR_CODE_DECODER_INIT_FAILED,
        renderer: Boolean = true,
        type: Int? = C.TRACK_TYPE_VIDEO,
        mime: String? = "video/avc",
        protected: Boolean = false,
    ) = policy.onFailure(token, code, renderer, type, mime, protected)

    @Test
    fun `typed video startup failure is terminal after Media3 fallback`() {
        begin()
        assertEquals(
            VideoDecoderStartupFailure.Action.REPORT_TERMINAL,
            failure(PlaybackException.ERROR_CODE_DECODER_INIT_FAILED),
        )
        assertEquals(
            VideoDecoderStartupFailure.Action.REPORT_TERMINAL,
            failure(PlaybackException.ERROR_CODE_DECODING_FAILED),
        )
    }

    @Test
    fun `audio unknown and non renderer failures stay with existing recovery`() {
        begin()
        assertEquals(VideoDecoderStartupFailure.Action.IGNORE, failure(type = C.TRACK_TYPE_AUDIO))
        assertEquals(VideoDecoderStartupFailure.Action.IGNORE, failure(type = null))
        assertEquals(VideoDecoderStartupFailure.Action.IGNORE, failure(renderer = false))
        assertEquals(
            VideoDecoderStartupFailure.Action.IGNORE,
            failure(code = PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_FAILED),
        )
        assertEquals(
            VideoDecoderStartupFailure.Action.REPORT_TERMINAL,
            failure(code = PlaybackException.ERROR_CODE_DECODING_FAILED),
        )
    }

    @Test
    fun `DRM and formats without typed video MIME are excluded`() {
        begin()
        assertEquals(VideoDecoderStartupFailure.Action.IGNORE, failure(protected = true))
        assertEquals(
            VideoDecoderStartupFailure.Action.IGNORE,
            policy.onFailure(token, PlaybackException.ERROR_CODE_DECODER_INIT_FAILED, true,
                C.TRACK_TYPE_VIDEO, "video/avc", false, hasDrmCause = true),
        )
        assertEquals(VideoDecoderStartupFailure.Action.IGNORE, failure(mime = null))
        assertEquals(VideoDecoderStartupFailure.Action.IGNORE, failure(mime = "audio/mp4a-latm"))
        assertEquals(
            VideoDecoderStartupFailure.Action.REPORT_TERMINAL,
            failure(mime = "video/hevc"),
        )
    }

    @Test
    fun `nested reclaimed decoder failures remain outside the shortcut`() {
        begin()
        assertEquals(
            VideoDecoderStartupFailure.Action.IGNORE,
            policy.onFailure(token, PlaybackException.ERROR_CODE_DECODING_FAILED, true,
                C.TRACK_TYPE_VIDEO, "video/avc", false, hasReclaimedDecoderCause = true),
        )
        assertEquals(VideoDecoderStartupFailure.Action.REPORT_TERMINAL, failure())
    }

    @Test
    fun `only actual first rendered frame excludes startup failures`() {
        begin()
        policy.onRenderedFirstFrame(token + 1)
        assertEquals(VideoDecoderStartupFailure.Action.REPORT_TERMINAL, failure())
        policy.beginSource(token + 1)
        policy.onRenderedFirstFrame(token + 1)
        assertEquals(
            VideoDecoderStartupFailure.Action.IGNORE,
            policy.onFailure(
                token + 1,
                PlaybackException.ERROR_CODE_DECODING_FAILED,
                true,
                C.TRACK_TYPE_VIDEO,
                "video/avc",
                false,
            ),
        )
    }

    @Test
    fun `new source starts classification and stale source errors are ignored`() {
        begin()
        assertEquals(VideoDecoderStartupFailure.Action.REPORT_TERMINAL, failure())
        assertEquals(
            VideoDecoderStartupFailure.Action.IGNORE,
            policy.onFailure(
                token - 1,
                PlaybackException.ERROR_CODE_DECODER_INIT_FAILED,
                true,
                C.TRACK_TYPE_VIDEO,
                "video/avc",
                false,
            ),
        )
        policy.beginSource(token + 1)
        assertEquals(
            VideoDecoderStartupFailure.Action.REPORT_TERMINAL,
            policy.onFailure(
                token + 1,
                PlaybackException.ERROR_CODE_DECODER_INIT_FAILED,
                true,
                C.TRACK_TYPE_VIDEO,
                "video/avc",
                false,
            ),
        )
    }

    @Test
    fun `terminal event carries the shared typed player error contract`() {
        val eventId = VideoDecoderStartupFailure.nextTerminalEventId(token)
        assertEquals(
            mapOf(
                "event" to "playerError",
                "decoderFailureEventId" to eventId,
                "recoverable" to true,
                "kind" to "video_decoder_failure",
                "code" to PlaybackException.ERROR_CODE_DECODING_FAILED,
                "errorCodeName" to "ERROR_CODE_DECODING_FAILED",
                "message" to "renderer failed",
                "cause" to "CodecException: init failed",
            ),
            VideoDecoderStartupFailure.terminalEvent(
                eventId,
                PlaybackException.ERROR_CODE_DECODING_FAILED,
                "ERROR_CODE_DECODING_FAILED",
                "renderer failed",
                "CodecException: init failed",
            ),
        )
        assertEquals(
            mapOf(
                "event" to "error",
                "decoderFailureEventId" to eventId,
                "message" to "renderer failed",
                "errorCodeName" to "ERROR_CODE_DECODING_FAILED",
                "cause" to "CodecException: init failed",
            ),
            VideoDecoderStartupFailure.pairedGenericErrorEvent(
                eventId,
                "ERROR_CODE_DECODING_FAILED",
                "renderer failed",
                "CodecException: init failed",
            ),
        )
        assertNotEquals(eventId, VideoDecoderStartupFailure.nextTerminalEventId(token))
    }

    @Test
    fun `display mode switch retry runs before the startup shortcut`() {
        begin()
        assertEquals(
            VideoDecoderStartupFailure.Action.IGNORE,
            policy.onFailure(token, PlaybackException.ERROR_CODE_DECODER_INIT_FAILED, true,
                C.TRACK_TYPE_VIDEO, "video/avc", false, displayModeRetryAvailable = true),
        )
        assertEquals(
            VideoDecoderStartupFailure.Action.REPORT_TERMINAL,
            policy.onFailure(token, PlaybackException.ERROR_CODE_DECODER_INIT_FAILED, true,
                C.TRACK_TYPE_VIDEO, "video/avc", false, displayModeRetryAvailable = false),
        )
    }
}
