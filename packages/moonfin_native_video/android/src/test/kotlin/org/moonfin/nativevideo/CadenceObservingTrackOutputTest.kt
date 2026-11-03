package org.moonfin.nativevideo

import androidx.annotation.OptIn
import androidx.media3.common.DataReader
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.ParsableByteArray
import androidx.media3.common.util.UnstableApi
import androidx.media3.extractor.TrackOutput
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotSame
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.EOFException

@OptIn(UnstableApi::class)
class CadenceObservingTrackOutputTest {

    @Test
    fun `all sample data overloads delegate once with their original bytes and positions`() {
        val delegate = RecordingTrackOutput()
        val output = CadenceObservingTrackOutput(delegate, onCadence = {}, onHeader = {})
        output.format(videoFormat(MimeTypes.VIDEO_MPEG2))
        val readerThreeArgument = ByteArrayDataReader(byteArrayOf(1, 2, 3, 4))
        val readerFourArgument = ByteArrayDataReader(byteArrayOf(5, 6, 7, 8))
        val parsableTwoArgument = ParsableByteArray(byteArrayOf(9, 10, 11, 12))
        parsableTwoArgument.setPosition(1)
        val parsableThreeArgument = ParsableByteArray(byteArrayOf(13, 14, 15, 16, 17))
        parsableThreeArgument.setPosition(2)

        assertEquals(4, output.sampleData(readerThreeArgument, 4, false))
        assertEquals(
            4,
            output.sampleData(
                readerFourArgument,
                4,
                true,
                TrackOutput.SAMPLE_DATA_PART_ENCRYPTION,
            ),
        )
        output.sampleData(parsableTwoArgument, 2)
        output.sampleData(
            parsableThreeArgument,
            2,
            TrackOutput.SAMPLE_DATA_PART_SUPPLEMENTAL,
        )

        assertEquals(4, delegate.dataCalls.size)
        assertEquals(listOf("reader3", "reader4", "parsable2", "parsable3"), delegate.dataCalls.map { it.overload })
        assertArrayEquals(byteArrayOf(1, 2, 3, 4), delegate.dataCalls[0].bytes)
        assertArrayEquals(byteArrayOf(5, 6, 7, 8), delegate.dataCalls[1].bytes)
        assertArrayEquals(byteArrayOf(10, 11), delegate.dataCalls[2].bytes)
        assertArrayEquals(byteArrayOf(15, 16), delegate.dataCalls[3].bytes)
        assertEquals(false, delegate.dataCalls[0].allowEndOfInput)
        assertEquals(true, delegate.dataCalls[1].allowEndOfInput)
        assertEquals(TrackOutput.SAMPLE_DATA_PART_ENCRYPTION, delegate.dataCalls[1].sampleDataPart)
        assertEquals(TrackOutput.SAMPLE_DATA_PART_SUPPLEMENTAL, delegate.dataCalls[3].sampleDataPart)
        assertEquals(1, readerThreeArgument.readCalls)
        assertEquals(1, readerFourArgument.readCalls)
        assertNotSame(readerThreeArgument, delegate.dataCalls[0].reader)
        assertSame(readerFourArgument, delegate.dataCalls[1].reader)
        assertSame(parsableTwoArgument, delegate.dataCalls[2].parsable)
        assertEquals(1, delegate.dataCalls[2].parsablePosition)
        assertSame(parsableThreeArgument, delegate.dataCalls[3].parsable)
        assertEquals(2, delegate.dataCalls[3].parsablePosition)
        assertEquals(3, parsableTwoArgument.position)
        assertEquals(4, parsableThreeArgument.position)
    }

    @Test
    fun `partial data reader returns the delegate length after exactly one underlying read`() {
        val delegate = RecordingTrackOutput(readerChunkSize = 3)
        val output = CadenceObservingTrackOutput(delegate, onCadence = {}, onHeader = {})
        output.format(videoFormat(MimeTypes.VIDEO_MPEG2))
        val reader = ByteArrayDataReader(byteArrayOf(21, 22, 23, 24, 25, 26))

        val appended = output.sampleData(reader, 6, false)

        assertEquals(3, appended)
        assertEquals(1, reader.readCalls)
        assertNotSame(reader, delegate.dataCalls.single().reader)
        assertArrayEquals(byteArrayOf(21, 22, 23), delegate.dataCalls.single().bytes)
        assertEquals(false, delegate.dataCalls.single().allowEndOfInput)
    }

