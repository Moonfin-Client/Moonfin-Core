import AppKit
import FlutterMacOS

/// AppKitView factory for the AetherEngine video surface on macOS. The
/// platform view is screen lifetime while the wrapper and engine are app
/// lifetime, so the view only hosts the wrapper's render view and subtitle
/// overlay while it exists. Same viewType and per-view channel convention as
/// the iOS factory, so the Dart widget works unchanged.
@MainActor
final class MacosAetherVideoViewFactory: NSObject, FlutterPlatformViewFactory {
    static let viewType = "moonfin/aether_video"

    private let messenger: FlutterBinaryMessenger
    private let wrapperProvider: () -> AetherPlayerWrapper

    init(
        messenger: FlutterBinaryMessenger,
        wrapperProvider: @escaping () -> AetherPlayerWrapper
    ) {
        self.messenger = messenger
        self.wrapperProvider = wrapperProvider
        super.init()
    }

    nonisolated func createArgsCodec() -> (FlutterMessageCodec & NSObjectProtocol)? {
        FlutterStandardMessageCodec.sharedInstance()
    }

    // The protocol isn't MainActor annotated, but the engine only calls this
    // on the platform thread.
    nonisolated func create(withViewIdentifier viewId: Int64, arguments args: Any?) -> NSView {
        MainActor.assumeIsolated {
            MacosAetherVideoContainerView(
                viewId: viewId,
                arguments: args as? [String: Any] ?? [:],
                messenger: messenger,
                wrapper: wrapperProvider())
        }
    }
}

/// Container NSView hosting the engine render view and subtitle overlay.
/// Never participates in hit testing, so every click reaches the Flutter OSD.
final class MacosAetherVideoContainerView: NSView {
    private let channel: FlutterMethodChannel
    private weak var wrapper: AetherPlayerWrapper?

    init(
        viewId: Int64, arguments: [String: Any],
        messenger: FlutterBinaryMessenger, wrapper: AetherPlayerWrapper
    ) {
        channel = FlutterMethodChannel(
            name: "moonfin/aether_video_\(viewId)", binaryMessenger: messenger)
        self.wrapper = wrapper
        super.init(frame: .zero)
        wantsLayer = true
        layer?.backgroundColor = NSColor.black.cgColor

        wrapper.attachVideoView(self)
        if let zoom = arguments["zoomMode"] as? String,
            let mode = Self.zoomMode(fromWire: zoom)
        {
            wrapper.setZoomMode(mode)
        }

        channel.setMethodCallHandler { [weak self] call, result in
            self?.handle(call)
            result(nil)
        }
        channel.invokeMethod("onSurfaceReady", arguments: nil)
        wrapper.notifySurfaceReady()
    }

    required init?(coder: NSCoder) {
        fatalError("This view is only created in code")
    }

    override func hitTest(_ point: NSPoint) -> NSView? { nil }

    private func handle(_ call: FlutterMethodCall) {
        let args = call.arguments as? [String: Any] ?? [:]
        switch call.method {
        case "setZoomMode":
            if let zoom = args["mode"] as? String,
                let mode = Self.zoomMode(fromWire: zoom)
            {
                wrapper?.setZoomMode(mode)
            }
        default:
            break
        }
    }

    /// Accepts the Dart enum names (fit/autoCrop/stretch) and the native raw
    /// values (Fit/Auto Crop/Stretch).
    private static func zoomMode(fromWire value: String) -> ZoomMode? {
        switch value {
        case "fit", "Fit": return .fit
        case "autoCrop", "Auto Crop": return .autoCrop
        case "stretch", "Stretch": return .stretch
        default: return nil
        }
    }

    deinit {
        channel.setMethodCallHandler(nil)
        MainActor.assumeIsolated {
            wrapper?.detachVideoView(from: self)
        }
    }
}
