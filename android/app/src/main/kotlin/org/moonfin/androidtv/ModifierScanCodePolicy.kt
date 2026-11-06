package org.moonfin.androidtv

import android.view.KeyEvent

/**
 * Some remote firmwares send buttons like OK with a Ctrl, Shift or Alt scan
 * code. Flutter takes the physical key from the scan code, so it treats the
 * button as that modifier, releases it early because the meta state says no
 * modifier is down, then drops the real key-up. With the scan code cleared,
 * Flutter falls back to the keycode.
 */
internal object ModifierScanCodePolicy {
    fun shouldClearScanCode(keyCode: Int, scanCode: Int): Boolean = when (scanCode) {
        29 -> keyCode != KeyEvent.KEYCODE_CTRL_LEFT
        97 -> keyCode != KeyEvent.KEYCODE_CTRL_RIGHT
        42 -> keyCode != KeyEvent.KEYCODE_SHIFT_LEFT
        54 -> keyCode != KeyEvent.KEYCODE_SHIFT_RIGHT
        56 -> keyCode != KeyEvent.KEYCODE_ALT_LEFT
        100 -> keyCode != KeyEvent.KEYCODE_ALT_RIGHT
        else -> false
    }

    fun forFlutter(event: KeyEvent): KeyEvent {
        if (!shouldClearScanCode(event.keyCode, event.scanCode)) return event
        return KeyEvent(
            event.downTime,
            event.eventTime,
            event.action,
            event.keyCode,
            event.repeatCount,
            event.metaState,
            event.deviceId,
            0,
            event.flags,
            event.source,
        )
    }
}
