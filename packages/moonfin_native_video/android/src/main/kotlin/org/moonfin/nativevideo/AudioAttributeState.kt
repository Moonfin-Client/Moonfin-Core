package org.moonfin.nativevideo

import androidx.media3.common.AudioAttributes

class AudioAttributeState {
    private var audioAttributes: AudioAttributes? = null

    // A rebuilt player starts with no attributes, so the cache has to forget
    // what the old one was given or the new one never gets audio focus.
    fun reset() {
        audioAttributes = null
    }

    fun updateAudioAttributes(
        builder: AudioAttributes.Builder.() -> Unit,
        onChange: (audioAttributes: AudioAttributes) -> Unit,
    ) {
        val nextAudioAttributes = AudioAttributes.Builder().apply(builder).build()
        if (audioAttributes != nextAudioAttributes) {
            onChange(nextAudioAttributes)
            audioAttributes = nextAudioAttributes
        }
    }
}
