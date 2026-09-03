package org.moonfin.androidtv

import android.content.Context
import android.hardware.input.InputManager
import android.os.Handler
import android.os.SystemClock
import android.util.Log
import android.util.SparseArray
import android.view.InputDevice
import android.view.KeyEvent
import android.view.MotionEvent
import kotlin.math.abs
import kotlin.math.hypot
import kotlin.math.max
import kotlin.math.min
import kotlin.math.roundToInt
import org.json.JSONObject

/**
 * Android's direct native-libretro input path. Every assigned connection owns
 * an independent whole-state mask and writes it straight to its libretro port;
 * no event crosses Dart and no controller worker/queue is introduced.
 */
internal class NativePadInput(
    private val bridge: LibretroBridge,
    private val handler: Handler,
    context: Context,
    private val callbacks: Callbacks,
) {
    internal interface Callbacks {
        fun onControllerMappingKey(keyCode: Int, device: Map<String, Any?>)
        fun onControllerDiagnosticsAxes(payload: Map<String, Any?>)
        fun onControllerDiagnosticsButton(payload: Map<String, Any?>)
    }

    private val inputManager = context.getSystemService(Context.INPUT_SERVICE) as? InputManager
    private val registry = NativeControllerPortRegistry()
    private val padStates = SparseArray<PadState>()
    private val maskComposer = NativePortMaskComposer()
    // Which axis constants carry trigger pressure, resolved once per device
    // id. See triggerAxesFor and TriggerAxisResolver below.
    private val triggerAxisCache = SparseArray<TriggerAxes>()
    // Remotes/keyboards aren't controller connections but feed P1's D-pad/Enter
    // state; kept independent so it composes with, not replaces, P1's pad.
    private val keyboardState = PadState(KEYBOARD_DEVICE_ID, "", 0, DEFAULT_TABLE)
    // Per-connection table for keyboardState's shared events, keyed by
    // profileId; see navigationTable. tableFor allocates a 256-int copy, so
    // this memoises it rather than resolving per key event.
    private val navigationTables = HashMap<String, IntArray>()

    private var customMappings: Map<String, Map<Int, Int>> = emptyMap()
    private var snapModes: Map<String, StickSnap> = emptyMap()
    private var captureActive = false
    private var captureConnectionId: String? = null
    private var diagnosticsActive = false
    private var pendingDiagnosticsAxes: Map<String, Any?>? = null
    private var diagnosticsFlushScheduled = false
    private var diagnosticsConnectionId: String? = null
    // Throttles axis emissions to ~30Hz (design's "Cost" section); button
    // transitions are rare and always sent immediately.
    private var lastDiagnosticsAxisEmitUptimeMs = 0L

    // Counts joystick motion events across every port; every
    // ANALOG_POLL_INTERVAL of them, one JNI call re-reads which ports take an
    // analog stick. Tied to real stick activity rather than a wall-clock tick:
    // a Handler timer would keep firing, and need start/stop bookkeeping around
    // setActive/dispose, even while nothing is moving.
    private var analogPollCounter = 0

    // Seeds coreReadsAnalog for pads added between polls.
    private var analogPortMask = 0

    /** True while a native session is loaded; checked first in dispatch. */
    @Volatile var active = false
        private set

    // Retained so [dispose] can unregister it. InputManager is process-wide and
    // outlives the Activity, so an unregistered listener keeps this object, the
    // bridge, the callbacks and the Activity reachable for the life of the
    // process -- and the orphan goes on receiving device callbacks.
    private val deviceListener = object : InputManager.InputDeviceListener {
        // Added evicts too, since an id can be one a removed device left behind.
        override fun onInputDeviceAdded(deviceId: Int) {
            NativeInputDeviceClassifier.invalidate(deviceId)
            onDeviceAdded(deviceId)
        }

        override fun onInputDeviceRemoved(deviceId: Int) {
            NativeInputDeviceClassifier.invalidate(deviceId)
            onDeviceRemoved(deviceId)
        }

        override fun onInputDeviceChanged(deviceId: Int) {
            NativeInputDeviceClassifier.invalidate(deviceId)
            onDeviceChanged(deviceId)
        }
    }

    init {
        inputManager?.registerInputDeviceListener(deviceListener, null)
        refreshInactiveSnapshot()
    }

    /** Releases the process-wide listener. Safe to call more than once. */
    fun dispose() {
        inputManager?.unregisterInputDeviceListener(deviceListener)
        clearPadStates(publish = false)
        triggerAxisCache.clear()
        NativeInputDeviceClassifier.invalidate()
    }

    /**
     * Marks whether the core has queried RETRO_DEVICE_ANALOG on [port] since
     * the last game load. Per the digital/analog rule, this is what gates the
     * stick->d-pad conversion in onMotion off once a core wants the raw
     * axes; the hat keeps feeding digital either way. Defaults to false, so
     * behaviour is unchanged until something calls this.
     */
    fun setCoreReadsAnalog(port: Int, reads: Boolean) {
        for (index in 0 until padStates.size()) {
            val state = padStates.valueAt(index)
            if (state.port != port || state.coreReadsAnalog == reads) continue
            state.coreReadsAnalog = reads
            // The stick stops driving the d-pad from here, so its latched
            // direction must go with it. stickDirX/Y are no longer updated once
            // this is on, so a direction held at the moment of the flip would
            // otherwise stay frozen and keep feeding the hat fallback for ever
            // -- pinning a direction the user cannot clear with the stick, and
            // fighting every new input. Clear the bits it asserted too: a held
            // d-pad re-asserts them on its next event, but nothing else would.
            state.stickDirX = 0
            state.stickDirY = 0
            // Only the stick's contribution goes. A hat held across the flip
            // keeps its direction: it re-asserts nothing until it next moves,
            // so clearing it here would strand the user with no direction.
            applyMotionBit(state, RETRO_LEFT, state.hatDirX == -1)
            applyMotionBit(state, RETRO_RIGHT, state.hatDirX == 1)
            applyMotionBit(state, RETRO_UP, state.hatDirY == -1)
            applyMotionBit(state, RETRO_DOWN, state.hatDirY == 1)
            publishMask(state)
        }
    }

    /**
     * Polls [LibretroBridge.analogStickPorts] once and applies its bitmask
     * to every live [PadState] via [setCoreReadsAnalog]. Called from
     * [setActive] shortly after activation, and thereafter every
     * ANALOG_POLL_INTERVAL joystick motion events (see [analogPollCounter]),
     * since this crosses JNI and the rule only needs to react within a handful
     * of frames.
     *
     * The host decides which ports are analog and why (see
     * lh_analog_stick_ports); this only applies the answer.
     *
     * Descriptors can arrive a few ms after [LibretroBridge] finishes loading
     * (FBNeo sends them late), which is why [setActive] schedules a delayed
     * refresh instead of relying solely on the periodic one.
     */
    private fun refreshAnalogPorts() {
        val mask = bridge.analogStickPorts()
        analogPortMask = mask
        for (port in 0 until NativeControllerPortRegistry.MAX_PORTS) {
            setCoreReadsAnalog(port, (mask shr port) and 1 != 0)
        }
    }

    /**
     * Drops every held button, keeping each pad registered.
     *
     * Called immediately before the core resumes. The press that dismissed the
     * pause menu is still physically down at that moment and is already in the
     * core's mask, so without this the game acts on it.
     *
     * Unlike clearPadStates this does not empty padStates: the pads keep their
     * ports, profiles and tables, only their input goes.
     */
    fun releaseHeldInput() {
        for (index in 0 until padStates.size()) {
            clearPadState(padStates.valueAt(index), publish = active)
        }
        clearPadState(keyboardState, publish = active)
        bridge.resetPadMasks()
    }

    /** Available before gameplay so Dart can load all profile mappings first. */
    fun nativeGamepadDevices(): List<Map<String, Any?>> {
        if (!active) refreshInactiveSnapshot()
        return registry.snapshot().map(NativeControllerConnection::channelPayload)
    }

    fun setActive(value: Boolean) {
        if (active == value) return
        active = value
        clearPadStates(publish = false)
        bridge.resetPadMasks()
        analogPollCounter = 0
        // Descriptors are per game, so the next game must not start on the
        // last one's mask while the delayed refresh is still pending.
        analogPortMask = 0
        if (value) {
            val connections = registry.activate(discoverCandidates(logDiagnostics = true))
            for (connection in connections) logPort("session start", connection)
            for (connection in connections) addPadState(connection)
            // Input descriptors can arrive a few ms after load returns (FBNeo
            // sends them late), so a single refresh shortly after activation
            // catches them instead of waiting for ANALOG_POLL_INTERVAL
            // publishes, which may not happen for a while if nobody is
            // touching a stick yet.
            handler.postDelayed({ if (active) refreshAnalogPorts() }, ANALOG_POLL_ACTIVATE_DELAY_MS)
        } else {
            registry.deactivate(discoverCandidates())
        }
        bridge.setControllerCount(
            if (value) playableCount() else 0,
            navigationOnly = if (value) navigationOnly() else false,
            force = value,
        )
    }

    /**
     * Applies the user's durable Player 1-4 assignment. Pad state and masks
     * reset first so a held button can't strand a bit on the port it left.
     */
    fun setControllerAssignments(json: String) {
        val pins = NativeControllerAssignmentParser.parse(json)
        clearPadStates(publish = active)
        bridge.resetPadMasks()
        val connections = registry.setPins(pins)
        if (!active) return
        for (connection in connections) addPadState(connection)
        bridge.setControllerCount(playableCount(), navigationOnly = navigationOnly(), force = true)
    }

    fun setControllerMappings(json: String) {
    customMappings = NativeControllerMappingParser.parse(json)
        for (index in 0 until padStates.size()) {
            val state = padStates.valueAt(index)
            state.table = tableFor(state.profileId)
        }
        navigationTables.clear()
    }

    /** Snap mode per controller profile for the loaded game. */
    fun setStickSnap(modes: Map<String, String>) {
        snapModes = modes.mapValues { StickSnap.fromWireName(it.value) }
        for (index in 0 until padStates.size()) {
            val state = padStates.valueAt(index)
            state.snap = snapModes[state.profileId] ?: StickSnap.OFF
        }
    }

    fun setCapture(active: Boolean, connectionId: String?) {
        captureActive = active
        captureConnectionId = connectionId.takeIf { active }
    }

    /**
     * Monitor mode for the controller test panel: observation only, never
     * consumes or binds anything. See the design doc's "Placement and
     * lifecycle" invariants -- mirrors [setCapture]'s shape exactly, but
     * [onKey]/[onMotion] fall through to normal handling either way instead
     * of returning early.
     */
    fun setDiagnostics(active: Boolean, connectionId: String?) {
        if (!active) {
            handler.removeCallbacks(diagnosticsFlush)
            diagnosticsFlushScheduled = false
            pendingDiagnosticsAxes = null
        }
        diagnosticsActive = active
        diagnosticsConnectionId = connectionId.takeIf { active }
        lastDiagnosticsAxisEmitUptimeMs = 0L
    }

    /** Returns true when this key was consumed by the native pad path. */
    fun onKey(event: KeyEvent): Boolean {
        val keyCode = event.keyCode
        // Back is the only escape from a running game, so it is never
        // consumed and -- because this return sits above the capture branch
        // on purpose -- never bindable either. Reordering this below capture
        // would let a rebind strand a user with no way out.
        if (keyCode == KeyEvent.KEYCODE_BACK || isVolumeKey(keyCode)) return false
        if (NativeKeyEventPolicy.shouldIgnoreRepeat(event.action, event.repeatCount)) return true

        val connection = registry.connection(event.deviceId)
        // Android TV implementations can cancel the currently-held remote DPAD
        // KeyEvent when another button is dispatched, even though the DPAD switch
        // remains physically down. A genuine ACTION_UP follows when the user
        // eventually releases the direction. Actual focus/lifecycle loss clears
        // every held mask in MainActivity, so ignoring this canceled edge cannot
        // strand movement if Android never delivers that final physical release.
        if (NativeKeyEventPolicy.shouldIgnoreCanceledRemoteDpadRelease(
                action = event.action,
                canceled = event.isCanceled,
                keyCode = keyCode,
                isRemote = connection?.deviceClass == NativeInputDeviceClass.REMOTE,
            )
        ) return true
        // Observation only: computed before any consuming branch below and
        // never gates a return, so it can never bind or swallow anything.
        emitDiagnosticsButtonIfMatching(connection, event)
        if (keyCode == KeyEvent.KEYCODE_MENU ||
            keyCode == KeyEvent.KEYCODE_BUTTON_MODE ||
            keyCode == KeyEvent.KEYCODE_ESCAPE
        ) {
            // A remote/keyboard keeps its menu gesture (navigation source, no
            // port); an overflow gamepad past the fourth does not.
            if (event.action == KeyEvent.ACTION_DOWN &&
                (connection == null || connection.supported || !connection.isGamepad)
            ) {
                bridge.onMenu(connection?.port ?: 0)
            }
            return true
        }

        // Capture wins over Start/normal dispatch so a physical Start key can
        // be rebound without opening the pause menu; an unassigned fifth
        // device can still be captured since it's profile work, not gameplay.
        if (connection != null && captureActive && event.action == KeyEvent.ACTION_DOWN &&
            matchesCapture(connection)
        ) {
            captureActive = false
            captureConnectionId = null
            callbacks.onControllerMappingKey(event.keyCode, connection.channelPayload())
            return true
        }

        // A device holding a port drives that port. A remote/unpinned keyboard
        // has no port but must still feed Player 1 navigation, not be swallowed
        // as unsupported. A gamepad past the fourth is consumed and goes nowhere.
        val state = when {
            connection == null -> keyboardState
            connection.supported -> padStates.get(event.deviceId) ?: return true
            connection.isGamepad -> return true
            else -> keyboardState
        }

        if (keyCode == KeyEvent.KEYCODE_BUTTON_START) {
            handleStart(state, event.action == KeyEvent.ACTION_DOWN)
            return true
        }
        if (event.action != KeyEvent.ACTION_DOWN && event.action != KeyEvent.ACTION_UP) return true

        // Menus always run on the default layout, for every device and not just
        // the shared keyboard state. Bindings are 1:1 now, so a remap can leave
        // a key unbound -- and a user who unbinds B must still be able to hold
        // B to leave the controller test panel.
        val table = if (state === keyboardState || bridge.overlayOpen) {
            navigationTable(connection)
        } else {
            state.table
        }
        val index = indexFor(table, keyCode)
        when (index) {
            NONE -> return false
            SWALLOW -> return true
            else -> {
                val bit = 1 shl index
                val pressed = event.action == KeyEvent.ACTION_DOWN
                if (pressed) releaseLostHolds(state, index, bit)
                state.keyMask =
                    NativeDigitalKeyState.transition(state.keyMask, bit, pressed)
                publishMask(state)
            }
        }
        return true
    }

    /** Returns true when this motion event was gameplay-shaped and consumed. */
    fun onMotion(event: MotionEvent): Boolean {
        if (event.source and InputDevice.SOURCE_JOYSTICK != InputDevice.SOURCE_JOYSTICK ||
            event.action != MotionEvent.ACTION_MOVE
        ) return false

        val connection = registry.connection(event.deviceId) ?: return false
        // Consume an overflow pad's sticks; let remote touch-nav motion fall
        // through to Flutter's normal focus handling.
        if (!connection.supported) return connection.isGamepad
        val state = padStates.get(event.deviceId) ?: return true

        // Refreshed here, before ANY of this event reads coreReadsAnalog. The
        // mode picks both the digital direction bits below and the analog axes
        // in publishPadState, so flipping it midway would publish one half
        // under the old mode and the other under the new -- the stick sample
        // that caused the switch discarded, or the old direction re-sent with
        // the axes zeroed. Counted per event rather than per publish, so a port
        // held in digital mode (which suppresses its own publishes) still polls
        // its way back out.
        analogPollCounter++
        if (analogPollCounter >= ANALOG_POLL_INTERVAL) {
            analogPollCounter = 0
            refreshAnalogPorts()
        }

        // Every axis is read exactly once: getAxisValue is a native call, and
        // this runs on the UI thread for every motion event of every pad.
        val rawLx = event.getAxisValue(MotionEvent.AXIS_X)
        val rawLy = event.getAxisValue(MotionEvent.AXIS_Y)
        val rawRx = event.getAxisValue(MotionEvent.AXIS_Z)
        val rawRy = event.getAxisValue(MotionEvent.AXIS_RZ)

        // The digital/analog rule: the stick keeps feeding the d-pad conversion
        // only while this game is not analog; the hat always feeds digital,
        // unconditionally, below.
        //
        // The overlay is the exception, and it matters: menus are navigated
        // with the same digital direction bits, so a stick switched to analog
        // would stop moving the pause menu, the mapping list and the player
        // picker entirely -- which reads as a frozen screen. While a menu is
        // open the stick always drives digital, whatever the game wants.
        if (!state.coreReadsAnalog || bridge.overlayOpen) {
            // Menus always navigate unsnapped, or a 4-way game's setting would
            // make its own settings list unreachable diagonally.
            val snap = if (bridge.overlayOpen) StickSnap.OFF else state.snap
            val snapped = snapAxes(rawLx, rawLy, snap)
            state.stickDirX = stickAxisDirection(snapX(snapped), state.stickDirX)
            state.stickDirY = stickAxisDirection(snapY(snapped), state.stickDirY)
        }
        // The hat wins while it is held; the stick supplies the direction the
        // rest of the time (when it is still allowed to, see above).
        val rawHatX = event.getAxisValue(MotionEvent.AXIS_HAT_X)
        val rawHatY = event.getAxisValue(MotionEvent.AXIS_HAT_Y)
        // Kept apart from the stick's latched direction so a mode flip can
        // preserve a held hat; Android sends no event until the hat moves.
        state.hatDirX = direction(rawHatX)
        state.hatDirY = direction(rawHatY)
        val stickDrivesDigital = !state.coreReadsAnalog || bridge.overlayOpen
        val hatX = hatFallback(state.hatDirX, state.stickDirX, !stickDrivesDigital)
        val hatY = hatFallback(state.hatDirY, state.stickDirY, !stickDrivesDigital)
        applyMotionBit(state, RETRO_LEFT, hatX == -1)
        applyMotionBit(state, RETRO_RIGHT, hatX == 1)
        applyMotionBit(state, RETRO_UP, hatY == -1)
        applyMotionBit(state, RETRO_DOWN, hatY == 1)

        var triggerAxes = triggerAxesFor(event.deviceId, event.device)
        // Correct the guess as soon as the pad shows us where pressure really
        // arrives; see TriggerAxisResolver.withLiveAxes.
        val learned = TriggerAxisResolver.withLiveAxes(triggerAxes, event::getAxisValue)
        if (learned !== triggerAxes) {
            triggerAxisCache.put(event.deviceId, learned)
            triggerAxes = learned
        }
        val leftTrigger = event.getAxisValue(triggerAxes.left)
        val rightTrigger = event.getAxisValue(triggerAxes.right)

        // Triggers arrive as axes, not key events, so without this they could
        // never be bound: arming capture and squeezing one produced nothing.
        // A crossing is reported under the keycode a pad with digital triggers
        // would send, so one binding covers both report styles and the mapping
        // table can hold it like any other key.
        if (captureActive && matchesCapture(connection)) {
            val crossed = when {
                leftTrigger >= AXIS_THRESHOLD -> KeyEvent.KEYCODE_BUTTON_L2
                rightTrigger >= AXIS_THRESHOLD -> KeyEvent.KEYCODE_BUTTON_R2
                else -> null
            }
            if (crossed != null) {
                captureActive = false
                captureConnectionId = null
                callbacks.onControllerMappingKey(crossed, connection!!.channelPayload())
                return true
            }
        }
        applyTriggerBit(state, KeyEvent.KEYCODE_BUTTON_L2, RETRO_L2, leftTrigger >= AXIS_THRESHOLD)
        applyTriggerBit(state, KeyEvent.KEYCODE_BUTTON_R2, RETRO_R2, rightTrigger >= AXIS_THRESHOLD)

        // Packed into a Long rather than a Pair: this is per motion event on
        // every pad, and a Pair would be a heap allocation each time.
        val left = analogAxisPair(rawLx, rawLy, state.snap)
        val right = analogAxisPair(rawRx, rawRy, state.snap)
        publishPadState(
            state,
            axisX(left), axisY(left),
            axisX(right), axisY(right),
            analogTrigger(leftTrigger), analogTrigger(rightTrigger),
        )
        // Observation only, after every binding decision above: never gates
        // the `return true` gameplay path takes regardless.
        emitDiagnosticsAxesIfMatching(
            connection, rawLx, rawLy, rawRx, rawRy, rawHatX, rawHatY, leftTrigger, rightTrigger,
            state.snap,
        )
        return true
    }

    /**
     * Whether [connection] is the one the test panel is currently watching.
     * Mirrors capture's own connectionId-or-profileId match.
     */
    private fun matchesDiagnostics(connection: NativeControllerConnection?): Boolean =
        connection != null &&
            (connection.connectionId == diagnosticsConnectionId || connection.profileId == diagnosticsConnectionId)

    /**
     * Emits a button transition for the test panel. Invariant 1 (never
     * consumes/binds): called from a point in [onKey] that never gates a
     * return, so this is a pure side effect. Invariant 2 (mutual exclusion
     * with capture): `captureActive` short-circuits this regardless of
     * whether the event actually matched capture's own connection.
     */
    private fun emitDiagnosticsButtonIfMatching(connection: NativeControllerConnection?, event: KeyEvent) {
        if (!diagnosticsActive || captureActive) return
        if (event.action != KeyEvent.ACTION_DOWN && event.action != KeyEvent.ACTION_UP) return
        if (!matchesDiagnostics(connection)) return
        callbacks.onControllerDiagnosticsButton(
            mapOf(
                "connectionId" to connection!!.connectionId,
                "port" to connection.port,
                "keyCode" to event.keyCode,
                "keyName" to KeyEvent.keyCodeToString(event.keyCode),
                "pressed" to (event.action == KeyEvent.ACTION_DOWN),
                // Resolved here rather than in Dart: this table already carries
                // the device's custom binding when it has one and the default
                // layout otherwise, and duplicating that map in Dart would let
                // the two drift.
                "retroPadIndex" to retroPadIndexFor(connection, event.keyCode),
            ),
        )
    }

    /** The RetroPad index [keyCode] maps to for this device, or null. */
    /** Whether [connection] is the device capture is currently armed for. */
    private fun matchesCapture(connection: NativeControllerConnection?): Boolean =
        connection != null &&
            (connection.connectionId == captureConnectionId ||
                connection.profileId == captureConnectionId)

    private fun retroPadIndexFor(connection: NativeControllerConnection, keyCode: Int): Int? {
        val table = padStates.get(connection.deviceId)?.table ?: tableFor(connection.profileId)
        val index = indexFor(table, keyCode)
        return if (index == NONE || index == SWALLOW) null else index
    }

    /**
     * Emits a raw axis snapshot for the test panel, throttled to
     * [DIAGNOSTICS_AXIS_THROTTLE_MS] (~30Hz, per the design's "Cost"
     * section). Values are pre-dead-zone/pre-calibration: the panel shows
     * what the pad reports, not what the core receives. See
     * [emitDiagnosticsButtonIfMatching] for the two invariants, upheld the
     * same way here.
     */
    private fun emitDiagnosticsAxesIfMatching(
        connection: NativeControllerConnection,
        rawLx: Float,
        rawLy: Float,
        rawRx: Float,
        rawRy: Float,
        hatX: Float,
        hatY: Float,
        l2: Float,
        r2: Float,
        snap: StickSnap,
    ) {
        if (!diagnosticsActive || captureActive) return
        if (!matchesDiagnostics(connection)) return
        // Display-only: shows what the game's snap setting does to the stick,
        // even though menus themselves always navigate unsnapped.
        val snapped = snapAxes(rawLx, rawLy, snap)
        val payload = mapOf<String, Any?>(
            "connectionId" to connection.connectionId,
            "port" to connection.port,
            "lx" to rawLx.toDouble(),
            "ly" to rawLy.toDouble(),
            "rx" to rawRx.toDouble(),
            "ry" to rawRy.toDouble(),
            "hatX" to hatX.toDouble(),
            "hatY" to hatY.toDouble(),
            "l2" to l2.toDouble(),
            "r2" to r2.toDouble(),
            "snap" to snap.wireName,
            "snapLx" to snapX(snapped).toDouble(),
            "snapLy" to snapY(snapped).toDouble(),
        )
        val now = SystemClock.uptimeMillis()
        if (now - lastDiagnosticsAxisEmitUptimeMs < DIAGNOSTICS_AXIS_THROTTLE_MS) {
            // Trailing edge, and it is not optional: releasing a trigger or
            // centring a stick produces its final event inside the throttle
            // window, and once at rest NO further motion events arrive. A
            // leading-edge-only throttle therefore drops the release and the
            // panel latches on a half-pressed value for ever.
            pendingDiagnosticsAxes = payload
            if (!diagnosticsFlushScheduled) {
                diagnosticsFlushScheduled = true
                handler.postDelayed(diagnosticsFlush, DIAGNOSTICS_AXIS_THROTTLE_MS)
            }
            return
        }
        pendingDiagnosticsAxes = null
        lastDiagnosticsAxisEmitUptimeMs = now
        callbacks.onControllerDiagnosticsAxes(payload)
    }

    private val diagnosticsFlush = Runnable {
        diagnosticsFlushScheduled = false
        val payload = pendingDiagnosticsAxes ?: return@Runnable
        pendingDiagnosticsAxes = null
        if (!diagnosticsActive) return@Runnable
        lastDiagnosticsAxisEmitUptimeMs = SystemClock.uptimeMillis()
        callbacks.onControllerDiagnosticsAxes(payload)
    }

    /**
     * Resolves and caches, once per device, which axis constants actually
     * carry left/right trigger pressure. Cleared on device removal/change so
     * a replacement device under the same id is re-probed rather than
     * inheriting a stale resolution.
     */
    private fun triggerAxesFor(deviceId: Int, device: InputDevice?): TriggerAxes {
        triggerAxisCache.get(deviceId)?.let { return it }
        val resolved = if (device != null) {
            TriggerAxisResolver.resolve { axis ->
                device.getMotionRange(axis, InputDevice.SOURCE_JOYSTICK) != null
            }
        } else {
            TriggerAxes(MotionEvent.AXIS_LTRIGGER, MotionEvent.AXIS_RTRIGGER)
        }
        triggerAxisCache.put(deviceId, resolved)
        return resolved
    }

    // A pad can return under a new id before Android reports the old id removed.
    // Drop the vanished connection before allocating the replacement, so its
    // port is available without moving any live player.
    private fun releaseVanishedPadStates() {
        for (index in padStates.size() - 1 downTo 0) {
            val state = padStates.valueAt(index)
            if (InputDevice.getDevice(state.deviceId) == null) removeDevice(state.deviceId)
        }
    }

    /**
     * One line whenever a device gains or is refused a player slot. The
     * refusal is the case that matters: an unsupported gamepad has its keys
     * consumed by onKeyDown and goes nowhere, which from the outside is
     * indistinguishable from a dead controller. bug-176 could not be answered
     * from a log because nothing recorded this.
     */
    private fun logPort(reason: String, connection: NativeControllerConnection) {
        val slot = connection.port?.let { "player ${it + 1}" }
            ?: if (connection.isGamepad) "NO PORT - input is dropped" else "navigation only"
        Log.i(
            TAG,
            "controller $reason: ${connection.name} class=${connection.deviceClass} " +
                "$slot pinned=${connection.pinned} deviceId=${connection.deviceId}",
        )
    }

    private fun onDeviceAdded(deviceId: Int) {
        releaseVanishedPadStates()
        val candidate = candidateFor(deviceId) ?: return
        val connection = registry.addOrUpdate(candidate)
        logPort("added", connection)
        if (active && connection.supported && padStates.get(deviceId) == null) addPadState(connection)
        if (active) bridge.setControllerCount(playableCount(), navigationOnly = navigationOnly(), force = true)
    }

    private fun onDeviceRemoved(deviceId: Int) {
        removeDevice(deviceId)
        Log.i(TAG, "controller removed deviceId=$deviceId")
        if (active) bridge.setControllerCount(playableCount(), navigationOnly = navigationOnly(), force = true)
    }

    /** Clears state even when a late removal follows an add-before-remove reconnect. */
    private fun removeDevice(deviceId: Int) {
        val connection = registry.remove(deviceId)
        padStates.get(deviceId)?.let { clearPadState(it, publish = active) }
        padStates.remove(deviceId)
        triggerAxisCache.remove(deviceId)
        val connectionId = connection?.connectionId ?: "android-connection-$deviceId"
        // No promotion pass here: reallocating would move live players.
        if (captureConnectionId == connectionId) setCapture(false, null)
        if (diagnosticsConnectionId == connectionId) setDiagnostics(false, null)
    }

    private fun onDeviceChanged(deviceId: Int) {
        val candidate = candidateFor(deviceId) ?: run {
            onDeviceRemoved(deviceId)
            return
        }
        val previous = registry.connection(deviceId)
        val connection = registry.addOrUpdate(candidate)
        // A device can re-enumerate with a different HID descriptor under the
        // same id; re-probe trigger axes rather than trusting a stale cache.
        triggerAxisCache.remove(deviceId)
        // Port and class matter as well as profile: a reclassified device can
        // now be re-allocated or lose its port, and a PadState carries the port
        // it was built for.
        if (previous?.profileId != connection.profileId ||
            previous.port != connection.port ||
            previous.deviceClass != connection.deviceClass
        ) {
            padStates.get(deviceId)?.let { clearPadState(it, publish = active) }
            padStates.remove(deviceId)
            if (active && connection.supported) addPadState(connection)
        } else {
            padStates.get(deviceId)?.let { state -> state.table = tableFor(connection.profileId) }
        }
        if (active) bridge.setControllerCount(playableCount(), navigationOnly = navigationOnly(), force = true)
    }

    /**
     * How many devices can actually drive gameplay, not how many hold a port.
     * A portless remote/keyboard feeds Player 1 through keyboardState, so it
     * counts -- otherwise Dart's "no controller" gate covers the game and pauses
     * the core for someone who is perfectly able to play with a remote.
     */
    private fun playableCount(): Int =
        (registry.assignedCount() + if (registry.navigationSourceCount() > 0) 1 else 0)
            .coerceAtMost(NativeControllerPortRegistry.MAX_PORTS)

    private fun navigationOnly(): Boolean =
        registry.assignedCount() == 0 && registry.navigationSourceCount() > 0

    private fun refreshInactiveSnapshot() {
        registry.refreshInactive(discoverCandidates())
    }

    private fun discoverCandidates(logDiagnostics: Boolean = false): List<NativeControllerCandidate> =
        buildList {
            for (deviceId in InputDevice.getDeviceIds()) {
                candidateFor(deviceId, logDiagnostics)?.let(::add)
            }
        }

    // Logs, unlike the bulk enumeration path it used to mirror. A device that
    // arrives mid-session is exactly the one whose classification nobody can
    // reconstruct afterwards -- a pad connected 90s into a session left no
    // trace at all, which is what made bug-176 unanswerable from a log.
    private fun candidateFor(deviceId: Int): NativeControllerCandidate? =
        candidateFor(deviceId, logDiagnostics = true)

    /**
     * Every routable device becomes a candidate, not only gamepads, so a
     * remote/keyboard reaches the assignment UI. Port eligibility is the
     * registry's decision, not this one's.
     */
    private fun candidateFor(deviceId: Int, logDiagnostics: Boolean): NativeControllerCandidate? {
        val device = InputDevice.getDevice(deviceId) ?: return null
        val traits = NativeInputDeviceClassifier.traitsOf(device)
        if (logDiagnostics) NativeInputDeviceClassifier.logDiagnostics(device, traits)
        val deviceClass = NativeInputDeviceClassifier.classify(traits) ?: return null
        val identity = AndroidGamepadIdentity.of(device)
        return NativeControllerCandidate(
            deviceId = deviceId,
            profileId = identity.getValue("id"),
            name = identity.getValue("name"),
            controllerNumber = device.controllerNumber,
            deviceClass = deviceClass,
        )
    }

    private fun addPadState(connection: NativeControllerConnection) {
        val port = connection.port ?: return
        val state = PadState(connection.deviceId, connection.profileId, port, tableFor(connection.profileId))
        state.snap = snapModes[connection.profileId] ?: StickSnap.OFF
        state.coreReadsAnalog = (analogPortMask shr port) and 1 != 0
        padStates.put(connection.deviceId, state)
    }

    private fun clearPadStates(publish: Boolean) {
        for (index in 0 until padStates.size()) clearPadState(padStates.valueAt(index), publish)
        padStates.clear()
        clearPadState(keyboardState, publish)
        navigationTables.clear()
        maskComposer.reset()
    }

    private fun clearPadState(state: PadState, publish: Boolean) {
        state.startTimer?.let(handler::removeCallbacks)
        state.pulseTimer?.let(handler::removeCallbacks)
        state.startTimer = null
        state.pulseTimer = null
        state.keyMask = 0
        state.motionMask = 0
        state.pulseMask = 0
        state.sentMask = 0
        state.stickDirX = 0
        state.stickDirY = 0
        state.analogLx = 0
        state.analogLy = 0
        state.analogRx = 0
        state.analogRy = 0
        state.trigL = 0
        state.trigR = 0
        val combined = updateComposedMask(state)
        if (publish) bridge.onPad(state.port, combined)
    }

    private fun releaseLostHolds(state: PadState, index: Int, bit: Int) {
        val opposite = if (index in OPPOSITE.indices) OPPOSITE[index] else NONE
        if (opposite != NONE) state.keyMask = state.keyMask and (1 shl opposite).inv()
        if (state.keyMask and bit != 0) state.keyMask = state.keyMask and bit.inv()
    }

    /**
     * Sets whichever RetroPad bit [keyCode] is bound to, falling back to
     * [fallback] when the table holds no usable entry.
     *
     * The last bit driven is remembered per trigger so rebinding one while it
     * is held releases the bit it used to drive instead of stranding it.
     */
    private fun applyTriggerBit(state: PadState, keyCode: Int, fallback: Int, pressed: Boolean) {
        val index = indexFor(state.table, keyCode)
        val target = if (index == NONE || index == SWALLOW) fallback else index
        val left = keyCode == KeyEvent.KEYCODE_BUTTON_L2
        val previous = if (left) state.l2Target else state.r2Target
        if (previous != target) {
            applyMotionBit(state, previous, false)
            if (left) state.l2Target = target else state.r2Target = target
        }
        applyMotionBit(state, target, pressed)
    }

    private fun applyMotionBit(state: PadState, index: Int, pressed: Boolean) {
        val bit = 1 shl index
        val was = state.motionMask and bit != 0
        if (was != pressed) {
            state.motionMask = if (pressed) state.motionMask or bit else state.motionMask and bit.inv()
        }
    }

    /** One whole-mask JNI write at most for this port when its state changed. */
    private fun publishMask(state: PadState) {
        val desired = state.keyMask or state.motionMask or state.pulseMask
        if (desired == state.sentMask) return
        state.sentMask = desired
        bridge.onPad(state.port, updateComposedMask(state))
    }

    /**
     * Analog counterpart of [publishMask]: sends through
     * [LibretroBridge.onPadState] instead of the mask-only path, but only
     * when the mask changed or an analog value moved by more than
     * [ANALOG_MIN_SEND_DELTA], so a resting stick does not cross JNI on every
     * motion event.
     */
    private fun publishPadState(
        state: PadState,
        rawLx: Int,
        rawLy: Int,
        rx: Int,
        ry: Int,
        trigL: Int,
        trigR: Int,
    ) {
        // One physical stick drives one domain, never both. While it is feeding
        // the d-pad, the analog axes it would otherwise report stay centred --
        // otherwise a core that reads both (FBNeo reads analog unconditionally)
        // sees the same lean twice and the two disagree.
        val lx = if (state.coreReadsAnalog) rawLx else 0
        val ly = if (state.coreReadsAnalog) rawLy else 0
        val desiredMask = state.keyMask or state.motionMask or state.pulseMask
        val maskChanged = desiredMask != state.sentMask
        val analogChanged = analogMoved(lx, state.analogLx) || analogMoved(ly, state.analogLy) ||
            analogMoved(rx, state.analogRx) || analogMoved(ry, state.analogRy) ||
            analogMoved(trigL, state.trigL) || analogMoved(trigR, state.trigR)
        if (!maskChanged && !analogChanged) return
        // These fields are the last state sent to the core, not the most
        // recent Android sample. Keeping a suppressed sample here would make
        // several small movements compare only with their immediate
        // predecessor, so they could never accumulate past the minimum send delta.
        state.analogLx = lx
        state.analogLy = ly
        state.analogRx = rx
        state.analogRy = ry
        state.trigL = trigL
        state.trigR = trigR
        val combined = if (maskChanged) {
            state.sentMask = desiredMask
            updateComposedMask(state)
        } else {
            maskComposer.combined(state.port)
        }
        bridge.onPadState(state.port, combined, lx, ly, rx, ry, trigL, trigR)
    }

    private fun analogMoved(new: Int, old: Int): Boolean =
        analogMovedPastSendBaseline(new, old)

    private fun updateComposedMask(state: PadState): Int =
        if (state === keyboardState) maskComposer.setKeyboard(state.sentMask)
        else maskComposer.setController(state.port, state.sentMask)

    private fun handleStart(state: PadState, pressed: Boolean) {
        if (pressed) {
            if (bridge.overlayOpen) {
                state.startConsumed = true
                bridge.onMenu(state.port)
                return
            }
            state.startConsumed = false
            state.startTimer?.let(handler::removeCallbacks)
            val timer = Runnable {
                if (!NativePadStateGuard.isCurrent(state, keyboardState, padStates.get(state.deviceId)) || !active) return@Runnable
                state.startTimer = null
                state.startConsumed = true
                bridge.onMenu(state.port)
            }
            state.startTimer = timer
            handler.postDelayed(timer, START_HOLD_MS)
            return
        }

        state.startTimer?.let(handler::removeCallbacks)
        state.startTimer = null
        val consumed = state.startConsumed
        state.startConsumed = false
        if (!consumed) pulseStart(state)
    }

    private fun pulseStart(state: PadState) {
        val mapping = indexFor(state.table, KeyEvent.KEYCODE_BUTTON_START)
        val index = mapping.takeIf { it >= 0 } ?: RETRO_START
        val bit = 1 shl index
        state.pulseTimer?.let(handler::removeCallbacks)
        state.pulseMask = state.pulseMask or bit
        publishMask(state)
        val timer = Runnable {
            if (!NativePadStateGuard.isCurrent(state, keyboardState, padStates.get(state.deviceId)) || !active) return@Runnable
            state.pulseTimer = null
            state.pulseMask = state.pulseMask and bit.inv()
            publishMask(state)
        }
        state.pulseTimer = timer
        handler.postDelayed(timer, START_PULSE_MS)
    }

    private fun tableFor(profileId: String): IntArray = NativeMappingTables.custom(customMappings[profileId])

    private fun indexFor(table: IntArray, keyCode: Int): Int = NativeMappingTables.indexFor(table, keyCode)

    /**
     * A portless remote/keyboard shares one PadState, so its table cannot live on
     * the state; it is resolved from whichever device produced this event.
     *
     * While the overlay is open the default table is used regardless of what the
     * user bound. The overlay is navigated by RetroPad indices fanned out from
     * LibretroBridge.onPad, so a remote that rebound its D-pad or Select would
     * otherwise lose the ability to drive the menu it just opened -- with Back as
     * the only way out. Gameplay honours the custom table; menus never do.
     */
    private fun navigationTable(connection: NativeControllerConnection?): IntArray {
        if (connection == null || bridge.overlayOpen) return DEFAULT_TABLE
        return navigationTables.getOrPut(connection.profileId) { tableFor(connection.profileId) }
    }

    private fun isVolumeKey(keyCode: Int): Boolean = keyCode == KeyEvent.KEYCODE_VOLUME_UP ||
        keyCode == KeyEvent.KEYCODE_VOLUME_DOWN || keyCode == KeyEvent.KEYCODE_VOLUME_MUTE

    private fun direction(value: Float): Int = when {
        value <= -AXIS_THRESHOLD -> -1
        value >= AXIS_THRESHOLD -> 1
        else -> 0
    }


    private class PadState(
        val deviceId: Int,
        val profileId: String,
        val port: Int,
        var table: IntArray,
        var keyMask: Int = 0,
        var motionMask: Int = 0,
        var pulseMask: Int = 0,
        var sentMask: Int = 0,
        var startTimer: Runnable? = null,
        var pulseTimer: Runnable? = null,
        var startConsumed: Boolean = false,
        // Latched stick direction, kept per axis so the hysteresis below has a
        // previous value to hold on to. Hat axes are stateless.
        var stickDirX: Int = 0,
        var stickDirY: Int = 0,
        // The hat's own last direction, so a mode change can keep it.
        var hatDirX: Int = 0,
        var hatDirY: Int = 0,
        // Last-sent analog state, int16 range (-32768..32767 for axes,
        // 0..0x7fff for triggers). Used both as the value forwarded to
        // lh_set_pad_state and as the baseline analogMoved diffs against.
        var analogLx: Int = 0,
        var analogLy: Int = 0,
        var analogRx: Int = 0,
        var analogRy: Int = 0,
        var trigL: Int = 0,
        var trigR: Int = 0,
        // Set once the host reports the running core queried RETRO_DEVICE_ANALOG
        // on this port; see setCoreReadsAnalog. addPadState seeds it.
        var coreReadsAnalog: Boolean = false,
        var snap: StickSnap = StickSnap.OFF,
        // The bit each trigger axis currently drives; see applyTriggerBit.
        var l2Target: Int = RETRO_L2,
        var r2Target: Int = RETRO_R2,
    )

    private companion object {
        const val AXIS_THRESHOLD = 0.5f
        // Well clear of any real Android keycode (KEYCODE_* tops out in the
        // low hundreds), so a stored binding can never collide with one.
        const val SYNTHETIC_KEYCODE_L2 = NativeMappingTables.SYNTHETIC_KEYCODE_L2
        const val SYNTHETIC_KEYCODE_R2 = NativeMappingTables.SYNTHETIC_KEYCODE_R2
        // Every 64th joystick motion event re-reads analogStickPorts. Chosen
        // to be cheap even at Gauntlet's measured ~56 ANALOG queries/frame
        // (an unrelated, much hotter path) while still reacting within a
        // fraction of a second of real stick movement.
        const val ANALOG_POLL_INTERVAL = 64
        // Delay before the one-shot refresh in setActive(true); the design
        // doc measured descriptors landing within a comfortable margin of
        // content load, so this just needs to be comfortably after that, not
        // tuned tightly.
        const val ANALOG_POLL_ACTIVATE_DELAY_MS = 500L
        // ~30Hz, per the design's "Cost" section; button transitions bypass
        // this and are always sent immediately since they are rare.
        const val DIAGNOSTICS_AXIS_THROTTLE_MS = 33L
        // Shared with NativeInputDeviceClassifier so one grep shows a device's
        // classification and the slot it was then given or refused.
        const val TAG = "moonfin_input"
        const val START_HOLD_MS = 1500L
        const val START_PULSE_MS = 34L
        const val KEYBOARD_DEVICE_ID = -1
        const val TABLE_SIZE = NativeMappingTables.TABLE_SIZE
        const val NONE = NativeMappingTables.NONE
        const val SWALLOW = NativeMappingTables.SWALLOW

        const val RETRO_A = NativeMappingTables.RETRO_A
        const val RETRO_X = NativeMappingTables.RETRO_X
        const val RETRO_SELECT = NativeMappingTables.RETRO_SELECT
        const val RETRO_START = NativeMappingTables.RETRO_START
        const val RETRO_UP = NativeMappingTables.RETRO_UP
        const val RETRO_DOWN = NativeMappingTables.RETRO_DOWN
        const val RETRO_LEFT = NativeMappingTables.RETRO_LEFT
        const val RETRO_RIGHT = NativeMappingTables.RETRO_RIGHT
        const val RETRO_B = NativeMappingTables.RETRO_B
        const val RETRO_Y = NativeMappingTables.RETRO_Y
        const val RETRO_L1 = NativeMappingTables.RETRO_L1
        const val RETRO_R1 = NativeMappingTables.RETRO_R1
        const val RETRO_L2 = NativeMappingTables.RETRO_L2
        const val RETRO_R2 = NativeMappingTables.RETRO_R2
        const val RETRO_L3 = NativeMappingTables.RETRO_L3
        const val RETRO_R3 = NativeMappingTables.RETRO_R3

        val OPPOSITE = NativeMappingTables.OPPOSITE
        val SWALLOWED_KEYCODES = NativeMappingTables.SWALLOWED_KEYCODES
        val DEFAULT_TABLE: IntArray = NativeMappingTables.DEFAULT
    }
}

