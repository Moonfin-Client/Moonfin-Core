package org.moonfin.androidtv

import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioTrack
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.Process
import android.util.Log
import android.view.Surface
import androidx.annotation.Keep
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.TextureRegistry

// Native retro-game playback on Android. Drives the shared libretro host through
// JNI, renders into a Flutter external texture, plays audio through an
// AudioTrack, and takes RetroPad input from MainActivity's key dispatch.
//
// Kept whole so minification does not rename the JNI entry points or the
// onGeometry callback the native side looks up by name.
@Keep
class LibretroBridge(
  flutterEngine: FlutterEngine,
  // Lets NativePadInput learn when a session starts/stops without this class
  // needing to know it exists. Invoked after isActive flips.
  private val onActiveChanged: (Boolean) -> Unit = {},
  // Same shape: lets the input layer drop held buttons immediately before the
  // core starts running again. See the "resume" branch below.
  private val onBeforeResume: () -> Unit = {},
) {
  private val control = MethodChannel(
    flutterEngine.dartExecutor.binaryMessenger, "moonfin/native_game_control")
  private val events = EventChannel(
    flutterEngine.dartExecutor.binaryMessenger, "moonfin/native_game_events")
  private val textures: TextureRegistry = flutterEngine.renderer
  private val mainHandler = Handler(Looper.getMainLooper())

  private var eventSink: EventChannel.EventSink? = null
  private var surfaceProducer: TextureRegistry.SurfaceProducer? = null

  private var audioTrack: AudioTrack? = null
  private var audioThread: Thread? = null
  @Volatile private var audioRunning = false

  // Physical native input, Dart-generated pulses, and touch/keyboard masks
  // compose independently for each libretro port. Fixed arrays avoid any
  // collection allocation in NativePadInput's steady-state event path.
  private val physicalMasks = IntArray(MAX_PORTS)
  private val pulseMasks = IntArray(MAX_PORTS)
  private val methodMasks = IntArray(MAX_PORTS)
  private val publishedMasks = IntArray(MAX_PORTS)
  private var physicalControllerCount = 0
  // Whether physicalControllerCount is standing in for a portless
  // remote/keyboard rather than a real controller holding a port. Dart uses
  // it to show a brief notice instead of the blocking "connect a
  // controller" panel. See setControllerCount.
  private var navigationOnly = false
  // Populated once nativeLoad has initialized the core. Controller metadata is
  // control-plane state; it never participates in the per-event input path.
  private var advertisedControllerTypes: List<NativeControllerType> = emptyList()
  // Same lifecycle as advertisedControllerTypes above: SET_INPUT_DESCRIPTORS
  // is control-plane state the core republishes whenever
  // retro_set_controller_port_device changes a port's layout, so this is
  // reset and refreshed everywhere advertisedControllerTypes is.
  private var advertisedInputDescriptors: List<NativeInputDescriptor> = emptyList()
  private var loadedCore: String? = null

  // Gates the per-edge "button" EventChannel message: during gameplay the
  // overlay is closed and Dart has nothing to do with these, so nothing
  // crosses the channel. Only overlay navigation (open pause menu, controller
  // mapping capture list, ...) needs them, and that only happens with the
  // overlay open. Set by NativePadInput via Dart's setOverlayOpen call.
  @Volatile var overlayOpen = false

  @Volatile var isActive = false
    private set

  // Whether Dart paused the game, so a background-foreground round trip does
  // not resume a game the user left paused.
  @Volatile private var userPaused = false

  // The most recent message from the core, used as the reason if it then quits.
  @Volatile private var lastCoreMessage: String? = null

  init {
    control.setMethodCallHandler { call, result -> handle(call.method, call.arguments, result) }
    events.setStreamHandler(object : EventChannel.StreamHandler {
      override fun onListen(arguments: Any?, sink: EventChannel.EventSink?) {
        eventSink = sink
      }

      override fun onCancel(arguments: Any?) {
        eventSink = null
      }
    })
  }

  @Suppress("UNCHECKED_CAST")
  private fun handle(method: String, arguments: Any?, result: MethodChannel.Result) {
    val args = arguments as? Map<String, Any?> ?: emptyMap()
    when (method) {
      "load" -> load(args, result)
      "start" -> {
        if (nativeStart() == 0) result.success(null)
        else result.error("start_failed", "The render thread could not be started.", null)
      }
      "pause" -> { userPaused = true; nativePause(); result.success(null) }
      "resume" -> {
        // Physical masks reach the core even while the overlay is up
        // so whatever dismissed the menu is still held here. Dropping it BEFORE
        // nativeResume means the core never runs a frame seeing it.
        onBeforeResume()
        userPaused = false
        nativeResume()
        result.success(null)
      }
      "restart" -> {
        if (nativeReset()) {
          // A restart re-runs core init, which re-sends both controller
          // capabilities and input descriptors; refresh both caches rather
          // than waiting for the next lazy read.
          refreshControllerTypes()
          refreshInputDescriptors()
          result.success(null)
        } else {
          result.error("restart_unavailable", "The emulator is not running.", null)
        }
      }
      "stop" -> { stop(); result.success(null) }
      "saveState" -> result.success(nativeSaveState())
      "loadState" -> {
        val data = args["data"] as? ByteArray
        result.success(data != null && nativeLoadState(data))
      }
      "setFastForward" -> {
        nativeSetFastForward((args["factor"] as? Int) ?: 1)
        result.success(null)
      }
      "pulseButton" -> {
        pulseButton(
          (args["port"] as? Int) ?: 0,
          (args["index"] as? Int) ?: -1,
          (args["durationMs"] as? Int) ?: 150,
        )
        result.success(null)
      }
      "getOptions" -> result.success(parseOptions())
      "getControllerTypes" -> result.success(
        refreshControllerTypes().map { it.channelPayload() },
      )
      "getInputDescriptors" -> result.success(
        refreshInputDescriptors().map { it.channelPayload() },
      )
      "setControllerType" -> setControllerType(args, result)
      // Refused natively while a session is live; surfaces as an empty list.
      "probeOptions" -> {
        val corePath = args["corePath"] as? String
        val systemDir = args["systemDir"] as? String
        if (corePath == null || systemDir == null) {
          result.error("bad_args", "probeOptions needs corePath and systemDir", null)
        } else {
          result.success(decodeOptions(nativeProbeOptions(corePath, systemDir)))
        }
      }
      "setOption" -> {
        val id = args["id"] as? String
        val value = args["value"] as? String
        if (id != null && value != null) nativeSetOption(id, value)
        result.success(null)
      }
      "getCurrentOptions" -> {
        val current = HashMap<String, String>()
        for (option in parseOptions()) {
          current[option["id"] as String] = option["current"] as String
        }
        result.success(current)
      }
      "controllerCount" -> result.success(physicalControllerCount)
      "setInput" -> {
        val port = (args["port"] as? Int) ?: 0
        if (isValidPort(port)) {
          methodMasks[port] = (args["mask"] as? Int) ?: 0
          applyMask(port)
        }
        result.success(null)
      }
      else -> result.notImplemented()
    }
  }

  private fun load(args: Map<String, Any?>, result: MethodChannel.Result) {
    val core = args["core"] as? String
    val corePath = args["corePath"] as? String
    val romPath = args["romPath"] as? String
    val systemDir = args["systemDir"] as? String
    val saveDir = args["saveDir"] as? String
    val gameId = args["gameId"] as? String
    if (core == null || corePath == null || romPath == null || systemDir == null ||
      saveDir == null || gameId == null) {
      result.error("bad_args", null, null)
      return
    }
    stop()

    @Suppress("UNCHECKED_CAST")
    val options = (args["options"] as? Map<String, String>) ?: emptyMap()
    val keys = options.keys.toTypedArray()
    val values = keys.map { options[it]!! }.toTypedArray()

    val producer = textures.createSurfaceProducer()
    surfaceProducer = producer
    // Flutter destroys and recreates the underlying Surface around
    // backgrounding, so swap it out of the native side in lockstep.
    producer.setCallback(object : TextureRegistry.SurfaceProducer.Callback {
      override fun onSurfaceAvailable() {
        nativeSetSurface(producer.surface)
        if (isActive && !userPaused) nativeResume()
      }

      override fun onSurfaceCleanup() {
        nativePause()
        nativeSetSurface(null)
      }
    })

    val av = nativeLoad(core, corePath, romPath, systemDir, saveDir, gameId, keys, values)
    if (av == null) {
      // Handle load failures more gracefully.
      // SurfaceTextureSurfaceProducer.release() unconditionally calls
      // surface.release() with no null check, masking the real
      // "load_failed" cause result with a crash. This "touches" it to avoid that.
      producer.surface
      producer.release()
      surfaceProducer = null
      advertisedControllerTypes = emptyList()
      advertisedInputDescriptors = emptyList()
      loadedCore = null
      result.error("load_failed", null, null)
      return
    }

    advertisedControllerTypes = parseControllerTypes(nativeControllerTypes())
    advertisedInputDescriptors = parseInputDescriptors(nativeInputDescriptors())
    loadedCore = core

    val width = av[0].toInt()
    val height = av[1].toInt()
    producer.setSize(width, height)
    nativeSetSurface(producer.surface)

    startAudio(av[4].toInt())
    isActive = true
    onActiveChanged(true)

    result.success(
      mapOf(
        "textureId" to producer.id(),
        "width" to width,
        "height" to height,
        "aspect" to av[2],
        "fps" to av[3],
        "sampleRate" to av[4],
      ))
  }

  // Reachable from three places: the "stop" method call, load() (which calls
  // it before nativeLoad() to tear down any prior session), and MainActivity's
  // onDestroy() (a running session must not be abandoned if the activity is
  // destroyed while the process survives - see the comment there). All three
  // routes destroy the native host, so stopAudio() must stay ahead of
  // nativeStop(): it is what guarantees no thread is inside nativeReadAudio
  // when the host, its ring buffer, and its audio mutex are freed. Safe to
  // call repeatedly - isActive/audioTrack/audioThread/surfaceProducer are all
  // null-guarded, and nativeStop()'s teardown() no-ops once g_ctx.host is NULL.
  fun stop() {
    val hadActiveSession = isActive
    isActive = false
    userPaused = false
    lastCoreMessage = null
    advertisedControllerTypes = emptyList()
    advertisedInputDescriptors = emptyList()
    loadedCore = null
    stopAudio()
    if (hadActiveSession) resetAllMasks() else clearMaskArrays()
    nativeStop()
    // See the comment on the load() failure branch: release() NPEs inside the
    // Flutter engine if .surface was never read first. A producer can reach
    // here without ever having had its surface read -- e.g. one whose load()
    // failed before nativeSetSurface(producer.surface) ran.
    surfaceProducer?.surface
    surfaceProducer?.release()
    surfaceProducer = null
    overlayOpen = false
    onActiveChanged(false)
  }

  // Zeroes just the physical-pad contribution. Touch/keyboard method input
  // remains explicitly port-local and is reset by stop().
  fun resetPadMasks() {
    for (port in 0 until MAX_PORTS) {
      physicalMasks[port] = 0
      applyMask(port)
    }
  }

  fun setControllerCount(count: Int, navigationOnly: Boolean = false, force: Boolean = false) {
    val clamped = count.coerceIn(0, MAX_PORTS)
    if (physicalControllerCount == clamped && this.navigationOnly == navigationOnly && !force) return
    physicalControllerCount = clamped
    this.navigationOnly = navigationOnly
    if (isActive) {
      eventSink?.success(
        mapOf(
          "event" to "controllersChanged",
          "count" to clamped,
          "navigationOnly" to navigationOnly,
        ),
      )
    }
  }

  private fun startAudio(sampleRate: Int) {
    val track = buildAudioTrack(sampleRate)
    audioTrack = track
    track.play()

    audioRunning = true
    val thread = Thread { runAudioLoop(track) }
    thread.name = "moonfin.game.audio"
    audioThread = thread
    thread.start()
  }

  private fun buildAudioTrack(sampleRate: Int): AudioTrack {
    // A small device buffer keeps input-to-sound lag low, while still holding
    // several of the AUDIO_CHUNK_FRAMES writes the loop below issues.
    val bytesPerFrame = 2 * BYTES_PER_SAMPLE
    val bufferBytes = AudioTrack.getMinBufferSize(
      sampleRate, AudioFormat.CHANNEL_OUT_STEREO, AudioFormat.ENCODING_PCM_16BIT)
      .coerceAtLeast(4 * AUDIO_CHUNK_FRAMES * bytesPerFrame)
    val builder = AudioTrack.Builder()
      .setAudioAttributes(
        AudioAttributes.Builder()
          .setUsage(AudioAttributes.USAGE_GAME)
          .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
          .build())
      .setAudioFormat(
        AudioFormat.Builder()
          .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
          .setSampleRate(sampleRate)
          .setChannelMask(AudioFormat.CHANNEL_OUT_STEREO)
          .build())
      .setBufferSizeInBytes(bufferBytes)
      .setTransferMode(AudioTrack.MODE_STREAM)
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      builder.setPerformanceMode(AudioTrack.PERFORMANCE_MODE_LOW_LATENCY)
    }
    return builder.build()
  }

  // Runs on the "moonfin.game.audio" thread for the life of one session. It is
  // the only caller of nativeReadAudio, and stopAudio() joins it before the
  // native host is destroyed, so the host pointer it reads through stays live.
  private fun runAudioLoop(track: AudioTrack) {
    // The emulation and blit threads are native pthreads created from the main
    // thread, so they inherit its elevated nice (-10). This one is a Java
    // Thread, which does not inherit it and starts at the default 0 -- leaving
    // the one thread feeding AudioTrack as the lowest-priority worker in the
    // process, and the first descheduled under load. That shows up as
    // "AudioTrack: disabled due to previous underrun" and audible crackle.
    // The buffer is already built for PERFORMANCE_MODE_LOW_LATENCY; this is the
    // scheduling half of the same intent.
    Process.setThreadPriority(Process.THREAD_PRIORITY_URGENT_AUDIO)
    // Small chunks keep the blocking write's back pressure finer than one
    // video frame.
    val buffer = ShortArray(AUDIO_CHUNK_FRAMES * 2)
    try {
      while (audioRunning) {
        val read = nativeReadAudio(buffer, AUDIO_CHUNK_FRAMES)
        // Write only what the ring had, since padding silence would pop. On a
        // short read the emulator is priming or paused, so give it a moment.
        if (read > 0) track.write(buffer, 0, read * 2)
        if (read < AUDIO_CHUNK_FRAMES) Thread.sleep(2)
      }
    } catch (e: InterruptedException) {
      Thread.currentThread().interrupt()
    } catch (e: IllegalStateException) {
      // The track was released underneath an in-flight write. stopAudio() is
      // ordered so this should not happen; if it ever does, losing audio for a
      // session we are tearing down anyway beats an uncaught exception on a
      // non-UI thread, which kills the process.
      Log.w(TAG, "audio loop stopped: track no longer usable", e)
    }
  }

  private fun stopAudio() {
    audioRunning = false
    /* A "paranoid" edge case that could maybe manifest on slower hardware.
     This theoretically prevents the main thread hanging, causing the app to hang.
     Pause + flush drops the queued buffer so a blocking write can
     return immediately, while stop alone only drains it.
     The audio thread's join remains unbounded so the thread can't reach lh_read_audio
     after nativeStop frees the buffer/mutex.
     */
    audioTrack?.let { runCatching { it.pause() } }
    audioTrack?.let { runCatching { it.flush() } }
    audioTrack?.let { runCatching { it.stop() } }
    audioThread?.join()
    audioThread = null
    audioTrack?.let { runCatching { it.release() } }
    audioTrack = null
  }

  private fun resetAllMasks() {
    for (port in 0 until MAX_PORTS) {
      physicalMasks[port] = 0
      pulseMasks[port] = 0
      methodMasks[port] = 0
      applyMask(port)
    }
  }

  private fun clearMaskArrays() {
    physicalMasks.fill(0)
    pulseMasks.fill(0)
    methodMasks.fill(0)
    publishedMasks.fill(0)
  }

  private fun isValidPort(port: Int): Boolean = port in 0 until MAX_PORTS

  private fun applyMask(port: Int) {
    if (!isValidPort(port)) return
    val desired = physicalMasks[port] or pulseMasks[port] or methodMasks[port]
    if (publishedMasks[port] == desired) return
    publishedMasks[port] = desired
    nativeSetMask(port, desired)
  }

  // Called from NativePadInput (native RetroPad path) on the UI thread. Only
  // sends the EventChannel message while the overlay is open: during
  // gameplay Dart has nothing to do with a button edge, so nothing crosses
  // the channel for it.
  /**
   * Takes the whole RetroPad state at once, so one input event costs one JNI
   * call no matter how many bits it moved.
   *
   * [NativePadInput] already holds the port's state as a mask, and
   * lh_set_input takes a mask, so forwarding one bit at a time made
   * a diagonal cost two crossings and a full release up to sixteen. The XOR
   * below recovers the individual edges, and only when the overlay is open --
   * during gameplay nothing crosses the channel at all.
   */
  fun onPad(port: Int, mask: Int) {
    if (!isValidPort(port)) return
    val changed = physicalMasks[port] xor mask
    if (changed == 0) return
    physicalMasks[port] = mask
    applyMask(port)
    if (!overlayOpen) return
    var remaining = changed
    while (remaining != 0) {
      val bit = remaining and -remaining
      remaining = remaining and bit.inv()
      val index = Integer.numberOfTrailingZeros(bit)
      eventSink?.success(
        mapOf(
          "event" to "button",
          "index" to index,
          "pressed" to (mask and bit != 0),
          "port" to port,
        ),
      )
    }
  }

  /**
   * Sibling of [onPad] that also carries the analog axes and trigger
   * pressures, for callers driving the analog passthrough
   * (`lh_set_pad_state`) rather than the mask-only path. Mirrors onPad's mask
   * bookkeeping (physicalMasks/publishedMasks/the overlay button-edge
   * fan-out) but always ends in one nativeSetPadState call instead of
   * applyMask's nativeSetMask, so a mask change and its analog values cross
   * JNI together rather than as two separate calls. Callers keep using
   * [onPad] for a mask-only update.
   */
  fun onPadState(port: Int, mask: Int, lx: Int, ly: Int, rx: Int, ry: Int, l2: Int, r2: Int) {
    if (!isValidPort(port)) return
    val changed = physicalMasks[port] xor mask
    physicalMasks[port] = mask
    val desired = physicalMasks[port] or pulseMasks[port] or methodMasks[port]
    publishedMasks[port] = desired
    nativeSetPadState(port, desired, lx, ly, rx, ry, l2, r2)
    if (!overlayOpen || changed == 0) return
    var remaining = changed
    while (remaining != 0) {
      val bit = remaining and -remaining
      remaining = remaining and bit.inv()
      val index = Integer.numberOfTrailingZeros(bit)
      eventSink?.success(
        mapOf(
          "event" to "button",
          "index" to index,
          "pressed" to (mask and bit != 0),
          "port" to port,
        ),
      )
    }
  }

  fun onMenu(port: Int = 0) {
    eventSink?.success(mapOf("event" to "menuPressed", "port" to port))
  }

  // Called from JNI on the host run-loop thread when the emulation thread is
  // about to die from an unrecoverable error (e.g. the core failed to
  // restart). Dart shows this instead of leaving a frozen frame with no
  // explanation.
  fun onError(message: String) {
    mainHandler.post {
      eventSink?.success(mapOf("event" to "error", "message" to message))
    }
  }

  private fun pulseButton(port: Int, index: Int, durationMs: Int) {
    if (!isValidPort(port) || index < 0 || index >= 16) return
    val bit = 1 shl index
    pulseMasks[port] = pulseMasks[port] or bit
    applyMask(port)
    mainHandler.postDelayed({
      pulseMasks[port] = pulseMasks[port] and bit.inv()
      applyMask(port)
    }, durationMs.toLong())
  }

  // Called from JNI with a message the core wants shown, such as PPSSPP's
  // warning about missing system files. The last one is kept so a core that
  // then quits can explain itself.
  fun onCoreMessage(message: String) {
    lastCoreMessage = message
    mainHandler.post {
      eventSink?.success(mapOf("event" to "coreMessage", "message" to message))
    }
  }

  // Called from JNI when the core asked to quit, which cores do when a boot
  // fails. The emulation is already gone, so tear the rest down and let Dart
  // show the reason instead of leaving a frozen picture behind.
  fun onCoreShutdown() {
    mainHandler.post {
      val detail = lastCoreMessage
      stop()
      eventSink?.success(
        mapOf(
          "event" to "error",
          "message" to (detail ?: "The emulator core stopped unexpectedly."),
        ))
    }
  }

  // Called from JNI on the host run-loop thread when the core geometry changes.
  fun onGeometry(width: Int, height: Int, aspect: Double) {
    mainHandler.post {
      surfaceProducer?.setSize(width, height)
      eventSink?.success(
        mapOf("event" to "videoGeometry", "width" to width, "height" to height,
          "aspect" to aspect))
    }
  }

  private fun parseOptions(): List<Map<String, Any>> {
    // Array<String> is only sound because nativeOptions trims its result to the
    // entries it actually filled: a core restart can shrink the option list
    // mid-enumeration, and the JNI side used to leave a null in the gap, which
    // this non-null element type turns into an NPE on the platform thread.
    return decodeOptions(nativeOptions())
  }

  /** Decodes the tab-joined option entries the JNI layer packs. */
  private fun decodeOptions(entries: Array<String>): List<Map<String, Any>> {
    return entries.mapNotNull { entry ->
      val parts = entry.split("\t")
      if (parts.size < 3) return@mapNotNull null
      val choices = parts.drop(3).map { mapOf("value" to it, "label" to it) }
      mapOf(
        "id" to parts[0], "label" to parts[1], "current" to parts[2],
        "choices" to choices)
    }
  }

  private fun setControllerType(args: Map<String, Any?>, result: MethodChannel.Result) {
    val port = (args["port"] as? Number)?.toInt()
    if (port == null || !isValidPort(port)) {
      result.error("invalid_controller_type", "Controller port must be between 0 and 3.", null)
      return
    }

    // Auto is represented by the libretro default RetroPad device. A null or
    // omitted value is accepted as Auto so older Dart callers can opt in
    // without inventing a second wire-level sentinel.
    val deviceType = (args["deviceType"] as? Number)?.toLong() ?: RETRO_DEVICE_JOYPAD
    val isDefault = deviceType == RETRO_DEVICE_JOYPAD
    val isAdvertised = refreshControllerTypes().any {
      it.port == port && it.id == deviceType
    }
    if (!isDefault && !isAdvertised) {
      result.error(
        "invalid_controller_type",
        "Device type $deviceType is not advertised for port $port.",
        null,
      )
      return
    }
    val status = nativeSetControllerType(port, deviceType)
    if (status < 0) {
      result.error("controller_type_failed", "The core rejected device type $deviceType for port $port.", null)
    } else {
      // retro_set_controller_port_device commonly makes the core re-send
      // SET_INPUT_DESCRIPTORS for the new layout (e.g. an FBNeo control
      // scheme switch); refresh the cache immediately rather than leaving it
      // stale until the next lazy read.
      refreshInputDescriptors()
      result.success(null)
    }
  }

  private fun refreshControllerTypes(): List<NativeControllerType> {
    if (!isActive || loadedCore == null) return advertisedControllerTypes
    advertisedControllerTypes = parseControllerTypes(nativeControllerTypes())
    return advertisedControllerTypes
  }

  private fun parseControllerTypes(entries: Array<String>): List<NativeControllerType> =
    NativeControllerTypeParser.parse(entries)

  private fun refreshInputDescriptors(): List<NativeInputDescriptor> {
    if (!isActive || loadedCore == null) return advertisedInputDescriptors
    advertisedInputDescriptors = parseInputDescriptors(nativeInputDescriptors())
    return advertisedInputDescriptors
  }

  private fun parseInputDescriptors(entries: Array<String>): List<NativeInputDescriptor> =
    NativeInputDescriptorParser.parse(entries)

  /**
   * Bitmask of ports whose left stick is passed through as analog instead of
   * being converted to d-pad bits (bit N = port N). A port qualifies only
   * when the game describes an analog stick for it AND the core has actually
   * read one. Returns 0 when no core is loaded, same guard as the
   * neighbouring functions.
   */
  fun analogStickPorts(): Int {
    if (!isActive || loadedCore == null) return 0
    return nativeAnalogStickPorts()
  }

  private external fun nativeAnalogStickPorts(): Int

  private external fun nativeLoad(
    core: String, corePath: String, romPath: String, systemDir: String,
    saveDir: String, gameId: String, optKeys: Array<String>,
    optVals: Array<String>): DoubleArray?

  private external fun nativeSetSurface(surface: Surface?)
  private external fun nativeStart(): Int
  private external fun nativePause()
  private external fun nativeResume()
  private external fun nativeReset(): Boolean
  private external fun nativeStop()
  private external fun nativeSetFastForward(factor: Int)
  private external fun nativeSetMask(port: Int, mask: Int)
  private external fun nativeSetPadState(
    port: Int, mask: Int, lx: Int, ly: Int, rx: Int, ry: Int, l2: Int, r2: Int)
  private external fun nativeReadAudio(buffer: ShortArray, frames: Int): Int
  private external fun nativeSaveState(): ByteArray?
  private external fun nativeLoadState(data: ByteArray): Boolean
  private external fun nativeOptions(): Array<String>
  private external fun nativeControllerTypes(): Array<String>
  private external fun nativeInputDescriptors(): Array<String>
  private external fun nativeSetControllerType(port: Int, deviceType: Long): Int
  private external fun nativeProbeOptions(
    corePath: String, systemDir: String): Array<String>
  private external fun nativeSetOption(id: String, value: String)

  companion object {
    private const val TAG = "LibretroBridge"
    private const val MAX_PORTS = 4

    // Frames pulled from the native ring per write. Stereo, so the short
    // buffer is twice this.
    private const val AUDIO_CHUNK_FRAMES = 512
    private const val BYTES_PER_SAMPLE = 2
    private const val RETRO_DEVICE_JOYPAD = 1L

    init {
      System.loadLibrary("moonfin_libretro")
    }
  }
}

