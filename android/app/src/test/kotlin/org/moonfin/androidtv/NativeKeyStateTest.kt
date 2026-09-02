package org.moonfin.androidtv

import android.view.KeyEvent
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class NativeKeyStateTest {
    @Test
    fun `releasing a face button preserves a held direction`() {
        val left = 1 shl NativeMappingTables.RETRO_LEFT
        val a = 1 shl NativeMappingTables.RETRO_A

        var mask = NativeDigitalKeyState.transition(0, left, pressed = true)
        mask = NativeDigitalKeyState.transition(mask, a, pressed = true)
        assertEquals(left or a, mask)

        mask = NativeDigitalKeyState.transition(mask, a, pressed = false)
        assertEquals(left, mask)
    }

    @Test
    fun `only repeated down events are ignored`() {
        assertTrue(NativeKeyEventPolicy.shouldIgnoreRepeat(KeyEvent.ACTION_DOWN, repeatCount = 1))
        assertFalse(NativeKeyEventPolicy.shouldIgnoreRepeat(KeyEvent.ACTION_DOWN, repeatCount = 0))
        assertFalse(NativeKeyEventPolicy.shouldIgnoreRepeat(KeyEvent.ACTION_UP, repeatCount = 1))
    }

    @Test
    fun `another remote button cannot cancel a physically held direction`() {
        assertTrue(
            NativeKeyEventPolicy.shouldIgnoreCanceledRemoteDpadRelease(
                action = KeyEvent.ACTION_UP,
                canceled = true,
                keyCode = KeyEvent.KEYCODE_DPAD_LEFT,
                isRemote = true,
            ),
        )

        // The release the user actually makes still comes through, so a
        // direction cannot be left held.
        assertFalse(
            NativeKeyEventPolicy.shouldIgnoreCanceledRemoteDpadRelease(
                action = KeyEvent.ACTION_UP,
                canceled = false,
                keyCode = KeyEvent.KEYCODE_DPAD_LEFT,
                isRemote = true,
            ),
        )
        assertFalse(
            NativeKeyEventPolicy.shouldIgnoreCanceledRemoteDpadRelease(
                action = KeyEvent.ACTION_UP,
                canceled = true,
                keyCode = KeyEvent.KEYCODE_DPAD_LEFT,
                isRemote = false,
            ),
        )
    }
}
