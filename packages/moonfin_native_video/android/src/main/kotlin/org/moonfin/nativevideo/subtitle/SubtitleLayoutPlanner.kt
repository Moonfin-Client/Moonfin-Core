package org.moonfin.nativevideo.subtitle

/** A measured subtitle box in pixels. */
internal data class SubtitleBox(
    val left: Float,
    val top: Float,
    val right: Float,
    val bottom: Float,
)

/** Finds the closest position above the primary captions, inside the lower half. */
internal object SubtitleLayoutPlanner {
    const val ALIGN_TOP = 0
    const val ALIGN_MIDDLE = 1
    const val ALIGN_BOTTOM = 2

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
        val step = stepPx.coerceAtLeast(1f)
        val maxDistance = when (verticalAlignment) {
            ALIGN_TOP -> lowerHalfTop - desired.bottom
            ALIGN_BOTTOM -> desired.top - lowerHalfTop
            else -> maxOf(desired.top, viewportHeight - desired.bottom)
        }.coerceAtLeast(0f)
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
                val candidate = desired.copy(top = desired.top + offset, bottom = desired.bottom + offset)
                val inViewport = candidate.top >= 0f && candidate.bottom <= viewportHeight
                val inPreferredHalf = when (verticalAlignment) {
                    ALIGN_TOP -> candidate.bottom <= lowerHalfTop
                    ALIGN_BOTTOM -> candidate.top >= lowerHalfTop
                    else -> true
                }
                if (inViewport && inPreferredHalf && primary.none { intersects(candidate, it, gapPx) }) {
                    return candidate
                }
            }
        }
        return null
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
        var bottom = desiredBottom.coerceAtMost(viewportHeight.toFloat())
        val step = stepPx.coerceAtLeast(1f)
        while (bottom - secondaryHeight >= lowerHalfTop) {
            val candidate = SubtitleBox(left, bottom - secondaryHeight, right, bottom)
            if (primary.none { intersects(candidate, it, gapPx) }) return candidate
            bottom -= step
        }
        return null
    }

    fun intersects(a: SubtitleBox, b: SubtitleBox, gapPx: Float = 0f): Boolean =
        a.left < b.right && a.right > b.left &&
            a.top < b.bottom + gapPx && a.bottom > b.top - gapPx
}
