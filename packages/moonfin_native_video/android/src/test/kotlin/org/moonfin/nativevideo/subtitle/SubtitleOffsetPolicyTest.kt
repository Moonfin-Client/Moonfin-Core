package org.moonfin.nativevideo.subtitle

import androidx.media3.exoplayer.source.MediaSource
import java.lang.reflect.Proxy
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class SubtitleOffsetPolicyTest {

    @Test
    fun `secondary source exposes the last applied offset while the setting changes`() {
        val unusedChild = Proxy.newProxyInstance(
            MediaSource::class.java.classLoader,
            arrayOf(MediaSource::class.java),
        ) { _, method, _ -> error("Unexpected source call: ${method.name}") } as MediaSource
        val source = TextStreamOffsetMediaSource(unusedChild, 0L, 1_000_000L)

        // Changing a saved adjustment while Secondary is Off doesn't yet
        // rewrite the source. Selection must detect the difference and retime.
        assertEquals(1_000_000L, source.currentSecondaryOffsetUs)
        assertTrue(source.currentSecondaryOffsetUs != 2_000_000L)
        source.setTimeOffsetUs(0L, 2_000_000L)
        assertEquals(2_000_000L, source.currentSecondaryOffsetUs)
    }

    @Test
    fun `manual delay is clamped to five seconds either way`() {
        assertEquals(5000L, clampManualDelayMs(9000L))
        assertEquals(-5000L, clampManualDelayMs(-9000L))
        assertEquals(1500L, clampManualDelayMs(1500L))
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
    fun `secondary accepts raw and parsed SRT and WebVTT including MP4`() {
        for (mime in listOf("application/x-subrip", "text/vtt", "application/x-mp4-vtt")) {
            assertTrue(mime, supportsSecondarySubtitleFormat(mime, null))
            assertTrue(mime, supportsSecondarySubtitleFormat("application/x-media3-cues", mime))
        }
        for (mime in listOf(null, "text/x-ssa", "application/pgs", "application/vobsub",
                "application/dvbsubs", "application/ttml+xml", "application/cea-608", "video/avc")) {
            assertFalse(mime, supportsSecondarySubtitleFormat(mime, null))
            assertFalse(mime, supportsSecondarySubtitleFormat("application/x-media3-cues", mime))
        }
    }

    private fun tree(
        isLive: Boolean = false,
        isPreview: Boolean = false,
        mediaType: String = "video",
        externalCount: Int = 0,
        manualDelayMs: Long = 0L,
        hasEmbeddedWrapper: Boolean = false,
        hasSecondarySidecar: Boolean = false,
    ) = sourceTreeFor(
        isLive = isLive,
        isPreview = isPreview,
        mediaType = mediaType,
        externalCount = externalCount,
        manualDelayMs = manualDelayMs,
        hasEmbeddedWrapper = hasEmbeddedWrapper,
        hasSecondarySidecar = hasSecondarySidecar,
    )

    @Test
    fun `plain video with nothing to shift keeps the player item path`() {
        assertEquals(SourceTree.PLAYER_ITEM, tree())
    }

    @Test
    fun `live preview and audio without secondary sidecars keep the player item path`() {
        assertEquals(SourceTree.PLAYER_ITEM, tree(isLive = true, externalCount = 2, manualDelayMs = 500L))
        assertEquals(SourceTree.PLAYER_ITEM, tree(isPreview = true, externalCount = 1))
        assertEquals(SourceTree.PLAYER_ITEM, tree(mediaType = "audio", manualDelayMs = 500L))
    }

    @Test
    fun `secondary sidecars always get independent timing including live sources`() {
        assertEquals(SourceTree.CUSTOM_TREE, tree(isLive = true, externalCount = 1, hasSecondarySidecar = true))
        assertEquals(SourceTree.CUSTOM_TREE, tree(isPreview = true, externalCount = 1, hasSecondarySidecar = true))
        assertEquals(SourceTree.CUSTOM_TREE, tree(mediaType = "audio", externalCount = 1, hasSecondarySidecar = true))
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
    fun `the sync delays payload carries both delays`() {
        val payload = syncDelaysPayload(audioDelayMs = -200L, subtitleDelayMs = 300L)
        assertEquals("syncDelays", payload["event"])
        assertEquals(-200L, payload["audioDelayMs"])
        assertEquals(300L, payload["subtitleDelayMs"])
        assertEquals(3, payload.size)
    }
}
