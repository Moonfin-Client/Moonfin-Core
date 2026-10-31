package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Test

class AudioOutputRebuildPolicyTest {
    private val none = AudioOutputRebuildPolicy.Outcome.NONE
    private val rebuild = AudioOutputRebuildPolicy.Outcome.REBUILD_BY_SEEK
    private val notRebuildable = AudioOutputRebuildPolicy.Outcome.NOT_REBUILDABLE

    private fun decide(
        sawRouteDrop: Boolean = true,
        audioTrackOpened: Boolean = true,
        sourceCurrent: Boolean = true,
        playerUsable: Boolean = true,
        audioBlocked: Boolean = false,
        playerPaused: Boolean = true,
        seekable: Boolean = true,
        audioRekickActive: Boolean = false,
    ) = AudioOutputRebuildPolicy.decide(
        sawRouteDrop, audioTrackOpened, sourceCurrent, playerUsable,
        audioBlocked, playerPaused, seekable, audioRekickActive,
    )

    @Test
    fun rebuildsBySeekWhenRouteDroppedUnderAnOpenSeekableTrack() {
        assertEquals(rebuild, decide())
    }

    @Test
    fun reportsInsteadOfSeekingWhenTheSourceCannotSeek() {
        assertEquals(notRebuildable, decide(seekable = false))
    }

    @Test
    fun keepsTheTrackWhenTheRouteNeverDropped() {
        assertEquals(none, decide(sawRouteDrop = false))
        assertEquals(none, decide(sawRouteDrop = false, seekable = false))
    }

    @Test
    fun skipsWhenNoAudioTrackHasOpenedYet() {
        assertEquals(none, decide(audioTrackOpened = false))
        assertEquals(none, decide(audioTrackOpened = false, seekable = false))
    }

    @Test
    fun skipsWhileAnAudioGateIsStillClosed() {
        assertEquals(none, decide(audioBlocked = true))
    }

    @Test
    fun skipsWhenTheSourceChangedOrThePlayerIsGone() {
        assertEquals(none, decide(sourceCurrent = false))
        assertEquals(none, decide(playerUsable = false))
    }

    @Test
    fun skipsWhenThePlayerIsAlreadyPlaying() {
        assertEquals(none, decide(playerPaused = false))
    }

    @Test
    fun leavesTheTrackToARunningAudioRekick() {
        assertEquals(none, decide(audioRekickActive = true))
    }
}
