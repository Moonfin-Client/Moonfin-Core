package org.moonfin.nativevideo.subtitle

import androidx.media3.common.StreamKey
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.LoadingInfo
import androidx.media3.exoplayer.SeekParameters
import androidx.media3.exoplayer.source.MediaPeriod
import androidx.media3.exoplayer.source.MediaSource
import androidx.media3.exoplayer.source.SampleStream
import androidx.media3.exoplayer.source.TrackGroupArray
import androidx.media3.exoplayer.source.WrappingMediaSource
import androidx.media3.exoplayer.trackselection.ExoTrackSelection
import androidx.media3.exoplayer.upstream.Allocator
import java.io.IOException

/**
 * Wraps the content source so the subtitle tracks muxed into it can slide by
 * a live offset while video and audio stay where they are.
 *
 * Only the sample streams whose selected format is a subtitle are wrapped,
 * and only their sample times move. Every period level position goes through
 * unchanged, because those belong to the picture. That leaves one gap: after
 * a seek to a position with a positive offset in force, the cues that start
 * within the offset before it are not read, since the content queue starts at
 * the seek point. Sideloaded tracks avoid this by shifting the seek itself.
 */
@UnstableApi
internal class TextStreamOffsetMediaSource(
    child: MediaSource,
    initialOffsetUs: Long,
) : WrappingMediaSource(child) {

    private val activePeriods = ArrayList<TextStreamOffsetMediaPeriod>()

    @Volatile
    private var timeOffsetUs: Long = initialOffsetUs

    fun setTimeOffsetUs(offsetUs: Long) {
        timeOffsetUs = offsetUs
        for (period in activePeriods) {
            period.updateTimeOffsetUs(offsetUs)
        }
    }

    override fun createPeriod(
        id: MediaSource.MediaPeriodId,
        allocator: Allocator,
        startPositionUs: Long,
    ): MediaPeriod {
        val period = TextStreamOffsetMediaPeriod(
            super.createPeriod(id, allocator, startPositionUs),
            timeOffsetUs,
        )
        activePeriods.add(period)
        return period
    }

    override fun releasePeriod(mediaPeriod: MediaPeriod) {
        val period = mediaPeriod as TextStreamOffsetMediaPeriod
        activePeriods.remove(period)
        super.releasePeriod(period.wrappedMediaPeriod)
    }
}

/** Forwards everything as is and only wraps the subtitle sample streams. */
@UnstableApi
internal class TextStreamOffsetMediaPeriod(
    val wrappedMediaPeriod: MediaPeriod,
    initialOffsetUs: Long,
) : MediaPeriod, MediaPeriod.Callback {

    @Volatile
    private var timeOffsetUs = initialOffsetUs

    private var callback: MediaPeriod.Callback? = null

    fun updateTimeOffsetUs(offsetUs: Long) {
        timeOffsetUs = offsetUs
    }

    override fun prepare(callback: MediaPeriod.Callback, positionUs: Long) {
        this.callback = callback
        wrappedMediaPeriod.prepare(this, positionUs)
    }

    @Throws(IOException::class)
    override fun maybeThrowPrepareError() = wrappedMediaPeriod.maybeThrowPrepareError()

    override fun getTrackGroups(): TrackGroupArray = wrappedMediaPeriod.trackGroups

    override fun getStreamKeys(trackSelections: List<ExoTrackSelection>): List<StreamKey> =
        wrappedMediaPeriod.getStreamKeys(trackSelections)

    override fun selectTracks(
        selections: Array<out ExoTrackSelection?>,
        mayRetainStreamFlags: BooleanArray,
        streams: Array<SampleStream?>,
        streamResetFlags: BooleanArray,
        positionUs: Long,
    ): Long {
        val childStreams = arrayOfNulls<SampleStream>(streams.size)
        for (i in streams.indices) {
            val current = streams[i]
            childStreams[i] = (current as? OffsetSampleStream)?.childStream ?: current
        }
        val result = wrappedMediaPeriod.selectTracks(
            selections,
            mayRetainStreamFlags,
            childStreams,
            streamResetFlags,
            positionUs,
        )
        for (i in streams.indices) {
            val childStream = childStreams[i]
            val format = selections[i]?.selectedFormat
            val current = streams[i] as? OffsetSampleStream
            streams[i] = when {
                childStream == null -> null
                format == null || !shiftsEmbeddedFormat(format.sampleMimeType, format.codecs) -> childStream
                current != null && current.childStream === childStream -> current
                else -> OffsetSampleStream(childStream) { timeOffsetUs }
            }
        }
        return result
    }

    override fun discardBuffer(positionUs: Long, toKeyframe: Boolean) =
        wrappedMediaPeriod.discardBuffer(positionUs, toKeyframe)

    override fun readDiscontinuity(): Long = wrappedMediaPeriod.readDiscontinuity()

    override fun seekToUs(positionUs: Long): Long = wrappedMediaPeriod.seekToUs(positionUs)

    override fun getAdjustedSeekPositionUs(positionUs: Long, seekParameters: SeekParameters): Long =
        wrappedMediaPeriod.getAdjustedSeekPositionUs(positionUs, seekParameters)

    override fun getBufferedPositionUs(): Long = wrappedMediaPeriod.bufferedPositionUs

    override fun getNextLoadPositionUs(): Long = wrappedMediaPeriod.nextLoadPositionUs

    override fun continueLoading(loadingInfo: LoadingInfo): Boolean =
        wrappedMediaPeriod.continueLoading(loadingInfo)

    override fun isLoading(): Boolean = wrappedMediaPeriod.isLoading

    override fun reevaluateBuffer(positionUs: Long) = wrappedMediaPeriod.reevaluateBuffer(positionUs)

    override fun setEndPositionUs(endPositionUs: Long): Long =
        wrappedMediaPeriod.setEndPositionUs(endPositionUs)

    override fun onPrepared(mediaPeriod: MediaPeriod) {
        callback?.onPrepared(this)
    }

    override fun onContinueLoadingRequested(source: MediaPeriod) {
        callback?.onContinueLoadingRequested(this)
    }
}
