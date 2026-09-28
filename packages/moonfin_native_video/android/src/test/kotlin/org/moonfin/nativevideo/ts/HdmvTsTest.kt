package org.moonfin.nativevideo.ts

import androidx.media3.common.DataReader
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.ParsableByteArray
import androidx.media3.extractor.DtsUtil
import androidx.media3.extractor.ExtractorOutput
import androidx.media3.extractor.SeekMap
import androidx.media3.extractor.TrackOutput
import androidx.media3.extractor.ts.DefaultTsPayloadReaderFactory
import androidx.media3.extractor.ts.PesReader
import androidx.media3.extractor.ts.TsPayloadReader
import java.io.ByteArrayOutputStream
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import org.moonfin.nativevideo.iec.DtsFraming

class HdmvTsTest {

    @Test fun `a DTS-HD access unit goes out as one sample`() {
        val units = accessUnits(withExtension = true)
        val track = read(units)

        val format = track.format!!
        assertEquals(MimeTypes.AUDIO_DTS_HD, format.sampleMimeType)
        assertEquals(8, format.channelCount)
        assertEquals(48_000, format.sampleRate)
        assertEquals(units.size, track.samples.size)
        units.forEachIndexed { i, unit -> assertArrayEquals(unit, track.samples[i].data) }
        val core = DtsFraming.parseCoreHeader(units[0], 0, units[0].size)
        val stepUs = core.samples * 1_000_000L / core.sampleRate
        track.samples.forEachIndexed { i, sample -> assertEquals(1_000L + i * stepUs, sample.timeUs) }
    }

    @Test fun `a core-only stream stays DTS`() {
        val units = accessUnits(withExtension = false)
        val track = read(units)

        val expected = DtsUtil.parseDtsFormat(units[0], null, null, 0, MimeTypes.VIDEO_MP2T, null)
        assertEquals(MimeTypes.AUDIO_DTS, track.format!!.sampleMimeType)
        assertEquals(expected.channelCount, track.format!!.channelCount)
        assertEquals(units.size, track.samples.size)
    }

    @Test fun `the HDMV registration marks a Blu-ray stream`() {
        val stream = stream(registration = "HDMV")
        assertTrue(HdmvRegistration.find(stream, stream.size))
    }

    @Test fun `a stream without it is left to Media3`() {
        val plain = stream(registration = null)
        val scte35 = stream(registration = "CUEI")
        assertFalse(HdmvRegistration.find(plain, plain.size))
        assertFalse(HdmvRegistration.find(scte35, scte35.size))
    }

    @Test fun `Blu-ray DTS stream types only get the DTS reader on an HDMV stream`() {
        val readers = HdmvTsPayloadReaderFactory(DefaultTsPayloadReaderFactory())
        val esInfo = TsPayloadReader.EsInfo(0x86, null, 0, null, ByteArray(0))

        assertFalse(readers.createPayloadReader(0x86, esInfo) is PesReader)
        readers.hdmv = true
        assertTrue(readers.createPayloadReader(0x86, esInfo) is PesReader)
        assertTrue(readers.createPayloadReader(0x85, esInfo) is PesReader)
        assertTrue(readers.createPayloadReader(0x82, esInfo) is PesReader)
        assertNull(readers.createPayloadReader(0x7F, esInfo))
    }

    private fun read(units: List<ByteArray>): RecordingTrack {
        val track = RecordingTrack()
        val output = object : ExtractorOutput {
            override fun track(id: Int, type: Int): TrackOutput = track
            override fun endTracks() = Unit
            override fun seekMap(seekMap: SeekMap) = Unit
        }
        val reader = HdmvDtsReader(language = null, roleFlags = 0)
        reader.createTracks(output, TsPayloadReader.TrackIdGenerator(0, 1))
        reader.packetStarted(1_000L, 0)
        reader.consume(ParsableByteArray(units.reduce(ByteArray::plus)))
        reader.packetFinished(false)
        return track
    }

    private fun accessUnits(withExtension: Boolean): List<ByteArray> {
        val cores = javaClass.getResourceAsStream("/iec/dts.bin")!!.readBytes()
        val units = mutableListOf<ByteArray>()
        var pos = 0
        while (pos < cores.size && units.size < 8) {
            val size = DtsFraming.parseCoreHeader(cores, pos, cores.size - pos).coreSizeBytes
            val core = cores.copyOfRange(pos, pos + size)
            units += if (withExtension) core + extensionSubstream() else core
            pos += size
        }
        return units
    }

