package org.moonfin.nativevideo

import kotlin.math.abs

/** Owns the evidence currently reported for the rate already applied to this source. */
internal class AppliedRateEvidence {
    private var current: RateEvidence? = null
    val choice: RateChoice?
        get() = current?.choice

    fun set(evidence: RateEvidence) {
        current = evidence
    }

    fun clear() {
        current = null
    }

    /** Updates metadata only when trusted evidence still selects the applied output rate. */
    fun updateSameOutput(next: RateEvidence, eligible: Boolean): RateEvidence? {
        if (!eligible) return null
        val previous = current ?: return null
        val previousRate = previous.choice.fps ?: return null
        val nextRate = next.choice.fps ?: return null
        if (!previousRate.isFinite() || previousRate <= 0f ||
            !nextRate.isFinite() || nextRate <= 0f
        ) return null
        val previousOutput = DisplayModeChooser.normalizeFrameRate(previousRate)
        val nextOutput = DisplayModeChooser.normalizeFrameRate(nextRate)
        if (abs(previousOutput - nextOutput) > OUTPUT_RATE_EPSILON) return null
        val sameProvenance = previous.choice.source == next.choice.source &&
            previous.choice.fieldRateApplied == next.choice.fieldRateApplied &&
            previous.scanType == next.scanType
        current = next
        if (sameProvenance) return null
        return next
    }

    fun metadataDecisionEvent(evidence: RateEvidence, elapsedMs: Long): Map<String, Any?> =
        mapOf(
            "event" to "frameRateDecision",
            "reason" to "evidence updated",
            "elapsedMs" to elapsedMs,
        ) + evidence.eventFields()

    companion object {
        private const val OUTPUT_RATE_EPSILON = 0.001f
    }
}
