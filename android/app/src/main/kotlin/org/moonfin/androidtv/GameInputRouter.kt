package org.moonfin.androidtv

import android.view.InputDevice
import android.view.KeyEvent
import android.view.MotionEvent

/**
 * Owns Android input policy and state for the EmulatorJS (WebView) path only.
 * EmulatorJS remains the mapping and persistence authority; this router only
 * translates Android events to its upstream labels. The native libretro path
 * is owned end-to-end by [NativePadInput], checked first in
 * [MainActivity.dispatchKeyEvent] so nothing gameplay-shaped reaches here
 * while a native session is active.
 */
internal class GameInputRouter(
    private val callbacks: Callbacks,
) {
    internal interface Callbacks {
        fun onEmulatorButton(label: String, pressed: Boolean, device: Map<String, String>?)
        fun onEmulatorKeyboard(keyCode: Int)
        fun onNavigate(axis: String, direction: String)
    }

    private var gameActive = false
    private var emulatorControlsActive = false
    private var hatX = 0
    private var hatY = 0
    private var motionDpadX = 0
    private var motionDpadY = 0
    private val pressedDpadKeys = mutableSetOf<Int>()
    private var leftTriggerPressed = false
    private var rightTriggerPressed = false
    private var navX = 0
    private var navY = 0

    // Android device IDs can change after reconnecting. Cache the derived
    // identity by descriptor for the active game session only.
    private val deviceCache = mutableMapOf<String, Map<String, String>>()

    fun setGameActive(active: Boolean) {
        gameActive = active
        resetSessionState()
    }

    fun setEmulatorControlsActive(active: Boolean) {
        emulatorControlsActive = active
    }

    fun gamepadDevices(): List<Map<String, String>> =
        InputDevice.getDeviceIds()
            .asIterable()
            .mapNotNull { InputDevice.getDevice(it) }
            .filter(::isPhysicalGamepad)
            .map(::deviceIdentity)

    /** Returns true only when this router consumed the event. */
    fun onKeyEvent(event: KeyEvent): Boolean {
        if (!gameActive) return false

        val device = physicalDevice(event.device)
        if (handlePhysicalDpadKey(event, device)) return true
        val label = emulatorGamepadLabel(event.keyCode)
        if (label != null) {
            // Let Android's normal back handling operate outside the emulator controls.
            if (label == BACK && !emulatorControlsActive) return false

            val isRemoteNavigationRepeat =
                emulatorControlsActive &&
                    device == null &&
                    label in DPAD_LABELS &&
                    event.action == KeyEvent.ACTION_DOWN
            if ((event.repeatCount == 0 || isRemoteNavigationRepeat) && isButtonTransition(event)) {
                callbacks.onEmulatorButton(
                    label,
                    event.action == KeyEvent.ACTION_DOWN,
                    device?.let(::deviceIdentity),
                )
            }
            return true
        }

        if (emulatorControlsActive &&
            event.action == KeyEvent.ACTION_DOWN &&
            event.repeatCount == 0
        ) {
            domKeyCode(event.keyCode)?.let {
                callbacks.onEmulatorKeyboard(it)
                return true
            }
        }
        return false
    }

    /** Returns true when gameplay motion was consumed. */
    fun onMotionEvent(event: MotionEvent): Boolean {
        if (gameActive && isJoystickMove(event)) {
            val device = event.device
            motionDpadX = axisDirection(event, MotionEvent.AXIS_HAT_X, MotionEvent.AXIS_X)
            motionDpadY = axisDirection(event, MotionEvent.AXIS_HAT_Y, MotionEvent.AXIS_Y)
            updateGameplayDpad(device)

            updateTrigger(event, MotionEvent.AXIS_LTRIGGER, LEFT_BOTTOM_SHOULDER, leftTriggerPressed) {
                leftTriggerPressed = it
            }
            updateTrigger(event, MotionEvent.AXIS_RTRIGGER, RIGHT_BOTTOM_SHOULDER, rightTriggerPressed) {
                rightTriggerPressed = it
            }
            return true
        }

        // Outside a game the left stick drives UI focus. Ignore the HAT here:
        // Android already exposes its d-pad as keys, and double delivery can
        // cause one path to release the other's held direction.
        if (!gameActive && isJoystickMove(event)) {
            updateNavigation("h", stickDirection(event, MotionEvent.AXIS_X), navX) { navX = it }
            updateNavigation("v", stickDirection(event, MotionEvent.AXIS_Y), navY) { navY = it }
        }
        return false
    }

    private fun resetSessionState() {
        hatX = 0
        hatY = 0
        motionDpadX = 0
        motionDpadY = 0
        pressedDpadKeys.clear()
        leftTriggerPressed = false
        rightTriggerPressed = false
        navX = 0
        navY = 0
        deviceCache.clear()
    }

    private fun emitEmulatorAxisTransition(
        previous: Int,
        next: Int,
        negative: String,
        positive: String,
        device: InputDevice?,
    ) {
        val identity = physicalDevice(device)?.let(::deviceIdentity)
        if (previous == -1) callbacks.onEmulatorButton(negative, false, identity)
        if (previous == 1) callbacks.onEmulatorButton(positive, false, identity)
        if (next == -1) callbacks.onEmulatorButton(negative, true, identity)
        if (next == 1) callbacks.onEmulatorButton(positive, true, identity)
    }

    /** Returns true when this key was a D-pad transition this method fully handled. */
    private fun handlePhysicalDpadKey(event: KeyEvent, device: InputDevice?): Boolean {
        if (device == null || event.repeatCount != 0 || !isButtonTransition(event)) return false
        if (event.keyCode !in DPAD_KEY_CODES) return false
        if (event.action == KeyEvent.ACTION_DOWN) {
            pressedDpadKeys += event.keyCode
        } else {
            pressedDpadKeys -= event.keyCode
        }
        updateGameplayDpad(device)
        return true
    }

    private fun updateGameplayDpad(device: InputDevice?) {
        val keyX = when {
            KeyEvent.KEYCODE_DPAD_LEFT in pressedDpadKeys -> -1
            KeyEvent.KEYCODE_DPAD_RIGHT in pressedDpadKeys -> 1
            else -> 0
        }
        val keyY = when {
            KeyEvent.KEYCODE_DPAD_UP in pressedDpadKeys -> -1
            KeyEvent.KEYCODE_DPAD_DOWN in pressedDpadKeys -> 1
            else -> 0
        }
        val nextX = keyX.takeIf { it != 0 } ?: motionDpadX
        val nextY = keyY.takeIf { it != 0 } ?: motionDpadY
        if (nextX != hatX) {
            emitEmulatorAxisTransition(hatX, nextX, "DPAD_LEFT", "DPAD_RIGHT", device)
            hatX = nextX
        }
        if (nextY != hatY) {
            emitEmulatorAxisTransition(hatY, nextY, "DPAD_UP", "DPAD_DOWN", device)
            hatY = nextY
        }
    }

    private fun updateTrigger(
        event: MotionEvent,
        axis: Int,
        label: String,
        previous: Boolean,
        setPressed: (Boolean) -> Unit,
    ) {
        val pressed = event.getAxisValue(axis) >= AXIS_PRESS_THRESHOLD
        if (pressed != previous) {
            callbacks.onEmulatorButton(label, pressed, physicalDevice(event.device)?.let(::deviceIdentity))
            setPressed(pressed)
        }
    }

    private fun updateNavigation(axis: String, next: Int, previous: Int, setDirection: (Int) -> Unit) {
        if (next != previous) {
            setDirection(next)
            callbacks.onNavigate(
                axis,
                when (next) {
                    -1 -> if (axis == "h") "left" else "up"
                    1 -> if (axis == "h") "right" else "down"
                    else -> "none"
                },
            )
        }
    }

    private fun physicalDevice(device: InputDevice?): InputDevice? =
        device?.takeIf(::isPhysicalGamepad)

    private fun isPhysicalGamepad(device: InputDevice): Boolean {
        if (device.isVirtual) return false
        val hasGamepadSource = device.supportsSource(InputDevice.SOURCE_GAMEPAD)
        val hasJoystickSource = device.supportsSource(InputDevice.SOURCE_JOYSTICK)
        if (!hasGamepadSource && !hasJoystickSource) return false
        val hasJoystickAxis = device.motionRanges.any { range ->
            range.source and InputDevice.SOURCE_JOYSTICK == InputDevice.SOURCE_JOYSTICK
        }
        // hasKeys() is a synchronous binder call to system_server. Only pay for
        // it when hasJoystickAxis alone can't decide the result -- this method
        // runs per key event via physicalDevice(), so evaluating it eagerly
        // (as a val computed before the ||) meant every real gamepad, which
        // already satisfies hasJoystickAxis, paid the IPC for a result that
        // was then discarded by short-circuiting.
        return hasJoystickAxis || (device.isExternal && hasFaceButtons(device))
    }

    private fun hasFaceButtons(device: InputDevice): Boolean = device.hasKeys(
        KeyEvent.KEYCODE_BUTTON_A,
        KeyEvent.KEYCODE_BUTTON_B,
        KeyEvent.KEYCODE_BUTTON_X,
        KeyEvent.KEYCODE_BUTTON_Y,
    ).any { it }

    private fun deviceIdentity(device: InputDevice): Map<String, String> {
        deviceCache[device.descriptor]?.let { return it }
        return AndroidGamepadIdentity.of(device).also { deviceCache[device.descriptor] = it }
    }

    private fun isJoystickMove(event: MotionEvent): Boolean =
        event.source and InputDevice.SOURCE_JOYSTICK == InputDevice.SOURCE_JOYSTICK &&
            event.action == MotionEvent.ACTION_MOVE

    private fun axisDirection(event: MotionEvent, hatAxis: Int, stickAxis: Int): Int =
        direction(event.getAxisValue(hatAxis)).takeIf { it != 0 }
            ?: direction(event.getAxisValue(stickAxis))

    private fun stickDirection(event: MotionEvent, axis: Int): Int = direction(event.getAxisValue(axis))

    private fun direction(value: Float): Int = when {
        value <= -AXIS_PRESS_THRESHOLD -> -1
        value >= AXIS_PRESS_THRESHOLD -> 1
        else -> 0
    }

    private fun isButtonTransition(event: KeyEvent): Boolean =
        event.action == KeyEvent.ACTION_DOWN || event.action == KeyEvent.ACTION_UP

    private fun emulatorGamepadLabel(keyCode: Int): String? = EMULATOR_JS_KEYS[keyCode]

    private fun domKeyCode(keyCode: Int): Int? = when (keyCode) {
        in KeyEvent.KEYCODE_A..KeyEvent.KEYCODE_Z -> 65 + keyCode - KeyEvent.KEYCODE_A
        in KeyEvent.KEYCODE_0..KeyEvent.KEYCODE_9 -> 48 + keyCode - KeyEvent.KEYCODE_0
        KeyEvent.KEYCODE_TAB -> 9
        KeyEvent.KEYCODE_ENTER, KeyEvent.KEYCODE_NUMPAD_ENTER -> 13
        KeyEvent.KEYCODE_DEL -> 8
        KeyEvent.KEYCODE_FORWARD_DEL -> 46
        KeyEvent.KEYCODE_SPACE -> 32
        KeyEvent.KEYCODE_ESCAPE -> 27
        KeyEvent.KEYCODE_MINUS -> 189
        KeyEvent.KEYCODE_EQUALS -> 187
        KeyEvent.KEYCODE_LEFT_BRACKET -> 219
        KeyEvent.KEYCODE_RIGHT_BRACKET -> 221
        KeyEvent.KEYCODE_BACKSLASH -> 220
        KeyEvent.KEYCODE_SEMICOLON -> 186
        KeyEvent.KEYCODE_APOSTROPHE -> 222
        KeyEvent.KEYCODE_COMMA -> 188
        KeyEvent.KEYCODE_PERIOD -> 190
        KeyEvent.KEYCODE_SLASH -> 191
        KeyEvent.KEYCODE_GRAVE -> 192
        in KeyEvent.KEYCODE_F1..KeyEvent.KEYCODE_F12 -> 112 + keyCode - KeyEvent.KEYCODE_F1
        else -> null
    }

    private companion object {
        const val AXIS_PRESS_THRESHOLD = 0.5f
        const val BACK = "BACK"
        const val LEFT_BOTTOM_SHOULDER = "LEFT_BOTTOM_SHOULDER"
        const val RIGHT_BOTTOM_SHOULDER = "RIGHT_BOTTOM_SHOULDER"
        val DPAD_LABELS = setOf("DPAD_UP", "DPAD_DOWN", "DPAD_LEFT", "DPAD_RIGHT")
        val DPAD_KEY_CODES = setOf(
            KeyEvent.KEYCODE_DPAD_UP,
            KeyEvent.KEYCODE_DPAD_DOWN,
            KeyEvent.KEYCODE_DPAD_LEFT,
            KeyEvent.KEYCODE_DPAD_RIGHT,
        )
        val EMULATOR_JS_KEYS = mapOf(
            KeyEvent.KEYCODE_BACK to BACK,
            KeyEvent.KEYCODE_DPAD_UP to "DPAD_UP",
            KeyEvent.KEYCODE_DPAD_DOWN to "DPAD_DOWN",
            KeyEvent.KEYCODE_DPAD_LEFT to "DPAD_LEFT",
            KeyEvent.KEYCODE_DPAD_RIGHT to "DPAD_RIGHT",
            KeyEvent.KEYCODE_DPAD_CENTER to "BUTTON_2",
            KeyEvent.KEYCODE_ENTER to "BUTTON_2",
            KeyEvent.KEYCODE_BUTTON_A to "BUTTON_2",
            KeyEvent.KEYCODE_BUTTON_B to "BUTTON_1",
            KeyEvent.KEYCODE_BUTTON_X to "BUTTON_4",
            KeyEvent.KEYCODE_BUTTON_Y to "BUTTON_0",
            KeyEvent.KEYCODE_BUTTON_START to "START",
            KeyEvent.KEYCODE_BUTTON_SELECT to "SELECT",
            KeyEvent.KEYCODE_BUTTON_L1 to "BUTTON_6",
            KeyEvent.KEYCODE_BUTTON_R1 to "BUTTON_7",
            KeyEvent.KEYCODE_BUTTON_L2 to LEFT_BOTTOM_SHOULDER,
            KeyEvent.KEYCODE_BUTTON_R2 to RIGHT_BOTTOM_SHOULDER,
            KeyEvent.KEYCODE_BUTTON_THUMBL to "BUTTON_10",
            KeyEvent.KEYCODE_BUTTON_THUMBR to "BUTTON_11",
        )
    }
}
