package org.moonfin.nativevideo

import androidx.media3.common.C
import androidx.media3.common.DataReader
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.ParsableByteArray
import androidx.media3.common.util.UnstableApi
import androidx.media3.extractor.Extractor
import androidx.media3.extractor.ExtractorOutput
import androidx.media3.extractor.ExtractorsFactory
import androidx.media3.extractor.ForwardingExtractor
import androidx.media3.extractor.ForwardingExtractorOutput
import androidx.media3.extractor.ForwardingExtractorsFactory
import androidx.media3.extractor.ForwardingTrackOutput
import androidx.media3.extractor.TrackOutput
import androidx.media3.extractor.text.SubtitleParser
import android.net.Uri
import java.io.IOException

/**
 * What the compat chain did to a profile 7 track, for the playback report.
 * Sent when the handling settles and again whenever something changes about
 * it, so a report shows both the decision and how it held up.
 */
data class DoviCompatReport(
    /** Why this went out: "decided", "converterFailed", or "disarmed". */
    val reason: String,
    val requestedMode: DoviCompatMode,
    val appliedMode: DoviCompatMode?,
    val sourceCodecs: String,
    /** Where the RPU came from: "inBand", "blockAdditional", or "none". */
    val rpuSource: String,
    val samplesFiltered: Int,
    val rpusConverted: Int,
    val rpusFailed: Int,
    val enhancementUnitsDropped: Int,
    val blockAdditionsRead: Int,
    val detail: String?,
)

/** How this player handles a Dolby Vision profile 7 stream. */
enum class DoviCompatMode(val wireValue: String) {
    /** The device decodes profile 7 itself, leave the stream alone. */
    NATIVE("native"),

    /** Rewrite the RPU to profile 8.1 and drop the enhancement layer. */
    CONVERT("convert"),

    /** Drop the DV metadata entirely, the base layer plays as HEVC HDR10. */
    STRIP("strip"),

    /** The feature is disabled, leave the stream alone. */
    OFF("off"),
    ;

    companion object {
        fun fromWire(value: String?): DoviCompatMode = entries.firstOrNull {
            it.wireValue == value
        } ?: OFF
    }
}

/**
 * Makes Dolby Vision profile 7 direct play on devices that only decode
 * profile 8 or plain HEVC.
 *
 * media3 refuses to fall profile 7 back to HEVC and almost no hardware
 * decodes it, so P7 always forced a server transcode. The base layer is
 * ordinary HDR10-compatible HEVC though, and the profile difference lives in
 * two extra NAL units: 62 carries the RPU metadata and 63 the enhancement
 * layer. Rewriting 62 to profile 8.1 and dropping 63 yields a stream a
 * profile 8 decoder accepts, and dropping both yields plain HEVC.
 *
 * Those NAL units ride in band inside each sample in MP4 and single layer
 * MKV. A dual layer MKV keeps them in block additions instead, which
 * [MoonfinMatroskaExtractor] captures and hands over here so its RPUs convert
 * all the same.
 *
 * Everything hangs off the public Forwarding* extractor API: each created
 * extractor gets its output wrapped so video tracks pass through
 * [DoviCompatTrackOutput], which stays a pure pass-through until a format
 * with a profile 7 codec string shows up.
 */
@UnstableApi
class DoviCompatExtractorsFactory(
    delegate: ExtractorsFactory,
    private val mode: () -> DoviCompatMode,
    private val convertNal62: (ByteArray, Int, Int) -> ByteArray?,
    private val onReport: (DoviCompatReport) -> Unit,
) : ForwardingExtractorsFactory(delegate) {

    // The base class returns the inner factory from its setters, which would
    // let callers chain right past this wrapper, so each override returns
    // this instead.
    override fun setSubtitleParserFactory(
        subtitleParserFactory: SubtitleParser.Factory,
    ): ExtractorsFactory {
        super.setSubtitleParserFactory(subtitleParserFactory)
        return this
    }

    @Suppress("DEPRECATION")
    override fun experimentalSetTextTrackTranscodingEnabled(
        textTrackTranscodingEnabled: Boolean,
    ): ExtractorsFactory {
        super.experimentalSetTextTrackTranscodingEnabled(textTrackTranscodingEnabled)
        return this
    }

    override fun experimentalSetCodecsToParseWithinGopSampleDependencies(
        codecsToParseWithinGopSampleDependencies: Int,
    ): ExtractorsFactory {
        super.experimentalSetCodecsToParseWithinGopSampleDependencies(
            codecsToParseWithinGopSampleDependencies,
        )
        return this
    }

    override fun createExtractors(): Array<Extractor> =
        wrap(super.createExtractors())

    override fun createExtractors(
        uri: Uri,
        responseHeaders: Map<String, List<String>>,
    ): Array<Extractor> = wrap(super.createExtractors(uri, responseHeaders))

    private fun wrap(extractors: Array<Extractor>): Array<Extractor> =
        Array(extractors.size) { index ->
            DoviCompatExtractor(extractors[index], mode, convertNal62, onReport)
        }
}

