package org.moonfin.nativevideo

import androidx.annotation.OptIn
import androidx.media3.common.C
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.ParsableByteArray
import androidx.media3.common.util.UnstableApi
import androidx.media3.common.util.Util
import androidx.media3.extractor.ExtractorInput
import androidx.media3.extractor.ExtractorOutput
import androidx.media3.extractor.ExtractorsFactory
import androidx.media3.extractor.TrackOutput
import androidx.media3.extractor.mkv.EbmlProcessor
import androidx.media3.extractor.mkv.MatroskaExtractor
import androidx.media3.extractor.text.SubtitleParser
import io.github.peerless2012.ass.media.AssHandler
import io.github.peerless2012.ass.media.parser.AssSubtitleParserFactory
import io.github.peerless2012.ass.media.type.AssRenderType
import java.util.regex.Pattern

/**
 * The Matroska extractor with Moonfin additions on top of media3's.
 *
 * It captures Dolby Vision block additions. A dual layer profile 7 MKV keeps
 * its enhancement layer and RPU in BlockAdditional elements, which the stock
 * extractor discards, so without this hook the DoVi compat chain never sees
 * an RPU to convert in those files.
 *
 * It tolerates zlib compressed PGS subtitle tracks. The stock extractor
 * rejects the whole file over any compression other than header stripping,
 * even though media3's own PGS parser inflates zlib samples on its own, so
 * those tracks are waved through and the parser downstream does the rest.
 *
 * It also carries the ASS attachment and dialogue handling from ass-media's
 * AssMatroskaExtractor. That class is final and this subclass needs the same
 * seat, so its behavior lives here instead, kept line for line where possible
 * so library updates stay easy to mirror.
 */
