package org.moonfin.nativevideo.subtitle

import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Rect
import android.graphics.Typeface
import android.text.Html
import android.text.SpannableStringBuilder
import android.text.Spanned
import android.text.style.ForegroundColorSpan
import android.text.style.RelativeSizeSpan
import android.text.style.StyleSpan
import android.text.style.UnderlineSpan
import android.view.View
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.text.Cue
import androidx.media3.extractor.text.SubtitleParser
import androidx.media3.extractor.text.subrip.SubripParser
import androidx.media3.extractor.text.webvtt.WebvttParser
import androidx.media3.ui.SubtitleView
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
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
class SecondarySubtitleRenderingTest {
    private class Scene {
        val primary = SubtitleView(RuntimeEnvironment.getApplication())
        val secondary = SubtitleView(primary.context).apply { layout(0, 0, 1280, 720) }
        val overlay = SecondarySubtitleOverlay(secondary, primary).apply { select(true) }
        val main get() = displayedCues(primary)
        val caption get() = displayedCues(secondary).single()
        fun show(cues: List<Cue>, text: String = "Translation") {
            overlay.updatePrimaryCues(cues)
            overlay.updateCues(listOf(Cue.Builder().setText(text).build()))
        }
        fun style(offset: Float = 0f) = overlay.configureBaseStyle(
            Color.WHITE, Color.TRANSPARENT, Color.TRANSPARENT, 24f, 400, offset)
    }

    companion object {
        private fun displayedCues(view: SubtitleView): List<Cue> =
            (SubtitleView::class.java.getDeclaredField("cues").apply { isAccessible = true }
                .get(view) as List<*>).filterIsInstance<Cue>()
    }

    private fun cue(text: CharSequence, line: Float = Cue.DIMEN_UNSET,
                    anchor: Int = Cue.ANCHOR_TYPE_START) = Cue.Builder().setText(text).apply {
        if (line != Cue.DIMEN_UNSET) setLine(line, Cue.LINE_TYPE_FRACTION).setLineAnchor(anchor)
    }.build()

    private fun decode(parser: SubtitleParser, file: String): List<Cue> {
        val cues = mutableListOf<Cue>()
        val bytes = file.toByteArray(Charsets.UTF_8)
        parser.parse(bytes, 0, bytes.size, SubtitleParser.OutputOptions.allCues()) {
            cues.addAll(it.cues)
        }
        return cues
    }

    private fun Scene.configurePrimary(
        textSize: Float = 0.06f,
        offset: Float = 0.04f,
    ) = apply {
        primary.setFractionalTextSize(textSize)
        primary.setBottomPaddingFraction(offset)
        style(offset)
    }

    private fun Scene.bounds() = inkBounds(primary) to inkBounds(secondary)

