#if canImport(FlutterMacOS)
import FlutterMacOS
#else
import Flutter
#endif
import Foundation
import libretro_host

// One running emulation: the shared C host plus the macOS video, audio, and
// input sinks. The host owns the run loop and calls back into this session
// through the C callbacks below, dispatched by the user pointer.
final class GameSession {
  struct AvInfo {
    var textureId: Int64 = -1
    var width = 0
    var height = 0
    var aspect = 4.0 / 3.0
    var fps = 60.0
    var sampleRate = 44100.0
  }

  let input = GameInputController()
  var onEvent: (([String: Any]) -> Void)?

  private var host: OpaquePointer?
  private var video: GameVideoOutput?
  private var audio: GameAudioOutput?
  private let textures: FlutterTextureRegistry
  // The core's last message, used as the reason if it then quits.
  private var lastCoreMessage: String?

  init(textures: FlutterTextureRegistry) {
    self.textures = textures
  }

  func load(
    core: String, corePath: String, romPath: String, systemDir: String,
    saveDir: String, gameId: String, options: [String: String]
  ) -> AvInfo? {
    var callbacks = lh_callbacks()
    callbacks.user = Unmanaged.passUnretained(self).toOpaque()
    callbacks.frame_ready = { user in
      GameSession.from(user)?.video?.frameAvailable()
    }
    callbacks.controller_count = { user in
      Int32(GameSession.from(user)?.input.controllerCount ?? 0)
    }
    callbacks.geometry_changed = { user, width, height, aspect in
      GameSession.from(user)?.emitGeometry(
        width: Int(width), height: Int(height), aspect: aspect)
    }
    callbacks.fatal_error = { user, message in
      let text = message.map { String(cString: $0) } ?? "Unknown error"
      GameSession.from(user)?.emitError(text)
    }
    callbacks.message = { user, text in
      guard let text else { return }
      GameSession.from(user)?.emitCoreMessage(String(cString: text))
    }
    callbacks.core_shutdown = { user in
      GameSession.from(user)?.emitCoreShutdown()
    }

    guard let host = lh_create(LH_FORMAT_BGRA8888, callbacks) else { return nil }
    self.host = host
    // The input latch now lives inside the C host (lh_set_input), so
    // GameInputController needs the host pointer to report every mask change
    // to it directly, rather than the host calling back into this class once
    // per poll (see the callbacks removed above).
    input.attach(host: host)

    let (keys, values, count, cleanup) = Self.cStrings(options)
    var info = lh_av_info()
    let rc = lh_load(
      host, corePath, romPath, systemDir, saveDir, gameId, keys, values,
      Int32(count), &info)
    cleanup()
    guard rc == 0 else {
      input.attach(host: nil)
      lh_destroy(host)
      self.host = nil
      return nil
    }

    let video = GameVideoOutput(textures: textures, host: host)
    self.video = video
    let audio = GameAudioOutput(host: host)
    self.audio = audio
    _ = audio.start(sampleRate: info.sample_rate)
    input.start()

    return AvInfo(
      textureId: video.textureId, width: Int(info.width),
      height: Int(info.height), aspect: info.aspect > 0 ? info.aspect : 4 / 3,
      fps: info.fps, sampleRate: info.sample_rate)
  }

  func start() {
    guard let host else { return }
    lh_start(host)
  }

  func setPaused(_ paused: Bool) {
    guard let host else { return }
    if paused {
      lh_pause(host)
    } else {
      lh_resume(host)
    }
    audio?.setPaused(paused)
  }

  // Fully recreates the core rather than lh_reset's soft reset, so core
  // options that are only read during initialization actually apply. Matches
  // the other platforms, which schedule this on the run loop instead of
  // blocking the caller.
  func reset() {
    guard let host else { return }
    if lh_restart_async(host) != 0 {
      emitError("Could not schedule libretro restart")
    }
  }

  func setFastForward(_ factor: Int) {
    guard let host else { return }
    lh_set_fast_forward(host, Int32(factor))
  }

  func saveState() -> Data? {
    guard let host else { return nil }
    let size = lh_serialize_size(host)
    guard size > 0 else { return nil }
    var data = Data(count: size)
    let ok = data.withUnsafeMutableBytes {
      lh_serialize(host, $0.baseAddress, size) == 0
    }
    return ok ? data : nil
  }

