package org.moonfin.nativevideo

/**
 * Detects a bitstream AudioTrack that stopped producing sound and decides when
 * to rebuild it. Some TV audio HALs never resume a paused passthrough track,
 * and a replacement track opened while its predecessor is still tearing down
 * comes up just as dead, so recovery is a rebuild plus a short hold before the
 * new track opens.
 *
 * Everything here is armed by evidence and nothing engages on a healthy
 * device. A recovery needs a playback position that sat frozen for
 * [silenceThresholdMs] while the sink was playing bitstream audio and holding
 * unplayed data, which a working track can never show. The write hold guards
 * only flushes that happen after a detection, so seek latency everywhere else
 * is untouched. PCM output never engages any of it.
 *
 * The caller owns the clock, every entry point takes elapsed milliseconds, so
 * the logic stays a plain object a JVM test can drive.
 */
class PassthroughSilenceRecovery(
    private val silenceThresholdMs: Long = 700L,
    private val recoveryMinIntervalMs: Long = 3_000L,
    private val maxConsecutiveFailures: Int = 4,
    private val holdStepsMs: LongArray = longArrayOf(250L, 500L, 800L),
) {
    /** Sticks for the life of the sink once one dead track has been seen. */
    var isBroken = false
        private set

    private var isPassthrough = false
    private var playing = false
    private var holdUntilMs = 0L
    private var lastPositionUs = Long.MIN_VALUE
    private var lastMovementAtMs = 0L
    private var lastRecoveryAtMs = -recoveryMinIntervalMs
    private var consecutiveFailures = 0
    private var recoveryPending = false

    fun onConfigure(passthrough: Boolean, nowMs: Long) {
        isPassthrough = passthrough
        resetBaseline(nowMs)
    }

    /** True when the caller should rebuild right away instead of waiting for
     * the frozen position to prove what this device already proved once. */
    fun onPlay(nowMs: Long): Boolean {
        val wasPlaying = playing
        playing = true
        resetBaseline(nowMs)
        if (!isBroken || wasPlaying || !isPassthrough || !canRecover(nowMs)) {
            return false
        }
        beginRecovery(nowMs)
        return true
    }

    fun onPause() {
        playing = false
    }

    fun onFlush(nowMs: Long) {
        if (isBroken) {
            val step = holdStepsMs[
                consecutiveFailures.coerceIn(1, holdStepsMs.size) - 1,
            ]
            holdUntilMs = nowMs + step
        }
        recoveryPending = false
        resetBaseline(nowMs)
    }

    fun onReset(nowMs: Long) {
        isPassthrough = false
        recoveryPending = false
        consecutiveFailures = 0
        holdUntilMs = 0L
        resetBaseline(nowMs)
    }

    /** While true the sink should refuse writes, giving the HAL time to let
     * go of the old track before the next write opens its replacement. */
    fun shouldHoldWrites(nowMs: Long): Boolean = isBroken && nowMs < holdUntilMs

    /** True when the position has proven the track dead and a rebuild should
     * run. Feed it every position the renderer reads. */
    fun onPosition(positionUs: Long, hasPendingData: Boolean, nowMs: Long): Boolean {
        if (positionUs != lastPositionUs) {
            // The first sample after a baseline reset only seeds it. Movement
            // is proven between two real samples, so a rebuild that stays
            // frozen cannot launder its failure streak through the reset.
            val seeding = lastPositionUs == Long.MIN_VALUE
            lastPositionUs = positionUs
            lastMovementAtMs = nowMs
            if (!seeding) consecutiveFailures = 0
            return false
        }
        if (positionUs == Long.MIN_VALUE) return false
        if (!isPassthrough || !playing || !hasPendingData || recoveryPending) {
            return false
        }
        if (nowMs - lastMovementAtMs < silenceThresholdMs) return false
        if (!canRecover(nowMs)) return false
        beginRecovery(nowMs)
        return true
    }

    private fun canRecover(nowMs: Long): Boolean =
        !recoveryPending &&
            consecutiveFailures < maxConsecutiveFailures &&
            nowMs - lastRecoveryAtMs >= recoveryMinIntervalMs

    private fun beginRecovery(nowMs: Long) {
        isBroken = true
        recoveryPending = true
        consecutiveFailures += 1
        lastRecoveryAtMs = nowMs
    }

    private fun resetBaseline(nowMs: Long) {
        lastPositionUs = Long.MIN_VALUE
        lastMovementAtMs = nowMs
    }
}
