package org.moonfin.nativevideo.subtitle

import androidx.media3.common.util.TimestampAdjuster
import org.junit.Assert.assertEquals
import org.junit.Test

class HlsTimestampOffsetObserverTest {

    private val reported = mutableListOf<Long>()
    private val observer = HlsTimestampOffsetObserver(
        delegate = { _, _, _, _, _, _, _ -> throw UnsupportedOperationException() },
        onOffsetUs = { reported.add(it) },
    )

    @Test
    fun `nothing is reported before the adjuster settles`() {
        val adjuster = TimestampAdjuster(10_000_000L)
        observer.reportIfSettled(adjuster)
        assertEquals(emptyList<Long>(), reported)
    }

    @Test
    fun `the settled offset is reported once`() {
        val adjuster = TimestampAdjuster(10_000_000L)
        adjuster.adjustSampleTimestamp(8_000_000L)
        observer.reportIfSettled(adjuster)
        observer.reportIfSettled(adjuster)
        adjuster.adjustSampleTimestamp(8_500_000L)
        observer.reportIfSettled(adjuster)
        assertEquals(listOf(2_000_000L), reported)
    }

    @Test
    fun `a reset that settles on a new value is reported`() {
        val adjuster = TimestampAdjuster(10_000_000L)
        adjuster.adjustSampleTimestamp(8_000_000L)
        observer.reportIfSettled(adjuster)
        adjuster.reset(30_000_000L)
        observer.reportIfSettled(adjuster)
        adjuster.adjustSampleTimestamp(29_000_000L)
        observer.reportIfSettled(adjuster)
        assertEquals(listOf(2_000_000L, 1_000_000L), reported)
    }

    @Test
    fun `a reset that settles on the same value is reported again`() {
        val adjuster = TimestampAdjuster(10_000_000L)
        adjuster.adjustSampleTimestamp(8_000_000L)
        observer.reportIfSettled(adjuster)
        adjuster.reset(30_000_000L)
        observer.reportIfSettled(adjuster)
        adjuster.adjustSampleTimestamp(28_000_000L)
        observer.reportIfSettled(adjuster)
        assertEquals(listOf(2_000_000L, 2_000_000L), reported)
    }
}
