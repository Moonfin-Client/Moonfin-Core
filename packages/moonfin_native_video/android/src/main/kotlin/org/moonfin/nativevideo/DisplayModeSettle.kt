package org.moonfin.nativevideo

/**
 * When a source start held for a display mode switch should run.
 *
 * The start waits until the display and the audio devices have been still for
 * [quietMs], so the HDMI renegotiation a switch sets off has landed before an
 * audio track opens. It never waits past [maxWaitMs] from [startedAtMs], since
 * a television that never settles must not keep playback from starting.
 *
 * Some televisions drop the HDMI audio route a second or two after the switch
 * and bring it back seconds later with its capabilities. A track opened in
 * between fails or is replaced by a reselect that restarts a live stream, so
 * once the route has gone the start waits for it to return and runs as soon
 * as it does, plus only [audioReturnSettleMs] (the viewer's own start delay).
 *
 * The caller owns the clock, so the logic stays a plain object a JVM test can
 * drive.
 */
class DisplayModeSettle(
    private val quietMs: Long,
    maxWaitMs: Long,
    val startedAtMs: Long,
    private val audioReturnSettleMs: Long = quietMs,
) {
    private val deadlineMs = startedAtMs + maxWaitMs
    private var hdmiAudioAway = false
    private var hdmiAudioReturned = false

    /** How long from [nowMs] until the start runs, counted from the latest change. */
    fun delayAfterChange(nowMs: Long): Long {
        val remaining = (deadlineMs - nowMs).coerceAtLeast(0L)
        if (hdmiAudioAway) return remaining
        return minOf(if (hdmiAudioReturned) audioReturnSettleMs else quietMs, remaining)
    }

    /** The HDMI audio route went away ([present] false) or came back. */
    fun noteHdmiAudio(present: Boolean) {
        if (!present) {
            hdmiAudioAway = true
            hdmiAudioReturned = false
        } else if (hdmiAudioAway) {
            hdmiAudioAway = false
            hdmiAudioReturned = true
        }
    }
}
