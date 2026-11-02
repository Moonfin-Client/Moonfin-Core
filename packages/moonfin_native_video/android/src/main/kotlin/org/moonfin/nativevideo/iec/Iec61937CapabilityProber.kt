package org.moonfin.nativevideo.iec

import android.media.AudioFormat

/**
 * Caches [Iec61937CarrierProbe] answers per carrier shape until [invalidate]
 * clears them after a route change.
 */
internal class Iec61937CapabilityProber {

    private val cache = HashMap<Long, Boolean>()

    fun supportsCarrier(spec: Iec61937CarrierSpec): Boolean {
        val mask = channelMaskFor(spec.channelCount) ?: return false
        val key = spec.sampleRate.toLong() shl 32 or mask.toLong()
        cache[key]?.let { return it }
        val supported = Iec61937CarrierProbe.supports(spec.sampleRate, mask)
        cache[key] = supported
        return supported
    }

    fun invalidate() {
        cache.clear()
    }

    companion object {
        fun channelMaskFor(channelCount: Int): Int? = when (channelCount) {
            2 -> AudioFormat.CHANNEL_OUT_STEREO
            8 -> AudioFormat.CHANNEL_OUT_7POINT1_SURROUND
            else -> null
        }
    }
}
