import Flutter
import GameController
import UIKit

/// Hosts the Flutter view so a game controller can be kept away from the UI.
///
/// The one switch tvOS offers is this view controller's
/// `controllerUserInteractionEnabled`, honored for whatever sits in its
/// responder chain, so it has to be an ancestor of the Flutter view rather
/// than a sibling. Off routes controller input to the GameController profiles
/// instead of the responder chain, and that covers more devices than a
/// gamepad: the Siri Remote is a microGamepad, a paired keyboard is a
/// GCKeyboard, and a third party remote reaches tvOS as one or the other. It
/// therefore starts on, matching the Apple TV preference default, until Dart
/// sends the stored value.
final class GamepadNavigationHostViewController: GCEventViewController {
    let flutterViewController: FlutterViewController

    init(flutterViewController: FlutterViewController) {
        self.flutterViewController = flutterViewController
        super.init(nibName: nil, bundle: nil)
        controllerUserInteractionEnabled = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(flutterViewController)
        flutterViewController.view.frame = view.bounds
        flutterViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(flutterViewController.view)
        flutterViewController.didMove(toParent: self)
    }
}

@main
class AppDelegate: FlutterAppDelegate {
    private var appleTvVideoChannel: AppleTvVideoChannel?
    private var topShelfChannel: TopShelfChannel?
    private var previewChannel: AppleTvPreviewChannel?
    private var systemChannel: AppleTvSystemChannel?
    private var audioChannel: AppleTvAudioChannel?
    private var themeMusicChannel: AppleTvThemeMusicChannel?
    private var sfSymbolChannel: AppleTvSfSymbolChannel?
    private var gameChannel: AppleTvGameChannel?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let flutterViewController = FlutterViewController(project: nil, nibName: nil, bundle: nil)
        let gamepadHost = GamepadNavigationHostViewController(
            flutterViewController: flutterViewController)
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = gamepadHost
        window.makeKeyAndVisible()
        self.window = window

        // FlutterAppDelegate only hands out registrars when the window's root
        // is a FlutterViewController, and the host sits there now, so plugins
        // register against the controller directly.
        GeneratedPluginRegistrant.register(with: flutterViewController)

        appleTvVideoChannel = AppleTvVideoChannel(
            messenger: flutterViewController.binaryMessenger,
            rootViewController: flutterViewController)
        topShelfChannel = TopShelfChannel(
            messenger: flutterViewController.binaryMessenger)
        previewChannel = AppleTvPreviewChannel(
            messenger: flutterViewController.binaryMessenger,
            textures: flutterViewController)
        systemChannel = AppleTvSystemChannel(
            messenger: flutterViewController.binaryMessenger,
            gamepadHost: gamepadHost)
        audioChannel = AppleTvAudioChannel(
            messenger: flutterViewController.binaryMessenger)
        themeMusicChannel = AppleTvThemeMusicChannel(
            messenger: flutterViewController.binaryMessenger)
        sfSymbolChannel = AppleTvSfSymbolChannel(
            messenger: flutterViewController.binaryMessenger)
        gameChannel = AppleTvGameChannel(
            messenger: flutterViewController.binaryMessenger,
            textures: flutterViewController,
            rootViewController: flutterViewController)

        if let launchUrl = launchOptions?[.url] as? URL {
            topShelfChannel?.deliverDeepLink(launchUrl, isLaunch: true)
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    override func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        topShelfChannel?.deliverDeepLink(url, isLaunch: false)
        return true
    }
}

@MainActor
final class AppleTvSfSymbolChannel: NSObject {
    private let channel: FlutterMethodChannel

    init(messenger: FlutterBinaryMessenger) {
        channel = FlutterMethodChannel(
            name: "moonfin/sf_symbols", binaryMessenger: messenger)
        super.init()
        channel.setMethodCallHandler { [weak self] call, result in
            self?.handle(call, result: result)
        }
    }

    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard call.method == "render",
            let args = call.arguments as? [String: Any],
            let name = args["name"] as? String
        else {
            result(FlutterMethodNotImplemented)
            return
        }
        let size = CGFloat(args["size"] as? Double ?? 18)
        let scale = CGFloat(args["scale"] as? Double ?? 2)
        let color = UIColor(
            red: CGFloat(args["r"] as? Double ?? 1),
            green: CGFloat(args["g"] as? Double ?? 1),
            blue: CGFloat(args["b"] as? Double ?? 1),
            alpha: CGFloat(args["a"] as? Double ?? 1))
        let config = UIImage.SymbolConfiguration(pointSize: size, weight: .regular)
        guard let symbol = UIImage(systemName: name, withConfiguration: config) else {
            result(nil)
            return
        }
        let tinted = symbol.withTintColor(color, renderingMode: .alwaysOriginal)
        let format = UIGraphicsImageRendererFormat()
        format.scale = scale
        let renderer = UIGraphicsImageRenderer(size: tinted.size, format: format)
        let data = renderer.pngData { _ in tinted.draw(at: .zero) }
        result(FlutterStandardTypedData(bytes: data))
    }
}
