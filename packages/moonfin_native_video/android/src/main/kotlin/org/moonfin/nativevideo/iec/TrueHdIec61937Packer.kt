package org.moonfin.nativevideo.iec

/**
 * TrueHD/MLP: access units are wrapped in Dolby MAT frames before IEC
 * carriage. A MAT frame is 61424 bytes with fixed start/middle/end codes at
 * set offsets, and access units plus timing-derived padding fill the gaps.
 * Each completed MAT frame ships as data type 22 in a 61440-byte period on
 * the 8-channel 192 kHz carrier.
 *
 * The MAT layout and timing accounting are a faithful port of FFmpeg's spdif
 * muxer so the golden vectors pin every byte. State carries across access
 * units and across [writeAccessUnits] calls, since one AU rarely completes a
 * MAT frame.
 */
internal class TrueHdIec61937Packer(
    carrier: Iec61937CarrierSpec,
    streamSampleRate: Int,
) : Iec61937Packer(IecCodec.TRUEHD, carrier, streamSampleRate) {

    private var matBuf = ByteArray(MAT_FRAME_SIZE)
    private var matFilled = 0
    private var nextCodeIdx = 0

    private var samplesPerFrame = 0
    private var prevSize = 0
    private var prevTime = 0
    private var outputTiming = 0
    private var outputTimingValid = false
    private var oiDelta = 0

    override fun writeAccessUnits(data: ByteArray, offset: Int, length: Int) {
        var pos = offset
        val end = offset + length
        while (pos < end) {
            val auLength = accessUnitLength(data, pos, end)
            packAccessUnit(data, pos, auLength)
            pos += auLength
        }
    }

    override fun reset() {
        super.reset()
        matFilled = 0
        nextCodeIdx = 0
        samplesPerFrame = 0
        prevSize = 0
        prevTime = 0
        outputTiming = 0
        outputTimingValid = false
        oiDelta = 0
    }

    private fun packAccessUnit(data: ByteArray, offset: Int, auSize: Int) {
        if (auSize < 10) throw Iec61937Exception("truncated TrueHD access unit")
        val au = parseAccessUnit(data, offset, auSize)

        if (au.samplesPerFrame != 0) samplesPerFrame = au.samplesPerFrame
        if (samplesPerFrame == 0) {
            throw Iec61937Exception("TrueHD access unit before first major sync")
        }

        val inputTiming = au.inputTiming
        var paddingRemaining = 0
        var outputDiscontinuity = false
        var totalFrameSize = auSize

        // Timing fields are 16-bit counters that wrap, so the deltas are
        // computed in 16-bit space and reinterpreted as signed where needed.
        outputTiming += samplesPerFrame
        if (au.hasOutputTiming) {
            if (outputTimingValid && au.outputTiming != (outputTiming and 0xFFFF)) {
                val bytesPerSample = TRUEHD_NOMINAL_AU_SPACING / samplesPerFrame
                val outputTimingMinusSpf = (au.outputTiming - samplesPerFrame) and 0xFFFF
                val previousOiDelta = oiDelta
                val currentOiDelta = (outputTimingMinusSpf - inputTiming).toShort().toInt()
                outputDiscontinuity = true
                val discontinuityPadding = (previousOiDelta - currentOiDelta) * bytesPerSample
                val prevPadding = if (prevSize != 0) TRUEHD_NOMINAL_AU_SPACING - prevSize else 0
                paddingRemaining = prevPadding + discontinuityPadding
                if (paddingRemaining < 0 || paddingRemaining > MAX_PADDING_PER_PACKET) {
                    paddingRemaining = 0
                }
            }
            outputTiming = au.outputTiming
            outputTimingValid = true
        }

        if (prevSize != 0 && !outputDiscontinuity) {
            val deltaSamples = (inputTiming - prevTime) and 0xFFFF
            val deltaBytes = deltaSamples * TRUEHD_NOMINAL_AU_SPACING / samplesPerFrame
            paddingRemaining = deltaBytes - prevSize
            if (paddingRemaining < 0 || paddingRemaining > MAX_PADDING_PER_PACKET) {
                paddingRemaining = 0
            }
        }

        if (outputTimingValid) {
            val outputTimingMinusSpf = (outputTiming - samplesPerFrame) and 0xFFFF
            oiDelta = (outputTimingMinusSpf - inputTiming).toShort().toInt()
        }

        var dataPos = offset
        var dataRemaining = auSize

        while (paddingRemaining != 0 || dataRemaining != 0 || MAT_CODE_POS[nextCodeIdx] == matFilled) {
            if (MAT_CODE_POS[nextCodeIdx] == matFilled) {
                val code = MAT_CODES[nextCodeIdx]
                var codeLenRemaining = code.size
                System.arraycopy(code, 0, matBuf, matFilled, code.size)
                matFilled += code.size
                nextCodeIdx++
                if (nextCodeIdx == MAT_CODES.size) {
                    nextCodeIdx = 0
                    emitMatFrame()
                    matFilled = 0
                    // The inter-frame gap counts toward the timing accounting.
                    codeLenRemaining += MAT_PKT_OFFSET - MAT_FRAME_SIZE
                }
                if (paddingRemaining != 0) {
                    val countedAsPadding = minOf(paddingRemaining, codeLenRemaining)
                    paddingRemaining -= countedAsPadding
                    codeLenRemaining -= countedAsPadding
                }
                if (codeLenRemaining != 0) totalFrameSize += codeLenRemaining
            }

            if (paddingRemaining != 0) {
                val toInsert = minOf(MAT_CODE_POS[nextCodeIdx] - matFilled, paddingRemaining)
                matBuf.fill(0, matFilled, matFilled + toInsert)
                matFilled += toInsert
                paddingRemaining -= toInsert
                if (paddingRemaining != 0) continue
            }

            if (dataRemaining != 0) {
                val toInsert = minOf(MAT_CODE_POS[nextCodeIdx] - matFilled, dataRemaining)
                System.arraycopy(data, dataPos, matBuf, matFilled, toInsert)
                matFilled += toInsert
                dataPos += toInsert
                dataRemaining -= toInsert
            }
        }

        prevSize = totalFrameSize
        prevTime = inputTiming
    }

    private fun emitMatFrame() {
        bursts.writeBurst(
            dataType = Iec61937.DATA_TYPE_TRUEHD,
            lengthCode = MAT_FRAME_SIZE,
            payload = matBuf,
            payloadOffset = 0,
            payloadLength = MAT_FRAME_SIZE,
            burstPeriodBytes = MAT_PKT_OFFSET,
        )
    }

    private data class AccessUnitInfo(
        val inputTiming: Int,
        val outputTiming: Int,
        val hasOutputTiming: Boolean,
        val samplesPerFrame: Int,
    )

    /**
     * The access-unit length from its 2-byte nibble-header size field (in
     * 16-bit words), used to split a bypass buffer holding several AUs.
     */
    private fun accessUnitLength(data: ByteArray, offset: Int, end: Int): Int {
        if (end - offset < 2) throw Iec61937Exception("truncated TrueHD access unit")
        val words = data.rb16(offset) and 0x0FFF
        val bytes = words * 2
        if (bytes < 4 || offset + bytes > end) {
            throw Iec61937Exception("bad TrueHD access unit length $bytes")
        }
        return bytes
    }

    /** Reads input/output timing and the sample rate from one access unit. */
    private fun parseAccessUnit(auData: ByteArray, offset: Int, auSize: Int): AccessUnitInfo {
        val inputTiming = auData.rb16(offset + 2)
        val dataOff = offset + 4
        val size = auSize - 4
        if (size < 6 || auData.rb24(dataOff) != 0xF8726F) {
            return AccessUnitInfo(inputTiming, 0, false, 0)
        }

        var majorSyncSize = 28
        val ratebits = when (auData[dataOff + 3].toInt() and 0xFF) {
            0xBA -> (auData[dataOff + 4].toInt() and 0xFF) shr 4
            0xBB -> (auData[dataOff + 5].toInt() and 0xFF) shr 4
            else -> throw Iec61937Exception("bad TrueHD major sync format")
        }
        val samplesPerFrame = 40 shl (ratebits and 3)
        if (size < 27) return AccessUnitInfo(inputTiming, 0, false, samplesPerFrame)

        if ((auData[dataOff + 3].toInt() and 0xFF) == 0xBA && (auData[dataOff + 25].toInt() and 1) != 0) {
            val extSize = (auData[dataOff + 26].toInt() and 0xFF) shr 4
            majorSyncSize += 2 + extSize * 2
        }
        if (majorSyncSize > size) return AccessUnitInfo(inputTiming, 0, false, samplesPerFrame)

        val gb = BitReader(auData, dataOff + majorSyncSize, size - majorSyncSize)
        val numSubstreams = (auData[dataOff + 16].toInt() and 0xFF) shr 4
        if (numSubstreams <= 0) return AccessUnitInfo(inputTiming, 0, false, samplesPerFrame)

        for (i in 0 until numSubstreams) {
            if (gb.bitsLeft < 16) return AccessUnitInfo(inputTiming, 0, false, samplesPerFrame)
            val extraWord = gb.readBit()
            gb.skipBits(15)
            if (extraWord == 0) continue
            if (gb.bitsLeft < 16) return AccessUnitInfo(inputTiming, 0, false, samplesPerFrame)
            gb.skipBits(16)
        }

        // The output timing lives in the first substream's restart header,
        // when one is present at all.
        if (gb.bitsLeft < 1 || gb.readBit() == 0) { // block_header_exists
            return AccessUnitInfo(inputTiming, 0, false, samplesPerFrame)
        }
        if (gb.bitsLeft < 1 || gb.readBit() == 0) { // restart_header_exists
            return AccessUnitInfo(inputTiming, 0, false, samplesPerFrame)
        }
        if (gb.bitsLeft < 13 + 1 + 16) return AccessUnitInfo(inputTiming, 0, false, samplesPerFrame)
        val syncWord = gb.readBits(13)
        if (syncWord != (0x31EA shr 1)) return AccessUnitInfo(inputTiming, 0, false, samplesPerFrame)
        gb.skipBits(1) // noise_type
        val outputTiming = gb.readBits(16)
        return AccessUnitInfo(inputTiming, outputTiming, true, samplesPerFrame)
    }

    companion object {
        private const val MAT_PKT_OFFSET = 61440
        private const val MAT_FRAME_SIZE = 61424

        /** Nominal carrier bytes per access unit, 20 ms over 24 AUs. */
        private const val TRUEHD_NOMINAL_AU_SPACING = 2560
        private const val MAX_PADDING_PER_PACKET = MAT_FRAME_SIZE * 2

        private val MAT_START_CODE = byteArrayOf(
            0x07, 0x9E.toByte(), 0x00, 0x03, 0x84.toByte(), 0x01, 0x01, 0x01,
            0x80.toByte(), 0x00, 0x56, 0xA5.toByte(), 0x3B, 0xF4.toByte(),
            0x81.toByte(), 0x83.toByte(), 0x49, 0x80.toByte(), 0x77, 0xE0.toByte(),
        )
        private val MAT_MIDDLE_CODE = byteArrayOf(
            0xC3.toByte(), 0xC1.toByte(), 0x42, 0x49, 0x3B, 0xFA.toByte(),
            0x82.toByte(), 0x83.toByte(), 0x49, 0x80.toByte(), 0x77, 0xE0.toByte(),
        )
        private val MAT_END_CODE = byteArrayOf(
            0xC3.toByte(), 0xC2.toByte(), 0xC0.toByte(), 0xC4.toByte(), 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x97.toByte(), 0x11,
        )
        private val MAT_CODES = arrayOf(MAT_START_CODE, MAT_MIDDLE_CODE, MAT_END_CODE)
        private val MAT_CODE_POS = intArrayOf(0, 30708, MAT_FRAME_SIZE - MAT_END_CODE.size)
    }
}
