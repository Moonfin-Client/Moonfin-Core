package org.moonfin.nativevideo

import androidx.media3.common.Timeline
import androidx.media3.common.C
import androidx.media3.exoplayer.hls.playlist.HlsMediaPlaylist
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class CorrectionProgressTest {
    private class TimelineFixture(
        private val uid: Any = "period-1",
        private val windowOffsetUs: Long = 12_000_000L,
    ) : Timeline() {
        override fun getWindowCount() = 1
        override fun getWindow(windowIndex: Int, window: Window, defaultPositionProjectionUs: Long): Window {
            require(windowIndex == 0)
            return window.set(
                /* uid= */ "window",
                /* mediaItem= */ null,
                /* manifest= */ null,
                /* presentationStartTimeMs= */ 0L,
                /* windowStartTimeMs= */ 0L,
                /* elapsedRealtimeEpochOffsetMs= */ androidx.media3.common.C.TIME_UNSET,
                /* isSeekable= */ true,
                /* isDynamic= */ true,
                /* liveConfiguration= */ null,
                /* defaultPositionUs= */ 0L,
                /* durationUs= */ androidx.media3.common.C.TIME_UNSET,
                /* firstPeriodIndex= */ 0,
                /* lastPeriodIndex= */ 0,
                /* positionInFirstPeriodUs= */ windowOffsetUs,
            )
        }
        override fun getPeriodCount() = 1
        override fun getPeriod(periodIndex: Int, period: Period, setIds: Boolean): Period =
            period.set(null, if (setIds) uid else null, 0, androidx.media3.common.C.TIME_UNSET, -windowOffsetUs)
        override fun getIndexOfPeriod(uid: Any) = if (this.uid == uid) 0 else -1
        override fun getUidOfPeriod(periodIndex: Int): Any = uid
    }

    private fun playlist(
        segments: List<HlsMediaPlaylist.Segment> = emptyList(),
        trailingParts: List<HlsMediaPlaylist.Part> = emptyList(),
        discontinuitySequence: Int = 0,
    ) = HlsMediaPlaylist(
        /* playlistType= */ 0,
        /* baseUri= */ "https://example.test/live.m3u8",
        /* tags= */ emptyList(),
        /* startOffsetUs= */ C.TIME_UNSET,
        /* preciseStart= */ false,
        /* startTimeUs= */ 0L,
        /* hasDiscontinuitySequence= */ true,
        /* discontinuitySequence= */ discontinuitySequence,
        /* mediaSequence= */ 100L,
        /* version= */ 3,
        /* targetDurationUs= */ 6_000_000L,
        /* partTargetDurationUs= */ 500_000L,
        /* hasIndependentSegments= */ false,
        /* hasEndTag= */ false,
        /* hasProgramDateTime= */ false,
        /* protectionSchemes= */ null,
        /* segments= */ segments,
        /* trailingParts= */ trailingParts,
        /* serverControl= */ HlsMediaPlaylist.ServerControl(
            /* skipUntilUs= */ C.TIME_UNSET,
            /* canSkipDateRanges= */ false,
            /* holdBackUs= */ C.TIME_UNSET,
            /* partHoldBackUs= */ C.TIME_UNSET,
            /* canBlockReload= */ false,
        ),
        /* renditionReports= */ emptyMap(),
        /* interstitials= */ emptyList(),
        /* lastSeenInitSegment= */ null,
    )

    private fun part(startUs: Long, discontinuity: Int) = HlsMediaPlaylist.Part(
        /* url= */ "part-$startUs.m4s",
        /* initializationSegment= */ null,
        /* durationUs= */ 500_000L,
        /* relativeDiscontinuitySequence= */ discontinuity,
        /* relativeStartTimeUs= */ startUs,
        /* drmInitData= */ null,
        /* keyUri= */ null,
        /* encryptionIV= */ null,
        /* byteRangeOffset= */ 0L,
        /* byteRangeLength= */ C.LENGTH_UNSET.toLong(),
        /* hasGapTag= */ false,
        /* isIndependent= */ true,
        /* isPreload= */ false,
    )

    @Test fun `window-relative buffer becomes a first-period coordinate across a sliding window`() {
        val progress = CorrectionProgress()
        val manifest = playlist(discontinuitySequence = 4)
        val first = progress.sample(TimelineFixture(windowOffsetUs = 12_000_000L), 0, 18_000L, manifest)!!
        val slid = progress.sample(TimelineFixture(windowOffsetUs = 17_000_000L), 0, 18_000L, manifest)!!
        assertEquals(first.epoch, slid.epoch)
        assertEquals(30_000L, first.positionMs)
        assertEquals(35_000L, slid.positionMs)
    }

    @Test fun `period replacement and HLS discontinuity change the progress epoch`() {
        val progress = CorrectionProgress()
        val original = progress.sample(TimelineFixture(), 0, 18_000L, playlist(discontinuitySequence = 4))!!
        val period = progress.sample(TimelineFixture(uid = "period-2"), 0, 18_000L, playlist(discontinuitySequence = 4))!!
        val discontinuity = progress.sample(TimelineFixture(), 0, 18_000L, playlist(discontinuitySequence = 5))!!
        assertEquals(false, original.epoch == period.epoch)
        assertEquals(false, original.epoch == discontinuity.epoch)
        progress.reset()
        val reset = progress.sample(TimelineFixture(), 0, 18_000L, playlist(discontinuitySequence = 4))!!
        assertEquals(false, original.epoch == reset.epoch)
    }

    @Test fun `missing and invalid timeline samples withhold progress`() {
        val progress = CorrectionProgress()
        assertNull(progress.sample(TimelineFixture(), 2, 18_000L, null))
        assertNull(progress.sample(TimelineFixture(), 0, -1L, null))
        assertNull(progress.sample(Timeline.EMPTY, 0, 18_000L, null))
    }

    @Test fun `trailing low latency part discontinuity changes the buffered progress epoch`() {
        val progress = CorrectionProgress()
        val manifest = playlist(
            segments = listOf(
                HlsMediaPlaylist.Segment(
                    "segment-0.m4s", null, "", 6_000_000L, 0, 0L,
                    null, null, null, 0L, C.LENGTH_UNSET.toLong(), false, emptyList(),
                ),
            ),
            trailingParts = listOf(part(6_000_000L, 0), part(6_500_000L, 1)),
            discontinuitySequence = 4,
        )
        val beforeBoundary = progress.sample(TimelineFixture(), 0, 6_499L, manifest)!!
        val afterBoundary = progress.sample(TimelineFixture(), 0, 6_500L, manifest)!!
        assertEquals(4, beforeBoundary.epoch.discontinuitySequence)
        assertEquals(5, afterBoundary.epoch.discontinuitySequence)
    }

    @Test fun `sliding eighteen second window advances loaded coordinate enough for stable correction`() {
        val progress = CorrectionProgress()
        val correction = LiveRateCorrection().apply { begin(0L) }
        val manifest = playlist(discontinuitySequence = 0)
        val first = progress.sample(TimelineFixture(windowOffsetUs = 12_000_000L), 0, 18_000L, manifest)!!
        val slid = progress.sample(TimelineFixture(windowOffsetUs = 17_000_000L), 0, 18_000L, manifest)!!
        correction.onReading(
            300_000L,
            first,
            RateEvidence(RateChoice(25f, RateSource.MEASURED, false), null),
            fits = false,
        )
        assertEquals(25f, correction.takeDue(305_000L, slid)!!.choice.fps!!, 0.001f)
    }
}
