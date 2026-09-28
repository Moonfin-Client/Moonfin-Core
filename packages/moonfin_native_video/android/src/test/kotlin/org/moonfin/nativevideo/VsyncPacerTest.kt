package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class VsyncPacerTest {

    private val vsyncNs = 20_000_000L // 50Hz

    /** Spacings (ms) of a real 50fps file with bunched timestamps: one 20-frame, 400ms cycle. */
    private val bunchedSpacingsMs = listOf(
        38, 6, 19, 18, 38, 6, 13, 25, 37, 6, 13, 19,
        43, 7, 12, 19, 44, 6, 12, 19,
    )

    /** Release times as Media3 snaps the timestamps to the vsync grid. */
    private fun snappedBunchedReleases(cycles: Int): List<Long> {
        var timeMs = 0L
        val out = ArrayList<Long>()
        repeat(cycles) {
            for (spacing in bunchedSpacingsMs) {
                timeMs += spacing
                out += Math.round(timeMs * 1_000_000.0 / vsyncNs) * vsyncNs
            }
        }
        return out
    }

    private fun snappedCadence(frames: Int, fps: Double, vsync: Long = vsyncNs): List<Long> =
        List(frames) { Math.round(it * 1_000_000_000.0 / fps / vsync) * vsync }

    private fun paceAll(releases: List<Long>, vsync: Long = vsyncNs): List<Long> {
        val pacer = VsyncPacer()
        return releases.map { pacer.pace(it, vsync) }
    }

    @Test
    fun bunchedTimestampsShareVsyncsWithoutPacing() {
        val releases = snappedBunchedReleases(cycles = 10)
        // Without pacing a quarter of the frames share a vsync.
        assertEquals(150, releases.toSet().size)
        assertEquals(200, releases.size)
    }

    @Test
    fun bunchedTimestampsGetOneVsyncEachWhenPaced() {
        val releases = snappedBunchedReleases(cycles = 10)
        val paced = paceAll(releases)

        assertEquals(releases.size, paced.toSet().size)
        paced.zipWithNext().forEach { (a, b) -> assertTrue(b - a >= vsyncNs) }
    }

    @Test
    fun pacingNeverPushesAFrameBackFurtherThanTheBound() {
        val releases = snappedBunchedReleases(cycles = 50)
        val paced = paceAll(releases)

        releases.zip(paced).forEach { (wanted, actual) ->
            assertTrue(actual >= wanted)
            assertTrue(actual - wanted <= vsyncNs)
        }
    }

    @Test
    fun regularCadenceIsUntouched() {
        val releases = List(100) { it * vsyncNs }
        assertEquals(releases, paceAll(releases))
    }

    @Test
    fun aSourceSlowerThanTheDisplayIsUntouched() {
        // 25fps on 50Hz: frames are already two vsyncs apart.
        val releases = List(100) { it * 2 * vsyncNs }
        assertEquals(releases, paceAll(releases))
    }

    @Test
    fun aSourceFasterThanTheDisplayStaysBounded() {
        // 60fps can't fit on 50Hz, so the delay must stay bounded.
        val releases = snappedCadence(frames = 600, fps = 60.0)
        val paced = paceAll(releases)

        releases.zip(paced).forEach { (wanted, actual) ->
            assertTrue(actual - wanted <= vsyncNs)
        }
    }

    @Test
    fun aSourceSlightlyFasterThanTheDisplayDoesNotStayLate() {
        // 60fps on 59.94Hz has one frame too many about every 1000.
        val vsync = 16_683_333L
        val releases = snappedCadence(frames = 36_000, fps = 60.0, vsync = vsync)
        val paced = paceAll(releases, vsync)

        val held = releases.zip(paced).count { (wanted, actual) -> actual != wanted }
        assertTrue(held < releases.size / 100)
    }

    @Test
    fun aGapAfterPauseOrSeekIsUntouched() {
        val pacer = VsyncPacer()
        pacer.pace(0L, vsyncNs)
        val afterPause = 5_000_000_000L
        assertEquals(afterPause, pacer.pace(afterPause, vsyncNs))
    }

    @Test
    fun unknownVsyncLeavesTimesAlone() {
        val releases = snappedBunchedReleases(cycles = 2)
        assertEquals(releases, paceAll(releases, vsync = 0L))
    }

    @Test
    fun aFrameIsHeldOneVsyncAtMost() {
        val pacer = VsyncPacer()
        pacer.pace(0L, vsyncNs)
        assertEquals(vsyncNs, pacer.pace(0L, vsyncNs))
        // Two vsyncs behind the previous release is too far to hold.
        assertEquals(0L, pacer.pace(0L, vsyncNs))
    }

    @Test
    fun aLongRunOfHeldFramesLetsTheNextOneGo() {
        val pacer = VsyncPacer()
        pacer.pace(0L, vsyncNs)
        // Each frame wants the vsync the one before it was held to.
        repeat(VsyncPacer.MAX_HELD_IN_A_ROW) { i ->
            assertEquals((i + 1) * vsyncNs, pacer.pace(i * vsyncNs, vsyncNs))
        }
        val wanted = VsyncPacer.MAX_HELD_IN_A_ROW * vsyncNs
        assertEquals(wanted, pacer.pace(wanted, vsyncNs))
    }

    @Test
    fun aFrameAHairEarlyForTheNextVsyncIsNotHeld() {
        val pacer = VsyncPacer()
        pacer.pace(0L, vsyncNs)
        val slightlyEarly = vsyncNs - 50_000L
        assertEquals(slightlyEarly, pacer.pace(slightlyEarly, vsyncNs))
    }

    @Test
    fun aCollisionAHairOffTheGridIsStillHeld() {
        val pacer = VsyncPacer()
        pacer.pace(0L, vsyncNs)
        assertEquals(vsyncNs, pacer.pace(50_000L, vsyncNs))
    }
}
