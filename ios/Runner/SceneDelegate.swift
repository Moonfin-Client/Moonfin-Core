import Flutter
import UIKit

/// Shows in any extra window scene: the single shared FlutterEngine can only
/// render into one window at a time (multiple scenes are enabled for CarPlay,
/// which also enables iPad multi-window).
private final class SecondaryWindowViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    let label = UILabel()
    label.text = "Moonfin is already open in another window"
    label.textColor = .secondaryLabel
    label.font = .preferredFont(forTextStyle: .body)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      label.leadingAnchor.constraint(
        greaterThanOrEqualTo: view.leadingAnchor, constant: 24),
      label.trailingAnchor.constraint(
        lessThanOrEqualTo: view.trailingAnchor, constant: -24),
    ])
  }
}

/// Reports a folding iPhone's hinge to Flutter, which has no path for it, so
/// the app can lay itself out around the fold when the phone is half open.
///
/// The statuses go over by name and match Dart's HingeStatus in
/// lib/util/device_hinge.dart.
final class HingeBridge {
  private let channel: FlutterMethodChannel
  private var lastSentStatus = "unknown"
  private var interaction: UIInteraction?

  init(messenger: FlutterBinaryMessenger) {
    channel = FlutterMethodChannel(name: "com.moonfin/hinge", binaryMessenger: messenger)
    // Dart asks once it is listening, since the first update can land before
    // its handler is set and again after a hot restart.
    channel.setMethodCallHandler { [weak self] call, result in
      result(call.method == "getStatus" ? self?.lastSentStatus : FlutterMethodNotImplemented)
    }
  }

  func attach(to view: UIView) {
    // UIHingeInteraction arrived in the iOS 27.1 SDK. Swift has no check for
    // an SDK's symbols, so the compiler that ships with that SDK stands in
    // for it, and older Xcodes build without the hinge.
    #if compiler(>=6.4)
      if #available(iOS 27.1, *) {
        let interaction = UIHingeInteraction { [weak self] _, update in
          self?.send(Self.statusName(of: update.hinge))
        }
        view.addInteraction(interaction)
        self.interaction = interaction
      }
    #endif
  }

  func detach() {
    guard let interaction else { return }
    interaction.view?.removeInteraction(interaction)
    self.interaction = nil
  }

  #if compiler(>=6.4)
    @available(iOS 27.1, *)
    private static func statusName(of hinge: UIHinge?) -> String {
      // No hinge means the view left a hierarchy that reports one.
      guard let hinge else { return "unknown" }
      switch hinge.status {
      case .unknown: return "unknown"
      case .closed: return "closed"
      case .partiallyOpen: return "partiallyOpen"
      case .fullyOpen: return "fullyOpen"
      @unknown default: return "unknown"
      }
    }
  #endif

  /// The hinge also reports every change of angle, which nothing here uses.
  private func send(_ status: String) {
    guard status != lastSentStatus else { return }
    lastSentStatus = status
    channel.invokeMethod("statusChanged", arguments: status)
  }
}

class SceneDelegate: FlutterSceneDelegate {
  private var registeredEngine: FlutterEngine?
  private var hingeBridge: HingeBridge?

  override func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = scene as? UIWindowScene,
      let appDelegate = UIApplication.shared.delegate as? AppDelegate
    else {
      super.scene(scene, willConnectTo: session, options: connectionOptions)
      return
    }

    appDelegate.startEngineIfNeeded()
    let engine = appDelegate.sharedEngine

    let newWindow = UIWindow(windowScene: windowScene)
    if let attached = engine.viewController,
      attached.viewIfLoaded?.window != nil,
      attached.viewIfLoaded?.window?.windowScene !== windowScene
    {
      newWindow.rootViewController = SecondaryWindowViewController()
    } else {
      // Detach any view controller left over from a disconnected scene before
      // attaching a fresh one.
      engine.viewController = nil
      let flutterViewController = FlutterViewController(
        engine: engine, nibName: nil, bundle: nil)
      newWindow.rootViewController = flutterViewController
      let bridge = HingeBridge(messenger: engine.binaryMessenger)
      bridge.attach(to: flutterViewController.view)
      hingeBridge = bridge
      // With multiple scenes enabled, Flutter cannot associate the engine with
      // the scene during the connection phase on its own; without this, launch
      // connection options (deep links, shortcuts) never reach plugins.
      registerSceneLifeCycle(with: engine)
      registeredEngine = engine
    }
    window = newWindow
    newWindow.makeKeyAndVisible()

    super.scene(scene, willConnectTo: session, options: connectionOptions)
  }

  override func sceneDidEnterBackground(_ scene: UIScene) {
    // Each background is a chance to (re)submit the auto-download refresh
    // request; a pending one with the same identifier is simply replaced.
    (UIApplication.shared.delegate as? AppDelegate)?.backgroundRefresh?.scheduleNextIfEnabled()
    super.sceneDidEnterBackground(scene)
  }

  override func sceneDidDisconnect(_ scene: UIScene) {
    hingeBridge?.detach()
    hingeBridge = nil
    if let engine = registeredEngine {
      unregisterSceneLifeCycle(with: engine)
      registeredEngine = nil
      if engine.viewController === window?.rootViewController {
        engine.viewController = nil
      }
    }
    super.sceneDidDisconnect(scene)
  }
}
