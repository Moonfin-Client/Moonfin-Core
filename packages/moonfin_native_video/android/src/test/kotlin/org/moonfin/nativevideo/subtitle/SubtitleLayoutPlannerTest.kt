package org.moonfin.nativevideo.subtitle

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class SubtitleLayoutPlannerTest {
    @Test
    fun preferredSearchHalfFollowsCuePositionRatherThanItsLineAnchor() {
        val lowerStartAlignedCue = SubtitleBox(50f, 800f, 950f, 840f)
        val upperEndAlignedCue = SubtitleBox(50f, 70f, 950f, 150f)

        assertEquals(
            SubtitleLayoutPlanner.ALIGN_BOTTOM,
            SubtitleLayoutPlanner.verticalAlignmentFor(lowerStartAlignedCue, 1000),
        )
        assertEquals(
            SubtitleLayoutPlanner.ALIGN_TOP,
            SubtitleLayoutPlanner.verticalAlignmentFor(upperEndAlignedCue, 1000),
        )
    }

    @Test
    fun topAlignedSecondaryMovesBelowTopPrimaryInsideUpperHalf() {
        val primary = SubtitleBox(50f, 70f, 950f, 110f)
        val requested = SubtitleBox(50f, 80f, 950f, 120f)
        val placed = SubtitleLayoutPlanner.placePositionedSecondary(
            primary = listOf(primary),
            viewportWidth = 1000,
            viewportHeight = 1000,
            desired = requested,
            verticalAlignment = SubtitleLayoutPlanner.ALIGN_TOP,
            gapPx = 8f,
            stepPx = 8f,
        )

        assertEquals(120f, placed?.top)
        assertEquals(160f, placed?.bottom)
        assertTrue(placed!!.top >= requested.top)
        assertTrue(placed.bottom <= 500f)
        assertTrue(!SubtitleLayoutPlanner.intersects(placed, primary, 8f))
    }

    @Test
    fun bottomAlignedSecondaryMovesUpAboveBottomPrimaryInsideLowerHalf() {
        val primary = SubtitleBox(50f, 850f, 950f, 900f)
        val requested = SubtitleBox(50f, 880f, 950f, 920f)
        val placed = SubtitleLayoutPlanner.placePositionedSecondary(
            primary = listOf(primary),
            viewportWidth = 1000,
            viewportHeight = 1000,
            desired = requested,
            verticalAlignment = SubtitleLayoutPlanner.ALIGN_BOTTOM,
            gapPx = 8f,
            stepPx = 8f,
        )

        assertEquals(800f, placed?.top)
        assertEquals(840f, placed?.bottom)
        assertTrue(placed!!.top >= 500f)
        assertTrue(!SubtitleLayoutPlanner.intersects(placed, primary, 8f))
    }

    @Test
    fun middleAlignedSecondaryChoosesNearestFreePositionAndPrefersMovingDownOnTie() {
        val upper = SubtitleBox(50f, 470f, 950f, 500f)
        val lower = SubtitleBox(50f, 540f, 950f, 570f)
        val requested = SubtitleBox(50f, 500f, 950f, 540f)
        val placed = SubtitleLayoutPlanner.placePositionedSecondary(
            primary = listOf(upper, lower),
            viewportWidth = 1000,
            viewportHeight = 1000,
            desired = requested,
            verticalAlignment = SubtitleLayoutPlanner.ALIGN_MIDDLE,
            gapPx = 8f,
            stepPx = 8f,
        )

        assertEquals(580f, placed?.top)
        assertEquals(620f, placed?.bottom)
    }

    @Test
    fun returnsNullWhenTopAlignedCueCannotFitInUpperHalf() {
        val primary = listOf(SubtitleBox(0f, 0f, 1000f, 500f))

        assertNull(
            SubtitleLayoutPlanner.placePositionedSecondary(
                primary = primary,
                viewportWidth = 1000,
                viewportHeight = 1000,
                desired = SubtitleBox(50f, 80f, 950f, 120f),
                verticalAlignment = SubtitleLayoutPlanner.ALIGN_TOP,
                gapPx = 8f,
                stepPx = 8f,
            ),
        )
    }

    @Test
    fun shortSecondaryCueKeepsEightDpGapFromBottomPrimaryCue() {
        val primary = SubtitleBox(50f, 820f, 950f, 860f)
        val placed = SubtitleLayoutPlanner.placeSecondary(
            primary = listOf(primary),
            viewportWidth = 1000,
            viewportHeight = 1000,
            secondaryHeight = 24f,
            desiredBottom = 812f,
            gapPx = 8f,
            stepPx = 8f,
        )

        assertEquals(812f, placed?.bottom)
        assertEquals(788f, placed?.top)
        assertTrue(placed!!.bottom <= primary.top - 8f)
    }

    @Test
    fun multilineAndWrappedCueMovesUpAsOneBottomAnchoredBox() {
        val primary = listOf(
            SubtitleBox(40f, 790f, 960f, 850f),
            SubtitleBox(40f, 700f, 960f, 760f),
        )
        val placed = SubtitleLayoutPlanner.placeSecondary(
            primary = primary,
            viewportWidth = 1000,
            viewportHeight = 1000,
            secondaryHeight = 110f,
            desiredBottom = 782f,
            gapPx = 8f,
            stepPx = 8f,
        )

        assertEquals(686f, placed?.bottom)
        assertEquals(576f, placed?.top)
        assertTrue(primary.none { SubtitleLayoutPlanner.intersects(placed!!, it, 8f) })
    }

    @Test
    fun returnsNoPlacementWhenLowerHalfIsOccupied() {
        val primary = listOf(SubtitleBox(0f, 500f, 1000f, 1000f))

        assertNull(
            SubtitleLayoutPlanner.placeSecondary(
                primary = primary,
                viewportWidth = 1000,
                viewportHeight = 1000,
                secondaryHeight = 100f,
                desiredBottom = 900f,
                gapPx = 8f,
                stepPx = 8f,
            ),
        )
    }

    @Test
    fun avoidsPositionedPrimaryCueAndBitmapCueBoundsWithoutChangingThem() {
        val positionedPrimary = SubtitleBox(700f, 790f, 980f, 850f)
        val bitmapPrimary = SubtitleBox(80f, 700f, 360f, 780f)
        val originalPrimaryBounds = listOf(positionedPrimary, bitmapPrimary)
        val placed = SubtitleLayoutPlanner.placeSecondary(
            primary = listOf(positionedPrimary, bitmapPrimary),
            viewportWidth = 1000,
            viewportHeight = 1000,
            secondaryHeight = 60f,
            desiredBottom = 782f,
            gapPx = 8f,
            stepPx = 8f,
        )

        assertEquals(686f, placed?.bottom)
        assertEquals(originalPrimaryBounds, listOf(positionedPrimary, bitmapPrimary))
        assertTrue(listOf(positionedPrimary, bitmapPrimary).none {
            SubtitleLayoutPlanner.intersects(placed!!, it, 8f)
        })
    }

    @Test
    fun verticalOffsetMovesBothRowsWhilePreservingTheirGap() {
        val primary = SubtitleBox(50f, 800f, 950f, 850f)
        val normal = SubtitleLayoutPlanner.placeSecondary(
            primary = listOf(primary),
            viewportWidth = 1000,
            viewportHeight = 1000,
            secondaryHeight = 24f,
            desiredBottom = 792f,
            gapPx = 8f,
            stepPx = 8f,
        )!!
        val shiftedPrimary = SubtitleBox(50f, 760f, 950f, 810f)
        val shifted = SubtitleLayoutPlanner.placeSecondary(
            primary = listOf(shiftedPrimary),
            viewportWidth = 1000,
            viewportHeight = 1000,
            secondaryHeight = 24f,
            desiredBottom = 752f,
            gapPx = 8f,
            stepPx = 8f,
        )!!

        assertEquals(-40f, shifted.bottom - normal.bottom)
        assertEquals(8f, shiftedPrimary.top - shifted.bottom)
    }
}
