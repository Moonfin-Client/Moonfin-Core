package org.moonfin.nativevideo.iec

/**
 * Packs complete encoded access units into IEC 61937 data bursts. One packer
 * instance serves one stream and lives on the playback thread.
 *
 * Input buffers arrive from ExoPlayer's bypass path and hold one or more
 * complete access units back to back, so each packer splits them on its
 * codec's own framing. Output accumulates in [bursts] as the exact
 * little-endian byte stream an ENCODING_IEC61937 AudioTrack consumes.
 *
 * This file stays free of Android and Media3 imports so the packers run under
 * plain JVM unit tests against the golden vectors.
 */
internal abstract class Iec61937Packer protected constructor(
    val codec: IecCodec,
    val carrier: Iec61937CarrierSpec,
    val streamSampleRate: Int,
) {
    protected val bursts = BurstAccumulator()

    val availableBytes: Int
        get() = bursts.availableBytes

    /** Copies up to [maxLength] packed bytes into [dest] and consumes them. */
    fun readInto(dest: ByteArray, destOffset: Int, maxLength: Int): Int =
        bursts.readInto(dest, destOffset, maxLength)

    /**
     * Splits [data] into access units and packs every complete one. Throws
     * [Iec61937Exception] on malformed input.
     */
    abstract fun writeAccessUnits(data: ByteArray, offset: Int, length: Int)

    /**
     * Emits any partially accumulated burst state, padded with stuffing, so
     * the receiver is left at a clean frame boundary at end of stream.
     */
    open fun endOfStream() {}

    /** Drops all state for a seek or flush. */
    open fun reset() {
        bursts.clear()
    }

    /** Test helper. */
    fun packedSnapshot(): ByteArray = bursts.snapshot()

    companion object {
        // Media3 MimeTypes values, restated so this package stays JVM-pure.
        const val MIME_AC3 = "audio/ac3"
        const val MIME_EAC3 = "audio/eac3"
        const val MIME_EAC3_JOC = "audio/eac3-joc"
        const val MIME_DTS = "audio/vnd.dts"
        const val MIME_DTS_HD = "audio/vnd.dts.hd"
        const val MIME_TRUEHD = "audio/true-hd"

        /**
         * The IEC codec a mime maps to, or null when the format has no IEC
         * carriage here. Atmos (JOC) rides the EAC3 bitstream and DTS:X inside
         * DTS-HD MA rides the dts.hd one, so they share their base codec. DTS
         * Express (LBR) and DTS:X Profile 2 (DTS-UHD) have no core to burst
         * and are not carried.
         */
        fun codecForMime(mimeType: String?): IecCodec? = when (mimeType) {
            MIME_AC3 -> IecCodec.AC3
            MIME_EAC3, MIME_EAC3_JOC -> IecCodec.EAC3
            MIME_DTS -> IecCodec.DTS
            MIME_DTS_HD -> IecCodec.DTS_HD
            MIME_TRUEHD -> IecCodec.TRUEHD
            else -> null
        }

        /**
         * Builds a packer for the codec at the given stream rate, or null when
         * the combination has no carrier.
         */
        fun create(codec: IecCodec, streamSampleRate: Int): Iec61937Packer? {
            val carrier = Iec61937CarrierSpec.forCodec(codec, streamSampleRate) ?: return null
            return when (codec) {
                IecCodec.AC3 -> Ac3Iec61937Packer(carrier, streamSampleRate)
                IecCodec.EAC3 -> Eac3Iec61937Packer(carrier, streamSampleRate)
                IecCodec.DTS -> DtsIec61937Packer(carrier, streamSampleRate)
                IecCodec.DTS_HD -> DtsHdIec61937Packer(carrier, streamSampleRate)
                IecCodec.TRUEHD -> TrueHdIec61937Packer(carrier, streamSampleRate)
            }
        }
    }
}

// Shared big-endian readers for the bitstream header parsers.

internal fun ByteArray.rb16(offset: Int): Int =
    ((this[offset].toInt() and 0xFF) shl 8) or (this[offset + 1].toInt() and 0xFF)

internal fun ByteArray.rb24(offset: Int): Int =
    ((this[offset].toInt() and 0xFF) shl 16) or
        ((this[offset + 1].toInt() and 0xFF) shl 8) or
        (this[offset + 2].toInt() and 0xFF)

internal fun ByteArray.rb32(offset: Int): Long =
    ((this[offset].toInt() and 0xFF).toLong() shl 24) or
        ((this[offset + 1].toInt() and 0xFF).toLong() shl 16) or
        ((this[offset + 2].toInt() and 0xFF).toLong() shl 8) or
        (this[offset + 3].toInt() and 0xFF).toLong()

/** Minimal MSB-first bit reader for the TrueHD substream directory walk. */
internal class BitReader(
    private val data: ByteArray,
    private val startOffset: Int,
    private val byteLength: Int,
) {
    private var bitPos = 0

    val bitsLeft: Int
        get() = byteLength * 8 - bitPos

    fun readBit(): Int {
        val byte = data[startOffset + (bitPos ushr 3)].toInt() and 0xFF
        val bit = (byte shr (7 - (bitPos and 7))) and 1
        bitPos++
        return bit
    }

    fun readBits(count: Int): Int {
        var value = 0
        repeat(count) { value = (value shl 1) or readBit() }
        return value
    }

    fun skipBits(count: Int) {
        bitPos += count
    }
}