@UnstableApi
private class DoviCompatExtractor(
    private val delegate: Extractor,
    private val mode: () -> DoviCompatMode,
    private val convertNal62: (ByteArray, Int, Int) -> ByteArray?,
    private val onReport: (DoviCompatReport) -> Unit,
) : ForwardingExtractor(delegate) {

    private var output: DoviCompatExtractorOutput? = null

    override fun init(output: ExtractorOutput) {
        val wrapped = DoviCompatExtractorOutput(output, mode, convertNal62, onReport)
        this.output = wrapped
        (delegate as? MoonfinMatroskaExtractor)?.doviBlockAdditionalListener =
            wrapped::onDoviBlockAdditional
        super.init(wrapped)
    }

    override fun seek(position: Long, timeUs: Long) {
        output?.resetSampleState()
        super.seek(position, timeUs)
    }
}

@UnstableApi
private class DoviCompatExtractorOutput(
    delegate: ExtractorOutput,
    private val mode: () -> DoviCompatMode,
    private val convertNal62: (ByteArray, Int, Int) -> ByteArray?,
    private val onReport: (DoviCompatReport) -> Unit,
) : ForwardingExtractorOutput(delegate) {

    private val videoTracks = HashMap<Int, DoviCompatTrackOutput>()

    override fun track(id: Int, type: Int): TrackOutput {
        val inner = super.track(id, type)
        if (type != C.TRACK_TYPE_VIDEO) {
            return inner
        }
        return videoTracks.getOrPut(id) {
            DoviCompatTrackOutput(inner, mode, convertNal62, onReport)
        }
    }

    fun onDoviBlockAdditional(
        trackNumber: Int,
        nalLengthFieldSize: Int,
        data: ByteArray,
        length: Int,
    ) {
        videoTracks[trackNumber]?.onBlockAdditional(nalLengthFieldSize, data, length)
    }

    fun resetSampleState() {
        for (track in videoTracks.values) {
            track.resetSampleState()
        }
    }
}

/**
 * The working part: settles how the track is handled, rewrites its format
 * accordingly, and filters the DV NAL units out of every sample.
 *
 * Whether converting is possible depends on whether the stream actually
 * carries an RPU, in band or through a block addition, and that only shows
 * once samples flow. So the format is held back until the first sample, which
 * decides between convert and strip, and the decision then stands for the
 * whole session.
 *
 * Samples arrive as data writes followed by one metadata call whose size and
 * offset address a slice of everything written so far, counted back from the
 * write head. Extractors interleave laced frames that way, so the buffer
 * holds all pending bytes and each metadata call carves its own slice out,
 * filters it, and forwards it with a zero offset.
 */
