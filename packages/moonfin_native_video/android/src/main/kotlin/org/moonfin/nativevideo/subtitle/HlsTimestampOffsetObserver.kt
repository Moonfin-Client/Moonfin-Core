package org.moonfin.nativevideo.subtitle

import android.net.Uri
import androidx.media3.common.C
import androidx.media3.common.Format
import androidx.media3.common.util.TimestampAdjuster
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.analytics.PlayerId
import androidx.media3.exoplayer.hls.HlsExtractorFactory
import androidx.media3.exoplayer.hls.HlsMediaChunkExtractor
import androidx.media3.extractor.ExtractorInput
import androidx.media3.extractor.ExtractorOutput
import java.io.IOException

/**
 * Watches the timestamp adjuster media3 uses for an HLS stream and reports
 * the offset it settled on.
 *
 * The adjuster pins the first sample it parses to the segment's nominal
 * start, so when a Jellyfin transcode pre-rolls copied audio from before the
 * seek point, the whole timeline lands that much later than source time. A
 * sideloaded subtitle never goes through the adjuster, so its cues run early
 * by exactly that amount. Nothing on the player reports the value, but the
 * extractor factory is handed the adjuster itself, which is enough.
 *
 * [onOffsetUs] fires on the loader thread whenever the settled value changes,
 * which it does after a seek that leaves the buffer, since the adjuster is
 * reset and pinned again on the next segment.
 */
@UnstableApi
internal class HlsTimestampOffsetObserver(
    private val delegate: HlsExtractorFactory,
    private val onOffsetUs: (Long) -> Unit,
) : HlsExtractorFactory {

    @Volatile
    private var lastReportedUs = C.TIME_UNSET

    // Set whenever the adjuster is seen without a value, so the next value is
    // reported even when it matches the last one. A seek can land on the same
    // correction, and the listener still has to hear that it settled again.
    @Volatile
    private var armed = true

    override fun createExtractor(
        uri: Uri,
        format: Format,
        muxedCaptionFormats: List<Format>?,
        timestampAdjuster: TimestampAdjuster,
        responseHeaders: Map<String, List<String>>,
        sniffingExtractorInput: ExtractorInput,
        playerId: PlayerId,
    ): HlsMediaChunkExtractor {
        val extractor = delegate.createExtractor(
            uri,
            format,
            muxedCaptionFormats,
            timestampAdjuster,
            responseHeaders,
            sniffingExtractorInput,
            playerId,
        )
        if (!timestampAdjuster.isInitialized) armed = true
        return Observing(extractor, timestampAdjuster)
    }

    internal fun reportIfSettled(adjuster: TimestampAdjuster) {
        if (!adjuster.isInitialized) {
            armed = true
            return
        }
        val offsetUs = adjuster.timestampOffsetUs
        if (!armed && offsetUs == lastReportedUs) return
        armed = false
        lastReportedUs = offsetUs
        onOffsetUs(offsetUs)
    }

    private inner class Observing(
        private val inner: HlsMediaChunkExtractor,
        private val adjuster: TimestampAdjuster,
    ) : HlsMediaChunkExtractor {
        override fun init(extractorOutput: ExtractorOutput) = inner.init(extractorOutput)

        @Throws(IOException::class)
        override fun read(extractorInput: ExtractorInput): Boolean {
            val result = inner.read(extractorInput)
            reportIfSettled(adjuster)
            return result
        }

        override fun isPackedAudioExtractor(): Boolean = inner.isPackedAudioExtractor

        override fun isReusable(): Boolean = inner.isReusable

        override fun recreate(): HlsMediaChunkExtractor = Observing(inner.recreate(), adjuster)

        override fun onTruncatedSegmentParsed() = inner.onTruncatedSegmentParsed()
    }
}
