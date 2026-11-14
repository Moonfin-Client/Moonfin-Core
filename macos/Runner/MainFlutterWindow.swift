import Cocoa
import FlutterMacOS
import moonfin_game_host

/// Keeps Intel Macs on Skia. Impeller became the macOS default in Flutter 3.47
/// and garbles text, flickers and lags on Intel GPUs (flutter/flutter#191538).
/// enableImpeller is a private FlutterDartProject getter, but it's the only
/// per-architecture switch since the FLTEnableImpeller plist key applies to
/// every Mac and release builds ignore engine switches.
final class MoonfinDartProject: FlutterDartProject {
  /// The engine looks for icudtl.dat in the bundle of [self class], which is
  /// the app bundle once subclassed. Without ICU data, text wraps mid-word.
  @objc var ICUDataPath: String? {
    Bundle(for: FlutterDartProject.self).path(forResource: "icudtl", ofType: "dat")
  }

  #if arch(x86_64)
  @objc var enableImpeller: Bool { false }
  #endif
}

/// Follows every finger on a touchscreen Mac. AppKit only hands direct touches
/// to gesture recognizers, so this one never decides what the gesture is and
/// just reports each finger as it lands, moves and lifts.
final class DirectTouchRecognizer: NSGestureRecognizer {
  /// Receives `[phase, slot, x, y, seconds]` for each finger that changed.
  var onTouches: (([[Any]]) -> Void)?

  private struct Finger {
    // NSTouch objects do not last the touch, only their identity does.
    let identity: NSObjectProtocol
    let slot: Int
    var x: Double
    var y: Double
  }

  private var fingers: [Finger] = []

  /// Whether a view belongs to a platform view. Relies on the embedder's
  /// layout: this recognizer's view holds the Flutter view and the text input
  /// view, and the Flutter view holds one wrapper per platform view. A hit on
  /// the wrapper itself means the platform view passed on the touch, as the
  /// video surface does, so only views inside a wrapper count.
  static func isPlatformView(_ candidate: NSView, in root: NSView) -> Bool {
    var depth = 0
    var view: NSView? = candidate
    while let current = view, current !== root {
      depth += 1
      view = current.superview
    }
    return view === root && depth > 2
  }

  // AppKit turns touches nobody claims into mouse events with recognizers of
  // its own. Making them wait on this one leaves a single source of input,
  // where racing them lost long presses and drags at random.
  override func shouldBeRequiredToFail(by other: NSGestureRecognizer) -> Bool {
    guard let view = view, let theirs = other.view else { return true }
    return !Self.isPlatformView(theirs, in: view)
  }

  override func canBePrevented(by other: NSGestureRecognizer) -> Bool {
    false
  }

  override func touchesBegan(with event: NSEvent) {
    super.touchesBegan(with: event)
    var report: [[Any]] = []
    for touch in touches(.began, in: event) where index(of: touch) == nil {
      let slot = (0...).first { free in !fingers.contains { $0.slot == free } } ?? 0
      let point = location(of: touch)
      fingers.append(Finger(identity: touch.identity, slot: slot, x: point.x, y: point.y))
      report.append(["down", slot, point.x, point.y, event.timestamp])
    }
    send(report)
    if !fingers.isEmpty {
      state = state == .possible ? .began : .changed
    }
  }

  override func touchesMoved(with event: NSEvent) {
    super.touchesMoved(with: event)
    var report: [[Any]] = []
    for touch in touches(.moved, in: event) {
      guard let index = index(of: touch) else { continue }
      let point = location(of: touch)
      fingers[index].x = point.x
      fingers[index].y = point.y
      report.append(["move", fingers[index].slot, point.x, point.y, event.timestamp])
    }
    send(report)
    if isTracking { state = .changed }
  }

  override func touchesEnded(with event: NSEvent) {
    super.touchesEnded(with: event)
    lift(.ended, event: event)
  }

  override func touchesCancelled(with event: NSEvent) {
    super.touchesCancelled(with: event)
    lift(.cancelled, event: event)
  }

  // AppKit stops reporting any finger still down once the gesture is over.
  override func reset() {
    super.reset()
    let seconds = ProcessInfo.processInfo.systemUptime
    send(fingers.map { ["cancel", $0.slot, $0.x, $0.y, seconds] })
    fingers.removeAll()
  }

  private var isTracking: Bool { state == .began || state == .changed }

  private func lift(_ phase: NSTouch.Phase, event: NSEvent) {
    let ended = phase == .ended
    var report: [[Any]] = []
    for touch in touches(phase, in: event) {
      guard let index = index(of: touch) else { continue }
      let point = location(of: touch)
      report.append([ended ? "up" : "cancel", fingers[index].slot, point.x, point.y, event.timestamp])
      fingers.remove(at: index)
    }
    send(report)
    guard isTracking else { return }
    state = fingers.isEmpty ? (ended ? .ended : .cancelled) : .changed
  }

