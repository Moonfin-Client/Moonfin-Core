import FlutterMacOS
import Foundation

// Flutter bridge for native retro-game playback on macOS. One live session at a
// time, since the libretro host uses global C callbacks.
public final class NativeGameChannel: NSObject, FlutterStreamHandler {
  private let control: FlutterMethodChannel
  private let events: FlutterEventChannel
  private let textures: FlutterTextureRegistry
  private var eventSink: FlutterEventSink?
  private var session: GameSession?

  public init(registrar: FlutterPluginRegistrar) {
    control = FlutterMethodChannel(
      name: "moonfin/native_game_control", binaryMessenger: registrar.messenger)
    events = FlutterEventChannel(
      name: "moonfin/native_game_events", binaryMessenger: registrar.messenger)
    textures = registrar.textures
    super.init()
    control.setMethodCallHandler { [weak self] call, result in
      self?.handle(call, result: result)
    }
    events.setStreamHandler(self)
  }

  public func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink)
    -> FlutterError?
  {
    self.eventSink = eventSink
    return nil
  }

  public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    eventSink = nil
    return nil
  }

  private func send(_ payload: [String: Any]) {
    eventSink?(payload)
  }

  private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any] ?? [:]
    switch call.method {
    case "load":
      load(args, result: result)
    case "start":
      session?.start()
      result(nil)
    case "pause":
      session?.setPaused(true)
      result(nil)
    case "resume":
      session?.setPaused(false)
      result(nil)
    case "restart":
      session?.reset()
      result(nil)
    case "stop":
      stopSession()
      result(nil)
    case "saveState":
      if let data = session?.saveState() {
        result(FlutterStandardTypedData(bytes: data))
      } else {
        result(FlutterError(code: "serialize_failed", message: nil, details: nil))
      }
    case "loadState":
      guard let session, let typed = args["data"] as? FlutterStandardTypedData else {
        result(false)
        return
      }
      result(session.loadState(typed.data))
    case "setFastForward":
      session?.setFastForward((args["factor"] as? NSNumber)?.intValue ?? 1)
      result(nil)
    case "pulseButton":
      let index = (args["index"] as? NSNumber)?.intValue ?? -1
      let durationMs = (args["durationMs"] as? NSNumber)?.intValue ?? 150
      session?.input.pulse(index: index, durationMs: durationMs)
      result(nil)
    case "getOptions":
      result(session?.options() ?? [])
    case "setOption":
      if let id = args["id"] as? String, let value = args["value"] as? String {
        session?.setOption(id: id, value: value)
      }
      result(nil)
    case "getCurrentOptions":
      var map: [String: String] = [:]
      for option in session?.options() ?? [] {
        if let id = option["id"] as? String, let current = option["current"] as? String {
          map[id] = current
        }
      }
      result(map)
    case "controllerCount":
      result(session?.input.controllerCount ?? 0)
    case "setInput":
      let mask = (args["mask"] as? NSNumber)?.uint16Value ?? 0
      session?.input.setDartMask(mask)
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func load(_ args: [String: Any], result: @escaping FlutterResult) {
    guard
      let core = args["core"] as? String,
      let romPath = args["romPath"] as? String,
      let systemDir = args["systemDir"] as? String,
      let saveDir = args["saveDir"] as? String,
      let gameId = args["gameId"] as? String
    else {
      result(FlutterError(code: "bad_args", message: nil, details: nil))
      return
    }
    // macOS bundles its cores, so the path comes from the app rather than Dart.
    let requested = (args["corePath"] as? String).flatMap { $0.isEmpty ? nil : $0 }
    guard let corePath = requested ?? Self.bundledCorePath(core) else {
      result(FlutterError(code: "core_missing", message: nil, details: nil))
      return
    }
    if core == "ppsspp" {
      Self.seedBundledAssets(named: "PPSSPP", into: systemDir)
    }
    stopSession()

    let options = (args["options"] as? [String: String]) ?? [:]
    try? FileManager.default.createDirectory(
      atPath: saveDir, withIntermediateDirectories: true)

    let session = GameSession(textures: textures)
    session.onEvent = { [weak self] payload in self?.send(payload) }
    session.input.onButton = { [weak self] index, pressed in
      self?.send(["event": "button", "index": index, "pressed": pressed])
    }
    session.input.onControllersChanged = { [weak self] count in
      self?.send(["event": "controllersChanged", "count": count])
    }

    guard
      let av = session.load(
        core: core, corePath: corePath, romPath: romPath, systemDir: systemDir,
        saveDir: saveDir, gameId: gameId, options: options)
    else {
      session.stop()
      result(FlutterError(code: "load_failed", message: nil, details: nil))
      return
    }
    self.session = session
    result([
      "textureId": av.textureId,
      "width": av.width,
      "height": av.height,
      "aspect": av.aspect,
      "fps": av.fps,
      "sampleRate": av.sampleRate,
    ])
  }

  private func stopSession() {
    session?.stop()
    session = nil
  }

  // The bundled core binary inside its embedded framework, or nil when the core
  // is not shipped in this build.
  private static func bundledCorePath(_ core: String) -> String? {
    let name = "\(core)_libretro"
    guard let frameworks = Bundle.main.privateFrameworksURL else { return nil }
    let path = frameworks.appendingPathComponent("\(name).framework")
      .appendingPathComponent(name).path
    return FileManager.default.fileExists(atPath: path) ? path : nil
  }

  // Copies a bundled asset folder into the core's system directory once, for
  // cores like PSP that read runtime assets from there.
  private static func seedBundledAssets(named folder: String, into systemDir: String) {
    let fm = FileManager.default
    guard let source = Bundle.main.resourceURL?.appendingPathComponent(folder),
      fm.fileExists(atPath: source.path)
    else { return }
    let destination = URL(fileURLWithPath: systemDir).appendingPathComponent(folder)
    guard !fm.fileExists(atPath: destination.path) else { return }
    try? fm.createDirectory(
      atPath: systemDir, withIntermediateDirectories: true)
    try? fm.copyItem(at: source, to: destination)
  }
}
