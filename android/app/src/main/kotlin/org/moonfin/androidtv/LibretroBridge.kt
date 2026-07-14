package org.moonfin.androidtv

import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioTrack
import android.os.Handler
import android.os.Looper
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
class LibretroBridge(flutterEngine: FlutterEngine) {
  private val control = MethodChannel(
    flutterEngine.dartExecutor.binaryMessenger, "moonfin/native_game_control")
  private val events = EventChannel(
    flutterEngine.dartExecutor.binaryMessenger, "moonfin/native_game_events")
  private val textures: TextureRegistry = flutterEngine.renderer
  private val mainHandler = Handler(Looper.getMainLooper())

  private var eventSink: EventChannel.EventSink? = null
  private var textureEntry: TextureRegistry.SurfaceTextureEntry? = null
  private var surface: Surface? = null

  private var audioTrack: AudioTrack? = null
  private var audioThread: Thread? = null
  @Volatile private var audioRunning = false

  private var portMask = 0
  private var pulseMask = 0

  @Volatile var isActive = false
    private set

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
      "start" -> { nativeStart(); result.success(null) }
      "pause" -> { nativePause(); result.success(null) }
      "resume" -> { nativeResume(); result.success(null) }
      "restart" -> { nativeReset(); result.success(null) }
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
        pulseButton((args["index"] as? Int) ?: -1, (args["durationMs"] as? Int) ?: 150)
        result.success(null)
      }
      "getOptions" -> result.success(parseOptions())
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
      "controllerCount" -> result.success(1)
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

    val entry = textures.createSurfaceTexture()
    textureEntry = entry

    val av = nativeLoad(core, corePath, romPath, systemDir, saveDir, gameId, keys, values)
    if (av == null) {
      entry.release()
      textureEntry = null
      result.error("load_failed", null, null)
      return
    }

    val width = av[0].toInt()
    val height = av[1].toInt()
    entry.surfaceTexture().setDefaultBufferSize(width, height)
    val outputSurface = Surface(entry.surfaceTexture())
    surface = outputSurface
    nativeSetSurface(outputSurface)

    startAudio(av[4].toInt())
    isActive = true

    result.success(
      mapOf(
        "textureId" to entry.id(),
        "width" to width,
        "height" to height,
        "aspect" to av[2],
        "fps" to av[3],
        "sampleRate" to av[4],
      ))
  }

  private fun stop() {
    isActive = false
    stopAudio()
    nativeStop()
    surface?.release()
    surface = null
    textureEntry?.release()
    textureEntry = null
    portMask = 0
    pulseMask = 0
  }

  private fun startAudio(sampleRate: Int) {
    val minBuffer = AudioTrack.getMinBufferSize(
      sampleRate, AudioFormat.CHANNEL_OUT_STEREO, AudioFormat.ENCODING_PCM_16BIT)
      .coerceAtLeast(sampleRate)
    val track = AudioTrack(
      AudioManager.STREAM_MUSIC, sampleRate, AudioFormat.CHANNEL_OUT_STEREO,
      AudioFormat.ENCODING_PCM_16BIT, minBuffer * 2, AudioTrack.MODE_STREAM)
    audioTrack = track
    track.play()

    audioRunning = true
    val frames = 1024
    val buffer = ShortArray(frames * 2)
    val thread = Thread {
      while (audioRunning) {
        nativeReadAudio(buffer, frames)
        track.write(buffer, 0, frames * 2)
      }
    }
    thread.name = "moonfin.game.audio"
    audioThread = thread
    thread.start()
  }

  private fun stopAudio() {
    audioRunning = false
    audioThread?.join(500)
    audioThread = null
    audioTrack?.let {
      it.stop()
      it.release()
    }
    audioTrack = null
  }

  // Called from MainActivity's key dispatch on the UI thread.
  fun onButton(index: Int, pressed: Boolean) {
    if (index < 0 || index >= 16) return
    val bit = 1 shl index
    portMask = if (pressed) portMask or bit else portMask and bit.inv()
    nativeSetMask(0, portMask or pulseMask)
    eventSink?.success(mapOf("event" to "button", "index" to index, "pressed" to pressed))
  }

  fun onMenu() {
    eventSink?.success(mapOf("event" to "menuPressed"))
  }

  private fun pulseButton(index: Int, durationMs: Int) {
    if (index < 0 || index >= 16) return
    val bit = 1 shl index
    pulseMask = pulseMask or bit
    nativeSetMask(0, portMask or pulseMask)
    mainHandler.postDelayed({
      pulseMask = pulseMask and bit.inv()
      nativeSetMask(0, portMask or pulseMask)
    }, durationMs.toLong())
  }

  // Called from JNI on the host run-loop thread when the core geometry changes.
  fun onGeometry(width: Int, height: Int, aspect: Double) {
    mainHandler.post {
      eventSink?.success(
        mapOf("event" to "videoGeometry", "width" to width, "height" to height,
          "aspect" to aspect))
    }
  }

  private fun parseOptions(): List<Map<String, Any>> {
    return nativeOptions().mapNotNull { entry ->
      val parts = entry.split("\t")
      if (parts.size < 3) return@mapNotNull null
      val choices = parts.drop(3).map { mapOf("value" to it, "label" to it) }
      mapOf(
        "id" to parts[0], "label" to parts[1], "current" to parts[2],
        "choices" to choices)
    }
  }

  private external fun nativeLoad(
    core: String, corePath: String, romPath: String, systemDir: String,
    saveDir: String, gameId: String, optKeys: Array<String>,
    optVals: Array<String>): DoubleArray?

  private external fun nativeSetSurface(surface: Surface?)
  private external fun nativeStart()
  private external fun nativePause()
  private external fun nativeResume()
  private external fun nativeReset()
  private external fun nativeStop()
  private external fun nativeSetFastForward(factor: Int)
  private external fun nativeSetMask(port: Int, mask: Int)
  private external fun nativeReadAudio(buffer: ShortArray, frames: Int): Int
  private external fun nativeSaveState(): ByteArray?
  private external fun nativeLoadState(data: ByteArray): Boolean
  private external fun nativeOptions(): Array<String>
  private external fun nativeSetOption(id: String, value: String)

  companion object {
    init {
      System.loadLibrary("moonfin_libretro")
    }
  }
}