/** Control-plane description of one core-advertised port/device pair. */
internal data class NativeControllerType(
  val port: Int,
  val id: Long,
  val label: String,
) {
  fun channelPayload(): Map<String, Any> = mapOf(
    "port" to port,
    "id" to id,
    "label" to label,
  )
}

/** Parses the compact JNI payload without touching gameplay input state. */
internal object NativeControllerTypeParser {
  fun parse(
    entries: Array<String>,
    onParsed: (NativeControllerType) -> Unit = {},
  ): List<NativeControllerType> {
    val parsed = ArrayList<NativeControllerType>(entries.size)
    for (entry in entries) {
      val fields = entry.split('\t', limit = 3)
      if (fields.size != 3) continue
      val port = fields[0].toIntOrNull() ?: continue
      val id = fields[1].toLongOrNull() ?: continue
      // Preserve every non-negative advertised port for diagnostics and Dart
      // capability inspection. setControllerType separately restricts the
      // selectable Moonfin input ports to the four host ports.
      if (port < 0) continue
      val type = NativeControllerType(port, id, fields[2])
      parsed += type
      onParsed(type)
    }
    return parsed
  }
}

/**
 * Control-plane description of one core-advertised
 * RETRO_ENVIRONMENT_SET_INPUT_DESCRIPTORS entry: which (port, device, index,
 * id) a human-readable label such as "Coin" or "Fire" applies to.
 */
