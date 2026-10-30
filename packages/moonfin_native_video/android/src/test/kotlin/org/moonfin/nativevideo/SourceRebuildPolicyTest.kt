package org.moonfin.nativevideo

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class SourceRebuildPolicyTest {
    @Test
    fun `loaded video source is rebuilt for every next video including live channels`() {
        assertTrue(SourceRebuildPolicy.shouldRebuild(
            playerHasLoadedSource = true,
            mediaTypeChanged = false,
            decoderPreferenceChanged = false,
            nextIsAudio = false,
        ))
    }

    @Test
    fun `audio source avoids video-only rebuild unless type or decoder preference changed`() {
        assertFalse(SourceRebuildPolicy.shouldRebuild(
            playerHasLoadedSource = true,
            mediaTypeChanged = false,
            decoderPreferenceChanged = false,
            nextIsAudio = true,
        ))
        assertTrue(SourceRebuildPolicy.shouldRebuild(
            playerHasLoadedSource = true,
            mediaTypeChanged = true,
            decoderPreferenceChanged = false,
            nextIsAudio = true,
        ))
        assertTrue(SourceRebuildPolicy.shouldRebuild(
            playerHasLoadedSource = false,
            mediaTypeChanged = false,
            decoderPreferenceChanged = true,
            nextIsAudio = true,
        ))
    }
}
