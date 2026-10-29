package org.moonfin.nativevideo

import android.net.Uri
import androidx.annotation.OptIn
import androidx.media3.common.Format
import androidx.media3.common.util.ExperimentalApi
import androidx.media3.common.util.TimestampAdjuster
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.analytics.PlayerId
import androidx.media3.exoplayer.hls.HlsExtractorFactory
import androidx.media3.exoplayer.hls.HlsMediaChunkExtractor
import androidx.media3.extractor.ExtractorInput
import androidx.media3.extractor.ExtractorOutput
import androidx.media3.extractor.text.SubtitleParser
import java.io.IOException

/** Adds bounded cadence and current-stream header observation to HLS extractors. */
@OptIn(UnstableApi::class, ExperimentalApi::class)
internal class CadenceObservingHlsExtractorFactory(
    private var delegate: HlsExtractorFactory,
    private val observationsForExtractor: () -> StreamObservationCallbacks,
) : HlsExtractorFactory {

    override fun createExtractor(
        uri: Uri,
        format: Format,
        muxedCaptionFormats: List<Format>?,
        timestampAdjuster: TimestampAdjuster,
        responseHeaders: Map<String, List<String>>,
        sniffingExtractorInput: ExtractorInput,
        playerId: PlayerId,
    ): HlsMediaChunkExtractor {
        val observations = observationsForExtractor()
        val extractor = delegate.createExtractor(
            uri,
            format,
            muxedCaptionFormats,
            timestampAdjuster,
            responseHeaders,
            sniffingExtractorInput,
            playerId,
        )
        return CadenceObservingHlsMediaChunkExtractor(extractor, observations)
    }

    override fun setSubtitleParserFactory(
        subtitleParserFactory: SubtitleParser.Factory,
    ): HlsExtractorFactory {
        delegate = delegate.setSubtitleParserFactory(subtitleParserFactory)
        return this
    }

    override fun experimentalParseSubtitlesDuringExtraction(
        parseSubtitlesDuringExtraction: Boolean,
    ): HlsExtractorFactory {
        delegate = delegate.experimentalParseSubtitlesDuringExtraction(parseSubtitlesDuringExtraction)
        return this
    }

    override fun experimentalSetCodecsToParseWithinGopSampleDependencies(
        codecsToParseWithinGopSampleDependencies: Int,
    ): HlsExtractorFactory {
        delegate = delegate.experimentalSetCodecsToParseWithinGopSampleDependencies(
            codecsToParseWithinGopSampleDependencies,
        )
        return this
    }

    override fun getOutputTextFormat(sourceFormat: Format): Format =
        delegate.getOutputTextFormat(sourceFormat)
}

/** Keeps the observations captured for its source across reuse and recreation. */
@UnstableApi
internal class CadenceObservingHlsMediaChunkExtractor(
    private val delegate: HlsMediaChunkExtractor,
    private val observations: StreamObservationCallbacks,
) : HlsMediaChunkExtractor {

    private var observingOutput: CadenceObservingExtractorOutput? = null

    override fun init(extractorOutput: ExtractorOutput) {
        val wrapped = CadenceObservingExtractorOutput(
            extractorOutput,
            observations.onCadence,
            observations.onHeader,
        )
        observingOutput = wrapped
        delegate.init(wrapped)
    }

    @Throws(IOException::class)
    override fun read(extractorInput: ExtractorInput): Boolean = delegate.read(extractorInput)

    override fun isPackedAudioExtractor(): Boolean = delegate.isPackedAudioExtractor()

    override fun isReusable(): Boolean = delegate.isReusable()

    override fun recreate(): HlsMediaChunkExtractor =
        CadenceObservingHlsMediaChunkExtractor(delegate.recreate(), observations)

    override fun onTruncatedSegmentParsed() {
        observingOutput?.reset()
        delegate.onTruncatedSegmentParsed()
    }
}
