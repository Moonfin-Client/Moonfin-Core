package org.moonfin.nativevideo

import android.net.Uri
import androidx.media3.common.C
import androidx.media3.common.DataReader
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.ParsableByteArray
import androidx.media3.common.util.UnstableApi
import androidx.media3.extractor.Extractor
import androidx.media3.extractor.ExtractorOutput
import androidx.media3.extractor.ExtractorsFactory
import androidx.media3.extractor.ForwardingExtractor
import androidx.media3.extractor.ForwardingExtractorOutput
import androidx.media3.extractor.ForwardingExtractorsFactory
import androidx.media3.extractor.ForwardingTrackOutput
import androidx.media3.extractor.TrackOutput
import androidx.media3.extractor.text.SubtitleParser

/** Captured together, so every observation belongs to the extractor's source. */
internal class StreamObservationCallbacks(
    val onCadence: (CadenceReport) -> Unit,
    val onHeader: (StreamRateEvidence) -> Unit,
    /** The first video sample reached the demuxer: the stream is flowing. */
    val onFirstSample: () -> Unit = {},
)

/**
 * Watches the timestamps of every video sample as the demuxer writes it and
 * reports the [FrameCadence] they describe. Nothing is changed: samples, formats
 * and timing pass straight through.
 *
 * This runs on the loading thread, a buffer ahead of playback, so the timing of
 * a source (or of the next programme on a live channel) is known before its
 * frames reach the decoder. Callbacks from [observationsForExtractor] run on that thread.
 */
@UnstableApi
internal class CadenceObservingExtractorsFactory(
    delegate: ExtractorsFactory,
    private val observationsForExtractor: () -> StreamObservationCallbacks,
) : ForwardingExtractorsFactory(delegate) {

    // The base class returns the inner factory from its setters, which would
    // let callers chain right past this wrapper, so each override returns
    // this instead.
    override fun setSubtitleParserFactory(
        subtitleParserFactory: SubtitleParser.Factory,
    ): ExtractorsFactory {
        super.setSubtitleParserFactory(subtitleParserFactory)
        return this
    }

    @Suppress("DEPRECATION")
    override fun experimentalSetTextTrackTranscodingEnabled(
        textTrackTranscodingEnabled: Boolean,
    ): ExtractorsFactory {
        super.experimentalSetTextTrackTranscodingEnabled(textTrackTranscodingEnabled)
        return this
    }

    override fun experimentalSetCodecsToParseWithinGopSampleDependencies(
        codecsToParseWithinGopSampleDependencies: Int,
    ): ExtractorsFactory {
        super.experimentalSetCodecsToParseWithinGopSampleDependencies(
            codecsToParseWithinGopSampleDependencies,
        )
        return this
    }

    override fun createExtractors(): Array<Extractor> =
        wrap(super.createExtractors())

    override fun createExtractors(
        uri: Uri,
        responseHeaders: Map<String, List<String>>,
    ): Array<Extractor> = wrap(super.createExtractors(uri, responseHeaders))

    private fun wrap(extractors: Array<Extractor>): Array<Extractor> {
        val callbacks = observationsForExtractor()
        return Array(extractors.size) { index -> CadenceObservingExtractor(extractors[index], callbacks) }
    }
}

/** One demuxer-side cadence report, with what is known about the track it came from. */
internal class CadenceReport(
    val cadence: FrameCadence,
    val sampleMimeType: String?,
    /** The track's declared rate, [Format.NO_VALUE] when the demuxer gave none. */
    val formatFrameRate: Float,
    val lastTimestampUs: Long,
    val discontinuities: Int,
)

@UnstableApi
private class CadenceObservingExtractor(
    delegate: Extractor,
    private val callbacks: StreamObservationCallbacks,
) : ForwardingExtractor(delegate) {

    private var output: CadenceObservingExtractorOutput? = null

    override fun init(output: ExtractorOutput) {
        val wrapped = CadenceObservingExtractorOutput(
            output, callbacks.onCadence, callbacks.onHeader, callbacks.onFirstSample,
        )
        this.output = wrapped
        super.init(wrapped)
    }

    override fun seek(position: Long, timeUs: Long) {
        output?.reset()
        super.seek(position, timeUs)
    }
}

