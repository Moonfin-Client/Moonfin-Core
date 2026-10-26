package org.moonfin.nativevideo.subtitle

import androidx.media3.common.C
import androidx.media3.common.StreamKey
import androidx.media3.common.util.UnstableApi
import androidx.media3.decoder.DecoderInputBuffer
import androidx.media3.exoplayer.FormatHolder
import androidx.media3.exoplayer.LoadingInfo
import androidx.media3.exoplayer.SeekParameters
import androidx.media3.exoplayer.source.MediaPeriod
import androidx.media3.exoplayer.source.SampleStream
import androidx.media3.exoplayer.source.TrackGroupArray
import androidx.media3.exoplayer.trackselection.ExoTrackSelection
import java.io.IOException

/**
 * A period that shifts every timestamp of the period it wraps by a live
 * offset.
 *
 * Media3 keeps its own version of this package private and fixed at the
 * offset it was built with, so this is that class with the offset made
 * adjustable. Everything handed down loses the offset and everything coming
 * back up gains it, while the unset and end of source sentinels pass through
 * untouched. Each method reads the offset once so a change landing mid call
 * never mixes two values.
 *
 * Runs on the playback thread, which is also where [updateTimeOffsetUs] is
 * expected to be called from.
 */
@UnstableApi
internal class TimeOffsetMediaPeriod(
    val wrappedMediaPeriod: MediaPeriod,
    initialOffsetUs: Long,
    initialSecondaryOffsetUs: Long? = null,
    private val onSecondaryError: (IOException) -> Unit = {},
    private val onLoadingChanged: () -> Unit = {},
) : MediaPeriod, MediaPeriod.Callback {

    @Volatile
    private var primaryOffsetUs = initialOffsetUs
    @Volatile
    private var secondaryOffsetUs = initialSecondaryOffsetUs
    private var secondarySelected = false
    private val timeOffsetUs: Long
        get() = if (secondarySelected) secondaryOffsetUs ?: primaryOffsetUs else primaryOffsetUs

    private var callback: MediaPeriod.Callback? = null
    private var trackSelected = false
    private var subtitleFailed = false
    var isSubtitleLoading = false
        private set

    private fun updateSubtitleLoading(
        bufferedPositionUs: Long = wrappedMediaPeriod.bufferedPositionUs,
    ) {
        // A selected subtitle is still pending between retries, when isLoading
        // may be false. End-of-source marks completion without waiting for a cue.
        val loading = trackSelected && !subtitleFailed && bufferedPositionUs != C.TIME_END_OF_SOURCE
        if (isSubtitleLoading == loading) return
        isSubtitleLoading = loading
        onLoadingChanged()
    }

    /**
     * Applies to every read and position from now on. Data the renderer has
     * already taken keeps the old offset, so the caller re-selects the track
     * to have it read again.
     */
    fun updateTimeOffsetUs(offsetUs: Long, secondaryUs: Long? = secondaryOffsetUs) {
        primaryOffsetUs = offsetUs
        secondaryOffsetUs = secondaryUs
    }

    override fun prepare(callback: MediaPeriod.Callback, positionUs: Long) {
        this.callback = callback
        wrappedMediaPeriod.prepare(this, positionUs - timeOffsetUs)
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
        // The last renderer is the secondary subtitle renderer. Choose the delay from
        // the active renderer so the same file can switch between primary and secondary
        // without rebuilding its source.
        secondarySelected = secondaryOffsetUs != null && selections.lastOrNull() != null
        val offset = timeOffsetUs
        val childStreams = arrayOfNulls<SampleStream>(streams.size)
        for (i in streams.indices) {
            childStreams[i] = (streams[i] as? OffsetSampleStream)?.childStream
        }
        val startPositionUs = wrappedMediaPeriod.selectTracks(
            selections,
            mayRetainStreamFlags,
            childStreams,
            streamResetFlags,
            positionUs - offset,
        )
        for (i in streams.indices) {
            val childStream = childStreams[i]
            val current = streams[i] as? OffsetSampleStream
            streams[i] = when {
                childStream == null -> null
                current == null || current.childStream !== childStream -> {
                    subtitleFailed = false
                    OffsetSampleStream(childStream, onError = if (secondarySelected) { error ->
                        // Report secondary subtitle errors without stopping video
                        // playback.
                        subtitleFailed = true
                        updateSubtitleLoading()
                        onSecondaryError(error)
                    } else null) { timeOffsetUs }
                }
                else -> current
            }
        }
        trackSelected = childStreams.any { it != null }
        updateSubtitleLoading()
        return startPositionUs + offset
    }

    override fun discardBuffer(positionUs: Long, toKeyframe: Boolean) =
        wrappedMediaPeriod.discardBuffer(positionUs - timeOffsetUs, toKeyframe)

    // A subtitle file only reports a discontinuity when a download with no
    // known length fails and starts over from zero, and passing it up would
    // make the merged period seek the video back to zero too. The child is
    // still asked, since it holds its samples back until it's read.
    override fun readDiscontinuity(): Long {
        wrappedMediaPeriod.readDiscontinuity()
        return C.TIME_UNSET
    }

    override fun seekToUs(positionUs: Long): Long {
        val offset = timeOffsetUs
        // The merging period insists every child answers a seek with the exact
        // position it was given, so the offset has to come off and go back on.
        val seekPositionUs = wrappedMediaPeriod.seekToUs(positionUs - offset) + offset
        updateSubtitleLoading()
        return seekPositionUs
    }

    override fun getAdjustedSeekPositionUs(positionUs: Long, seekParameters: SeekParameters): Long {
        val offset = timeOffsetUs
        return wrappedMediaPeriod.getAdjustedSeekPositionUs(positionUs - offset, seekParameters) + offset
    }

    override fun getBufferedPositionUs(): Long {
        if (subtitleFailed) return C.TIME_END_OF_SOURCE
        val bufferedUs = wrappedMediaPeriod.bufferedPositionUs
        updateSubtitleLoading(bufferedUs)
        return if (bufferedUs == C.TIME_END_OF_SOURCE) C.TIME_END_OF_SOURCE else bufferedUs + timeOffsetUs
    }

    override fun getNextLoadPositionUs(): Long {
        if (subtitleFailed) return C.TIME_END_OF_SOURCE
        // While its one request is out, a subtitle file reports the position
        // it started from. The merging period only lets the video load past
        // the lowest position any child reports, so a server slow to hand the
        // file over would hold the picture there until it arrived.
        if (wrappedMediaPeriod.isLoading) return C.TIME_END_OF_SOURCE
        val nextLoadUs = wrappedMediaPeriod.nextLoadPositionUs
        return if (nextLoadUs == C.TIME_END_OF_SOURCE) C.TIME_END_OF_SOURCE else nextLoadUs + timeOffsetUs
    }

    override fun continueLoading(loadingInfo: LoadingInfo): Boolean =
        !subtitleFailed && wrappedMediaPeriod.continueLoading(
            loadingInfo.buildUpon()
                .setPlaybackPositionUs(loadingInfo.playbackPositionUs - timeOffsetUs)
                .build(),
        )

    override fun isLoading(): Boolean = !subtitleFailed && wrappedMediaPeriod.isLoading

    override fun reevaluateBuffer(positionUs: Long) =
        wrappedMediaPeriod.reevaluateBuffer(positionUs - timeOffsetUs)

    override fun setEndPositionUs(endPositionUs: Long): Long {
        val offset = timeOffsetUs
        val childEndUs = if (endPositionUs == C.TIME_END_OF_SOURCE) C.TIME_END_OF_SOURCE else endPositionUs - offset
        val actualEndUs = wrappedMediaPeriod.setEndPositionUs(childEndUs)
        return if (actualEndUs == C.TIME_END_OF_SOURCE) C.TIME_END_OF_SOURCE else actualEndUs + offset
    }

    override fun onPrepared(mediaPeriod: MediaPeriod) {
        callback?.onPrepared(this)
    }

    override fun onContinueLoadingRequested(source: MediaPeriod) {
        updateSubtitleLoading()
        callback?.onContinueLoadingRequested(this)
    }
}

