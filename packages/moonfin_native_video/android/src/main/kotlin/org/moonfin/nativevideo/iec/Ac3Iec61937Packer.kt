package org.moonfin.nativevideo.iec

/**
 * AC3: one syncframe per burst, data type 1 with the bitstream mode in the
 * type-dependent bits, 6144-byte burst period (1536 samples of stereo
 * carrier).
 */
internal class Ac3Iec61937Packer(
    carrier: Iec61937CarrierSpec,
    streamSampleRate: Int,
) : Iec61937Packer(IecCodec.AC3, carrier, streamSampleRate) {

    override fun writeAccessUnits(data: ByteArray, offset: Int, length: Int) {
        var pos = offset
        val end = offset + length
        while (pos < end) {
            if (end - pos < 6) throw Iec61937Exception("truncated AC3 syncframe header")
            val frameBytes = parseFrameSizeBytes(data, pos)
            if (pos + frameBytes > end) throw Iec61937Exception("truncated AC3 syncframe")
            val bitstreamMode = data[pos + 5].toInt() and 0x7
            bursts.writeBurst(
                dataType = Iec61937.DATA_TYPE_AC3 or (bitstreamMode shl 8),
                lengthCode = ((frameBytes + 1) and 1.inv()) shl 3,
                payload = data,
                payloadOffset = pos,
                payloadLength = frameBytes,
                burstPeriodBytes = BURST_PERIOD_BYTES,
            )
            pos += frameBytes
        }
    }

    companion object {
        /** 1536 samples times 4 bytes of stereo 16-bit carrier. */
        const val BURST_PERIOD_BYTES = 6144

        private val BITRATE_KBPS = intArrayOf(
            32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320,
            384, 448, 512, 576, 640,
        )

        /** Syncframe size from fscod/frmsizecod, per ATSC A/52. */
        fun parseFrameSizeBytes(data: ByteArray, offset: Int): Int {
            if (data[offset] != 0x0B.toByte() || data[offset + 1] != 0x77.toByte()) {
                throw Iec61937Exception("bad AC3 syncword")
            }
            val fscod = (data[offset + 4].toInt() shr 6) and 0x3
            val frmsizecod = data[offset + 4].toInt() and 0x3F
            if (frmsizecod >= BITRATE_KBPS.size * 2) {
                throw Iec61937Exception("bad AC3 frmsizecod $frmsizecod")
            }
            val bitrate = BITRATE_KBPS[frmsizecod shr 1]
            val words = when (fscod) {
                0 -> 2 * bitrate
                1 -> bitrate * 96000 / 44100 + (frmsizecod and 1)
                2 -> 3 * bitrate
                else -> throw Iec61937Exception("bad AC3 fscod")
            }
            return words * 2
        }
    }
}

/**
 * EAC3: syncframes accumulate until six audio blocks are buffered (a burst
 * always describes 1536 samples), then ship as data type 21 in a 24576-byte
 * period on the 4x-rate carrier. Dependent substream frames stay in the same
 * burst as the independent frame they extend. Pd counts bytes for this type.
 */
internal class Eac3Iec61937Packer(
    carrier: Iec61937CarrierSpec,
    streamSampleRate: Int,
) : Iec61937Packer(IecCodec.EAC3, carrier, streamSampleRate) {

    private var pending = ByteArray(4096)
    private var pendingSize = 0
    private var independentFrames = 0
    private var framesPerBurst = 1

    override fun writeAccessUnits(data: ByteArray, offset: Int, length: Int) {
        var pos = offset
        val end = offset + length
        while (pos < end) {
            if (end - pos < 6) throw Iec61937Exception("truncated EAC3 syncframe header")
            if (data[pos] != 0x0B.toByte() || data[pos + 1] != 0x77.toByte()) {
                throw Iec61937Exception("bad EAC3 syncword")
            }
            val frameBytes = ((data.rb16(pos + 2) and 0x7FF) + 1) * 2
            if (pos + frameBytes > end) throw Iec61937Exception("truncated EAC3 syncframe")

            val strmtyp = (data[pos + 2].toInt() shr 6) and 0x3
            val independent = strmtyp != 1
            if (independent) {
                // A new independent frame starts the next accumulation group,
                // so flush first and its dependents stay with it.
                if (independentFrames >= framesPerBurst) flushBurst()
                if (independentFrames == 0) {
                    framesPerBurst = framesPerBurstOf(data, pos)
                }
                independentFrames++
            }
            append(data, pos, frameBytes)
            pos += frameBytes
        }
        // Input buffers end on access-unit boundaries, so a full group can
        // ship now. A dependent frame can never open the next buffer.
        if (independentFrames >= framesPerBurst) flushBurst()
    }

    override fun endOfStream() {
        if (pendingSize > 0) flushBurst()
    }

    override fun reset() {
        super.reset()
        pendingSize = 0
        independentFrames = 0
        framesPerBurst = 1
    }

    private fun flushBurst() {
        if (pendingSize == 0) return
        bursts.writeBurst(
            dataType = Iec61937.DATA_TYPE_EAC3,
            lengthCode = pendingSize,
            payload = pending,
            payloadOffset = 0,
            payloadLength = pendingSize,
            burstPeriodBytes = BURST_PERIOD_BYTES,
        )
        pendingSize = 0
        independentFrames = 0
    }

    private fun append(data: ByteArray, offset: Int, length: Int) {
        if (pendingSize + length > pending.size) {
            var newSize = pending.size * 2
            while (pendingSize + length > newSize) newSize *= 2
            pending = pending.copyOf(newSize)
        }
        System.arraycopy(data, offset, pending, pendingSize, length)
        pendingSize += length
    }

    private fun framesPerBurstOf(data: ByteArray, offset: Int): Int {
        val bsid = data[offset + 5].toInt() shr 3
        val fscod = data[offset + 4].toInt() and 0xC0
        if (bsid <= 10 || fscod == 0xC0) return 1
        val numblkscod = (data[offset + 4].toInt() and 0x30) shr 4
        return EAC3_REPEAT[numblkscod]
    }

    companion object {
        /** 1536 samples times 4 bytes at the 4x rate. */
        const val BURST_PERIOD_BYTES = 24576

        /** Independent frames per burst for numblkscod 0..3 (1/2/3/6 blocks). */
        private val EAC3_REPEAT = intArrayOf(6, 3, 2, 1)
    }
}
