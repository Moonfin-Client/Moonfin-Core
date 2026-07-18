package org.moonfin.androidtv

import android.app.Activity
import android.app.PendingIntent
import android.app.PictureInPictureParams
import android.app.RemoteAction
import android.content.ActivityNotFoundException
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.ActivityInfo
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.content.res.Configuration
import android.graphics.drawable.Icon
import android.media.AudioDeviceCallback
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.Process
import android.os.PowerManager
import android.util.Rational
import android.view.Display
import android.view.InputDevice
import android.view.KeyEvent
import android.view.MotionEvent
import androidx.mediarouter.media.MediaRouteSelector
import androidx.mediarouter.media.MediaRouter
import com.google.android.gms.cast.CastMediaControlIntent
import com.google.android.gms.cast.MediaInfo
import com.google.android.gms.cast.MediaLoadRequestData
import com.google.android.gms.cast.MediaQueueData
import com.google.android.gms.cast.MediaQueueItem
import com.google.android.gms.cast.MediaMetadata
import com.google.android.gms.cast.MediaSeekOptions
import com.google.android.gms.cast.MediaStatus
import com.google.android.gms.cast.framework.media.RemoteMediaClient
import com.google.android.gms.cast.framework.CastContext
import com.google.android.gms.cast.framework.CastSession
import com.google.android.gms.cast.framework.SessionManagerListener
import com.google.android.gms.common.images.WebImage
import com.ryanheise.audioservice.AudioServiceActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream

import android.hardware.input.InputManager
import org.flame_engine.gamepads_android.GamepadsCompatibleActivity

class MainActivity : AudioServiceActivity(), GamepadsCompatibleActivity {

    private var keyHandler: ((KeyEvent) -> Boolean)? = null
    private var motionHandler: ((MotionEvent) -> Boolean)? = null

    override fun registerInputDeviceListener(listener: InputManager.InputDeviceListener, handler: Handler?) {
        val inputManager = getSystemService(Context.INPUT_SERVICE) as InputManager
        inputManager.registerInputDeviceListener(listener, handler)
    }

    override fun registerKeyEventHandler(handler: (KeyEvent) -> Boolean) {
        keyHandler = handler
    }

    override fun registerMotionEventHandler(handler: (MotionEvent) -> Boolean) {
        motionHandler = handler
    }

    private var methodChannel: MethodChannel? = null
    private var castChannel: MethodChannel? = null
    private var castEventsChannel: EventChannel? = null
    private var castEventsSink: EventChannel.EventSink? = null
    private var audioCapsEventsChannel: EventChannel? = null
    private var audioCapsSink: EventChannel.EventSink? = null
    private var audioDeviceCallback: AudioDeviceCallback? = null
    private var castStatusListener: SessionManagerListener<CastSession>? = null
    private var castDiscoveryCallback: MediaRouter.Callback? = null
    private var dlnaChannel: MethodChannel? = null
    private var dlnaEventsChannel: EventChannel? = null
    private var dlnaController: DlnaController? = null
    private var externalPlayerChannel: MethodChannel? = null
    private var externalPlayerPendingResult: MethodChannel.Result? = null
    private var gamepadChannel: MethodChannel? = null
    private var watchNextChannel: MethodChannel? = null
    private var watchNextPublisher: WatchNextPublisher? = null
    private var pendingDeepLink: String? = null
    private var gameActive = false
    private var hatX = 0
    private var hatY = 0

    // Kept separate from hatX/hatY on purpose. Sharing them would let a
    // UI-navigation value leak into the emulator's edge detector, which would
    // then read the first in-game press as a hold already in progress and
    // never send its matching button-up.
    private var navX = 0
    private var navY = 0
    private var pipEnabled = false
    private val handler = Handler(Looper.getMainLooper())
    private var dismissRunnable: Runnable? = null
    private var pendingCastTimeout: Runnable? = null
    private var pendingCastListener: SessionManagerListener<CastSession>? = null
    private var castMediaListener: RemoteMediaClient.Listener? = null
    private var castProgressListener: RemoteMediaClient.ProgressListener? = null

    private fun emitAudioCapabilities() {
        audioCapsSink?.success(AudioCapabilities.query(this))
    }

