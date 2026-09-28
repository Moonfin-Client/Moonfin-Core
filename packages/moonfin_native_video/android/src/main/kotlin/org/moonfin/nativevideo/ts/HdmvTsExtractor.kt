package org.moonfin.nativevideo.ts

import android.util.SparseArray
import androidx.annotation.OptIn
import androidx.media3.common.C
import androidx.media3.common.Format
import androidx.media3.common.util.TimestampAdjuster
import androidx.media3.common.util.UnstableApi
import androidx.media3.extractor.ExtractorInput
import androidx.media3.extractor.ExtractorsFactory
import androidx.media3.extractor.ForwardingExtractor
import androidx.media3.extractor.text.DefaultSubtitleParserFactory
import androidx.media3.extractor.ts.DefaultTsPayloadReaderFactory
import androidx.media3.extractor.ts.PesReader
import androidx.media3.extractor.ts.TsExtractor
import androidx.media3.extractor.ts.TsPayloadReader
import org.moonfin.nativevideo.iec.rb32

/**
 * Swaps Media3's transport stream extractor for one that also reads Blu-ray
 * DTS audio, built from the TS settings passed here. Blu-ray gives DTS its own
 * stream types, which Media3 skips, and one of them is SCTE-35 in broadcast
 * streams, so they're only read as DTS when the program carries Blu-ray's
 * HDMV registration.
 */
@OptIn(UnstableApi::class)
fun ExtractorsFactory.withHdmvTsSupport(
    mode: Int,
    payloadReaderFlags: Int,
    subtitleFormats: List<Format>,
    timestampSearchBytes: Int,
): ExtractorsFactory {
    return ExtractorsFactory {
        val extractors = createExtractors()
        extractors.forEachIndexed { index, extractor ->
            if (extractor is TsExtractor) {
                val readers = HdmvTsPayloadReaderFactory(
                    DefaultTsPayloadReaderFactory(payloadReaderFlags, subtitleFormats),
                )
                // The subtitle handling DefaultExtractorsFactory gives its own
                // TS extractor.
                val tsExtractor = TsExtractor(
                    mode,
                    0,
                    DefaultSubtitleParserFactory(),
                    TimestampAdjuster(0),
                    readers,
                    timestampSearchBytes,
                )
                extractors[index] = HdmvTsExtractor(tsExtractor, readers)
            }
        }
        extractors
    }
}

/** Checks for the HDMV registration before the TS extractor reads the PMT. */
@UnstableApi
internal class HdmvTsExtractor(
    delegate: TsExtractor,
    private val readers: HdmvTsPayloadReaderFactory,
) : ForwardingExtractor(delegate) {
    override fun sniff(input: ExtractorInput): Boolean {
        readers.hdmv = HdmvRegistration.find(input)
        input.resetPeekPosition()
        return super.sniff(input)
    }
}

@UnstableApi
internal class HdmvTsPayloadReaderFactory(
    private val delegate: TsPayloadReader.Factory,
) : TsPayloadReader.Factory {

    var hdmv = false

    override fun createInitialPayloadReaders(): SparseArray<TsPayloadReader> =
        delegate.createInitialPayloadReaders()

    override fun createPayloadReader(
        streamType: Int,
        esInfo: TsPayloadReader.EsInfo,
    ): TsPayloadReader? {
        if (hdmv && streamType in HDMV_DTS_STREAM_TYPES) {
            return PesReader(HdmvDtsReader(esInfo.language, esInfo.roleFlags))
        }
        return delegate.createPayloadReader(streamType, esInfo)
    }

    private companion object {
        // Core, DTS-HD High Resolution and DTS-HD Master Audio.
        val HDMV_DTS_STREAM_TYPES = setOf(0x82, 0x85, 0x86)
    }
}

/**
 * Looks for Blu-ray's HDMV registration in the program descriptors of the
 * PMT, which a Blu-ray stream opens with right after its PAT. Media3 skips
 * those descriptors.
 */
