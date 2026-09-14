package org.moonfin.nativevideo.subtitle

import androidx.media3.common.C
import androidx.media3.common.Format
import androidx.media3.common.TrackGroup
import androidx.media3.decoder.DecoderInputBuffer
import androidx.media3.exoplayer.FormatHolder
import androidx.media3.exoplayer.LoadingInfo
import androidx.media3.exoplayer.SeekParameters
import androidx.media3.exoplayer.source.MediaPeriod
import androidx.media3.exoplayer.source.SampleStream
import androidx.media3.exoplayer.source.TrackGroupArray
import androidx.media3.exoplayer.source.chunk.MediaChunk
import androidx.media3.exoplayer.source.chunk.MediaChunkIterator
import androidx.media3.exoplayer.trackselection.ExoTrackSelection
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotSame
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

class TimeOffsetMediaPeriodTest {

    private class FakeStream : SampleStream {
        var nextResult = C.RESULT_BUFFER_READ
        var nextTimeUs = 0L
        var endOfStream = false
        var skippedToUs = C.TIME_UNSET

        override fun isReady(): Boolean = true

        override fun maybeThrowError() {}

        override fun readData(formatHolder: FormatHolder, buffer: DecoderInputBuffer, readFlags: Int): Int {
            if (nextResult == C.RESULT_BUFFER_READ) {
                if (endOfStream) buffer.addFlag(C.BUFFER_FLAG_END_OF_STREAM) else buffer.timeUs = nextTimeUs
            }
            return nextResult
        }

        override fun skipData(positionUs: Long): Int {
            skippedToUs = positionUs
            return 0
        }
    }

    private class FakePeriod(private val streamsToHandOut: List<SampleStream>) : MediaPeriod {
        var preparedAtUs = C.TIME_UNSET
        var callback: MediaPeriod.Callback? = null
        var selectedAtUs = C.TIME_UNSET
        var discardedAtUs = C.TIME_UNSET
        var soughtToUs = C.TIME_UNSET
        var loadingPositionUs = C.TIME_UNSET
        var reevaluatedAtUs = C.TIME_UNSET
        var discontinuityUs = C.TIME_UNSET
        var bufferedUs = 0L
        var nextLoadUs = 0L

        override fun prepare(callback: MediaPeriod.Callback, positionUs: Long) {
            this.callback = callback
            preparedAtUs = positionUs
        }

        override fun maybeThrowPrepareError() {}

        override fun getTrackGroups(): TrackGroupArray = TrackGroupArray.EMPTY

        override fun selectTracks(
            selections: Array<out ExoTrackSelection?>,
            mayRetainStreamFlags: BooleanArray,
            streams: Array<SampleStream?>,
            streamResetFlags: BooleanArray,
            positionUs: Long,
        ): Long {
            selectedAtUs = positionUs
            for (i in streams.indices) {
                streams[i] = if (selections[i] == null) null else streamsToHandOut[i]
            }
            return positionUs
        }

        override fun discardBuffer(positionUs: Long, toKeyframe: Boolean) {
            discardedAtUs = positionUs
        }

        override fun readDiscontinuity(): Long = discontinuityUs

        override fun seekToUs(positionUs: Long): Long {
            soughtToUs = positionUs
            return positionUs
        }

        override fun getAdjustedSeekPositionUs(positionUs: Long, seekParameters: SeekParameters): Long = positionUs

        override fun getBufferedPositionUs(): Long = bufferedUs

        override fun getNextLoadPositionUs(): Long = nextLoadUs

        override fun continueLoading(loadingInfo: LoadingInfo): Boolean {
            loadingPositionUs = loadingInfo.playbackPositionUs
            return true
        }

        override fun isLoading(): Boolean = false

        override fun reevaluateBuffer(positionUs: Long) {
            reevaluatedAtUs = positionUs
        }
    }

