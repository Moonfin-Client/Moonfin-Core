package org.moonfin.nativevideo.subtitle

/** A measured subtitle box in pixels. */
internal data class SubtitleBox(
    val left: Float,
    val top: Float,
    val right: Float,
    val bottom: Float,
)

/**
 * Places secondary subtitles near the primary while keeping them inside the viewport
 * and avoiding overlap.
 */
internal object SubtitleLayoutPlanner {
    const val ALIGN_TOP = 0
    const val ALIGN_MIDDLE = 1
    const val ALIGN_BOTTOM = 2

    /** Applies the spacing adjustment while retaining a small minimum gap. */
    fun middleGap(gapPx: Float, adjustment: Float, viewportHeight: Int, minimumGapPx: Float): Float =
        (gapPx + adjustment * viewportHeight).coerceAtLeast(minimumGapPx)

    /**
     * Place the secondary subtitle below a top-aligned primary, and above it otherwise.
     */
    fun stackedDesiredBottom(
        primary: SubtitleBox,
        viewportHeight: Int,
        secondaryHeight: Float,
        gapPx: Float,
        adjustment: Float,
    ): Float {
        // The same half the placement search uses, so the secondary doesn't
        // flip above a top primary that a large offset has pushed down.
        val topAligned = verticalAlignmentFor(primary, viewportHeight) == ALIGN_TOP
        val anchor = if (topAligned)
            primary.bottom + gapPx + secondaryHeight
        else primary.top - gapPx
        return anchor + (if (topAligned) adjustment else -adjustment) * viewportHeight
    }

    /** Chooses the search half from the cue's actual screen position. */
    fun verticalAlignmentFor(box: SubtitleBox, viewportHeight: Int): Int = when {
        box.top + box.bottom < viewportHeight -> ALIGN_TOP
        box.top + box.bottom > viewportHeight -> ALIGN_BOTTOM
        else -> ALIGN_MIDDLE
    }

    /**
     * Moves a positioned cue along the vertical axis until it clears the
     * primary cues, staying in its preferred half when it is top/bottom aligned.
     */
    fun placePositionedSecondary(
        primary: List<SubtitleBox>,
        viewportWidth: Int,
        viewportHeight: Int,
        desired: SubtitleBox,
        verticalAlignment: Int,
        gapPx: Float,
        stepPx: Float,
        lowerHalfTop: Float = viewportHeight / 2f,
    ): SubtitleBox? {
        if (viewportWidth <= 0 || viewportHeight <= 0 || desired.top >= desired.bottom) return null
        val cueHeight = desired.bottom - desired.top
        val minimumBottom = if (verticalAlignment == ALIGN_BOTTOM) lowerHalfTop + cueHeight else cueHeight
        val maximumBottom = if (verticalAlignment == ALIGN_TOP) lowerHalfTop else viewportHeight.toFloat()
        if (minimumBottom > maximumBottom) return null
        val requestedBottom = desired.bottom.coerceIn(minimumBottom, maximumBottom)
        fun at(bottom: Float) = desired.copy(top = bottom - cueHeight, bottom = bottom)
        val step = stepPx.coerceAtLeast(1f)
        val maxDistance = when (verticalAlignment) {
            ALIGN_TOP -> maximumBottom - requestedBottom
            ALIGN_BOTTOM -> requestedBottom - minimumBottom
            else -> maxOf(requestedBottom - minimumBottom, maximumBottom - requestedBottom)
        }
        val maxSteps = kotlin.math.ceil(maxDistance / step).toInt()

        for (stepIndex in 0..maxSteps) {
            val distance = stepIndex * step
            val offsets = when (verticalAlignment) {
                ALIGN_TOP -> listOf(distance)
                ALIGN_BOTTOM -> listOf(-distance)
                // Prefer moving down when both positions are equally close.
                else -> if (stepIndex == 0) listOf(0f) else listOf(distance, -distance)
            }
            for (offset in offsets) {
                val candidate = at(requestedBottom + offset)
                if (candidate.bottom in minimumBottom..maximumBottom &&
                    primary.none { intersects(candidate, it, gapPx) }
                ) {
                    return candidate
                }
            }
        }

        // A stepped search can miss a narrow gap. Check the exact boundaries
        // before giving up, keeping the same preferred direction.
        val edges = sequenceOf(minimumBottom, maximumBottom) + primary.asSequence()
            .flatMap { sequenceOf(it.top - gapPx, it.bottom + gapPx + cueHeight) }
        return edges
            .filter { it in minimumBottom..maximumBottom }
            .filter {
                when (verticalAlignment) {
                    ALIGN_TOP -> it >= requestedBottom
                    ALIGN_BOTTOM -> it <= requestedBottom
                    else -> true
                }
            }
            .distinct()
            .sortedWith(compareBy<Float> { kotlin.math.abs(it - requestedBottom) }.thenByDescending { it })
            .map(::at)
            .firstOrNull { candidate -> primary.none { intersects(candidate, it, gapPx) } }
    }

    fun placeSecondary(
        primary: List<SubtitleBox>,
        viewportWidth: Int,
        viewportHeight: Int,
        secondaryHeight: Float,
        desiredBottom: Float,
        gapPx: Float,
        stepPx: Float,
        lowerHalfTop: Float = viewportHeight / 2f,
        horizontalInset: Float = viewportWidth * 0.05f,
    ): SubtitleBox? {
        if (viewportWidth <= 0 || viewportHeight <= 0 || secondaryHeight <= 0f) return null
        val left = horizontalInset.coerceAtLeast(0f)
        val right = (viewportWidth - horizontalInset).coerceAtLeast(left)
        return placePositionedSecondary(
            primary, viewportWidth, viewportHeight,
            SubtitleBox(left, desiredBottom - secondaryHeight, right, desiredBottom),
            ALIGN_BOTTOM, gapPx, stepPx, lowerHalfTop,
        )
    }

    fun intersects(a: SubtitleBox, b: SubtitleBox, gapPx: Float = 0f): Boolean =
        a.left < b.right && a.right > b.left &&
            a.top < b.bottom + gapPx && a.bottom > b.top - gapPx
}
