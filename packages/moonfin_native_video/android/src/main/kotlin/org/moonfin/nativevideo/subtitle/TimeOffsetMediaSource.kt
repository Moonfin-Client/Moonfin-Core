package org.moonfin.nativevideo.subtitle

import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.source.MediaPeriod
import androidx.media3.exoplayer.source.MediaSource
import androidx.media3.exoplayer.source.WrappingMediaSource
import androidx.media3.exoplayer.upstream.Allocator

/**
 * Wraps one sideloaded subtitle source so its whole timeline can slide by a
 * live offset. A positive offset shows cues later.
 *
 * The offset reaches every period this source has handed out, so a change
 * takes effect without a new prepare. [setTimeOffsetUs] runs on the playback
 * thread, the same thread that creates and releases the periods.
 */
@UnstableApi
internal class TimeOffsetMediaSource(
    child: MediaSource,
    initialOffsetUs: Long,
) : WrappingMediaSource(child) {

    private val activePeriods = ArrayList<TimeOffsetMediaPeriod>()

    @Volatile
    var timeOffsetUs: Long = initialOffsetUs
        private set

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
        val offset = timeOffsetUs
        val period = TimeOffsetMediaPeriod(
            super.createPeriod(id, allocator, startPositionUs - offset),
            offset,
        )
        activePeriods.add(period)
        return period
    }

    override fun releasePeriod(mediaPeriod: MediaPeriod) {
        val period = mediaPeriod as TimeOffsetMediaPeriod
        activePeriods.remove(period)
        // The child only knows the period it made, so the wrapper comes off.
        super.releasePeriod(period.wrappedMediaPeriod)
    }
}