    // One asset, 8 channels at 48 kHz, in the layout parseDtsHdHeader reads.
    private fun extensionSubstream(): ByteArray {
        val payloadBytes = 64
        val bits = BitWriter()
        bits.write(0x64582025L, 32)
        bits.write(0, 8 + 2 + 1)
        bits.write(EXTENSION_HEADER_BYTES - 1L, 8)
        bits.write(EXTENSION_HEADER_BYTES + payloadBytes - 1L, 16)
        bits.write(1, 1)
        bits.write(2, 2)
        bits.write(0, 3 + 1 + 3 + 3)
        bits.write(1, 1)
        bits.write(1, 8)
        bits.write(0, 1)
        bits.write(payloadBytes - 1L, 16)
        bits.write(0, 9 + 3 + 3)
        bits.write(23, 5)
        bits.write(12, 4)
        bits.write(7, 8)
        return bits.toBytes(EXTENSION_HEADER_BYTES) + ByteArray(payloadBytes) { 0x22 }
    }

    // An SDT, a PAT for program 1 on PID 0x100, then its PMT with one DTS-HD
    // MA stream, the order ffmpeg writes them in.
    private fun stream(registration: String?): ByteArray {
        val info = registration?.let { byteArrayOf(0x05, 4) + it.toByteArray(Charsets.US_ASCII) }
            ?: ByteArray(0)
        val pat = section(0x00, byteArrayOf(0x00, 0x01, 0xE1.toByte(), 0x00))
        val pmt = section(
            0x02,
            byteArrayOf(0xE1.toByte(), 0x00, 0xF0.toByte(), info.size.toByte()) + info +
                byteArrayOf(0x86.toByte(), 0xE1.toByte(), 0x00, 0xF0.toByte(), 0x00),
        )
        return packet(0x011, section(0x42, ByteArray(0))) + packet(0x000, pat) + packet(0x100, pmt)
    }

    private fun section(tableId: Int, body: ByteArray): ByteArray {
        val length = 5 + body.size + 4
        return byteArrayOf(
            tableId.toByte(), (0xB0 or (length shr 8)).toByte(), length.toByte(),
            0x00, 0x01, 0xC1.toByte(), 0x00, 0x00,
        ) + body + ByteArray(4)
    }

    private fun packet(pid: Int, section: ByteArray): ByteArray {
        val header = byteArrayOf(0x47, (0x40 or (pid shr 8)).toByte(), pid.toByte(), 0x10, 0x00)
        return (header + section).copyOf(188).also { it.fill(0xFF.toByte(), header.size + section.size) }
    }

    private class BitWriter {
        private val bits = mutableListOf<Boolean>()

        fun write(value: Long, count: Int) {
            for (i in count - 1 downTo 0) bits += (value shr i) and 1L == 1L
        }

        fun toBytes(size: Int) = ByteArray(size) { index ->
            (0 until 8).fold(0) { byte, bit ->
                (byte shl 1) or if (bits.getOrElse(index * 8 + bit) { false }) 1 else 0
            }.toByte()
        }
    }

    private class Sample(val timeUs: Long, val data: ByteArray)

    private class RecordingTrack : TrackOutput {
        var format: Format? = null
        val samples = mutableListOf<Sample>()
        private val pending = ByteArrayOutputStream()

        override fun format(format: Format) {
            this.format = format
        }

        override fun sampleData(
            input: DataReader,
            length: Int,
            allowEndOfInput: Boolean,
            sampleDataPart: Int,
        ): Int = throw UnsupportedOperationException()

        override fun sampleData(data: ParsableByteArray, length: Int, sampleDataPart: Int) {
            val bytes = ByteArray(length)
            data.readBytes(bytes, 0, length)
            pending.write(bytes)
        }

        override fun sampleMetadata(
            timeUs: Long,
            flags: Int,
            size: Int,
            offset: Int,
            cryptoData: TrackOutput.CryptoData?,
        ) {
            samples += Sample(timeUs, pending.toByteArray())
            pending.reset()
        }
    }

    private companion object {
        const val EXTENSION_HEADER_BYTES = 18
    }
}
