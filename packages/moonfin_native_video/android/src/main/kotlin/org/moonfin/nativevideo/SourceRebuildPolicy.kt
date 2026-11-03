package org.moonfin.nativevideo

/** Keeps decoder replacement decisions aligned with the source setup adapter. */
internal object SourceRebuildPolicy {
    fun shouldRebuild(
        playerHasLoadedSource: Boolean,
        mediaTypeChanged: Boolean,
        decoderPreferenceChanged: Boolean,
        nextIsAudio: Boolean,
    ): Boolean = mediaTypeChanged || decoderPreferenceChanged ||
        (!nextIsAudio && playerHasLoadedSource)
}
