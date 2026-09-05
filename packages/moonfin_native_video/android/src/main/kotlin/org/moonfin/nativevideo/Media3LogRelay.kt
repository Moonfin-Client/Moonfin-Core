package org.moonfin.nativevideo

import android.os.SystemClock
import androidx.media3.common.util.Log
import androidx.media3.common.util.UnstableApi

/**
 * Puts media3's own warnings and errors in the diagnostic report.
 *
 * They only ever reached logcat, so a report could show playback sitting in
 * buffering with nothing to explain it while media3 was naming the reason on
 * the device the whole time. The load control saying it hit its byte budget
 * with under half a second of media buffered is one of those, and it is the
 * difference between a stream too rich for the buffer and a loader that died.
 */
@UnstableApi
object Media3LogRelay : Log.Logger {
    // A warning raised from the playback loop repeats many times a second, so
    // repeats inside the window are counted and reported on the next one out
    // rather than written one by one.
    private const val REPEAT_WINDOW_MS = 10_000L

    private const val SPURIOUS_TIMESTAMP_PREFIX =
        "Spurious audio timestamp (frame position mismatch): "

    private var installed = false
    private var lastKey: String? = null
    private var lastAtMs = 0L
    private var suppressed = 0

    /** Set by the live main view so a corrupt audio clock gets a recovery. */
    @Volatile
    var spuriousAudioPositionListener: ((Long) -> Unit)? = null

    /**
     * The playback head clock a spurious audio timestamp warning reported, in
     * microseconds. It is the fourth value in the message. The warning fires
     * for two opposite reasons and the value tells them apart: a HAL timestamp
     * the sink rightly rejected reads as time the track really played, while
     * a head misread as a 32 bit wrap reads hours longer than the player has
     * even existed.
     */
    private fun spuriousAudioPositionUs(message: String): Long? {
        if (!message.startsWith(SPURIOUS_TIMESTAMP_PREFIX)) return null
        return message
            .removePrefix(SPURIOUS_TIMESTAMP_PREFIX)
            .split(", ")
            .getOrNull(3)
            ?.trim()
            ?.toLongOrNull()
    }

    @Synchronized
    fun install() {
        if (installed) return
        installed = true
        Log.setLogger(this)
    }

    override fun d(tag: String, message: String, throwable: Throwable?) =
        Log.Logger.DEFAULT.d(tag, message, throwable)

    override fun i(tag: String, message: String, throwable: Throwable?) =
        Log.Logger.DEFAULT.i(tag, message, throwable)

    override fun w(tag: String, message: String, throwable: Throwable?) {
        Log.Logger.DEFAULT.w(tag, message, throwable)
        spuriousAudioPositionUs(message)?.let {
            spuriousAudioPositionListener?.invoke(it)
        }
        relay("warning", tag, message, throwable)
    }

    override fun e(tag: String, message: String, throwable: Throwable?) {
        Log.Logger.DEFAULT.e(tag, message, throwable)
        relay("error", tag, message, throwable)
    }

    @Synchronized
    private fun relay(
        level: String,
        tag: String,
        message: String,
        throwable: Throwable?,
    ) {
        val key = "$tag|$message"
        val nowMs = SystemClock.elapsedRealtime()
        if (key == lastKey) {
            if (nowMs - lastAtMs < REPEAT_WINDOW_MS) {
                suppressed++
                return
            }
        } else {
            suppressed = 0
        }
        val repeats = suppressed
        lastKey = key
        lastAtMs = nowMs
        suppressed = 0
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "media3Log",
                "level" to level,
                "tag" to tag,
                "message" to message,
                "repeats" to repeats,
                "error" to throwable?.toString(),
            ),
        )
    }
}
