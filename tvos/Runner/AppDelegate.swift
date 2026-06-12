import UIKit
import Flutter

@main
class AppDelegate: FlutterAppDelegate {
    private var appleTvVideoChannel: AppleTvVideoChannel?
    private var topShelfChannel: TopShelfChannel?
    private var previewChannel: AppleTvPreviewChannel?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let flutterViewController = FlutterViewController(project: nil, nibName: nil, bundle: nil)
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = flutterViewController
        window.makeKeyAndVisible()
        self.window = window

        GeneratedPluginRegistrant.register(with: self)

        appleTvVideoChannel = AppleTvVideoChannel(
            messenger: flutterViewController.binaryMessenger,
            rootViewController: flutterViewController)
        topShelfChannel = TopShelfChannel(
            messenger: flutterViewController.binaryMessenger)
        if let engine = flutterViewController.engine {
            previewChannel = AppleTvPreviewChannel(
                messenger: flutterViewController.binaryMessenger,
                textures: engine)
        }

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
