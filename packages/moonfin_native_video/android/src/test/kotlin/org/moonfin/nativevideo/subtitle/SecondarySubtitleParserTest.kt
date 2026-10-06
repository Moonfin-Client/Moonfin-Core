package org.moonfin.nativevideo.subtitle

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class SecondarySubtitleParserTest {
    @Test
    fun parsesSimpleSubRipAndUtf8Text() {
        val cues = SecondarySubtitleParser.parse(
            "1\n00:00:01,000 --> 00:00:02,500\nZażółć gęślą jaźń — acción\n",
            "srt",
        )

        assertEquals(listOf(TimedTextCue(1000, 2500, "Zażółć gęślą jaźń — acción")), cues)
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

        assertNull(timeline.activeTextAt(999))
        assertEquals("first", timeline.activeTextAt(1000))
        assertEquals("first\noverlap", timeline.activeTextAt(2500))
        assertEquals("overlap", timeline.activeTextAt(3000))
        assertNull(timeline.activeTextAt(4000))
        assertEquals("later", timeline.activeTextAt(5500))
        assertEquals("first", timeline.activeTextAt(1500)) // backward seek
    }

    @Test
    fun positiveAndNegativeDelayUseTheSameLaterOrEarlierCueConvention() {
        val timeline = SecondarySubtitleTimeline(listOf(TimedTextCue(1000, 2000, "cue")))

        assertEquals("cue", timeline.activeTextAtPlayerPosition(1500, 500))
        assertNull(timeline.activeTextAtPlayerPosition(1499, 500))
        assertNull(timeline.activeTextAtPlayerPosition(1000, 500))
        assertEquals("cue", timeline.activeTextAtPlayerPosition(1400, -500))
        assertNull(timeline.activeTextAtPlayerPosition(1500, -500))
        assertNull(timeline.activeTextAtPlayerPosition(2000, -500))
    }

    @Test
    fun positiveDelayDoesNotShowAZeroStartCueBeforeTheDelayExpires() {
        val timeline = SecondarySubtitleTimeline(listOf(TimedTextCue(0, 2000, "cue")))

        assertNull(timeline.activeTextAtPlayerPosition(999, 1000))
        assertEquals("cue", timeline.activeTextAtPlayerPosition(1000, 1000))
    }
}
