package org.moonfin.nativevideo

import android.media.audiofx.LoudnessEnhancer

class ExoPlayerAudioPipeline {
    private var loudnessEnhancer: LoudnessEnhancer? = null

    var normalizationGainDb: Float? = null
        set(value) {
            field = value
            applyGain()
        }

    var userBoostMb: Int = 0
        set(value) {
            field = value.coerceIn(0, 2000)
            applyGain()
        }

    fun setAudioSessionId(audioSessionId: Int) {
        loudnessEnhancer?.release()
        loudnessEnhancer = runCatching {
            LoudnessEnhancer(audioSessionId)
        }.getOrNull()
        applyGain()
    }

    fun release() {
        loudnessEnhancer?.release()
        loudnessEnhancer = null
    }

    private fun applyGain() {
        val enhancer = loudnessEnhancer ?: return
        val normalizationMb = normalizationGainDb?.times(100f)?.toInt() ?: 0
        val targetGain = (normalizationMb + userBoostMb).coerceIn(-6000, 6000)
        val enabled = normalizationGainDb != null || userBoostMb > 0
        runCatching {
            enhancer.setEnabled(enabled)
            enhancer.setTargetGain(if (enabled) targetGain else 0)
        }.onFailure {
            loudnessEnhancer?.release()
            loudnessEnhancer = null
        }
    }
}
