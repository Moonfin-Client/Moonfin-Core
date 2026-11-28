package org.moonfin.nativevideo

import androidx.media3.common.C
import androidx.media3.common.audio.AudioProcessor
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.math.PI
import kotlin.math.abs
import kotlin.math.sin
import kotlin.math.sqrt

class NightModeCompressorTest {

    private val rate = 48_000
    private val stereo = AudioProcessor.AudioFormat(rate, 2, C.ENCODING_PCM_16BIT)

    private fun compressor(enabled: Boolean = true): NightModeCompressor =
        NightModeCompressor { enabled }.also {
            it.configure(stereo)
            it.flush(AudioProcessor.StreamMetadata.DEFAULT)
        }

    private fun sine(amplitude: Float, seconds: Float, startFrame: Int = 0): ShortArray {
        val frames = (rate * seconds).toInt()
        return ShortArray(frames * 2) { i ->
            val t = (startFrame + i / 2).toDouble() / rate
            (amplitude * 32767 * sin(2 * PI * 440 * t)).toInt().toShort()
        }
    }

    private fun run(processor: NightModeCompressor, samples: ShortArray): ShortArray {
        val result = ShortArray(samples.size)
        var written = 0
        // 10 ms chunks, like a decoder hands the sink.
        samples.toList().chunked(960).forEach { chunk ->
            val input = ByteBuffer.allocate(chunk.size * 2).order(ByteOrder.LITTLE_ENDIAN)
            chunk.forEach { input.putShort(it) }
            input.flip()
            processor.queueInput(input)
            val output = processor.output.order(ByteOrder.LITTLE_ENDIAN)
            while (output.hasRemaining()) result[written++] = output.getShort()
        }
        assertEquals(samples.size, written)
        return result
    }

    private fun rms(samples: ShortArray, from: Int): Double =
        sqrt(samples.drop(from).sumOf { it.toDouble() * it } / (samples.size - from))

    @Test
    fun `stays out of the chain while night mode is off`() {
        assertFalse(compressor(enabled = false).isActive)
        assertTrue(compressor().isActive)
    }

    @Test
    fun `a flush after a reset with no format doesn't throw`() {
        val processor = compressor()
        processor.reset()
        processor.flush(AudioProcessor.StreamMetadata.DEFAULT)
        assertFalse(processor.isActive)
    }

    @Test
    fun `quiet audio below the knee gets the full makeup gain`() {
        val input = sine(amplitude = 0.00316f, seconds = 0.5f)
        val output = run(compressor(), input)
        val ratio = rms(output, from = 4800) / rms(input, from = 4800)
        assertEquals(3.162, ratio, 0.05)
    }

    @Test
    fun `loud audio comes out much quieter`() {
        val input = sine(amplitude = 0.9f, seconds = 1f)
        val output = run(compressor(), input)
        val ratio = rms(output, from = rate) / rms(input, from = rate)
        // The static curve alone gives about 0.26 for this level.
        assertTrue("ratio $ratio", ratio < 0.35)
    }

    @Test
    fun `a sudden loud hit never passes the limiter`() {
        val quiet = sine(amplitude = 0.001f, seconds = 0.5f)
        val loud = sine(amplitude = 1f, seconds = 0.2f, startFrame = quiet.size / 2)
        val output = run(compressor(), quiet + loud)
        val ceiling = NightModeCompressor.LIMIT * 32768 + 1
        assertTrue(output.all { abs(it.toInt()) <= ceiling })
    }

    @Test
    fun `the knee joins both slopes without a step`() {
        val c = NightModeCompressor { true }
        assertEquals(0f, c.staticReductionDb(-40f), 0f)
        assertEquals(0f, c.staticReductionDb(-33f), 1e-4f)
        assertEquals(-0.75f * 3f, c.staticReductionDb(-27f), 1e-4f)
        assertEquals(-0.75f * 30f, c.staticReductionDb(0f), 1e-4f)
    }
}
