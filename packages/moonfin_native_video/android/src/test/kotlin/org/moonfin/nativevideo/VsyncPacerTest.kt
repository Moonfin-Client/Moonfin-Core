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
        val maxDelay = minOf(VsyncPacer.MAX_DELAY_VSYNCS * vsyncNs, VsyncPacer.MAX_DELAY_NS)

        releases.zip(paced).forEach { (wanted, actual) ->
            assertTrue(actual >= wanted)
            assertTrue(actual - wanted <= maxDelay)
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
        // 60fps can't fit on 50Hz; the delay must stay bounded.
        val frameNs = 1_000_000_000L / 60
        val releases = List(600) { it * frameNs }
        val paced = paceAll(releases)
        val maxDelay = minOf(VsyncPacer.MAX_DELAY_VSYNCS * vsyncNs, VsyncPacer.MAX_DELAY_NS)

        releases.zip(paced).forEach { (wanted, actual) ->
            assertTrue(actual - wanted <= maxDelay)
        }
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
    fun aLowRefreshRateCapsTheDelayAtTheAbsoluteBound() {
        // 24Hz: one vsync (~41.7ms) is within the 45ms cap, two are not.
        val vsync24 = 41_666_667L
        val pacer = VsyncPacer()
        pacer.pace(0L, vsync24)
        assertEquals(vsync24, pacer.pace(5_000_000L, vsync24))
        assertEquals(2 * vsync24, pacer.pace(vsync24, vsync24))
    }
}
