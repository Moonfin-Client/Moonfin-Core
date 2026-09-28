package org.moonfin.nativevideo

import java.nio.ByteBuffer
import org.moonfin.nativevideo.iec.DtsFraming
import org.moonfin.nativevideo.iec.Iec61937Exception

/**
 * Cuts DTS-HD access units down to their DTS core frames. A DTS track is sized
 * for the core's bitrate, so the extension data a DTS decoder skips anyway
 * would otherwise crowd its buffer.
 */
internal class DtsCoreExtractor {

    private var input = ByteArray(0)
    private var output: ByteBuffer = ByteBuffer.allocateDirect(0)

    /**
     * The core frames from [buffer]'s remaining bytes, or null when they don't
     * parse as DTS core frames. [buffer] itself is left untouched, and the
     * result is only valid until the next call.
     */
    fun extract(buffer: ByteBuffer): ByteBuffer? {
        val length = buffer.remaining()
        if (input.size < length) input = ByteArray(length)
        buffer.duplicate().get(input, 0, length)
        if (output.capacity() < length) output = ByteBuffer.allocateDirect(length)
        output.clear()
        var pos = 0
        while (pos < length) {
            val header = try {
                DtsFraming.parseCoreHeader(input, pos, length - pos)
            } catch (_: Iec61937Exception) {
                return null
            }
            val auLength = DtsFraming.accessUnitLength(input, pos, length, header.coreSizeBytes)
            if (header.coreSizeBytes > auLength) return null
            output.put(input, pos, header.coreSizeBytes)
            pos += auLength
        }
        output.flip()
        return output
    }
}