/** Identity check shared by delayed start actions; keyboardState is never in padStates. */
internal object NativePadStateGuard {
    fun isCurrent(state: Any, keyboardState: Any, registeredState: Any?): Boolean =
        state === keyboardState || registeredState === state
}

// Minimum accumulated change from the last value sent to the core. About 0.4%
// of the int16 analog range: enough to filter sensor noise without losing
// gradual movement. Top level so the test can name it.
internal const val ANALOG_MIN_SEND_DELTA = 128

/** True once movement has accumulated far enough from the last value sent. */
internal fun analogMovedPastSendBaseline(new: Int, lastSent: Int): Boolean =
    abs(new - lastSent) > ANALOG_MIN_SEND_DELTA

internal object NativeKeyEventPolicy {
    fun shouldIgnoreRepeat(action: Int, repeatCount: Int): Boolean =
        action == KeyEvent.ACTION_DOWN && repeatCount != 0

    fun shouldIgnoreCanceledRemoteDpadRelease(
        action: Int,
        canceled: Boolean,
        keyCode: Int,
        isRemote: Boolean,
    ): Boolean =
        isRemote && canceled && action == KeyEvent.ACTION_UP && keyCode in DPAD_DIRECTIONS

    private val DPAD_DIRECTIONS = setOf(
        KeyEvent.KEYCODE_DPAD_UP,
        KeyEvent.KEYCODE_DPAD_DOWN,
        KeyEvent.KEYCODE_DPAD_LEFT,
        KeyEvent.KEYCODE_DPAD_RIGHT,
    )
}

