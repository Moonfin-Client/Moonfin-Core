package org.moonfin.nativevideo.iec

import android.content.Context
import android.media.AudioFormat
import androidx.annotation.RequiresApi
import androidx.media3.common.C
import androidx.media3.common.Format
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.audio.AudioOutput
import androidx.media3.exoplayer.audio.AudioOutputProvider
import androidx.media3.exoplayer.audio.AudioOutputProvider.FormatConfig
import androidx.media3.exoplayer.audio.AudioOutputProvider.FormatSupport
import androidx.media3.exoplayer.audio.AudioOutputProvider.OutputConfig
import androidx.media3.exoplayer.audio.AudioTrackAudioOutputProvider

/**
 * The app-side IEC 61937 output path ("AudioTrack (IEC)").
 *
 * For IEC-eligible compressed formats whose carrier the platform reports as
 * playable, this provider claims direct support, hands the sink an
 * OutputConfig that keeps the codec encoding and media sample rate (so the
 * sink's frame math and position clock stay in the media domain), and builds
 * the real output as an ENCODING_IEC61937 AudioTrack shaped like PCM16 at the
 * carrier rate, wrapped in an [Iec61937AudioOutput] that does the packing.
 *
 * Everything else, and every format once [disableForSession] trips, delegates
 * to a stock [AudioTrackAudioOutputProvider], so default behavior is
 * untouched.
 *
 * Eligible codecs are IEC-or-decode: when the carrier probe fails the format
 * is reported unsupported and the renderer decodes locally. Raw passthrough
 * only returns via the session-level fallback or the user turning the setting
 * off.
 */
@UnstableApi
@RequiresApi(24)
class Iec61937AudioOutputProvider(context: Context) : AudioOutputProvider {

    private val appContext = context.applicationContext
    private val prober = Iec61937CapabilityProber()

    private val stockProvider = AudioTrackAudioOutputProvider.Builder(appContext).build()
    private val iecTrackProvider = AudioTrackAudioOutputProvider.Builder(appContext)
        .setAudioTrackBuilderModifier { trackBuilder, outputConfig ->
            // The sink-side accounting stays PCM16-shaped. Only the platform
            // track is opened as IEC61937 so AudioFlinger passes the bursts
            // through untouched, and the frame sizes are identical.
            trackBuilder.setAudioFormat(
                AudioFormat.Builder()
                    .setEncoding(AudioFormat.ENCODING_IEC61937)
                    .setSampleRate(outputConfig.sampleRate)
                    .setChannelMask(outputConfig.channelMask)
                    .build(),
            )
        }
        .build()

    /** Sink-facing configs this provider produced for IEC playback. */
    private val iecPlans = object : LinkedHashMap<OutputConfig, IecPlan>(4, 0.75f, true) {
        override fun removeEldestEntry(eldest: Map.Entry<OutputConfig, IecPlan>) = size > 8
    }

    /**
     * Session kill switch: after an unrecoverable IEC AudioTrack failure the
     * player re-prepares and every call routes to the stock provider, giving
     * the device its normal raw/decode behavior without a rebuild.
     */
    @Volatile
    var sessionIecDisabled: Boolean = false
        private set

    /** Whether the most recent [getAudioOutput] produced an IEC output. */
    @Volatile
    var lastOutputWasIec: Boolean = false
        private set

    /** Carrier details of the last IEC output, for diagnostics. */
    @Volatile
    var lastIecCarrier: Iec61937CarrierSpec? = null
        private set

    private var routeListenerRegistered = false

    fun disableForSession() {
        sessionIecDisabled = true
    }

    override fun getFormatSupport(formatConfig: FormatConfig): FormatSupport {
        ensureRouteListener()
        val plan = planFor(formatConfig)
            ?: return stockProvider.getFormatSupport(formatConfig)
        if (plan == REJECTED) return FormatSupport.UNSUPPORTED
        return FormatSupport.Builder()
            .setFormatSupportLevel(AudioOutputProvider.FORMAT_SUPPORTED_DIRECTLY)
            .build()
    }

    override fun getOutputConfig(formatConfig: FormatConfig): OutputConfig {
        ensureRouteListener()
        val plan = planFor(formatConfig)
            ?: return stockProvider.getOutputConfig(formatConfig)
        if (plan == REJECTED) {
            throw AudioOutputProvider.ConfigurationException(
                "IEC 61937 carrier unavailable for ${formatConfig.format.sampleMimeType}",
            )
        }
        val sinkConfig = OutputConfig.Builder()
            .setEncoding(plan.sinkEncoding)
            .setSampleRate(plan.mediaSampleRate)
            .setChannelMask(plan.carrierChannelMask)
            .setIsTunneling(false)
            .setIsOffload(false)
            .setBufferSize(plan.bufferSizeBytes)
            .setAudioAttributes(formatConfig.audioAttributes)
            .setAudioSessionId(formatConfig.audioSessionId)
            .setVirtualDeviceId(formatConfig.virtualDeviceId)
            .setUsePlaybackParameters(false)
            .setUseOffloadGapless(false)
            .build()
        synchronized(iecPlans) { iecPlans[sinkConfig] = plan }
        return sinkConfig
    }

