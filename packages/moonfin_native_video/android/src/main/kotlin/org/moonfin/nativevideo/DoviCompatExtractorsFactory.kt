package org.moonfin.nativevideo

import androidx.media3.common.C
import androidx.media3.common.DataReader
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.ParsableByteArray
import androidx.media3.common.util.UnstableApi
import androidx.media3.extractor.Extractor
import androidx.media3.extractor.ExtractorInput
import androidx.media3.extractor.ExtractorOutput
import androidx.media3.extractor.ExtractorsFactory
import androidx.media3.extractor.ForwardingExtractor
import androidx.media3.extractor.ForwardingExtractorOutput
import androidx.media3.extractor.ForwardingExtractorsFactory
import androidx.media3.extractor.ForwardingTrackOutput
import androidx.media3.extractor.PositionHolder
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
    /**
     * Why this went out: "decided", "progress", "converterFailed", "disarmed",
     * or "untouched".
     */
    val reason: String,
    val requestedMode: DoviCompatMode,
    val appliedMode: DoviCompatMode?,
    val sourceCodecs: String,
    /** Where the RPU came from: "inBand", "blockAdditional", or "none". */
    val rpuSource: String,
    val samplesFiltered: Int,
    val rpusSeen: Int,
    val rpusConverted: Int,
    val rpusDropped: Int,
    val rpusFailed: Int,
    val enhancementUnitsDropped: Int,
    val blockAdditionsRead: Int,
    /** Every NAL type the walker found, as "32x1,33x1,62x4,63x18". */
    val nalCensus: String,
    /**
     * How the container framed the samples: "wrapped" or "plain", or
     * "unknown" before the first sample.
     */
    val sampleLayout: String,
    val bytesIn: Long,
    val bytesOut: Long,
    /** The track format before and after the rewrite. */
    val formatSummary: String,
    val detail: String?,
    /**
     * What the first RPU says the enhancement layer is: "FEL", "MEL", "no
     * residual", "unknown", or "unreadable" with the reason. Null until that
     * RPU is read, which only happens while converting.
     */
    val enhancementLayer: String?,
    /**
     * How the FEL curve fold is doing, null for a stream it doesn't apply to
     * (anything but a full enhancement layer converted to profile 8.1).
     */
    val fold: String?,
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

/** The Dolby Vision profile a codecs string names, when it's 7 or 8. */
internal fun dolbyVisionProfile(codecs: String?): Int? = when {
    codecs == null -> null
    codecs.startsWith("dvhe.07") || codecs.startsWith("dvh1.07") -> 7
    codecs.startsWith("dvhe.08") || codecs.startsWith("dvh1.08") -> 8
    else -> null
}

/**
 * How a track gets rewritten, or null to leave it alone. A strip request
 * covers both profiles, otherwise only profile 7 follows its own mode.
 */
internal fun doviInterceptMode(
    profile: Int?,
    profile7Mode: DoviCompatMode,
    stripDolbyVision: Boolean,
): DoviCompatMode? = when {
    profile == null -> null
    stripDolbyVision -> DoviCompatMode.STRIP
    profile != 7 -> null
    profile7Mode == DoviCompatMode.CONVERT || profile7Mode == DoviCompatMode.STRIP -> profile7Mode
    else -> null
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
 * with a profile 7 codec string shows up, or a profile 8 one while
 * [stripDolbyVision] asks for the Dolby Vision layer to go.
 */
@UnstableApi
class DoviCompatExtractorsFactory(
    delegate: ExtractorsFactory,
    private val mode: () -> DoviCompatMode,
    private val stripDolbyVision: () -> Boolean,
    private val converter: DoviRpuConverter,
    /** True while the player's own video decoder exists, which the fold waits for. */
    private val videoDecoderReady: () -> Boolean,
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
            DoviCompatExtractor(
                extractors[index], mode, stripDolbyVision, converter, videoDecoderReady, onReport,
            )
        }
}

