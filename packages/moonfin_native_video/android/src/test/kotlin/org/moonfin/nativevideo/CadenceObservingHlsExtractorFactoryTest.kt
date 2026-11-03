package org.moonfin.nativevideo

import android.net.Uri
import androidx.annotation.OptIn
import androidx.media3.common.C
import androidx.media3.common.DataReader
import androidx.media3.common.Format
import androidx.media3.common.util.ExperimentalApi
import androidx.media3.common.util.ParsableByteArray
import androidx.media3.common.util.TimestampAdjuster
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.analytics.PlayerId
import androidx.media3.exoplayer.hls.HlsExtractorFactory
import androidx.media3.exoplayer.hls.HlsMediaChunkExtractor
import androidx.media3.extractor.ExtractorInput
import androidx.media3.extractor.ExtractorOutput
import androidx.media3.extractor.SeekMap
import androidx.media3.extractor.TrackOutput
import androidx.media3.extractor.text.SubtitleParser
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

@OptIn(UnstableApi::class, ExperimentalApi::class)
class CadenceObservingHlsExtractorFactoryTest {

    @Test
    fun `reusable extractor preserves cadence window across segment boundary`() {
        val reports = mutableListOf<CadenceReport>()
        val fake = FakeHlsExtractor(reusable = true)
        val extractor = CadenceObservingHlsMediaChunkExtractor(fake, callbacks(reports))
        val output = RecordingExtractorOutput()
        extractor.init(output)
        val observedVideo = fake.observedVideo!!
        observedVideo.format(videoFormat())

        feedSamples(observedVideo, count = 8)
        // A normal reusable HLS segment boundary has no reset call.
        feedSamples(observedVideo, count = 21, startingAt = 8)

        assertEquals(29, output.video.metadata.size)
        assertEquals(1, reports.size)
        assertEquals(FrameCadence.Kind.UNIFORM, reports.single().cadence.kind)
        assertEquals(12, reports.single().cadence.intervals)
        assertEquals(1, fake.initCalls)
        assertTrue(extractor.isReusable())
    }

    @Test
    fun `metadata is forwarded exactly once with every original field`() {
        val reports = mutableListOf<CadenceReport>()
        val fake = FakeHlsExtractor()
        val extractor = CadenceObservingHlsMediaChunkExtractor(fake, callbacks(reports))
        val output = RecordingExtractorOutput()
        extractor.init(output)
        val format = videoFormat()
        fake.observedVideo!!.format(format)
        feedSamples(fake.observedVideo!!, count = 29)

        assertEquals(29, output.video.metadata.size)
        assertSame(format, output.video.format)
        output.video.metadata.forEachIndexed { index, metadata ->
            assertEquals(index * 41_708L, metadata.timeUs)
            assertEquals(C.BUFFER_FLAG_KEY_FRAME, metadata.flags)
            assertEquals(index + 1, metadata.size)
            assertEquals(index + 2, metadata.offset)
            assertNull(metadata.cryptoData)
        }
        assertEquals(1, reports.size)
    }

    @Test
    fun `truncated segment resets observer and is forwarded`() {
        val reports = mutableListOf<CadenceReport>()
        val fake = FakeHlsExtractor()
        val extractor = CadenceObservingHlsMediaChunkExtractor(fake, callbacks(reports))
        val output = RecordingExtractorOutput()
        extractor.init(output)
        val observedVideo = fake.observedVideo!!
        observedVideo.format(videoFormat())

        feedSamples(observedVideo, count = 20)
        assertTrue(reports.isEmpty())
        extractor.onTruncatedSegmentParsed()
        feedSamples(observedVideo, count = 29, startingAt = 0)

        assertEquals(1, fake.truncatedCalls)
        assertEquals(1, reports.size)
        assertEquals(49, output.video.metadata.size)
        assertEquals(12, reports.single().cadence.intervals)
    }

