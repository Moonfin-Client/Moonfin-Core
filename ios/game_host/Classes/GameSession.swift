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
    callbacks.poll_input = { user, port in
      GameSession.from(user)?.input.mask(forPort: Int(port)) ?? 0
    }
    callbacks.controller_count = { user in
      Int32(GameSession.from(user)?.input.controllerCount ?? 0)
    }
    callbacks.geometry_changed = { user, width, height, aspect in
      GameSession.from(user)?.emitGeometry(
        width: Int(width), height: Int(height), aspect: aspect)
    }

    guard let host = lh_create(LH_FORMAT_BGRA8888, callbacks) else { return nil }
    self.host = host

    let (keys, values, count, cleanup) = Self.cStrings(options)
    var info = lh_av_info()
    let rc = lh_load(
      host, corePath, romPath, systemDir, saveDir, gameId, keys, values,
      Int32(count), &info)
    cleanup()
    guard rc == 0 else {
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

  func reset() {
    guard let host else { return }
    lh_reset(host)
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

  func options() -> [[String: Any]] {
    guard let host else { return [] }
    var result: [[String: Any]] = []
    for i in 0..<lh_option_count(host) {
      var opt = lh_option()
      guard lh_get_option(host, i, &opt) == 0, let idPtr = opt.id else { continue }
      var choices: [[String: String]] = []
      for c in 0..<Int(opt.choice_count) {
        if let choice = opt.choices?[c] {
          let value = String(cString: choice)
          choices.append(["value": value, "label": value])
        }
      }
      result.append([
        "id": String(cString: idPtr),
        "label": opt.label.map { String(cString: $0) } ?? "",
        "current": opt.current.map { String(cString: $0) } ?? "",
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
