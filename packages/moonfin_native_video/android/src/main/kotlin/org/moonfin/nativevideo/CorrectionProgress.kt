package org.moonfin.nativevideo

import androidx.media3.common.Timeline
import androidx.media3.exoplayer.hls.playlist.HlsMediaPlaylist

/** Converts Media3's sliding window buffered coordinate to a first-period coordinate. */
internal class CorrectionProgress {
    data class Sample(val epoch: Epoch, val positionMs: Long)
    data class Epoch(val firstPeriodUid: Any, val discontinuitySequence: Int, val resetGeneration: Int)

    private val window = Timeline.Window()
    private var resetGeneration = 0

    fun reset() {
        resetGeneration++
    }

    fun sample(
        timeline: Timeline,
        windowIndex: Int,
        windowBufferedPositionMs: Long,
        playlist: HlsMediaPlaylist?,
    ): Sample? {
        if (timeline.isEmpty || windowBufferedPositionMs < 0L) return null
        if (windowIndex !in 0 until timeline.windowCount) return null
        timeline.getWindow(windowIndex, window)
        val firstPeriodIndex = window.firstPeriodIndex
        if (firstPeriodIndex !in 0 until timeline.periodCount) return null
        val firstPeriodUid = timeline.getUidOfPeriod(firstPeriodIndex)
        val offsetMs = window.positionInFirstPeriodMs
        if (offsetMs < 0L) return null
        val discontinuitySequence = playlist?.let {
            val bufferedUs = windowBufferedPositionMs * 1_000L
            sequenceAt(it, bufferedUs)
        } ?: 0
        return Sample(
            Epoch(
                firstPeriodUid,
                (playlist?.discontinuitySequence ?: 0) + discontinuitySequence,
                resetGeneration,
            ),
            saturatingAdd(offsetMs, windowBufferedPositionMs),
        )
    }

    /** HLS discontinuities can be published in low-latency trailing parts before a segment exists. */
    private fun sequenceAt(playlist: HlsMediaPlaylist, bufferedPositionUs: Long): Int {
        var latestStartUs = Long.MIN_VALUE
        var latestSequence = 0

        fun observe(startUs: Long, sequence: Int) {
            if (startUs <= bufferedPositionUs && startUs >= latestStartUs) {
                latestStartUs = startUs
                latestSequence = sequence
            }
        }

        playlist.segments.forEach { segment ->
            observe(segment.relativeStartTimeUs, segment.relativeDiscontinuitySequence)
            segment.parts.forEach { part ->
                observe(part.relativeStartTimeUs, part.relativeDiscontinuitySequence)
            }
        }
        playlist.trailingParts.forEach { part ->
            observe(part.relativeStartTimeUs, part.relativeDiscontinuitySequence)
        }
        return latestSequence
    }

    private fun saturatingAdd(left: Long, right: Long): Long =
        if (Long.MAX_VALUE - left < right) Long.MAX_VALUE else left + right
}