    @Test
    fun `EOF and allowEndOfInput behavior pass through unchanged`() {
        val delegate = RecordingTrackOutput()
        val output = CadenceObservingTrackOutput(delegate, onCadence = {}, onHeader = {})
        output.format(videoFormat(MimeTypes.VIDEO_MPEG2))
        val eofReader = ByteArrayDataReader(byteArrayOf())

        assertEquals(-1, output.sampleData(eofReader, 4, true))
        assertEquals(true, delegate.dataCalls.single().allowEndOfInput)
        assertEquals(-1, delegate.dataCalls.single().readResult)
        assertEquals(1, eofReader.readCalls)

        var eofThrown = false
        try {
            output.sampleData(ByteArrayDataReader(byteArrayOf()), 4, false)
        } catch (_: EOFException) {
            eofThrown = true
        }
        assertTrue(eofThrown)
        assertEquals(2, delegate.dataCalls.size)
        assertEquals(false, delegate.dataCalls.last().allowEndOfInput)
        assertEquals(-1, delegate.dataCalls.last().readResult)
    }

    @Test
    fun `progressive MPEG2 sequence in initialization data reports before following picture bytes`() {
        val delegate = RecordingTrackOutput()
        val evidence = mutableListOf<StreamRateEvidence>()
        val output = CadenceObservingTrackOutput(delegate, onCadence = {}, onHeader = evidence::add)
        val initializationData = progressive2997Sequence()
        val format = videoFormat(MimeTypes.VIDEO_MPEG2, listOf(initializationData))

        output.format(format)

        assertSame(format, delegate.formats.single())
        assertEquals(29_970f / 1000f, evidence.single().frameRate, 0.001f)
        assertEquals(StreamScanType.PROGRESSIVE, evidence.single().scanType)

        val pictureBytes = ParsableByteArray(byteArrayOf(0, 0, 1, 0x00, 0x12, 0x34, 0x55))
        output.sampleData(pictureBytes, pictureBytes.bytesLeft())
        assertEquals(1, evidence.size)
        assertArrayEquals(byteArrayOf(0, 0, 1, 0, 0x12, 0x34, 0x55), delegate.dataCalls.single().bytes)
    }

    @Test
    fun `a later sequence header reports only when its rate changes`() {
        val evidence = mutableListOf<StreamRateEvidence>()
        val output = CadenceObservingTrackOutput(RecordingTrackOutput(), onCadence = {}, onHeader = evidence::add)
        output.format(videoFormat(MimeTypes.VIDEO_MPEG2))

        val first = progressive2997Sequence()
        output.sampleData(ParsableByteArray(first), first.size)
        // The next group of pictures repeats the same header.
        val repeat = progressive2997Sequence()
        output.sampleData(ParsableByteArray(repeat), repeat.size)
        assertEquals(1, evidence.size)

        // A programme boundary brings a 25 fps sequence.
        val next = progressiveSequence(frameRateCode = 3)
        output.sampleData(ParsableByteArray(next), next.size)
        assertEquals(2, evidence.size)
        assertEquals(25f, evidence.last().frameRate, 0.001f)
        assertEquals(StreamScanType.PROGRESSIVE, evidence.last().scanType)
    }

    @Test
    fun `the first video sample is reported once per reset`() {
        var firstSamples = 0
        val output = CadenceObservingTrackOutput(
            RecordingTrackOutput(), onCadence = {}, onHeader = {}, onFirstSample = { firstSamples++ },
        )
        output.format(videoFormat(MimeTypes.VIDEO_H264))
        output.sampleMetadata(0L, 0, 0, 0, null)
        output.sampleMetadata(33_367L, 0, 0, 0, null)
        assertEquals(1, firstSamples)
        output.reset()
        output.sampleMetadata(66_733L, 0, 0, 0, null)
        assertEquals(2, firstSamples)
    }

