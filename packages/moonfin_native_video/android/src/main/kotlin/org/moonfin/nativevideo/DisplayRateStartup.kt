package org.moonfin.nativevideo

/**
 * Tracks the startup-only audio gate for a measured display-rate decision.
 *
 * The player owns this state; it contains no Android or Media3 dependencies so
 * stale evidence, replacement sources, and play/pause intent can be tested
 * independently of renderer lifecycle.
 */
internal class DisplayRateStartup {
    internal enum class Phase {
        IDLE,
        WAITING,
        SETTLING,
        RELEASED,
    }

    var phase: Phase = Phase.IDLE
        private set

    val audioBlocked: Boolean
        get() = phase == Phase.WAITING || phase == Phase.SETTLING

    val awaitingEvidence: Boolean
        get() = phase == Phase.WAITING

    var playWhenReady: Boolean = false
        private set

    var sourceToken: Int? = null
        private set

    fun begin(sourceToken: Int, playWhenReady: Boolean) {
        this.sourceToken = sourceToken
        this.playWhenReady = playWhenReady
        phase = Phase.WAITING
    }

    fun decide(sourceToken: Int): Boolean {
        if (this.sourceToken != sourceToken || phase != Phase.WAITING) return false
        phase = Phase.SETTLING
        return true
    }

    fun release(sourceToken: Int): Boolean {
        if (this.sourceToken != sourceToken || phase != Phase.SETTLING) return false
        phase = Phase.RELEASED
        return true
    }

    fun requestPlayWhenReady(value: Boolean) {
        if (audioBlocked) {
            playWhenReady = value
        }
    }

    fun cancel() {
        phase = Phase.IDLE
        sourceToken = null
        playWhenReady = false
    }
}