package org.moonfin.nativevideo

import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.Consumer
import androidx.media3.extractor.text.CuesWithTiming
import androidx.media3.extractor.text.SubtitleParser
import io.github.peerless2012.ass.media.AssHandler
import io.github.peerless2012.ass.media.type.AssRenderType
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class MoonfinAssParserFactoryTest {

    private val assHandler = AssHandler(AssRenderType.OVERLAY_CANVAS)
    private var parsedUnderLock: Boolean? = null

    private val lockProbe = object : SubtitleParser {
        override fun getCueReplacementBehavior(): Int = Format.CUE_REPLACEMENT_BEHAVIOR_MERGE

        override fun parse(
            data: ByteArray,
            offset: Int,
            length: Int,
            outputOptions: SubtitleParser.OutputOptions,
            output: Consumer<CuesWithTiming>,
        ) {
            parsedUnderLock = Thread.holdsLock(assHandler)
        }
    }

    private val factory = MoonfinAssParserFactory(
        object : SubtitleParser.Factory {
            override fun supportsFormat(format: Format): Boolean = true

            override fun getCueReplacementBehavior(format: Format): Int =
                Format.CUE_REPLACEMENT_BEHAVIOR_MERGE

            override fun create(format: Format): SubtitleParser = lockProbe
        },
        assHandler,
    )

    private fun parsesUnderLock(mimeType: String): Boolean {
        factory.create(Format.Builder().setSampleMimeType(mimeType).build())
            .parse(ByteArray(0), SubtitleParser.OutputOptions.allCues()) {}
        return parsedUnderLock!!
    }

    @Test
    fun `an ASS parse holds the libass lock`() {
        assertTrue(parsesUnderLock(MimeTypes.TEXT_SSA))
    }

    @Test
    fun `other formats parse without it`() {
        assertFalse(parsesUnderLock(MimeTypes.TEXT_VTT))
        assertFalse(parsesUnderLock(MimeTypes.APPLICATION_SUBRIP))
        assertFalse(parsesUnderLock(MimeTypes.APPLICATION_PGS))
    }
}
