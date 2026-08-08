package org.moonfin.androidtv

import android.content.Context
import android.hardware.input.InputManager
import android.os.Handler
import android.util.SparseArray
import android.view.InputDevice
import android.view.KeyEvent
import android.view.MotionEvent
import org.json.JSONObject

/**
 * Owns the native libretro input path end-to-end: physical gamepad/keyboard
 * events go straight from [MainActivity.dispatchKeyEvent] /
 * [MainActivity.dispatchGenericMotionEvent] through here to
 * [LibretroBridge.onPad] with no binder IPC, no boxing, and no Dart channel
 * crossing on the hot path.
 *
 * A custom binding on a device simply overwrites that keycode's slot in its
 * preflattened [IntArray] (built once, on mapping change or first sight of a
 * device) -- so a remap beating the fixed D-pad/button layout is structural,
 * not a guard clause (see task B2, preserved from [GameInputRouter]'s old
 * `handlePhysicalDpadKey`).
 *
 * D-pad/trigger state from physical keys and from the analog HAT/trigger axes
 * are two independent bit sources ([keyMask] / [motionMask]) that are OR'd
 * together per RetroPad bit before being forwarded -- releasing the HAT while
 * the digital key is still held (or vice versa) cannot clobber the other
 * source's held bit. The per-frame OR-latch on the native side (added
 * alongside this change) guarantees a same-frame press+release is still
 * observed by the core, so no reconciliation beyond that OR is needed.
 *
 * Controller-mapping capture (the pause menu's "press a button to bind it"
 * flow) runs concurrently with an active native session -- the mapping panel
 * is opened *from* the pause menu of a running game, so `active == true` and
 * capture-armed are simultaneously true, not exclusive states. [onKey] checks
 * [captureActive] before Start/Menu/table dispatch specifically so capture
 * wins: a key that would otherwise be swallowed as gameplay input, or
 * special-cased as Start, is captured as a binding instead while armed.
 *
 * [event.deviceId][KeyEvent.getDeviceId] is a per-connection int that
 * changes when a controller disconnects and reconnects; persisted bindings
 * are keyed by the stable vendor/product/descriptor hash from
 * [AndroidGamepadIdentity] instead. [buildTable] is the one place that
 * resolves deviceId -> stable id (one [InputDevice.getDevice] call), and it
 * only runs on a [deviceTables] cache miss -- first sight of a deviceId,
 * right after [setControllerMappings] invalidates the cache, or after a
 * device add/remove/change invalidates just that id. Every other event is a
 * plain array index.
 */
