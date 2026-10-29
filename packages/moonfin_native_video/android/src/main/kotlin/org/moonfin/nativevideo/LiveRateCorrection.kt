package org.moonfin.nativevideo

import kotlin.math.abs

/**
 * Decides when a live source may change the display rate after it started.
 *
 * Live TV can start on a stale or missing rate, and a channel's rate can
 * change when the programme does. A measured rate the current mode doesn't
 * fit is acted on in two ways:
 * - once early in the source, as soon as a reading arrives, to fix a wrong
 *   starting rate;
 * - after that, only once the new rate has held for [stableMs], and never
 *   within [cooldownMs] of the source's last display switch, so a bumper or a
 *   flapping channel can't keep the television renegotiating.
 *
 * The cadence observer reports only changes, so "held" means no different
 * reading arrived while [stableMs] passed on the clock and at least that much
 * more media was loaded. A segment that loads in a burst therefore can't pass
 * for five seconds of programme.
 *
 * Library files never use this: their rate is decided once at the start.
 * Contains no Android code; the player supplies the clocks and whether the
 * current display mode fits each reading.
 */
internal class LiveRateCorrection(
    private val earlyWindowMs: Long = EARLY_WINDOW_MS,
    private val stableMs: Long = STABLE_MS,
    private val cooldownMs: Long = COOLDOWN_MS,
) {
    private var active = false
    private var startedAtMs = 0L
    private var lastSwitchAtMs: Long? = null
    private var earlyUsed = false
    private var candidateFps: Float? = null
    private var candidateSinceMs = 0L
    private var candidateLoadedMs = 0L

    /** Starts watching a new live source. */
    fun begin(nowMs: Long) {
        active = true
        startedAtMs = nowMs
        lastSwitchAtMs = null
        earlyUsed = false
        clearCandidate()
    }

    /** Stops watching, for a stop, a new source or a file. */
    fun cancel() {
        active = false
        lastSwitchAtMs = null
        earlyUsed = false
        clearCandidate()
    }

    /** Records a display switch for this source, including the one at the start. */
    fun noteSwitch(nowMs: Long) {
        if (active) lastSwitchAtMs = nowMs
    }

    /**
     * Takes a credible measured rate. [loadedMs] is how far media has loaded
     * now; [fits] is whether the display mode in use already suits the rate,
     * in which case nothing is pending any more.
     */
    fun onReading(nowMs: Long, loadedMs: Long, fps: Float, fits: Boolean) {
        if (!active) return
        if (fits || !fps.isFinite() || fps <= 0f) {
            clearCandidate()
            return
        }
        val current = candidateFps
        if (current == null || abs(fps - current) / current > SAME_RATE_TOLERANCE) {
            candidateFps = fps
            candidateSinceMs = nowMs
            candidateLoadedMs = loadedMs
        }
    }

    /** A reading with no usable rate, such as a window spanning a splice. */
    fun onUnusableReading() {
        clearCandidate()
    }

    /**
     * The earliest clock time the pending candidate could apply, or null when
     * nothing is pending. Loaded media may still hold it back past this.
     */
    fun nextCheckAtMs(): Long? {
        if (!active || candidateFps == null) return null
        if (isEarly(candidateSinceMs)) return candidateSinceMs
        val stableAt = candidateSinceMs + stableMs
        val cooledAt = lastSwitchAtMs?.let { it + cooldownMs } ?: stableAt
        return maxOf(stableAt, cooledAt)
    }

    /**
     * The rate to switch to now, or null. Taking it counts as a switch, so the
     * cooldown starts and the early allowance is spent.
     */
    fun takeDue(nowMs: Long, loadedMs: Long): Float? {
        val checkAt = nextCheckAtMs() ?: return null
        if (nowMs < checkAt) return null
        val fps = candidateFps ?: return null
        if (!isEarly(candidateSinceMs)) {
            // Loading moved backwards (a seek), so the hold starts again.
            if (loadedMs < candidateLoadedMs) {
                candidateLoadedMs = loadedMs
                return null
            }
            if (loadedMs - candidateLoadedMs < stableMs) return null
        }
        earlyUsed = true
        lastSwitchAtMs = nowMs
        clearCandidate()
        return fps
    }

    /**
     * Whether a change in the stream's own rate is now a programme change
     * rather than the start settling, which the early correction handles.
     */
    fun pastEarlyWindow(nowMs: Long): Boolean =
        active && (earlyUsed || nowMs - startedAtMs > earlyWindowMs)

    /** Whether the next correction would be the early one. */
    fun isEarlyPending(): Boolean = active && candidateFps != null && isEarly(candidateSinceMs)

    private fun isEarly(readingAtMs: Long): Boolean =
        !earlyUsed && readingAtMs - startedAtMs <= earlyWindowMs

    private fun clearCandidate() {
        candidateFps = null
        candidateSinceMs = 0L
        candidateLoadedMs = 0L
    }

    companion object {
        const val EARLY_WINDOW_MS = 15_000L
        const val STABLE_MS = 5_000L
        const val COOLDOWN_MS = 120_000L
        private const val SAME_RATE_TOLERANCE = 0.01f
    }
}