@UnstableApi
internal class CadenceObservingExtractorOutput(
    delegate: ExtractorOutput,
    private val onCadence: (CadenceReport) -> Unit,
    private val onHeader: (StreamRateEvidence) -> Unit = {},
    private val onFirstSample: () -> Unit = {},
) : ForwardingExtractorOutput(delegate) {

    private val videoTracks = HashMap<Int, CadenceObservingTrackOutput>()

    override fun track(id: Int, type: Int): TrackOutput {
        val inner = super.track(id, type)
        if (type != C.TRACK_TYPE_VIDEO) return inner
        return videoTracks.getOrPut(id) { CadenceObservingTrackOutput(inner, onCadence, onHeader, onFirstSample) }
    }

    fun reset() {
        for (track in videoTracks.values) track.reset()
    }
}

@UnstableApi
internal class CadenceObservingTrackOutput(
    delegate: TrackOutput,
    private val onCadence: (CadenceReport) -> Unit,
    private val onHeader: (StreamRateEvidence) -> Unit = {},
    private val onFirstSample: () -> Unit = {},
) : ForwardingTrackOutput(delegate) {

    private val observer = FrameCadenceObserver(reorderDepth = REORDER_DEPTH)
    private val headerObserver = Mpeg2RateHeaderObserver()
    // The parser re-arms after every report so a programme boundary's new
    // sequence header is seen too; only a change is passed on.
    private var lastHeader: StreamRateEvidence? = null
    private var firstSampleReported = false
    private var format: Format? = null

    override fun format(format: Format) {
        this.format = format
        super.format(format)
        // H262Reader can forward the first payload before publishing Format.
        // Its initialization data retains that sequence header and extension.
        format.initializationData.forEach { observeHeader(it, 0, it.size) }
    }

    override fun sampleData(input: DataReader, length: Int, allowEndOfInput: Boolean): Int =
        super.sampleData(observingReader(input), length, allowEndOfInput)

    override fun sampleData(
        input: DataReader,
        length: Int,
        allowEndOfInput: Boolean,
        sampleDataPart: Int,
    ): Int = super.sampleData(
        if (sampleDataPart == TrackOutput.SAMPLE_DATA_PART_MAIN) observingReader(input) else input,
        length, allowEndOfInput, sampleDataPart,
    )

    override fun sampleData(data: ParsableByteArray, length: Int) {
        observeHeader(data.data, data.position, length)
        super.sampleData(data, length)
    }

    override fun sampleData(data: ParsableByteArray, length: Int, sampleDataPart: Int) {
        if (sampleDataPart == TrackOutput.SAMPLE_DATA_PART_MAIN) {
            observeHeader(data.data, data.position, length)
        }
        super.sampleData(data, length, sampleDataPart)
    }

    private fun observingReader(input: DataReader): DataReader {
        if (format?.sampleMimeType != MimeTypes.VIDEO_MPEG2) return input
        // Read only the bytes the delegate asks for, into its own buffer.
        return DataReader { buffer, offset, length ->
            val read = input.read(buffer, offset, length)
            if (read > 0) observeHeader(buffer, offset, read)
            read
        }
    }

    private fun observeHeader(data: ByteArray, offset: Int, length: Int) {
        if (format?.sampleMimeType != MimeTypes.VIDEO_MPEG2) return
        val evidence = runCatching { headerObserver.onData(data, offset, length) }.getOrNull() ?: return
        headerObserver.reset()
        if (evidence == lastHeader) return
        lastHeader = evidence
        runCatching { onHeader(evidence) }
    }

    override fun sampleMetadata(
        timeUs: Long,
        flags: Int,
        size: Int,
        offset: Int,
        cryptoData: TrackOutput.CryptoData?,
    ) {
        super.sampleMetadata(timeUs, flags, size, offset, cryptoData)
        if (!firstSampleReported) {
            firstSampleReported = true
            runCatching { onFirstSample() }
        }
        // A failing observer must never cost a frame.
        val cadence = runCatching { observer.onFrame(timeUs) }.getOrNull() ?: return
        val current = format
        runCatching {
            onCadence(
                CadenceReport(
                    cadence = cadence,
                    sampleMimeType = current?.sampleMimeType,
                    formatFrameRate = current?.frameRate ?: Format.NO_VALUE.toFloat(),
                    lastTimestampUs = observer.lastTimestampUs,
                    discontinuities = observer.discontinuities,
                ),
            )
        }
    }

    fun reset() {
        observer.reset()
        headerObserver.reset()
        lastHeader = null
        firstSampleReported = false
    }

    private companion object {
        /** Bounded reordering budget; deeper reordering is not guaranteed. */
        const val REORDER_DEPTH = 16
    }
}