    @Test
    fun `non MPEG2 formats never report header evidence`() {
        val delegate = RecordingTrackOutput()
        val evidence = mutableListOf<StreamRateEvidence>()
        val output = CadenceObservingTrackOutput(delegate, onCadence = {}, onHeader = evidence::add)
        val header = progressive2997Sequence()
        val format = videoFormat(MimeTypes.VIDEO_H264, listOf(header))

        output.format(format)
        output.sampleData(ParsableByteArray(header), header.size)

        assertTrue(evidence.isEmpty())
        assertSame(format, delegate.formats.single())
        assertArrayEquals(header, delegate.dataCalls.single().bytes)
    }

    @Test
    fun `supplementary and encryption sample parts do not feed the header observer`() {
        val delegate = RecordingTrackOutput()
        val evidence = mutableListOf<StreamRateEvidence>()
        val output = CadenceObservingTrackOutput(delegate, onCadence = {}, onHeader = evidence::add)
        val header = progressive2997Sequence()
        output.format(videoFormat(MimeTypes.VIDEO_MPEG2))

        output.sampleData(
            ByteArrayDataReader(header),
            header.size,
            false,
            TrackOutput.SAMPLE_DATA_PART_ENCRYPTION,
        )
        output.sampleData(
            ByteArrayDataReader(header),
            header.size,
            false,
            TrackOutput.SAMPLE_DATA_PART_SUPPLEMENTAL,
        )
        output.sampleData(
            ParsableByteArray(header),
            header.size,
            TrackOutput.SAMPLE_DATA_PART_ENCRYPTION,
        )
        output.sampleData(
            ParsableByteArray(header),
            header.size,
            TrackOutput.SAMPLE_DATA_PART_SUPPLEMENTAL,
        )

        assertTrue(evidence.isEmpty())
        assertEquals(4, delegate.dataCalls.size)
        delegate.dataCalls.forEach { assertArrayEquals(header, it.bytes) }
    }

    @Test
    fun `main data reader and parsable overloads contribute header evidence`() {
        val delegate = RecordingTrackOutput()
        val evidence = mutableListOf<StreamRateEvidence>()
        val output = CadenceObservingTrackOutput(delegate, onCadence = {}, onHeader = evidence::add)
        val header = progressive2997Sequence()
        output.format(videoFormat(MimeTypes.VIDEO_MPEG2))

        output.sampleData(
            ByteArrayDataReader(header),
            header.size,
            false,
            TrackOutput.SAMPLE_DATA_PART_MAIN,
        )
        assertEquals(1, evidence.size)

        output.reset()
        output.sampleData(
            ParsableByteArray(header),
            header.size,
            TrackOutput.SAMPLE_DATA_PART_MAIN,
        )

        assertEquals(2, evidence.size)
        assertEquals(StreamScanType.PROGRESSIVE, evidence.last().scanType)
        assertArrayEquals(header, delegate.dataCalls[0].bytes)
        assertArrayEquals(header, delegate.dataCalls[1].bytes)
    }

    @Test
    fun `throwing header callback does not stop format forwarding`() {
        val delegate = RecordingTrackOutput()
        var callbackCount = 0
        val output = CadenceObservingTrackOutput(
            delegate,
            onCadence = {},
            onHeader = {
                callbackCount++
                error("diagnostics unavailable")
            },
        )
        val format = videoFormat(MimeTypes.VIDEO_MPEG2, listOf(progressive2997Sequence()))

        output.format(format)

        assertEquals(1, callbackCount)
        assertSame(format, delegate.formats.single())
    }

    @Test
    fun `reset allows fresh MPEG2 header evidence`() {
        val delegate = RecordingTrackOutput()
        val evidence = mutableListOf<StreamRateEvidence>()
        val output = CadenceObservingTrackOutput(delegate, onCadence = {}, onHeader = evidence::add)
        val header = progressive2997Sequence()
        output.format(videoFormat(MimeTypes.VIDEO_MPEG2, listOf(header)))
        assertEquals(1, evidence.size)

        output.reset()
        output.sampleData(ParsableByteArray(header), header.size)

        assertEquals(2, evidence.size)
        assertEquals(StreamScanType.PROGRESSIVE, evidence.last().scanType)
    }

