package org.moonfin.nativevideo.iec

/** The three PCM-shaped carriers IEC 61937 passthrough rides on. */
enum class IecCarrierTier {
    /** Stream-rate stereo (AC3, DTS core). */
    LOW,

    /** 4x stream-rate stereo (EAC3). */
    MID,

    /** 192 kHz 8-channel high-bandwidth (DTS-HD MA, TrueHD MAT). */
    HBR,
}

/** The AudioTrack shape a packed stream needs. */
data class Iec61937CarrierSpec(
    val sampleRate: Int,
    val channelCount: Int,
    val tier: IecCarrierTier,
) {
    companion object {
        /**
         * Resolves the carrier for a codec at a given stream sample rate, or
         * null when the combination can't be carried. 44.1 kHz-family HBR
         * content would need a 176.4 kHz carrier, is vanishingly rare, and
         * decodes locally instead.
         */
        fun forCodec(codec: IecCodec, streamSampleRate: Int): Iec61937CarrierSpec? = when (codec) {
            IecCodec.AC3, IecCodec.DTS -> when (streamSampleRate) {
                48000, 44100, 32000 -> Iec61937CarrierSpec(streamSampleRate, 2, IecCarrierTier.LOW)
                else -> null
            }
            IecCodec.EAC3 -> when (streamSampleRate) {
                48000, 44100, 32000 -> Iec61937CarrierSpec(streamSampleRate * 4, 2, IecCarrierTier.MID)
                else -> null
            }
            IecCodec.DTS_HD, IecCodec.TRUEHD -> when (streamSampleRate) {
                48000, 96000, 192000 -> Iec61937CarrierSpec(192000, 8, IecCarrierTier.HBR)
                else -> null
            }
        }
    }
}

/** Codecs the IEC packer understands. */
enum class IecCodec {
    AC3,
    EAC3,
    DTS,
    DTS_HD,
    TRUEHD,
}