  func loadState(_ data: Data) -> Bool {
    guard let host else { return false }
    return data.withUnsafeBytes {
      lh_unserialize(host, $0.baseAddress, data.count) == 0
    }
  }

  // lh_option's fields are fixed C char arrays, which Swift imports as tuples.
  // lh_get_option NUL-terminates every one of them, so each can be read as a C
  // string straight out of its own storage.
  private static func cString<T>(_ chars: T) -> String {
    withUnsafeBytes(of: chars) { raw in
      guard let base = raw.baseAddress else { return "" }
      return String(cString: base.assumingMemoryBound(to: CChar.self))
    }
  }

  func options() -> [[String: Any]] {
    guard let host else { return [] }
    var result: [[String: Any]] = []
    for i in 0..<lh_option_count(host) {
      var opt = lh_option()
      // A restart on the emulation thread rebuilds the definition list, so it
      // can shrink between lh_option_count and this read. A failure means "no
      // more options", not "skip this index".
      guard lh_get_option(host, i, &opt) == 0 else { break }
      let choiceStride = Int(LH_OPTION_VALUE_MAX)
      let choices: [[String: String]] = withUnsafeBytes(of: opt.choices) { raw in
        guard let base = raw.baseAddress else { return [] }
        return (0..<Int(opt.choice_count)).map { c in
          let value = String(cString: (base + c * choiceStride)
            .assumingMemoryBound(to: CChar.self))
          return ["value": value, "label": value]
        }
      }
      result.append([
        "id": Self.cString(opt.id),
        "label": Self.cString(opt.label),
        "current": Self.cString(opt.current),
        "choices": choices,
      ])
    }
    return result
  }

  func setOption(id: String, value: String) {
    guard let host else { return }
    lh_set_option(host, id, value)
  }

  func stop() {
    input.stop()
    audio?.stop()
    audio = nil
    if let host {
      lh_stop(host)
      lh_destroy(host)
    }
    host = nil
    video?.teardown()
    video = nil
  }

  private func emitGeometry(width: Int, height: Int, aspect: Double) {
    let payload: [String: Any] = [
      "event": "videoGeometry", "width": width, "height": height,
      "aspect": aspect,
    ]
    DispatchQueue.main.async { [weak self] in self?.onEvent?(payload) }
  }

  // The emulation thread is terminating because of an unrecoverable error
  // (e.g. a failed core restart), or a caller-visible action (like restart)
  // could not even be scheduled. Called from the run-loop thread.
  private func emitError(_ message: String) {
    let payload: [String: Any] = ["event": "error", "message": message]
    DispatchQueue.main.async { [weak self] in self?.onEvent?(payload) }
  }

  private func emitCoreMessage(_ text: String) {
    lastCoreMessage = text
    DispatchQueue.main.async { [weak self] in
      self?.onEvent?(["event": "coreMessage", "message": text])
    }
  }

  // The core asked to quit, which it does when a boot fails. The teardown goes
  // to the main queue, since this runs on the emulation thread as it ends.
  private func emitCoreShutdown() {
    let detail = lastCoreMessage ?? "The emulator core stopped unexpectedly."
    DispatchQueue.main.async { [weak self] in
      self?.stop()
      self?.onEvent?(["event": "error", "message": detail])
    }
  }

  private static func from(_ user: UnsafeMutableRawPointer?) -> GameSession? {
    guard let user else { return nil }
    return Unmanaged<GameSession>.fromOpaque(user).takeUnretainedValue()
  }

  // Builds null-terminated C string arrays for the option map, plus a closure
  // that frees them once lh_load has copied the values.
  private static func cStrings(_ map: [String: String]) -> (
    keys: [UnsafePointer<CChar>?], values: [UnsafePointer<CChar>?], count: Int,
    cleanup: () -> Void
  ) {
    var keys: [UnsafePointer<CChar>?] = []
    var values: [UnsafePointer<CChar>?] = []
    for (key, value) in map {
      keys.append(UnsafePointer(strdup(key)))
      values.append(UnsafePointer(strdup(value)))
    }
    let cleanup = {
      for k in keys { Darwin.free(UnsafeMutablePointer(mutating: k)) }
      for v in values { Darwin.free(UnsafeMutablePointer(mutating: v)) }
    }
    return (keys, values, map.count, cleanup)
  }
}
