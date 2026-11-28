package org.moonfin.nativevideo

import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class FelFoldPolicyTest {

    @After
    fun forgetTheDevice() {
        FelFoldPolicy.deviceProblem = null
    }

    @Test
    fun theFirstGopAfterAStartOrASeekNeverGetsAFit() {
        val policy = FelFoldPolicy()
        assertFalse(policy.takeFitTurn())
        assertTrue(policy.takeFitTurn())
        assertTrue(policy.takeFitTurn())
        policy.seeked()
        assertFalse(policy.takeFitTurn())
        assertTrue(policy.takeFitTurn())
    }

    @Test
    fun passingFailuresStopItAfterThreeInARow() {
        val policy = FelFoldPolicy()
        policy.failed("a", FelLayerDecoder.Severity.TRANSIENT)
        policy.failed("b", FelLayerDecoder.Severity.TRANSIENT)
        policy.succeeded()
        policy.failed("c", FelLayerDecoder.Severity.TRANSIENT)
        policy.failed("d", FelLayerDecoder.Severity.TRANSIENT)
        assertNull(policy.stopReason)
        policy.failed("e", FelLayerDecoder.Severity.TRANSIENT)
        assertEquals("e", policy.stopReason)
        policy.takeFitTurn()
        assertFalse(policy.takeFitTurn())
    }

    @Test
    fun aPlaybackFailureStopsItAtOnceWithoutBlamingTheDevice() {
        val policy = FelFoldPolicy()
        policy.failed("the decoder couldn't be opened", FelLayerDecoder.Severity.PLAYBACK)
        assertEquals("the decoder couldn't be opened", policy.stopReason)
        assertNull(FelFoldPolicy.deviceProblem)
    }

    @Test
    fun aDeviceFailureStopsItAndIsRememberedForLaterPlaybacks() {
        val policy = FelFoldPolicy()
        policy.failed("the decoder gives no readable picture", FelLayerDecoder.Severity.DEVICE)
        assertEquals("the decoder gives no readable picture", policy.stopReason)
        assertEquals("the decoder gives no readable picture", FelFoldPolicy.deviceProblem)
    }

    @Test
    fun decodingWithinHalfThePlaybackTimeCarriesOn() {
        val policy = FelFoldPolicy()
        // Thirty one-second GOPs with a scene change in every fifth, each decoded in 0.9 s.
        repeat(30) { policy.gopReleased(1_000_000, if (it % 5 == 0) 900L else null) }
        assertNull(policy.stopReason)
        assertEquals(18, policy.sharePercent)
    }

    @Test
    fun decodingOverHalfThePlaybackTimeStopsOnceTwentySecondsHavePlayed() {
        val policy = FelFoldPolicy()
        repeat(19) { policy.gopReleased(1_000_000, 600L) }
        assertNull(policy.stopReason)
        policy.gopReleased(1_000_000, 600L)
        assertNotNull(policy.stopReason)
    }

    @Test
    fun aFoldSlowerThanItsGopKeepsTheFoldOffForTheDevice() {
        val policy = FelFoldPolicy()
        policy.gopReleased(1_000_000, 900L)
        policy.gopReleased(1_000_000, 1_000L)
        assertNull(policy.stopReason)
        policy.gopReleased(1_000_000, 1_200L)
        assertEquals("a fold took 1200 ms for a GOP that plays 1000 ms", policy.stopReason)
        assertEquals(policy.stopReason, FelFoldPolicy.deviceProblem)
    }

    @Test
    fun theFirstFoldMayUseTheWholeDecodeBudget() {
        val opening = FelFoldPolicy()
        opening.gopReleased(1_000_000, 4_500L)
        assertNull(opening.stopReason)
        val blocked = FelFoldPolicy()
        blocked.gopReleased(1_000_000, 36_713L)
        assertNotNull(blocked.stopReason)
        assertNotNull(FelFoldPolicy.deviceProblem)
    }

    @Test
    fun aShortGopStillAllowsASecond() {
        val policy = FelFoldPolicy()
        policy.gopReleased(1_000_000, 500L)
        policy.gopReleased(200_000, 900L)
        assertNull(policy.stopReason)
        policy.gopReleased(200_000, 1_100L)
        assertNotNull(policy.stopReason)
    }
}
