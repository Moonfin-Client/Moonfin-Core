package org.moonfin.nativevideo

/**
 * Decides what an audio sink does while its HDMI route flaps.
 *
 * A link renegotiating at playback start reports the audio sink gone for a
 * few seconds and then back. Media3 answers that two ways and both end with
 * the passthrough track on a decoder: a write to the dead track throws an
 * error the player recovers from by reselecting against a sink that has lost
 * its capabilities, and a paused player hears the capabilities change and
 * reselects on its own.
 *
 * So a dead track is held rather than reported, and a capabilities loss on a
 * bitstream is deferred rather than forwarded, both for at most [maxHoldMs]
 * from whichever came first. The route coming back inside that window ends it
 * with nothing forwarded, since the renderer never learned anything changed.
 * Past it the error is rethrown or the loss forwarded, which is what the
 * player did before any of this existed.
 *
 * The caller owns the clock, so the logic stays a plain object a JVM test can
 * drive.
 */
class RouteFlapHold(
    val maxHoldMs: Long = 5_000L,
) {
    /** What the wrapper should do with a write while a dead track is held. */
    enum class Write { WRITE, HOLD, REBUILD, RETHROW }

    /** What the wrapper should do with a capabilities change. */
    enum class Notify { FORWARD, DEFER, SWALLOW }

    private var bitstream = false
    private var rebuildOnDeadTrack = false
    private var windowStartedMs: Long? = null
    private var deadTrackPending = false
    private var notifyDeferred = false

    // What the renderer was last told about the input's support. It believes
    // yes from the moment it configured the sink, and only a forwarded loss
    // changes that.
    private var rendererBelievesSupported = true

    /**
     * [bitstream] gates the capability deferral. [rebuildOnDeadTrack] gates
     * the dead track rebuild, which the caller widens past bitstream for the
     * inputs whose surfaced write error would be misread further up.
     */
    fun onConfigure(bitstream: Boolean, rebuildOnDeadTrack: Boolean = bitstream) {
        this.bitstream = bitstream
        this.rebuildOnDeadTrack = rebuildOnDeadTrack
        rendererBelievesSupported = true
        clear()
    }

    /** True when the dead track should be swallowed rather than reported. */
    fun onDeadTrack(nowMs: Long): Boolean {
        if (!rebuildOnDeadTrack) return false
        openWindow(nowMs)
        deadTrackPending = true
        return true
    }

    /**
     * The decision for the next write. [supportedNow] is the sink's live
     * answer for the input format, which the platform pins to no on a dead
     * track until the next device event.
     */
    fun writeDecision(supportedNow: Boolean, nowMs: Long): Write {
        if (!deadTrackPending) return Write.WRITE
        if (hasExpired(nowMs)) {
            clear()
            return Write.RETHROW
        }
        return if (supportedNow) Write.REBUILD else Write.HOLD
    }

    /** The delegate rebuilt its output and took the write. */
    fun onRebuilt() {
        deadTrackPending = false
        if (!notifyDeferred) clear()
    }

    /** What to do with a capabilities change the delegate just reported. */
    fun onCapabilitiesChanged(supportedNow: Boolean, nowMs: Long): Notify {
        if (!bitstream) return Notify.FORWARD
        if (supportedNow == rendererBelievesSupported) {
            // Nothing changed for the renderer, and forwarding it anyway
            // would make the player seek in place for a selection that did
            // not move. A return inside the window also ends the deferral.
            if (supportedNow && notifyDeferred) {
                notifyDeferred = false
                if (!deadTrackPending) clear()
            }
            return Notify.SWALLOW
        }
        if (!supportedNow) {
            // A second report of the same loss carries nothing new, and the
            // window it would join is already open.
            if (notifyDeferred) return Notify.SWALLOW
            openWindow(nowMs)
            notifyDeferred = true
            return Notify.DEFER
        }
        // The renderer was told the format went away and it is back, which
        // is the recovery onto passthrough that has to keep working.
        rendererBelievesSupported = true
        return Notify.FORWARD
    }

    /** The deferred notification came due. True when it must be forwarded. */
    fun onDeferredNotifyDue(): Boolean {
        if (!notifyDeferred) return false
        notifyDeferred = false
        rendererBelievesSupported = false
        if (!deadTrackPending) clear()
        return true
    }

    fun onReset() {
        bitstream = false
        rebuildOnDeadTrack = false
        rendererBelievesSupported = true
        clear()
    }

    private fun hasExpired(nowMs: Long): Boolean {
        val startedMs = windowStartedMs ?: return false
        return nowMs - startedMs >= maxHoldMs
    }

    private fun openWindow(nowMs: Long) {
        if (windowStartedMs == null) windowStartedMs = nowMs
    }

    private fun clear() {
        windowStartedMs = null
        deadTrackPending = false
        notifyDeferred = false
    }

    companion object {
        // AudioTrack.ERROR_DEAD_OBJECT and the native status some devices
        // hand back in its place, both literal so this stays JVM-only.
        private const val ERROR_DEAD_OBJECT = -6
        private const val ERROR_NATIVE_DEAD_OBJECT = -32

        fun isDeadObjectCode(errorCode: Int): Boolean =
            errorCode == ERROR_DEAD_OBJECT || errorCode == ERROR_NATIVE_DEAD_OBJECT
    }
}
