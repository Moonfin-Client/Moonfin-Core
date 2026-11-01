package org.moonfin.nativevideo

/**
 * Incrementally reads MPEG-2 sequence and picture extensions for trusted
 * frame-rate and scan-type evidence. The scanner retains only a short header
 * prefix, so input size and chunk boundaries do not affect its memory use.
 * Not thread-safe; each observer belongs to one input stream.
 */
internal class Mpeg2RateHeaderObserver {
    private var zeroRun = 0
    private var awaitingStartCode = false
    private var startCode = NO_START_CODE
    private val header = ByteArray(MAX_HEADER_BYTES)
    private var headerLength = 0

    private var sequenceHeaderRateCandidate: Float? = null
    private var sequenceWidth = 0
    private var sequenceHeight = 0
    private var sequenceBaseRate: Float? = null
    private var sequenceRate: Float? = null
    private var sequenceProgressive = false
    private var sequenceExtensionComplete = false
    private var sequenceExtensionEligible = false
    private var currentSequenceExtensionTrusted = false
    private var sequenceHeaderMatrixBytesRemaining = 0
    private var readNonIntraFlagAfterMatrix = false
    private var emitted = false

    /** Feeds a byte range and returns its first definitive evidence, if any. */
    fun onData(data: ByteArray, offset: Int, length: Int): StreamRateEvidence? {
        require(offset >= 0 && length >= 0 && offset <= data.size - length) {
            "Invalid byte range"
        }
        if (emitted) return null
        val end = offset + length
        for (index in offset until end) {
            val value = data[index].toInt() and 0xFF
            if (awaitingStartCode) {
                startCode = value
                awaitingStartCode = false
                headerLength = 0
                currentSequenceExtensionTrusted = false
                if (value == SEQUENCE_HEADER) {
                    // A new header invalidates every prior rate and extension.
                    sequenceHeaderRateCandidate = null
                    sequenceBaseRate = null
                    sequenceRate = null
                    sequenceProgressive = false
                    sequenceExtensionComplete = false
                    sequenceExtensionEligible = false
                    sequenceHeaderMatrixBytesRemaining = 0
                    readNonIntraFlagAfterMatrix = false
                } else if (value != EXTENSION && value != USER_DATA) {
                    sequenceExtensionEligible = false
                }
                continue
            }

            if (value == 0) {
                if (zeroRun == MAX_PREFIX_ZEROS) {
                    consumePayloadByte(0)
                } else {
                    zeroRun++
                }
                if (emitted) return lastEvidence
                continue
            }

            if (value == 1 && zeroRun == MAX_PREFIX_ZEROS) {
                beginStartCode()
                zeroRun = 0
                continue
            }

            repeat(zeroRun) { consumePayloadByte(0) }
            zeroRun = 0
            consumePayloadByte(value)
            if (emitted) return lastEvidence
        }
        return null
    }

    private var lastEvidence: StreamRateEvidence? = null

    /** Forgets parser and stream state; the next valid header may report again. */
    fun reset() {
        zeroRun = 0
        awaitingStartCode = false
        startCode = NO_START_CODE
        headerLength = 0
        sequenceHeaderRateCandidate = null
        sequenceWidth = 0
        sequenceHeight = 0
        sequenceBaseRate = null
        sequenceRate = null
        sequenceProgressive = false
        sequenceExtensionComplete = false
        sequenceExtensionEligible = false
        currentSequenceExtensionTrusted = false
        sequenceHeaderMatrixBytesRemaining = 0
        readNonIntraFlagAfterMatrix = false
        emitted = false
        lastEvidence = null
    }

    private fun beginStartCode() {
        if (startCode == SEQUENCE_HEADER && !sequenceExtensionEligible) {
            sequenceHeaderRateCandidate = null
            sequenceBaseRate = null
            sequenceHeaderMatrixBytesRemaining = 0
            readNonIntraFlagAfterMatrix = false
        }
        awaitingStartCode = true
        startCode = NO_START_CODE
        headerLength = 0
    }

    private fun consumePayloadByte(value: Int) {
        if (startCode == SEQUENCE_HEADER) {
            consumeSequenceHeaderByte(value)
            return
        }
        if (startCode != EXTENSION || headerLength >= header.size) return
        header[headerLength++] = value.toByte()
        val extensionId = header[0].toInt() ushr 4 and 0x0F
        if (headerLength == 1) {
            if (extensionId == SEQUENCE_EXTENSION) {
                currentSequenceExtensionTrusted = sequenceExtensionEligible
            }
            // Only the sequence_extension immediately following a complete
            // sequence_header can make that header's rate trustworthy.
            sequenceExtensionEligible = false
        }

        when (extensionId) {
            SEQUENCE_EXTENSION -> {
                if (headerLength == SEQUENCE_EXTENSION_BYTES) {
                    if (!currentSequenceExtensionTrusted) return
                    val baseRate = sequenceBaseRate ?: return
                    if (header[3].toInt() and 0x01 == 0) {
                        sequenceHeaderRateCandidate = null
                        sequenceBaseRate = null
                        sequenceRate = null
                        sequenceProgressive = false
                        sequenceExtensionComplete = false
                        return
                    }
                    val progressive = header[1].toInt() and 0x08 != 0
                    val rateBits = header[5].toInt() and 0xFF
                    val numerator = ((rateBits ushr 5) and 0x03) + 1
                    val denominator = (rateBits and 0x1F) + 1
                    sequenceProgressive = progressive
                    sequenceExtensionComplete = true
                    val adjustedRate = baseRate * numerator.toFloat() / denominator.toFloat()
                    if (progressive) {
                        report(adjustedRate, StreamScanType.PROGRESSIVE)
                    } else {
                        sequenceRate = adjustedRate
                    }
                }
            }

            PICTURE_CODING_EXTENSION -> if (headerLength == PICTURE_EXTENSION_BYTES) {
                if (!sequenceExtensionComplete) return
                val rate = sequenceRate ?: return
                val pictureStructure = header[2].toInt() and 0x03
                if (pictureStructure !in 1..FRAME_PICTURE) return
                val repeatFirstField = header[3].toInt() and 0x02 != 0
                val progressiveFrame = header[4].toInt() and 0x80 != 0
                when {
                    !sequenceProgressive && pictureStructure == FRAME_PICTURE &&
                        progressiveFrame && repeatFirstField ->
                        report(rate, StreamScanType.REPEATED_FIELDS)

                    !sequenceProgressive && (pictureStructure != FRAME_PICTURE || !progressiveFrame) ->
                        report(rate, StreamScanType.INTERLACED)
                }
            }
        }
    }

