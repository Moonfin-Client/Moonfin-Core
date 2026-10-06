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
