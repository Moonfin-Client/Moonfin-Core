package org.moonfin.nativevideo.ts

import androidx.media3.common.C
import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.common.ParserException
import androidx.media3.common.util.ParsableBitArray
import androidx.media3.common.util.ParsableByteArray
import androidx.media3.common.util.UnstableApi
import androidx.media3.common.util.Util
import androidx.media3.extractor.DtsUtil
import androidx.media3.extractor.ExtractorOutput
import androidx.media3.extractor.TrackOutput
import androidx.media3.extractor.ts.ElementaryStreamReader
import androidx.media3.extractor.ts.TsPayloadReader
import org.moonfin.nativevideo.iec.DtsFraming
import org.moonfin.nativevideo.iec.Iec61937Exception
import org.moonfin.nativevideo.iec.rb32

/**
 * Reads Blu-ray DTS audio from a transport stream. A DTS-HD access unit is a
 * core frame with its extension substream right behind it, and both go out as
 * one sample, the way MKV and MP4 hand DTS-HD over. Blu-ray PES packets carry
 * whole access units, so each packet is parsed once it's complete.
 */
@UnstableApi
internal class HdmvDtsReader(
    private val language: String?,
    private val roleFlags: Int,
) : ElementaryStreamReader {

    private lateinit var output: TrackOutput
    private lateinit var formatId: String
    private var formatPublished = false
    private var packet = ByteArray(0)
    private var packetSize = 0
    private val sample = ParsableByteArray()
    private var timeUs = C.TIME_UNSET

    override fun seek() {
        packetSize = 0
        timeUs = C.TIME_UNSET
    }

    override fun createTracks(
        extractorOutput: ExtractorOutput,
        idGenerator: TsPayloadReader.TrackIdGenerator,
    ) {
        idGenerator.generateNewId()
        formatId = idGenerator.formatId
        output = extractorOutput.track(idGenerator.trackId, C.TRACK_TYPE_AUDIO)
    }

    override fun packetStarted(pesTimeUs: Long, flags: Int) {
        packetSize = 0
        if (pesTimeUs != C.TIME_UNSET) timeUs = pesTimeUs
    }

    override fun consume(data: ParsableByteArray) {
        val length = data.bytesLeft()
        if (packet.size < packetSize + length) {
            packet = packet.copyOf(maxOf(packetSize + length, packet.size * 2))
        }
        data.readBytes(packet, packetSize, length)
        packetSize += length
    }

    override fun packetFinished(isEndOfInput: Boolean) {
        var pos = 0
        while (pos + CORE_HEADER_BYTES <= packetSize) {
            val core = coreHeaderAt(pos)
            if (core == null) {
                pos++
                continue
            }
            val extensionAt = pos + core.coreSizeBytes
            val hasExtension = extensionAt + EXTENSION_PREFIX_BYTES <= packetSize &&
                packet.rb32(extensionAt) == SYNCWORD_EXTENSION
            val length = core.coreSizeBytes + if (hasExtension) extensionSize(extensionAt) else 0
            if (pos + length > packetSize) break
            if (!formatPublished) publishFormat(pos, if (hasExtension) extensionAt else null)
            if (timeUs != C.TIME_UNSET) {
                sample.reset(packet, pos + length)
                sample.setPosition(pos)
                output.sampleData(sample, length)
                output.sampleMetadata(timeUs, C.BUFFER_FLAG_KEY_FRAME, length, 0, null)
                timeUs += Util.sampleCountToDurationUs(core.samples.toLong(), core.sampleRate)
            }
            pos += length
        }
        packetSize = 0
    }

    private fun coreHeaderAt(pos: Int): DtsFraming.CoreHeader? {
        if (packet.rb32(pos) != DtsFraming.SYNCWORD_CORE_BE) return null
        val header = try {
            DtsFraming.parseCoreHeader(packet, pos, packetSize - pos)
        } catch (_: Iec61937Exception) {
            return null
        }
        return header.takeIf { it.sampleRate > 0 }
    }

    // Read straight from the header, since parseDtsHdHeader refuses streams
    // it can't fully describe and the size is all that's needed here.
    private fun extensionSize(at: Int): Int {
        val bits = ParsableBitArray(packet, packetSize)
        bits.setPosition(at * 8 + 42)
        val wideHeader = bits.readBit()
        bits.skipBits(if (wideHeader) 12 else 8)
        return bits.readBits(if (wideHeader) 20 else 16) + 1
    }

    private fun publishFormat(coreAt: Int, extensionAt: Int?) {
        val core = DtsUtil.parseDtsFormat(
            packet.copyOfRange(coreAt, coreAt + CORE_HEADER_BYTES),
            formatId,
            language,
            roleFlags,
            MimeTypes.VIDEO_MP2T,
            null,
        )
        val format = if (extensionAt == null) {
            core
        } else {
            val builder = core.buildUpon().setSampleMimeType(MimeTypes.AUDIO_DTS_HD)
            val extension = extensionHeader(extensionAt)
            if (extension != null) {
                if (extension.channelCount != C.LENGTH_UNSET) builder.setChannelCount(extension.channelCount)
                if (extension.sampleRate != C.RATE_UNSET_INT) builder.setSampleRate(extension.sampleRate)
            }
            builder.build()
        }
        output.format(format)
        formatPublished = true
    }

    // Only used for the channel count and sample rate, so a header it can't
    // describe just leaves the core's in place.
    private fun extensionHeader(at: Int): DtsUtil.DtsHeader? = try {
        val size = DtsUtil.parseDtsHdHeaderSize(packet.copyOfRange(at, at + EXTENSION_PREFIX_BYTES))
        if (at + size > packetSize) null else DtsUtil.parseDtsHdHeader(packet.copyOfRange(at, at + size))
    } catch (_: ParserException) {
        null
    }

    private companion object {
        const val CORE_HEADER_BYTES = 18
        const val EXTENSION_PREFIX_BYTES = 10
        const val SYNCWORD_EXTENSION = 0x64582025L
    }
}
