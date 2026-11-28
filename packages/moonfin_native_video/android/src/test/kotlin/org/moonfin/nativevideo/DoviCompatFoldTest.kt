package org.moonfin.nativevideo

import android.media.MediaCodecInfo
import android.media.MediaFormat
import androidx.annotation.OptIn
import androidx.media3.common.C
import androidx.media3.common.DataReader
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.ParsableByteArray
import androidx.media3.common.util.UnstableApi
import androidx.media3.extractor.DefaultExtractorInput
import androidx.media3.extractor.Extractor
import androidx.media3.extractor.ExtractorInput
import androidx.media3.extractor.ExtractorOutput
import androidx.media3.extractor.ExtractorsFactory
import androidx.media3.extractor.PositionHolder
import androidx.media3.extractor.SeekMap
import androidx.media3.extractor.TrackOutput
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import org.robolectric.shadows.MediaCodecInfoBuilder
import org.robolectric.shadows.ShadowMediaCodecList

/**
 * The FEL fold's hold-back through the real extractor chain, with libdovi and
 * the side decoders swapped out: the player's decoder never reports ready, so
 * no GOP gets a fit, which is what a box sees before playback starts.
 */
@OptIn(UnstableApi::class)
@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35], manifest = Config.NONE)
class DoviCompatFoldTest {

    private val start = byteArrayOf(0, 0, 0, 1)
    private val baseNal = byteArrayOf(0x02, 0x01, 0x55)
    private val enhancementNal = byteArrayOf(0x7E, 0x01, 0x02, 0x01, 0x66)
    private val keptRpu = byteArrayOf(0x7C, 0x01, 0x0B)
    private val plainRpu = byteArrayOf(0x7C, 0x01, 0x08)

    private class Sample(val timeUs: Long, val flags: Int, val data: ByteArray)

    /** A hardware HEVC decoder that can hand back P010, which the fold needs to run. */
    @Before
    fun addTenBitDecoder() {
        ShadowMediaCodecList.addCodec(
            MediaCodecInfoBuilder.newBuilder()
                .setName("c2.test.hevc.decoder")
                .setIsEncoder(false)
                .setCapabilities(
                    MediaCodecInfoBuilder.CodecCapabilitiesBuilder.newBuilder()
                        .setMediaFormat(MediaFormat.createVideoFormat(MediaFormat.MIMETYPE_VIDEO_HEVC, 3840, 2160))
                        .setColorFormats(intArrayOf(MediaCodecInfo.CodecCapabilities.COLOR_FormatYUVP010))
                        .build(),
                )
                .build(),
        )
    }

    private class FakeConverter : DoviRpuConverter {
        val plain = mutableListOf<Int>()
        val kept = mutableListOf<FelCurve?>()
        override val canSetCurves = true

        override fun convertP7NalToP8(data: ByteArray, offset: Int, length: Int): ByteArray {
            plain += length
            return byteArrayOf(0x7C, 0x01, 0x08)
        }

        override fun convertKeepingMapping(data: ByteArray, offset: Int, length: Int, luma: FelCurve?): ByteArray {
            kept += luma
            return byteArrayOf(0x7C, 0x01, 0x0B)
        }
    }

    private class Recorder : TrackOutput {
        var format: Format? = null
        val samples = mutableListOf<Pair<Long, ByteArray>>()
        private val pending = java.io.ByteArrayOutputStream()

        override fun format(format: Format) {
            this.format = format
        }

        override fun sampleData(input: DataReader, length: Int, allowEndOfInput: Boolean, sampleDataPart: Int): Int {
            val buffer = ByteArray(length)
            val read = input.read(buffer, 0, length)
            pending.write(buffer, 0, read)
            return read
        }

        override fun sampleData(data: ParsableByteArray, length: Int, sampleDataPart: Int) {
            pending.write(data.data, data.position, length)
            data.skipBytes(length)
        }

        override fun sampleMetadata(timeUs: Long, flags: Int, size: Int, offset: Int, cryptoData: TrackOutput.CryptoData?) {
            val bytes = pending.toByteArray()
            samples += timeUs to bytes.copyOfRange(bytes.size - offset - size, bytes.size - offset)
            pending.reset()
        }
    }

    /** Writes the format and every sample in one read, noting how many samples were out after each. */
    private class ScriptedExtractor(private val format: Format, private val samples: List<Sample>) : Extractor {
        lateinit var output: ExtractorOutput
        lateinit var recorder: Recorder
        val outAfterEach = mutableListOf<Int>()

        override fun sniff(input: ExtractorInput) = true

        override fun init(output: ExtractorOutput) {
            this.output = output
        }

        override fun read(input: ExtractorInput, seekPosition: PositionHolder): Int {
            val track = output.track(0, C.TRACK_TYPE_VIDEO)
            output.endTracks()
            output.seekMap(SeekMap.Unseekable(C.TIME_UNSET))
            track.format(format)
            for (sample in samples) {
                track.sampleData(ParsableByteArray(sample.data), sample.data.size)
                track.sampleMetadata(sample.timeUs, sample.flags, sample.data.size, 0, null)
                outAfterEach += recorder.samples.size
            }
            return Extractor.RESULT_END_OF_INPUT
        }

