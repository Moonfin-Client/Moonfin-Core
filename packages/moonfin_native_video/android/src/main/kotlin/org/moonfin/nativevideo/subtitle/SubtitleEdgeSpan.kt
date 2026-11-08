package org.moonfin.nativevideo.subtitle

import android.graphics.Paint
import android.text.SpannableString
import android.text.Spanned
import android.text.TextPaint
import android.text.style.CharacterStyle
import android.text.style.UpdateAppearance
import androidx.media3.common.text.Cue
import androidx.media3.common.text.LanguageFeatureSpan

// Large comes out near the 6 px outline of a typical anime ASS track at the
// default size on a 1080p screen.
private const val OUTLINE_PER_TEXT_SIZE = 0.111f

/**
 * Widens Media3's outline and adds a drop shadow, neither of which its caption
 * style offers. Media3 draws the outline as its own FILL_AND_STROKE pass under
 * the fill, so the paint style tells the two passes apart. The shadow goes on
 * the outline pass when there is one, so it falls behind the whole outlined
 * letter rather than across the outline. A language feature span, so it stays
 * when embedded styles are off.
 */
class SubtitleEdgeSpan(
    private val strokeScale: Float,
    private val outlined: Boolean,
    private val shadowColor: Int,
    private val shadowOffset: Float,
    private val shadowBlur: Float,
) : CharacterStyle(), UpdateAppearance, LanguageFeatureSpan {

    override fun updateDrawState(paint: TextPaint) {
        val outlinePass = paint.style == Paint.Style.FILL_AND_STROKE
        if (outlinePass && strokeScale > 1f) {
            paint.strokeWidth = maxOf(
                paint.strokeWidth,
                paint.textSize * OUTLINE_PER_TEXT_SIZE * strokeScale,
            )
        }
        if (shadowColor != 0 && outlinePass == outlined) {
            val offset = shadowOffset * paint.textSize
            // A zero radius would remove the shadow rather than draw it sharp.
            paint.setShadowLayer(
                maxOf(shadowBlur * paint.textSize, 0.1f),
                offset,
                offset,
                shadowColor,
            )
        }
    }

    companion object {
        /** Null when the style needs nothing Media3 doesn't already draw. */
        fun of(
            strokeScale: Float,
            outlined: Boolean,
            shadowColor: Int,
            shadowOffset: Float,
            shadowBlur: Float,
        ): SubtitleEdgeSpan? =
            if ((outlined && strokeScale > 1f) || shadowColor != 0) {
                SubtitleEdgeSpan(strokeScale, outlined, shadowColor, shadowOffset, shadowBlur)
            } else {
                null
            }
    }
}

internal fun Cue.withEdges(span: SubtitleEdgeSpan?): Cue {
    val text = text
    if (span == null || text == null) return this
    val styled = SpannableString(text)
    styled.setSpan(span, 0, styled.length, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
    return buildUpon().setText(styled).build()
}