@UnstableApi
class MoonfinMatroskaExtractor(
    subtitleParserFactory: SubtitleParser.Factory,
    private val assHandler: AssHandler,
) : MatroskaExtractor(subtitleParserFactory) {

    /**
     * Receives the raw bytes of every block addition on a Dolby Vision video
     * track, along with the track number its output was created with and the
     * NAL length field size its samples use. The buffer is reused between
     * calls, so the listener has to consume it before returning.
     */
    var doviBlockAdditionalListener:
        ((trackNumber: Int, nalLengthFieldSize: Int, data: ByteArray, length: Int) -> Unit)? = null

    private var doviBlockAdditional = ByteArray(0)

    private var currentAttachmentName: String? = null
    private var currentAttachmentMime: String? = null

    internal val subtitleSample = subtitleSampleField.get(this) as ParsableByteArray

    override fun handleBlockAdditionalData(
        track: Track,
        blockAdditionalId: Int,
        input: ExtractorInput,
        contentSize: Int,
    ) {
        val listener = doviBlockAdditionalListener
        // Only a track that declared a Dolby Vision configuration carries an
        // enhancement layer worth reading. Kotlin treats the field as never
        // null, so the nullable local is what keeps the check.
        val dolbyVisionConfig: ByteArray? = track.dolbyVisionConfigBytes
        if (listener == null ||
            track.type != C.TRACK_TYPE_VIDEO ||
            dolbyVisionConfig == null
        ) {
            super.handleBlockAdditionalData(track, blockAdditionalId, input, contentSize)
            return
        }
        if (doviBlockAdditional.size < contentSize) {
            doviBlockAdditional = ByteArray(contentSize)
        }
        input.readFully(doviBlockAdditional, 0, contentSize)
        listener(track.number, track.nalUnitLengthFieldLength, doviBlockAdditional, contentSize)
    }

    override fun integerElement(id: Int, value: Long) {
        // Only PGS gets waved through. Every other track type keeps the
        // stock rejection, since nothing downstream could decompress it.
        if (id == ID_CONTENT_COMPRESSION_ALGORITHM &&
            value == CONTENT_COMP_ALGO_ZLIB &&
            getCurrentTrack(id).codecId == CODEC_ID_PGS
        ) {
            return
        }
        super.integerElement(id, value)
    }

    override fun getElementType(id: Int): Int {
        return when (id) {
            ID_ATTACHMENTS -> EbmlProcessor.ELEMENT_TYPE_MASTER
            ID_ATTACHED_FILE -> EbmlProcessor.ELEMENT_TYPE_MASTER
            ID_FILE_NAME -> EbmlProcessor.ELEMENT_TYPE_STRING
            ID_FILE_MIME_TYPE -> EbmlProcessor.ELEMENT_TYPE_STRING
            ID_FILE_DATA -> EbmlProcessor.ELEMENT_TYPE_BINARY
            else -> super.getElementType(id)
        }
    }

    override fun isLevel1Element(id: Int): Boolean {
        return super.isLevel1Element(id) || id == ID_ATTACHMENTS
    }

    override fun startMasterElement(id: Int, contentPosition: Long, contentSize: Long) {
        when (id) {
            ID_EBML -> {
                if (assHandler.renderType != AssRenderType.CUES) {
                    val currentOutput = extractorOutputField.get(this) as ExtractorOutput
                    if (currentOutput !is AssDialogueExtractorOutput) {
                        extractorOutputField.set(
                            this,
                            AssDialogueExtractorOutput(currentOutput, assHandler, this),
                        )
                    }
                }
                super.startMasterElement(id, contentPosition, contentSize)
            }
            ID_ATTACHED_FILE -> clearAttachment()
            else -> super.startMasterElement(id, contentPosition, contentSize)
        }
    }

    override fun endMasterElement(id: Int) {
        when (id) {
            ID_VIDEO -> {
                // The overlay renderer needs the video dimensions very early.
                val track = getCurrentTrack(id)
                assHandler.setVideoSize(track.width, track.height)
                super.endMasterElement(id)
            }
            ID_ATTACHED_FILE -> clearAttachment()
            else -> super.endMasterElement(id)
        }
    }

    override fun stringElement(id: Int, value: String) {
        when (id) {
            ID_FILE_NAME -> currentAttachmentName = value
            ID_FILE_MIME_TYPE -> currentAttachmentMime = value
            else -> super.stringElement(id, value)
        }
    }

    override fun binaryElement(id: Int, contentSize: Int, input: ExtractorInput) {
        when (id) {
            ID_FILE_DATA -> {
                val attachmentName = requireNotNull(currentAttachmentName)
                val attachmentMime = requireNotNull(currentAttachmentMime)

                if (attachmentMime in fontMimeTypes) {
                    val data = ByteArray(contentSize)
                    input.readFully(data, 0, contentSize)
                    assHandler.addFont(attachmentName, data)
                } else {
                    input.skipFully(contentSize)
                }
            }
            else -> super.binaryElement(id, contentSize, input)
        }
    }

    private fun clearAttachment() {
        currentAttachmentName = null
        currentAttachmentMime = null
    }

    companion object {
        const val ID_CONTENT_COMPRESSION_ALGORITHM = 0x4254
        const val CONTENT_COMP_ALGO_ZLIB = 0L
        const val CODEC_ID_PGS = "S_HDMV/PGS"

        const val ID_EBML = 0x1A45DFA3
        const val ID_VIDEO = 0xE0
        const val ID_ATTACHMENTS = 0x1941A469
        const val ID_ATTACHED_FILE = 0x61A7
        const val ID_FILE_NAME = 0x466E
        const val ID_FILE_MIME_TYPE = 0x4660
        const val ID_FILE_DATA = 0x465C

        val fontMimeTypes = listOf(
            "font/ttf",
            "font/otf",
            "font/sfnt",
            "font/woff",
            "font/woff2",
            "application/font-sfnt",
            "application/font-woff",
            "application/x-truetype-font",
            "application/vnd.ms-opentype",
            "application/x-font-ttf",
        )

        val extractorOutputField =
            MatroskaExtractor::class.java.getDeclaredField("extractorOutput").apply {
                isAccessible = true
            }
        val subtitleSampleField =
            MatroskaExtractor::class.java.getDeclaredField("subtitleSample").apply {
                isAccessible = true
            }
    }
}