    override fun getAudioOutput(config: OutputConfig): AudioOutput {
        val plan = synchronized(iecPlans) { iecPlans[config] }
        if (plan == null || plan == REJECTED || sessionIecDisabled) {
            lastOutputWasIec = false
            return stockProvider.getAudioOutput(config)
        }
        val carrierConfig = config.buildUpon()
            .setEncoding(C.ENCODING_PCM_16BIT)
            .setSampleRate(plan.carrier.sampleRate)
            .setChannelMask(plan.carrierChannelMask)
            .build()
        val packer = Iec61937Packer.create(plan.codec, plan.mediaSampleRate)
            ?: throw AudioOutputProvider.InitializationException(
                IllegalStateException("no IEC 61937 packer for ${plan.codec} at ${plan.mediaSampleRate} Hz"),
            )
        val delegate = iecTrackProvider.getAudioOutput(carrierConfig)
        lastOutputWasIec = true
        lastIecCarrier = plan.carrier
        return Iec61937AudioOutput(delegate, packer, plan.mediaSampleRate)
    }

    override fun addListener(listener: AudioOutputProvider.Listener) {
        stockProvider.addListener(listener)
        iecTrackProvider.addListener(listener)
    }

    override fun removeListener(listener: AudioOutputProvider.Listener) {
        stockProvider.removeListener(listener)
        iecTrackProvider.removeListener(listener)
    }

    override fun release() {
        stockProvider.release()
        iecTrackProvider.release()
    }

    /**
     * The IEC plan for a format: null when this provider does not own the
     * format (delegate to stock), [REJECTED] when it owns the codec but no
     * carrier is available (decode locally).
     */
    private fun planFor(formatConfig: FormatConfig): IecPlan? {
        if (sessionIecDisabled) return null
        val format = formatConfig.format
        val codec = Iec61937Packer.codecForMime(format.sampleMimeType) ?: return null
        // Tunneling and app-packed IEC are mutually exclusive. The track
        // selector already avoids tunneling in IEC mode, this is defense in
        // depth.
        if (formatConfig.enableTunneling) return null
        val sampleRate = if (format.sampleRate == Format.NO_VALUE) 48000 else format.sampleRate
        val carrier = Iec61937CarrierSpec.forCodec(codec, sampleRate) ?: return REJECTED
        val mask = Iec61937CapabilityProber.channelMaskFor(carrier.channelCount) ?: return REJECTED
        if (!prober.supportsCarrier(carrier)) return REJECTED
        val sinkEncoding = sinkEncodingForMime(format.sampleMimeType) ?: return null
        return IecPlan(
            codec = codec,
            sinkEncoding = sinkEncoding,
            mediaSampleRate = sampleRate,
            carrier = carrier,
            carrierChannelMask = mask,
            bufferSizeBytes = bufferSizeFor(carrier),
        )
    }

    private fun bufferSizeFor(carrier: Iec61937CarrierSpec): Int {
        val nominalBurst = when (carrier.tier) {
            IecCarrierTier.LOW -> 6144
            IecCarrierTier.MID -> 24576
            IecCarrierTier.HBR -> 61440
        }
        val minBuffer = try {
            android.media.AudioTrack.getMinBufferSize(
                carrier.sampleRate,
                Iec61937CapabilityProber.channelMaskFor(carrier.channelCount)
                    ?: AudioFormat.CHANNEL_OUT_STEREO,
                AudioFormat.ENCODING_IEC61937,
            )
        } catch (_: Exception) {
            -1
        }
        return maxOf(if (minBuffer > 0) minBuffer * 2 else 0, nominalBurst * 8)
    }

    private fun ensureRouteListener() {
        if (routeListenerRegistered) return
        routeListenerRegistered = true
        // Route changes invalidate the carrier probe cache. The stock
        // provider's capabilities receiver fires on every device change.
        stockProvider.addListener { prober.invalidate() }
    }

    /** Everything getAudioOutput needs, derived once at configure time. */
    private data class IecPlan(
        val codec: IecCodec,
        val sinkEncoding: Int,
        val mediaSampleRate: Int,
        val carrier: Iec61937CarrierSpec,
        val carrierChannelMask: Int,
        val bufferSizeBytes: Int,
    )

    private companion object {
        /** Codec owned by IEC mode but uncarriable, so it decodes locally. */
        val REJECTED = IecPlan(
            codec = IecCodec.AC3,
            sinkEncoding = C.ENCODING_INVALID,
            mediaSampleRate = 0,
            carrier = Iec61937CarrierSpec(0, 0, IecCarrierTier.LOW),
            carrierChannelMask = 0,
            bufferSizeBytes = 0,
        )

        fun sinkEncodingForMime(mimeType: String?): Int? = when (mimeType) {
            Iec61937Packer.MIME_AC3 -> C.ENCODING_AC3
            Iec61937Packer.MIME_EAC3 -> C.ENCODING_E_AC3
            Iec61937Packer.MIME_EAC3_JOC -> C.ENCODING_E_AC3_JOC
            Iec61937Packer.MIME_DTS -> C.ENCODING_DTS
            Iec61937Packer.MIME_DTS_HD -> C.ENCODING_DTS_HD
            Iec61937Packer.MIME_TRUEHD -> C.ENCODING_DOLBY_TRUEHD
            else -> null
        }
    }
}
