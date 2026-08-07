package org.moonfin.nativevideo

import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.audio.AudioOffloadSupport
import androidx.media3.exoplayer.audio.AudioSink
import androidx.media3.exoplayer.audio.ForwardingAudioSink

enum class PassthroughMode { DISABLED, AUTO, MANUAL }

/**
 * The user's bitstreaming policy for compressed surround audio. The policy only
 * ever narrows what the sink's own capability probe allows, so enabling a codec
 * here never forces bitstreaming onto a route that can't carry it.
 */
data class AudioPassthroughPolicy(
    val mode: PassthroughMode,
    val allowedCodecs: Set<String>,
) {
    fun allowsBitstream(mimeType: String?): Boolean {
        val codec = codecKeyForMime(mimeType) ?: return true
        return when (mode) {
            PassthroughMode.AUTO -> true
            PassthroughMode.DISABLED -> false
            PassthroughMode.MANUAL -> codec in allowedCodecs
        }
    }

    companion object {
        val KNOWN_CODECS = setOf("ac3", "eac3", "dts", "dtshd", "truehd")

        fun fromWire(mode: String, codecs: Set<String>): AudioPassthroughPolicy =
            AudioPassthroughPolicy(
                mode = when (mode) {
                    "disabled" -> PassthroughMode.DISABLED
                    "manual" -> PassthroughMode.MANUAL
                    else -> PassthroughMode.AUTO
                },
                allowedCodecs = codecs,
            )

        /**
         * The policy key a surround mime answers to. Variants ride inside the
         * base bitstream (Atmos JOC in eac3, DTS:X in dtshd), so they share its
         * key. AC4 is bitstream-only surround with no toggle of its own, so it
         * maps to a key never present in [KNOWN_CODECS] and disabled and manual
         * modes block it. Null means the mime is not passthrough audio at all,
         * and the policy stays out of the way.
         */
        private fun codecKeyForMime(mimeType: String?): String? = when (mimeType) {
            MimeTypes.AUDIO_AC3 -> "ac3"
            MimeTypes.AUDIO_E_AC3, MimeTypes.AUDIO_E_AC3_JOC -> "eac3"
            MimeTypes.AUDIO_DTS, MimeTypes.AUDIO_DTS_EXPRESS -> "dts"
            MimeTypes.AUDIO_DTS_HD, MimeTypes.AUDIO_DTS_X -> "dtshd"
            MimeTypes.AUDIO_TRUEHD -> "truehd"
            MimeTypes.AUDIO_AC4 -> "ac4"
            else -> null
        }
    }
}

/**
 * Wraps the real audio sink and vetoes bitstream formats the policy disallows.
 * The renderer asks the sink before consulting any decoder, so a veto here
 * cleanly demotes the track to the local decode path (MediaCodec, then the
 * FFmpeg extension renderer). Offload support must be vetoed too because the
 * bypass check consults it before supportsFormat.
 */
@UnstableApi
class PassthroughPolicyAudioSink(
    delegate: AudioSink,
    private val policy: AudioPassthroughPolicy,
) : ForwardingAudioSink(delegate) {
    override fun supportsFormat(format: Format): Boolean {
        if (!policy.allowsBitstream(format.sampleMimeType)) return false
        return super.supportsFormat(format)
    }

    override fun getFormatSupport(format: Format): Int {
        if (!policy.allowsBitstream(format.sampleMimeType)) {
            return AudioSink.SINK_FORMAT_UNSUPPORTED
        }
        return super.getFormatSupport(format)
    }

    override fun getFormatOffloadSupport(format: Format): AudioOffloadSupport {
        if (!policy.allowsBitstream(format.sampleMimeType)) {
            return AudioOffloadSupport.DEFAULT_UNSUPPORTED
        }
        return super.getFormatOffloadSupport(format)
    }
}
