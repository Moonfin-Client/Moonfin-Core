import CarPlay
import UIKit

@available(iOS 14.0, *)
class CarPlaySceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {
  func templateApplicationScene(
    _ templateApplicationScene: CPTemplateApplicationScene,
    didConnect interfaceController: CPInterfaceController
  ) {
    // didFinishLaunchingWithOptions always precedes scene connection, so this
    // is normally a no-op; it guarantees Dart is running when iOS cold-launches
    // the app for CarPlay only.
    (UIApplication.shared.delegate as? AppDelegate)?.startEngineIfNeeded()
    CarPlayBridge.shared.connect(interfaceController: interfaceController)
  }

  func templateApplicationScene(
    _ templateApplicationScene: CPTemplateApplicationScene,
    didDisconnectInterfaceController interfaceController: CPInterfaceController
  ) {
    CarPlayBridge.shared.disconnect()
  }
}
