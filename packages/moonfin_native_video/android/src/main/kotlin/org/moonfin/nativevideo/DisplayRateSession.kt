package org.moonfin.nativevideo

/** Source-scoped ownership for startup, correction intent, applied evidence, and one settling hold. */
internal class DisplayRateSession {
    enum class HoldKind { STARTUP, CORRECTION }

    class Hold internal constructor(
        val sourceToken: Int,
        val id: Long,
        val kind: HoldKind,
        val settle: DisplayModeSettle,
        val completion: () -> Unit,
    )

    val startup = DisplayRateStartup()
    val correctionIntent = RateCorrectionIntent()
    val appliedRateEvidence = AppliedRateEvidence()
    val appliedRateChoice: RateChoice?
        get() = appliedRateEvidence.choice

    var sourceToken: Int? = null
        private set
    var desiredPlayWhenReady: Boolean = false
        private set
    var hold: Hold? = null
        private set
    private var nextHoldId = 0L

    val correctionHolding: Boolean
        get() = correctionIntent.isActiveFor(sourceToken)

    fun beginSource(sourceToken: Int, playWhenReady: Boolean) {
        cancelHold()
        startup.cancel()
        correctionIntent.cancel()
        appliedRateEvidence.clear()
        this.sourceToken = sourceToken
        desiredPlayWhenReady = playWhenReady
    }

    fun beginStartup(sourceToken: Int, playWhenReady: Boolean): Boolean {
        if (!isCurrent(sourceToken)) return false
        desiredPlayWhenReady = playWhenReady
        startup.begin(sourceToken, playWhenReady)
        return true
    }

    fun decideStartup(sourceToken: Int): Boolean =
        isCurrent(sourceToken) && startup.decide(sourceToken)

    fun releaseStartup(sourceToken: Int, tracksMapped: Boolean): Boolean =
        tracksMapped && isCurrent(sourceToken) && startup.release(sourceToken)

    fun requestPlayback(playWhenReady: Boolean): Boolean {
        desiredPlayWhenReady = playWhenReady
        startup.requestPlayWhenReady(playWhenReady)
        if (!playWhenReady) correctionIntent.clearSystemPause()
        val token = sourceToken ?: return false
        return correctionIntent.viewerRequest(token, playWhenReady)
    }

    /** Display-mode recovery is allowed only while the latest viewer intent is play. */
    fun shouldResumeAfterDisplayModeSwitch(
        wasPlayingBeforeSwitch: Boolean,
        playerPlayWhenReady: Boolean,
    ): Boolean = wasPlayingBeforeSwitch && desiredPlayWhenReady && !playerPlayWhenReady

    fun shouldPlayAfterPrepare(requestedPlayWhenReady: Boolean): Boolean =
        requestedPlayWhenReady && desiredPlayWhenReady && !startup.audioBlocked && !correctionHolding

    fun canResumeAudioRekick(
        sourceToken: Int,
        preparedPlayer: Any,
        currentPlayer: Any,
    ): Boolean = isCurrent(sourceToken) && desiredPlayWhenReady &&
        !startup.audioBlocked && !correctionHolding && preparedPlayer === currentPlayer

    fun markInternalPause(player: Any, expectedReason: Int) {
        val token = sourceToken ?: return
        if (isCurrent(token)) correctionIntent.markInternalPause(player, expectedReason)
    }

    /** Skips redundant false writes and records the exact callback before a real pause write. */
    fun pauseInternally(
        player: Any,
        actualPlayWhenReady: Boolean,
        expectedReason: Int,
        pausePlayer: () -> Unit,
    ): Boolean {
        if (!actualPlayWhenReady) return false
        markInternalPause(player, expectedReason)
        pausePlayer()
        return true
    }

    fun consumeInternalPause(player: Any, reason: Int): Boolean =
        correctionIntent.consumeInternalPause(player, reason)

    /** Routes automatic HDMI recovery through the latest viewer intent and current source. */
    fun handleAudioDeviceAdded(
        nowMs: Long,
        hasHdmiDevice: Boolean,
        resumeWindowMs: Long,
        resumePlayer: () -> Unit,
    ): RateCorrectionIntent.RouteResume {
        if (sourceToken == null || !desiredPlayWhenReady) {
            correctionIntent.clearSystemPause()
            return RateCorrectionIntent.RouteResume.NONE
        }
        return correctionIntent.handleAudioDeviceAdded(
            nowMs = nowMs,
            hasHdmiDevice = hasHdmiDevice,
            resumeWindowMs = resumeWindowMs,
            correctionHolding = correctionHolding || startup.audioBlocked,
            resumePlayer = resumePlayer,
        )
    }

    fun beginCorrection(sourceToken: Int): Boolean {
        if (!isCurrent(sourceToken)) return false
        correctionIntent.begin(sourceToken, desiredPlayWhenReady)
        return true
    }

    fun completeCorrection(sourceToken: Int): Boolean? {
        if (!isCurrent(sourceToken)) return null
        val intent = correctionIntent.complete(sourceToken) ?: return null
        desiredPlayWhenReady = intent
        return intent
    }

    fun cancelCorrection() {
        correctionIntent.cancel()
    }

    fun isCurrent(sourceToken: Int): Boolean = this.sourceToken == sourceToken

    fun installHold(
        sourceToken: Int,
        kind: HoldKind,
        quietMs: Long,
        maxWaitMs: Long,
        nowMs: Long,
        startDelayMs: Long,
        expectHdmiAudioDrop: Boolean,
        hdmiAudioDropWindowMs: Long,
        completion: () -> Unit,
    ): Hold? {
        if (!isCurrent(sourceToken)) return null
        val prior = hold?.takeIf { it.sourceToken == sourceToken }
        val hdmiAudioAway = prior?.settle?.isHdmiAudioAway == true
        val settle = DisplayModeSettle(
            quietMs = quietMs + startDelayMs,
            maxWaitMs = maxWaitMs,
            startedAtMs = nowMs,
            audioReturnSettleMs = startDelayMs,
            expectHdmiAudioDrop = expectHdmiAudioDrop,
            hdmiAudioDropWindowMs = hdmiAudioDropWindowMs,
        )
        if (hdmiAudioAway) settle.noteHdmiAudio(present = false)
        return Hold(sourceToken, ++nextHoldId, kind, settle, completion).also { hold = it }
    }

    fun matchesHold(sourceToken: Int, holdId: Long): Boolean =
        isCurrent(sourceToken) && hold?.let { it.sourceToken == sourceToken && it.id == holdId } == true

    /** Detaches a matching hold exactly once; the adapter unregisters before invoking its callback. */
    fun takeHold(sourceToken: Int, holdId: Long): Hold? {
        if (!matchesHold(sourceToken, holdId)) return null
        return hold.also { hold = null }
    }

    /** Detaches, lets the adapter unregister callbacks, then runs completion exactly once. */
    fun completeHold(
        sourceToken: Int,
        holdId: Long,
        afterDetach: (Hold) -> Unit,
    ): Boolean {
        val completed = takeHold(sourceToken, holdId) ?: return false
        afterDetach(completed)
        // Adapter teardown can synchronously replace or stop the source.
        if (!isCurrent(sourceToken)) return false
        completed.completion()
        return true
    }

    fun cancelHold(): Hold? = hold.also { hold = null }

    fun cancelSource() {
        cancelHold()
        startup.cancel()
        correctionIntent.cancel()
        appliedRateEvidence.clear()
        sourceToken = null
        desiredPlayWhenReady = false
    }
}
