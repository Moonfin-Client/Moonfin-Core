package org.moonfin.nativevideo

/**
 * Finds encoded letterbox bars in an ARGB frame.
 *
 * Same thresholds as mpv `cropdetect=limit=24/255:round=2`. The rectangle is
 * in coded-pixel space ([sourceWidth] x [sourceHeight]), not view pixels.
 */
data class LetterboxCropRect(
    val w: Int,
    val h: Int,
    val x: Int,
    val y: Int,
) {
    fun toWireMap(sourceWidth: Int, sourceHeight: Int): Map<String, Int> = mapOf(
        "w" to w,
        "h" to h,
        "x" to x,
        "y" to y,
        "sourceWidth" to sourceWidth,
        "sourceHeight" to sourceHeight,
    )
}

object LetterboxBarScanner {
    const val LUMA_LIMIT = 24
    const val ROUND = 2

    fun scanArgb(
        pixels: IntArray,
        width: Int,
        height: Int,
        sourceWidth: Int,
        sourceHeight: Int,
        lumaLimit: Int = LUMA_LIMIT,
        round: Int = ROUND,
    ): LetterboxCropRect? {
        if (
            width <= 0 ||
            height <= 0 ||
            sourceWidth <= 0 ||
            sourceHeight <= 0 ||
            pixels.size < width * height
        ) {
            return null
        }

        var minX = width
        var minY = height
        var maxX = -1
        var maxY = -1
        for (y in 0 until height) {
            val row = y * width
            for (x in 0 until width) {
                if (luma(pixels[row + x]) > lumaLimit) {
                    if (x < minX) minX = x
                    if (x > maxX) maxX = x
                    if (y < minY) minY = y
                    if (y > maxY) maxY = y
                }
            }
        }
        if (maxX < 0) {
            return null
        }

        val srcX = mapToSource(minX, width, sourceWidth)
        val srcY = mapToSource(minY, height, sourceHeight)
        val srcW = (mapToSource(maxX + 1, width, sourceWidth) - srcX)
            .coerceAtLeast(0)
        val srcH = (mapToSource(maxY + 1, height, sourceHeight) - srcY)
            .coerceAtLeast(0)
        return roundRect(srcX, srcY, srcW, srcH, sourceWidth, sourceHeight, round)
    }

    internal fun luma(pixel: Int): Int {
        val r = (pixel ushr 16) and 0xFF
        val g = (pixel ushr 8) and 0xFF
        val b = pixel and 0xFF
        return (77 * r + 150 * g + 29 * b) shr 8
    }

    internal fun mapToSource(viewCoord: Int, viewSize: Int, sourceSize: Int): Int {
        if (viewSize <= 0) return 0
        return ((viewCoord.toLong() * sourceSize) / viewSize).toInt()
            .coerceIn(0, sourceSize)
    }

    internal fun roundRect(
        x: Int,
        y: Int,
        w: Int,
        h: Int,
        sourceWidth: Int,
        sourceHeight: Int,
        round: Int,
    ): LetterboxCropRect? {
        if (w <= 0 || h <= 0) return null
        val step = round.coerceAtLeast(1)
        var rx = alignDown(x.coerceAtLeast(0), step)
        var ry = alignDown(y.coerceAtLeast(0), step)
        var rw = alignDown(w, step)
        var rh = alignDown(h, step)
        if (rx + rw > sourceWidth) {
            rw = alignDown(sourceWidth - rx, step)
        }
        if (ry + rh > sourceHeight) {
            rh = alignDown(sourceHeight - ry, step)
        }
        if (rw <= 0 || rh <= 0) return null
        return LetterboxCropRect(w = rw, h = rh, x = rx, y = ry)
    }

    private fun alignDown(value: Int, round: Int): Int {
        if (round <= 1 || value <= 0) return value.coerceAtLeast(0)
        return value - (value % round)
    }
}