/**
 * Moves every sample read from [childStream] by the offset its owning period
 * is on right now, so a change reaches the next read without re-selecting the
 * stream. Format reads and end of stream buffers carry no time to move.
 */
@UnstableApi
internal class OffsetSampleStream(
    val childStream: SampleStream,
    private val onError: ((IOException) -> Unit)? = null,
    private val offsetUs: () -> Long,
) : SampleStream {

    private var failed = false

    override fun isReady(): Boolean = failed || childStream.isReady

    @Throws(IOException::class)
    override fun maybeThrowError() {
        if (failed) return
        try {
            childStream.maybeThrowError()
        } catch (error: IOException) {
            val report = onError ?: throw error
            failed = true
            report(error)
        }
    }

    override fun readData(
        formatHolder: FormatHolder,
        buffer: DecoderInputBuffer,
        readFlags: Int,
    ): Int {
        if (failed) {
            buffer.addFlag(C.BUFFER_FLAG_END_OF_STREAM)
            return C.RESULT_BUFFER_READ
        }
        val result = childStream.readData(formatHolder, buffer, readFlags)
        if (result == C.RESULT_BUFFER_READ && !buffer.isEndOfStream && buffer.timeUs != C.TIME_UNSET) {
            buffer.timeUs += offsetUs()
        }
        return result
    }

    override fun skipData(positionUs: Long): Int = if (failed) 0 else childStream.skipData(positionUs - offsetUs())
}
