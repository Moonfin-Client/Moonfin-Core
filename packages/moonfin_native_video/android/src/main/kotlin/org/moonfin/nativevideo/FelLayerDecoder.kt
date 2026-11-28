package org.moonfin.nativevideo

import android.graphics.ImageFormat
import android.media.Image
import android.media.MediaCodec
import android.media.MediaCodecInfo
import android.media.MediaCodecList
import android.media.MediaFormat
import android.os.Build
import android.os.SystemClock
import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.math.abs

/**
 * One layer's hardware decoder for the FEL fold's samples, handing over the
 * luma of each wanted picture as it comes out. It stays open between GOPs and
 * is flushed after each one, since opening a decoder is the slow part on TV
 * boxes.
 *
 * Pictures are read as P010 only, so the fold runs only where the HEVC
 * decoder can hand that back, see [givesTenBit]. Boxes that only give 8-bit
 * pictures are the older, weaker ones, which can't decode on the side without
 * stalling playback.
 */
internal class FelLayerDecoder {

    class AccessUnit(val timeUs: Long, val data: ByteArray)

    /** How lasting a failure is: this GOP only, this playback, or this device. */
    enum class Severity { TRANSIENT, PLAYBACK, DEVICE }

    /** [failure] is null when every wanted picture came out. */
    class Outcome(
        val decoderName: String?,
        val failure: String? = null,
        val severity: Severity = Severity.TRANSIENT,
        /** The decoder couldn't be opened, which another open decoder may be the cause of. */
        val openFailed: Boolean = false,
    )

    private var codec: MediaCodec? = null
    private var name: String? = null
    private var width = 0
    private var height = 0
    private var csd: ByteArray? = null
    private var maxInput = 0

    val isOpen: Boolean get() = codec != null

