package org.moonfin.nativevideo.subtitle

import android.graphics.Color
import android.graphics.Paint
import android.graphics.Typeface
import android.text.Layout
import android.text.SpannableStringBuilder
import android.text.Spanned
import android.text.StaticLayout
import android.text.TextPaint
import android.text.style.AbsoluteSizeSpan
import android.text.style.RelativeSizeSpan
import android.view.View
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.text.Cue
import androidx.media3.common.text.LanguageFeatureSpan
import androidx.media3.ui.CaptionStyleCompat
import androidx.media3.ui.SubtitleView
import kotlin.math.roundToInt

/** Replace Media3's default SRT alignment margins. Other formats keep their coordinates. */
internal fun primaryCueWithoutDefaultMargin(cue: Cue, format: Format?): Cue {
    val mime = if (format?.sampleMimeType == MimeTypes.APPLICATION_MEDIA3_CUES)
        format.codecs else format?.sampleMimeType
    if (mime != MimeTypes.APPLICATION_SUBRIP || cue.bitmap != null ||
        cue.lineType != Cue.LINE_TYPE_FRACTION) return cue
    val edge = when {
        cue.line == 0.08f && cue.lineAnchor == Cue.ANCHOR_TYPE_START -> 0f
        cue.line == 0.92f && cue.lineAnchor == Cue.ANCHOR_TYPE_END -> 1f
        else -> return cue
    }
    return cue.buildUpon().setLine(edge, Cue.LINE_TYPE_FRACTION).build()
}

/**
 * Apply the primary offset inward: top cues move down and bottom cues move up. Leave
 * middle cues unchanged here. Automatically positioned cues use Media3 bottom padding.
 * Convert numbered WebVTT lines only when applying an offset. At zero, preserve their
 * original line numbers.
 */
internal fun offsetPrimaryCue(
    cue: Cue,
    verticalOffset: Float,
    lineHeightFraction: Float,
): Cue {
    if (verticalOffset <= 0f || cue.bitmap != null || cue.line == Cue.DIMEN_UNSET) return cue
    val line = when (cue.lineType) {
        Cue.LINE_TYPE_FRACTION -> cue.line
        Cue.LINE_TYPE_NUMBER -> if (cue.line < 0f)
            1f + (cue.line + 1f) * lineHeightFraction
        else cue.line * lineHeightFraction
        else -> return cue
    }
    val direction = when {
        line < 1f / 3f -> 1f
        line > 2f / 3f -> -1f
        else -> return cue
    }
    val builder = cue.buildUpon().setLine(
        (line + direction * verticalOffset).coerceIn(0f, 1f),
        Cue.LINE_TYPE_FRACTION,
    )
    if (cue.lineType == Cue.LINE_TYPE_NUMBER) {
        builder.setLineAnchor(if (cue.line < 0f) Cue.ANCHOR_TYPE_END else Cue.ANCHOR_TYPE_START)
    }
    return builder.build()
}

