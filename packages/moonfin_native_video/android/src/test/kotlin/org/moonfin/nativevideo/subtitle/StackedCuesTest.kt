package org.moonfin.nativevideo.subtitle

import androidx.media3.common.text.Cue
import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Test

class StackedCuesTest {

    // Cue.equals goes through TextUtils, which the JVM stubs throw on, so the
    // joiner is a plain string join and assertions read fields directly.
    private val join: (List<CharSequence>) -> CharSequence = { it.joinToString("\n") }

    /** What SubripParser builds for a cue with no `{\an}` tag. */
    private fun plain(text: String): Cue = Cue.Builder().setText(text).build()

    /** What SubripParser builds for an `{\an8}` cue, top centre. */
    private fun topCentre(text: String): Cue = Cue.Builder()
        .setText(text)
        .setPositionAnchor(Cue.ANCHOR_TYPE_MIDDLE)
        .setLineAnchor(Cue.ANCHOR_TYPE_START)
        .setPosition(0.5f)
        .setLine(0f, Cue.LINE_TYPE_FRACTION)
        .build()

    private fun texts(cues: List<Cue>): List<String> = cues.map { it.text.toString() }

    @Test
    fun twoPlainCuesBecomeOneInDeliveredOrder() {
        val result = joinStackedCues(
            listOf(plain("Does he even remember you?"), plain("Thank you for your kindness.")),
            join,
        )

        assertEquals(listOf("Does he even remember you?\nThank you for your kindness."), texts(result))
    }

    @Test
    fun joinedCueKeepsTheLayoutOfItsFirstPart() {
        val result = joinStackedCues(listOf(plain("a"), plain("b")), join)

        val joined = result.single()
        assertEquals(Cue.DIMEN_UNSET, joined.line)
        assertEquals(Cue.DIMEN_UNSET, joined.position)
        assertEquals(Cue.TYPE_UNSET, joined.lineType)
        assertEquals(Cue.TYPE_UNSET, joined.verticalType)
        assertEquals(null, joined.bitmap)
    }

    @Test
    fun threeCuesJoinInOrder() {
        val result = joinStackedCues(listOf(plain("a"), plain("b"), plain("c")), join)

        assertEquals(listOf("a\nb\nc"), texts(result))
    }

    @Test
    fun singleCueListIsReturnedAsIs() {
        val cues = listOf(plain("a"))

        assertSame(cues, joinStackedCues(cues, join))
    }

    @Test
    fun emptyListIsReturnedAsIs() {
        val cues = emptyList<Cue>()

        assertSame(cues, joinStackedCues(cues, join))
    }

    @Test
    fun cuesInDifferentBoxesStayApart() {
        val bottom = plain("bottom")
        val top = topCentre("top")

        val result = joinStackedCues(listOf(bottom, top), join)

        assertEquals(2, result.size)
        assertSame(bottom, result[0])
        assertSame(top, result[1])
    }

    @Test
    fun placedCuesSharingABoxJoinToo() {
        val result = joinStackedCues(listOf(topCentre("a"), topCentre("b")), join)

        val joined = result.single()
        assertEquals("a\nb", joined.text.toString())
        assertEquals(0f, joined.line)
        assertEquals(Cue.LINE_TYPE_FRACTION, joined.lineType)
        assertEquals(Cue.ANCHOR_TYPE_START, joined.lineAnchor)
        assertEquals(0.5f, joined.position)
        assertEquals(Cue.ANCHOR_TYPE_MIDDLE, joined.positionAnchor)
    }

    @Test
    fun boxesAreJoinedIndependentlyAndKeepFirstAppearanceOrder() {
        val result = joinStackedCues(
            listOf(plain("b1"), topCentre("t1"), plain("b2"), topCentre("t2")),
            join,
        )

        assertEquals(listOf("b1\nb2", "t1\nt2"), texts(result))
    }

    @Test
    fun verticalTextIsLeftAlone() {
        val vertical = Cue.Builder().setText("縦").setVerticalType(Cue.VERTICAL_TYPE_RL).build()
        val other = Cue.Builder().setText("縦").setVerticalType(Cue.VERTICAL_TYPE_RL).build()

        val result = joinStackedCues(listOf(vertical, other), join)

        assertEquals(2, result.size)
        assertSame(vertical, result[0])
        assertSame(other, result[1])
    }

    @Test
    fun blankCuesPassThroughInPlace() {
        val blank = plain(" ")

        val result = joinStackedCues(listOf(plain("a"), blank, plain("b")), join)

        assertEquals(listOf("a\nb", " "), texts(result))
        assertSame(blank, result[1])
    }

    @Test
    fun repeatedTextInOneBoxShowsOnce() {
        val first = plain("Thank you for your kindness.")

        val result = joinStackedCues(listOf(first, plain("Thank you for your kindness.")), join)

        assertSame(first, result.single())
    }

    @Test
    fun repeatedTextIsDroppedButOtherPartsStillJoin() {
        val result = joinStackedCues(listOf(plain("a"), plain("a"), plain("b")), join)

        assertEquals(listOf("a\nb"), texts(result))
    }

    @Test
    fun differentTextSizeIsADifferentBox() {
        val normal = plain("a")
        val large = Cue.Builder().setText("b").setTextSize(2f, Cue.TEXT_SIZE_TYPE_FRACTIONAL).build()

        val result = joinStackedCues(listOf(normal, large), join)

        assertEquals(2, result.size)
        assertSame(normal, result[0])
        assertSame(large, result[1])
    }

    @Test
    fun windowColourIsPartOfTheBox() {
        val bare = plain("a")
        val boxed = Cue.Builder().setText("b").setWindowColor(0xFF000000.toInt()).build()

        val result = joinStackedCues(listOf(bare, boxed), join)

        assertEquals(2, result.size)
        assertSame(bare, result[0])
        assertSame(boxed, result[1])
    }
}
