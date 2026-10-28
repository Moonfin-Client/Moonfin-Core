package org.moonfin.nativevideo

/**
 * Decides when the display mode the main player asked for should change hands.
 *
 * A television renegotiates HDMI whenever the window's preferred mode lands
 * on a mode it isn't already in, and that renegotiation drops the surface and
 * the audio route under whatever is playing. Handing the display back between
 * two videos makes it do that twice for nothing when both want the same mode,
 * and arming recovery for a request that changes nothing turns every unrelated
 * error in the next few seconds into a blind re-prepare of the same source.
 *
 * The caller owns the window, so this stays a plain object a JVM test can drive.
 */
object DisplayModeSwitchPolicy {
    /**
     * A video after a video starts from the mode the last one set, so the
     * switch only happens when the new rate actually needs a different mode.
     * Audio, a preview, or switching turned off gives the display back, and so
     * does a video whose rate isn't known yet, since nothing may ever arrive
     * to replace a mode it has no claim to.
     */
    fun keepModeForNextSource(
        isMainPlayer: Boolean,
        switchingEnabled: Boolean,
        nextIsAudio: Boolean,
        nextFrameRateKnown: Boolean,
    ): Boolean = isMainPlayer && switchingEnabled && !nextIsAudio && nextFrameRateKnown

    /**
     * When no display mode fits a rate, the mode in use stays. If the viewer's
     * own mode fitted, the chooser would have picked it, so handing the
     * display back gains nothing for motion and costs an HDMI renegotiation,
     * one that lands as the next audio track opens; some devices can't
     * re-create a passthrough track after that. A mode this video already chose
     * always stays, so a later reading with no mode (an MP4's sample-count
     * average for a variable-cadence film, for one) changes nothing.
     *
     * The one exception is resolution. With scale on tv, a mode carried over
     * from the previous video can be at that video's resolution, and keeping
     * it would show this one at the wrong size, so it goes back to the
     * viewer's mode.
     */
    fun restoreOnNoMatch(
        holdingMode: Boolean,
        heldForCurrentSource: Boolean,
        resolutionScaling: Boolean,
        heldResolutionMatchesBase: Boolean,
    ): Boolean = holdingMode && !heldForCurrentSource && resolutionScaling && !heldResolutionMatchesBase

    /**
     * Only a request for a mode the display isn't in renegotiates the link,
     * so only that one is worth arming the switch recovery for.
     */
    fun requestChangesPhysicalMode(currentModeId: Int, targetModeId: Int): Boolean =
        currentModeId != targetModeId

    /**
     * The display reports its new mode the moment the window asks, well before
     * the television has finished renegotiating, so a request alone can look
     * like nothing changed. A mode id that moves is the renegotiation itself,
     * whoever asked for it: a restore on stop, this player, or the television.
     * The first reading is only a baseline.
     */
    fun observedModeChange(previousModeId: Int?, currentModeId: Int): Boolean =
        previousModeId != null && previousModeId != currentModeId

    /**
     * How long after this player hands the display back the renegotiation
     * that follows still counts as its own. The display reports the new mode
     * within a frame or two of the request, so this only has to outlast that.
     */
    const val OWN_RESTORE_WINDOW_MS = 3_000L

    /**
     * Whether an observed mode change belongs to this player's switching and so
     * gets its recovery. That is only true with switching on and either a mode
     * held (a stop's pending restore included) or a restore of our own just
     * made. A change anything else made, the television or a system setting,
     * is left to the normal error handling rather than blind re-prepares.
     */
    fun ownsObservedModeChange(
        switchingEnabled: Boolean,
        holdingMode: Boolean,
        msSinceOwnRestore: Long?,
    ): Boolean = switchingEnabled && (
        holdingMode || (msSinceOwnRestore != null && msSinceOwnRestore < OWN_RESTORE_WINDOW_MS)
        )

    /**
     * The mode the next choice measures resolution from. While a mode is held
     * from the last video that is the display the viewer had before any
     * switch, so scale on tv can't keep a resolution chosen for something else
     * (a 4K film after a 1080p one would otherwise go out at 1080p). With
     * nothing held the display itself is the viewer's mode.
     */
    internal fun chooserReference(
        baseMode: DisplayModeOption?,
        displayMode: DisplayModeOption,
        holdingMode: Boolean,
    ): DisplayModeOption = if (holdingMode && baseMode != null) baseMode else displayMode
}
