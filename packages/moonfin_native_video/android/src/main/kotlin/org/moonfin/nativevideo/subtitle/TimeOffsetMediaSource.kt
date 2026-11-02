package org.moonfin.nativevideo.subtitle

import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.source.MediaPeriod
import androidx.media3.exoplayer.source.MediaSource
import androidx.media3.exoplayer.source.WrappingMediaSource
import androidx.media3.exoplayer.upstream.Allocator
import java.io.IOException

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
    initialSecondaryOffsetUs: Long? = null,
    private val onSecondaryError: (IOException) -> Unit = {},
) : WrappingMediaSource(child) {

    private val activePeriods = ArrayList<TimeOffsetMediaPeriod>()

    @Volatile
    var isSubtitleLoading = false
        private set

    private fun updateSubtitleLoading() {
        isSubtitleLoading = activePeriods.any { it.isSubtitleLoading }
    }

    @Volatile
    private var timeOffsetUs: Long = initialOffsetUs

    @Volatile
    private var secondaryOffsetUs = initialSecondaryOffsetUs

    fun setTimeOffsetUs(offsetUs: Long, secondaryUs: Long? = secondaryOffsetUs) {
        timeOffsetUs = offsetUs
        secondaryOffsetUs = secondaryUs
        for (period in activePeriods) {
            period.updateTimeOffsetUs(offsetUs, secondaryUs)
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
            secondaryOffsetUs,
            onSecondaryError = onSecondaryError,
            onLoadingChanged = ::updateSubtitleLoading,
        )
        activePeriods.add(period)
        return period
    }

    override fun releasePeriod(mediaPeriod: MediaPeriod) {
        val period = mediaPeriod as TimeOffsetMediaPeriod
        activePeriods.remove(period)
        updateSubtitleLoading()
        // The child only knows the period it made, so the wrapper comes off.
        super.releasePeriod(period.wrappedMediaPeriod)
    }
}