    // A real track group reaches into android.text, which plain JUnit cant
    // run, and the period only ever asks a selection for its format.
    private class FakeSelection(private val format: Format) : ExoTrackSelection {
        override fun getSelectedFormat(): Format = format
        override fun getType(): Int = 0
        override fun getTrackGroup(): TrackGroup = throw UnsupportedOperationException()
        override fun length(): Int = 1
        override fun getFormat(index: Int): Format = format
        override fun getIndexInTrackGroup(index: Int): Int = 0
        override fun indexOf(format: Format): Int = 0
        override fun indexOf(indexInTrackGroup: Int): Int = 0
        override fun enable() {}
        override fun disable() {}
        override fun getSelectedIndexInTrackGroup(): Int = 0
        override fun getSelectedIndex(): Int = 0
        override fun getSelectionReason(): Int = C.SELECTION_REASON_UNKNOWN
        override fun getSelectionData(): Any? = null
        override fun onPlaybackSpeed(playbackSpeed: Float) {}
        override fun updateSelectedTrack(
            playbackPositionUs: Long,
            bufferedDurationUs: Long,
            availableDurationUs: Long,
            queue: List<MediaChunk>,
            mediaChunkIterators: Array<out MediaChunkIterator>,
        ) {}
        override fun evaluateQueueSize(playbackPositionUs: Long, queue: List<MediaChunk>): Int = queue.size
        override fun excludeTrack(index: Int, exclusionDurationMs: Long): Boolean = false
        override fun isTrackExcluded(index: Int, nowMs: Long): Boolean = false
    }

    private fun selection(mimeType: String, codecs: String? = null): ExoTrackSelection =
        FakeSelection(Format.Builder().setSampleMimeType(mimeType).setCodecs(codecs).build())

    private fun readOnce(stream: SampleStream): DecoderInputBuffer {
        val buffer = DecoderInputBuffer(DecoderInputBuffer.BUFFER_REPLACEMENT_MODE_DISABLED)
        stream.readData(FormatHolder(), buffer, 0)
        return buffer
    }

    private fun select(period: MediaPeriod, vararg selections: ExoTrackSelection?, positionUs: Long = 0L): Array<SampleStream?> {
        val streams = arrayOfNulls<SampleStream>(selections.size)
        period.selectTracks(selections, BooleanArray(selections.size), streams, BooleanArray(selections.size), positionUs)
        return streams
    }

    @Test
    fun `positions handed down lose the offset and values handed up gain it`() {
        val child = FakePeriod(emptyList())
        val period = TimeOffsetMediaPeriod(child, 2_000_000L)
        period.prepare(object : MediaPeriod.Callback {
            override fun onPrepared(mediaPeriod: MediaPeriod) {}
            override fun onContinueLoadingRequested(source: MediaPeriod) {}
        }, 5_000_000L)
        assertEquals(3_000_000L, child.preparedAtUs)
        period.discardBuffer(5_000_000L, false)
        assertEquals(3_000_000L, child.discardedAtUs)
        period.reevaluateBuffer(5_000_000L)
        assertEquals(3_000_000L, child.reevaluatedAtUs)
        period.continueLoading(LoadingInfo.Builder().setPlaybackPositionUs(5_000_000L).build())
        assertEquals(3_000_000L, child.loadingPositionUs)
        child.bufferedUs = 7_000_000L
        child.nextLoadUs = 8_000_000L
        child.discontinuityUs = 1_000_000L
        assertEquals(9_000_000L, period.bufferedPositionUs)
        assertEquals(10_000_000L, period.nextLoadPositionUs)
        assertEquals(3_000_000L, period.readDiscontinuity())
    }

    @Test
    fun `the unset and end of source sentinels pass through untouched`() {
        val child = FakePeriod(emptyList())
        val period = TimeOffsetMediaPeriod(child, 2_000_000L)
        child.bufferedUs = C.TIME_END_OF_SOURCE
        child.nextLoadUs = C.TIME_END_OF_SOURCE
        child.discontinuityUs = C.TIME_UNSET
        assertEquals(C.TIME_END_OF_SOURCE, period.bufferedPositionUs)
        assertEquals(C.TIME_END_OF_SOURCE, period.nextLoadPositionUs)
        assertEquals(C.TIME_UNSET, period.readDiscontinuity())
        assertEquals(C.TIME_END_OF_SOURCE, period.setEndPositionUs(C.TIME_END_OF_SOURCE))
    }

    @Test
    fun `a seek returns exactly the position it was given`() {
        val child = FakePeriod(emptyList())
        val period = TimeOffsetMediaPeriod(child, 2_000_000L)
        assertEquals(5_000_000L, period.seekToUs(5_000_000L))
        assertEquals(3_000_000L, child.soughtToUs)
        assertEquals(5_000_000L, period.getAdjustedSeekPositionUs(5_000_000L, SeekParameters.DEFAULT))
    }