    private fun inkBounds(view: SubtitleView): Rect {
        val bitmap = Bitmap.createBitmap(1280, 720, Bitmap.Config.ARGB_8888)
        view.measure(View.MeasureSpec.makeMeasureSpec(1280, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(720, View.MeasureSpec.EXACTLY))
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
    fun secondaryPreservesCenterLeftAndRightAnchorsForLatinAndArabic() {
        for ((text, position, anchor) in listOf(
            Triple("Short subtitle", 0.5f, Cue.ANCHOR_TYPE_MIDDLE),
            Triple("الترجمة العربية", 0.5f, Cue.ANCHOR_TYPE_MIDDLE),
            Triple("Left", 0.1f, Cue.ANCHOR_TYPE_START),
            Triple("Right", 0.9f, Cue.ANCHOR_TYPE_END),
        )) {
            val f = Scene()
            val primary = Cue.Builder().setText("Primary")
            if (anchor != Cue.ANCHOR_TYPE_MIDDLE) primary.setPosition(position).setPositionAnchor(anchor)
            f.show(listOf(primary.build()), text)
            val pixels = inkBounds(f.secondary)
            val edge = when (anchor) {
                Cue.ANCHOR_TYPE_START -> pixels.left.toFloat()
                Cue.ANCHOR_TYPE_END -> pixels.right.toFloat()
                else -> pixels.exactCenterX()
            }
            assertEquals(text, position * 1280, edge, 12f)
        }
    }

    @Test
    fun decodedSecondarySharesThePrimaryCueBox() {
        for (settings in listOf("", "position:5%,line-left size:90%", "position:95%,line-right size:90%")) {
            for (text in listOf("الترجمة العربية\nالسطر الثاني", "A translation\non two lines")) {
                val f = Scene()
                val primary = decode(WebvttParser(),
                    "WEBVTT\n\n00:00:00.000 --> 00:00:05.000 $settings\nPrimary\n")
                val secondary = decode(SubripParser(), "1\n00:00:00,000 --> 00:00:05,000\n$text\n")
                f.overlay.updatePrimaryCues(primary)
                f.overlay.updateCues(secondary)
                assertEquals(settings, inkBounds(f.primary).exactCenterX(),
                    inkBounds(f.secondary).exactCenterX(), 12f)
            }
        }
    }

    @Test
    fun srtAlignmentTagsUseTheSelectedEdgeMarginInEveryColumn() {
        val srt = Format.Builder().setSampleMimeType(MimeTypes.APPLICATION_SUBRIP).build()
        val extracted = srt.buildUpon().setSampleMimeType(MimeTypes.APPLICATION_MEDIA3_CUES)
            .setCodecs(MimeTypes.APPLICATION_SUBRIP).build()
        for (alignment in 1..9) {
            val authored = decode(SubripParser(),
                "1\n00:00:00,000 --> 00:00:05,000\n{\\an$alignment}<i>Primary</i>\n").single()
            val edge = primaryCueWithoutDefaultMargin(authored, srt)
            assertEquals(edge, primaryCueWithoutDefaultMargin(authored, extracted))
            for (mime in listOf(MimeTypes.TEXT_VTT, MimeTypes.TEXT_SSA)) {
                assertTrue(authored === primaryCueWithoutDefaultMargin(authored,
                    srt.buildUpon().setSampleMimeType(mime).build()))
            }
            if (alignment in 4..6) {
                assertTrue(authored === edge)
                continue
            }
            val top = alignment >= 7
            val f = Scene()
            for (offset in listOf(0f, 0.36f, 0f)) {
                f.style(offset)
                f.show(listOf(edge))
                val primary = f.main.single()
                assertEquals(if (top) offset else 1f - offset, primary.line, 0.0001f)
                assertEquals(authored.lineAnchor, primary.lineAnchor)
                assertEquals(authored.position, primary.position, 0.0001f)
                assertEquals(authored.positionAnchor, primary.positionAnchor)
                val main = inkBounds(f.primary)
                val second = inkBounds(f.secondary)
                assertTrue(if (top) second.top > main.bottom else second.bottom < main.top)
            }
        }
        val custom = cue("Custom", 0.17f)
        assertTrue(custom === primaryCueWithoutDefaultMargin(custom, srt))
    }

    @Test
    fun multilinePairRemainsVisibleAtMaximumOffsetsAndSpacing() {
        for ((offset, topAligned) in listOf(0.04f to false, 0.36f to false, 0.36f to true)) {
            val f = Scene().configurePrimary(offset = offset)
            val primary = if (offset == 0.04f) "Primary" else "First line\nSecond line"
            val secondary = if (offset == 0.04f) "One\nTwo\nThree" else "Translation one\nTranslation two"
            f.show(listOf(cue(primary, if (topAligned) 0f else Cue.DIMEN_UNSET)), secondary)
            for (spacing in listOf(0f, 0.02f, 0.04f, 0.06f)) {
                f.overlay.configureAppearance(if (offset == 0.04f) 36f else null, spacing)
                assertEquals(View.VISIBLE, f.secondary.visibility)
                val pixels = inkBounds(f.secondary)
                if (offset == 0.04f) assertTrue(pixels.top >= 360)
                val mainPixels = inkBounds(f.primary)
                if (topAligned) assertTrue(pixels.top > mainPixels.bottom)
                else assertTrue(pixels.bottom < mainPixels.top)
            }
        }
    }

    @Test
    fun assPrimaryUsesStableTopFallback() {
        val f = Scene().configurePrimary(offset = 0.04f)
        f.overlay.setPrimaryUsesTopFallback(true)
        f.show(emptyList(), "English translation")

        assertEquals(0.04f, f.caption.line, 0.0001f)
        assertEquals(Cue.ANCHOR_TYPE_START, f.caption.lineAnchor)
        assertEquals(0.5f, f.caption.position, 0.0001f)

        // Secondary Position remains a relative inward adjustment.
        f.overlay.configureAppearance(fontSize = null, verticalOffset = 0.06f)
        assertEquals(0.10f, f.caption.line, 0.0001f)

        // Returning to a text primary restores dynamic stacking.
        f.overlay.setPrimaryUsesTopFallback(false)
        f.show(listOf(cue("Primary")), "English translation")
        assertTrue(f.caption.line > 0.5f)
    }

    @Test
    fun assTopFallbackGivesWayOnlyWhileAssTextCoversIt() {
        val f = Scene().configurePrimary(offset = 0.04f)
        f.overlay.setPrimaryUsesTopFallback(true)
        f.show(emptyList(), "English translation")

        f.overlay.updatePrimaryInk(listOf(SubtitleBox(200f, 620f, 1080f, 700f)))
        assertEquals(0.04f, f.caption.line, 0.0001f)

        f.overlay.updatePrimaryInk(listOf(SubtitleBox(0f, 10f, 150f, 90f)))
        assertEquals(0.04f, f.caption.line, 0.0001f)

        f.overlay.updatePrimaryInk(listOf(SubtitleBox(300f, 10f, 980f, 90f)))
        assertTrue(inkBounds(f.secondary).top > 90)

        f.overlay.updatePrimaryInk(emptyList())
        assertEquals(0.04f, f.caption.line, 0.0001f)
    }

    @Test
    fun wrappedChinesePrimaryDoesNotOverlapTheSecondary() {
        val f = Scene().configurePrimary()
        f.show(listOf(cue("我们今天要一起讨论如何让中文字幕和英文翻译同时清晰地显示在屏幕上。")))

        val (primary, secondary) = f.bounds()
        assertTrue("The primary must wrap onto multiple lines", primary.height() > 70)
        assertTrue("The secondary must stay above the wrapped primary", secondary.bottom < primary.top)
    }

    @Test
    fun clippedTopLeftSrtLeavesRoomForAllRenderedLines() {
        // Media3 first lays out the full cue, then clips its right edge and
        // lays it out again. That second layout can wrap to an extra line.
        val text = "我们今天要讨论中文字幕在较窄的绘制区域换行后如何避开第二行字幕。".repeat(2).take(55)
        val parsed = decode(SubripParser(),
            "1\n00:00:00,000 --> 00:00:05,000\n{\\an7}$text\n")
        val f = Scene().configurePrimary()
        val format = Format.Builder().setSampleMimeType(MimeTypes.APPLICATION_SUBRIP).build()
        f.show(listOf(primaryCueWithoutDefaultMargin(parsed.single(), format)))
        val (primary, secondary) = f.bounds()
        assertTrue("Primary must wrap to multiple lines", primary.height() > 120)
        assertTrue("Secondary must follow the final drawn primary lines: $primary / $secondary",
            secondary.top > primary.bottom)
    }

    @Test
    fun viewportClampedVttPrimaryDoesNotOverlapSecondary() {
        val text = "我们今天要一起讨论如何让中文字幕和英文翻译同时清晰地显示在屏幕上。"
        for ((settings, topAligned) in listOf("line:95%" to false, "line:5%,end" to true)) {
            val parsed = decode(WebvttParser(),
                "WEBVTT\n\n00:00:00.000 --> 00:00:05.000 $settings\n$text\n")
            val f = Scene().configurePrimary()
            f.show(parsed, "English translation")

            val (primary, secondary) = f.bounds()
            assertTrue("Primary must wrap onto multiple lines", primary.height() > 70)
            assertEquals(if (topAligned) 0.09f else 0.91f, f.main.single().line, 0.0001f)
            assertEquals(parsed.single().lineAnchor, f.main.single().lineAnchor)
            assertTrue("Secondary must clear the clamped primary: $settings / $primary / $secondary",
                if (topAligned) secondary.top > primary.bottom else secondary.bottom < primary.top)
        }
    }

    @Test
    fun numberedWebVttLinesDoNotOverlapAtZeroOffset() {
        val text = "我们今天要一起讨论如何让中文字幕和英文翻译同时清晰地显示在屏幕上。"
        for (line in listOf(2, 3)) {
            val cues = decode(WebvttParser(),
                "WEBVTT\n\n00:00:00.000 --> 00:00:05.000 line:$line\n$text\n")
            val f = Scene().configurePrimary(offset = 0f)
            f.show(cues, "English translation")

            assertEquals(Cue.LINE_TYPE_NUMBER, f.main.single().lineType)
            val (primary, secondary) = f.bounds()
            assertTrue("Expected a multiline primary for line:$line", primary.height() > 70)
            assertTrue("Secondary must clear numbered line:$line ($primary / $secondary)",
                secondary.top > primary.bottom)
        }
    }

    @Test
    fun measuredHeightFollowsEmbeddedStyleAndFontSizePreferences() {
        val text = SpannableStringBuilder("我们今天要一起讨论如何让中文字幕和英文翻译同时清晰地显示在屏幕上。")
        text.setSpan(RelativeSizeSpan(1.5f), 0, text.length, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
        for ((styles, sizes) in listOf(true to true, true to false, false to true)) {
            val f = Scene()
            f.primary.setFractionalTextSize(0.06f)
            f.primary.setBottomPaddingFraction(0.04f)
            f.primary.setApplyEmbeddedStyles(styles)
            f.primary.setApplyEmbeddedFontSizes(sizes)
            f.overlay.configureBaseStyle(Color.WHITE, Color.TRANSPARENT, Color.TRANSPARENT,
                24f, 400, 0.04f, styles, sizes)
            f.show(listOf(cue(text)))

            val gap = inkBounds(f.primary).top - inkBounds(f.secondary).bottom
            assertTrue("Match the rendered height with styles=$styles, sizes=$sizes", gap in 1..64)
        }
    }

    @Test
    fun secondaryKeepsEmphasisInBothStackedAndPrimaryOffModes() {
        val f = Scene()
        val overlay = f.overlay
        val styled = Html.fromHtml(
            "<i>italic</i> <b>bold</b> <u>underlined</u> <font color='#ff0000'>red</font> <big>large</big>",
            Html.FROM_HTML_MODE_COMPACT,
        )
        val second = Html.fromHtml("<u>second line</u>", Html.FROM_HTML_MODE_COMPACT)
        overlay.updatePrimaryCues(listOf(Cue.Builder().setText("Primary").build()))
        overlay.updateCues(listOf(
            Cue.Builder().setText(styled).setWindowColor(Color.BLUE).build(),
            Cue.Builder().setText(second).build(),
        ))

        fun check(text: Spanned) {
            for ((word, style) in listOf("italic" to Typeface.ITALIC, "bold" to Typeface.BOLD)) {
                val at = text.indexOf(word)
                assertTrue(text.getSpans(at, at + word.length, StyleSpan::class.java)
                    .any { it.style and style != 0 })
            }
            for (word in listOf("underlined", "second line")) {
                val at = text.indexOf(word)
                assertTrue(text.getSpans(at, at + word.length, UnderlineSpan::class.java).isNotEmpty())
            }
            assertTrue(text.getSpans(0, text.length, ForegroundColorSpan::class.java).isEmpty())
            assertTrue(text.getSpans(0, text.length, RelativeSizeSpan::class.java).isEmpty())
        }
        check(f.caption.text as Spanned)
        assertFalse(f.caption.windowColorSet)
        overlay.setPrimaryEnabled(false)
        check(f.caption.text as Spanned)
    }

    @Test
    fun collapsedSecondaryRequestsCanRestoreOnlyTheStillActiveTrackCue() {
        val f = Scene()
        f.show(listOf(cue("Primary")), "Track A")
        assertEquals("Track A", f.caption.text.toString())

        // A -> Off -> A before native selection changes: hide while Off,
        // then restore the retained A cue when the selector reports A still active.
        f.overlay.select(false)
        assertTrue(displayedCues(f.secondary).isEmpty())
        f.overlay.select(true, restoreRetained = true)
        assertEquals("Track A", f.caption.text.toString())

        // A -> B hides A while B is pending. Returning to A can restore it
        // only when the native selector confirms A never stopped being active.
        f.overlay.select(true, restoreRetained = false)
        assertTrue(displayedCues(f.secondary).isEmpty())
        f.overlay.select(true, restoreRetained = true)
        assertEquals("Track A", f.caption.text.toString())

        // A real seek/delay invalidates the retained cue, so it can't return.
        f.overlay.clearSecondaryCues()
        f.overlay.select(false)
        f.overlay.select(true, restoreRetained = true)
        assertTrue(displayedCues(f.secondary).isEmpty())
    }

    @Test
    fun rendererOutputWhileHiddenReplacesTheRetainedSecondaryCue() {
        val f = Scene()
        f.show(listOf(cue("Primary")), "Track A")
        f.overlay.select(false)
        f.overlay.updateCues(listOf(cue("New active cue")))
        assertTrue(displayedCues(f.secondary).isEmpty())
        f.overlay.select(true, restoreRetained = true)
        assertEquals("New active cue", f.caption.text.toString())

        f.overlay.clear()
        f.overlay.select(true, restoreRetained = true)
        assertTrue(displayedCues(f.secondary).isEmpty())
    }

    @Test
    fun clearsDistinguishSecondaryDelayTrackChangeAndSeek() {
        for (action in listOf("secondary delay", "primary track", "seek")) {
            val f = Scene()
            f.show(listOf(cue("Primary", 0.1f)), "Old secondary")
            val primaryLine = f.main.single().line
            val oldLine = f.caption.line
            if (action == "secondary delay") {
                f.overlay.clearSecondaryCues()
                assertTrue(displayedCues(f.secondary).isEmpty())
                assertEquals(primaryLine, f.main.single().line, 0.0001f)
                assertEquals("Primary", f.main.single().text.toString())
            }
            f.overlay.updatePrimaryCues(emptyList())
            if (action == "primary track") {
                assertEquals(oldLine, f.caption.line, 0.0001f)
                f.overlay.resetPrimaryCues()
                assertEquals("Old secondary", f.caption.text.toString())
            } else if (action == "seek") {
                f.overlay.resetPrimaryCues(clearSecondary = true)
                assertTrue(displayedCues(f.secondary).isEmpty())
            }
            assertTrue(f.main.isEmpty())
            f.overlay.updateCues(listOf(cue("New secondary")))
            assertEquals("New secondary", f.caption.text.toString())
            if (action == "secondary delay") assertEquals(oldLine, f.caption.line, 0.0001f)
            else assertTrue(f.caption.line > oldLine + 0.2f)
        }
    }

    @Test
    fun bitmapPrimaryKeepsAuthoredGeometryAtMaximumOffsets() {
        val f = Scene()
        val bitmap = Bitmap.createBitmap(128, 64, Bitmap.Config.ARGB_8888)
        val authored = Cue.Builder().setBitmap(bitmap)
            .setPosition(0.5f).setPositionAnchor(Cue.ANCHOR_TYPE_MIDDLE)
            .setLine(0.5f, Cue.LINE_TYPE_FRACTION).setLineAnchor(Cue.ANCHOR_TYPE_MIDDLE)
            .setSize(0.4f).setBitmapHeight(0.2f).build()
        f.show(listOf(authored))
        f.style(0.36f)
        f.overlay.configureAppearance(null, 0.04f)
        assertEquals(authored, f.main.single())
        assertTrue(displayedCues(f.secondary).isNotEmpty())
    }

    @Test
    fun centeredPrimaryAvoidsUpperAndLowerObstaclesThroughDialogueGaps() {
        for ((center, obstacle) in listOf(0.40f to 0.46f, 0.50f to 0.37f)) {
            val f = Scene()
            f.style()
            val cues = listOf(cue("Center", center, Cue.ANCHOR_TYPE_MIDDLE), cue("Obstacle", obstacle))
            f.show(cues)
            val main = f.main
            if (obstacle > center) {
                assertEquals(Cue.ANCHOR_TYPE_MIDDLE, main[0].lineAnchor)
                assertEquals(center, main[0].line, 0.0001f)
                assertEquals(obstacle, main[1].line, 0.0001f)
            }
            val before = f.caption
            f.overlay.updatePrimaryCues(emptyList())
            assertTrue(f.main.isEmpty())
            assertEquals(before.line, f.caption.line, 0.0001f)
            assertEquals(before.lineAnchor, f.caption.lineAnchor)
            f.overlay.updatePrimaryCues(cues)
            assertEquals(main, f.main)
            assertEquals(before.line, f.caption.line, 0.0001f)
            assertEquals(before.lineAnchor, f.caption.lineAnchor)
        }
    }

    @Test
    fun appearanceChangesRemeasurePrimaryPlacementDuringDialogueGaps() {
        for ((line, anchor, shift) in listOf(
            Triple(0.08f, Cue.ANCHOR_TYPE_START, 0.32f),
            Triple(0.92f, Cue.ANCHOR_TYPE_END, -0.32f),
            // A wider gap around a centered primary is split evenly, so 0.04 of
            // spacing lifts the secondary by half of it.
            Triple(0.5f, Cue.ANCHOR_TYPE_MIDDLE, -0.02f),
            Triple(0f, Cue.ANCHOR_TYPE_START, 0.32f), Triple(-1f, Cue.ANCHOR_TYPE_END, -0.32f),
        )) {
            val f = Scene()
            val numbered = line <= 0f
            val authored = if (numbered) Cue.Builder().setText("Primary")
                .setLine(line, Cue.LINE_TYPE_NUMBER).build() else cue("Primary", line, anchor)
            f.style(0.04f)
            f.show(listOf(authored))
            if (numbered) {
                assertEquals(if (line == 0f) 0.04f else 0.96f, f.main.single().line, 0.0001f)
                assertTrue(authored === offsetPrimaryCue(authored, 0f, 0.06f))
            }
            f.overlay.updatePrimaryCues(emptyList())
            val previous = f.caption.line
            f.style(0.36f)
            if (anchor == Cue.ANCHOR_TYPE_MIDDLE) f.overlay.configureAppearance(null, 0.04f)
            assertTrue(f.main.isEmpty())
            val duringGap = f.caption.line
            assertEquals(previous + shift, duringGap, 0.0001f)
            f.overlay.updatePrimaryCues(listOf(authored))
            assertEquals(duringGap, f.caption.line, 0.0001f)
        }
    }

}