internal data class NativeInputDescriptor(
  val port: Int,
  val device: Long,
  val index: Int,
  val id: Long,
  val description: String,
) {
  fun channelPayload(): Map<String, Any> = mapOf(
    "port" to port,
    "device" to device,
    "index" to index,
    "id" to id,
    "description" to description,
  )
}

/** Parses the compact JNI payload without touching gameplay input state. */
internal object NativeInputDescriptorParser {
  fun parse(
    entries: Array<String>,
    onParsed: (NativeInputDescriptor) -> Unit = {},
  ): List<NativeInputDescriptor> {
    val parsed = ArrayList<NativeInputDescriptor>(entries.size)
    for (entry in entries) {
      // limit = 5 keeps a description that itself contains a tab intact,
      // matching the "%u\t%u\t%u\t%u\t%s" encoding nativeInputDescriptors
      // (native_game_jni.c) writes.
      val fields = entry.split('\t', limit = 5)
      if (fields.size != 5) continue
      val port = fields[0].toIntOrNull() ?: continue
      val device = fields[1].toLongOrNull() ?: continue
      val index = fields[2].toIntOrNull() ?: continue
      val id = fields[3].toLongOrNull() ?: continue
      if (port < 0 || device < 0 || index < 0 || id < 0) continue
      val descriptor = NativeInputDescriptor(port, device, index, id, fields[4])
      parsed += descriptor
      onParsed(descriptor)
    }
    return parsed
  }
}