internal object HdmvRegistration {

    fun find(input: ExtractorInput): Boolean {
        val data = ByteArray(PEEK_BYTES)
        var length = 0
        while (length < data.size) {
            val read = input.peek(data, length, data.size - length)
            if (read == C.RESULT_END_OF_INPUT) break
            length += read
        }
        return find(data, length)
    }

    fun find(data: ByteArray, length: Int): Boolean {
        var packet = firstPacket(data, length) ?: return false
        var pmtPid = -1
        while (packet + PACKET_SIZE <= length && data[packet] == SYNC_BYTE) {
            val section = sectionStart(data, packet)
            if (section >= 0) {
                val pid = ((data[packet + 1].toInt() and 0x1F) shl 8) or
                    (data[packet + 2].toInt() and 0xFF)
                val end = packet + PACKET_SIZE
                if (pid == 0 && pmtPid < 0) {
                    pmtPid = pmtPid(data, section, end)
                } else if (pid == pmtPid) {
                    return hasRegistration(data, section, end)
                }
            }
            packet += PACKET_SIZE
        }
        return false
    }

    private fun firstPacket(data: ByteArray, length: Int): Int? =
        (0 until minOf(PACKET_SIZE, length)).firstOrNull { start ->
            (start until length step PACKET_SIZE).take(3).all { data[it] == SYNC_BYTE }
        }

    // Where a section starting in this packet begins, or -1 when none does.
    private fun sectionStart(data: ByteArray, packet: Int): Int {
        val end = packet + PACKET_SIZE
        if (data[packet + 1].toInt() and 0x40 == 0) return -1
        val adaptation = (data[packet + 3].toInt() shr 4) and 0x03
        if (adaptation and 0x01 == 0) return -1
        var pos = packet + 4
        if (adaptation == 0x03) pos += 1 + (data[pos].toInt() and 0xFF)
        if (pos >= end) return -1
        pos += 1 + (data[pos].toInt() and 0xFF)
        return if (pos < end) pos else -1
    }

    private fun pmtPid(data: ByteArray, section: Int, end: Int): Int {
        if (section + 8 > end || data[section].toInt() != 0x00) return -1
        val entriesEnd = minOf(end, section + 3 + sectionLength(data, section) - 4)
        var pos = section + 8
        while (pos + 4 <= entriesEnd) {
            val program = ((data[pos].toInt() and 0xFF) shl 8) or (data[pos + 1].toInt() and 0xFF)
            if (program != 0) {
                return ((data[pos + 2].toInt() and 0x1F) shl 8) or (data[pos + 3].toInt() and 0xFF)
            }
            pos += 4
        }
        return -1
    }

    private fun hasRegistration(data: ByteArray, section: Int, end: Int): Boolean {
        if (section + 12 > end || data[section].toInt() != 0x02) return false
        val infoLength = ((data[section + 10].toInt() and 0x0F) shl 8) or
            (data[section + 11].toInt() and 0xFF)
        var pos = section + 12
        val infoEnd = minOf(end, pos + infoLength)
        while (pos + 2 <= infoEnd) {
            val tag = data[pos].toInt() and 0xFF
            val size = data[pos + 1].toInt() and 0xFF
            if (tag == REGISTRATION_TAG && size >= 4 && pos + 6 <= infoEnd) {
                val identifier = data.rb32(pos + 2)
                if (identifier == HDMV || identifier == HDPR) return true
            }
            pos += 2 + size
        }
        return false
    }

    private fun sectionLength(data: ByteArray, section: Int): Int =
        ((data[section + 1].toInt() and 0x0F) shl 8) or (data[section + 2].toInt() and 0xFF)

    private const val PACKET_SIZE = 188
    private const val PEEK_BYTES = PACKET_SIZE * 8
    private const val SYNC_BYTE = 0x47.toByte()
    private const val REGISTRATION_TAG = 0x05
    private const val HDMV = 0x48444D56L
    private const val HDPR = 0x48445052L
}
