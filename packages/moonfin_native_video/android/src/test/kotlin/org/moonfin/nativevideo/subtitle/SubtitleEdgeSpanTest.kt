package org.moonfin.nativevideo.subtitle

import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Rect
import android.graphics.Typeface
import android.view.View
import androidx.media3.common.text.Cue
import androidx.media3.ui.CaptionStyleCompat
import androidx.media3.ui.SubtitleView
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.annotation.Config
import org.robolectric.annotation.GraphicsMode

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28], manifest = Config.NONE)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
class SubtitleEdgeSpanTest {

    private fun inkBounds(span: SubtitleEdgeSpan?, outlined: Boolean = true): Rect {
        val view = SubtitleView(RuntimeEnvironment.getApplication())
        // Off, as with "use embedded styles" off, so the span has to survive it.
        view.setApplyEmbeddedStyles(false)
        view.setStyle(
            CaptionStyleCompat(
                Color.WHITE,
                Color.TRANSPARENT,
                Color.TRANSPARENT,
                if (outlined) CaptionStyleCompat.EDGE_TYPE_OUTLINE else CaptionStyleCompat.EDGE_TYPE_NONE,
                Color.RED,
                Typeface.DEFAULT,
            ),
        )
        view.setCues(listOf(Cue.Builder().setText("Subtitle").build().withEdges(span)))
        val bitmap = Bitmap.createBitmap(1280, 720, Bitmap.Config.ARGB_8888)
        view.measure(
            View.MeasureSpec.makeMeasureSpec(1280, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(720, View.MeasureSpec.EXACTLY),
        )
        view.layout(0, 0, 1280, 720)
        view.draw(Canvas(bitmap))
        val bounds = Rect(1280, 720, 0, 0)
        for (y in 0 until bitmap.height) for (x in 0 until bitmap.width) {
            if (Color.alpha(bitmap.getPixel(x, y)) > 32) {
                bounds.left = minOf(bounds.left, x)
                bounds.top = minOf(bounds.top, y)
                bounds.right = maxOf(bounds.right, x + 1)
                bounds.bottom = maxOf(bounds.bottom, y + 1)
            }
        }
        bitmap.recycle()
        assertTrue("Subtitle must draw visible pixels", bounds.width() > 0)
        return bounds
    }

    @Test
    fun largeOutlineDrawsWiderThanMedia3sOwn() {
        val plain = inkBounds(null)
        val large = inkBounds(SubtitleEdgeSpan.of(2f, true, 0, 0f, 0f))
        assertTrue("$large should be wider than $plain", large.width() > plain.width() + 4)
    }

    @Test
    fun shadowFallsDownAndRightWithOrWithoutAnOutline() {
        for (outlined in listOf(true, false)) {
            val plain = inkBounds(null, outlined)
            val shadowed = inkBounds(
                SubtitleEdgeSpan.of(1f, outlined, Color.BLACK, 0.1f, 0f),
                outlined,
            )
            assertTrue("outlined=$outlined", shadowed.right > plain.right + 2)
            assertTrue("outlined=$outlined", shadowed.bottom > plain.bottom + 2)
            assertEquals("outlined=$outlined", plain.left, shadowed.left)
        }
    }

    @Test
    fun theDefaultLookNeedsNoSpan() {
        assertNull(SubtitleEdgeSpan.of(1f, true, 0, 0f, 0f))
        assertNull(SubtitleEdgeSpan.of(2f, false, 0, 0f, 0f))
    }
}
