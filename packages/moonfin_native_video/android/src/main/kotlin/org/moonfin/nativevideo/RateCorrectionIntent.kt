package org.moonfin.nativevideo

/** Source-scoped viewer intent held while a live rate correction owns playback. */
internal class RateCorrectionIntent {
    enum class RouteResume { NONE, RESUME, DEFERRED_TO_CORRECTION }

    var sourceToken: Int? = null
        private set
    var playWhenReady: Boolean = false
        private set
    private var active = false
    private data class InternalPause(val player: Any, val expectedReason: Int)
    private val pendingInternalPauses = mutableListOf<InternalPause>()
    private var systemPausedAtMs: Long? = null
    private var systemPauseReason: Int = 0

    fun isActiveFor(sourceToken: Int?): Boolean =
        sourceToken != null && active && this.sourceToken == sourceToken

    fun begin(sourceToken: Int, playWhenReady: Boolean) {
        this.sourceToken = sourceToken
        this.playWhenReady = playWhenReady
        active = true
    }

    fun request(sourceToken: Int, playWhenReady: Boolean): Boolean {
        if (!active || this.sourceToken != sourceToken) return false
        this.playWhenReady = playWhenReady
        return true
    }

    /** Records even a system pause callback whose play-when-ready value stayed false. */
    fun recordSystemPause(nowMs: Long, reason: Int) {
        systemPausedAtMs = nowMs
        systemPauseReason = reason
    }

    /** Any explicit viewer request takes ownership away from an automatic route resume. */
    fun viewerRequest(sourceToken: Int, playWhenReady: Boolean): Boolean {
        systemPausedAtMs = null
        systemPauseReason = 0
        return request(sourceToken, playWhenReady)
    }

    fun clearSystemPause() {
        systemPausedAtMs = null
        systemPauseReason = 0
    }

    fun routePauseReason(): Int = systemPauseReason

    /** Consumes an eligible HDMI return; a correction hold retains the saved intent. */
    fun onAudioDeviceAdded(
        nowMs: Long,
        hasHdmiDevice: Boolean,
        resumeWindowMs: Long,
        correctionHolding: Boolean,
    ): RouteResume {
        val pausedAtMs = systemPausedAtMs ?: return RouteResume.NONE
        if (nowMs - pausedAtMs > resumeWindowMs) {
            clearSystemPause()
            return RouteResume.NONE
        }
        if (!hasHdmiDevice) return RouteResume.NONE
        clearSystemPause()
        return if (correctionHolding) RouteResume.DEFERRED_TO_CORRECTION else RouteResume.RESUME
    }

    /** Applies the route policy and invokes the player adapter only when resume is owned by it. */
    fun handleAudioDeviceAdded(
        nowMs: Long,
        hasHdmiDevice: Boolean,
        resumeWindowMs: Long,
        correctionHolding: Boolean,
        resumePlayer: () -> Unit,
    ): RouteResume {
        val action = onAudioDeviceAdded(nowMs, hasHdmiDevice, resumeWindowMs, correctionHolding)
        if (action == RouteResume.RESUME) resumePlayer()
        return action
    }

    fun complete(sourceToken: Int): Boolean? {
        if (!active || this.sourceToken != sourceToken) return null
        active = false
        return playWhenReady
    }

    fun markInternalPause(player: Any, expectedReason: Int) {
        pendingInternalPauses += InternalPause(player, expectedReason)
    }

    fun consumeInternalPause(player: Any, reason: Int): Boolean {
        val index = pendingInternalPauses.indexOfFirst { it.player === player && it.expectedReason == reason }
        if (index < 0) return false
        pendingInternalPauses.removeAt(index)
        return true
    }

    fun cancel() {
        active = false
        sourceToken = null
        playWhenReady = false
        pendingInternalPauses.clear()
        clearSystemPause()
    }
}
