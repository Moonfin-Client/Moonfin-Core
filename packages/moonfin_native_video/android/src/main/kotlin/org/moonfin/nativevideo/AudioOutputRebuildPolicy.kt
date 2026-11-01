package org.moonfin.nativevideo

/**
 * Decides what a settled display-mode hold should do about the audio output.
 *
 * When the television drops the HDMI audio route during a mode switch, the
 * platform can silently recreate an AudioTrack that is already open, and the
 * player goes on using a track whose clock no longer matches its own. A seek in
 * place while still paused flushes the sink so the next write opens a fresh
 * track. A source that cannot seek (a progressive live stream) would restart
 * from the front, so it is only reported. A start that has not opened audio yet
 * has nothing to discard.
 *
 * The caller owns the player, so this stays a plain object a JVM test can drive.
 */
object AudioOutputRebuildPolicy {
    enum class Outcome { NONE, REBUILD_BY_SEEK, NOT_REBUILDABLE }

    fun decide(
        sawRouteDrop: Boolean,
        audioTrackOpened: Boolean,
        sourceCurrent: Boolean,
        playerUsable: Boolean,
        audioBlocked: Boolean,
        playerPaused: Boolean,
        seekable: Boolean,
        audioRekickActive: Boolean,
    ): Outcome {
        if (!sawRouteDrop || !audioTrackOpened || !sourceCurrent || !playerUsable ||
            audioBlocked || !playerPaused || audioRekickActive
        ) return Outcome.NONE
        return if (seekable) Outcome.REBUILD_BY_SEEK else Outcome.NOT_REBUILDABLE
    }
}
