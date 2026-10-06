package org.moonfin.nativevideo

import android.media.audiofx.LoudnessEnhancer
import java.util.concurrent.Executors

/**
 * Every effect call goes through the audio server, which can stall for
 * seconds while it sets up a passthrough track, so they all run on one
 * background thread and the main thread never waits on them.
 */
class ExoPlayerAudioPipeline {
    private var loudnessEnhancer: LoudnessEnhancer? = null

    @Volatile
    var normalizationGainDb: Float? = null
        set(value) {
            field = value
            effectThread.execute(::applyGain)
        }

    @Volatile
    var userBoostMb: Int = 0
        set(value) {
            field = value.coerceIn(0, 2000)
            effectThread.execute(::applyGain)
        }

    fun setAudioSessionId(audioSessionId: Int) {
        effectThread.execute {
            loudnessEnhancer?.release()
            loudnessEnhancer = runCatching {
                LoudnessEnhancer(audioSessionId)
            }.getOrNull()
            applyGain()
        }
    }

    fun release() {
        effectThread.execute {
            loudnessEnhancer?.release()
            loudnessEnhancer = null
        }
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

    private companion object {
        val effectThread = Executors.newSingleThreadExecutor { runnable ->
            Thread(runnable, "moonfin-audio-effects").apply { isDaemon = true }
        }
    }
}
