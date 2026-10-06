package org.moonfin.nativevideo.subtitle

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class SubtitleLayoutPlannerTest {
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