internal object NativeDigitalKeyState {
    fun transition(mask: Int, bit: Int, pressed: Boolean): Int =
        if (pressed) mask or bit else mask and bit.inv()
}

/**
 * The RetroPad mapping tables: pure data plus the default-layout/override
 * logic, kept top-level (not nested in [NativePadInput]'s private companion)
 * so it is constructible and testable without any Android class -- see
 * NativeMappingTablesTest. [NativePadInput] delegates to this object rather
 * than duplicating it; behaviour for every existing caller is unchanged.
 */
internal object NativeMappingTables {
    // Legacy trigger codes, kept only so mappings saved under them still load;
    // deliberately outside the real Android keycode range.
    const val SYNTHETIC_KEYCODE_L2 = 0x10012
    const val SYNTHETIC_KEYCODE_R2 = 0x10013
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

    val OPPOSITE = IntArray(16) { NONE }.apply {
        this[RETRO_UP] = RETRO_DOWN
        this[RETRO_DOWN] = RETRO_UP
        this[RETRO_LEFT] = RETRO_RIGHT
        this[RETRO_RIGHT] = RETRO_LEFT
    }

    // An unbound press on any of these keycodes must not reach the platform
    // (media session, TV framework) while a native game is running; a user
    // binding still wins, since custom() overwrites the SWALLOW entry with
    // the chosen RetroPad index. HOME, BACK and the volume keys must never be
    // added here: HOME and the volume keys are handled above this table
    // entirely, and BACK is the game's only guaranteed escape (see D3) --
    // swallowing or binding either would stop working correctly.
    val SWALLOWED_KEYCODES = intArrayOf(
        KeyEvent.KEYCODE_BUTTON_C, KeyEvent.KEYCODE_BUTTON_Z,
        KeyEvent.KEYCODE_BUTTON_1, KeyEvent.KEYCODE_BUTTON_2,
        KeyEvent.KEYCODE_BUTTON_3, KeyEvent.KEYCODE_BUTTON_4,
        KeyEvent.KEYCODE_BUTTON_5, KeyEvent.KEYCODE_BUTTON_6,
        KeyEvent.KEYCODE_BUTTON_7, KeyEvent.KEYCODE_BUTTON_8,
        KeyEvent.KEYCODE_BUTTON_9, KeyEvent.KEYCODE_BUTTON_10,
        KeyEvent.KEYCODE_BUTTON_11, KeyEvent.KEYCODE_BUTTON_12,
        KeyEvent.KEYCODE_BUTTON_13, KeyEvent.KEYCODE_BUTTON_14,
        KeyEvent.KEYCODE_BUTTON_15, KeyEvent.KEYCODE_BUTTON_16,
        KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE, KeyEvent.KEYCODE_MEDIA_PLAY,
        KeyEvent.KEYCODE_MEDIA_PAUSE, KeyEvent.KEYCODE_MEDIA_STOP,
        KeyEvent.KEYCODE_MEDIA_NEXT, KeyEvent.KEYCODE_MEDIA_PREVIOUS,
        KeyEvent.KEYCODE_MEDIA_REWIND, KeyEvent.KEYCODE_MEDIA_FAST_FORWARD,
        KeyEvent.KEYCODE_MEDIA_RECORD,
        KeyEvent.KEYCODE_CHANNEL_UP, KeyEvent.KEYCODE_CHANNEL_DOWN,
        KeyEvent.KEYCODE_INFO, KeyEvent.KEYCODE_GUIDE, KeyEvent.KEYCODE_CAPTIONS,
        KeyEvent.KEYCODE_TV, KeyEvent.KEYCODE_DVR, KeyEvent.KEYCODE_BOOKMARK,
        KeyEvent.KEYCODE_SETTINGS,
    )

