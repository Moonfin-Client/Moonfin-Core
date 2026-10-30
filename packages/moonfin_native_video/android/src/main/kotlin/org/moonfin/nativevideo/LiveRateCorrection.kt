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
    private var candidate: RateEvidence? = null
    private var candidateSinceMs = 0L
    private var candidateProgress: CorrectionProgress.Sample? = null
    private var lastProgress: CorrectionProgress.Sample? = null

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
     * Takes a credible measured rate. [progress] is a source-scoped loaded
     * media coordinate; [fits] is whether the display mode in use already
     * suits the rate, in which case nothing is pending any more.
     */
    fun onReading(nowMs: Long, progress: CorrectionProgress.Sample?, evidence: RateEvidence, fits: Boolean) {
        if (!active) return
        val fps = evidence.choice.fps ?: run {
            clearCandidate()
            return
        }
        if (fits || !fps.isFinite() || fps <= 0f) {
            clearCandidate()
            return
        }
        val currentEvidence = candidate
        val current = currentEvidence?.choice?.fps
        val sameRate = current != null && abs(fps - current) / current <= SAME_RATE_TOLERANCE
        val sameProvenance = currentEvidence != null &&
            currentEvidence.choice.source == evidence.choice.source &&
            currentEvidence.choice.fieldRateApplied == evidence.choice.fieldRateApplied &&
            currentEvidence.scanType == evidence.scanType
        if (!sameRate || !sameProvenance) {
            candidate = evidence
            candidateSinceMs = nowMs
            candidateProgress = progress
            lastProgress = progress
        } else if (!isEarly(candidateSinceMs)) {
            observeProgress(nowMs, progress)
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
        if (!active || candidate == null) return null
        if (isEarly(candidateSinceMs)) return candidateSinceMs
        val stableAt = candidateSinceMs + stableMs
        val cooledAt = lastSwitchAtMs?.let { it + cooldownMs } ?: stableAt
        return maxOf(stableAt, cooledAt)
    }

    /**
     * The rate to switch to now, or null. Taking it counts as a switch, so the
     * cooldown starts and the early allowance is spent.
     */
    fun takeDue(nowMs: Long, progress: CorrectionProgress.Sample?): RateEvidence? {
        if (active && candidate != null && !isEarly(candidateSinceMs)) {
            observeProgress(nowMs, progress)
        }
        val checkAt = nextCheckAtMs() ?: return null
        if (nowMs < checkAt) return null
        val evidence = candidate ?: return null
        if (!isEarly(candidateSinceMs)) {
            val baseline = candidateProgress ?: return null
            val current = progress ?: return null
            if (baseline.epoch != current.epoch || current.positionMs < baseline.positionMs) return null
            if (current.positionMs - baseline.positionMs < stableMs) return null
        }
        earlyUsed = true
        lastSwitchAtMs = nowMs
        clearCandidate()
        return evidence
    }

    /**
     * Whether a change in the stream's own rate is now a programme change
     * rather than the start settling, which the early correction handles.
     */
    fun pastEarlyWindow(nowMs: Long): Boolean =
        active && (earlyUsed || nowMs - startedAtMs > earlyWindowMs)

    /** Whether the next correction would be the early one. */
    fun isEarlyPending(): Boolean = active && candidate != null && isEarly(candidateSinceMs)

    private fun isEarly(readingAtMs: Long): Boolean =
        !earlyUsed && readingAtMs - startedAtMs <= earlyWindowMs

    private fun clearCandidate() {
        candidate = null
        candidateSinceMs = 0L
        candidateProgress = null
        lastProgress = null
    }

    /** Invalidates incomparable coordinates before the due timer can observe them. */
    private fun observeProgress(nowMs: Long, progress: CorrectionProgress.Sample?) {
        val baseline = candidateProgress
        val previous = lastProgress
        if (progress == null) {
            candidateSinceMs = nowMs
            candidateProgress = null
            lastProgress = null
            return
        }
        if (baseline == null || baseline.epoch != progress.epoch ||
            progress.positionMs < baseline.positionMs ||
            (previous != null && previous.epoch == progress.epoch && progress.positionMs < previous.positionMs)
        ) {
            candidateSinceMs = nowMs
            candidateProgress = progress
        }
        lastProgress = progress
    }

    companion object {
        const val EARLY_WINDOW_MS = 15_000L
        const val STABLE_MS = 5_000L
        const val COOLDOWN_MS = 120_000L
        private const val SAME_RATE_TOLERANCE = 0.01f
    }
}