@UnstableApi
private class DoviCompatExtractor(
    private val delegate: Extractor,
    private val mode: () -> DoviCompatMode,
    private val stripDolbyVision: () -> Boolean,
    private val converter: DoviRpuConverter,
    private val videoDecoderReady: () -> Boolean,
    private val onReport: (DoviCompatReport) -> Unit,
) : ForwardingExtractor(delegate) {

    private var output: DoviCompatExtractorOutput? = null

    override fun init(output: ExtractorOutput) {
        val wrapped = DoviCompatExtractorOutput(
            output, mode, stripDolbyVision, converter, videoDecoderReady, onReport,
        )
        this.output = wrapped
        (delegate as? MoonfinMatroskaExtractor)?.doviBlockAdditionalListener =
            wrapped::onDoviBlockAdditional
        super.init(wrapped)
    }

    override fun seek(position: Long, timeUs: Long) {
        output?.resetSampleState()
        super.seek(position, timeUs)
    }

    // A track output can be holding a GOP back for the FEL fold, and nothing
    // else tells it the source has ended.
    override fun read(input: ExtractorInput, seekPosition: PositionHolder): Int {
        val result = super.read(input, seekPosition)
        if (result == Extractor.RESULT_END_OF_INPUT) output?.endOfInput()
        return result
    }

    override fun release() {
        output?.release()
        super.release()
    }
}

