package org.moonfin.nativevideo

import kotlin.math.ceil

/**
 * How much of the picture's bottom edge to cover on odd-height video.
 *
 * Video is coded in blocks, so a height that isn't a multiple of 8 is padded
 * out to the next one and the decoder is told to crop the extra rows off.
 * Some Android TV compositors, the Shield and Fire TV among them, let those
 * rows through as a line along the bottom of the picture.
 */
internal object PaddingRowMask {
    private const val CODED_ROW_ALIGNMENT = 8

    /**
     * The mask height in view pixels for a picture [sourceHeight] rows tall
     * drawn [displayedHeight] pixels tall, or zero when nothing was padded.
     */
    fun heightPx(sourceHeight: Int, displayedHeight: Int): Int {
        if (sourceHeight <= 0 || displayedHeight <= 0) return 0
        val paddedRows =
            (CODED_ROW_ALIGNMENT - sourceHeight % CODED_ROW_ALIGNMENT) % CODED_ROW_ALIGNMENT
        if (paddedRows == 0) return 0
        val scaled = paddedRows * displayedHeight.toFloat() / sourceHeight
        // Slack for float error, so an exact fit doesn't round up a whole
        // extra pixel of picture.
        return ceil(scaled - 0.01f).toInt().coerceAtLeast(1)
    }
}
