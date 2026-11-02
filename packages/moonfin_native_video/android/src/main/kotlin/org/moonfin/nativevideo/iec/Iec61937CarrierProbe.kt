package org.moonfin.nativevideo.iec

import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioTrack
import android.os.Build

/**
 * Whether an IEC 61937 track of a carrier shape can play on the current
 * route. The player and the app's capability report both ask here so their
 * answers always match.
 */
object Iec61937CarrierProbe {

    // One MAT frame, the biggest burst the 8-channel carrier carries.
    private const val HBR_BURST_BYTES = 61440

    private val attributes by lazy {
        AudioAttributes.Builder()
            .setUsage(AudioAttributes.USAGE_MEDIA)
            .setContentType(AudioAttributes.CONTENT_TYPE_MOVIE)
            .build()
    }

    fun supports(sampleRate: Int, channelMask: Int): Boolean {
        if (Build.VERSION.SDK_INT < 24) return false
        val format = try {
            AudioFormat.Builder()
                .setEncoding(AudioFormat.ENCODING_IEC61937)
                .setSampleRate(sampleRate)
                .setChannelMask(channelMask)
                .build()
        } catch (_: Exception) {
            return false
        }
        return decide(
            highBitRate = channelMask == AudioFormat.CHANNEL_OUT_7POINT1_SURROUND,
            platformSays = { platformSupports(format) },
            opensTrack = { opensTrack(format) },
        )
    }

    /**
     * Some boxes, like the Fire TV Cube, say no to the 8-channel carrier but
     * play it fine, so a no for that one gets checked by opening a real track.
     */
    internal fun decide(
        highBitRate: Boolean,
        platformSays: () -> Boolean,
        opensTrack: () -> Boolean,
    ): Boolean = platformSays() || (highBitRate && opensTrack())

    private fun platformSupports(format: AudioFormat): Boolean {
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
        // Below API 29 there's no direct playback query, and getMinBufferSize
        // passes for any encoding the platform knows, so it only vouches for
        // the stereo carriers.
        if (format.channelMask != AudioFormat.CHANNEL_OUT_STEREO) return false
        return try {
            AudioTrack.getMinBufferSize(format.sampleRate, format.channelMask, format.encoding) > 0
        } catch (_: Exception) {
            false
        }
    }

    private fun opensTrack(format: AudioFormat): Boolean {
        val minBuffer = try {
            AudioTrack.getMinBufferSize(format.sampleRate, format.channelMask, format.encoding)
        } catch (_: Exception) {
            -1
        }
        val track = try {
            AudioTrack.Builder()
                .setAudioAttributes(attributes)
                .setAudioFormat(format)
                .setBufferSizeInBytes(maxOf(minBuffer, HBR_BURST_BYTES))
                .setTransferMode(AudioTrack.MODE_STREAM)
                .build()
        } catch (_: Exception) {
            return false
        }
        return try {
            track.state == AudioTrack.STATE_INITIALIZED
        } finally {
            track.release()
        }
    }
}