    @Test
    fun `extractor methods delegate and recreate keeps source callbacks`() {
        val reports = mutableListOf<CadenceReport>()
        val recreatedFake = FakeHlsExtractor(reusable = false, readResult = false)
        val fake = FakeHlsExtractor(
            packedAudio = true,
            reusable = false,
            readResult = true,
            recreated = recreatedFake,
        )
        val extractor = CadenceObservingHlsMediaChunkExtractor(fake, callbacks(reports))
        val input = UnexpectedExtractorInput()

        assertTrue(extractor.isPackedAudioExtractor())
        assertFalse(extractor.isReusable())
        assertTrue(extractor.read(input))
        assertSame(input, fake.lastReadInput)
        val recreated = extractor.recreate() as CadenceObservingHlsMediaChunkExtractor
        val output = RecordingExtractorOutput()
        recreated.init(output)
        recreatedFake.observedVideo!!.format(videoFormat())
        feedSamples(recreatedFake.observedVideo!!, count = 29)

        assertEquals(1, fake.readCalls)
        assertEquals(1, fake.recreateCalls)
        assertEquals(1, reports.size)
        assertFalse(recreated.isReusable())
        assertFalse(recreated.read(input))
        assertSame(input, recreatedFake.lastReadInput)
        assertEquals(1, recreatedFake.readCalls)
    }

    @Test
    fun `factory configuration setters and text output format pass through and remain fluent`() {
        val delegate = RecordingHlsExtractorFactory()
        val factory = CadenceObservingHlsExtractorFactory(delegate) { callbacks(mutableListOf()) }
        val subtitleParser = SubtitleParser.Factory.UNSUPPORTED
        val sourceFormat = Format.Builder().setSampleMimeType("text/vtt").build()

        assertSame(factory, factory.setSubtitleParserFactory(subtitleParser))
        assertSame(factory, factory.experimentalParseSubtitlesDuringExtraction(true))
        assertSame(factory, factory.experimentalSetCodecsToParseWithinGopSampleDependencies(123))
        assertSame(sourceFormat, factory.getOutputTextFormat(sourceFormat))
        assertSame(subtitleParser, delegate.subtitleParserFactory)
        assertEquals(true, delegate.parseSubtitlesDuringExtraction)
        assertEquals(123, delegate.codecsWithinGop)
        assertSame(sourceFormat, delegate.textSourceFormat)
    }

    private fun callbacks(reports: MutableList<CadenceReport>) = StreamObservationCallbacks(
        onCadence = reports::add,
        onHeader = {},
    )

    private fun videoFormat() = Format.Builder()
        .setSampleMimeType("video/avc")
        .setFrameRate(24f)
        .build()

    private fun feedSamples(output: TrackOutput, count: Int, startingAt: Int = 0) {
        repeat(count) { index ->
            val frameIndex = startingAt + index
            output.sampleMetadata(
                frameIndex * 41_708L,
                C.BUFFER_FLAG_KEY_FRAME,
                frameIndex + 1,
                frameIndex + 2,
                null,
            )
        }
    }

    private class RecordingHlsExtractorFactory : HlsExtractorFactory {
        private val extractor = FakeHlsExtractor()
        var subtitleParserFactory: SubtitleParser.Factory? = null
        var parseSubtitlesDuringExtraction: Boolean? = null
        var codecsWithinGop: Int? = null
        var textSourceFormat: Format? = null

        override fun createExtractor(
            uri: Uri,
            format: Format,
            muxedCaptionFormats: List<Format>?,
            timestampAdjuster: TimestampAdjuster,
            responseHeaders: Map<String, List<String>>,
            sniffingExtractorInput: ExtractorInput,
            playerId: PlayerId,
        ): HlsMediaChunkExtractor {
            return extractor
        }

        override fun setSubtitleParserFactory(
            subtitleParserFactory: SubtitleParser.Factory,
        ): HlsExtractorFactory {
            this.subtitleParserFactory = subtitleParserFactory
            return this
        }

        override fun experimentalParseSubtitlesDuringExtraction(
            parseSubtitlesDuringExtraction: Boolean,
        ): HlsExtractorFactory {
            this.parseSubtitlesDuringExtraction = parseSubtitlesDuringExtraction
            return this
        }

        override fun experimentalSetCodecsToParseWithinGopSampleDependencies(
            codecsToParseWithinGopSampleDependencies: Int,
        ): HlsExtractorFactory {
            codecsWithinGop = codecsToParseWithinGopSampleDependencies
            return this
        }

