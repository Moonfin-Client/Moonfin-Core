package org.moonfin.androidtv

import java.io.ByteArrayOutputStream
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class TombstoneTest {

    private fun ByteArrayOutputStream.varint(value: Long) {
        var v = value
        while (v and 0x7fL.inv() != 0L) {
            write(((v and 0x7f) or 0x80).toInt())
            v = v ushr 7
        }
        write(v.toInt())
    }

    private fun proto(build: ByteArrayOutputStream.() -> Unit): ByteArray =
        ByteArrayOutputStream().apply(build).toByteArray()

    private fun ByteArrayOutputStream.uint(field: Int, value: Long) {
        varint((field shl 3).toLong())
        varint(value)
    }

    private fun ByteArrayOutputStream.bytes(field: Int, value: ByteArray) {
        varint(((field shl 3) or 2).toLong())
        varint(value.size.toLong())
        write(value)
    }

    private fun ByteArrayOutputStream.text(field: Int, value: String) = bytes(field, value.toByteArray())

    private fun ByteArrayOutputStream.fixed64(field: Int) {
        varint(((field shl 3) or 1).toLong())
        write(ByteArray(8))
    }

    private fun frame(file: String, function: String = "", offset: Long = 0, relPc: Long = 0) = proto {
        uint(1, relPc)
        if (function.isNotEmpty()) text(4, function)
        if (offset > 0) uint(5, offset)
        text(6, file)
    }

    private fun thread(id: Int, name: String, vararg frames: ByteArray) = proto {
        uint(1, id.toLong())
        text(2, name)
        frames.forEach { bytes(4, it) }
    }

    private fun threadEntry(id: Int, thread: ByteArray) = proto {
        uint(1, id.toLong())
        bytes(2, thread)
    }

    private fun log(tid: Int, priority: Int, tag: String, message: String) = proto {
        uint(3, tid.toLong())
        uint(4, priority.toLong())
        text(5, tag)
        text(6, message)
    }

    // Shaped like the FFI callback aborts Play reported.
    private val ffiAbort = proto {
        uint(5, 7000)
        uint(6, 7421)
        fixed64(99)
        bytes(
            16,
            threadEntry(
                7421,
                thread(
                    7421,
                    "mpv/core",
                    frame("/system/lib/libc.so", "tgkill", 12),
                    frame("/system/lib/libc.so", "abort", 54),
                    frame("/data/app/lib/arm/libflutter.so", "DLRT_GetFfiCallbackMetadata", 0),
                    frame("[anon:FfiCallbackMetadata::TrampolinePage]", relPc = 0x154c),
                ),
            ),
        )
        bytes(16, threadEntry(7000, thread(7000, "main", frame("/system/lib/libc.so", "epoll_wait"))))
        bytes(
            18,
            proto {
                text(1, "main")
                bytes(2, log(7000, 6, "flutter", "unrelated error on another thread"))
                bytes(2, log(7421, 4, "DartVM", "an info line"))
                bytes(2, log(7421, 6, "DartVM", "Callback invoked after it has been deleted.\n"))
            },
        )
    }

    @Test
    fun `the crashing thread and its frames are picked out`() {
        val summary = readTombstone(ffiAbort)!!

        assertEquals("mpv/core", summary.threadName)
        assertEquals(
            listOf(
                "#00 libc.so (tgkill+12)",
                "#01 libc.so (abort+54)",
                "#02 libflutter.so (DLRT_GetFfiCallbackMetadata)",
                "#03 [anon:FfiCallbackMetadata::TrampolinePage] pc 154c",
            ),
            summary.frames,
        )
    }

    @Test
    fun `only the crashing thread's error lines are kept`() {
        val summary = readTombstone(ffiAbort)!!

        assertEquals(listOf("DartVM: Callback invoked after it has been deleted."), summary.errorLogs)
        assertNull(summary.abortMessage)
    }

    @Test
    fun `frames stop at the limit`() {
        assertEquals(2, readTombstone(ffiAbort, maxFrames = 2)!!.frames.size)
    }

    @Test
    fun `an abort message comes through as is`() {
        val summary = readTombstone(proto { uint(6, 1); text(14, "Callback invoked after it has been deleted.") })

        assertEquals("Callback invoked after it has been deleted.", summary?.abortMessage)
    }

    @Test
    fun `a cut off tombstone gives nothing`() {
        assertNull(readTombstone(ffiAbort.copyOf(ffiAbort.size - 3)))
    }
}
