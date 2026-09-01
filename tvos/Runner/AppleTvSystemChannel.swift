import Flutter
import GameController
import UIKit

@MainActor
final class AppleTvSystemChannel: NSObject, UITextFieldDelegate {
    private let channel: FlutterMethodChannel
    private weak var gamepadHost: GCEventViewController?
    private let textField = UITextField(frame: .zero)
    private var textInputResult: FlutterResult?

    init(messenger: FlutterBinaryMessenger, gamepadHost: GCEventViewController) {
        channel = FlutterMethodChannel(
            name: "moonfin/appletv_system", binaryMessenger: messenger)
        self.gamepadHost = gamepadHost
        super.init()
        textField.delegate = self
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = false
        channel.setMethodCallHandler { [weak self] call, result in
            self?.handle(call, result: result)
        }
    }

    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "setIdleTimerDisabled":
            let disabled = (call.arguments as? Bool) ?? false
            UIApplication.shared.isIdleTimerDisabled = disabled
            result(nil)
        case "setGamepadNavigationEnabled":
            gamepadHost?.controllerUserInteractionEnabled = (call.arguments as? Bool) ?? false
            result(nil)
        case "showTextInput":
            guard let arguments = call.arguments as? [String: Any] else {
                result(FlutterError(
                    code: "invalid_text_input",
                    message: "Missing tvOS text input arguments",
                    details: nil))
                return
            }
            // Without this the replaced request never completes, and the Dart
            // side waiting on it stops taking input for the session.
            finishTextInput(with: nil)

            textField.text = arguments["text"] as? String ?? ""
            textField.placeholder = arguments["hint"] as? String
            textField.isSecureTextEntry = arguments["obscureText"] as? Bool ?? false
            textField.keyboardType = keyboardType(for: arguments["purpose"] as? String)
            gamepadHost?.view.addSubview(textField)
            textInputResult = result
            if !textField.becomeFirstResponder() {
                textInputResult = nil
                textField.removeFromSuperview()
                result(FlutterError(
                    code: "text_input_unavailable",
                    message: "Unable to present tvOS text input",
                    details: nil))
            }
        case "hideTextInput":
            finishTextInput(with: nil)
            result(nil)
        case "exitApp":
            result(nil)
            exit(0)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func keyboardType(for purpose: String?) -> UIKeyboardType {
        switch purpose {
        case "url":
            return .URL
        case "email":
            return .emailAddress
        case "numeric":
            return .numberPad
        default:
            return .default
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        let completion = textInputResult
        textInputResult = nil
        textField.removeFromSuperview()
        completion?(textField.text ?? "")
    }

    /// Ends a request and takes the field back out of the view, so none of it
    /// is left behind between two keyboards.
    private func finishTextInput(with value: String?) {
        let completion = textInputResult
        textInputResult = nil
        textField.resignFirstResponder()
        textField.removeFromSuperview()
        completion?(value)
    }
}
