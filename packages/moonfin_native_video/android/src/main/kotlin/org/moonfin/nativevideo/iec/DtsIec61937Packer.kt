package org.moonfin.nativevideo.iec

/** Shared DTS core header parsing for the core and HD packers. */
internal object DtsFraming {
    const val SYNCWORD_CORE_BE = 0x7FFE8001L

    /** Core sample rates indexed by the header's sfreq field. */
    private val SAMPLE_RATES = intArrayOf(
        0, 8000, 16000, 32000, 0, 0, 11025, 22050, 44100, 0, 0, 12000, 24000,
        48000, 96000, 192000,
    )

    data class CoreHeader(
        val samples: Int,
        val coreSizeBytes: Int,
        val sampleRate: Int,
    )

    /**
     * Parses a big-endian core syncframe header. LE and 14-bit variants are
     * rejected: Media3 extractors emit 16-bit BE DTS, and anything else should
     * decode locally rather than reach the packer.
     */
    fun parseCoreHeader(data: ByteArray, offset: Int, available: Int): CoreHeader {
        if (available < 9) throw Iec61937Exception("truncated DTS core header")
        if (data.rb32(offset) != SYNCWORD_CORE_BE) {
            throw Iec61937Exception("unsupported DTS syncword (not 16-bit big-endian core)")
        }
        val blocks = ((data.rb16(offset + 4) shr 2) and 0x7F) + 1
        val coreSize = ((data.rb24(offset + 5) shr 4) and 0x3FFF) + 1
        val sampleRate = SAMPLE_RATES[(data[offset + 8].toInt() shr 2) and 0x0F]
        return CoreHeader(samples = blocks * 32, coreSizeBytes = coreSize, sampleRate = sampleRate)
    }

    /**
     * The size of the access unit starting at [offset]: the core frame plus
     * any extension substream, ending at the next core syncword or the end of
     * the buffer. Bypass buffers hold whole access units, so a buffer edge is
     * always an AU edge.
     */
    fun accessUnitLength(data: ByteArray, offset: Int, end: Int, coreSizeBytes: Int): Int {
        var pos = offset + coreSizeBytes
        while (pos + 4 <= end) {
            if (data.rb32(pos) == SYNCWORD_CORE_BE) return pos - offset
            pos++
        }
        return end - offset
    }
}

/**
 * DTS core: one frame per burst, data type 11/12/13 by frame duration
 * (512/1024/2048 samples), burst period of samples times 4 bytes on the
 * stream-rate stereo carrier. Extension substream data is stripped and only
 * the core is carried.
 */
internal class DtsIec61937Packer(
    carrier: Iec61937CarrierSpec,
    streamSampleRate: Int,
) : Iec61937Packer(IecCodec.DTS, carrier, streamSampleRate) {

    override fun writeAccessUnits(data: ByteArray, offset: Int, length: Int) {
        var pos = offset
        val end = offset + length
        while (pos < end) {
            val header = DtsFraming.parseCoreHeader(data, pos, end - pos)
            val auLength = DtsFraming.accessUnitLength(data, pos, end, header.coreSizeBytes)
            if (header.coreSizeBytes > auLength) throw Iec61937Exception("truncated DTS frame")

            val dataType = when (header.samples) {
                512 -> Iec61937.DATA_TYPE_DTS1
                1024 -> Iec61937.DATA_TYPE_DTS2
                2048 -> Iec61937.DATA_TYPE_DTS3
                else -> throw Iec61937Exception("${header.samples} samples in DTS frame not supported")
            }
            val burstPeriod = header.samples * 4
            val outBytes = if (header.coreSizeBytes < auLength) header.coreSizeBytes else auLength
            bursts.writeBurst(
                dataType = dataType,
                lengthCode = if (header.coreSizeBytes < auLength) {
                    header.coreSizeBytes shl 3
                } else {
                    ((auLength + 1) and 1.inv()) shl 3
                },
                payload = data,
                payloadOffset = pos,
                payloadLength = outBytes,
                burstPeriodBytes = burstPeriod,
                // A frame that exactly fills its period carries no preamble
                // (DTS discs, DTS-in-WAV).
                usePreamble = outBytes != burstPeriod,
            )
            pos += auLength
        }
    }
}

