package org.moonfin.nativevideo

import androidx.media3.common.Format
import androidx.media3.common.MimeTypes
import androidx.media3.exoplayer.audio.AudioSink
import java.io.ByteArrayOutputStream
import java.lang.reflect.Proxy
import java.nio.ByteBuffer
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test
import org.moonfin.nativevideo.iec.DtsFraming

class DtsCoreFallbackTest {

    private val dtsHd = Format.Builder()
        .setSampleMimeType(MimeTypes.AUDIO_DTS_HD)
        .setChannelCount(8)
        .setSampleRate(48000)
        .build()

    @Test fun dtsHdIsOfferedAsItsCoreWhenOnlyDtsIsAllowed() {
        val sink = RecordingSink()
        val policySink = PassthroughPolicyAudioSink(sink.proxy, manual("dts"))

        assertEquals(AudioSink.SINK_FORMAT_SUPPORTED_DIRECTLY, policySink.getFormatSupport(dtsHd))
        assertEquals(MimeTypes.AUDIO_DTS, sink.lastFormat?.sampleMimeType)
        assertEquals(6, sink.lastFormat?.channelCount)
    }

    @Test fun aHighRateDtsHdCoreRunsAtItsBaseRate() {
        val policy = manual("dts")
        fun coreRate(rate: Int) =
            policy.sinkFormatFor(dtsHd.buildUpon().setSampleRate(rate).build())?.sampleRate

        assertEquals(48000, coreRate(96000))
        assertEquals(48000, coreRate(192000))
        assertEquals(44100, coreRate(88200))
        assertEquals(44100, coreRate(44100))
    }

    @Test fun dtsHdStaysDtsHdWhenItIsAllowed() {
        val sink = RecordingSink()
        val policySink = PassthroughPolicyAudioSink(sink.proxy, manual("dts", "dtshd"))

        policySink.getFormatSupport(dtsHd)
        assertEquals(MimeTypes.AUDIO_DTS_HD, sink.lastFormat?.sampleMimeType)
        assertEquals(8, sink.lastFormat?.channelCount)
    }

    @Test fun dtsHdIsDecodedWhenDtsIsNotAllowed() {
        val sink = RecordingSink()
        val policySink = PassthroughPolicyAudioSink(sink.proxy, manual("ac3"))

        assertEquals(AudioSink.SINK_FORMAT_UNSUPPORTED, policySink.getFormatSupport(dtsHd))
        assertNull(sink.lastFormat)
    }

    @Test fun onlyTheCoreFramesReachTheSink() {
        val core = resource("dts.bin")
        val (stream, frames) = withExtensions(core)
        val sink = RecordingSink()
        val policySink = PassthroughPolicyAudioSink(sink.proxy, manual("dts"))
        policySink.configure(dtsHd, 0, null)
        assertEquals(MimeTypes.AUDIO_DTS, sink.lastFormat?.sampleMimeType)

        val source = direct(stream)
        assertTrue(policySink.handleBuffer(source, 0, frames))
        assertArrayEquals(core, sink.written.single())
        assertFalse(source.hasRemaining())
    }

    @Test fun aRefusedBufferComesBackAsTheSameCore() {
        val (stream, frames) = withExtensions(resource("dts.bin"))
        val sink = RecordingSink()
        val policySink = PassthroughPolicyAudioSink(sink.proxy, manual("dts"))
        policySink.configure(dtsHd, 0, null)
        val source = direct(stream)

        sink.acceptWrites = false
        assertFalse(policySink.handleBuffer(source, 0, frames))
        val refused = sink.offered.single()

        sink.acceptWrites = true
        assertTrue(policySink.handleBuffer(source, 0, frames))
        assertSame(refused, sink.offered.last())
    }

    @Test fun bytesThatAreNotDtsDoNotExtract() {
        assertNull(DtsCoreExtractor().extract(direct(ByteArray(64) { 0x11 })))
    }

    private fun manual(vararg codecs: String) =
        AudioPassthroughPolicy(PassthroughMode.MANUAL, codecs.toSet())

    /**
     * Rebuilds [core] as DTS-HD access units by following every core frame
     * with an extension substream, returning the stream and its frame count.
     */
    private fun withExtensions(core: ByteArray): Pair<ByteArray, Int> {
        val out = ByteArrayOutputStream()
        var pos = 0
        var frames = 0
        while (pos < core.size) {
            val size = DtsFraming.parseCoreHeader(core, pos, core.size - pos).coreSizeBytes
            out.write(core, pos, size)
            out.write(EXTENSION_SYNC)
            out.write(ByteArray(60) { 0x22 })
            pos += size
            frames++
        }
        return out.toByteArray() to frames
    }

    private fun direct(bytes: ByteArray): ByteBuffer =
        ByteBuffer.allocateDirect(bytes.size).put(bytes).also { it.flip() }

    private fun resource(name: String): ByteArray =
        javaClass.getResourceAsStream("/iec/$name")!!.readBytes()

    /** A sink that answers every format as directly supported and keeps what it's handed. */
    private class RecordingSink {
        var lastFormat: Format? = null
        var acceptWrites = true
        val offered = mutableListOf<ByteBuffer>()
        val written = mutableListOf<ByteArray>()

        val proxy = Proxy.newProxyInstance(
            AudioSink::class.java.classLoader,
            arrayOf(AudioSink::class.java),
        ) { _, method, args ->
            when (method.name) {
                "getFormatSupport" -> {
                    lastFormat = args[0] as Format
                    AudioSink.SINK_FORMAT_SUPPORTED_DIRECTLY
                }
                "configure" -> {
                    lastFormat = args[0] as Format
                    null
                }
                "handleBuffer" -> {
                    val buffer = args[0] as ByteBuffer
                    offered += buffer
                    if (acceptWrites) {
                        written += ByteArray(buffer.remaining()).also { buffer.get(it) }
                    }
                    acceptWrites
                }
                else -> null
            }
        } as AudioSink
    }

    private companion object {
        val EXTENSION_SYNC = byteArrayOf(0x64, 0x58, 0x20, 0x25)
    }
}