/** Swaps media3's Matroska extractor for [MoonfinMatroskaExtractor]. */
@OptIn(UnstableApi::class)
fun ExtractorsFactory.withMoonfinMkvSupport(
    assSubtitleParserFactory: AssSubtitleParserFactory,
    assHandler: AssHandler,
): ExtractorsFactory {
    return ExtractorsFactory {
        val extractors = createExtractors()
        extractors.forEachIndexed { index, extractor ->
            if (extractor is MatroskaExtractor) {
                // Must keep the extractor order.
                extractors[index] = MoonfinMatroskaExtractor(assSubtitleParserFactory, assHandler)
            }
        }
        extractors
    }
}

/**
 * Feeds ASS dialogue lines to the overlay renderer as they are extracted.
 * Same behavior as ass-media's AssSubtitleExtractorOutput, retyped to the
 * extractor above.
 */
@UnstableApi
private class AssDialogueExtractorOutput(
    private val delegate: ExtractorOutput,
    private val assHandler: AssHandler,
    private val extractor: MoonfinMatroskaExtractor,
) : ExtractorOutput by delegate {
    override fun track(id: Int, type: Int): TrackOutput {
        return if (type == C.TRACK_TYPE_TEXT) {
            // Whether the subtitle track is ASS is unknown at this point, so
            // every subtitle track gets wrapped.
            AssDialogueTrackOutput(delegate.track(id, type), assHandler, extractor)
        } else {
            delegate.track(id, type)
        }
    }
}

/**
 * Reads the timing and dialogue out of each ASS sample for the overlay
 * renderer. Same behavior as ass-media's AssTrackOutput, retyped to the
 * extractor above.
 */
@UnstableApi
private class AssDialogueTrackOutput(
    private val delegate: TrackOutput,
    private val assHandler: AssHandler,
    private val extractor: MoonfinMatroskaExtractor,
) : TrackOutput by delegate {

    private var isAss = false

    private var trackId: String? = null

    override fun format(format: Format) {
        if (format.sampleMimeType == MimeTypes.TEXT_SSA || format.codecs == MimeTypes.TEXT_SSA) {
            isAss = true
            trackId = format.id
        }
        delegate.format(format)
    }

    override fun sampleMetadata(
        timeUs: Long,
        flags: Int,
        size: Int,
        offset: Int,
        cryptoData: TrackOutput.CryptoData?,
    ) {
        if (isAss && timeUs != C.TIME_UNSET) {
            val sample = extractor.subtitleSample
            val endIndex = findTokenIndex(sample.data, 1)
            val lineIndex = findTokenIndex(sample.data, 2)

            val rawDuration = sample.data.decodeToString(endIndex, lineIndex - 1)
            val durationUs = parseTimecodeUs(rawDuration)

            assHandler.readTrackDialogue(
                trackId = trackId,
                start = timeUs / 1000,
                duration = durationUs / 1000,
                data = sample.data,
                offset = lineIndex,
                length = sample.limit() - lineIndex,
            )
        }
        delegate.sampleMetadata(timeUs, flags, size, offset, cryptoData)
    }

    private fun parseTimecodeUs(timeString: String): Long {
        val matcher = SSA_TIMECODE_PATTERN.matcher(timeString.trim { it <= ' ' })
        if (!matcher.matches()) {
            return C.TIME_UNSET
        }
        var timestampUs =
            Util.castNonNull(matcher.group(1)).toLong() * 60 * 60 * C.MICROS_PER_SECOND
        timestampUs += Util.castNonNull(matcher.group(2)).toLong() * 60 * C.MICROS_PER_SECOND
        timestampUs += Util.castNonNull(matcher.group(3)).toLong() * C.MICROS_PER_SECOND
        timestampUs += Util.castNonNull(matcher.group(4)).toLong() * 10000
        return timestampUs
    }

    private fun findTokenIndex(array: ByteArray, tokenNumber: Int): Int {
        if (tokenNumber == 0) return 0
        var tokensFound = 0
        array.forEachIndexed { index, byte ->
            if (byte == COMMA && ++tokensFound == tokenNumber) {
                return index + 1
            }
        }
        return 0
    }

    private companion object {
        val SSA_TIMECODE_PATTERN: Pattern =
            Pattern.compile("""(?:(\d+):)?(\d+):(\d+)[:.](\d+)""")

        const val COMMA = ','.code.toByte()
    }
}
