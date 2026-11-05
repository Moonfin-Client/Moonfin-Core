package org.moonfin.nativevideo

import androidx.media3.common.C
import androidx.media3.common.PlaybackException

/** Source-scoped classification for typed video renderer failures before any rendered frame. */
internal class VideoDecoderStartupFailure {
    enum class Action { IGNORE, REPORT_TERMINAL }

    private var sourceToken: Int? = null
    private var renderedVideoFrame = false

    fun beginSource(token: Int) {
        sourceToken = token
        renderedVideoFrame = false
    }

    fun onRenderedFirstFrame(token: Int) {
        if (sourceToken == token) renderedVideoFrame = true
    }

    fun onFailure(
        token: Int,
        errorCode: Int,
        isRendererFailure: Boolean,
        rendererTrackType: Int?,
        rendererMimeType: String?,
        isProtectedContent: Boolean,
        hasReclaimedDecoderCause: Boolean = false,
        hasDrmCause: Boolean = false,
        displayModeRetryAvailable: Boolean = false,
    ): Action {
        // A mode switch can drop the surface under a starting decoder; its
        // in-place re-prepare gets the first try.
        if (displayModeRetryAvailable) return Action.IGNORE
        if (sourceToken != token || renderedVideoFrame || !isRendererFailure ||
            rendererTrackType != C.TRACK_TYPE_VIDEO || isProtectedContent ||
            hasReclaimedDecoderCause || hasDrmCause ||
            rendererMimeType?.startsWith("video/") != true ||
            errorCode != PlaybackException.ERROR_CODE_DECODER_INIT_FAILED &&
            errorCode != PlaybackException.ERROR_CODE_DECODING_FAILED
        ) {
            return Action.IGNORE
        }

        return Action.REPORT_TERMINAL
    }

    companion object {
        private val terminalEventSequence = java.util.concurrent.atomic.AtomicLong()

        fun nextTerminalEventId(sourceToken: Int): String =
            "$sourceToken-${terminalEventSequence.incrementAndGet()}"

        fun terminalEvent(
            decoderFailureEventId: String,
            errorCode: Int,
            errorCodeName: String,
            message: String,
            cause: String,
        ): Map<String, Any?> = mapOf(
            "event" to "playerError",
            "decoderFailureEventId" to decoderFailureEventId,
            "recoverable" to true,
            "kind" to "video_decoder_failure",
            "code" to errorCode,
            "errorCodeName" to errorCodeName,
            "message" to message,
            "cause" to cause,
        )

        fun pairedGenericErrorEvent(
            decoderFailureEventId: String,
            errorCodeName: String,
            message: String,
            cause: String,
        ): Map<String, Any?> = mapOf(
            "event" to "error",
            "decoderFailureEventId" to decoderFailureEventId,
            "message" to message,
            "errorCodeName" to errorCodeName,
            "cause" to cause,
        )
    }
}
