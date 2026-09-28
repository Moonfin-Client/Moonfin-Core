package org.moonfin.nativevideo.subtitle

import androidx.media3.common.C
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.text.Cue
import androidx.media3.common.util.Consumer
import androidx.media3.common.util.UnstableApi
import androidx.media3.extractor.text.CuesWithTiming
import androidx.media3.extractor.text.SubtitleParser
import java.io.ByteArrayOutputStream

@UnstableApi
internal class SupAwareSubtitleParserFactory(
    private val delegate: SubtitleParser.Factory,
) : SubtitleParser.Factory {

    override fun supportsFormat(format: Format): Boolean = delegate.supportsFormat(format)

    override fun getCueReplacementBehavior(format: Format): Int =
        delegate.getCueReplacementBehavior(format)

    override fun create(format: Format): SubtitleParser {
        val parser = delegate.create(format)
        return if (format.sampleMimeType == MimeTypes.APPLICATION_PGS) SupSubtitleParser(parser) else parser
    }
}

/**
 * Media3's PGS parser takes one display set with no timing, the way Matroska
 * carries PGS. A `.sup` file strings every display set together and puts a
 * 13 byte header in front of each segment, the "PG" magic then a 90 kHz
 * presentation and decode time. This strips those headers and shows each
 * display set from its presentation time until the next one, which is how
 * PGS takes a picture down. Data without the magic is a sample from a
 * container and goes to the wrapped parser untouched.
 */
@UnstableApi
internal class SupSubtitleParser(private val delegate: SubtitleParser) : SubtitleParser {

    override fun getCueReplacementBehavior(): Int = delegate.cueReplacementBehavior

    override fun parse(
        data: ByteArray,
        offset: Int,
        length: Int,
        outputOptions: SubtitleParser.OutputOptions,
        output: Consumer<CuesWithTiming>,
    ) {
        if (!SupDisplaySets.isSup(data, offset, length)) {
            delegate.parse(data, offset, length, outputOptions, output)
            return
        }
        val displaySets = SupDisplaySets.split(data, offset, length)
        val timed = displaySets.mapIndexed { index, displaySet ->
            val nextTimeUs = displaySets.getOrNull(index + 1)?.timeUs
            val durationUs = if (nextTimeUs != null && nextTimeUs > displaySet.timeUs) {
                nextTimeUs - displaySet.timeUs
            } else {
                C.TIME_UNSET
            }
            var cues = emptyList<Cue>()
            delegate.parse(displaySet.data, SubtitleParser.OutputOptions.allCues()) { cues = it.cues }
            CuesWithTiming(cues, displaySet.timeUs, durationUs)
        }
        val startTimeUs = outputOptions.startTimeUs
        val (fromStart, beforeStart) = timed.partition {
            startTimeUs == C.TIME_UNSET || it.startTimeUs >= startTimeUs
        }
        fromStart.forEach(output::accept)
        if (outputOptions.outputAllCues) beforeStart.forEach(output::accept)
    }

    override fun reset() {
        delegate.reset()
    }
}

internal object SupDisplaySets {

    private const val HEADER_SIZE = 13
    private const val SEGMENT_PRESENTATION_COMPOSITION = 0x16
    private const val SEGMENT_END = 0x80

    class DisplaySet(val timeUs: Long, val data: ByteArray)

    fun isSup(data: ByteArray, offset: Int, length: Int): Boolean =
        length >= 2 && hasMagic(data, offset)

    /**
     * A segment that runs past the data, or a header without the magic, ends
     * the read and keeps the display sets before it.
     */
    fun split(data: ByteArray, offset: Int, length: Int): List<DisplaySet> {
        val displaySets = mutableListOf<DisplaySet>()
        val limit = offset + length
        var position = offset
        var current: ByteArrayOutputStream? = null
        var currentTimeUs = 0L
        while (position + HEADER_SIZE <= limit && hasMagic(data, position)) {
            val type = data[position + 10].toInt() and 0xFF
            val size = ((data[position + 11].toInt() and 0xFF) shl 8) or
                (data[position + 12].toInt() and 0xFF)
            val next = position + HEADER_SIZE + size
            if (next > limit) break
            if (type == SEGMENT_PRESENTATION_COMPOSITION) {
                current = ByteArrayOutputStream()
                currentTimeUs = readUnsignedInt(data, position + 2) * 100 / 9
            }
            current?.write(data, position + 10, 3 + size)
            if (type == SEGMENT_END && current != null) {
                displaySets += DisplaySet(currentTimeUs, current.toByteArray())
                current = null
            }
            position = next
        }
        return displaySets
    }

    private fun hasMagic(data: ByteArray, position: Int): Boolean =
        data[position] == 'P'.code.toByte() && data[position + 1] == 'G'.code.toByte()

    private fun readUnsignedInt(data: ByteArray, position: Int): Long =
        ((data[position].toLong() and 0xFF) shl 24) or
            ((data[position + 1].toLong() and 0xFF) shl 16) or
            ((data[position + 2].toLong() and 0xFF) shl 8) or
            (data[position + 3].toLong() and 0xFF)
}