  private func touches(_ phase: NSTouch.Phase, in event: NSEvent) -> Set<NSTouch> {
    guard let view = view else { return [] }
    return event.touches(matching: phase, in: view).filter { $0.type == .direct }
  }

  private func index(of touch: NSTouch) -> Int? {
    fingers.firstIndex { $0.identity.isEqual(touch.identity) }
  }

  /// In points from the top left, as Flutter measures.
  private func location(of touch: NSTouch) -> (x: Double, y: Double) {
    guard let view = view else { return (0, 0) }
    let point = touch.location(in: view)
    return (Double(point.x), Double(view.isFlipped ? point.y : view.bounds.height - point.y))
  }

  private func send(_ report: [[Any]]) {
    if !report.isEmpty { onTouches?(report) }
  }
}

/// Hands the fingers on a touchscreen Mac to MacosTouchInput, which explains
/// why (lib/util/macos_touch_input.dart).
///
/// TODO(flutter/flutter#190217): remove both once the embedder handles direct
/// touches.
final class DirectTouchBridge: NSObject, NSGestureRecognizerDelegate {
  init?(view: NSView, messenger: FlutterBinaryMessenger) {
    // Not an API floor: screens only take touches from macOS 27, and before
    // it the recognizer would have nothing to follow.
    guard #available(macOS 27.0, *) else { return nil }
    let channel = FlutterBasicMessageChannel(
      // Keep in step with MacosTouchInput.
      name: "moonfin/macos_touch",
      binaryMessenger: messenger,
      codec: FlutterStandardMessageCodec.sharedInstance()
    )
    super.init()

    let recognizer = DirectTouchRecognizer(target: nil, action: nil)
    recognizer.allowedTouchTypes = .direct
    recognizer.delegate = self
    recognizer.onTouches = { channel.sendMessage($0) }
    view.addGestureRecognizer(recognizer)
  }

  // A webview or other platform view scrolls and taps on its own, so a touch
  // on one is left to it.
  func gestureRecognizer(
    _ gestureRecognizer: NSGestureRecognizer,
    shouldReceive touch: NSTouch
  ) -> Bool {
    guard let view = gestureRecognizer.view else { return false }
    guard let hit = view.hitTest(touch.location(in: view.superview)) else { return true }
    return !DirectTouchRecognizer.isPlatformView(hit, in: view)
  }
}

class MainFlutterWindow: NSWindow {
  private var touchBridge: DirectTouchBridge?
  private var sfSymbolChannel: FlutterMethodChannel?
  private var downloadDirChannel: FlutterMethodChannel?
  private var gameChannel: NativeGameChannel?
  private var aetherVideoChannel: AetherVideoChannel?
  private var themeMusicChannel: AppleTvThemeMusicChannel?
  private var arcadeSoundChannel: AppleArcadeSoundChannel?
  private var previewChannel: AppleTvPreviewChannel?
  // Retained so the security-scoped access stays open for the session.
  private var accessedDownloadURL: URL?

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController(project: MoonfinDartProject())
    let minimumWindowSize = NSSize(width: 1200, height: 760)
    self.minSize = minimumWindowSize

    var windowFrame = self.frame
    if windowFrame.size.width < minimumWindowSize.width ||
      windowFrame.size.height < minimumWindowSize.height {
      if let visibleFrame = self.screen?.visibleFrame ?? NSScreen.main?.visibleFrame {
        windowFrame.size.width = min(max(windowFrame.size.width, minimumWindowSize.width), visibleFrame.width)
        windowFrame.size.height = min(max(windowFrame.size.height, minimumWindowSize.height), visibleFrame.height)
        windowFrame.origin.x = visibleFrame.midX - (windowFrame.size.width / 2)
        windowFrame.origin.y = visibleFrame.midY - (windowFrame.size.height / 2)
      } else {
        windowFrame.size.width = max(windowFrame.size.width, minimumWindowSize.width)
        windowFrame.size.height = max(windowFrame.size.height, minimumWindowSize.height)
      }
    }

    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    self.titlebarAppearsTransparent = true
    self.titleVisibility = .hidden
    self.backgroundColor = NSColor(white: 0.04, alpha: 1.0)

    RegisterGeneratedPlugins(registry: flutterViewController)

    self.touchBridge = DirectTouchBridge(
      view: flutterViewController.view,
      messenger: flutterViewController.engine.binaryMessenger
    )