@UnstableApi
private class DoviCompatTrackOutput(
    delegate: TrackOutput,
    private val mode: () -> DoviCompatMode,
    private val convertNal62: (ByteArray, Int, Int) -> ByteArray?,
    private val onReport: (DoviCompatReport) -> Unit,
) : ForwardingTrackOutput(delegate) {

    private var active = false
    private var disarmed = false
    private var requested: DoviCompatMode? = null
    private var applied: DoviCompatMode? = null
    private var formatDecided = false
    private var sourceFormat: Format? = null
    private var convertBroken = false
    private var wroteRpu = false

    private var reportedConverterFailure = false
    private var reportedUntouched = false
    private var rpuSource = "none"
    private var samplesFiltered = 0
    private var rpusConverted = 0
    private var rpusFailed = 0
    private var enhancementUnitsDropped = 0
    private var blockAdditionsRead = 0

    /** What samples are filtered as, before and after the format settles. */
    private val effectiveMode: DoviCompatMode?
        get() = applied ?: requested

    private fun report(reason: String, detail: String? = null) {
        onReport(
            DoviCompatReport(
                reason = reason,
                requestedMode = requested ?: DoviCompatMode.OFF,
                appliedMode = applied,
                sourceCodecs = sourceFormat?.codecs.orEmpty(),
                rpuSource = rpuSource,
                samplesFiltered = samplesFiltered,
                rpusConverted = rpusConverted,
                rpusFailed = rpusFailed,
                enhancementUnitsDropped = enhancementUnitsDropped,
                blockAdditionsRead = blockAdditionsRead,
                detail = detail,
            ),
        )
    }

    private var pending = ByteArray(INITIAL_BUFFER_BYTES)
    private var pendingLength = 0
    private var pendingRpu = ByteArray(0)
    private var pendingRpuLength = 0
    private var scratch = ByteArray(SCRATCH_BYTES)
    private var filtered = ByteArray(INITIAL_BUFFER_BYTES)
    private val forwardArray = ParsableByteArray()

    override fun format(format: Format) {
        val codecs = format.codecs
        val requestedMode = mode()
        val isP7 = codecs != null &&
            (codecs.startsWith("dvhe.07") || codecs.startsWith("dvh1.07"))
        val shouldIntercept = !disarmed && isP7 &&
            (requestedMode == DoviCompatMode.CONVERT || requestedMode == DoviCompatMode.STRIP)

        if (!shouldIntercept) {
            active = false
            super.format(format)
            // A profile 7 track that goes out untouched is worth saying out
            // loud, since the reason is the whole answer to why it did not
            // convert.
            if (isP7 && !disarmed && !reportedUntouched) {
                reportedUntouched = true
                requested = requestedMode
                sourceFormat = format
                report(
                    reason = "untouched",
                    detail = if (requestedMode == DoviCompatMode.NATIVE) {
                        "this device decodes profile 7 on its own"
                    } else {
                        "profile 7 handling is switched off"
                    },
                )
            }
            return
        }

        active = true
        requested = requestedMode
        sourceFormat = format
        // The first sample decides the format, so it is held back here. Later
        // format calls just re-emit the decision already made.
        if (formatDecided) {
            emitDecidedFormat()
        }
    }

    private fun emitDecidedFormat() {
        val format = sourceFormat ?: return
        val rewritten = when (applied) {
            DoviCompatMode.CONVERT ->
                // Decoder selection reads the profile out of the codecs
                // string, so relabeling 07 as 08 is what routes the track to
                // the profile 8 decoder. The samples get matching RPUs.
                format.buildUpon()
                    .setCodecs(format.codecs!!.replaceRange(5, 7, "08"))
                    .build()
            DoviCompatMode.STRIP ->
                // The base layer is ordinary HEVC once the DV NAL units are
                // gone.
                format.buildUpon()
                    .setSampleMimeType(MimeTypes.VIDEO_H265)
                    .setCodecs(null)
                    .build()
            else -> format
        }
        super.format(rewritten)
    }

    /**
     * Settles how this track is handled, once the first sample has shown
     * whether an RPU reaches the decoder. Converting is only honest when one
     * does, otherwise the stream would advertise Dolby Vision that never
     * arrives, so it falls back to plain HDR10. A sample with no RPU filters
     * identically either way, so the bytes already filtered stay valid.
     */
    private fun decide(rpuEmitted: Boolean) {
        formatDecided = true
        applied = if (requested == DoviCompatMode.CONVERT && !rpuEmitted) {
            DoviCompatMode.STRIP
        } else {
            requested
        }
        emitDecidedFormat()
        report(
            reason = "decided",
            detail = when {
                requested != DoviCompatMode.CONVERT -> null
                applied == DoviCompatMode.CONVERT ->
                    "converting the RPU found $rpuSource"
                convertBroken -> "the converter rejected this stream's RPU"
                else -> "this stream carries no RPU to convert"
            },
        )
    }

    /**
     * Takes the raw bytes of a Dolby Vision block addition for this track,
     * where a dual layer MKV keeps its enhancement layer and RPU. The units
     * ride length prefixed the same way the container's own samples do.
     */
    fun onBlockAdditional(nalLengthFieldSize: Int, data: ByteArray, length: Int) {
        if (!active || effectiveMode != DoviCompatMode.CONVERT) {
            return
        }
        if (nalLengthFieldSize < 1 || nalLengthFieldSize > 4) {
            return
        }
        blockAdditionsRead++
        var position = 0
        while (position + nalLengthFieldSize <= length) {
            var unitLength = 0
            for (i in 0 until nalLengthFieldSize) {
                unitLength = (unitLength shl 8) or (data[position + i].toInt() and 0xFF)
            }
            val unitStart = position + nalLengthFieldSize
            // Anything that does not add up is a framing this can't read, so
            // it gives up rather than guess at NAL boundaries.
            if (unitLength <= 0 || unitStart + unitLength > length) return
            if (((data[unitStart].toInt() shr 1) and 0x3F) == NAL_UNSPEC62) {
                if (pendingRpu.size < unitLength) {
                    pendingRpu = ByteArray(unitLength)
                }
                System.arraycopy(data, unitStart, pendingRpu, 0, unitLength)
                pendingRpuLength = unitLength
            }
            position = unitStart + unitLength
        }
    }

    override fun sampleData(input: DataReader, length: Int, allowEndOfInput: Boolean): Int =
        sampleData(input, length, allowEndOfInput, 0)

    override fun sampleData(
        input: DataReader,
        length: Int,
        allowEndOfInput: Boolean,
        sampleDataPart: Int,
    ): Int {
        if (!active) {
            return super.sampleData(input, length, allowEndOfInput, sampleDataPart)
        }
        val toRead = minOf(length, scratch.size)
        val read = input.read(scratch, 0, toRead)
        if (read == C.RESULT_END_OF_INPUT) {
            if (allowEndOfInput) return C.RESULT_END_OF_INPUT
            throw IOException("Unexpected end of input while buffering a DV sample")
        }
        append(scratch, 0, read)
        return read
    }

    override fun sampleData(data: ParsableByteArray, length: Int) =
        sampleData(data, length, 0)

    override fun sampleData(data: ParsableByteArray, length: Int, sampleDataPart: Int) {
        if (!active) {
            super.sampleData(data, length, sampleDataPart)
            return
        }
        append(data.data, data.position, length)
        data.skipBytes(length)
    }

    override fun sampleMetadata(
        timeUs: Long,
        flags: Int,
        size: Int,
        offset: Int,
        cryptoData: TrackOutput.CryptoData?,
    ) {
        if (!active) {
            super.sampleMetadata(timeUs, flags, size, offset, cryptoData)
            return
        }
        // Encrypted samples never carry rewritable NAL units this code should
        // touch, and direct play does not produce them.
        if (cryptoData != null) {
            disarm("the samples are encrypted")
            super.sampleMetadata(timeUs, flags, size, offset, cryptoData)
            return
        }

        val end = pendingLength - offset
        val start = end - size
        if (start < 0 || end > pendingLength) {
            // The bookkeeping no longer matches what the extractor wrote, so
            // stop rewriting rather than corrupt the stream.
            disarm(
                "the sample bookkeeping did not line up (size $size, offset " +
                    "$offset, buffered $pendingLength)",
            )
            super.sampleMetadata(timeUs, flags, size, offset, cryptoData)
            return
        }

        var filteredLength = filterSample(pending, start, end)

        // A dual layer MKV carries its RPU in a block addition rather than in
        // band, so when the sample itself had none the converted one joins at
        // the end of the access unit, where an RPU belongs.
        if (effectiveMode == DoviCompatMode.CONVERT && !wroteRpu &&
            pendingRpuLength > 0 && !convertBroken
        ) {
            val converted = convertNal62(pendingRpu, 0, pendingRpuLength)
            if (converted != null) {
                wroteRpu = true
                rpusConverted++
                if (rpuSource == "none") rpuSource = "blockAdditional"
                filteredLength = writeUnit(converted, 0, converted.size, filteredLength)
            } else {
                rpusFailed++
                convertBroken = true
            }
        }
        pendingRpuLength = 0
        samplesFiltered++

        if (!formatDecided) {
            decide(wroteRpu)
        } else if (convertBroken && !reportedConverterFailure) {
            reportedConverterFailure = true
            report(
                reason = "converterFailed",
                detail = "the converter stopped accepting RPUs, the rest of " +
                    "this stream plays without them",
            )
        }

        // Offsets count back from the write head, so dropping everything up to
        // the just-consumed slice keeps later slices addressable while the
        // buffer stays bounded.
        val remaining = pendingLength - end
        if (remaining > 0) {
            System.arraycopy(pending, end, pending, 0, remaining)
        }
        pendingLength = remaining

        forwardArray.reset(filtered, filteredLength)
        super.sampleData(forwardArray, filteredLength, 0)
        super.sampleMetadata(timeUs, flags, filteredLength, 0, null)
    }

    fun resetSampleState() {
        pendingLength = 0
        pendingRpuLength = 0
    }

    // Escape hatch for states this filter must not touch. It releases the
    // format untouched if none went out yet, forwards what is buffered
    // exactly as written so the delegate's offsets stay coherent, and stays
    // hands off for the rest of the session.
    private fun disarm(detail: String) {
        if (!formatDecided) {
            formatDecided = true
            applied = null
            emitDecidedFormat()
        }
        flushPendingVerbatim()
        pendingRpuLength = 0
        active = false
        disarmed = true
        report(reason = "disarmed", detail = detail)
    }

    private fun append(source: ByteArray, position: Int, length: Int) {
        if (pendingLength + length > pending.size) {
            pending = pending.copyOf(
                maxOf(pending.size * 2, pendingLength + length),
            )
        }
        System.arraycopy(source, position, pending, pendingLength, length)
        pendingLength += length
    }

    private fun flushPendingVerbatim() {
        if (pendingLength > 0) {
            forwardArray.reset(pending, pendingLength)
            super.sampleData(forwardArray, pendingLength, 0)
        }
        pendingLength = 0
    }

    /**
     * Copies the sample into [filtered] minus NAL 63, with NAL 62 dropped or
     * converted per mode, and returns the filtered length. Extractors emit
     * these samples with Annex B start codes, having rewritten the container's
     * length prefixes on the way through, so start codes are the framing here.
     */
    private fun filterSample(data: ByteArray, start: Int, end: Int): Int {
        wroteRpu = false
        if (filtered.size < end - start) {
            filtered = ByteArray(end - start)
        }
        var unitStart = nextStartCode(data, start, end)
        if (unitStart == -1) {
            System.arraycopy(data, start, filtered, 0, end - start)
            return end - start
        }
        // Bytes before the first start code (leading zero padding) pass through.
        System.arraycopy(data, start, filtered, 0, unitStart - start)
        var outLength = unitStart - start

        while (unitStart < end) {
            val payloadStart = unitStart + startCodeLength(data, unitStart, end)
            val nextUnit = nextStartCode(data, payloadStart, end)
            val unitEnd = if (nextUnit == -1) end else nextUnit
            if (payloadStart >= end) break

            val nalType = (data[payloadStart].toInt() shr 1) and 0x3F
            val mode = effectiveMode
            when {
                nalType == NAL_UNSPEC63 -> enhancementUnitsDropped++
                nalType == NAL_UNSPEC62 && mode == DoviCompatMode.STRIP -> Unit
                nalType == NAL_UNSPEC62 && mode == DoviCompatMode.CONVERT -> {
                    val converted = if (convertBroken) {
                        null
                    } else {
                        convertNal62(data, payloadStart, unitEnd - payloadStart)
                    }
                    if (converted != null) {
                        wroteRpu = true
                        rpusConverted++
                        rpuSource = "inBand"
                        outLength = writeUnit(converted, 0, converted.size, outLength)
                    } else {
                        rpusFailed++
                        convertBroken = true
                    }
                }
                else -> {
                    outLength = writeUnit(data, payloadStart, unitEnd - payloadStart, outLength)
                }
            }

            if (nextUnit == -1) break
            unitStart = nextUnit
        }
        return outLength
    }

    private fun writeUnit(source: ByteArray, position: Int, length: Int, outLength: Int): Int {
        val needed = outLength + 4 + length
        if (filtered.size < needed) {
            filtered = filtered.copyOf(maxOf(filtered.size * 2, needed))
        }
        filtered[outLength] = 0
        filtered[outLength + 1] = 0
        filtered[outLength + 2] = 0
        filtered[outLength + 3] = 1
        System.arraycopy(source, position, filtered, outLength + 4, length)
        return needed
    }

    private fun nextStartCode(data: ByteArray, from: Int, end: Int): Int {
        var i = from
        while (i + 3 <= end) {
            if (data[i] == ZERO && data[i + 1] == ZERO) {
                if (data[i + 2] == ONE) return i
                if (i + 4 <= end && data[i + 2] == ZERO && data[i + 3] == ONE) return i
            }
            i++
        }
        return -1
    }

    private fun startCodeLength(data: ByteArray, position: Int, end: Int): Int =
        if (position + 3 < end && data[position + 2] == ZERO) 4 else 3

    private companion object {
        const val NAL_UNSPEC62 = 62
        const val NAL_UNSPEC63 = 63
        const val INITIAL_BUFFER_BYTES = 512 * 1024
        const val SCRATCH_BYTES = 64 * 1024
        const val ZERO = 0.toByte()
        const val ONE = 1.toByte()
    }
}