    @Test
    fun `the callback reaches the outer period as itself`() {
        val child = FakePeriod(emptyList())
        val period = TimeOffsetMediaPeriod(child, 0L)
        var prepared: MediaPeriod? = null
        period.prepare(object : MediaPeriod.Callback {
            override fun onPrepared(mediaPeriod: MediaPeriod) {
                prepared = mediaPeriod
            }
            override fun onContinueLoadingRequested(source: MediaPeriod) {}
        }, 0L)
        child.callback!!.onPrepared(child)
        assertSame(period, prepared)
    }

    @Test
    fun `only a sample read is shifted`() {
        val fake = FakeStream()
        val child = FakePeriod(listOf(fake))
        val period = TimeOffsetMediaPeriod(child, 2_000_000L)
        val stream = select(period, selection("application/x-subrip"), positionUs = 5_000_000L)[0]!!
        assertEquals(3_000_000L, child.selectedAtUs)

        fake.nextTimeUs = 1_000_000L
        assertEquals(3_000_000L, readOnce(stream).timeUs)

        fake.nextResult = C.RESULT_FORMAT_READ
        assertEquals(0L, readOnce(stream).timeUs)

        fake.nextResult = C.RESULT_NOTHING_READ
        assertEquals(0L, readOnce(stream).timeUs)

        fake.nextResult = C.RESULT_BUFFER_READ
        fake.endOfStream = true
        val end = readOnce(stream)
        assertTrue(end.isEndOfStream)
        assertEquals(0L, end.timeUs)

        stream.skipData(5_000_000L)
        assertEquals(3_000_000L, fake.skippedToUs)
    }

    @Test
    fun `a new offset applies to the next read and the next select`() {
        val fake = FakeStream()
        val child = FakePeriod(listOf(fake))
        val period = TimeOffsetMediaPeriod(child, 2_000_000L)
        val stream = select(period, selection("application/x-subrip"))[0]!!
        fake.nextTimeUs = 1_000_000L
        assertEquals(3_000_000L, readOnce(stream).timeUs)
        period.updateTimeOffsetUs(-500_000L)
        assertEquals(500_000L, readOnce(stream).timeUs)
        assertEquals(4_500_000L, period.seekToUs(4_500_000L))
        assertEquals(5_000_000L, child.soughtToUs)
    }

    @Test
    fun `reselecting keeps the same wrapper for the same child stream`() {
        val fake = FakeStream()
        val child = FakePeriod(listOf(fake))
        val period = TimeOffsetMediaPeriod(child, 0L)
        val first = select(period, selection("application/x-subrip"))[0]
        val streams = arrayOf(first)
        period.selectTracks(arrayOf(selection("application/x-subrip")), BooleanArray(1), streams, BooleanArray(1), 0L)
        assertSame(first, streams[0])
    }

    @Test
    fun `the embedded period forwards positions unchanged and shifts only text streams`() {
        val video = FakeStream()
        val text = FakeStream()
        val caption = FakeStream()
        val child = FakePeriod(listOf(video, text, caption))
        val period = TextStreamOffsetMediaPeriod(child, 2_000_000L)
        assertEquals(5_000_000L, period.seekToUs(5_000_000L))
        assertEquals(5_000_000L, child.soughtToUs)
        val streams = select(
            period,
            selection("video/avc"),
            selection("application/x-media3-cues", "application/x-subrip"),
            selection("application/cea-608"),
            positionUs = 5_000_000L,
        )
        assertEquals(5_000_000L, child.selectedAtUs)
        assertSame(video, streams[0])
        assertNotSame(text, streams[1])
        assertSame(caption, streams[2])

        video.nextTimeUs = 1_000_000L
        text.nextTimeUs = 1_000_000L
        assertEquals(1_000_000L, readOnce(streams[0]!!).timeUs)
        assertEquals(3_000_000L, readOnce(streams[1]!!).timeUs)

        period.updateTimeOffsetUs(-250_000L)
        assertEquals(750_000L, readOnce(streams[1]!!).timeUs)
        streams[1]!!.skipData(5_000_000L)
        assertEquals(5_250_000L, text.skippedToUs)
    }
}