    val DEFAULT: IntArray = IntArray(TABLE_SIZE) { NONE }.also { table ->
        for (keyCode in SWALLOWED_KEYCODES) if (keyCode in 0 until TABLE_SIZE) table[keyCode] = SWALLOW
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

    /** A profile's table: the default layout with the user's overrides applied. */
    fun custom(overrides: Map<Int, Int>?): IntArray {
        if (overrides == null) return DEFAULT
        val table = DEFAULT.copyOf()
        val bound = HashMap<Int, Int>()
        for ((rawKeyCode, index) in overrides) {
            // Trigger bindings were briefly written under synthetic codes; they
            // live under the real trigger keycodes now.
            val keyCode = when (rawKeyCode) {
                SYNTHETIC_KEYCODE_L2 -> KeyEvent.KEYCODE_BUTTON_L2
                SYNTHETIC_KEYCODE_R2 -> KeyEvent.KEYCODE_BUTTON_R2
                else -> rawKeyCode
            }
            if (keyCode in 0 until TABLE_SIZE && index in 0..15) bound[keyCode] = index
        }
        // Bindings are 1:1. A RetroPad button the user has bound has exactly one
        // source, so the defaults it displaces are unbound rather than left to
        // fire alongside it. RETRO_A is the only index with several defaults
        // (BUTTON_A, DPAD_CENTER, ENTER); all of them go. NONE and SWALLOW are
        // negative, so they never collide with a claimed 0..15 index.
        val claimed = bound.values.toHashSet()
        for (keyCode in 0 until TABLE_SIZE) {
            if (table[keyCode] in claimed && keyCode !in bound) table[keyCode] = NONE
        }
        for ((keyCode, index) in bound) table[keyCode] = index
        return table
    }

    fun indexFor(table: IntArray, keyCode: Int): Int =
        if (keyCode in 0 until TABLE_SIZE) table[keyCode] else NONE
}

/**
 * Reads the durable player assignment payload, `{"players":{"1":"<profileId>"}}`.
 * Converts 1-based players (what the user sees) to 0-based ports here only;
 * the rest of the Kotlin and C code thinks purely in ports.
 */
internal object NativeControllerAssignmentParser {
    fun parse(json: String): Map<String, Int> = try {
        val players = JSONObject(json).optJSONObject("players")
        if (players == null) {
            emptyMap()
        } else {
            buildMap {
                val keys = players.keys()
                while (keys.hasNext()) {
                    val key = keys.next()
                    val player = key.toIntOrNull() ?: continue
                    if (player !in 1..NativeControllerPortRegistry.MAX_PORTS) continue
                    val profileId = players.optString(key).takeIf { it.isNotBlank() } ?: continue
                    // One profile can't hold two players; keep the lowest rather
                    // than let iteration order decide.
                    val port = player - 1
                    val existing = this[profileId]
                    if (existing == null || port < existing) put(profileId, port)
                }
            }
        }
    } catch (_: Exception) {
        emptyMap()
    }
}

/** Reads both the legacy flat profile map and the structured mapping payload.
 * Controller-type preferences are deliberately ignored here: they are sent to
 * the libretro bridge separately and must never become gameplay key bindings.
 */
internal object NativeControllerMappingParser {
    fun parse(json: String): Map<String, Map<Int, Int>> = try {
        val root = JSONObject(json)
        buildMap {
            val deviceIds = root.keys()
            while (deviceIds.hasNext()) {
                val deviceId = deviceIds.next()
                val profile = try {
                    root.getJSONObject(deviceId)
                } catch (_: Exception) {
                    continue
                }
                // `bindings` supports the structured dev format; shipping
                // payloads stay flat so older clients still work.
                val rawMapping = if (profile.has("bindings")) {
                    try {
                        profile.getJSONObject("bindings")
                    } catch (_: Exception) {
                        null
                    }
                } else {
                    profile
                }
                if (rawMapping == null) continue
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
}

/**
 * A hat is a switch reporting exactly -1/0/+1, so one trip point suits it. A
 * stick sweeps, so it gets a Schmitt trigger: [STICK_ENGAGE] is low enough that
 * the first half of the travel is not dead, and the direction then holds until
 * the axis falls back past [STICK_RELEASE], so a hand resting near the trip
 * point cannot chatter it on and off.
 *
 * [previous] is this axis's last result; pass 0 when nothing is held.
 */
internal fun stickAxisDirection(value: Float, previous: Int): Int = when {
    value >= STICK_ENGAGE -> 1
    value <= -STICK_ENGAGE -> -1
    previous == 1 && value >= STICK_RELEASE -> 1
    previous == -1 && value <= -STICK_RELEASE -> -1
    else -> 0
}

internal const val STICK_ENGAGE = 0.40f
internal const val STICK_RELEASE = 0.20f

/** Analog dead zone, deliberately minimal: ~5 steps of the 1/255 the pads
 *  actually report, vs the 0.125 they declare. See the design doc. */
internal const val ANALOG_DEAD_ZONE = 0.02f

private const val SNAP_CARDINAL_RATIO = 0.176327f   // tan(10), the OFF-snap drift tolerance
private const val SNAP_DIAGONAL_RATIO = 0.700208f   // tan(35)
private const val SNAP_EIGHT_WAY_RATIO = 0.414214f  // tan(22.5)
private const val DIAGONAL_COMPONENT = 0.707107f    // cos(45)

/** How strictly a stick is constrained to fixed directions. */
internal enum class StickSnap(val wireName: String) {
    OFF("off"),
    EIGHT_WAY("8way"),
    FOUR_WAY("4way");

    companion object {
        fun fromWireName(name: String?): StickSnap =
            entries.firstOrNull { it.wireName == name } ?: OFF
    }
}

/**
 * Constrains (x, y) to fixed directions, preserving magnitude. Works on the
 * minor/major ratio so the hot path stays free of trigonometry.
 */
internal fun snapAxes(x: Float, y: Float, mode: StickSnap): Long {
    val ax = abs(x)
    val ay = abs(y)
    val major = max(ax, ay)
    if (major == 0f) return packFloats(x, y)
    val ratio = min(ax, ay) / major
    val cardinal: Boolean
    val diagonal: Boolean
    when (mode) {
        StickSnap.FOUR_WAY -> { cardinal = true; diagonal = false }
        StickSnap.EIGHT_WAY -> {
            cardinal = ratio <= SNAP_EIGHT_WAY_RATIO
            diagonal = !cardinal
        }
        StickSnap.OFF -> {
            cardinal = ratio <= SNAP_CARDINAL_RATIO
            diagonal = ratio >= SNAP_DIAGONAL_RATIO
        }
    }
    if (cardinal) {
        return if (ax >= ay) packFloats(x, 0f) else packFloats(0f, y)
    }
    if (diagonal) {
        val component = hypot(x, y) * DIAGONAL_COMPONENT
        return packFloats(
            if (x < 0f) -component else component,
            if (y < 0f) -component else component,
        )
    }
    return packFloats(x, y)
}

private fun packFloats(x: Float, y: Float): Long =
    (x.toRawBits().toLong() shl 32) or (y.toRawBits().toLong() and 0xffffffffL)

internal fun snapX(packed: Long): Float = Float.fromBits((packed shr 32).toInt())
internal fun snapY(packed: Long): Float = Float.fromBits(packed.toInt())

/**
 * Radial dead zone, rescale, then [snapAxes]. Returns the pair packed in
 * -32767..32767.
 */
internal fun analogAxisPair(
    rawX: Float,
    rawY: Float,
    mode: StickSnap = StickSnap.OFF,
): Long {
    val magnitude = hypot(rawX, rawY)
    if (magnitude <= ANALOG_DEAD_ZONE || magnitude == 0f) return packAxes(0, 0)
    val scale = ((magnitude - ANALOG_DEAD_ZONE) / (1f - ANALOG_DEAD_ZONE)) / magnitude
    val snapped = snapAxes(
        (rawX * scale).coerceIn(-1f, 1f),
        (rawY * scale).coerceIn(-1f, 1f),
        mode,
    )
    return packAxes(
        (snapX(snapped).coerceIn(-1f, 1f) * 32767f).roundToInt(),
        (snapY(snapped).coerceIn(-1f, 1f) * 32767f).roundToInt(),
    )
}

/**
 * X and Y packed into one Long so the conversion stays allocation-free on the
 * per-motion-event path. A Pair would be a heap object per event per pad, which
 * is real GC pressure on the low-end boxes this runs on.
 */
internal fun packAxes(x: Int, y: Int): Long = (x.toLong() shl 32) or (y.toLong() and 0xffffffffL)
internal fun axisX(packed: Long): Int = (packed shr 32).toInt()
internal fun axisY(packed: Long): Int = packed.toInt()

/** Trigger pressure 0..1 -> 0..0x7fff, with the same dead zone applied. */
internal fun analogTrigger(raw: Float): Int {
    if (raw <= ANALOG_DEAD_ZONE) return 0
    val scale = ((raw - ANALOG_DEAD_ZONE) / (1f - ANALOG_DEAD_ZONE)).coerceIn(0f, 1f)
    return (scale * 0x7fff).roundToInt()
}

/** Which axis constants carry left/right trigger pressure for a device. */
internal data class TriggerAxes(val left: Int, val right: Int)

/**
 * Discovers which axis a device actually carries trigger pressure on, rather
 * than assuming AXIS_LTRIGGER/AXIS_RTRIGGER. Measured 2026-08-20: a Logitech
 * F710 and F310 both *declare* those two axes but never send a changing
 * value on them -- the live values arrive on AXIS_BRAKE/AXIS_GAS instead. See
 * the design doc's "Platform layer" section.
 *
 * [declared] answers "does the device advertise this axis" (backed by
 * `InputDevice.getMotionRange(axis, SOURCE_JOYSTICK) != null` in production);
 * a fake is used in tests. AXIS_Z/AXIS_RZ are included as a last-resort
 * fallback per the design but are excluded here since onMotion always binds
 * them to the right stick.
 */
internal object TriggerAxisResolver {
    private val LEFT_CANDIDATES = intArrayOf(
        MotionEvent.AXIS_LTRIGGER, MotionEvent.AXIS_BRAKE, MotionEvent.AXIS_Z)
    private val RIGHT_CANDIDATES = intArrayOf(
        MotionEvent.AXIS_RTRIGGER, MotionEvent.AXIS_GAS, MotionEvent.AXIS_RZ)
    private val STICK_AXES =
        setOf(MotionEvent.AXIS_X, MotionEvent.AXIS_Y, MotionEvent.AXIS_Z, MotionEvent.AXIS_RZ)

    fun resolve(declared: (Int) -> Boolean): TriggerAxes {
        val left = LEFT_CANDIDATES.firstOrNull { declared(it) && it !in STICK_AXES }
            ?: MotionEvent.AXIS_LTRIGGER
        val right = RIGHT_CANDIDATES.firstOrNull { declared(it) && it !in STICK_AXES }
            ?: MotionEvent.AXIS_RTRIGGER
        return TriggerAxes(left, right)
    }

    /**
     * Upgrades a guess to a fact.
     *
     * [resolve] can only go on what the device DECLARES, and declared is not
     * live: both a Logitech F310 and F710 advertise AXIS_LTRIGGER/AXIS_RTRIGGER
     * with min=0 max=1 and then never send a value on them -- the pressure
     * arrives on another constant. A declared-but-dead axis reads zero for
     * ever, so the triggers appear not to work at all.
     *
     * Any candidate actually reporting pressure therefore beats the declared
     * one, and once learned it sticks for that device.
     */
    fun withLiveAxes(
        current: TriggerAxes,
        valueOf: (Int) -> Float,
    ): TriggerAxes {
        val left = LEFT_CANDIDATES.firstOrNull {
            it !in STICK_AXES && valueOf(it) > LIVE_EPSILON
        } ?: current.left
        val right = RIGHT_CANDIDATES.firstOrNull {
            it !in STICK_AXES && valueOf(it) > LIVE_EPSILON
        } ?: current.right
        return if (left == current.left && right == current.right) {
            current
        } else {
            TriggerAxes(left, right)
        }
    }

    /** Above idle noise, below anything a real squeeze produces. */
    const val LIVE_EPSILON = 0.15f
}

/**
 * The digital direction for one axis: the hat wins whenever it is held, and the
 * stick supplies the direction the rest of the time -- but only while the stick
 * is still allowed to drive digital.
 *
 * Once the core reads analog the stick's latched direction must not leak
 * through here. It stops being updated at that point, so returning it would pin
 * whatever direction was held at the moment the rule engaged, permanently.
 */
internal fun hatFallback(hatDirection: Int, stickDirection: Int, coreReadsAnalog: Boolean): Int =
    when {
        hatDirection != 0 -> hatDirection
        coreReadsAnalog -> 0
        else -> stickDirection
    }
