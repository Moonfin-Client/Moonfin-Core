package org.moonfin.nativevideo.subtitle

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class SecondarySubtitleParserTest {
    @Test
    fun parsesSimpleSubRipAndUtf8Text() {
        val cues = SecondarySubtitleParser.parse(
            "1\n00:00:01,000 --> 00:00:02,500\nZażółć gęślą jaźń, acción\n",
            "srt",
        )

        assertEquals(listOf(TimedTextCue(1000, 2500, "Zażółć gęślą jaźń, acción")), cues)
    }

    @Test
    fun parsesMultilineSubRipWithCrLf() {
        val cues = SecondarySubtitleParser.parse(
            "1\r\n00:00:01,250 --> 00:00:03,000\r\nFirst line\r\nSecond line\r\n\r\n",
            "subrip",
        )

        assertEquals("First line\nSecond line", cues.single().text)
        assertEquals(1250L, cues.single().startMs)
        assertEquals(3000L, cues.single().endMs)
    }

    @Test
    fun parsesWebVttHeaderAndMultilineCue() {
        val cues = SecondarySubtitleParser.parse(
            "WEBVTT\n\nNOTE sample\nignored\n\n00:01.500 --> 00:03.000 align:center\nHello\nthere\n",
            "webvtt",
        )

        assertEquals(
            listOf(TimedTextCue(1500, 3000, "Hello\nthere", alignment = "center")),
            cues,
        )
    }

    @Test
    fun parsesWebVttCuePositionSettings() {
        val cue = SecondarySubtitleParser.parse(
            "WEBVTT\n\n00:01.000 --> 00:03.000 line:72% position:35%,line-right size:60% align:start\nPlaced\n",
            "vtt",
        ).single()

        assertEquals(0.72f, cue.line)
        assertEquals(0, cue.lineAnchor)
        assertEquals(0.35f, cue.position)
        assertEquals(2, cue.positionAnchor)
        assertEquals(0.6f, cue.size)
        assertEquals("start", cue.alignment)
    }

    @Test
    fun parsesWebVttLongMinuteTimestampsWithoutHours() {
        val cues = SecondarySubtitleParser.parse(
            "WEBVTT\n\n75:20.000 --> 75:22.500\nAfter one hour\n",
            "webvtt",
        )

        assertEquals(listOf(TimedTextCue(4_520_000, 4_522_500, "After one hour")), cues)
    }

    @Test
    fun parsesWebVttTimestampsAtOneHundredMinutes() {
        val cues = SecondarySubtitleParser.parse(
            "WEBVTT\n\n100:00.000 --> 100:02.500\nAfter one hundred minutes\n",
            "webvtt",
        )

        assertEquals(
            listOf(TimedTextCue(6_000_000, 6_002_500, "After one hundred minutes")),
            cues,
        )
    }

    @Test
    fun stripsBasicSrtAndWebVttMarkupWithoutLosingTheText() {
        val cues = SecondarySubtitleParser.parse(
            "WEBVTT\n\n00:01.000 --> 00:02.000\n<i>Look &amp; listen</i>\n",
            "vtt",
        )

        assertEquals("Look & listen", cues.single().text)
    }

    @Test
    fun parsesAssAlignmentEmbeddedInSubRipAndRemovesOnlyOverrideBlocks() {
        val cue = SecondarySubtitleParser.parse(
            "1\n00:12:08,750 --> 00:12:11,041\n{\\an8}Faza pierwsza: zwinąć kluczyk. {śmiech}\n",
            "srt",
        ).single()

        assertEquals("Faza pierwsza: zwinąć kluczyk. {śmiech}", cue.text)
        assertEquals(0.08f, cue.line)
        assertEquals(0, cue.lineAnchor)
        assertEquals(0.5f, cue.position)
        assertEquals(1, cue.positionAnchor)
        assertEquals("center", cue.alignment)
    }

    @Test
    fun parsesAllAssAlignmentRowsAndColumns() {
        val expected = listOf(
            Triple(0.92f, 0.08f, "left"),
            Triple(0.92f, 0.5f, "center"),
            Triple(0.92f, 0.92f, "right"),
            Triple(0.5f, 0.08f, "left"),
            Triple(0.5f, 0.5f, "center"),
            Triple(0.5f, 0.92f, "right"),
            Triple(0.08f, 0.08f, "left"),
            Triple(0.08f, 0.5f, "center"),
            Triple(0.08f, 0.92f, "right"),
        )

        expected.forEachIndexed { index, (line, position, alignment) ->
            val cue = SecondarySubtitleParser.parse(
                "1\n00:00:01,000 --> 00:00:02,000\n{\\an${index + 1}}Caption\n",
                "srt",
            ).single()
            assertEquals("alignment ${index + 1} line", line, cue.line)
            assertEquals("alignment ${index + 1} position", position, cue.position)
            assertEquals("alignment ${index + 1} text alignment", alignment, cue.alignment)
            assertEquals("Caption", cue.text)
        }
    }

    @Test
    fun stripsAssColorBlocksThatStartWithDigitsAndStillReadsAlignment() {
        val cue = SecondarySubtitleParser.parse(
            "1\n00:00:01,000 --> 00:00:02,000\n" +
                "{\\1c&H00FFFF&\\an8}Caption{\\1a&H80&} {śmiech}\n",
            "srt",
        ).single()

        assertEquals("Caption {śmiech}", cue.text)
        assertEquals(0.08f, cue.line)
        assertEquals("center", cue.alignment)
    }

    @Test
    fun parsesWebVttLineAlignmentWithComma() {
        val cues = SecondarySubtitleParser.parse(
            "WEBVTT\n\n" +
                "00:01.000 --> 00:02.000 line:10%,start\nTop\n\n" +
                "00:02.000 --> 00:03.000 line:50%,center\nMiddle\n\n" +
                "00:03.000 --> 00:04.000 line:90%,end\nBottom\n",
            "vtt",
        )

        assertEquals(listOf(0.1f, 0.5f, 0.9f), cues.map { it.line })
        assertEquals(listOf(0, 1, 2), cues.map { it.lineAnchor })
        assertEquals(listOf(0, 0, 0), cues.map { it.lineType })
    }

    @Test
    fun removesOtherAssOverrideBlocksAndExplicitWebVttPositionWins() {
        val cue = SecondarySubtitleParser.parse(
            "WEBVTT\n\n00:01.000 --> 00:02.000 line:20% position:30%,line-left align:start\n" +
                "{\\i1\\an8}Placed{\\i0}\n",
            "vtt",
        ).single()

        assertEquals("Placed", cue.text)
        assertEquals(0.2f, cue.line)
        assertEquals(0, cue.lineAnchor)
        assertEquals(0.3f, cue.position)
        assertEquals(0, cue.positionAnchor)
        assertEquals("start", cue.alignment)
    }

    @Test
    fun malformedEntriesAreSkippedAndRemainingCuesAreOrdered() {
        val cues = SecondarySubtitleParser.parse(
            "bad\n00:00:04,000 --> 00:00:03,000\nreversed\n\n" +
                "2\n00:00:05,000 --> 00:00:06,000\nlater\n\n" +
                "1\n00:00:01,000 --> 00:00:02,000\nearlier\n",
            "srt",
        )

        assertEquals(listOf("earlier", "later"), cues.map { it.text })
    }

    @Test
    fun emptySubtitleFileHasNoCues() {
        assertEquals(emptyList<TimedTextCue>(), SecondarySubtitleParser.parse("", "srt"))
    }

    @Test
    fun timelineIncludesStartExcludesEndAndHandlesOverlapsAndSeeks() {
        val timeline = SecondarySubtitleTimeline(
            listOf(
                TimedTextCue(1000, 3000, "first"),
                TimedTextCue(2000, 4000, "overlap"),
                TimedTextCue(5000, 6000, "later"),
            ),
        )

        assertEquals(emptyList<String>(), timeline.textsAt(999))
        assertEquals(listOf("first"), timeline.textsAt(1000))
        assertEquals(listOf("first", "overlap"), timeline.textsAt(2500))
        assertEquals(listOf("overlap"), timeline.textsAt(3000))
        assertEquals(emptyList<String>(), timeline.textsAt(4000))
        assertEquals(listOf("later"), timeline.textsAt(5500))
        assertEquals(listOf("first"), timeline.textsAt(1500)) // backward seek
    }

    @Test
    fun positiveAndNegativeDelayUseTheSameLaterOrEarlierCueConvention() {
        val timeline = SecondarySubtitleTimeline(listOf(TimedTextCue(1000, 2000, "cue")))

        assertEquals(listOf("cue"), timeline.textsAt(1500, 500))
        assertEquals(emptyList<String>(), timeline.textsAt(1499, 500))
        assertEquals(emptyList<String>(), timeline.textsAt(1000, 500))
        assertEquals(listOf("cue"), timeline.textsAt(1400, -500))
        assertEquals(emptyList<String>(), timeline.textsAt(1500, -500))
        assertEquals(emptyList<String>(), timeline.textsAt(2000, -500))
    }

    @Test
    fun positiveDelayDoesNotShowAZeroStartCueBeforeTheDelayExpires() {
        val timeline = SecondarySubtitleTimeline(listOf(TimedTextCue(0, 2000, "cue")))

        assertEquals(emptyList<String>(), timeline.textsAt(999, 1000))
        assertEquals(listOf("cue"), timeline.textsAt(1000, 1000))
    }

    @Test
    fun acceptsLooseSubRipTimestamps() {
        val cues = SecondarySubtitleParser.parse(
            "1\n00:00:01,000-->00:00:02,000\nTight\n\n" +
                "2\n00:00:03 --> 00:00:04\nNo fraction\n\n" +
                "3\n00:00:05,1234 --> 00:00:06,5\nOdd fraction\n",
            "srt",
        )

        assertEquals(
            listOf(1000L to 2000L, 3000L to 4000L, 5123L to 6500L),
            cues.map { it.startMs to it.endMs },
        )
    }

    @Test
    fun splitsCuesThatSkipTheBlankLine() {
        val cues = SecondarySubtitleParser.parse(
            "1\n00:00:01,000 --> 00:00:02,000\nFirst\n" +
                "2\n00:00:03,000 --> 00:00:04,000\nSecond\n",
            "srt",
        )

        assertEquals(listOf("First", "Second"), cues.map { it.text })
    }

    @Test
    fun turnsAssLineBreaksIntoNewlinesAndKeepsTagsToOneLine() {
        val cues = SecondarySubtitleParser.parse(
            "1\n00:00:01,000 --> 00:00:02,000\nOne\\Ntwo\nI <3 you\n-> go\n",
            "srt",
        )

        assertEquals("One\ntwo\nI <3 you\n-> go", cues.single().text)
    }

    @Test
    fun decodesByByteOrderMarkThenUtf8ThenWindows1252() {
        val text = "Zażółć"
        assertEquals(
            text,
            SecondarySubtitleParser.decode(
                byteArrayOf(0xEF.toByte(), 0xBB.toByte(), 0xBF.toByte()) +
                    text.toByteArray(Charsets.UTF_8),
            ),
        )
        assertEquals(
            text,
            SecondarySubtitleParser.decode(
                byteArrayOf(0xFF.toByte(), 0xFE.toByte()) + text.toByteArray(Charsets.UTF_16LE),
            ),
        )
        assertEquals(
            text,
            SecondarySubtitleParser.decode(
                byteArrayOf(0xFE.toByte(), 0xFF.toByte()) + text.toByteArray(Charsets.UTF_16BE),
            ),
        )
        assertEquals(text, SecondarySubtitleParser.decode(text.toByteArray(Charsets.UTF_8)))
        assertEquals(
            "caf\u00e9",
            SecondarySubtitleParser.decode("caf\u00e9".toByteArray(charset("windows-1252"))),
        )
    }

    @Test
    fun nextChangeIsTheNearestStartOrEndInPlayerTime() {
        val timeline = SecondarySubtitleTimeline(
            listOf(TimedTextCue(1000, 3000, "a"), TimedTextCue(2000, 2500, "b")),
        )

        assertEquals(1000L, timeline.nextChangeAt(0, 0))
        assertEquals(2000L, timeline.nextChangeAt(1500, 0))
        assertEquals(2500L, timeline.nextChangeAt(2100, 0))
        assertEquals(3000L, timeline.nextChangeAt(2600, 0))
        assertNull(timeline.nextChangeAt(3000, 0))
        assertEquals(1500L, timeline.nextChangeAt(0, 500))
    }

    private fun SecondarySubtitleTimeline.textsAt(playerPositionMs: Long, delayMs: Long = 0L) =
        activeCuesAtPlayerPosition(playerPositionMs, delayMs).map { it.text }
}