    fun decode(
        width: Int,
        height: Int,
        csd: ByteArray?,
        units: List<AccessUnit>,
        wanted: Set<Long>,
        toleranceUs: Long,
        deadlineMs: Long,
        onPicture: (timeUs: Long, plane: FelLumaPlane) -> Unit,
    ): Outcome {
        if (units.isEmpty() || wanted.isEmpty()) return Outcome(name, "nothing to decode")
        val codec = open(width, height, csd, units.maxOf { it.data.size } + 4096)
            ?: return Outcome(name, "the decoder couldn't be opened for ${width}x$height", Severity.PLAYBACK, openFailed = true)
        try {
            val info = MediaCodec.BufferInfo()
            val found = HashSet<Long>()
            var next = 0
            var inputDone = false
            while (found.size < wanted.size) {
                if (SystemClock.elapsedRealtime() > deadlineMs) {
                    return Outcome(name, "timed out with ${wanted.size - found.size} pictures left")
                }
                if (!inputDone) {
                    val index = codec.dequeueInputBuffer(DEQUEUE_TIMEOUT_US)
                    if (index >= 0) {
                        if (next < units.size) {
                            val unit = units[next++]
                            val buffer = codec.getInputBuffer(index)
                            if (buffer == null || buffer.capacity() < unit.data.size) {
                                return Outcome(name, "an input buffer couldn't hold an access unit")
                            }
                            buffer.clear()
                            buffer.put(unit.data)
                            codec.queueInputBuffer(index, 0, unit.data.size, unit.timeUs, 0)
                        } else {
                            codec.queueInputBuffer(index, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM)
                            inputDone = true
                        }
                    }
                }
                val out = codec.dequeueOutputBuffer(info, DEQUEUE_TIMEOUT_US)
                if (out < 0) continue
                val endOfStream = (info.flags and MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0
                val match = if (endOfStream && info.size == 0) {
                    null
                } else {
                    wanted.firstOrNull { it !in found && abs(it - info.presentationTimeUs) <= toleranceUs }
                }
                if (match != null) {
                    val image = codec.getOutputImage(out)
                    if (image == null || image.format != IMAGE_FORMAT_P010) {
                        val problem = when {
                            image == null -> "the decoder gives no readable picture"
                            image.format == ImageFormat.YUV_420_888 -> "the decoder gives 8-bit pictures, not P010"
                            else -> "the decoder gives picture format ${image.format}"
                        }
                        image?.close()
                        codec.releaseOutputBuffer(out, false)
                        return Outcome(name, problem, Severity.DEVICE)
                    }
                    try {
                        onPicture(match, P010Luma(image))
                    } finally {
                        image.close()
                    }
                    found += match
                }
                codec.releaseOutputBuffer(out, false)
                if (endOfStream) break
            }
            val missing = wanted.size - found.size
            return Outcome(name, if (missing > 0) "$missing pictures never came out" else null)
        } catch (e: Exception) {
            release()
            return Outcome(name, "decoder error (${e.javaClass.simpleName}: ${e.message})")
        } finally {
            // Flushing readies an open decoder for the next GOP's keyframe.
            runCatching { this.codec?.flush() }.onFailure { release() }
        }
    }

    fun release() {
        codec?.let {
            runCatching { it.stop() }
            runCatching { it.release() }
        }
        codec = null
    }

    /** The open decoder when it already fits, otherwise a fresh one, or null when none opens. */
    private fun open(width: Int, height: Int, csd: ByteArray?, inputSize: Int): MediaCodec? {
        val current = codec
        if (current != null && width == this.width && height == this.height &&
            csd.contentEquals(this.csd) && inputSize <= maxInput
        ) {
            return current
        }
        release()
        val created = try {
            MediaCodec.createDecoderByType(MediaFormat.MIMETYPE_VIDEO_HEVC)
        } catch (e: Exception) {
            return null
        }
        name = runCatching { created.name }.getOrNull()
        // Room for a larger access unit, so the decoder rarely needs reopening.
        val inputLimit = inputSize * 2
        if (!configure(created, width, height, csd, inputLimit) || runCatching { created.start() }.isFailure) {
            runCatching { created.release() }
            return null
        }
        codec = created
        this.width = width
        this.height = height
        this.csd = csd
        maxInput = inputLimit
        return created
    }

    private fun configure(codec: MediaCodec, width: Int, height: Int, csd: ByteArray?, maxInput: Int): Boolean {
        if (Build.VERSION.SDK_INT < 33) return false
        val format = MediaFormat.createVideoFormat(MediaFormat.MIMETYPE_VIDEO_HEVC, width, height)
        format.setInteger(MediaFormat.KEY_COLOR_FORMAT, MediaCodecInfo.CodecCapabilities.COLOR_FormatYUVP010)
        format.setInteger(MediaFormat.KEY_MAX_INPUT_SIZE, maxInput)
        if (csd != null) format.setByteBuffer("csd-0", ByteBuffer.wrap(csd))
        return runCatching { codec.configure(format, null, null, 0) }.isSuccess
    }

    /** The visible luma of a P010 picture, whose 10-bit codes sit in the top bits of each 16-bit sample. */
    private class P010Luma(image: Image) : FelLumaPlane {
        private val plane = image.planes[0]
        private val buffer: ByteBuffer = plane.buffer.duplicate().order(ByteOrder.LITTLE_ENDIAN)
        private val rowStride = plane.rowStride
        private val pixelStride = maxOf(plane.pixelStride, 2)
        private val left = image.cropRect.left
        private val top = image.cropRect.top
        override val width = image.cropRect.width()
        override val height = image.cropRect.height()

        override fun luma(x: Int, y: Int): Int =
            (buffer.getShort((top + y) * rowStride + (left + x) * pixelStride).toInt() and 0xFFFF) ushr 6
    }

    companion object {
        private const val DEQUEUE_TIMEOUT_US = 10_000L

        // ImageFormat.YCBCR_P010, written out because it only exists from API 31.
        private const val IMAGE_FORMAT_P010 = 0x36

        /**
         * Whether the HEVC decoder a side decode gets can hand back P010, which
         * an app can only ask for from API 33.
         */
        fun givesTenBit(): Boolean {
            if (Build.VERSION.SDK_INT < 33) return false
            return runCatching {
                // createDecoderByType hands out the first decoder listed for the type.
                MediaCodecList(MediaCodecList.REGULAR_CODECS).codecInfos
                    .firstOrNull { info ->
                        !info.isEncoder &&
                            info.supportedTypes.any { it.equals(MediaFormat.MIMETYPE_VIDEO_HEVC, ignoreCase = true) }
                    }
                    ?.getCapabilitiesForType(MediaFormat.MIMETYPE_VIDEO_HEVC)
                    ?.colorFormats
                    ?.contains(MediaCodecInfo.CodecCapabilities.COLOR_FormatYUVP010) == true
            }.getOrDefault(false)
        }
    }
}
