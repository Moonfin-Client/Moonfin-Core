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

/// Holds the engine's views back from the camera housing.
///
/// The inset is read from UIKit, where the video actually sits, rather than
/// from the metrics Flutter hands the widget. Only the left and right sides
/// are held back, which is where the housing sits in landscape.
@MainActor
final class AetherVideoContainerView: UIView {
    var keepsClearOfHousing = false {
        didSet {
            guard keepsClearOfHousing != oldValue else { return }
            setNeedsLayout()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let housing = housingInsets
        let content = keepsClearOfHousing
            ? bounds.inset(
                by: UIEdgeInsets(
                    top: 0, left: housing.left, bottom: 0, right: housing.right))
            : bounds
        for view in subviews where view.frame != content {
            view.frame = content
        }
    }

    /// The widest housing this view can see. A platform view sits inside
    /// Flutter's own container hierarchy, which does not always carry the
    /// insets down, so the window and its root are asked as well.
    private var housingInsets: UIEdgeInsets {
        let candidates = [
            safeAreaInsets,
            window?.safeAreaInsets ?? .zero,
            window?.rootViewController?.view.safeAreaInsets ?? .zero,
        ]
        return UIEdgeInsets(
            top: 0,
            left: candidates.map(\.left).max() ?? 0,
            bottom: 0,
            right: candidates.map(\.right).max() ?? 0)
    }
}

@MainActor
final class AetherVideoPlatformView: NSObject, FlutterPlatformView {
    private let container: AetherVideoContainerView
    private let channel: FlutterMethodChannel
    private weak var wrapper: AetherPlayerWrapper?

    init(
        frame: CGRect, viewId: Int64, arguments: [String: Any],
        messenger: FlutterBinaryMessenger, wrapper: AetherPlayerWrapper
    ) {
        container = AetherVideoContainerView(frame: frame)
        container.backgroundColor = .black
        container.keepsClearOfHousing =
            (arguments["keepClearOfHousing"] as? Bool) ?? false
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
        case "setKeepClearOfHousing":
            container.keepsClearOfHousing = (args["value"] as? Bool) ?? false
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