        override fun seek(position: Long, timeUs: Long) = Unit

        override fun release() = Unit
    }

    private class RecordingOutput(val recorder: Recorder) : ExtractorOutput {
        override fun track(id: Int, type: Int): TrackOutput = recorder

        override fun endTracks() = Unit

        override fun seekMap(seekMap: SeekMap) = Unit
    }

    private fun accessUnit(rpu: ByteArray) = start + baseNal + start + enhancementNal + start + rpu

    private fun run(rpu: ByteArray, converter: FakeConverter, reports: MutableList<DoviCompatReport>): ScriptedExtractor {
        val format = Format.Builder()
            .setSampleMimeType(MimeTypes.VIDEO_DOLBY_VISION)
            .setCodecs("dvhe.07.06")
            .setWidth(3840)
            .setHeight(2160)
            .build()
        // Keyframes at 0 and 3, so the first GOP holds three samples.
        val samples = (0 until 6).map {
            Sample(it * 41_708L, if (it % 3 == 0) C.BUFFER_FLAG_KEY_FRAME else 0, accessUnit(rpu))
        }
        val scripted = ScriptedExtractor(format, samples)
        val factory = DoviCompatExtractorsFactory(
            ExtractorsFactory { arrayOf(scripted) },
            mode = { DoviCompatMode.CONVERT },
            stripDolbyVision = { false },
            converter = converter,
            videoDecoderReady = { false },
            onReport = { reports += it },
        )
        val extractor = factory.createExtractors()[0]
        val recorder = Recorder()
        scripted.recorder = recorder
        extractor.init(RecordingOutput(recorder))
        val input = DefaultExtractorInput({ _, _, _ -> C.RESULT_END_OF_INPUT }, 0, C.LENGTH_UNSET.toLong())
        assertEquals(Extractor.RESULT_END_OF_INPUT, extractor.read(input, PositionHolder()))
        return scripted
    }

    @Test
    fun felHoldsEachGopUntilTheNextKeyframeAndKeepsTheMapping() {
        val converter = FakeConverter()
        val reports = mutableListOf<DoviCompatReport>()
        val scripted = run(hex(FEL_RPU_HEX), converter, reports)
        val recorder = scripted.recorder

        assertEquals("dvhe.08.06", recorder.format?.codecs)
        // Nothing goes out until the second keyframe arrives, then the end of
        // input lets the last GOP go.
        assertEquals(listOf(0, 0, 0, 3, 3, 3), scripted.outAfterEach)
        assertEquals(6, recorder.samples.size)
        assertEquals((0 until 6).map { it * 41_708L }, recorder.samples.map { it.first })
        for ((_, data) in recorder.samples) {
            assertArrayEquals(start + baseNal + start + keptRpu, data)
        }
        // No fit without the player's decoder, so every RPU keeps its own luma.
        assertEquals(List(6) { null }, converter.kept)
        assertTrue(converter.plain.isEmpty())

        val fold = reports.last().fold
        assertNotNull(fold)
        assertTrue(fold, fold!!.startsWith("on"))
        assertTrue(fold, fold.contains("waited for the player"))
        assertEquals("FEL", reports.last().enhancementLayer)
    }

    @Test
    fun felOnABoxWithoutTenBitPicturesKeepsTheMappingWithoutHolding() {
        ShadowMediaCodecList.reset()
        val converter = FakeConverter()
        val reports = mutableListOf<DoviCompatReport>()
        val scripted = run(hex(FEL_RPU_HEX), converter, reports)

        assertEquals(listOf(1, 2, 3, 4, 5, 6), scripted.outAfterEach)
        for ((_, data) in scripted.recorder.samples) {
            assertArrayEquals(start + baseNal + start + keptRpu, data)
        }
        assertEquals(List(6) { null }, converter.kept)
        assertEquals("off (the HEVC decoder can't give 10-bit pictures)", reports.last().fold)
        assertEquals("FEL", reports.last().enhancementLayer)
    }

    @Test
    fun melIsNeitherHeldNorKeptOnItsOwnMapping() {
        val converter = FakeConverter()
        val reports = mutableListOf<DoviCompatReport>()
        val mel = craft(listOf(listOf(Piece.POLYNOMIAL), listOf(Piece.MMR), listOf(Piece.MMR)), Residual.MEL)
        val scripted = run(mel, converter, reports)

        assertEquals(listOf(1, 2, 3, 4, 5, 6), scripted.outAfterEach)
        for ((_, data) in scripted.recorder.samples) {
            assertArrayEquals(start + baseNal + start + plainRpu, data)
        }
        assertEquals(6, converter.plain.size)
        assertTrue(converter.kept.isEmpty())
        assertNull(reports.last().fold)
        assertEquals("MEL", reports.last().enhancementLayer)
    }
}
