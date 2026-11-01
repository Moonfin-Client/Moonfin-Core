package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class Mpeg2RateHeaderObserverTest {

    @Test
    fun `all sequence frame rate codes map to their defined rates`() {
        val expected = doubleArrayOf(
            24_000.0 / 1001.0, 24.0, 25.0, 30_000.0 / 1001.0,
            30.0, 50.0, 60_000.0 / 1001.0, 60.0,
        )
        expected.forEachIndexed { index, rate ->
            val evidence = parse(sequence(index + 1, progressive = true))!!
            assertEquals(rate, evidence.frameRate.toDouble(), 0.001)
            assertEquals(StreamScanType.PROGRESSIVE, evidence.scanType)
        }
    }

    @Test
    fun `sequence extension applies numerator and denominator`() {
        val evidence = parse(sequence(4, progressive = true, numerator = 2, denominator = 3))!!
        assertEquals((30_000.0 / 1001.0) * 2.0 / 3.0, evidence.frameRate.toDouble(), 0.001)
    }

    @Test
    fun `evidence carries the sequence header's picture size`() {
        val evidence = parse(
            sequenceHeader(4, width = 1920, height = 1080) +
                sequenceExtension(progressive = true) +
                byteArrayOf(0, 0, 1, 0xB8.toByte()),
        )!!
        assertEquals(1920, evidence.width)
        assertEquals(1080, evidence.height)
    }

    @Test
    fun `progressive sequence reports adjusted 29_97 and 59_94 rates`() {
        val progressive2997 = parse(sequence(4, progressive = true))!!
        assertEquals(30_000.0 / 1001.0, progressive2997.frameRate.toDouble(), 0.001)

        val progressive5994 = parse(sequence(4, progressive = true, numerator = 2, denominator = 1))!!
        assertEquals(60_000.0 / 1001.0, progressive5994.frameRate.toDouble(), 0.001)
    }

    @Test
    fun `first nonprogressive picture in a 29_97 sequence reports interlaced`() {
        val stream = sequence(4, progressive = false) + pictureExtension(
            pictureStructure = 1,
            progressiveFrame = false,
        )
        val evidence = parse(stream)!!
        assertEquals(30_000.0 / 1001.0, evidence.frameRate.toDouble(), 0.001)
        assertEquals(StreamScanType.INTERLACED, evidence.scanType)
    }

    @Test
    fun `progressive repeat first field reports repeated fields`() {
        val stream = sequence(4, progressive = false) + pictureExtension(
            pictureStructure = 3,
            progressiveFrame = true,
            repeatFirstField = true,
        )
        val evidence = parse(stream)!!
        assertEquals(StreamScanType.REPEATED_FIELDS, evidence.scanType)
        assertEquals(30_000.0 / 1001.0, evidence.frameRate.toDouble(), 0.001)
    }

    @Test
    fun `progressive picture without repeat remains unknown until later repeated fields`() {
        val observer = Mpeg2RateHeaderObserver()
        val base = sequence(4, progressive = false)
        assertNull(observer.onData(base, 0, base.size))
        val ordinaryProgressivePicture = pictureExtension(
            pictureStructure = 3,
            progressiveFrame = true,
            repeatFirstField = false,
        )
        assertNull(observer.onData(ordinaryProgressivePicture, 0, ordinaryProgressivePicture.size))

        val repeatedPicture = pictureExtension(
            pictureStructure = 3,
            progressiveFrame = true,
            repeatFirstField = true,
        )
        assertEquals(StreamScanType.REPEATED_FIELDS, observer.onData(repeatedPicture, 0, repeatedPicture.size)?.scanType)
    }

    @Test
    fun `split at every byte and one byte chunks preserve sequence and picture headers`() {
        val stream = sequence(4, progressive = false) + pictureExtension(
            pictureStructure = 3,
            progressiveFrame = true,
            repeatFirstField = true,
        )
        for (split in 0..stream.size) {
            val observer = Mpeg2RateHeaderObserver()
            val first = observer.onData(stream, 0, split)
            val evidence = first ?: observer.onData(stream, split, stream.size - split)
            assertEquals("split at $split", StreamScanType.REPEATED_FIELDS, evidence?.scanType)
        }

        val bytewiseObserver = Mpeg2RateHeaderObserver()
        var evidence: StreamRateEvidence? = null
        stream.forEachIndexed { index, byte ->
            val result = bytewiseObserver.onData(byteArrayOf(byte), 0, 1)
            if (result != null) {
                assertNull("reported before final header byte at index $index", evidence)
                evidence = result
            }
        }
        assertEquals(StreamScanType.REPEATED_FIELDS, evidence?.scanType)
    }

    @Test
    fun `offset ranges are parsed without reading surrounding bytes`() {
        val stream = byteArrayOf(0x55) + sequence(4, progressive = true) + byteArrayOf(0x66)
        val observer = Mpeg2RateHeaderObserver()
        val evidence = observer.onData(stream, 1, stream.size - 2)
        assertEquals(30_000.0 / 1001.0, evidence!!.frameRate.toDouble(), 0.001)
    }

    @Test
    fun `sequence header must be complete before a sequence extension can establish a rate`() {
        val observer = Mpeg2RateHeaderObserver()
        val fourBytePrefix = sequenceHeader(4).copyOf(START_CODE_BYTES + SEQUENCE_HEADER_RATE_BYTES)
        val truncated = fourBytePrefix + sequenceExtension(progressive = true)
        assertNull(observer.onData(truncated, 0, truncated.size))

        val valid = sequence(4, progressive = true)
        assertEquals(StreamScanType.PROGRESSIVE, observer.onData(valid, 0, valid.size)?.scanType)
    }

    @Test
    fun `sequence header dimensions marker and optional matrices are validated`() {
        val observer = Mpeg2RateHeaderObserver()
        val badDimensions = sequenceHeader(4, width = 0) + sequenceExtension(progressive = true)
        assertNull(observer.onData(badDimensions, 0, badDimensions.size))
        val badMarker = sequenceHeader(4, markerValid = false) + sequenceExtension(progressive = true)
        assertNull(observer.onData(badMarker, 0, badMarker.size))

        val partialMatrix = sequenceHeader(4, loadIntraMatrix = true)
            .copyOf(START_CODE_BYTES + SEQUENCE_HEADER_PREFIX_BYTES + 20) + sequenceExtension(progressive = true)
        assertNull(observer.onData(partialMatrix, 0, partialMatrix.size))

        val completeMatrices = sequence(
            4,
            progressive = true,
            loadIntraMatrix = true,
            loadNonIntraMatrix = true,
        )
        assertEquals(StreamScanType.PROGRESSIVE, observer.onData(completeMatrices, 0, completeMatrices.size)?.scanType)

        for (split in 0..completeMatrices.size) {
            val splitObserver = Mpeg2RateHeaderObserver()
            val first = splitObserver.onData(completeMatrices, 0, split)
            val evidence = first ?: splitObserver.onData(
                completeMatrices,
                split,
                completeMatrices.size - split,
            )
            assertEquals("matrix header split at $split", StreamScanType.PROGRESSIVE, evidence?.scanType)
        }
    }

    @Test
    fun `zero valued picture start code prevents a later extension from reusing the old sequence`() {
        val stream = sequenceHeader(4) + byteArrayOf(0, 0, 1, 0, 0x12, 0x34) +
            sequenceExtension(progressive = true)
        for (split in 0..stream.size) {
            val splitObserver = Mpeg2RateHeaderObserver()
            val first = splitObserver.onData(stream, 0, split)
            val later = splitObserver.onData(stream, split, stream.size - split)
            assertNull("zero start code split at $split", first ?: later)
            val valid = sequence(4, progressive = true)
            assertEquals(
                "valid sequence after zero start code split at $split",
                StreamScanType.PROGRESSIVE,
                splitObserver.onData(valid, 0, valid.size)?.scanType,
            )
        }
    }

    @Test
    fun `invalid sequence extension marker clears its pending rate`() {
        val observer = Mpeg2RateHeaderObserver()
        val malformed = sequenceHeader(4) + sequenceExtension(progressive = true, markerValid = false) +
            pictureExtension(pictureStructure = 3, progressiveFrame = true)
        assertNull(observer.onData(malformed, 0, malformed.size))

        val valid = sequence(4, progressive = true)
        assertEquals(StreamScanType.PROGRESSIVE, observer.onData(valid, 0, valid.size)?.scanType)
    }

    @Test
    fun `reserved and truncated headers recover at a later valid sequence`() {
        val observer = Mpeg2RateHeaderObserver()
        for (code in 0..15) {
            if (code in 1..8) continue
            val reservedCode = sequenceHeader(code) + sequenceExtension(progressive = true)
            assertNull("reserved frame_rate_code $code", observer.onData(reservedCode, 0, reservedCode.size))
        }

        val truncatedHeader = sequenceHeader(4) + byteArrayOf(0, 0, 1, EXTENSION.toByte(), 0x14, 0x82.toByte())
        assertNull(observer.onData(truncatedHeader, 0, truncatedHeader.size))
        val valid = sequence(4, progressive = true)
        assertEquals(StreamScanType.PROGRESSIVE, observer.onData(valid, 0, valid.size)?.scanType)
    }

    @Test
    fun `new sequence clears old rate until its extension is complete`() {
        val observer = Mpeg2RateHeaderObserver()
        val old = sequence(4, progressive = false)
        assertNull(observer.onData(old, 0, old.size))

        val invalidNewSequence = sequenceHeader(0) + pictureExtension(
            pictureStructure = 1,
            progressiveFrame = false,
        )
        assertNull(observer.onData(invalidNewSequence, 0, invalidNewSequence.size))
    }

    @Test
    fun `reset allows one fresh report and each reset emits at most once`() {
        val observer = Mpeg2RateHeaderObserver()
        val valid = sequence(4, progressive = true)
        assertEquals(StreamScanType.PROGRESSIVE, observer.onData(valid, 0, valid.size)?.scanType)
        assertNull(observer.onData(valid, 0, valid.size))
        observer.reset()
        assertEquals(StreamScanType.PROGRESSIVE, observer.onData(valid, 0, valid.size)?.scanType)
        assertNull(observer.onData(valid, 0, valid.size))
    }

    private fun parse(bytes: ByteArray): StreamRateEvidence? {
        val observer = Mpeg2RateHeaderObserver()
        return observer.onData(bytes, 0, bytes.size)
    }

    private fun sequence(
        frameRateCode: Int,
        progressive: Boolean,
        numerator: Int = 1,
        denominator: Int = 1,
        loadIntraMatrix: Boolean = false,
        loadNonIntraMatrix: Boolean = false,
    ): ByteArray = sequenceHeader(frameRateCode, loadIntraMatrix = loadIntraMatrix, loadNonIntraMatrix = loadNonIntraMatrix) +
        sequenceExtension(progressive, numerator, denominator) +
        byteArrayOf(0, 0, 1, 0xB8.toByte())

    private fun sequenceHeader(
        frameRateCode: Int,
        width: Int = 720,
        height: Int = 480,
        markerValid: Boolean = true,
        loadIntraMatrix: Boolean = false,
        loadNonIntraMatrix: Boolean = false,
    ): ByteArray {
        val payload = ByteArray(SEQUENCE_HEADER_PREFIX_BYTES)
        payload[0] = (width ushr 4).toByte()
        payload[1] = (((width and 0x0F) shl 4) or (height ushr 8)).toByte()
        payload[2] = height.toByte()
        payload[3] = frameRateCode.toByte()
        payload[6] = (if (markerValid) 0x20 else 0x00).toByte()
        payload[7] = (if (loadIntraMatrix) 0x02 else 0x00).toByte()

        val intraMatrix = if (loadIntraMatrix) ByteArray(QUANTISER_MATRIX_BYTES) { 0x02 } else ByteArray(0)
        if (loadIntraMatrix) {
            intraMatrix[QUANTISER_MATRIX_BYTES - 1] = (if (loadNonIntraMatrix) 0x03 else 0x02).toByte()
        } else if (!loadIntraMatrix && loadNonIntraMatrix) {
            payload[7] = (payload[7].toInt() or LOAD_NON_INTRA_MATRIX_MASK).toByte()
        }
        val nonIntraMatrix = if (loadNonIntraMatrix) ByteArray(QUANTISER_MATRIX_BYTES) { 1 } else ByteArray(0)
        return byteArrayOf(0, 0, 1, SEQUENCE_HEADER.toByte()) + payload + intraMatrix + nonIntraMatrix
    }

    private fun sequenceExtension(
        progressive: Boolean,
        numerator: Int = 1,
        denominator: Int = 1,
        markerValid: Boolean = true,
    ): ByteArray {
        require(numerator in 1..4)
        require(denominator in 1..32)
        val rateBits = ((numerator - 1) shl 5) or (denominator - 1)
        return byteArrayOf(
            0, 0, 1, EXTENSION.toByte(),
            0x14, (if (progressive) 0x8A else 0x82).toByte(), 0,
            (if (markerValid) 1 else 0).toByte(), 0, rateBits.toByte(),
        )
    }

    private fun pictureExtension(
        pictureStructure: Int,
        progressiveFrame: Boolean,
        repeatFirstField: Boolean = false,
    ): ByteArray = byteArrayOf(
        0, 0, 1, EXTENSION.toByte(),
        0x81.toByte(), 0x11, (0x10 or pictureStructure).toByte(),
        ((if (progressiveFrame) 0x41 else 0x00) or (if (repeatFirstField) 0x02 else 0x00)).toByte(),
        if (progressiveFrame) 0x80.toByte() else 0x00,
    ) + byteArrayOf(0, 0, 1, 0xB8.toByte())

    private companion object {
        const val SEQUENCE_HEADER = 0xB3
        const val EXTENSION = 0xB5
        const val START_CODE_BYTES = 4
        const val SEQUENCE_HEADER_PREFIX_BYTES = 8
        const val SEQUENCE_HEADER_RATE_BYTES = 4
        const val QUANTISER_MATRIX_BYTES = 64
        const val LOAD_NON_INTRA_MATRIX_MASK = 0x01
    }
}
