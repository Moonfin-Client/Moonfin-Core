package org.moonfin.nativevideo.subtitle

import androidx.media3.common.C
import androidx.media3.common.Format
import androidx.media3.common.text.Cue
import androidx.media3.common.util.Consumer
import androidx.media3.extractor.text.CuesWithTiming
import androidx.media3.extractor.text.SubtitleParser
import java.io.ByteArrayOutputStream
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class SupSubtitleParserTest {

    private companion object {
        const val PCS = 0x16
        const val WDS = 0x17
        const val PDS = 0x14
        const val ODS = 0x15
        const val END = 0x80
    }

    /**
     * Stands in for Media3's PGS parser, which needs android.graphics to build
     * a cue. Records every display set it's handed and answers with one text
     * cue, or none for a display set with no object in it.
     */
    private class RecordingParser : SubtitleParser {
        val received = mutableListOf<ByteArray>()

        override fun getCueReplacementBehavior(): Int = Format.CUE_REPLACEMENT_BEHAVIOR_REPLACE

        override fun parse(
            data: ByteArray,
            offset: Int,
            length: Int,
            outputOptions: SubtitleParser.OutputOptions,
            output: Consumer<CuesWithTiming>,
        ) {
            val bytes = data.copyOfRange(offset, offset + length)
            received += bytes
            val hasObject = bytes.any { it.toInt() and 0xFF == ODS }
            val cues = if (hasObject) listOf(Cue.Builder().setText("cue").build()) else emptyList()
            output.accept(CuesWithTiming(cues, C.TIME_UNSET, C.TIME_UNSET))
        }
    }

    /** One `.sup` segment: the "PG" magic, a 90 kHz PTS, a zero DTS, then the segment itself. */
    private fun segment(pts: Long, type: Int, payload: ByteArray = ByteArray(0)): ByteArray {
        val out = ByteArrayOutputStream()
        out.write('P'.code)
        out.write('G'.code)
        for (shift in intArrayOf(24, 16, 8, 0)) out.write(((pts shr shift) and 0xFF).toInt())
        repeat(4) { out.write(0) }
        out.write(type)
        out.write(payload.size shr 8)
        out.write(payload.size and 0xFF)
        out.write(payload)
        return out.toByteArray()
    }

    /** The same segment the way a Matroska sample carries it, with no header. */
    private fun bare(type: Int, payload: ByteArray = ByteArray(0)): ByteArray =
        byteArrayOf(type.toByte(), (payload.size shr 8).toByte(), payload.size.toByte()) + payload

    private fun showing(pts: Long): ByteArray =
        segment(pts, PCS, ByteArray(19)) +
            segment(pts, WDS, ByteArray(10)) +
            segment(pts, PDS, ByteArray(7)) +
            segment(pts, ODS, ByteArray(11)) +
            segment(pts, END)

    private fun clearing(pts: Long): ByteArray = segment(pts, PCS, ByteArray(11)) + segment(pts, END)

    private fun parseAll(
        data: ByteArray,
        options: SubtitleParser.OutputOptions = SubtitleParser.OutputOptions.allCues(),
    ): Pair<RecordingParser, List<CuesWithTiming>> {
        val delegate = RecordingParser()
        val emitted = mutableListOf<CuesWithTiming>()
        SupSubtitleParser(delegate).parse(data, 0, data.size, options) { emitted += it }
        return delegate to emitted
    }

    @Test
    fun eachDisplaySetReachesThePgsParserWithoutItsHeaders() {
        val (delegate, _) = parseAll(showing(90_000) + clearing(180_000))

        assertEquals(2, delegate.received.size)
        assertArrayEquals(
            bare(PCS, ByteArray(19)) + bare(WDS, ByteArray(10)) + bare(PDS, ByteArray(7)) +
                bare(ODS, ByteArray(11)) + bare(END),
            delegate.received[0],
        )
        assertArrayEquals(bare(PCS, ByteArray(11)) + bare(END), delegate.received[1])
    }

    @Test
    fun aPictureShowsUntilTheDisplaySetThatTakesItDown() {
        val (_, emitted) = parseAll(showing(90_000) + clearing(270_000))

        assertEquals(2, emitted.size)
        assertEquals(1_000_000L, emitted[0].startTimeUs)
        assertEquals(2_000_000L, emitted[0].durationUs)
        assertEquals(1, emitted[0].cues.size)
        assertEquals(3_000_000L, emitted[1].startTimeUs)
        assertTrue(emitted[1].cues.isEmpty())
        assertEquals(C.TIME_UNSET, emitted[1].durationUs)
    }

    @Test
    fun aContainerSampleGoesToThePgsParserUntouched() {
        val sample = bare(PCS, ByteArray(19)) + bare(ODS, ByteArray(11)) + bare(END)

        val (delegate, emitted) = parseAll(sample)

        assertEquals(1, delegate.received.size)
        assertArrayEquals(sample, delegate.received[0])
        assertEquals(C.TIME_UNSET, emitted.single().startTimeUs)
    }

    @Test
    fun cuesFromTheSeekPointComeFirstThenTheRest() {
        val data = showing(90_000) + showing(180_000) + showing(270_000)

        val (_, emitted) = parseAll(
            data,
            SubtitleParser.OutputOptions.cuesAfterThenRemainingCuesBefore(2_000_000),
        )

        assertEquals(listOf(2_000_000L, 3_000_000L, 1_000_000L), emitted.map { it.startTimeUs })
    }

    @Test
    fun onlyCuesAfterDropsTheEarlierOnes() {
        val data = showing(90_000) + showing(180_000) + showing(270_000)

        val (_, emitted) = parseAll(data, SubtitleParser.OutputOptions.onlyCuesAfter(2_000_000))

        assertEquals(listOf(2_000_000L, 3_000_000L), emitted.map { it.startTimeUs })
    }

    @Test
    fun aTruncatedSegmentKeepsTheDisplaySetsBeforeIt() {
        val whole = showing(90_000) + clearing(180_000)
        val data = whole + showing(270_000).copyOf(20)

        val (_, emitted) = parseAll(data)

        assertEquals(listOf(1_000_000L, 2_000_000L), emitted.map { it.startTimeUs })
    }

    @Test
    fun aPresentationTimePastTwoToThe31stStaysPositive() {
        val (_, emitted) = parseAll(showing(0x9000_0000L))

        assertEquals(0x9000_0000L * 100 / 9, emitted.single().startTimeUs)
    }
}