/**
 * DTS-HD (type IV): the full access unit (core plus extension substream)
 * rides inside a start-code envelope on the 8-channel HBR carrier. The burst
 * period follows the carrier's IEC 60958 frame rate, and if a frame overflows
 * the period the packer falls back to core-only bursts for a while.
 */
internal class DtsHdIec61937Packer(
    carrier: Iec61937CarrierSpec,
    streamSampleRate: Int,
) : Iec61937Packer(IecCodec.DTS_HD, carrier, streamSampleRate) {

    /** Frames left to send core-only after an overflow. */
    private var hdSkipFrames = 0

    override fun writeAccessUnits(data: ByteArray, offset: Int, length: Int) {
        var pos = offset
        val end = offset + length
        while (pos < end) {
            val header = DtsFraming.parseCoreHeader(data, pos, end - pos)
            val auLength = DtsFraming.accessUnitLength(data, pos, end, header.coreSizeBytes)
            if (header.coreSizeBytes > auLength) throw Iec61937Exception("truncated DTS frame")
            if (header.sampleRate == 0) throw Iec61937Exception("unknown DTS sample rate for HD")

            // The period is measured in 4-byte IEC 60958 frames, and the
            // 8-channel carrier moves four of those per audio frame.
            val iecRate = carrier.sampleRate.toLong() * 4
            val period = (iecRate * header.samples / header.sampleRate).toInt()
            val subtype = SUBTYPES[period]
                ?: throw Iec61937Exception("impossible DTS-HD repetition period $period")
            val burstPeriod = period * 4

            if (ENVELOPE_HEADER_BYTES + auLength > burstPeriod - Iec61937.BURST_HEADER_BYTES) {
                hdSkipFrames = header.sampleRate * HD_FALLBACK_SECONDS / header.samples
            }
            val sendCoreOnly = hdSkipFrames > 0 && header.coreSizeBytes <= auLength
            val pktBytes = if (sendCoreOnly) {
                hdSkipFrames--
                header.coreSizeBytes
            } else {
                auLength
            }

            writeEnvelopeBurst(data, pos, pktBytes, subtype, burstPeriod)
            pos += auLength
        }
    }

    override fun reset() {
        super.reset()
        hdSkipFrames = 0
    }

    private fun writeEnvelopeBurst(
        data: ByteArray,
        offset: Int,
        pktBytes: Int,
        subtype: Int,
        burstPeriodBytes: Int,
    ) {
        val outBytes = ENVELOPE_HEADER_BYTES + pktBytes
        // Align so that (Pd & 0xf) == 0x8. Some receivers reportedly need it.
        val lengthCode = ((outBytes + 0x8 + 0xF) and 0xF.inv()) - 0x8

        if (payloadScratch.size < outBytes) {
            payloadScratch = ByteArray(maxOf(outBytes, payloadScratch.size * 2))
        }
        System.arraycopy(START_CODE, 0, payloadScratch, 0, START_CODE.size)
        payloadScratch[START_CODE.size] = ((pktBytes shr 8) and 0xFF).toByte()
        payloadScratch[START_CODE.size + 1] = (pktBytes and 0xFF).toByte()
        System.arraycopy(data, offset, payloadScratch, ENVELOPE_HEADER_BYTES, pktBytes)

        bursts.writeBurst(
            dataType = Iec61937.DATA_TYPE_DTSHD or (subtype shl 8),
            lengthCode = lengthCode,
            payload = payloadScratch,
            payloadOffset = 0,
            payloadLength = outBytes,
            burstPeriodBytes = burstPeriodBytes,
        )
    }

    private var payloadScratch = ByteArray(8192)

    companion object {
        private val START_CODE = byteArrayOf(
            0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE.toByte(), 0xFE.toByte(),
        )
        private const val ENVELOPE_HEADER_BYTES = 12

        /** Repetition period (IEC 60958 frames) to type IV subtype. */
        private val SUBTYPES = mapOf(
            512 to 0x0, 1024 to 0x1, 2048 to 0x2, 4096 to 0x3, 8192 to 0x4, 16384 to 0x5,
        )

        /** How long an overflow strips the HD extension for. */
        private const val HD_FALLBACK_SECONDS = 60
    }
}