    private fun videoFormat(mimeType: String, initializationData: List<ByteArray> = emptyList()) =
        Format.Builder()
            .setSampleMimeType(mimeType)
            .setInitializationData(initializationData)
            .build()

    private fun progressive2997Sequence(): ByteArray = progressiveSequence(frameRateCode = 4)

    private fun progressiveSequence(frameRateCode: Int): ByteArray = byteArrayOf(
        0, 0, 1, 0xB3.toByte(),
        0x78, 0x04, 0x38, (0x30 or frameRateCode).toByte(), 0xFF.toByte(), 0xFF.toByte(), 0xE0.toByte(), 0x18,
        0, 0, 1, 0xB5.toByte(),
        0x14, 0x8A.toByte(), 0x00, 0x01, 0x00, 0x00,
        0x55, 0x66,
    )

    private class ByteArrayDataReader(
        private val bytes: ByteArray,
        private val maxReadSize: Int = Int.MAX_VALUE,
    ) : DataReader {
        private var position = 0
        var readCalls = 0
            private set

        override fun read(buffer: ByteArray, offset: Int, length: Int): Int {
            readCalls++
            if (position >= bytes.size) return -1
            val count = minOf(length, maxReadSize, bytes.size - position)
            bytes.copyInto(buffer, offset, position, position + count)
            position += count
            return count
        }
    }

    private class RecordingTrackOutput(
        private val readerChunkSize: Int = Int.MAX_VALUE,
    ) : TrackOutput {
        val dataCalls = mutableListOf<DataCall>()
        val formats = mutableListOf<Format>()

        override fun format(format: Format) {
            formats += format
        }

        override fun sampleData(input: DataReader, length: Int, allowEndOfInput: Boolean): Int =
            readData("reader3", input, length, allowEndOfInput, TrackOutput.SAMPLE_DATA_PART_MAIN)

        override fun sampleData(
            input: DataReader,
            length: Int,
            allowEndOfInput: Boolean,
            sampleDataPart: Int,
        ): Int = readData("reader4", input, length, allowEndOfInput, sampleDataPart)

        override fun sampleData(data: ParsableByteArray, length: Int) =
            copyData("parsable2", data, length, TrackOutput.SAMPLE_DATA_PART_MAIN)

        override fun sampleData(data: ParsableByteArray, length: Int, sampleDataPart: Int) =
            copyData("parsable3", data, length, sampleDataPart)

        override fun sampleMetadata(
            timeUs: Long,
            flags: Int,
            size: Int,
            offset: Int,
            cryptoData: TrackOutput.CryptoData?,
        ) = Unit

        private fun readData(
            overload: String,
            input: DataReader,
            length: Int,
            allowEndOfInput: Boolean,
            sampleDataPart: Int,
        ): Int {
            val buffer = ByteArray(length)
            val count = input.read(buffer, 0, minOf(length, readerChunkSize))
            dataCalls += DataCall(
                overload = overload,
                bytes = if (count > 0) buffer.copyOf(count) else byteArrayOf(),
                allowEndOfInput = allowEndOfInput,
                sampleDataPart = sampleDataPart,
                readResult = count,
                reader = input,
            )
            if (count < 0 && !allowEndOfInput) throw EOFException()
            return count
        }

        private fun copyData(
            overload: String,
            data: ParsableByteArray,
            length: Int,
            sampleDataPart: Int,
        ) {
            val start = data.position
            val bytes = data.data.copyOfRange(start, start + length)
            dataCalls += DataCall(
                overload = overload,
                bytes = bytes,
                sampleDataPart = sampleDataPart,
                parsable = data,
                parsablePosition = start,
            )
            data.setPosition(start + length)
        }
    }

    private data class DataCall(
        val overload: String,
        val bytes: ByteArray,
        val allowEndOfInput: Boolean? = null,
        val sampleDataPart: Int,
        val readResult: Int? = null,
        val parsable: ParsableByteArray? = null,
        val parsablePosition: Int? = null,
        val reader: DataReader? = null,
    )
}
