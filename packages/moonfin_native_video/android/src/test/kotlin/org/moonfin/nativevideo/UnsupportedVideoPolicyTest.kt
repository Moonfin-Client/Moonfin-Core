package org.moonfin.nativevideo

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class UnsupportedVideoPolicyTest {

    private fun report(
        mediaType: String = "video",
        isPreview: Boolean = false,
        alreadyReported: Boolean = false,
        hasVideoTrack: Boolean = true,
        videoSelected: Boolean = false,
    ): Boolean = shouldReportUnsupportedVideo(
        mediaType = mediaType,
        isPreview = isPreview,
        alreadyReported = alreadyReported,
        hasVideoTrack = hasVideoTrack,
        videoSelected = videoSelected,
    )

    @Test
    fun `a video track nothing selected is reported`() {
        assertTrue(report())
    }

    @Test
    fun `a selected video track is left alone`() {
        assertFalse(report(videoSelected = true))
    }

    @Test
    fun `no video track at all reports nothing`() {
        assertFalse(report(hasVideoTrack = false))
    }

    @Test
    fun `a second track change stays quiet`() {
        assertFalse(report(alreadyReported = true))
    }

    @Test
    fun `audio playback is never reported`() {
        assertFalse(report(mediaType = "audio"))
    }

    @Test
    fun `a preview is never reported`() {
        assertFalse(report(isPreview = true))
    }
}