    let sfSymbolChannel = FlutterMethodChannel(
      name: "moonfin/sf_symbols",
      binaryMessenger: flutterViewController.engine.binaryMessenger
    )
    self.sfSymbolChannel = sfSymbolChannel
    sfSymbolChannel.setMethodCallHandler { (call, result) in
      guard call.method == "render",
        let args = call.arguments as? [String: Any],
        let name = args["name"] as? String
      else {
        result(FlutterMethodNotImplemented)
        return
      }
      guard #available(macOS 12.0, *) else {
        result(nil)
        return
      }
      let size = CGFloat(args["size"] as? Double ?? 18)
      let color = NSColor(
        red: CGFloat(args["r"] as? Double ?? 1),
        green: CGFloat(args["g"] as? Double ?? 1),
        blue: CGFloat(args["b"] as? Double ?? 1),
        alpha: CGFloat(args["a"] as? Double ?? 1)
      )
      let config = NSImage.SymbolConfiguration(pointSize: size, weight: .regular)
      guard
        let symbol = NSImage(systemSymbolName: name, accessibilityDescription: nil),
        let configured = symbol.withSymbolConfiguration(config)
      else {
        result(nil)
        return
      }
      let imageSize = configured.size
      let output = NSImage(size: imageSize)
      output.lockFocus()
      configured.draw(in: NSRect(origin: .zero, size: imageSize))
      color.set()
      NSRect(origin: .zero, size: imageSize).fill(using: .sourceAtop)
      output.unlockFocus()
      guard let tiff = output.tiffRepresentation,
        let rep = NSBitmapImageRep(data: tiff),
        let png = rep.representation(using: .png, properties: [:])
      else {
        result(nil)
        return
      }
      result(FlutterStandardTypedData(bytes: png))
    }

    let downloadDirChannel = FlutterMethodChannel(
      name: "moonfin/macos_download_dir",
      binaryMessenger: flutterViewController.engine.binaryMessenger
    )
    self.downloadDirChannel = downloadDirChannel
    downloadDirChannel.setMethodCallHandler { [weak self] (call, result) in
      switch call.method {
      case "pickDirectory":
        let panel = NSOpenPanel()
        panel.canChooseDirectories = true
        panel.canChooseFiles = false
        panel.allowsMultipleSelection = false
        panel.canCreateDirectories = true
        panel.begin { response in
          guard response == .OK, let url = panel.url else {
            result(nil)
            return
          }
          do {
            let data = try url.bookmarkData(
              options: .withSecurityScope,
              includingResourceValuesForKeys: nil,
              relativeTo: nil
            )
            result([
              "path": url.path,
              "bookmark": data.base64EncodedString(),
            ])
          } catch {
            result(
              FlutterError(
                code: "bookmark_failed",
                message: error.localizedDescription,
                details: nil
              )
            )
          }
        }
      case "startAccess":
        guard let args = call.arguments as? [String: Any],
          let b64 = args["bookmark"] as? String,
          let data = Data(base64Encoded: b64)
        else {
          result(nil)
          return
        }
        do {
          var stale = false
          let url = try URL(
            resolvingBookmarkData: data,
            options: .withSecurityScope,
            relativeTo: nil,
            bookmarkDataIsStale: &stale
          )
          _ = url.startAccessingSecurityScopedResource()
          self?.accessedDownloadURL = url
          var response: [String: Any] = ["path": url.path]
          if stale,
            let fresh = try? url.bookmarkData(
              options: .withSecurityScope,
              includingResourceValuesForKeys: nil,
              relativeTo: nil
            )
          {
            response["bookmark"] = fresh.base64EncodedString()
          }
          result(response)
        } catch {
          result(
            FlutterError(
              code: "resolve_failed",
              message: error.localizedDescription,
              details: nil
            )
          )
        }
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    let gameRegistrar = flutterViewController.registrar(forPlugin: "moonfin_game_host")
    self.gameChannel = NativeGameChannel(registrar: gameRegistrar)

    // AetherEngine playback: control/event channels plus the AppKitView video
    // surface factory. Same channel names as iOS, so the Dart backend is
    // shared unchanged.
    let messenger = flutterViewController.engine.binaryMessenger
    let aetherChannel = AetherVideoChannel(messenger: messenger)
    self.aetherVideoChannel = aetherChannel
    let aetherRegistrar = flutterViewController.registrar(forPlugin: "moonfin_aether_video")
    aetherRegistrar.register(
      MacosAetherVideoViewFactory(
        messenger: messenger,
        wrapperProvider: { [weak aetherChannel] in
          aetherChannel?.player ?? AetherPlayerWrapper()
        }),
      withId: MacosAetherVideoViewFactory.viewType)

    // Trailers, row previews and theme music, on the same channels the other
    // Apple platforms use.
    self.themeMusicChannel = AppleTvThemeMusicChannel(messenger: messenger)
    self.arcadeSoundChannel = AppleArcadeSoundChannel(messenger: messenger)
    let previewRegistrar = flutterViewController.registrar(forPlugin: "moonfin_appletv_preview")
    self.previewChannel = AppleTvPreviewChannel(
      messenger: messenger, textures: previewRegistrar.textures)

    super.awakeFromNib()
  }
}
