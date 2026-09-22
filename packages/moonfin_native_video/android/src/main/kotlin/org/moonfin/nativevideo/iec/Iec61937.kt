package org.moonfin.nativevideo.iec

/** IEC 61937 burst constants shared by the per-codec packers. */
internal object Iec61937 {
    /** Pa. */
    const val SYNCWORD_1 = 0xF872

    /** Pb. */
    const val SYNCWORD_2 = 0x4E1F

    // Pc data types (bits 0-6). Codec-dependent info rides in bits 8-12.
    const val DATA_TYPE_AC3 = 0x01
    const val DATA_TYPE_DTS1 = 0x0B
    const val DATA_TYPE_DTS2 = 0x0C
    const val DATA_TYPE_DTS3 = 0x0D
    const val DATA_TYPE_DTSHD = 0x11
    const val DATA_TYPE_EAC3 = 0x15
    const val DATA_TYPE_TRUEHD = 0x16

    /** Pa+Pb+Pc+Pd. */
    const val BURST_HEADER_BYTES = 8
}

/** Malformed or unsupported bitstream data reached the packer. */
internal class Iec61937Exception(message: String) : Exception(message)

/**
 * Assembles finished data bursts into a contiguous little-endian byte stream:
 * LE 16-bit preamble words, the payload byte-swapped from big-endian byte
 * pairs to LE words, a lone trailing byte MSB-aligned, then zero stuffing out
 * to the burst repetition period. The layout matches FFmpeg's spdif muxer,
 * which the golden-vector tests pin byte for byte, and is exactly what an
 * ENCODING_IEC61937 AudioTrack consumes as native-order 16-bit frames.
 */
internal class BurstAccumulator {
    private var data = ByteArray(INITIAL_CAPACITY)
    private var readPos = 0
    private var writePos = 0

    val availableBytes: Int
        get() = writePos - readPos

    /**
     * Appends one complete data burst.
     *
     * @param dataType Pc word (data type plus any type-dependent bits).
     * @param lengthCode Pd word (bits or bytes, per the data type).
     * @param burstPeriodBytes total burst spacing, zero-stuffed out to this size.
     * @param usePreamble false only for DTS frames that exactly fill their
     *   period and leave no room for one.
     */
    fun writeBurst(
        dataType: Int,
        lengthCode: Int,
        payload: ByteArray,
        payloadOffset: Int,
        payloadLength: Int,
        burstPeriodBytes: Int,
        usePreamble: Boolean = true,
    ) {
        val headerBytes = if (usePreamble) Iec61937.BURST_HEADER_BYTES else 0
        val padding = (burstPeriodBytes - headerBytes - payloadLength) and 1.inv()
        if (padding < 0) {
            throw Iec61937Exception(
                "IEC 61937 bitrate too high: $payloadLength byte payload in a " +
                    "$burstPeriodBytes byte burst period",
            )
        }
        ensureWritable(headerBytes + payloadLength + 1 + padding)

        if (usePreamble) {
            putLe16(Iec61937.SYNCWORD_1)
            putLe16(Iec61937.SYNCWORD_2)
            putLe16(dataType)
            putLe16(lengthCode)
        }

        val evenLength = payloadLength and 1.inv()
        var i = payloadOffset
        val end = payloadOffset + evenLength
        while (i < end) {
            data[writePos++] = payload[i + 1]
            data[writePos++] = payload[i]
            i += 2
        }
        if (payloadLength and 1 != 0) {
            // A final lone byte has to be MSB aligned.
            putLe16((payload[payloadOffset + payloadLength - 1].toInt() and 0xFF) shl 8)
        }

        data.fill(0, writePos, writePos + padding)
        writePos += padding
    }

    /** Copies up to [maxLength] finished bytes into [dest] and consumes them. */
    fun readInto(dest: ByteArray, destOffset: Int, maxLength: Int): Int {
        val count = minOf(maxLength, availableBytes)
        System.arraycopy(data, readPos, dest, destOffset, count)
        readPos += count
        if (readPos == writePos) {
            readPos = 0
            writePos = 0
        }
        return count
    }

    fun clear() {
        readPos = 0
        writePos = 0
    }

    /** Test helper: the finished stream without consuming it. */
    fun snapshot(): ByteArray = data.copyOfRange(readPos, writePos)

    private fun putLe16(value: Int) {
        data[writePos++] = (value and 0xFF).toByte()
        data[writePos++] = ((value shr 8) and 0xFF).toByte()
    }

    private fun ensureWritable(count: Int) {
        if (writePos + count <= data.size) return
        // Compact first and grow only if the burst still does not fit.
        if (readPos > 0) {
            System.arraycopy(data, readPos, data, 0, availableBytes)
            writePos -= readPos
            readPos = 0
        }
        if (writePos + count > data.size) {
            var newSize = data.size * 2
            while (writePos + count > newSize) newSize *= 2
            data = data.copyOf(newSize)
        }
    }

    private companion object {
        const val INITIAL_CAPACITY = 16384
    }
}
