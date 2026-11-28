package org.moonfin.nativevideo

import androidx.media3.common.C
import androidx.media3.common.audio.AudioProcessor
import androidx.media3.common.audio.BaseAudioProcessor
import androidx.media3.common.util.UnstableApi
import java.nio.ByteBuffer
import kotlin.math.abs
import kotlin.math.exp
import kotlin.math.log10
import kotlin.math.max
import kotlin.math.min
import kotlin.math.pow
import kotlin.math.roundToInt

/**
 * Night Mode uses the same numbers on every player so it sounds the same
 * everywhere. A soft knee compressor feeds a peak limiter so the makeup gain
 * never clips, and all channels share one gain so the stereo image stays put.
 * [enabled] is read when the sink configures, so a change lands on the next
 * title.
 */
@UnstableApi
internal class NightModeCompressor(
    private val enabled: () -> Boolean,
) : BaseAudioProcessor() {
    companion object {
        private const val THRESHOLD_DB = -30f
        private const val RATIO = 4f
        private const val MAKEUP_DB = 10f
        private const val ATTACK_MS = 5f
        private const val RELEASE_MS = 250f
        private const val KNEE_DB = 6f
        const val LIMIT = 0.891f
        private const val LIMITER_RELEASE_MS = 50f
        private const val FLOOR_DB = -120f
    }

    private var attackCoeff = 0f
    private var releaseCoeff = 0f
    private var limiterReleaseCoeff = 0f
    private var reductionDb = 0f
    private var limiterGain = 1f
    private var frame = IntArray(0)

    override fun onConfigure(inputAudioFormat: AudioProcessor.AudioFormat): AudioProcessor.AudioFormat =
        if (enabled() && inputAudioFormat.encoding == C.ENCODING_PCM_16BIT) {
            inputAudioFormat
        } else {
            AudioProcessor.AudioFormat.NOT_SET
        }

    override fun onFlush(streamMetadata: AudioProcessor.StreamMetadata) {
        // The pipeline also flushes after a reset, when the format is unset.
        val rate = inputAudioFormat.sampleRate.toFloat()
        attackCoeff = smoothing(ATTACK_MS, rate)
        releaseCoeff = smoothing(RELEASE_MS, rate)
        limiterReleaseCoeff = smoothing(LIMITER_RELEASE_MS, rate)
        reductionDb = 0f
        limiterGain = 1f
        frame = IntArray(inputAudioFormat.channelCount.coerceAtLeast(0))
    }

    override fun queueInput(inputBuffer: ByteBuffer) {
        val channels = frame.size
        val frames = inputBuffer.remaining() / (2 * channels)
        val out = replaceOutputBuffer(frames * 2 * channels)
        repeat(frames) {
            var peak = 0
            for (c in 0 until channels) {
                // 16-bit PCM is always little endian, whatever order the buffer is set to.
                val lo = inputBuffer.get().toInt() and 0xFF
                val sample = (inputBuffer.get().toInt() shl 8) or lo
                frame[c] = sample
                peak = max(peak, abs(sample))
            }
            val level = peak / 32768f
            val levelDb = if (level > 1e-6f) 20f * log10(level) else FLOOR_DB
            val target = staticReductionDb(levelDb)
            val coeff = if (target < reductionDb) attackCoeff else releaseCoeff
            reductionDb = coeff * reductionDb + (1f - coeff) * target
            var gain = 10f.pow((reductionDb + MAKEUP_DB) / 20f)

            val outPeak = level * gain
            val needed = if (outPeak > LIMIT) LIMIT / outPeak else 1f
            limiterGain = if (needed < limiterGain) {
                needed
            } else {
                min(needed, 1f - (1f - limiterGain) * limiterReleaseCoeff)
            }
            gain *= limiterGain

            for (c in 0 until channels) {
                val v = (frame[c] * gain).roundToInt().coerceIn(-32768, 32767)
                out.put(v.toByte())
                out.put((v shr 8).toByte())
            }
        }
        out.flip()
    }

    internal fun staticReductionDb(levelDb: Float): Float {
        val over = levelDb - THRESHOLD_DB
        val slope = 1f / RATIO - 1f
        return when {
            2f * over < -KNEE_DB -> 0f
            2f * abs(over) <= KNEE_DB -> slope * (over + KNEE_DB / 2f).pow(2) / (2f * KNEE_DB)
            else -> slope * over
        }
    }

    private fun smoothing(ms: Float, sampleRate: Float): Float =
        if (sampleRate > 0f) exp(-1000f / (ms * sampleRate)) else 0f
}