    private fun unregisterAudioDeviceCallback() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            audioDeviceCallback?.let { callback ->
                (getSystemService(Context.AUDIO_SERVICE) as? AudioManager)
                    ?.unregisterAudioDeviceCallback(callback)
            }
        }
        audioDeviceCallback = null
    }

    companion object {
        private const val CHANNEL = "org.moonfin.androidtv/pip"
        private const val CAST_CHANNEL = "com.moonfin/native_cast"
        private const val CAST_EVENTS_CHANNEL = "com.moonfin/native_cast_events"
        private const val DLNA_CHANNEL = "com.moonfin/native_dlna"
        private const val DLNA_EVENTS_CHANNEL = "com.moonfin/native_dlna_events"
        private const val EXTERNAL_PLAYER_CHANNEL = "moonfin/external_player"
        private const val ACTION_PLAY_PAUSE = "org.moonfin.androidtv.ACTION_PIP_PLAY_PAUSE"
        private const val DISMISS_DELAY_MS = 300L
        private const val PLATFORM_CHANNEL = "org.moonfin.androidtv/platform"
        private const val GAMEPAD_CHANNEL = "org.moonfin.androidtv/gamepad"
        private const val WATCH_NEXT_CHANNEL = WatchNextWorker.CHANNEL
        private const val AUDIO_CAPS_EVENTS_CHANNEL =
            "org.moonfin.androidtv/audioCapabilitiesEvents"
        private const val EXTERNAL_PLAYER_PROXY_REQUEST_CODE = 17115
        private const val EXTRA_EXTERNAL_PLAYER_LAUNCH_INTENT = "moonfin.external_player.launch_intent"
        private const val EXTRA_EXTERNAL_PLAYER_ERROR_CODE = "moonfin.external_player.error_code"
        private const val EXTRA_EXTERNAL_PLAYER_ERROR_MESSAGE = "moonfin.external_player.error_message"
        private const val EXTERNAL_PLAYER_CHOOSER_TITLE = "Play with"
        private const val EXTERNAL_PLAYER_SAMPLE_URL = "http://127.0.0.1/sample.mp4"

        private const val API_MX_RESULT_ID = "com.mxtech.intent.result.VIEW"
        private const val API_MX_RESULT_END_BY = "end_by"
        private const val API_MX_RESULT_END_BY_PLAYBACK_COMPLETION = "playback_completion"
        private const val API_MX_RESULT_POSITION = "position"

        private const val API_VLC_RESULT_POSITION = "extra_position"

        private const val API_VIMU_RESULT_ID = "net.gtvbox.videoplayer.result"
        private const val API_VIMU_RESULT_ERROR = 4
        private const val API_VIMU_RESULT_PLAYBACK_COMPLETED = 1

        private const val API_MPV_RESULT_ID = "is.xyz.mpv.MPVActivity.result"
    }

    private fun getDisplayHdrTypes(): List<String> {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N) {
            return emptyList()
        }
        val currentDisplay = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            display
        } else {
            @Suppress("DEPRECATION")
            windowManager.defaultDisplay
        }
        val hdrTypes = currentDisplay?.hdrCapabilities?.supportedHdrTypes ?: return emptyList()
        return hdrTypes.map { type ->
            when (type) {
                Display.HdrCapabilities.HDR_TYPE_DOLBY_VISION -> "DOLBY_VISION"
                Display.HdrCapabilities.HDR_TYPE_HDR10 -> "HDR10"
                Display.HdrCapabilities.HDR_TYPE_HDR10_PLUS -> "HDR10_PLUS"
                Display.HdrCapabilities.HDR_TYPE_HLG -> "HLG"
                else -> type.toString()
            }
        }
    }

    private val pipReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            if (intent?.action == ACTION_PLAY_PAUSE) {
                methodChannel?.invokeMethod("onPiPAction", "playPause")
            }
        }
    }

    private val screenReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            when (intent?.action) {
                Intent.ACTION_SCREEN_OFF ->
                    methodChannel?.invokeMethod("onScreenLock", true)
                Intent.ACTION_USER_PRESENT ->
                    methodChannel?.invokeMethod("onScreenLock", false)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            runCatching { window.colorMode = ActivityInfo.COLOR_MODE_HDR }
        }
        deepLinkFrom(intent)?.let { pendingDeepLink = it }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        deepLinkFrom(intent)?.let { watchNextChannel?.invokeMethod("onDeepLink", it) }
    }

    private fun deepLinkFrom(intent: Intent?): String? {
        val itemId = intent?.getStringExtra(WatchNextPublisher.EXTRA_ITEM_ID) ?: return null
        val serverId = intent.getStringExtra(WatchNextPublisher.EXTRA_SERVER_ID)
        val query = if (serverId.isNullOrEmpty()) {
            "id=${Uri.encode(itemId)}"
        } else {
            "id=${Uri.encode(itemId)}&serverId=${Uri.encode(serverId)}"
        }
        return "moonfin://item?$query"
    }

    // Null travels back to Dart as "ask again" rather than as "not a TV".
    private fun isTvDevice(): Boolean? = isTelevisionOrNull(this)

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            MediaStoreHelper.CHANNEL,
        ).setMethodCallHandler(MediaStoreHelper(this))

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            PLATFORM_CHANNEL,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "isTvDevice" -> {
                    result.success(isTvDevice())
                }
                "displayHdrTypes" -> result.success(getDisplayHdrTypes())
                "dolbyVisionCodecCapabilities" -> {
                    result.success(MediaCodecCapabilities.queryDolbyVisionCapabilities())
                }
                "mediaCodecCapabilities" -> {
                    val includeSoftwareDecoders =
                        call.argument<Boolean>("includeSoftwareDecoders") ?: false
                    result.success(
                        MediaCodecCapabilities.query(
                            includeSoftwareDecoders = includeSoftwareDecoders,
                        ),
                    )
                }
                "audioCapabilities" -> {
                    result.success(AudioCapabilities.query(this))
                }
                "exitApp" -> {
                    result.success(true)
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        finishAndRemoveTask()
                    } else {
                        finishAffinity()
                    }
                }
                else -> result.notImplemented()
            }
        }

        gamepadChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            GAMEPAD_CHANNEL,
        )
        gamepadChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "setActive" -> {
                    gameActive = call.argument<Boolean>("active") ?: false
                    // Reset on every transition, in both directions. Otherwise
                    // the first press after the switch reads as a hold already
                    // in progress and gets dropped.
                    hatX = 0
                    hatY = 0
                    navX = 0
                    navY = 0
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }

        externalPlayerChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            EXTERNAL_PLAYER_CHANNEL,
        )
        externalPlayerChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "listPlayers" -> result.success(listExternalPlayerApps())
                "launch" -> {
                    val args = call.arguments as? Map<*, *> ?: emptyMap<String, Any>()
                    launchExternalPlayer(args, result)
                }
                "chooseAndLaunch" -> {
                    val args = call.arguments as? Map<*, *> ?: emptyMap<String, Any>()
                    chooseAndLaunchExternalPlayer(args, result)
                }
                else -> result.notImplemented()
            }
        }

        methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL,
        )
        methodChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "enableAutoPiP" -> {
                    pipEnabled = call.argument<Boolean>("enabled") ?: false
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                        setPictureInPictureParams(buildPiPParams(true))
                    }
                    result.success(true)
                }
                "updatePiPActions" -> {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O &&
                        isInPictureInPictureMode
                    ) {
                        setPictureInPictureParams(
                            buildPiPParams(
                                call.argument<Boolean>("isPlaying") ?: true,
                            ),
                        )
                    }
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }

        castChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CAST_CHANNEL,
        )
        castChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "discoverGoogleCastTargets" -> {
                    result.success(discoverGoogleCastTargets())
                }
                "startGoogleCastDiscovery" -> {
                    startGoogleCastDiscovery()
                    result.success(null)
                }
                "stopGoogleCastDiscovery" -> {
                    stopGoogleCastDiscovery()
                    result.success(null)
                }
                "startGoogleCastSession" -> {
                    val args = call.arguments as? Map<*, *> ?: emptyMap<String, Any>()
                    startGoogleCastSession(args, result)
                }
                "showAirPlayRoutePicker" -> {
                    result.error(
                        "UNSUPPORTED",
                        "AirPlay is only available on iOS.",
                        null,
                    )
                }
                "pauseGoogleCast" -> {
                    withRemoteMediaClient(result) { remoteClient ->
                        remoteClient.pause()
                        result.success(null)
                    }
                }
                "playGoogleCast" -> {
                    withRemoteMediaClient(result) { remoteClient ->
                        remoteClient.play()
                        result.success(null)
                    }
                }
                "seekGoogleCast" -> {
                    val args = call.arguments as? Map<*, *> ?: emptyMap<String, Any>()
                    val positionTicks = (args["positionTicks"] as? Number)?.toLong()
                    if (positionTicks == null || positionTicks < 0L) {
                        result.error("BAD_ARGS", "Missing or invalid positionTicks", null)
                        return@setMethodCallHandler
                    }

                    withRemoteMediaClient(result) { remoteClient ->
                        val positionMs = positionTicks / 10000L
                        val seekOptions = MediaSeekOptions.Builder()
                            .setPosition(positionMs)
                            .build()
                        remoteClient.seek(seekOptions)
                        result.success(null)
                    }
                }
                "stopGoogleCastSession" -> {
                    withRemoteMediaClient(result) { remoteClient ->
                        remoteClient.stop()
                        result.success(null)
                    }
                }
                "getGoogleCastVolume" -> {
                    val session = getCurrentCastSession()
                    if (session == null) {
                        result.error("NO_CAST_SESSION", "No active Google Cast session", null)
                        return@setMethodCallHandler
                    }
                    result.success(session.volume.toDouble())
                }
                "setGoogleCastVolume" -> {
                    val args = call.arguments as? Map<*, *> ?: emptyMap<String, Any>()
                    val volume = (args["volume"] as? Number)?.toDouble()
                    if (volume == null || volume.isNaN()) {
                        result.error("BAD_ARGS", "Missing or invalid volume", null)
                        return@setMethodCallHandler
                    }
                    val session = getCurrentCastSession()
                    if (session == null) {
                        result.error("NO_CAST_SESSION", "No active Google Cast session", null)
                        return@setMethodCallHandler
                    }
                    val clamped = volume.coerceIn(0.0, 1.0)
                    session.setVolume(clamped)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }

        castEventsChannel = EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CAST_EVENTS_CHANNEL,
        )
        castEventsChannel?.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                castEventsSink = events
                emitGoogleCastEvent(
                    state = if (getCurrentCastSession() != null) "connected" else "disconnected",
                )
                emitCurrentGoogleCastStatus()
            }

            override fun onCancel(arguments: Any?) {
                castEventsSink = null
            }
        })

        registerCastStatusListener()

        dlnaController = DlnaController(this)

        dlnaChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            DLNA_CHANNEL,
        )
        dlnaChannel?.setMethodCallHandler { call, result ->
            val ctrl = dlnaController
            if (ctrl == null) {
                result.error("DLNA_UNAVAILABLE", "DLNA controller not initialized", null)
                return@setMethodCallHandler
            }
            when (call.method) {
                "discoverDlnaTargets" -> ctrl.discoverTargets(result)
                "startDlnaDiscovery" -> {
                    ctrl.startContinuousDiscovery()
                    result.success(null)
                }
                "stopDlnaDiscovery" -> {
                    ctrl.stopContinuousDiscovery()
                    result.success(null)
                }
                "playToDlnaDevice" -> {
                    val args = call.arguments as? Map<*, *> ?: emptyMap<String, Any>()
                    ctrl.playToDevice(args, result)
                }
                "pauseDlna" -> ctrl.pause(result)
                "playDlna" -> ctrl.play(result)
                "seekDlna" -> {
                    val args = call.arguments as? Map<*, *> ?: emptyMap<String, Any>()
                    ctrl.seek(args, result)
                }
                "stopDlna" -> ctrl.stop(result)
                "getDlnaVolume" -> ctrl.getVolume(result)
                "setDlnaVolume" -> {
                    val args = call.arguments as? Map<*, *> ?: emptyMap<String, Any>()
                    ctrl.setVolume(args, result)
                }
                else -> result.notImplemented()
            }
        }

        dlnaEventsChannel = EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            DLNA_EVENTS_CHANNEL,
        )
        dlnaEventsChannel?.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                dlnaController?.setEventSink(events)
            }

            override fun onCancel(arguments: Any?) {
                dlnaController?.setEventSink(null)
            }
        })

        // Re-probe audio capabilities whenever the audio route changes (e.g. an
        // AVR is powered on after launch) and push the fresh result to Dart so
        // the device profile self-heals without an app restart.
        audioCapsEventsChannel = EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            AUDIO_CAPS_EVENTS_CHANNEL,
        )
        audioCapsEventsChannel?.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                audioCapsSink = events
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    val audioManager =
                        getSystemService(Context.AUDIO_SERVICE) as? AudioManager
                    val callback = object : AudioDeviceCallback() {
                        override fun onAudioDevicesAdded(
                            addedDevices: Array<out AudioDeviceInfo>?,
                        ) = emitAudioCapabilities()

                        override fun onAudioDevicesRemoved(
                            removedDevices: Array<out AudioDeviceInfo>?,
                        ) = emitAudioCapabilities()
                    }
                    audioDeviceCallback = callback
                    audioManager?.registerAudioDeviceCallback(
                        callback,
                        Handler(Looper.getMainLooper()),
                    )
                }
            }

            override fun onCancel(arguments: Any?) {
                unregisterAudioDeviceCallback()
                audioCapsSink = null
            }
        })

        val publisher = watchNextPublisher ?: WatchNextPublisher(applicationContext)
            .also { watchNextPublisher = it }
        watchNextChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            WATCH_NEXT_CHANNEL,
        )
        watchNextChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "publish" -> {
                    @Suppress("UNCHECKED_CAST")
                    val items = call.argument<List<Map<String, Any?>>>("items") ?: emptyList()
                    publisher.publish(items)
                    result.success(null)
                }
                "clear" -> {
                    publisher.clear()
                    result.success(null)
                }
                "getInitialDeepLink" -> {
                    result.success(pendingDeepLink)
                    pendingDeepLink = null
                }
                "schedulePeriodic" -> {
                    WatchNextWorker.schedule(applicationContext)
                    result.success(null)
                }
                "cancelPeriodic" -> {
                    WatchNextWorker.cancel(applicationContext)
                    result.success(null)
                }
                "runRefreshNow" -> {
                    WatchNextWorker.runNow(applicationContext)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            registerReceiver(
                pipReceiver,
                IntentFilter(ACTION_PLAY_PAUSE),
                Context.RECEIVER_EXPORTED,
            )
        } else {
            @Suppress("UnspecifiedRegisterReceiverFlag")
            registerReceiver(pipReceiver, IntentFilter(ACTION_PLAY_PAUSE))
        }

        val screenFilter = IntentFilter().apply {
            addAction(Intent.ACTION_SCREEN_OFF)
            addAction(Intent.ACTION_USER_PRESENT)
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            registerReceiver(screenReceiver, screenFilter, Context.RECEIVER_EXPORTED)
        } else {
            @Suppress("UnspecifiedRegisterReceiverFlag")
            registerReceiver(screenReceiver, screenFilter)
        }
    }

    // While a game is running, the emulator lives in a WebView that owns key focus and the
    // System WebView does not reliably expose the Gamepad API. Capture the pad at the Activity
    // level (top of the dispatch chain, before any view) and forward RetroPad buttons to Dart,
    // which injects them into the core. Consumed only while active so app navigation is intact
    // otherwise; button events are also consumed in-game so they never reach Flutter focus.
    override fun dispatchKeyEvent(event: KeyEvent): Boolean {
        if (gameActive) {
            val index = retroPadIndex(event.keyCode)
            if (index != null) {
                if (event.repeatCount == 0 &&
                    (event.action == KeyEvent.ACTION_DOWN || event.action == KeyEvent.ACTION_UP)
                ) {
                    sendGamepadButton(index, event.action == KeyEvent.ACTION_DOWN)
                }
                return true
            }
        }
        if (keyHandler?.invoke(event) == true) {
            return true
        }
        return super.dispatchKeyEvent(event)
    }

    override fun dispatchGenericMotionEvent(event: MotionEvent): Boolean {
        if (gameActive &&
            event.source and InputDevice.SOURCE_JOYSTICK == InputDevice.SOURCE_JOYSTICK &&
            event.action == MotionEvent.ACTION_MOVE
        ) {
            val x = axisDirection(event, MotionEvent.AXIS_HAT_X, MotionEvent.AXIS_X)
            if (x != hatX) {
                if (hatX == -1) sendGamepadButton(6, false)
                if (hatX == 1) sendGamepadButton(7, false)
                if (x == -1) sendGamepadButton(6, true)
                if (x == 1) sendGamepadButton(7, true)
                hatX = x
            }
            val y = axisDirection(event, MotionEvent.AXIS_HAT_Y, MotionEvent.AXIS_Y)
            if (y != hatY) {
                if (hatY == -1) sendGamepadButton(4, false)
                if (hatY == 1) sendGamepadButton(5, false)
                if (y == -1) sendGamepadButton(4, true)
                if (y == 1) sendGamepadButton(5, true)
                hatY = y
            }
            return true
        }

        // Outside a game the left stick drives UI focus. The d-pad needs no
        // help, because Android already turns the hat into KEYCODE_DPAD_* key
        // events. Only the stick is invisible to Flutter, arriving as motion.
        if (!gameActive &&
            event.source and InputDevice.SOURCE_JOYSTICK == InputDevice.SOURCE_JOYSTICK &&
            event.action == MotionEvent.ACTION_MOVE
        ) {
            val x = stickDirection(event, MotionEvent.AXIS_X)
            if (x != navX) {
                navX = x
                sendGamepadNavigate("h", if (x == -1) "left" else if (x == 1) "right" else "none")
            }
            val y = stickDirection(event, MotionEvent.AXIS_Y)
            if (y != navY) {
                navY = y
                sendGamepadNavigate("v", if (y == -1) "up" else if (y == 1) "down" else "none")
            }
            // Not consumed, since other views may still want the motion event.
        }
        if (motionHandler?.invoke(event) == true) {
            return true
        }
        return super.dispatchGenericMotionEvent(event)
    }

    // Hardware keycode -> libretro RetroPad index. Face-button positions map by layout
    // (bottom=B0, right=A8, left=Y1, top=X9). D-pad keycodes and keyboard arrows both count so
    // controllers and keyboards drive gameplay.
    private fun retroPadIndex(keyCode: Int): Int? = when (keyCode) {
        KeyEvent.KEYCODE_DPAD_UP -> 4
        KeyEvent.KEYCODE_DPAD_DOWN -> 5
        KeyEvent.KEYCODE_DPAD_LEFT -> 6
        KeyEvent.KEYCODE_DPAD_RIGHT -> 7
        // Remote OK button; acts as the primary action in-game and select in the overlay.
        KeyEvent.KEYCODE_DPAD_CENTER -> 0
        KeyEvent.KEYCODE_ENTER -> 0
        KeyEvent.KEYCODE_BUTTON_A -> 0
        KeyEvent.KEYCODE_BUTTON_B -> 8
        KeyEvent.KEYCODE_BUTTON_X -> 1
        KeyEvent.KEYCODE_BUTTON_Y -> 9
        KeyEvent.KEYCODE_BUTTON_START -> 3
        KeyEvent.KEYCODE_BUTTON_SELECT -> 2
        KeyEvent.KEYCODE_BUTTON_L1 -> 10
        KeyEvent.KEYCODE_BUTTON_R1 -> 11
        KeyEvent.KEYCODE_BUTTON_THUMBL -> 14
        KeyEvent.KEYCODE_BUTTON_THUMBR -> 15
        else -> null
    }

    // -1 / 0 / +1 from a HAT axis, falling back to the analog stick past a deadzone.
    private fun axisDirection(event: MotionEvent, hatAxis: Int, stickAxis: Int): Int {
        val hat = event.getAxisValue(hatAxis)
        if (hat <= -0.5f) return -1
        if (hat >= 0.5f) return 1
        val stick = event.getAxisValue(stickAxis)
        if (stick <= -0.5f) return -1
        if (stick >= 0.5f) return 1
        return 0
    }

    // -1 / 0 / +1 from an analog stick axis alone. Separate from axisDirection,
    // which falls back from the hat to the stick. UI navigation has to ignore
    // the hat, or every d-pad press would move focus twice.
    private fun stickDirection(event: MotionEvent, stickAxis: Int): Int {
        val stick = event.getAxisValue(stickAxis)
        if (stick <= -0.5f) return -1
        if (stick >= 0.5f) return 1
        return 0
    }

    // The axis is "h" or "v" so Dart can tell which one a "none" recentre came
    // from. Without it, releasing a diagonal is ambiguous.
    private fun sendGamepadNavigate(axis: String, direction: String) {
        runOnUiThread {
            gamepadChannel?.invokeMethod(
                "onNavigate",
                mapOf("axis" to axis, "direction" to direction),
            )
        }
    }

    private fun sendGamepadButton(index: Int, pressed: Boolean) {
        runOnUiThread {
            gamepadChannel?.invokeMethod("onButton", mapOf("index" to index, "pressed" to pressed))
        }
    }

    override fun onUserLeaveHint() {
        super.onUserLeaveHint()
        requestEnterPiPIfEligible()
    }

    override fun onPictureInPictureRequested(): Boolean {
        return requestEnterPiPIfEligible()
    }

    private fun requestEnterPiPIfEligible(): Boolean {
        val hasPiPFeature = packageManager.hasSystemFeature(
            android.content.pm.PackageManager.FEATURE_PICTURE_IN_PICTURE,
        )
        if (!pipEnabled) return false
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return false
        if (!hasPiPFeature) return false
        if (isInPictureInPictureMode) return true
        if (isFinishing || isDestroyed) return false
        val result = enterPictureInPictureMode(buildPiPParams(true))
        return result
    }

    override fun onPictureInPictureModeChanged(
        isInPiP: Boolean,
        newConfig: Configuration,
    ) {
        super.onPictureInPictureModeChanged(isInPiP, newConfig)
        dispatchPiPMethod("onPiPChanged", isInPiP)

        dismissRunnable?.let {
            handler.removeCallbacks(it)
            dismissRunnable = null
        }

        if (!isInPiP) {
            val power = getSystemService(Context.POWER_SERVICE) as PowerManager
            if (!power.isInteractive) return

            dismissRunnable = Runnable {
                dispatchPiPMethod("onPiPAction", "dismissed")
                dismissRunnable = null
            }
            handler.postDelayed(dismissRunnable!!, DISMISS_DELAY_MS)
        }
    }

    override fun onResume() {
        super.onResume()
        if (isInPictureInPictureMode) return
        dismissRunnable?.let {
            handler.removeCallbacks(it)
            dismissRunnable = null
        }
    }

    private fun dispatchPiPMethod(method: String, argument: Any) {
        val channel = methodChannel
        if (channel != null) {
            channel.invokeMethod(method, argument)
            return
        }
        handler.post {
            methodChannel?.invokeMethod(method, argument)
        }
    }

    private fun buildPiPParams(isPlaying: Boolean): PictureInPictureParams {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            throw IllegalStateException("PiP requires API 26+")
        }

        val builder = PictureInPictureParams.Builder()
            .setAspectRatio(Rational(16, 9))

        val icon = if (isPlaying) {
            Icon.createWithResource(this, android.R.drawable.ic_media_pause)
        } else {
            Icon.createWithResource(this, android.R.drawable.ic_media_play)
        }
        val label = if (isPlaying) "Pause" else "Play"
        val intent = PendingIntent.getBroadcast(
            this,
            0,
            Intent(ACTION_PLAY_PAUSE).apply { setPackage(packageName) },
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
        )
        val action = RemoteAction(icon, label, label, intent)
        builder.setActions(listOf(action))

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            builder.setAutoEnterEnabled(pipEnabled)
            builder.setSeamlessResizeEnabled(true)
        }

        return builder.build()
    }

    override fun onDestroy() {
        val shouldTerminateProcess = isFinishing && !isChangingConfigurations
        dismissRunnable?.let { handler.removeCallbacks(it) }
        pendingCastTimeout?.let { handler.removeCallbacks(it) }
        val castContext = runCatching { CastContext.getSharedInstance(this) }.getOrNull()
        val sessionManager = castContext?.sessionManager
        pendingCastListener?.let { listener ->
            sessionManager?.removeSessionManagerListener(listener, CastSession::class.java)
        }
        castStatusListener?.let { listener ->
            sessionManager?.removeSessionManagerListener(listener, CastSession::class.java)
        }
        unregisterCastMediaCallback()
        stopGoogleCastDiscovery()
        try { unregisterReceiver(pipReceiver) } catch (_: Exception) {}
        try { unregisterReceiver(screenReceiver) } catch (_: Exception) {}
        castChannel?.setMethodCallHandler(null)
        castEventsChannel?.setStreamHandler(null)
        unregisterAudioDeviceCallback()
        audioCapsEventsChannel?.setStreamHandler(null)
        dlnaController?.onDestroy()
        dlnaChannel?.setMethodCallHandler(null)
        dlnaEventsChannel?.setStreamHandler(null)
        externalPlayerChannel?.setMethodCallHandler(null)
        gamepadChannel?.setMethodCallHandler(null)
        watchNextChannel?.setMethodCallHandler(null)
        externalPlayerPendingResult?.error(
            "ACTIVITY_DESTROYED",
            "Main activity was destroyed before external playback returned.",
            null,
        )
        externalPlayerPendingResult = null
        super.onDestroy()

        if (shouldTerminateProcess) {
            // Recents-close can destroy activity while native callbacks from the old
            // engine lifetime are still in flight. Terminating this process prevents
            // a new engine from attaching to stale native callback state.
            Process.killProcess(Process.myPid())
        }
    }

    private fun discoverGoogleCastTargets(): List<Map<String, Any>> {
        val selector = MediaRouteSelector.Builder()
            .addControlCategory(
                CastMediaControlIntent.categoryForCast(
                    CastMediaControlIntent.DEFAULT_MEDIA_RECEIVER_APPLICATION_ID,
                ),
            )
            .build()

        val mediaRouter = MediaRouter.getInstance(this)
        val routes = mediaRouter.routes.filter { route ->
            route.isEnabled && route.matchesSelector(selector)
        }

        return routes.map { route ->
            mapOf(
                "id" to route.id,
                "title" to route.name,
                "subtitle" to (route.description?.toString() ?: "Google Cast"),
            )
        }
    }

    private fun castRouteSelector(): MediaRouteSelector =
        MediaRouteSelector.Builder()
            .addControlCategory(
                CastMediaControlIntent.categoryForCast(
                    CastMediaControlIntent.DEFAULT_MEDIA_RECEIVER_APPLICATION_ID,
                ),
            )
            .build()

    // MediaRouter only actively scans for Cast devices while a callback with an
    // active-scan flag is registered; reading routes without one returns a stale
    // (often empty) list. Register an active-scan callback while the picker is
    // open and emit each matching route as a `deviceFound` event.
    private fun startGoogleCastDiscovery() {
        runOnUiThread {
            val mediaRouter = MediaRouter.getInstance(this)
            val selector = castRouteSelector()
            if (castDiscoveryCallback == null) {
                val callback = object : MediaRouter.Callback() {
                    override fun onRouteAdded(router: MediaRouter, route: MediaRouter.RouteInfo) {
                        emitCastRouteFound(route, selector)
                    }

                    override fun onRouteChanged(router: MediaRouter, route: MediaRouter.RouteInfo) {
                        emitCastRouteFound(route, selector)
                    }
                }
                castDiscoveryCallback = callback
                mediaRouter.addCallback(
                    selector,
                    callback,
                    MediaRouter.CALLBACK_FLAG_PERFORM_ACTIVE_SCAN,
                )
            }
            mediaRouter.routes.forEach { emitCastRouteFound(it, selector) }
        }
    }

    private fun stopGoogleCastDiscovery() {
        runOnUiThread {
            val callback = castDiscoveryCallback ?: return@runOnUiThread
            MediaRouter.getInstance(this).removeCallback(callback)
            castDiscoveryCallback = null
        }
    }

    private fun emitCastRouteFound(route: MediaRouter.RouteInfo, selector: MediaRouteSelector) {
        if (!route.isEnabled || !route.matchesSelector(selector)) return
        castEventsSink?.success(
            mapOf(
                "kind" to "googleCast",
                "state" to "deviceFound",
                "id" to route.id,
                "title" to route.name,
                "subtitle" to (route.description?.toString() ?: "Google Cast"),
            ),
        )
    }

    private fun startGoogleCastSession(args: Map<*, *>, result: MethodChannel.Result) {
        val targetId = args["targetId"] as? String
        val streamUrl = args["streamUrl"] as? String
        val title = args["title"] as? String ?: "Moonfin"
        val subtitle = args["subtitle"] as? String
        val posterUrl = args["posterUrl"] as? String
        val queueItems = parseQueueItems(args["queueItems"])
        val startTicks = (args["startPositionTicks"] as? Number)?.toLong()

        if (targetId.isNullOrEmpty() || streamUrl.isNullOrEmpty()) {
            result.error("BAD_ARGS", "Missing targetId or streamUrl", null)
            return
        }

        emitGoogleCastEvent("connecting")

        val mediaRouter = MediaRouter.getInstance(this)
        val route = mediaRouter.routes.firstOrNull { it.id == targetId }
        if (route == null) {
            result.error("NOT_FOUND", "Google Cast route not found", null)
            return
        }

        val castContext = try {
            CastContext.getSharedInstance(this)
        } catch (t: Throwable) {
            result.error("CAST_INIT_FAILED", t.message, null)
            return
        }

        val sessionManager = castContext.sessionManager
        val currentSession = sessionManager.currentCastSession
        if (currentSession != null) {
            loadOnCastSession(
                session = currentSession,
                streamUrl = streamUrl,
                title = title,
                subtitle = subtitle,
                posterUrl = posterUrl,
                queueItems = queueItems,
                startTicks = startTicks,
                result = result,
            )
            return
        }

        pendingCastTimeout?.let { handler.removeCallbacks(it) }
        pendingCastListener?.let { listener ->
            sessionManager.removeSessionManagerListener(listener, CastSession::class.java)
        }

        val listener = object : SessionManagerListener<CastSession> {
            override fun onSessionStarted(session: CastSession, sessionId: String) {
                cleanupPendingCast(sessionManager, this)
                loadOnCastSession(session, streamUrl, title, subtitle, posterUrl, queueItems, startTicks, result)
            }

            override fun onSessionResumed(session: CastSession, wasSuspended: Boolean) {
                cleanupPendingCast(sessionManager, this)
                loadOnCastSession(session, streamUrl, title, subtitle, posterUrl, queueItems, startTicks, result)
            }

            override fun onSessionStartFailed(session: CastSession, error: Int) {
                cleanupPendingCast(sessionManager, this)
                result.error("CAST_START_FAILED", "Failed to start cast session: $error", null)
            }

            override fun onSessionEnded(session: CastSession, error: Int) {}
            override fun onSessionEnding(session: CastSession) {}
            override fun onSessionResumeFailed(session: CastSession, error: Int) {}
            override fun onSessionResuming(session: CastSession, sessionId: String) {}
            override fun onSessionStarting(session: CastSession) {}
            override fun onSessionSuspended(session: CastSession, reason: Int) {}
        }

        pendingCastListener = listener
        sessionManager.addSessionManagerListener(listener, CastSession::class.java)

        pendingCastTimeout = Runnable {
            cleanupPendingCast(sessionManager, listener)
            emitGoogleCastEvent("error", "Timed out waiting for cast session")
            result.error("CAST_TIMEOUT", "Timed out waiting for cast session", null)
        }.also { handler.postDelayed(it, 15000L) }

        mediaRouter.selectRoute(route)
    }

    private fun cleanupPendingCast(
        sessionManager: com.google.android.gms.cast.framework.SessionManager,
        listener: SessionManagerListener<CastSession>,
    ) {
        pendingCastTimeout?.let { handler.removeCallbacks(it) }
        pendingCastTimeout = null
        sessionManager.removeSessionManagerListener(listener, CastSession::class.java)
        pendingCastListener = null
    }

    private fun loadOnCastSession(
        session: CastSession,
        streamUrl: String,
        title: String,
        subtitle: String?,
        posterUrl: String?,
        queueItems: List<Map<String, Any>>,
        startTicks: Long?,
        result: MethodChannel.Result,
    ) {
        val remoteClient = session.remoteMediaClient
        if (remoteClient == null) {
            result.error("NO_REMOTE_CLIENT", "No cast remote media client", null)
            return
        }

        val startMs = startTicks?.div(10000L) ?: 0L
        val effectiveQueueItems = if (queueItems.isEmpty()) {
            listOf(
                mapOf(
                    "streamUrl" to streamUrl,
                    "title" to title,
                    "subtitle" to (subtitle ?: ""),
                    "posterUrl" to (posterUrl ?: ""),
                ),
            )
        } else {
            queueItems
        }

        if (effectiveQueueItems.size > 1) {
            val castQueueItems = effectiveQueueItems.mapNotNull { entry ->
                buildQueueItem(
                    streamUrl = entry["streamUrl"] as? String,
                    title = entry["title"] as? String,
                    subtitle = entry["subtitle"] as? String,
                    posterUrl = entry["posterUrl"] as? String,
                )
            }
            if (castQueueItems.isEmpty()) {
                result.error("BAD_ARGS", "Queue items are invalid", null)
                return
            }

            val queueData = MediaQueueData.Builder()
                .setItems(castQueueItems)
                .setStartIndex(0)
                .build()

            val loadRequest = MediaLoadRequestData.Builder()
                .setQueueData(queueData)
                .setAutoplay(true)
                .setCurrentTime(startMs)
                .build()

            remoteClient.load(loadRequest)
        } else {
            val single = effectiveQueueItems.first()
            val mediaInfo = buildMediaInfo(
                streamUrl = single["streamUrl"] as? String ?: streamUrl,
                title = single["title"] as? String ?: title,
                subtitle = single["subtitle"] as? String ?: subtitle,
                posterUrl = single["posterUrl"] as? String ?: posterUrl,
            )
            val loadRequest = MediaLoadRequestData.Builder()
                .setMediaInfo(mediaInfo)
                .setAutoplay(true)
                .setCurrentTime(startMs)
                .build()
            remoteClient.load(loadRequest)
        }

        registerCastMediaListeners(remoteClient)
        emitCurrentGoogleCastStatus(remoteClient)
        result.success(null)
    }

    private fun parseQueueItems(raw: Any?): List<Map<String, Any>> {
        val entries = raw as? List<*> ?: return emptyList()
        return entries.mapNotNull { entry ->
            val map = entry as? Map<*, *> ?: return@mapNotNull null
            val streamUrl = map["streamUrl"] as? String ?: return@mapNotNull null
            val title = map["title"] as? String ?: "Moonfin"
            buildMap<String, Any> {
                put("streamUrl", streamUrl)
                put("title", title)
                (map["subtitle"] as? String)?.let { put("subtitle", it) }
                (map["posterUrl"] as? String)?.let { put("posterUrl", it) }
            }
        }
    }

    private fun buildMediaInfo(
        streamUrl: String,
        title: String,
        subtitle: String?,
        posterUrl: String?,
    ): MediaInfo {
        val metadata = MediaMetadata(MediaMetadata.MEDIA_TYPE_MOVIE).apply {
            putString(MediaMetadata.KEY_TITLE, title)
            if (!subtitle.isNullOrBlank()) {
                putString(MediaMetadata.KEY_SUBTITLE, subtitle)
            }
            if (!posterUrl.isNullOrBlank()) {
                runCatching {
                    addImage(WebImage(Uri.parse(posterUrl)))
                }
            }
        }

        return MediaInfo.Builder(streamUrl)
            .setStreamType(MediaInfo.STREAM_TYPE_BUFFERED)
            .setContentType("video/*")
            .setMetadata(metadata)
            .build()
    }

    private fun buildQueueItem(
        streamUrl: String?,
        title: String?,
        subtitle: String?,
        posterUrl: String?,
    ): MediaQueueItem? {
        val url = streamUrl ?: return null
        val mediaInfo = buildMediaInfo(
            streamUrl = url,
            title = title ?: "Moonfin",
            subtitle = subtitle,
            posterUrl = posterUrl,
        )
        return MediaQueueItem.Builder(mediaInfo).build()
    }

    private fun withRemoteMediaClient(
        result: MethodChannel.Result,
        action: (com.google.android.gms.cast.framework.media.RemoteMediaClient) -> Unit,
    ) {
        val castContext = try {
            CastContext.getSharedInstance(this)
        } catch (t: Throwable) {
            result.error("CAST_INIT_FAILED", t.message, null)
            return
        }

        val session = castContext.sessionManager.currentCastSession
        if (session == null) {
            result.error("NO_CAST_SESSION", "No active Google Cast session", null)
            return
        }

        val remoteClient = session.remoteMediaClient
        if (remoteClient == null) {
            result.error("NO_REMOTE_CLIENT", "No cast remote media client", null)
            return
        }

        action(remoteClient)
    }

    private fun registerCastStatusListener() {
        val sessionManager = runCatching { CastContext.getSharedInstance(this).sessionManager }.getOrNull()
            ?: return

        castStatusListener?.let { listener ->
            sessionManager.removeSessionManagerListener(listener, CastSession::class.java)
        }

        val listener = object : SessionManagerListener<CastSession> {
            override fun onSessionStarted(session: CastSession, sessionId: String) {
                registerCastMediaListeners(session.remoteMediaClient)
                emitCurrentGoogleCastStatus(session.remoteMediaClient)
                emitGoogleCastEvent("connected")
            }

            override fun onSessionResumed(session: CastSession, wasSuspended: Boolean) {
                registerCastMediaListeners(session.remoteMediaClient)
                emitCurrentGoogleCastStatus(session.remoteMediaClient)
                emitGoogleCastEvent("connected")
            }

            override fun onSessionEnded(session: CastSession, error: Int) {
                unregisterCastMediaCallback()
                emitGoogleCastEvent("disconnected")
            }

            override fun onSessionSuspended(session: CastSession, reason: Int) {
                unregisterCastMediaCallback()
                emitGoogleCastEvent("disconnected")
            }

            override fun onSessionStartFailed(session: CastSession, error: Int) {
                emitGoogleCastEvent("error", "Failed to start cast session: $error")
            }

            override fun onSessionResumeFailed(session: CastSession, error: Int) {
                emitGoogleCastEvent("error", "Failed to resume cast session: $error")
            }

            override fun onSessionEnding(session: CastSession) {}
            override fun onSessionResuming(session: CastSession, sessionId: String) {}
            override fun onSessionStarting(session: CastSession) {}
        }

        castStatusListener = listener
        sessionManager.addSessionManagerListener(listener, CastSession::class.java)
    }

    private fun emitGoogleCastEvent(state: String, message: String? = null, positionTicks: Long? = null) {
        val payload = mutableMapOf<String, Any>(
            "kind" to "googleCast",
            "state" to state,
        )
        if (!message.isNullOrBlank()) {
            payload["message"] = message
        }
        if (positionTicks != null && positionTicks > 0L) {
            payload["positionTicks"] = positionTicks
        }
        runOnUiThread {
            castEventsSink?.success(payload)
        }
    }

    private fun registerCastMediaListeners(remoteClient: RemoteMediaClient?) {
        if (remoteClient == null) return
        unregisterCastMediaCallback()

        val listener = object : RemoteMediaClient.Listener {
            override fun onStatusUpdated() {
                emitCurrentGoogleCastStatus(remoteClient)
            }

            override fun onMetadataUpdated() {}
            override fun onQueueStatusUpdated() {
                emitCurrentGoogleCastStatus(remoteClient)
            }
            override fun onPreloadStatusUpdated() {}
            override fun onSendingRemoteMediaRequest() {}
            override fun onAdBreakStatusUpdated() {}
        }

        val progressListener = RemoteMediaClient.ProgressListener { progressMs, _ ->
            val status = remoteClient.mediaStatus ?: return@ProgressListener
            val state = when (status.playerState) {
                MediaStatus.PLAYER_STATE_PLAYING -> "playing"
                MediaStatus.PLAYER_STATE_PAUSED -> "paused"
                MediaStatus.PLAYER_STATE_BUFFERING -> "buffering"
                MediaStatus.PLAYER_STATE_IDLE -> "idle"
                else -> return@ProgressListener
            }
            val ticks = if (progressMs > 0) progressMs * 10000L else 0L
            emitGoogleCastEvent(state, positionTicks = ticks)
        }

        castMediaListener = listener
        castProgressListener = progressListener
        remoteClient.addListener(listener)
        remoteClient.addProgressListener(progressListener, 1000)
    }

    private fun unregisterCastMediaCallback() {
        val remoteClient = getCurrentCastSession()?.remoteMediaClient
        castMediaListener?.let { listener ->
            remoteClient?.removeListener(listener)
        }
        castProgressListener?.let { listener ->
            remoteClient?.removeProgressListener(listener)
        }
        castMediaListener = null
        castProgressListener = null
    }

    private fun emitCurrentGoogleCastStatus(remoteClient: RemoteMediaClient? = getCurrentCastSession()?.remoteMediaClient) {
        val client = remoteClient ?: return
        val status = client.mediaStatus ?: return
        val state = when (status.playerState) {
            MediaStatus.PLAYER_STATE_PLAYING -> "playing"
            MediaStatus.PLAYER_STATE_PAUSED -> "paused"
            MediaStatus.PLAYER_STATE_BUFFERING -> "buffering"
            MediaStatus.PLAYER_STATE_IDLE -> "idle"
            else -> return
        }
        val positionMs = client.approximateStreamPosition
        val ticks = if (positionMs > 0) positionMs * 10000L else 0L
        emitGoogleCastEvent(state, positionTicks = ticks)
    }

    private fun listExternalPlayerApps(): List<Map<String, Any>> {
        val queryIntent = Intent(Intent.ACTION_VIEW).apply {
            setDataAndType(Uri.parse(EXTERNAL_PLAYER_SAMPLE_URL), "video/*")
        }
        val activities = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            packageManager.queryIntentActivities(
                queryIntent,
                android.content.pm.PackageManager.ResolveInfoFlags.of(
                    android.content.pm.PackageManager.MATCH_DEFAULT_ONLY.toLong(),
                ),
            )
        } else {
            @Suppress("DEPRECATION")
            packageManager.queryIntentActivities(
                queryIntent,
                android.content.pm.PackageManager.MATCH_DEFAULT_ONLY,
            )
        }

        return activities
            .mapNotNull { info ->
                val packageName = info.activityInfo?.packageName ?: return@mapNotNull null
                if (packageName == this.packageName) {
                    return@mapNotNull null
                }
                if (info.priority < 0) {
                    return@mapNotNull null
                }
                val categoryMatch = info.match and IntentFilter.MATCH_CATEGORY_MASK
                if (categoryMatch < IntentFilter.MATCH_CATEGORY_TYPE) {
                    return@mapNotNull null
                }
                if (!hasExplicitVideoMimeType(info.filter)) {
                    return@mapNotNull null
                }
                var activityName = info.activityInfo?.name ?: return@mapNotNull null
                if (activityName.startsWith(".")) {
                    activityName = "$packageName$activityName"
                }
                val component = "$packageName/$activityName"
                val label = info.loadLabel(packageManager)?.toString()?.takeIf { it.isNotBlank() }
                    ?: activityName
                val entry = mutableMapOf<String, Any>(
                    "component" to component,
                    "packageName" to packageName,
                    "activityName" to activityName,
                    "label" to label,
                )
                iconToPngBytes(info.loadIcon(packageManager))?.let { iconBytes ->
                    entry["iconPngBytes"] = iconBytes
                }
                entry
            }
            .distinctBy { it["component"] }
                .sortedBy { (it["label"] as? String)?.lowercase() ?: "" }
    }

    private fun hasExplicitVideoMimeType(filter: IntentFilter?): Boolean {
        if (filter == null) {
            return true
        }

        val typeCount = filter.countDataTypes()
        if (typeCount <= 0) {
            return true
        }

        var hasVideoType = false
        for (index in 0 until typeCount) {
            val mimeType = filter.getDataType(index)?.lowercase() ?: continue
            if (mimeType == "*/*") {
                continue
            }
            if (mimeType == "video/*" || mimeType.startsWith("video/")) {
                hasVideoType = true
                break
            }
        }

        return hasVideoType
    }

    private fun launchExternalPlayer(args: Map<*, *>, result: MethodChannel.Result) {
        val launchIntent = createExternalPlayerIntent(args, requireComponent = true)
        if (launchIntent == null) {
            result.error("BAD_ARGS", "Missing or invalid external player launch arguments.", null)
            return
        }

        if (launchIntent.resolveActivity(packageManager) == null) {
            result.error("PLAYER_NOT_FOUND", "Selected external player is unavailable.", null)
            return
        }

        startExternalPlayerProxy(launchIntent, result)
    }

    private fun chooseAndLaunchExternalPlayer(args: Map<*, *>, result: MethodChannel.Result) {
        val baseIntent = createExternalPlayerIntent(args, requireComponent = false)
        if (baseIntent == null) {
            result.error("BAD_ARGS", "Missing or invalid external player launch arguments.", null)
            return
        }

        val hasTarget = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            packageManager.queryIntentActivities(
                baseIntent,
                android.content.pm.PackageManager.ResolveInfoFlags.of(
                    android.content.pm.PackageManager.MATCH_DEFAULT_ONLY.toLong(),
                ),
            ).isNotEmpty()
        } else {
            @Suppress("DEPRECATION")
            packageManager.queryIntentActivities(
                baseIntent,
                android.content.pm.PackageManager.MATCH_DEFAULT_ONLY,
            ).isNotEmpty()
        }
        if (!hasTarget) {
            result.error("PLAYER_NOT_FOUND", "No compatible external player was found.", null)
            return
        }

        val chooserIntent = Intent.createChooser(baseIntent, EXTERNAL_PLAYER_CHOOSER_TITLE)
        startExternalPlayerProxy(chooserIntent, result)
    }

    private fun startExternalPlayerProxy(
        launchIntent: Intent,
        result: MethodChannel.Result,
    ) {
        if (externalPlayerPendingResult != null) {
            result.error(
                "IN_PROGRESS",
                "An external player launch is already in progress.",
                null,
            )
            return
        }

        externalPlayerPendingResult = result
        try {
            val proxyIntent = Intent(this, ExternalPlayerProxyActivity::class.java).apply {
                putExtra(EXTRA_EXTERNAL_PLAYER_LAUNCH_INTENT, launchIntent)
            }
            startActivityForResult(proxyIntent, EXTERNAL_PLAYER_PROXY_REQUEST_CODE)
        } catch (error: ActivityNotFoundException) {
            externalPlayerPendingResult = null
            result.error("PLAYER_NOT_FOUND", error.message, null)
        } catch (error: Exception) {
            externalPlayerPendingResult = null
            result.error("LAUNCH_FAILED", error.message, null)
        }
    }

    @Deprecated("Deprecated in Java")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == EXTERNAL_PLAYER_PROXY_REQUEST_CODE) {
            val pendingResult = externalPlayerPendingResult
            externalPlayerPendingResult = null
            pendingResult?.success(buildExternalPlayerResultPayload(data, resultCode))
            return
        }
        super.onActivityResult(requestCode, resultCode, data)
    }

    private fun createExternalPlayerIntent(
        args: Map<*, *>,
        requireComponent: Boolean,
    ): Intent? {
        val url = (args["url"] as? String)?.trim().orEmpty()
        if (url.isEmpty()) return null

        val componentRaw = (args["component"] as? String)?.trim().orEmpty()
        val component = splitComponent(componentRaw)
        if (requireComponent && component == null) {
            return null
        }

        val mimeType = (args["mimeType"] as? String)?.trim().takeUnless { it.isNullOrEmpty() }
            ?: "video/*"
        val title = (args["title"] as? String)?.trim().orEmpty()
        val fileName = (args["filename"] as? String)?.trim().orEmpty()
        val positionMs = (anyToLong(args["positionMs"]) ?: 0L).coerceAtLeast(0L)
        val positionInt = positionMs.coerceAtMost(Int.MAX_VALUE.toLong()).toInt()

        val intent = Intent(Intent.ACTION_VIEW).apply {
            setDataAndType(Uri.parse(url), mimeType)
            if (component != null) {
                setClassName(component.first, component.second)
            }
            addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)

            putExtra("position", positionInt)
            putExtra("return_result", true)
            putExtra("secure_uri", true)
            if (title.isNotEmpty()) {
                putExtra("title", title)
            }
            if (fileName.isNotEmpty()) {
                putExtra("filename", fileName)
            }

            putExtra("from_start", positionInt <= 0)

            putExtra("forcename", title)
            putExtra("startfrom", positionInt)
            putExtra("forceresume", false)
        }

        val headers = args["headers"] as? Map<*, *>
        if (headers != null) {
            val headerBundle = Bundle()
            for ((key, value) in headers.entries) {
                val headerKey = key as? String ?: continue
                val headerValue = value as? String ?: continue
                if (headerKey.isBlank() || headerValue.isBlank()) continue
                headerBundle.putString(headerKey, headerValue)
            }
            if (headerBundle.size() > 0) {
                intent.putExtra("headers", headerBundle)
            }
        }

        val subtitleEntries = args["subtitles"] as? List<*> ?: emptyList<Any>()
        if (subtitleEntries.isNotEmpty()) {
            val subtitleUris = ArrayList<Uri>()
            val subtitleNames = ArrayList<String>()
            val subtitleFiles = ArrayList<String>()

            for (entry in subtitleEntries) {
                val map = entry as? Map<*, *> ?: continue
                val subtitleUrl = (map["url"] as? String)?.trim().orEmpty()
                if (subtitleUrl.isEmpty()) continue

                val subtitleUri = runCatching { Uri.parse(subtitleUrl) }.getOrNull() ?: continue
                subtitleUris.add(subtitleUri)
                subtitleNames.add((map["name"] as? String)?.trim().orEmpty())
                subtitleFiles.add((map["language"] as? String)?.trim().orEmpty())
            }

            if (subtitleUris.isNotEmpty()) {
                intent.putExtra("subs", subtitleUris.toTypedArray())
                intent.putExtra("subs.name", subtitleNames.toTypedArray())
                intent.putExtra("subs.filename", subtitleFiles.toTypedArray())
                intent.putExtra("subtitles_location", subtitleUris.first().toString())
            }
        }

        return intent
    }

    private fun splitComponent(raw: String): Pair<String, String>? {
        if (raw.isBlank()) return null
        val slash = raw.indexOf('/')
        if (slash <= 0 || slash >= raw.lastIndex) return null

        val packageName = raw.substring(0, slash).trim()
        var activityName = raw.substring(slash + 1).trim()
        if (packageName.isEmpty() || activityName.isEmpty()) return null
        if (activityName.startsWith(".")) {
            activityName = "$packageName$activityName"
        }
        return packageName to activityName
    }

    private fun iconToPngBytes(drawable: Drawable?): ByteArray? {
        if (drawable == null) return null
        val bitmap = if (drawable is BitmapDrawable && drawable.bitmap != null) {
            drawable.bitmap
        } else {
            val width = if (drawable.intrinsicWidth > 0) drawable.intrinsicWidth else 96
            val height = if (drawable.intrinsicHeight > 0) drawable.intrinsicHeight else 96
            val generated = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
            val canvas = Canvas(generated)
            drawable.setBounds(0, 0, canvas.width, canvas.height)
            drawable.draw(canvas)
            generated
        }

        val stream = ByteArrayOutputStream()
        return try {
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
            stream.toByteArray()
        } catch (_: Exception) {
            null
        } finally {
            runCatching { stream.close() }
        }
    }

    private fun buildExternalPlayerResultPayload(
        data: Intent?,
        resultCode: Int,
    ): Map<String, Any> {
        val action = data?.action ?: ""
        val forwardedErrorCode = data?.getStringExtra(EXTRA_EXTERNAL_PLAYER_ERROR_CODE)
        val forwardedErrorMessage = data?.getStringExtra(EXTRA_EXTERNAL_PLAYER_ERROR_MESSAGE)

        if (!forwardedErrorCode.isNullOrBlank()) {
            val payload = mutableMapOf<String, Any>(
                "completed" to false,
                "hasError" to true,
                "resultCode" to resultCode,
                "errorCode" to forwardedErrorCode,
                "errorMessage" to (forwardedErrorMessage ?: "External player launch failed."),
            )
            if (action.isNotEmpty()) {
                payload["playerAction"] = action
            }
            return payload
        }

        val endPositionMs = extractExternalPlayerPositionMs(data)

        val playbackCompleted = when (action) {
            API_MX_RESULT_ID ->
                data?.extras?.getString(API_MX_RESULT_END_BY) == API_MX_RESULT_END_BY_PLAYBACK_COMPLETION
            API_MPV_RESULT_ID -> endPositionMs == null
            API_VIMU_RESULT_ID -> resultCode == API_VIMU_RESULT_PLAYBACK_COMPLETED
            else -> false
        }

        val hasError = when (action) {
            API_VIMU_RESULT_ID -> resultCode == API_VIMU_RESULT_ERROR
            else -> resultCode != Activity.RESULT_OK && !playbackCompleted
        }

        val payload = mutableMapOf<String, Any>(
            "completed" to playbackCompleted,
            "hasError" to hasError,
            "resultCode" to resultCode,
        )

        if (action.isNotEmpty()) {
            payload["playerAction"] = action
        }

        if (endPositionMs != null) {
            payload["endPositionMs"] = endPositionMs
        }

        if (hasError) {
            payload["errorCode"] = "EXTERNAL_PLAYER_ERROR"
            payload["errorMessage"] = "External player reported an error or was canceled."
        }

        return payload
    }

    private fun extractExternalPlayerPositionMs(data: Intent?): Long? {
        val extras = data?.extras ?: return null
        val keys = listOf(
            API_MX_RESULT_POSITION,
            API_VLC_RESULT_POSITION,
        )
        for (key in keys) {
            val raw = extras.get(key) ?: continue
            val value = anyToLong(raw)
            if (value != null && value >= 0L) {
                return value
            }
        }
        return null
    }

    private fun anyToLong(value: Any?): Long? {
        return when (value) {
            is Int -> value.toLong()
            is Long -> value
            is Short -> value.toLong()
            is Byte -> value.toLong()
            is Float -> value.toLong()
            is Double -> value.toLong()
            is String -> value.toLongOrNull()
            else -> null
        }
    }

    private fun getCurrentCastSession(): CastSession? {
        return runCatching { CastContext.getSharedInstance(this).sessionManager.currentCastSession }
            .getOrNull()
    }

}
