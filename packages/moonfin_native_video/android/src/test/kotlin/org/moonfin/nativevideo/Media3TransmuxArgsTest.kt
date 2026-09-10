package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class Media3TransmuxArgsTest {

    private fun validArgs(): Map<String, Any?> = mapOf(
        "taskId" to "item::1",
        "url" to "https://server/Videos/item/stream?Static=false",
        "headers" to mapOf(
            "Authorization" to "MediaBrowser Token=\"t\"",
            "X-Emby-Token" to "t",
        ),
        "outputPath" to "/downloads/movie.mp4",
        "allowUntrustedTls" to true,
    )

    @Test
    fun `a full argument map parses with every field`() {
        val args = parseTransmuxStartArgs(validArgs())!!
        assertEquals("item::1", args.taskId)
        assertEquals("https://server/Videos/item/stream?Static=false", args.url)
        assertEquals("t", args.headers["X-Emby-Token"])
        assertEquals("/downloads/movie.mp4", args.outputPath)
        assertTrue(args.allowUntrustedTls)
    }

    @Test
    fun `missing tls flag reads as untrusted off`() {
        val args = parseTransmuxStartArgs(validArgs() - "allowUntrustedTls")
        assertFalse(args!!.allowUntrustedTls)
    }

    @Test
    fun `absent headers parse as empty rather than failing`() {
        val args = parseTransmuxStartArgs(validArgs() - "headers")
        assertTrue(args!!.headers.isEmpty())
    }

    @Test
    fun `missing or blank required fields refuse to parse`() {
        assertNull(parseTransmuxStartArgs(null))
        assertNull(parseTransmuxStartArgs("not a map"))
        assertNull(parseTransmuxStartArgs(validArgs() - "taskId"))
        assertNull(parseTransmuxStartArgs(validArgs() - "url"))
        assertNull(parseTransmuxStartArgs(validArgs() - "outputPath"))
        assertNull(parseTransmuxStartArgs(validArgs() + ("url" to "")))
    }

    @Test
    fun `non-string header entries are dropped, not crashed on`() {
        val args = parseTransmuxStartArgs(
            validArgs() + ("headers" to mapOf("ok" to "yes", "bad" to 7)),
        )
        assertEquals(mapOf("ok" to "yes"), args!!.headers)
    }

    // These maps are what the Dart side switches on. The Dart test asserts
    // the same shapes from its end.
    @Test
    fun `event maps carry the fields the dart side reads`() {
        assertEquals(
            mapOf("event" to "progress", "taskId" to "t", "bytesWritten" to 42L),
            transmuxProgressEvent("t", 42L),
        )
        assertEquals(
            mapOf(
                "event" to "complete",
                "taskId" to "t",
                "videoConversionProcess" to 2,
                "audioConversionProcess" to 2,
            ),
            transmuxCompleteEvent(
                taskId = "t",
                videoConversionProcess = 2,
                audioConversionProcess = 2,
            ),
        )
        assertEquals(
            mapOf(
                "event" to "error",
                "taskId" to "t",
                "message" to "read timed out",
                "errorCode" to 2001,
            ),
            transmuxErrorEvent("t", "read timed out", 2001),
        )
        assertEquals(
            mapOf("event" to "cancelled", "taskId" to "t"),
            transmuxCancelledEvent("t"),
        )
    }
}
