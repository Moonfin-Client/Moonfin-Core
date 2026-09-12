import Flutter
import UIKit

/// UiKitView factory for the AetherEngine video surface. The platform view is
/// screen-lifetime while the wrapper and engine are app-lifetime, so the view only hosts
/// the wrapper's render view + subtitle overlay while it exists.
@MainActor
final class AetherVideoViewFactory: NSObject, FlutterPlatformViewFactory {
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

    nonisolated func createArgsCodec() -> (FlutterMessageCodec & NSObjectProtocol) {
        FlutterStandardMessageCodec.sharedInstance()
    }

    func create(
        withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?
    ) -> FlutterPlatformView {
        AetherVideoPlatformView(
            frame: frame,
            viewId: viewId,
            arguments: args as? [String: Any] ?? [:],
            messenger: messenger,
            wrapper: wrapperProvider())
    }
}

@MainActor
final class AetherVideoPlatformView: NSObject, FlutterPlatformView {
    private let container: UIView
    private let channel: FlutterMethodChannel
    private weak var wrapper: AetherPlayerWrapper?

    init(
        frame: CGRect, viewId: Int64, arguments: [String: Any],
        messenger: FlutterBinaryMessenger, wrapper: AetherPlayerWrapper
    ) {
        container = UIView(frame: frame)
        container.backgroundColor = .black
        // Gestures belong to the Flutter OSD stacked above this surface.
        container.isUserInteractionEnabled = false
        channel = FlutterMethodChannel(
            name: "moonfin/aether_video_\(viewId)", binaryMessenger: messenger)
        self.wrapper = wrapper
        super.init()

        wrapper.attachVideoView(container)
        if let zoom = arguments["zoomMode"] as? String,
            let mode = Self.zoomMode(fromWire: zoom)
        {
            wrapper.setZoomMode(mode)
        }

        channel.setMethodCallHandler { [weak self] call, result in
            Task { @MainActor in
                self?.handle(call)
                result(nil)
            }
        }
        channel.invokeMethod("onSurfaceReady", arguments: nil)
        wrapper.notifySurfaceReady()
    }

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

    nonisolated func view() -> UIView {
        MainActor.assumeIsolated { container }
    }

    deinit {
        MainActor.assumeIsolated {
            channel.setMethodCallHandler(nil)
            wrapper?.detachVideoView(from: container)
        }
    }
}
