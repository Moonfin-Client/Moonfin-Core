package org.moonfin.nativevideo

import androidx.annotation.OptIn
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.common.util.UnstableApi
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

@OptIn(UnstableApi::class)
class SubtitleSeekPolicyTest {
    private fun position(
        ms: Long,
        mediaIndex: Int = 0,
        periodIndex: Int = 0,
        periodUid: Any? = "period",
        adGroupIndex: Int = C.INDEX_UNSET,
    ): Player.PositionInfo = Player.PositionInfo(
        "window", mediaIndex, MediaItem.EMPTY, periodUid, periodIndex,
        ms, ms, adGroupIndex, C.INDEX_UNSET,
    )

    @Test
    fun noOpAudioDelaySeekPreservesVisibleCues() {
        assertFalse(subtitlePositionChanged(position(5_000L), position(5_000L)))
    }

    @Test
    fun realSeeksAndPeriodChangesClearCues() {
        val before = position(5_000L)
        assertTrue(subtitlePositionChanged(before, position(5_001L)))
        assertTrue(subtitlePositionChanged(before, position(5_000L, mediaIndex = 1)))
        assertTrue(subtitlePositionChanged(before, position(5_000L, periodIndex = 1)))
        assertTrue(subtitlePositionChanged(before, position(5_000L, periodUid = "next")))
        assertTrue(subtitlePositionChanged(before, position(5_000L, adGroupIndex = 0)))
    }
}
