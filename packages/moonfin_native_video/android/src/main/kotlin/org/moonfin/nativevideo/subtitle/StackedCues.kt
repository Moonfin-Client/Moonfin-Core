package org.moonfin.nativevideo.subtitle

import android.text.Layout
import android.text.SpannableStringBuilder
import androidx.media3.common.text.Cue

/**
 * Folds text cues that would paint into the same box into one cue.
 *
 * A SubRip or WebVTT file can book two cues on the same timestamp, and
 * media3's merging resolver hands both to the view at once. Neither carries
 * a line, so the painter draws both at the bottom, one over the other. Every
 * run of same box text cues becomes one cue with a newline between the
 * parts, in the order the resolver delivered them, which is start time then
 * file order. The joined cue keeps every layout field of its first part, so
 * the bottom padding, text size and style settings reach it unchanged.
 *
 * Bitmap cues (PGS, VobSub, DVB, libass), vertical text, blank cues and
 * placed cues that differ in any layout field (CEA-608 rows, `{\an8}` tags,
 * ASS alignments) pass through untouched and keep their place in the list.
 * A part whose text repeats one already in the box is dropped, since a file
 * that lists the same cue twice showed one line before and should still.
 */
internal fun joinStackedCues(cues: List<Cue>): List<Cue> = joinStackedCues(cues, ::joinKeepingSpans)

/** [join] receives the parts of one box in order and returns the text of the joined cue. */
internal fun joinStackedCues(
    cues: List<Cue>,
    join: (List<CharSequence>) -> CharSequence,
): List<Cue> {
    if (cues.size < 2) return cues
    // Output slot of each box's first cue, so a later twin joins that cue
    // instead of taking a slot of its own.
    val anchors = HashMap<CueBox, Int>()
    val parts = HashMap<Int, MutableList<CharSequence>>()
    val output = ArrayList<Cue>(cues.size)
    for (cue in cues) {
        val box = CueBox.of(cue)
        val anchor = box?.let { anchors[it] }
        if (anchor == null) {
            if (box != null) anchors[box] = output.size
            output.add(cue)
            continue
        }
        val text = requireNotNull(cue.text)
        val boxParts = parts.getOrPut(anchor) { arrayListOf(requireNotNull(output[anchor].text)) }
        if (boxParts.none { it.contentEquals(text) }) boxParts.add(text)
    }
    for ((index, boxParts) in parts) {
        if (boxParts.size < 2) continue
        output[index] = output[index].buildUpon().setText(join(boxParts)).build()
    }
    return output
}

/** Keeps each part's spans, so italics and colours survive the join. */
private fun joinKeepingSpans(parts: List<CharSequence>): CharSequence {
    val builder = SpannableStringBuilder()
    parts.forEachIndexed { index, part ->
        if (index > 0) builder.append('\n')
        builder.append(part)
    }
    return builder
}

/** Every field of a text cue that decides where and how it paints, minus the text itself. */
private data class CueBox(
    val textAlignment: Layout.Alignment?,
    val multiRowAlignment: Layout.Alignment?,
    val line: Float,
    val lineType: Int,
    val lineAnchor: Int,
    val position: Float,
    val positionAnchor: Int,
    val size: Float,
    val windowColorSet: Boolean,
    val windowColor: Int,
    val textSizeType: Int,
    val textSize: Float,
    val shearDegrees: Float,
    val zIndex: Int,
) {
    companion object {
        /** Null for a cue that must never be joined with another. */
        fun of(cue: Cue): CueBox? {
            if (cue.bitmap != null || cue.verticalType != Cue.TYPE_UNSET) return null
            val text = cue.text
            if (text.isNullOrBlank()) return null
            return CueBox(
                textAlignment = cue.textAlignment,
                multiRowAlignment = cue.multiRowAlignment,
                line = cue.line,
                lineType = cue.lineType,
                lineAnchor = cue.lineAnchor,
                position = cue.position,
                positionAnchor = cue.positionAnchor,
                size = cue.size,
                windowColorSet = cue.windowColorSet,
                windowColor = cue.windowColor,
                textSizeType = cue.textSizeType,
                textSize = cue.textSize,
                shearDegrees = cue.shearDegrees,
                zIndex = cue.zIndex,
            )
        }
    }
}