    private fun consumeSequenceHeaderByte(value: Int) {
        if (headerLength < SEQUENCE_HEADER_BYTES) {
            header[headerLength++] = value.toByte()
            if (headerLength == SEQUENCE_HEADER_BYTES) {
                val code = header[3].toInt() and 0x0F
                sequenceHeaderRateCandidate = FRAME_RATES.getOrNull(code - 1)
            }
            return
        }

        if (headerLength < MIN_SEQUENCE_HEADER_BYTES) {
            header[headerLength++] = value.toByte()
            if (headerLength != MIN_SEQUENCE_HEADER_BYTES) return

            val first = header[0].toInt() and 0xFF
            val second = header[1].toInt() and 0xFF
            val third = header[2].toInt() and 0xFF
            val width = (first shl 4) or (second ushr 4)
            val height = ((second and 0x0F) shl 8) or third
            val markerValid = header[6].toInt() and SEQUENCE_MARKER_MASK != 0
            val rate = sequenceHeaderRateCandidate
            val headerValid = width > 0 && height > 0 && markerValid && rate != null
            if (!headerValid) sequenceHeaderRateCandidate = null
            sequenceWidth = if (headerValid) width else 0
            sequenceHeight = if (headerValid) height else 0
            val loadIntraMatrix = header[7].toInt() and LOAD_INTRA_MATRIX_MASK != 0
            if (loadIntraMatrix) {
                sequenceHeaderMatrixBytesRemaining = QUANTISER_MATRIX_BYTES
                readNonIntraFlagAfterMatrix = true
            } else if (header[7].toInt() and LOAD_NON_INTRA_MATRIX_MASK != 0) {
                sequenceHeaderMatrixBytesRemaining = QUANTISER_MATRIX_BYTES
            } else if (headerValid) {
                completeSequenceHeader(rate)
            }
            return
        }

        if (sequenceHeaderMatrixBytesRemaining <= 0) return
        sequenceHeaderMatrixBytesRemaining--
        if (sequenceHeaderMatrixBytesRemaining != 0) return

        if (readNonIntraFlagAfterMatrix) {
            readNonIntraFlagAfterMatrix = false
            if (value and LOAD_NON_INTRA_MATRIX_MASK != 0) {
                sequenceHeaderMatrixBytesRemaining = QUANTISER_MATRIX_BYTES
            } else {
                completeSequenceHeader(sequenceHeaderRateCandidate ?: return)
            }
        } else {
            completeSequenceHeader(sequenceHeaderRateCandidate ?: return)
        }
    }

    private fun completeSequenceHeader(rate: Float) {
        sequenceBaseRate = rate
        sequenceExtensionEligible = true
    }

    private fun report(rate: Float, scanType: StreamScanType) {
        if (!rate.isFinite() || rate <= 0f) return
        lastEvidence = StreamRateEvidence(rate, scanType, sequenceWidth, sequenceHeight)
        emitted = true
    }

    private companion object {
        const val NO_START_CODE = -1
        const val MAX_PREFIX_ZEROS = 2
        const val MAX_HEADER_BYTES = 8
        const val SEQUENCE_HEADER = 0xB3
        const val EXTENSION = 0xB5
        const val USER_DATA = 0xB2
        const val SEQUENCE_EXTENSION = 1
        const val PICTURE_CODING_EXTENSION = 8
        const val SEQUENCE_HEADER_BYTES = 4
        const val MIN_SEQUENCE_HEADER_BYTES = 8
        const val SEQUENCE_EXTENSION_BYTES = 6
        const val PICTURE_EXTENSION_BYTES = 5
        const val FRAME_PICTURE = 3
        const val SEQUENCE_MARKER_MASK = 0x20
        const val LOAD_INTRA_MATRIX_MASK = 0x02
        const val LOAD_NON_INTRA_MATRIX_MASK = 0x01
        const val QUANTISER_MATRIX_BYTES = 64

        // MPEG-2 sequence_header frame_rate_code values 1 through 8.
        val FRAME_RATES = floatArrayOf(
            24_000f / 1001f,
            24f,
            25f,
            30_000f / 1001f,
            30f,
            50f,
            60_000f / 1001f,
            60f,
        )
    }
}