        override fun getOutputTextFormat(sourceFormat: Format): Format {
            textSourceFormat = sourceFormat
            return sourceFormat
        }
    }

    private class FakeHlsExtractor(
        private val packedAudio: Boolean = false,
        private val reusable: Boolean = true,
        private val readResult: Boolean = true,
        private val recreated: FakeHlsExtractor? = null,
    ) : HlsMediaChunkExtractor {
        var initCalls = 0
        var readCalls = 0
        var recreateCalls = 0
        var truncatedCalls = 0
        var observedVideo: TrackOutput? = null
        var lastReadInput: ExtractorInput? = null

        override fun init(extractorOutput: ExtractorOutput) {
            initCalls++
            observedVideo = extractorOutput.track(1, C.TRACK_TYPE_VIDEO)
        }

        override fun read(extractorInput: ExtractorInput): Boolean {
            readCalls++
            lastReadInput = extractorInput
            return readResult
        }

        override fun isPackedAudioExtractor(): Boolean = packedAudio

        override fun isReusable(): Boolean = reusable

        override fun recreate(): HlsMediaChunkExtractor {
            recreateCalls++
            return recreated ?: FakeHlsExtractor(reusable = reusable, readResult = readResult)
        }

        override fun onTruncatedSegmentParsed() {
            truncatedCalls++
        }

    }

    private class RecordingExtractorOutput : ExtractorOutput {
        val video = RecordingTrackOutput()

        override fun track(id: Int, type: Int): TrackOutput = video

        override fun endTracks() = Unit

        override fun seekMap(seekMap: SeekMap) = Unit
    }

    private class RecordingTrackOutput : TrackOutput {
        val metadata = mutableListOf<SampleMetadata>()
        var format: Format? = null

        override fun format(format: Format) {
            this.format = format
        }

        override fun sampleData(
            input: DataReader,
            length: Int,
            allowEndOfInput: Boolean,
            sampleDataPart: Int,
        ): Int = length

        override fun sampleData(data: ParsableByteArray, length: Int, sampleDataPart: Int) = Unit

        override fun sampleMetadata(
            timeUs: Long,
            flags: Int,
            size: Int,
            offset: Int,
            cryptoData: TrackOutput.CryptoData?,
        ) {
            metadata += SampleMetadata(timeUs, flags, size, offset, cryptoData)
        }
    }

    private data class SampleMetadata(
        val timeUs: Long,
        val flags: Int,
        val size: Int,
        val offset: Int,
        val cryptoData: TrackOutput.CryptoData?,
    )

    private class UnexpectedExtractorInput : ExtractorInput {
        private fun unexpected(): Nothing =
            throw UnsupportedOperationException("ExtractorInput methods must not be called")

        override fun read(buffer: ByteArray, offset: Int, length: Int): Int = unexpected()

        override fun readFully(
            target: ByteArray,
            offset: Int,
            length: Int,
            allowEndOfInput: Boolean,
        ): Boolean = unexpected()

        override fun readFully(target: ByteArray, offset: Int, length: Int): Unit = unexpected()

        override fun skip(length: Int): Int = unexpected()

        override fun skipFully(length: Int, allowEndOfInput: Boolean): Boolean = unexpected()

        override fun skipFully(length: Int): Unit = unexpected()

        override fun peek(target: ByteArray, offset: Int, length: Int): Int = unexpected()

        override fun peekFully(
            target: ByteArray,
            offset: Int,
            length: Int,
            allowEndOfInput: Boolean,
        ): Boolean = unexpected()

        override fun peekFully(target: ByteArray, offset: Int, length: Int): Unit = unexpected()

        override fun advancePeekPosition(length: Int, allowEndOfInput: Boolean): Boolean = unexpected()

        override fun advancePeekPosition(length: Int): Unit = unexpected()

        override fun resetPeekPosition(): Unit = unexpected()

        override fun getPeekPosition(): Long = unexpected()

        override fun getPosition(): Long = unexpected()

        override fun getLength(): Long = unexpected()

        override fun <E : Throwable> setRetryPosition(position: Long, e: E): Unit = unexpected()
    }
}
