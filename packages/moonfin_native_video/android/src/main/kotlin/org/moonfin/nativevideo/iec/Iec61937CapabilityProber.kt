package org.moonfin.nativevideo.iec

import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioTrack
import android.os.Build

/**
 * Probes whether the platform can open ENCODING_IEC61937 AudioTracks for the
 * carrier shapes, walking the direct-playback APIs from newest to oldest.
 * Results are cached per carrier and [invalidate] drops the cache on an audio
 * route change.
 */
internal class Iec61937CapabilityProber {

    private val cache = HashMap<Long, Boolean>()

    fun supportsCarrier(spec: Iec61937CarrierSpec): Boolean {
        if (Build.VERSION.SDK_INT < 24) return false
        val mask = channelMaskFor(spec.channelCount) ?: return false
        val key = spec.sampleRate.toLong() shl 32 or mask.toLong()
        cache[key]?.let { return it }
        val supported = probe(spec.sampleRate, mask)
        cache[key] = supported
        return supported
    }

    fun invalidate() {
        cache.clear()
    }

    private fun probe(sampleRate: Int, channelMask: Int): Boolean {
        val format = AudioFormat.Builder()
            .setEncoding(AudioFormat.ENCODING_IEC61937)
            .setSampleRate(sampleRate)
            .setChannelMask(channelMask)
            .build()
        val attributes = AudioAttributes.Builder()
            .setUsage(AudioAttributes.USAGE_MEDIA)
            .setContentType(AudioAttributes.CONTENT_TYPE_MOVIE)
            .build()

        if (Build.VERSION.SDK_INT >= 33) {
            return try {
                AudioManager.getDirectPlaybackSupport(format, attributes) !=
                    AudioManager.DIRECT_PLAYBACK_NOT_SUPPORTED
            } catch (_: Exception) {
                false
            }
        }
        if (Build.VERSION.SDK_INT >= 29) {
            return try {
                AudioTrack.isDirectPlaybackSupported(format, attributes)
            } catch (_: Exception) {
                false
            }
        }
        // API 24-28 has no direct-playback query. getMinBufferSize succeeds
        // wherever the encoding is known at all, and only the stereo carriers
        // are trusted so the 8-channel one never over-claims down there.
        if (channelMask != AudioFormat.CHANNEL_OUT_STEREO) return false
        return try {
            AudioTrack.getMinBufferSize(sampleRate, channelMask, AudioFormat.ENCODING_IEC61937) > 0
        } catch (_: Exception) {
            false
        }
    }

    companion object {
        fun channelMaskFor(channelCount: Int): Int? = when (channelCount) {
            2 -> AudioFormat.CHANNEL_OUT_STEREO
            8 -> AudioFormat.CHANNEL_OUT_7POINT1_SURROUND
            else -> null
        }
    }
}