/** Places and styles cues decoded by the second Media3 text renderer. */
@androidx.media3.common.util.UnstableApi
internal class SecondarySubtitleOverlay(
    private val view: SubtitleView,
    private val primaryView: SubtitleView,
) {
    companion object {
        private const val MIN_GAP_DP = 8f
    }

    private var disposed = false
    private var secondaryCues: List<Cue>? = null
    private var retainedSecondaryCues: List<Cue> = emptyList()
    private var baseTextColor = Color.WHITE
    private var baseBackgroundColor = Color.TRANSPARENT
    private var baseStrokeColor = Color.TRANSPARENT
    private var baseFontSize = 20f
    private var baseFontWeight = 400
    private var embeddedStylesEnabled = true
    private var embeddedFontSizesEnabled = true
    private val measurementPaint = TextPaint(Paint.ANTI_ALIAS_FLAG or Paint.SUBPIXEL_TEXT_FLAG)
    private val lineSpacingExtra: Float
    private val lineSpacingMultiplier: Float
    private var fontSizeOverride: Float? = null
    private var textColorOverride: Int? = null
    private var offsetDelta = 0f
    private var primaryBottomPaddingFraction = 0.04f
    private var unmodifiedPrimaryCues: List<Cue> = emptyList()
    private var lastPrimaryCue: Cue? = null
    // Preserve the whole primary group so a later dialogue gap can resolve
    // placement against the same neighboring cues after a resize or style change.
    private var lastPrimaryCueGroup: List<Cue> = emptyList()
    private var resolvedPrimaryReference: Cue? = null
    private var primaryEnabled = true
    private var primaryUsesTopFallback = false

    init {
        val attributes = view.context.obtainStyledAttributes(null,
            intArrayOf(android.R.attr.lineSpacingExtra, android.R.attr.lineSpacingMultiplier), 0, 0)
        lineSpacingExtra = attributes.getDimensionPixelSize(0, 0).toFloat()
        lineSpacingMultiplier = attributes.getFloat(1, 1f)
        attributes.recycle()
        view.setApplyEmbeddedStyles(true)
        view.setApplyEmbeddedFontSizes(false)
        view.addOnLayoutChangeListener { _, _, _, _, _, _, _, _, _ ->
            renderCues()
        }
        applyStyle()
        view.setCues(emptyList())
    }

    /** Hide a pending track change, optionally restoring the still-active track's last cue. */
    fun select(enabled: Boolean, restoreRetained: Boolean = false) {
        val alreadySelected = secondaryCues != null
        secondaryCues = if (enabled) {
            if (restoreRetained) retainedSecondaryCues else emptyList()
        } else null
        if (!enabled || !alreadySelected) {
            // Clear the saved primary placement when secondary subtitles are enabled or
            // disabled. Keep it when switching secondary tracks so gaps in dialogue do
            // not reset the layout.
            lastPrimaryCue = null
            lastPrimaryCueGroup = emptyList()
            resolvedPrimaryReference = null
        }
        renderCues()
    }

    /** Remove an old secondary cue before retiming without disturbing primary placement. */
    fun clearSecondaryCues() {
        retainedSecondaryCues = emptyList()
        if (secondaryCues == null) return
        secondaryCues = emptyList()
        renderCues()
    }

    fun updateCues(cues: List<Cue>) {
        if (disposed) return
        retainedSecondaryCues = cues.filter { it.text != null }.map { cue ->
            cue.buildUpon()
                .setText(keepSubtitleEmphasis(requireNotNull(cue.text)))
                .clearWindowColor()
                .build()
        }
        if (secondaryCues == null) return
        secondaryCues = retainedSecondaryCues
        renderCues()
    }

    fun configureBaseStyle(
        textColor: Int,
        backgroundColor: Int,
        strokeColor: Int,
        fontSize: Float?,
        fontWeight: Int,
        verticalOffset: Float?,
        embeddedStylesEnabled: Boolean = true,
        embeddedFontSizesEnabled: Boolean = true,
    ) {
        view.setApplyEmbeddedStyles(embeddedStylesEnabled)
        this.embeddedStylesEnabled = embeddedStylesEnabled
        this.embeddedFontSizesEnabled = embeddedFontSizesEnabled
        baseTextColor = textColor
        baseBackgroundColor = backgroundColor
        baseStrokeColor = strokeColor
        if (fontSize != null) baseFontSize = fontSize
        baseFontWeight = fontWeight
        if (verticalOffset != null) {
            primaryBottomPaddingFraction = verticalOffset.coerceIn(0f, 0.95f)
        }
        applyStyle()
        renderCues()
    }

    /**
     * A seek or new primary track must not reuse the previous primary cue's
     * placement. Clearing secondary cues on seek keeps the track selected.
     */
    fun resetPrimaryCues(clearSecondary: Boolean = false) {
        unmodifiedPrimaryCues = emptyList()
        lastPrimaryCue = null
        lastPrimaryCueGroup = emptyList()
        resolvedPrimaryReference = null
        if (clearSecondary) {
            retainedSecondaryCues = emptyList()
            if (secondaryCues != null) secondaryCues = emptyList()
        }
        renderCues()
    }

    /** Switching primary On/Off resets placement, but ordinary dialogue gaps don't. */
    fun setPrimaryEnabled(enabled: Boolean) {
        if (primaryEnabled == enabled) return
        primaryEnabled = enabled
        resetPrimaryCues()
    }

    /**
     * ASS/SSA primaries can move, animate and draw several independent regions.
     * Their current libass ink isn't a stable stacking anchor, so reserve a
     * predictable top lane for the secondary instead.
     */
    fun setPrimaryUsesTopFallback(enabled: Boolean) {
        if (primaryUsesTopFallback == enabled) return
        primaryUsesTopFallback = enabled
        resetPrimaryCues()
    }

    // Where an ASS primary is drawn right now, in this view's coordinates.
    private var primaryInk: List<SubtitleBox> = emptyList()

    fun updatePrimaryInk(boxes: List<SubtitleBox>) {
        if (boxes == primaryInk) return
        primaryInk = boxes
        if (primaryUsesTopFallback && !secondaryCues.isNullOrEmpty()) renderCues()
    }

    fun updatePrimaryCues(cues: List<Cue>) {
        if (!primaryEnabled) return
        unmodifiedPrimaryCues = cues
        renderCues()
    }

    /** Font size and vertical offset use the same units as the primary subtitle style. */
    fun configureAppearance(
        fontSize: Float?,
        verticalOffset: Float?,
        textColor: Int? = null,
    ) {
        fontSizeOverride = fontSize?.coerceIn(6f, 72f)
        textColorOverride = textColor
        offsetDelta = (verticalOffset ?: 0f).coerceIn(0f, 0.06f)
        applyStyle()
        renderCues()
    }

    private fun isCentredCue(cue: Cue): Boolean =
        cue.bitmap == null &&
            cue.lineType == Cue.LINE_TYPE_FRACTION &&
            cue.lineAnchor == Cue.ANCHOR_TYPE_MIDDLE &&
            cue.line in 0.35f..0.65f

    /** Shift an already-offset centered cue. The caller resolves collisions. */
    private fun shiftCentredPrimaryCue(cue: Cue, height: Int): Cue {
        // Keep the gap centered on the original cue position while secondary subtitles
        // are enabled, even when no secondary cue is visible.
        val density = view.resources.displayMetrics.density
        val middleGapPx = SubtitleLayoutPlanner.middleGap(
            MIN_GAP_DP * density, offsetDelta, height, 2f * density)
        return cue.buildUpon()
            .setLine((cue.line + middleGapPx / (2f * height)).coerceAtMost(1f), Cue.LINE_TYPE_FRACTION)
            .setLineAnchor(Cue.ANCHOR_TYPE_START)
            .build()
    }

    /** Move a centered primary only if it won't cover another primary cue. */
    private fun resolvePrimaryCues(cues: List<Cue>, width: Int, height: Int, fontPx: Float): List<Cue> {
        val lineHeight = (baseFontSize / 24f) * 0.06f * 1.25f
        val originals = cues.map { offsetPrimaryCue(it, primaryBottomPaddingFraction, lineHeight) }
        if (secondaryCues == null || width <= 0 || height <= 0) return originals

        val originalBoxes = originals.map { estimatePrimaryBox(it, width, height, fontPx) }
        val resolved = ArrayList<Cue>(originals.size)
        val resolvedBoxes = ArrayList<SubtitleBox>(originals.size)
        for ((index, cue) in originals.withIndex()) {
            val candidate = if (isCentredCue(cue)) shiftCentredPrimaryCue(cue, height) else cue
            val candidateBox = if (candidate === cue) originalBoxes[index]
                else estimatePrimaryBox(candidate, width, height, fontPx)
            // Compare against every other authored primary, even one we may
            // move later. Also protect earlier accepted positions.
            val overlapsOtherPrimary = candidate !== cue && originalBoxes.indices.any {
                it != index && SubtitleLayoutPlanner.intersects(candidateBox, originalBoxes[it])
            }
            val overlapsAccepted = resolvedBoxes.any {
                SubtitleLayoutPlanner.intersects(candidateBox, it)
            }
            val selected = if (overlapsOtherPrimary || overlapsAccepted) cue else candidate
            resolved += selected
            resolvedBoxes += if (selected === cue) originalBoxes[index] else candidateBox
        }
        return resolved
    }

    private fun renderCues() {
        val active = secondaryCues.orEmpty()
        if (!primaryEnabled) {
            // With the primary off, use the normal bottom position without the extra
            // gap. Keep the saved spacing for when the primary is enabled again.
            primaryView.setCues(emptyList())
            view.visibility = View.VISIBLE
            view.setCues(if (active.isEmpty()) emptyList() else listOf(
                Cue.Builder()
                    .setText(joinKeepingSpans(active.map { requireNotNull(it.text) }))
                    .setLine((1f - primaryBottomPaddingFraction).coerceIn(0f, 1f), Cue.LINE_TYPE_FRACTION)
                    .setLineAnchor(Cue.ANCHOR_TYPE_END)
                    .build(),
            ))
            return
        }
        val width = view.width
        val height = view.height
        val gapPx = MIN_GAP_DP * view.resources.displayMetrics.density
        val primaryFontPx = (baseFontSize / 24f) * 0.06f * height
        val primaryCues = resolvePrimaryCues(unmodifiedPrimaryCues, width, height, primaryFontPx)
        unmodifiedPrimaryCues.firstOrNull { it.text != null }?.let {
            // Keep the whole authored group so future placements use the same
            // collision result during dialogue gaps and after appearance changes.
            lastPrimaryCue = it
            lastPrimaryCueGroup = unmodifiedPrimaryCues
        }
        // Use the same resolved group as the reference and, during dialogue gaps,
        // as the collision obstacles. Only the current cues are drawn.
        val hasCurrentText = unmodifiedPrimaryCues.any { it.text != null }
        val referenceCues = if (hasCurrentText) primaryCues
            else resolvePrimaryCues(lastPrimaryCueGroup, width, height, primaryFontPx)
        resolvedPrimaryReference = referenceCues.firstOrNull { it.text != null }
        primaryView.setCues(primaryCues)
        if (active.isEmpty()) {
            view.visibility = View.VISIBLE
            view.setCues(emptyList())
            return
        }
        if (width <= 0 || height <= 0) {
            view.visibility = View.VISIBLE
            view.setCues(active.map(::buildCue))
            return
        }
        val secondaryFontPx = ((fontSizeOverride ?: baseFontSize) / 24f) * 0.06f * height
        if (primaryUsesTopFallback) {
            val text = joinKeepingSpans(active.map { requireNotNull(it.text) })
            val fallback = Cue.Builder()
                .setText(text)
                .setTextAlignment(Layout.Alignment.ALIGN_CENTER)
                .setPosition(0.5f)
                .setPositionAnchor(Cue.ANCHOR_TYPE_MIDDLE)
                .build()
            val measured = measureTextHeights(fallback, width, height, secondaryFontPx)
            val desiredTop = (primaryBottomPaddingFraction + offsetDelta) * height
            val laneTop = desiredTop.coerceIn(
                0f,
                (height - measured.drawn).coerceAtLeast(0f),
            )
            // ASS lines can move every frame, so the secondary only gives way
            // while one actually covers its centered text, not just its band.
            val laneLeft = (width - measured.drawnWidth) / 2f
            val lane = SubtitleBox(laneLeft, laneTop, laneLeft + measured.drawnWidth,
                laneTop + measured.drawn)
            val top = if (primaryInk.none { SubtitleLayoutPlanner.intersects(lane, it, gapPx) }) laneTop
                else SubtitleLayoutPlanner.placePositionedSecondary(
                    primaryInk, width, height, lane, SubtitleLayoutPlanner.ALIGN_MIDDLE, gapPx, gapPx,
                )?.top ?: laneTop
            view.visibility = View.VISIBLE
            view.setCues(listOf(
                fallback.buildUpon()
                    .setLine(top / height, Cue.LINE_TYPE_FRACTION)
                    .setLineAnchor(Cue.ANCHOR_TYPE_START)
                    .build(),
            ))
            return
        }
        val collisionCues = if (unmodifiedPrimaryCues.isEmpty()) referenceCues else primaryCues
        val primaryBoxes = collisionCues.map { estimatePrimaryBox(it, width, height, primaryFontPx) }
        // Position secondary cues relative to the primary's current or last known
        // placement.
        val fixed = if (lastPrimaryCue == null) active.filter { it.line != Cue.DIMEN_UNSET } else emptyList()
        val automatic = if (lastPrimaryCue == null) active.filter { it.line == Cue.DIMEN_UNSET } else active
        val rendered = ArrayList<Cue>()
        val occupied = ArrayList<SubtitleBox>(primaryBoxes)
        val topFallback = ArrayList<Cue>()
        for (sourceCue in fixed) {
            var cue = buildCue(sourceCue)
            val measured = measureTextHeights(cue, width, height, secondaryFontPx)
            val anchoredBox = estimateSecondaryBox(cue, width, height, measured.anchor)
            val originalBox = anchoredBox.copy(bottom = anchoredBox.top + measured.drawn)
            val inward = if (SubtitleLayoutPlanner.verticalAlignmentFor(originalBox, height) ==
                SubtitleLayoutPlanner.ALIGN_TOP) offsetDelta else -offsetDelta
            val shift = (inward * height)
                .coerceAtLeast(-originalBox.top).coerceAtMost(height - originalBox.bottom)
            val box = originalBox.copy(top = originalBox.top + shift, bottom = originalBox.bottom + shift)
            // Media3 anchors the first layout, then draws a possibly taller
            // layout after clipping horizontally. Account for that extra height.
            val drawnExtra = measured.drawn - measured.anchor
            cue = cue.buildUpon().setLine((box.bottom - drawnExtra) / height, Cue.LINE_TYPE_FRACTION)
                .setLineAnchor(Cue.ANCHOR_TYPE_END).build()
            if (occupied.none { SubtitleLayoutPlanner.intersects(box, it, gapPx) }) {
                rendered += cue
                occupied += box
                continue
            }

            val verticalAlignment = SubtitleLayoutPlanner.verticalAlignmentFor(box, height)
            val placed = SubtitleLayoutPlanner.placePositionedSecondary(
                primary = occupied,
                viewportWidth = width,
                viewportHeight = height,
                desired = box,
                verticalAlignment = verticalAlignment,
                gapPx = gapPx,
                stepPx = gapPx,
            )
            if (placed != null) {
                cue = cue.buildUpon()
                    .setLine((placed.bottom - (measured.drawn - measured.anchor)) / height,
                        Cue.LINE_TYPE_FRACTION)
                    .build()
                rendered += cue
                occupied += placed
            } else if (verticalAlignment == SubtitleLayoutPlanner.ALIGN_TOP) {
                topFallback.add(cue)
            }
        }

        // Top-aligned captions that don't fit in the upper half fall back to
        // the normal bottom placement.
        for (cue in topFallback) {
            placeAutomaticCue(cue, width, height, secondaryFontPx, occupied, gapPx)
                ?.let(rendered::add)
        }

        val automaticGroups = automatic.groupBy {
            listOf(it.position, it.positionAnchor, it.size, it.textAlignment)
        }.values
        for (group in automaticGroups) {
            val text = joinKeepingSpans(group.map { requireNotNull(it.text) })
            placeAutomaticCue(
                buildCue(group.first()).buildUpon().setText(text).build(), width, height, secondaryFontPx, occupied, gapPx,
            )?.let(rendered::add)
        }

        view.visibility = if (rendered.isEmpty()) View.INVISIBLE else View.VISIBLE
        view.setCues(rendered)
    }

    private fun buildCue(cue: Cue): Cue = cue.buildUpon().apply {
        if (cue.line != Cue.DIMEN_UNSET) {
            setLine(cue.line, if (cue.lineType == Cue.LINE_TYPE_NUMBER) Cue.LINE_TYPE_NUMBER else Cue.LINE_TYPE_FRACTION)
            if (cue.lineAnchor == Cue.TYPE_UNSET) {
                setLineAnchor(if (cue.line < 0f) Cue.ANCHOR_TYPE_END else Cue.ANCHOR_TYPE_START)
            }
        }
        if (cue.position != Cue.DIMEN_UNSET && cue.positionAnchor == Cue.TYPE_UNSET) {
            setPositionAnchor(Cue.ANCHOR_TYPE_MIDDLE)
        }
        setTextAlignment(cue.textAlignment ?: Layout.Alignment.ALIGN_CENTER)
    }.build()

    private fun placeAutomaticCue(
        cue: Cue,
        width: Int,
        height: Int,
        fontPx: Float,
        occupied: MutableList<SubtitleBox>,
        gapPx: Float,
    ): Cue? {
        // Use the position the primary actually received. A proposed centered
        // shift may have been rejected to avoid covering another primary cue.
        val reference = resolvedPrimaryReference
        val cueSize = reference?.size ?: cue.size
        val cueWidth = if (cueSize == Cue.DIMEN_UNSET) width * 0.9f else cueSize * width
        val alignedCue = if (reference == null) cue else cue.buildUpon()
            // Keep the primary's whole horizontal box. Copying only its
            // anchor can shift centered text to the edge of a wide cue.
            .setPosition(if (reference.position == Cue.DIMEN_UNSET) 0.5f else reference.position)
            .setPositionAnchor(if (reference.position == Cue.DIMEN_UNSET)
                Cue.ANCHOR_TYPE_MIDDLE else reference.positionAnchor)
            .setSize(cueSize)
            .setTextAlignment(reference.textAlignment ?: Layout.Alignment.ALIGN_CENTER)
            .build()
        val measured = measureTextHeights(alignedCue, width, height, fontPx)
        val textHeight = measured.drawn
        val refBox = reference?.let {
            estimatePrimaryBox(it, width, height, (baseFontSize / 24f) * 0.06f * height)
        }
        val primaryBottom = height * (1f - primaryBottomPaddingFraction)
        val centred = lastPrimaryCue?.let(::isCentredCue) == true
        val minimumGapPx = 2f * view.resources.displayMetrics.density
        val desiredBottom = when {
            refBox == null -> primaryBottom - gapPx - offsetDelta * height
            centred -> refBox.top - SubtitleLayoutPlanner.middleGap(
                gapPx, offsetDelta, height, minimumGapPx)
            else -> SubtitleLayoutPlanner.stackedDesiredBottom(
                refBox, height, textHeight, gapPx, offsetDelta)
        }
        val placement = if (refBox != null && reference != null) {
            val left = if (reference.position != Cue.DIMEN_UNSET)
                (reference.position * width - when (reference.positionAnchor) {
                    Cue.ANCHOR_TYPE_START -> 0f
                    Cue.ANCHOR_TYPE_END -> cueWidth
                    else -> cueWidth / 2f
                }).coerceIn(0f, (width - cueWidth).coerceAtLeast(0f))
                else (width - cueWidth) / 2f
            val desired = SubtitleBox(left, desiredBottom - textHeight, left + cueWidth, desiredBottom)
            val alignment = if (centred) SubtitleLayoutPlanner.ALIGN_MIDDLE
                else SubtitleLayoutPlanner.verticalAlignmentFor(refBox, height)
            val clearance = if (centred) minimumGapPx / 2f else gapPx
            SubtitleLayoutPlanner.placePositionedSecondary(
                occupied, width, height, desired, alignment, clearance, gapPx,
            ) ?: if (alignment == SubtitleLayoutPlanner.ALIGN_MIDDLE) null
            else {
                // At high primary offsets, both subtitle rows may not fit in one
                // half. Preserve their order and gap rather than hiding a row.
                SubtitleLayoutPlanner.placePositionedSecondary(
                    occupied, width, height, desired, alignment, clearance, gapPx,
                    lowerHalfTop = if (alignment == SubtitleLayoutPlanner.ALIGN_TOP)
                        height.toFloat() else 0f,
                )
            }
        } else {
            // A primary filling the lower half's free space, like a centered
            // bitmap at a high offset, can leave room only above it.
            listOf(height / 2f, 0f).firstNotNullOfOrNull { lowerHalfTop ->
                SubtitleLayoutPlanner.placeSecondary(
                    primary = occupied,
                    viewportWidth = width,
                    viewportHeight = height,
                    secondaryHeight = textHeight,
                    desiredBottom = desiredBottom,
                    gapPx = gapPx,
                    stepPx = gapPx,
                    lowerHalfTop = lowerHalfTop,
                )
            }
        }
        if (placement == null) return null
        val topAligned = reference != null &&
            SubtitleLayoutPlanner.verticalAlignmentFor(refBox!!, height) == SubtitleLayoutPlanner.ALIGN_TOP
        val placedCue = alignedCue.buildUpon()
            .setLine(
                ((if (topAligned) placement.top else
                    placement.bottom - (measured.drawn - measured.anchor)) / height).coerceIn(0f, 1f),
                Cue.LINE_TYPE_FRACTION,
            )
            .setLineAnchor(if (topAligned) Cue.ANCHOR_TYPE_START else Cue.ANCHOR_TYPE_END)
            .build()
        occupied += placement
        return placedCue
    }

    private fun estimatePrimaryBox(cue: Cue, width: Int, height: Int, fontPx: Float): SubtitleBox {
        val bitmap = cue.bitmap
        val nominalWidth = if (cue.size != Cue.DIMEN_UNSET) cue.size * width else width * 0.9f
        val measured = if (bitmap == null)
            measureTextHeights(cue, width, height, fontPx, primary = true) else null
        val anchorHeight = measured?.anchor ?: (cue.bitmapHeight * height).coerceAtLeast(1f)
        val boxHeight = measured?.drawn ?: anchorHeight
        val firstLineHeight = measured?.firstLine ?: fontPx
        val cueWidth = if (bitmap != null) {
            (boxHeight * bitmap.width / bitmap.height).coerceAtMost(width.toFloat())
        } else {
            nominalWidth
        }
        val left = cueLeft(cue, width, cueWidth)
        var top = when {
            cue.line == Cue.DIMEN_UNSET -> height * (1f - primaryBottomPaddingFraction) - anchorHeight
            cue.lineType == Cue.LINE_TYPE_FRACTION -> when (cue.lineAnchor) {
                Cue.ANCHOR_TYPE_END -> cue.line * height - anchorHeight
                Cue.ANCHOR_TYPE_MIDDLE -> cue.line * height - anchorHeight / 2f
                else -> cue.line * height
            }
            // Media3's numbered WebVTT lines use the measured FIRST line, not
            // the nominal font size. Negative lines count from the screen bottom.
            cue.line < 0f -> height + ((cue.line + 1f) * firstLineHeight).roundToInt() - anchorHeight
            else -> (cue.line * firstLineHeight).roundToInt().toFloat()
        }
        // SubtitlePainter clamps positioned text using the initial layout height.
        // Its final drawn height still determines the collision box below.
        if (bitmap == null && cue.line != Cue.DIMEN_UNSET) {
            if (top + anchorHeight > height) top = height - anchorHeight
            else if (top < 0f) top = 0f
        }
        return SubtitleBox(left, top, left + cueWidth, top + boxHeight)
    }

    private fun estimateSecondaryBox(
        cue: Cue,
        width: Int,
        height: Int,
        boxHeight: Float,
    ): SubtitleBox {
        val cueWidth = if (cue.size != Cue.DIMEN_UNSET) cue.size * width else width * 0.9f
        val left = cueLeft(cue, width, cueWidth)
        val top = if (cue.line == Cue.DIMEN_UNSET) {
            height * (1f - primaryBottomPaddingFraction) - boxHeight
        } else if (cue.lineType == Cue.LINE_TYPE_NUMBER) {
            if (cue.line < 0f) height * (1f - primaryBottomPaddingFraction) + cue.line * (boxHeight / 2f)
            else cue.line * (boxHeight / 2f)
        } else when (cue.lineAnchor) {
            Cue.ANCHOR_TYPE_END -> cue.line * height - boxHeight
            Cue.ANCHOR_TYPE_MIDDLE -> cue.line * height - boxHeight / 2f
            else -> cue.line * height
        }
        return SubtitleBox(left, top, left + cueWidth, top + boxHeight)
    }

    private fun cueLeft(cue: Cue, width: Int, cueWidth: Float): Float {
        if (cue.position == Cue.DIMEN_UNSET) return (width - cueWidth) / 2f
        val anchorPosition = cue.position * width
        return when (cue.positionAnchor) {
            Cue.ANCHOR_TYPE_START -> anchorPosition
            Cue.ANCHOR_TYPE_END -> anchorPosition - cueWidth
            else -> anchorPosition - cueWidth / 2f
        }
    }

    private data class TextLayoutHeights(
        val anchor: Float,
        val drawn: Float,
        val firstLine: Float,
        val drawnWidth: Float,
    )

    /** Media3 anchors the first layout but draws a second one after horizontal clipping. */
    @Suppress("DEPRECATION") // Use the same StaticLayout constructor as Media3.
    private fun measureTextHeights(cue: Cue, width: Int, height: Int, fontPx: Float,
                                   primary: Boolean = false): TextLayoutHeights {
        val text = SpannableStringBuilder(cue.text ?: "")
        val useEmbeddedSizes = primary && embeddedStylesEnabled && embeddedFontSizesEnabled
        for (span in text.getSpans(0, text.length, Any::class.java)) {
            if ((!embeddedStylesEnabled && span !is LanguageFeatureSpan) ||
                (!useEmbeddedSizes && (span is AbsoluteSizeSpan || span is RelativeSizeSpan))) {
                text.removeSpan(span)
            }
        }
        if (useEmbeddedSizes) {
            val cueFontPx = when (cue.textSizeType) {
                Cue.TEXT_SIZE_TYPE_ABSOLUTE -> cue.textSize
                Cue.TEXT_SIZE_TYPE_FRACTIONAL, Cue.TEXT_SIZE_TYPE_FRACTIONAL_IGNORE_PADDING ->
                    cue.textSize * height
                else -> Cue.DIMEN_UNSET
            }
            if (cueFontPx > 0f) text.setSpan(AbsoluteSizeSpan(cueFontPx.toInt()),
                0, text.length, Spanned.SPAN_PRIORITY)
        }
        measurementPaint.textSize = fontPx.coerceAtLeast(1f)
        measurementPaint.typeface = Typeface.create(Typeface.DEFAULT,
            if (baseFontWeight >= 600) Typeface.BOLD else Typeface.NORMAL)
        // Media3 subtracts its inner padding before applying the authored cue width.
        val padding = (measurementPaint.textSize * 0.125f + 0.5f).toInt()
        val availableWidth = ((width - padding * 2) *
            if (cue.size == Cue.DIMEN_UNSET) 1f else cue.size).toInt().coerceAtLeast(1)
        val alignment = cue.textAlignment ?: Layout.Alignment.ALIGN_CENTER
        val initial = StaticLayout(text, measurementPaint, availableWidth, alignment,
            lineSpacingMultiplier, lineSpacingExtra, true)
        var drawnWidth = 0
        for (line in 0 until initial.lineCount) {
            drawnWidth = maxOf(drawnWidth,
                kotlin.math.ceil(initial.getLineWidth(line).toDouble()).toInt())
        }
        if (cue.size != Cue.DIMEN_UNSET) drawnWidth = maxOf(drawnWidth, availableWidth)
        drawnWidth += padding * 2
        if (cue.position != Cue.DIMEN_UNSET) {
            // SubtitlePainter clamps positioned text to the view before drawing.
            // The smaller width can add lines without changing its anchor height.
            val anchorX = kotlin.math.round(width * cue.position).toInt()
            val left = when (cue.positionAnchor) {
                Cue.ANCHOR_TYPE_END -> anchorX - drawnWidth
                Cue.ANCHOR_TYPE_MIDDLE -> (anchorX * 2 - drawnWidth) / 2
                else -> anchorX
            }.coerceAtLeast(0)
            drawnWidth = (left + drawnWidth).coerceAtMost(width) - left
        }
        val drawn = if (drawnWidth <= 0) 0f else StaticLayout(text, measurementPaint,
            drawnWidth, alignment, lineSpacingMultiplier, lineSpacingExtra, true).height.toFloat()
        return TextLayoutHeights(initial.height.toFloat(), drawn,
            (initial.getLineBottom(0) - initial.getLineTop(0)).toFloat(), drawnWidth.toFloat())
    }

    fun clear() {
        unmodifiedPrimaryCues = emptyList()
        lastPrimaryCue = null
        lastPrimaryCueGroup = emptyList()
        resolvedPrimaryReference = null
        retainedSecondaryCues = emptyList()
        primaryView.setCues(emptyList())
        select(false)
    }

    fun dispose() {
        disposed = true
        clear()
    }

    private fun applyStyle() {
        val weight = if (baseFontWeight >= 600) Typeface.BOLD else Typeface.NORMAL
        val edgeType = if (baseStrokeColor == Color.TRANSPARENT) {
            CaptionStyleCompat.EDGE_TYPE_NONE
        } else {
            CaptionStyleCompat.EDGE_TYPE_OUTLINE
        }
        view.setStyle(
            CaptionStyleCompat(
                textColorOverride ?: baseTextColor,
                baseBackgroundColor,
                Color.TRANSPARENT,
                edgeType,
                baseStrokeColor,
                Typeface.create(Typeface.DEFAULT, weight),
            ),
        )
        val size = fontSizeOverride ?: baseFontSize
        view.setFractionalTextSize(((size / 24f) * 0.06f).coerceAtLeast(0.01f))
        view.setBottomPaddingFraction(0f)
    }

}
