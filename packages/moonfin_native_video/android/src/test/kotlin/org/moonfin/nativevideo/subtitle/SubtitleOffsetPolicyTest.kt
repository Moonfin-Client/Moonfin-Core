package org.moonfin.nativevideo.subtitle

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class SubtitleOffsetPolicyTest {

    @Test
    fun `manual delay is clamped to five seconds either way`() {
        assertEquals(5000L, clampManualDelayMs(9000L))
        assertEquals(-5000L, clampManualDelayMs(-9000L))
        assertEquals(1500L, clampManualDelayMs(1500L))
    }

    @Test
    fun `effective offset adds the clamped manual delay to the auto one`() {
        assertEquals(2_000_000L, effectiveOffsetUs(2_000_000L, 0L))
        assertEquals(1_500_000L, effectiveOffsetUs(2_000_000L, -500L))
        assertEquals(7_000_000L, effectiveOffsetUs(2_000_000L, 9000L))
    }

    @Test
    fun `parsed cues bitmap and text formats are shifted`() {
        assertTrue(shiftsEmbeddedFormat("application/x-media3-cues", "application/x-subrip"))
        assertTrue(shiftsEmbeddedFormat("application/x-media3-cues", null))
        assertTrue(shiftsEmbeddedFormat("application/pgs", null))
        assertTrue(shiftsEmbeddedFormat("application/vobsub", null))
        assertTrue(shiftsEmbeddedFormat("application/dvbsubs", null))
        assertTrue(shiftsEmbeddedFormat("text/x-ssa", null))
        assertTrue(shiftsEmbeddedFormat("application/x-subrip", null))
        assertTrue(shiftsEmbeddedFormat("text/vtt", null))
        assertTrue(shiftsEmbeddedFormat("application/ttml+xml", null))
    }

    @Test
    fun `closed captions are never shifted`() {
        assertFalse(shiftsEmbeddedFormat("application/cea-608", null))
        assertFalse(shiftsEmbeddedFormat("application/cea-708", null))
        assertFalse(shiftsEmbeddedFormat("application/x-mp4-cea-608", null))
        assertFalse(shiftsEmbeddedFormat("application/x-media3-cues", "application/cea-608"))
        assertFalse(shiftsEmbeddedFormat("application/x-media3-cues", "application/cea-708"))
    }

    @Test
    fun `video audio and unknown formats are not shifted`() {
        assertFalse(shiftsEmbeddedFormat("video/avc", null))
        assertFalse(shiftsEmbeddedFormat("audio/eac3", null))
        assertFalse(shiftsEmbeddedFormat(null, null))
    }

    @Test
    fun `a manual change always retimes`() {
        assertTrue(shouldRetime(0L, 0L, manualChanged = true))
        assertTrue(shouldRetime(100L, 110L, manualChanged = true))
    }

    @Test
    fun `an auto change retimes only once it moved far enough to see`() {
        assertFalse(shouldRetime(2_000_000L, 2_040_000L, manualChanged = false))
        assertTrue(shouldRetime(2_000_000L, 2_050_000L, manualChanged = false))
        assertTrue(shouldRetime(2_050_000L, 2_000_000L, manualChanged = false))
        assertTrue(shouldRetime(0L, 2_000_000L, manualChanged = false))
    }

    private fun tree(
        isLive: Boolean = false,
        isPreview: Boolean = false,
        mediaType: String = "video",
        externalCount: Int = 0,
        manualDelayMs: Long = 0L,
        hasEmbeddedWrapper: Boolean = false,
    ) = sourceTreeFor(
        isLive = isLive,
        isPreview = isPreview,
        mediaType = mediaType,
        externalCount = externalCount,
        manualDelayMs = manualDelayMs,
        hasEmbeddedWrapper = hasEmbeddedWrapper,
    )

    @Test
    fun `plain video with nothing to shift keeps the player item path`() {
        assertEquals(SourceTree.PLAYER_ITEM, tree())
    }

    @Test
    fun `live preview and audio never get the tree`() {
        assertEquals(SourceTree.PLAYER_ITEM, tree(isLive = true, externalCount = 2, manualDelayMs = 500L))
        assertEquals(SourceTree.PLAYER_ITEM, tree(isPreview = true, externalCount = 1))
        assertEquals(SourceTree.PLAYER_ITEM, tree(mediaType = "audio", manualDelayMs = 500L))
    }

    @Test
    fun `sidecars a delay or an existing wrapper get the tree`() {
        assertEquals(SourceTree.CUSTOM_TREE, tree(externalCount = 1))
        assertEquals(SourceTree.CUSTOM_TREE, tree(manualDelayMs = -100L))
        assertEquals(SourceTree.CUSTOM_TREE, tree(hasEmbeddedWrapper = true))
    }

    @Test
    fun `an external id matches bare or with the merging prefix`() {
        assertTrue(externalFormatIdMatches("10000", "10000"))
        assertTrue(externalFormatIdMatches("1:10000", "10000"))
        assertFalse(externalFormatIdMatches("2:10001", "10000"))
        assertFalse(externalFormatIdMatches("110000", "10000"))
        assertFalse(externalFormatIdMatches(null, "10000"))
    }

    @Test
    fun `the sync delays payload keeps the manual value apart from the auto one`() {
        val payload = syncDelaysPayload(audioDelayMs = -200L, subtitleDelayMs = 300L, subtitleAutoOffsetMs = 2000L)
        assertEquals("syncDelays", payload["event"])
        assertEquals(-200L, payload["audioDelayMs"])
        assertEquals(300L, payload["subtitleDelayMs"])
        assertEquals(2000L, payload["subtitleAutoOffsetMs"])
        assertEquals(4, payload.size)
    }
}
