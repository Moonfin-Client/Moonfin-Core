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

class SceneDelegate: FlutterSceneDelegate {
  private var registeredEngine: FlutterEngine?

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
      newWindow.rootViewController = FlutterViewController(
        engine: engine, nibName: nil, bundle: nil)
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

  override func sceneDidDisconnect(_ scene: UIScene) {
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