internal class NativePadInput(
    private val bridge: LibretroBridge,
    private val handler: Handler,
    context: Context,
    private val callbacks: Callbacks,
) {
    internal interface Callbacks {
        fun onControllerMappingKey(keyCode: Int, device: Map<String, String>)
    }

    private val inputManager = context.getSystemService(Context.INPUT_SERVICE) as? InputManager

    init {
        // Reconnecting a controller (or hot-plugging a second one) can hand
        // out a new/changed deviceId; drop just that id's cached table so the
        // next event resolves it fresh against the stable identity rather
        // than reusing a table built for whatever device previously held
        // that int. Registered without a Handler, so callbacks land on this
        // thread (the UI thread, same as onKey/onMotion).
        inputManager?.registerInputDeviceListener(
            object : InputManager.InputDeviceListener {
                // A pad that re-enumerates arrives here under a new id, and any
                // direction still latched from the old one is orphaned: the
                // axis that asserted it belongs to a device that no longer
                // exists, so no motion event can ever clear it. Releasing the
                // motion bits (not the key bits, which recover on their own via
                // releaseLostHolds) is what stops that from reading as a
                // direction held for ever.
                override fun onInputDeviceAdded(deviceId: Int) {
                    invalidateDevice(deviceId)
                    releaseMotionInputs()
                }

                // Only a removal releases held bits. onInputDeviceChanged fires
                // for unrelated reasons -- a keyboard-layout reconfiguration
                // raises it for every device -- and releasing on those would
                // cut a genuinely held direction short mid-game.
                override fun onInputDeviceRemoved(deviceId: Int) {
                    invalidateDevice(deviceId)
                    releaseAllInputs()
                }

                override fun onInputDeviceChanged(deviceId: Int) {
                    invalidateDevice(deviceId)
                }
            },
            null,
        )
    }

    private fun invalidateDevice(deviceId: Int) {
        deviceTables.remove(deviceId)
    }

    /**
     * Drops every latched bit and tells the core, so no press can outlive the
     * device that made it.
     *
     * A wireless pad that drops its link mid-press never sends the matching
     * ACTION_UP, so the bit stays set in [keyMask] and [sentMask] keeps saying
     * "already forwarded as pressed". The core then sees that button held for
     * ever -- a stuck direction reads as the pad having stopped responding --
     * and, worse, the next real press of it computes pressed == was and is
     * swallowed by [publishMask]'s change check without ever reaching the core.
     *
     * Releasing everything on any device change can cut a genuinely held button
     * short, but device churn is rare and a dropped hold recovers on the next
     * press, whereas a stuck one does not recover at all.
     */
    private fun releaseAllInputs() {
        keyMask = 0
        motionMask = 0
        motionDeviceId = -1
        // One send: publishMask recomputes from the now-clear masks, so every
        // held bit is released in a single crossing rather than one each.
        publishMask()
    }

    /** True while a native session is loaded; checked first in dispatch. */
    @Volatile var active = false
        private set

    // Independent bit sources for the RetroPad mask, OR'd together in
    // [publishMask]. sentMask is what was last forwarded to the bridge, so
    // publish only calls out on an actual change.
    private var keyMask = 0
    private var motionMask = 0
    private var sentMask = 0

    private val deviceTables = SparseArray<IntArray>()
    private var customMappings: Map<String, Map<Int, Int>> = emptyMap()

    private var captureActive = false
    private var captureDeviceId: String? = null

    private var startTimer: Runnable? = null
    private var startConsumed = false
    private var motionDeviceId = -1

    fun setActive(value: Boolean) {
        active = value
        keyMask = 0
        motionMask = 0
        sentMask = 0
        motionDeviceId = -1
        deviceTables.clear()
        cancelStartTimer()
        startConsumed = false
        bridge.resetPadMask()
    }

    fun setControllerMappings(json: String) {
        customMappings = parseControllerMappings(json)
        deviceTables.clear()
    }

    fun setCapture(active: Boolean, deviceId: String?) {
        captureActive = active
        captureDeviceId = deviceId.takeIf { active }
    }

    /** Returns true when this key was consumed by the native pad path. */
    fun onKey(event: KeyEvent): Boolean {
        val keyCode = event.keyCode
        if (keyCode == KeyEvent.KEYCODE_BACK || isVolumeKey(keyCode)) return false
        // Repeats carry no new information: the level is already latched from
        // the initial DOWN and stays latched until UP. Consume and drop them.
        if (event.repeatCount != 0) return true

        // Capture takes priority over every other interpretation of the key,
        // including Start/Menu: the whole point is binding *any* physical key
        // (Start included) to whichever RetroPad slot the mapping screen has
        // selected. Falls through to normal handling for a non-matching
        // device, same as the rest of this method would for a stray event.
        if (captureActive && event.action == KeyEvent.ACTION_DOWN && tryCapture(event)) {
            return true
        }

        // Escape joins Menu here rather than being handled up in Flutter. A USB
        // or Bluetooth keyboard is a real Android TV accessory, and Escape is
        // the obvious "let me out" key on one, but it is not a game key -- so
        // it belongs on the same native path as Menu. Handling it in a Flutter
        // Focus instead would put the framework's key pipeline in front of
        // every gameplay key that falls through to it, and each of those then
        // waits on a platform -> Dart -> platform round trip before the event
        // is acknowledged.
        if (keyCode == KeyEvent.KEYCODE_MENU ||
            keyCode == KeyEvent.KEYCODE_BUTTON_MODE ||
            keyCode == KeyEvent.KEYCODE_ESCAPE
        ) {
            if (event.action == KeyEvent.ACTION_DOWN) bridge.onMenu()
            return true
        }

        if (keyCode == KeyEvent.KEYCODE_BUTTON_START) {
            handleStart(event.action == KeyEvent.ACTION_DOWN)
            return true
        }

        if (event.action != KeyEvent.ACTION_DOWN && event.action != KeyEvent.ACTION_UP) {
            return true
        }

        val index = indexFor(event.deviceId, keyCode)
        when (index) {
            NONE -> return false
            SWALLOW -> return true
            else -> {
                val bit = 1 shl index
                if (event.action == KeyEvent.ACTION_DOWN) {
                    releaseLostHolds(index, bit)
                    keyMask = keyMask or bit
                } else {
                    keyMask = keyMask and bit.inv()
                }
                publishMask()
            }
        }
        return true
    }

    /** Returns true when this motion event was gameplay-shaped and consumed. */
    fun onMotion(event: MotionEvent): Boolean {
        if (event.source and InputDevice.SOURCE_JOYSTICK != InputDevice.SOURCE_JOYSTICK ||
            event.action != MotionEvent.ACTION_MOVE
        ) {
            return false
        }
        // Bits latched by a different pad cannot be cleared by this one's
        // axes, so drop them before this event's values are applied. Catches a
        // re-enumeration even when the listener above never reports it.
        if (motionMask != 0 && motionDeviceId != -1 && event.deviceId != motionDeviceId) {
            releaseMotionInputs()
        }
        motionDeviceId = event.deviceId
        val hatX = axisDirection(event, MotionEvent.AXIS_HAT_X, MotionEvent.AXIS_X)
        val hatY = axisDirection(event, MotionEvent.AXIS_HAT_Y, MotionEvent.AXIS_Y)
        applyMotionBit(RETRO_LEFT, hatX == -1)
        applyMotionBit(RETRO_RIGHT, hatX == 1)
        applyMotionBit(RETRO_UP, hatY == -1)
        applyMotionBit(RETRO_DOWN, hatY == 1)
        applyMotionBit(RETRO_L2, event.getAxisValue(MotionEvent.AXIS_LTRIGGER) >= AXIS_THRESHOLD)
        applyMotionBit(RETRO_R2, event.getAxisValue(MotionEvent.AXIS_RTRIGGER) >= AXIS_THRESHOLD)
        publishMask()
        return true
    }

    /**
     * Repairs [keyMask] when a pad's ACTION_UP was lost, which a wireless link
     * does often enough to be felt: the bit stays set, the core sees that
     * direction held for ever, and [publishMask]'s change check then swallows the
     * next press of it because pressed == was.
     *
     * Two facts make a lost release provable rather than guessed at. A key
     * cannot go down twice without an intervening up -- auto-repeat carries a
     * non-zero repeatCount and returned earlier -- and a d-pad cannot hold
     * left and right, or up and down, at the same time. Reaching either state
     * is therefore always the error, never real input.
     *
     * Only [keyMask] is touched. A direction still asserted by [motionMask] is
     * a hat or stick genuinely being held, and that path repairs itself: every
     * ACTION_MOVE recomputes all four directions from the current axis values.
     */
    private fun releaseLostHolds(index: Int, bit: Int) {
        val opposite = if (index in OPPOSITE.indices) OPPOSITE[index] else NONE
        if (opposite != NONE) {
            val oppositeBit = 1 shl opposite
            if (keyMask and oppositeBit != 0) {
                keyMask = keyMask and oppositeBit.inv()
            }
        }
        if (keyMask and bit == 0) return
        // Same key down twice. Clearing here restores the invariant so the
        // ACTION_UP that follows releases correctly. The core will not observe
        // a distinct re-press: a release and a press published between two
        // polls collapse in the host's OR-latch. Holding the re-press back for
        // a frame would make it visible, but that delay would land on every
        // rapid press, which is a worse trade than a missing re-trigger.
        keyMask = keyMask and bit.inv()
    }

    /**
     * Releases every direction/trigger bit held by the analog path.
     *
     * The key path can prove a lost release (see [releaseLostHolds]); this one
     * cannot. Motion events are edge-triggered, so once a bit is latched,
     * "no event" means "unchanged" rather than "released" -- a timeout could
     * not tell a dropped centring event from a direction genuinely being held.
     * The only sound trigger is therefore an external one: the device that was
     * asserting the axis went away or was replaced.
     *
     * [keyMask] is deliberately untouched, so a button held through the event
     * keeps working; [publishMask] recomputes from both masks.
     */
    private fun releaseMotionInputs() {
        if (motionMask == 0) return
        motionMask = 0
        motionDeviceId = -1
        publishMask()
    }

    private fun applyMotionBit(index: Int, pressed: Boolean) {
        val bit = 1 shl index
        val was = motionMask and bit != 0
        if (was == pressed) return
        motionMask = if (pressed) motionMask or bit else motionMask and bit.inv()
    }

    /**
     * Sends the port's whole state when it differs from what was last sent.
     *
     * Both sources are already bitmasks, so the current state is one OR and
     * the change test is one comparison -- no per-bit work, and one JNI call
     * per input event however many bits moved.
     */
    private fun publishMask() {
        val desired = keyMask or motionMask
        if (desired == sentMask) return
        sentMask = desired
        bridge.onPad(desired)
    }

    // Start is deferred so it can double as the menu gesture: a quick
    // press/release reaches the game as a brief pulse, holding past the
    // threshold opens (or steps back through) the overlay -- exactly once per
    // gesture, not per edge. While the overlay is already open any press
    // closes/steps it back immediately, matching the old Dart behaviour.
    private fun handleStart(pressed: Boolean) {
        if (pressed) {
            if (bridge.overlayOpen) {
                startConsumed = true
                bridge.onMenu()
                return
            }
            startConsumed = false
            cancelStartTimer()
            val timer = Runnable {
                startTimer = null
                startConsumed = true
                bridge.onMenu()
            }
            startTimer = timer
            handler.postDelayed(timer, START_HOLD_MS)
        } else {
            cancelStartTimer()
            val consumed = startConsumed
            startConsumed = false
            if (!consumed) pulseStart()
        }
    }

    private fun cancelStartTimer() {
        startTimer?.let(handler::removeCallbacks)
        startTimer = null
    }

    private fun pulseStart() {
        val bit = 1 shl RETRO_START
        keyMask = keyMask or bit
        publishMask()
        handler.postDelayed({
            keyMask = keyMask and bit.inv()
            publishMask()
        }, START_PULSE_MS)
    }

    private fun tryCapture(event: KeyEvent): Boolean {
        val device = event.device ?: return false
        val identity = AndroidGamepadIdentity.of(device)
        if (identity.getValue("id") != captureDeviceId) return false
        captureActive = false
        captureDeviceId = null
        callbacks.onControllerMappingKey(event.keyCode, identity)
        return true
    }

    private fun indexFor(deviceId: Int, keyCode: Int): Int {
        if (keyCode < 0 || keyCode >= TABLE_SIZE) return NONE
        return tableFor(deviceId)[keyCode]
    }

    private fun tableFor(deviceId: Int): IntArray {
        deviceTables.get(deviceId)?.let { return it }
        val table = buildTable(deviceId)
        deviceTables.put(deviceId, table)
        return table
    }

    private fun buildTable(deviceId: Int): IntArray {
        if (customMappings.isEmpty()) return DEFAULT_TABLE
        val overrides = InputDevice.getDevice(deviceId)?.let { device ->
            customMappings[AndroidGamepadIdentity.of(device).getValue("id")]
        }
        if (overrides.isNullOrEmpty()) return DEFAULT_TABLE
        val table = DEFAULT_TABLE.copyOf()
        for ((keyCode, index) in overrides) {
            if (keyCode in 0 until TABLE_SIZE && index in 0..15) table[keyCode] = index
        }
        return table
    }

    private fun isVolumeKey(keyCode: Int): Boolean = keyCode == KeyEvent.KEYCODE_VOLUME_UP ||
        keyCode == KeyEvent.KEYCODE_VOLUME_DOWN ||
        keyCode == KeyEvent.KEYCODE_VOLUME_MUTE

    private fun axisDirection(event: MotionEvent, hatAxis: Int, stickAxis: Int): Int =
        direction(event.getAxisValue(hatAxis)).takeIf { it != 0 }
            ?: direction(event.getAxisValue(stickAxis))

    private fun direction(value: Float): Int = when {
        value <= -AXIS_THRESHOLD -> -1
        value >= AXIS_THRESHOLD -> 1
        else -> 0
    }

    private fun parseControllerMappings(json: String): Map<String, Map<Int, Int>> = try {
        val root = JSONObject(json)
        buildMap {
            val deviceIds = root.keys()
            while (deviceIds.hasNext()) {
                val deviceId = deviceIds.next()
                val rawMapping = root.optJSONObject(deviceId) ?: continue
                val mapping = mutableMapOf<Int, Int>()
                val keycodes = rawMapping.keys()
                while (keycodes.hasNext()) {
                    val keycodeText = keycodes.next()
                    val keycode = keycodeText.toIntOrNull() ?: continue
                    val button = rawMapping.optInt(keycodeText, -1)
                    if (button in 0..15) mapping[keycode] = button
                }
                put(deviceId, mapping)
            }
        }
    } catch (_: Exception) {
        emptyMap()
    }

    private companion object {
        const val AXIS_THRESHOLD = 0.5f
        const val START_HOLD_MS = 1500L
        // Two frames at 60Hz: long enough for the per-frame OR-latch to
        // guarantee visibility to the core, short enough to read as a tap.
        const val START_PULSE_MS = 34L
        const val TABLE_SIZE = 256
        const val NONE = -1
        const val SWALLOW = -2

        const val RETRO_A = 0
        const val RETRO_X = 1
        const val RETRO_SELECT = 2
        const val RETRO_START = 3
        const val RETRO_UP = 4
        const val RETRO_DOWN = 5
        const val RETRO_LEFT = 6
        const val RETRO_RIGHT = 7
        const val RETRO_B = 8
        const val RETRO_Y = 9
        const val RETRO_L1 = 10
        const val RETRO_R1 = 11
        const val RETRO_L2 = 12
        const val RETRO_R2 = 13
        const val RETRO_L3 = 14
        const val RETRO_R3 = 15

        // Physically exclusive pairs: no d-pad can assert both ends of an axis,
        // so a press of one proves the other is no longer held. NONE for every
        // other slot -- two face buttons carry no such relationship.
        val OPPOSITE = IntArray(16) { NONE }.apply {
            this[RETRO_UP] = RETRO_DOWN
            this[RETRO_DOWN] = RETRO_UP
            this[RETRO_LEFT] = RETRO_RIGHT
            this[RETRO_RIGHT] = RETRO_LEFT
        }

        // Keycodes Android defines for generic gamepad buttons that RetroPad
        // has no default slot for. Left unmapped they must still be swallowed
        // here, or they leak into Flutter's focus system as exactly the
        // unfinished events InputDispatcher warns about (defect #5).
        val SWALLOWED_KEYCODES = intArrayOf(
            KeyEvent.KEYCODE_BUTTON_C,
            KeyEvent.KEYCODE_BUTTON_Z,
            KeyEvent.KEYCODE_BUTTON_1,
            KeyEvent.KEYCODE_BUTTON_2,
            KeyEvent.KEYCODE_BUTTON_3,
            KeyEvent.KEYCODE_BUTTON_4,
            KeyEvent.KEYCODE_BUTTON_5,
            KeyEvent.KEYCODE_BUTTON_6,
            KeyEvent.KEYCODE_BUTTON_7,
            KeyEvent.KEYCODE_BUTTON_8,
            KeyEvent.KEYCODE_BUTTON_9,
            KeyEvent.KEYCODE_BUTTON_10,
            KeyEvent.KEYCODE_BUTTON_11,
            KeyEvent.KEYCODE_BUTTON_12,
            KeyEvent.KEYCODE_BUTTON_13,
            KeyEvent.KEYCODE_BUTTON_14,
            KeyEvent.KEYCODE_BUTTON_15,
            KeyEvent.KEYCODE_BUTTON_16,
        )

        val DEFAULT_TABLE: IntArray = IntArray(TABLE_SIZE) { NONE }.also { table ->
            for (keyCode in SWALLOWED_KEYCODES) {
                if (keyCode in 0 until TABLE_SIZE) table[keyCode] = SWALLOW
            }
            table[KeyEvent.KEYCODE_DPAD_UP] = RETRO_UP
            table[KeyEvent.KEYCODE_DPAD_DOWN] = RETRO_DOWN
            table[KeyEvent.KEYCODE_DPAD_LEFT] = RETRO_LEFT
            table[KeyEvent.KEYCODE_DPAD_RIGHT] = RETRO_RIGHT
            table[KeyEvent.KEYCODE_DPAD_CENTER] = RETRO_A
            table[KeyEvent.KEYCODE_ENTER] = RETRO_A
            table[KeyEvent.KEYCODE_BUTTON_A] = RETRO_A
            table[KeyEvent.KEYCODE_BUTTON_B] = RETRO_B
            table[KeyEvent.KEYCODE_BUTTON_X] = RETRO_X
            table[KeyEvent.KEYCODE_BUTTON_Y] = RETRO_Y
            table[KeyEvent.KEYCODE_BUTTON_SELECT] = RETRO_SELECT
            table[KeyEvent.KEYCODE_BUTTON_L1] = RETRO_L1
            table[KeyEvent.KEYCODE_BUTTON_R1] = RETRO_R1
            table[KeyEvent.KEYCODE_BUTTON_L2] = RETRO_L2
            table[KeyEvent.KEYCODE_BUTTON_R2] = RETRO_R2
            table[KeyEvent.KEYCODE_BUTTON_THUMBL] = RETRO_L3
            table[KeyEvent.KEYCODE_BUTTON_THUMBR] = RETRO_R3
        }
    }
}