@UnstableApi
private class DoviCompatExtractorOutput(
    delegate: ExtractorOutput,
    private val mode: () -> DoviCompatMode,
    private val stripDolbyVision: () -> Boolean,
    private val converter: DoviRpuConverter,
    private val videoDecoderReady: () -> Boolean,
    private val onReport: (DoviCompatReport) -> Unit,
) : ForwardingExtractorOutput(delegate) {

    private val videoTracks = HashMap<Int, DoviCompatTrackOutput>()

    override fun track(id: Int, type: Int): TrackOutput {
        val inner = super.track(id, type)
        if (type != C.TRACK_TYPE_VIDEO) {
            return inner
        }
        return videoTracks.getOrPut(id) {
            DoviCompatTrackOutput(inner, mode, stripDolbyVision, converter, videoDecoderReady, onReport)
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

    fun endOfInput() {
        for (track in videoTracks.values) {
            track.endOfInput()
        }
    }

    fun release() {
        for (track in videoTracks.values) {
            track.release()
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
    private val stripDolbyVision: () -> Boolean,
    private val converter: DoviRpuConverter,
    private val videoDecoderReady: () -> Boolean,
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
    private var rpusSeen = 0
    private var rpusConverted = 0
    private var rpusDropped = 0
    private var rpusFailed = 0
    private var enhancementUnitsDropped = 0
    private var blockAdditionsRead = 0
    private var bytesIn = 0L
    private var bytesOut = 0L
    private val nalCounts = IntArray(64)
    private var sampleLayout = "unknown"
    private var emittedFormat: Format? = null
    private var nextProgressReport = 10
    private var bytesAwaitingFirstSample = 0L

    /**
     * Whether the stream's enhancement layer is a full one, settled by its
     * first RPU. An FEL RPU converts with its own mapping kept, since mode 2
     * alone sets it to no-op and the picture comes out too dim.
     */
    private var fel: Boolean? = null
    private var enhancementLayer: String? = null
    /** Holds GOPs back for the curve fold while it runs. */
    private var folder: FelGopFolder? = null
    private var stoppedFolder: FelGopFolder? = null
    private var foldOffReason: String? = null
    private var reportedFoldStart = false
    private var heldRpu: ByteArray? = null
    private var heldRpuInfo: FelRpuInfo? = null
    private val heldEnhancement = java.io.ByteArrayOutputStream()

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
                rpusSeen = rpusSeen,
                rpusConverted = rpusConverted,
                rpusDropped = rpusDropped,
                rpusFailed = rpusFailed,
                enhancementUnitsDropped = enhancementUnitsDropped,
                blockAdditionsRead = blockAdditionsRead,
                nalCensus = describeNalCensus(),
                sampleLayout = sampleLayout,
                bytesIn = bytesIn,
                bytesOut = bytesOut,
                formatSummary = describeFormats(),
                detail = detail,
                enhancementLayer = enhancementLayer,
                fold = describeFold(),
            ),
        )
    }

    private fun describeFold(): String? =
        if (fel != true) null else (folder ?: stoppedFolder)?.summary() ?: "off ($foldOffReason)"

    private fun describeNalCensus(): String = buildString {
        for (type in nalCounts.indices) {
            if (nalCounts[type] == 0) continue
            if (isNotEmpty()) append(',')
            append(type).append('x').append(nalCounts[type])
        }
        if (isEmpty()) append("none")
    }

    // The csd matters here because a stripped track keeps the configuration
    // the Dolby Vision track shipped with.
    private fun describeFormat(format: Format?, label: String): String {
        if (format == null) return "$label none"
        val csd = format.initializationData.joinToString("+") { it.size.toString() }
        return "$label ${format.sampleMimeType} ${format.codecs} " +
            "${format.width}x${format.height} csd[${csd.ifEmpty { "none" }}]"
    }

    private fun describeFormats(): String =
        describeFormat(sourceFormat, "in") + ", " + describeFormat(emittedFormat, "out")

    private var pending = ByteArray(INITIAL_BUFFER_BYTES)
    private var pendingLength = 0
    private var pendingRpu = ByteArray(0)
    private var pendingRpuLength = 0
    private var scratch = ByteArray(SCRATCH_BYTES)
    private val lengthPrefix = ByteArray(4)
    private var filtered = ByteArray(INITIAL_BUFFER_BYTES)
    private val forwardArray = ParsableByteArray()

    override fun format(format: Format) {
        val profile = dolbyVisionProfile(format.codecs)
        val requestedMode = mode()
        val interceptMode =
            if (disarmed) null else doviInterceptMode(profile, requestedMode, stripDolbyVision())

        if (interceptMode == null) {
            active = false
            super.format(format)
            // A profile 7 track that goes out untouched is worth saying out
            // loud, since the reason is the whole answer to why it did not
            // convert.
            if (profile == 7 && !disarmed && !reportedUntouched) {
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
        requested = interceptMode
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
        emittedFormat = rewritten
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
        if (applied != DoviCompatMode.CONVERT && folder != null) {
            folder?.release()
            folder = null
            foldOffReason = "the stream isn't converted"
            clearHeldUnit()
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

        // A Matroska track that declares a block addition mapping, which every
        // Dolby Vision track does, wraps each sample as a four byte length,
        // then the coded sample, then anything the block additions carried.
        // Only the middle holds NAL units, and the length has to be restated
        // once the filter has shortened it.
        val wrapped = (flags and C.BUFFER_FLAG_HAS_SUPPLEMENTAL_DATA) != 0
        sampleLayout = if (wrapped) "wrapped" else "plain"
        var dataStart = start
        var dataEnd = end
        if (wrapped) {
            val declared = if (end - start >= 4) readWrappedLength(pending, start) else -1
            if (declared < 0 || start + 4 + declared > end) {
                disarm("the wrapped sample length did not fit (declared $declared of $size)")
                super.sampleMetadata(timeUs, flags, size, offset, cryptoData)
                return
            }
            dataStart = start + 4
            dataEnd = dataStart + declared
        }

        var filteredLength = filterSample(pending, dataStart, dataEnd)

        // A dual layer MKV carries its RPU in a block addition rather than in
        // band, so when the sample itself had none the converted one joins at
        // the end of the access unit, where an RPU belongs.
        if (effectiveMode == DoviCompatMode.CONVERT && !wroteRpu &&
            pendingRpuLength > 0 && !convertBroken
        ) {
            if (fel == null) settleFel(pendingRpu, 0, pendingRpuLength, inBand = false)
            val converted = convertRpu(pendingRpu, 0, pendingRpuLength)
            if (converted != null) {
                wroteRpu = true
                rpusConverted++
                if (rpuSource == "none") rpuSource = "blockAdditional"
                filteredLength = writeUnit(converted, 0, converted.size, filteredLength)
            }
        }
        pendingRpuLength = 0
        samplesFiltered++
        bytesIn += (dataEnd - dataStart).toLong()
        bytesOut += filteredLength.toLong()

        if (!formatDecided) {
            decide(wroteRpu)
        } else if (convertBroken && !reportedConverterFailure) {
            reportedConverterFailure = true
            report(
                reason = "converterFailed",
                detail = "the converter stopped accepting RPUs, the rest of " +
                    "this stream plays without them",
            )
        } else if (samplesFiltered >= nextProgressReport) {
            // Backs off by powers of ten, so an early failure is captured in
            // detail while a whole film still only reports a handful of times.
            nextProgressReport *= 10
            report(reason = "progress")
        }

        val trailing = end - dataEnd
        val holding = folder
        if (holding != null && applied == DoviCompatMode.CONVERT) {
            val held = FelGopFolder.Held(
                timeUs = timeUs,
                flags = flags,
                base = filtered.copyOf(filteredLength),
                rpu = heldRpu,
                info = heldRpuInfo,
                enhancement = if (heldEnhancement.size() > 0) heldEnhancement.toByteArray() else null,
                wrapped = wrapped,
                supplemental = if (trailing > 0) pending.copyOfRange(dataEnd, end) else null,
            )
            clearHeldUnit()
            compactPending(end)
            holding.add(held)
            if (!reportedFoldStart && holding.scenesFitted > 0) {
                reportedFoldStart = true
                report(reason = "foldStarted")
            }
            holding.stopReason?.let { stopFolding(holding) }
            return
        }

        forward(timeUs, flags, filtered, filteredLength, wrapped, pending, dataEnd, trailing)
        compactPending(end)
    }

    /**
     * Writes one sample to the delegate. A wrapped Matroska sample gets its
     * length restated to match the filtered data, otherwise the reader works
     * out a negative supplemental size from it.
     */
    private fun forward(
        timeUs: Long,
        flags: Int,
        data: ByteArray,
        length: Int,
        wrapped: Boolean,
        supplemental: ByteArray?,
        supplementalStart: Int,
        supplementalLength: Int,
    ) {
        var forwardedLength = length
        if (wrapped) {
            writeWrappedLength(lengthPrefix, length)
            forwardArray.reset(lengthPrefix, 4)
            super.sampleData(forwardArray, 4, TrackOutput.SAMPLE_DATA_PART_SUPPLEMENTAL)
            forwardedLength += 4
        }
        forwardArray.reset(data, length)
        super.sampleData(forwardArray, length, 0)
        if (supplemental != null && supplementalLength > 0) {
            forwardArray.reset(supplemental, supplementalStart + supplementalLength)
            forwardArray.setPosition(supplementalStart)
            super.sampleData(forwardArray, supplementalLength, TrackOutput.SAMPLE_DATA_PART_SUPPLEMENTAL)
            forwardedLength += supplementalLength
        }
        super.sampleMetadata(timeUs, flags, forwardedLength, 0, null)
    }

    // Offsets count back from the write head, so dropping everything up to
    // the just-consumed slice keeps later slices addressable while the buffer
    // stays bounded. This has to wait until the slice has been forwarded or
    // copied out, since the copy slides later bytes down over it.
    private fun compactPending(end: Int) {
        val remaining = pendingLength - end
        if (remaining > 0) {
            System.arraycopy(pending, end, pending, 0, remaining)
        }
        pendingLength = remaining
    }

    /** A sample the folder lets go, with the luma curve its RPU should carry. */
    private fun releaseHeld(held: FelGopFolder.Held, luma: FelCurve?) {
        if (filtered.size < held.base.size) filtered = ByteArray(held.base.size)
        held.base.copyInto(filtered)
        var length = held.base.size
        val rpu = held.rpu
        if (rpu != null) {
            val converted = convertRpu(rpu, 0, rpu.size, luma, checked = true)
            if (converted != null) {
                rpusConverted++
                length = writeUnit(converted, 0, converted.size, length)
            }
        }
        bytesOut += (length - held.base.size).toLong()
        val supplemental = held.supplemental
        forward(held.timeUs, held.flags, filtered, length, held.wrapped, supplemental, 0, supplemental?.size ?: 0)
    }

    private fun stopFolding(stopping: FelGopFolder) {
        retireFolder(stopping)
        report(reason = "foldStopped", detail = stopping.stopReason)
    }

    /** Lets the folder's held samples go and keeps it only for the report. */
    private fun retireFolder(retiring: FelGopFolder) {
        retiring.drain()
        retiring.release()
        stoppedFolder = retiring
        folder = null
    }

    private fun clearHeldUnit() {
        heldRpu = null
        heldRpuInfo = null
        heldEnhancement.reset()
    }

    /**
     * Settles from the stream's first RPU what its enhancement layer is, and
     * starts the curve fold for a full one whose layers ride in band.
     */
    private fun settleFel(data: ByteArray, position: Int, length: Int, inBand: Boolean) {
        var refusal = "the guard refused the RPU"
        val info = DoviRpuGuard.safeUnescaped(data, position, length)?.let { u -> FelRpuInfo.read(u) { refusal = it } }
        enhancementLayer = info?.enhancementLayer ?: "unreadable ($refusal)"
        val isFel = info?.isFel == true
        fel = isFel
        if (!isFel) return
        val deviceProblem = FelFoldPolicy.deviceProblem
        foldOffReason = when {
            !inBand -> "the enhancement layer isn't in band"
            !converter.canSetCurves -> "this libdovi can't set curves"
            deviceProblem != null -> "an earlier playback found $deviceProblem"
            !FelLayerDecoder.givesTenBit() -> "the HEVC decoder can't give 10-bit pictures"
            else -> null
        }
        val format = sourceFormat
        if (foldOffReason == null && format != null) {
            folder = FelGopFolder(format, videoDecoderReady, ::releaseHeld)
        }
    }

    /** Settles [fel] ahead of the walk, since NAL 63 units come before the RPU in an access unit. */
    private fun settleFelFromSample(data: ByteArray, start: Int, end: Int) {
        var unitStart = nextStartCode(data, start, end)
        while (unitStart != -1 && unitStart < end) {
            val payloadStart = unitStart + startCodeLength(data, unitStart, end)
            if (payloadStart >= end) return
            val nextUnit = nextStartCode(data, payloadStart, end)
            if (((data[payloadStart].toInt() shr 1) and 0x3F) == NAL_UNSPEC62) {
                settleFel(data, payloadStart, (if (nextUnit == -1) end else nextUnit) - payloadStart, inBand = true)
                return
            }
            unitStart = nextUnit
        }
    }

    /** Keeps an RPU for the fold instead of converting it now. */
    private fun captureRpu(data: ByteArray, position: Int, length: Int) {
        val unescaped = DoviRpuGuard.safeUnescaped(data, position, length)
        if (unescaped == null) {
            rpusDropped++
            return
        }
        heldRpu = data.copyOfRange(position, position + length)
        heldRpuInfo = FelRpuInfo.read(unescaped)
        wroteRpu = true
        rpuSource = "inBand"
    }

    /** Keeps an enhancement layer NAL unit, minus its two byte unspec63 header, for the fold. */
    private fun captureEnhancement(data: ByteArray, payloadStart: Int, unitEnd: Int) {
        val from = payloadStart + 2
        if (from >= unitEnd) return
        heldEnhancement.write(FelGopFolder.START_CODE)
        heldEnhancement.write(data, from, unitEnd - from)
    }

    fun endOfInput() {
        folder?.flush()
        if (active && formatDecided) report(reason = "ended")
    }

    fun release() {
        folder?.release()
    }

    private fun readWrappedLength(data: ByteArray, position: Int): Int =
        ((data[position].toInt() and 0xFF) shl 24) or
            ((data[position + 1].toInt() and 0xFF) shl 16) or
            ((data[position + 2].toInt() and 0xFF) shl 8) or
            (data[position + 3].toInt() and 0xFF)

    private fun writeWrappedLength(target: ByteArray, value: Int) {
        target[0] = (value shr 24).toByte()
        target[1] = (value shr 16).toByte()
        target[2] = (value shr 8).toByte()
        target[3] = value.toByte()
    }

    fun resetSampleState() {
        pendingLength = 0
        pendingRpuLength = 0
        bytesAwaitingFirstSample = 0
        folder?.reset()
        clearHeldUnit()
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
        // Held samples were read before anything still pending, so they go first.
        folder?.let(::retireFolder)
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

        // The player never finishes preparing while this track's format is
        // held back, so a first sample that never completes would sit on a
        // silent black screen forever while this buffer grows without bound.
        // No real access unit comes near this size, so once this much data
        // arrives with no sample landing, stand down and let the format out
        // untouched so the failure surfaces where the player can recover.
        if (!formatDecided) {
            bytesAwaitingFirstSample += length
            if (bytesAwaitingFirstSample > FIRST_SAMPLE_BYTE_BUDGET) {
                disarm(
                    "the first sample never completed within " +
                        "${FIRST_SAMPLE_BYTE_BUDGET shr 20}MB of data",
                )
            }
        }
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
        if (fel == null && effectiveMode == DoviCompatMode.CONVERT) settleFelFromSample(data, start, end)
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
            nalCounts[nalType]++
            if (nalType == NAL_UNSPEC62) rpusSeen++
            val mode = effectiveMode
            when {
                nalType == NAL_UNSPEC63 -> {
                    enhancementUnitsDropped++
                    if (folder != null) captureEnhancement(data, payloadStart, unitEnd)
                }
                nalType == NAL_UNSPEC62 && mode == DoviCompatMode.STRIP -> rpusDropped++
                nalType == NAL_UNSPEC62 && mode == DoviCompatMode.CONVERT && folder != null ->
                    captureRpu(data, payloadStart, unitEnd - payloadStart)
                nalType == NAL_UNSPEC62 && mode == DoviCompatMode.CONVERT -> {
                    val converted = convertRpu(data, payloadStart, unitEnd - payloadStart)
                    if (converted != null) {
                        wroteRpu = true
                        rpusConverted++
                        rpuSource = "inBand"
                        outLength = writeUnit(converted, 0, converted.size, outLength)
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

    /**
     * The converted RPU, or null when it is dropped. An RPU the guard refuses
     * would abort the process inside libdovi, so only that frame loses its
     * RPU. A converter that refuses a safe one is treated as broken for the
     * rest of the stream.
     */
    private fun convertRpu(
        data: ByteArray,
        position: Int,
        length: Int,
        luma: FelCurve? = null,
        checked: Boolean = false,
    ): ByteArray? {
        if (convertBroken) {
            rpusFailed++
            return null
        }
        if (!checked && !DoviRpuGuard.isSafe(data, position, length)) {
            rpusDropped++
            return null
        }
        val converted = if (fel == true) {
            converter.convertKeepingMapping(data, position, length, luma)
        } else {
            converter.convertP7NalToP8(data, position, length)
        }
        if (converted == null) {
            rpusFailed++
            convertBroken = true
        }
        return converted
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
        const val FIRST_SAMPLE_BYTE_BUDGET = 64 * 1024 * 1024
        const val ZERO = 0.toByte()
        const val ONE = 1.toByte()
    }
}
