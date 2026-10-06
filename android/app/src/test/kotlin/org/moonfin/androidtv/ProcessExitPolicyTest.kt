package org.moonfin.androidtv

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class ProcessExitPolicyTest {

    @Test
    fun `crashes and ANRs are reported however the app was placed`() {
        assertTrue(isWorthReporting(REASON_CRASH_NATIVE, 400))
        assertTrue(isWorthReporting(REASON_CRASH, 400))
        assertTrue(isWorthReporting(REASON_ANR, 100))
    }

    @Test
    fun `a low memory kill only counts while the app was on screen`() {
        assertTrue(isWorthReporting(REASON_LOW_MEMORY, 100))
        assertTrue(isWorthReporting(REASON_LOW_MEMORY, 200))
        assertFalse(isWorthReporting(REASON_LOW_MEMORY, 400))
        assertFalse(isWorthReporting(REASON_SIGNALED, 400))
    }

    @Test
    fun `routine exits are left out`() {
        val exitSelf = 1
        val userRequested = 10
        assertFalse(isWorthReporting(exitSelf, 100))
        assertFalse(isWorthReporting(userRequested, 100))
    }

    @Test
    fun `the summary leads with the views and fits what Android keeps`() {
        assertEquals(
            "hc=media3-preview route=/home",
            String(processStateSummary("route=/home", "media3-preview"), Charsets.UTF_8),
        )

        val long = processStateSummary("route=/" + "a".repeat(300), "media3-main")
        assertEquals(MAX_PROCESS_STATE_BYTES, long.size)
        assertTrue(String(long, Charsets.UTF_8).startsWith("hc=media3-main "))
    }

    @Test
    fun `the main thread is cut out of an ANR trace`() {
        val trace = """
            ----- pid 31031 at 2026-09-30 00:05:26 -----
            Cmd line: org.moonfin.androidtv

            "main" prio=5 tid=1 Native
              | group="main" sCount=1
              at android.os.BinderProxy.transactNative(Native method)
              at org.moonfin.nativevideo.ExoPlayerAudioPipeline.release(ExoPlayerAudioPipeline.kt:42)

            "Signal Catcher" daemon prio=10 tid=2 Runnable
        """.trimIndent()

        val stack = mainThreadStack(trace.lineSequence())

        assertEquals(4, stack?.lines()?.size)
        assertTrue(stack!!.startsWith("\"main\""))
        assertTrue(stack.endsWith("ExoPlayerAudioPipeline.kt:42)"))
    }

    @Test
    fun `a trace without a main thread gives nothing`() {
        assertNull(mainThreadStack(sequenceOf("\"Signal Catcher\" daemon", "  at x")))
    }
}
