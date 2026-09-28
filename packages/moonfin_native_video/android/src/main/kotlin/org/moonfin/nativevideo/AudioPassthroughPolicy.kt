package org.moonfin.nativevideo

import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.audio.AudioOffloadSupport
import androidx.media3.exoplayer.audio.AudioSink
import androidx.media3.exoplayer.audio.ForwardingAudioSink
import java.nio.ByteBuffer

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
    private fun allowsBitstream(mimeType: String?): Boolean {
        val codec = codecKeyForMime(mimeType) ?: return true
        return when (mode) {
            PassthroughMode.AUTO -> true
            PassthroughMode.DISABLED -> false
            PassthroughMode.MANUAL -> codec in allowedCodecs
        }
    }

    /**
     * The format the sink is asked about for [format], or null when the policy
     * vetoes bitstreaming it. A DTS-HD stream carries a DTS core, so when only
     * DTS is allowed it goes out as that core, the way a DTS-only receiver
     * plays it, instead of being decoded here.
     */
    fun sinkFormatFor(format: Format): Format? {
        if (allowsBitstream(format.sampleMimeType)) return format
        if (format.sampleMimeType != MimeTypes.AUDIO_DTS_HD ||
            !allowsBitstream(MimeTypes.AUDIO_DTS)
        ) {
            return null
        }
        return format.buildUpon()
            .setSampleMimeType(MimeTypes.AUDIO_DTS)
            // The core tops out at 5.1 whatever the HD layer adds, and an
            // unknown count (NO_VALUE) stays unknown.
            .setChannelCount(minOf(format.channelCount, DTS_CORE_MAX_CHANNELS))
            .setSampleRate(dtsCoreSampleRate(format.sampleRate))
            .build()
    }

    companion object {
        val KNOWN_CODECS = setOf("ac3", "eac3", "dts", "dtshd", "truehd")

        private const val DTS_CORE_MAX_CHANNELS = 6

        // The core runs at the base rate of its family and the extension
        // carries anything higher, so a 96 kHz track has a 48 kHz core.
        private fun dtsCoreSampleRate(sampleRate: Int): Int = when {
            sampleRate <= 48_000 -> sampleRate
            sampleRate % 48_000 == 0 -> 48_000
            sampleRate % 44_100 == 0 -> 44_100
            else -> sampleRate
        }

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
         * and the policy stays out of the way. The recovery sink asks the
         * same question to tell a bitstream track from offloaded music.
         */
        internal fun codecKeyForMime(mimeType: String?): String? = when (mimeType) {
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
 * bypass check consults it before supportsFormat. A DTS-HD track the policy
 * sends as its core reaches the delegate as DTS, with the extension data cut
 * from every buffer.
 */
@UnstableApi
class PassthroughPolicyAudioSink(
    delegate: AudioSink,
    private val policy: AudioPassthroughPolicy,
) : ForwardingAudioSink(delegate) {

    private val dtsCore = DtsCoreExtractor()
    private var sendDtsCore = false
    private var pendingBuffer: ByteBuffer? = null
    private var pendingCore: ByteBuffer? = null

    override fun supportsFormat(format: Format): Boolean {
        val sinkFormat = policy.sinkFormatFor(format) ?: return false
        return super.supportsFormat(sinkFormat)
    }

    override fun getFormatSupport(format: Format): Int {
        val sinkFormat = policy.sinkFormatFor(format)
            ?: return AudioSink.SINK_FORMAT_UNSUPPORTED
        return super.getFormatSupport(sinkFormat)
    }

    override fun getFormatOffloadSupport(format: Format): AudioOffloadSupport {
        val sinkFormat = policy.sinkFormatFor(format)
            ?: return AudioOffloadSupport.DEFAULT_UNSUPPORTED
        return super.getFormatOffloadSupport(sinkFormat)
    }

    override fun configure(
        inputFormat: Format,
        specifiedBufferSize: Int,
        outputChannels: IntArray?,
    ) {
        val sinkFormat = policy.sinkFormatFor(inputFormat) ?: inputFormat
        sendDtsCore = sinkFormat.sampleMimeType != inputFormat.sampleMimeType
        clearPending()
        super.configure(sinkFormat, specifiedBufferSize, outputChannels)
    }

    override fun handleBuffer(
        buffer: ByteBuffer,
        presentationTimeUs: Long,
        encodedAccessUnitCount: Int,
    ): Boolean {
        if (!sendDtsCore) {
            return super.handleBuffer(buffer, presentationTimeUs, encodedAccessUnitCount)
        }
        // The renderer offers a buffer again until the sink takes all of it,
        // and the sink expects the same buffer back each time, so the core cut
        // from it is kept until then.
        var core = pendingCore
        if (core == null || pendingBuffer !== buffer) {
            core = dtsCore.extract(buffer) ?: buffer
            pendingBuffer = buffer
            pendingCore = core
        }
        val handled = super.handleBuffer(core, presentationTimeUs, encodedAccessUnitCount)
        if (handled) {
            buffer.position(buffer.limit())
            clearPending()
        }
        return handled
    }

    override fun flush() {
        clearPending()
        super.flush()
    }

    override fun reset() {
        clearPending()
        super.reset()
    }

    private fun clearPending() {
        pendingBuffer = null
        pendingCore = null
    }
}
