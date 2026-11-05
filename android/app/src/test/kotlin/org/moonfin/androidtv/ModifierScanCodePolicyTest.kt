package org.moonfin.androidtv

import android.view.KeyEvent
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class ModifierScanCodePolicyTest {
    @Test
    fun `a button sent with a modifier scan code is cleared`() {
        assertTrue(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_DPAD_CENTER, 97))
        assertTrue(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_ENTER, 29))
        assertTrue(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_BACK, 42))
        assertTrue(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_MENU, 100))
    }

    @Test
    fun `a modifier sent with the other side's scan code is cleared`() {
        assertTrue(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_CTRL_LEFT, 97))
        assertTrue(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_SHIFT_RIGHT, 42))
    }

    @Test
    fun `real modifier keys are left alone`() {
        assertFalse(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_CTRL_LEFT, 29))
        assertFalse(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_CTRL_RIGHT, 97))
        assertFalse(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_SHIFT_LEFT, 42))
        assertFalse(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_SHIFT_RIGHT, 54))
        assertFalse(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_ALT_LEFT, 56))
        assertFalse(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_ALT_RIGHT, 100))
    }

    @Test
    fun `ordinary scan codes are left alone`() {
        assertFalse(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_DPAD_CENTER, 353))
        assertFalse(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_ENTER, 28))
        assertFalse(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_DPAD_CENTER, 0))
        assertFalse(ModifierScanCodePolicy.shouldClearScanCode(KeyEvent.KEYCODE_META_LEFT, 125))
    }
}
