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
        gamepadHost.view.addSubview(textField)
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
            textField.text = arguments["text"] as? String ?? ""
            textField.placeholder = arguments["hint"] as? String
            textField.isSecureTextEntry = arguments["obscureText"] as? Bool ?? false
            textField.keyboardType = keyboardType(for: arguments["purpose"] as? String)
            textInputResult = result
            if !textField.becomeFirstResponder() {
                textInputResult = nil
                result(FlutterError(
                    code: "text_input_unavailable",
                    message: "Unable to present tvOS text input",
                    details: nil))
            }
        case "hideTextInput":
            let completion = textInputResult
            textInputResult = nil
            textField.resignFirstResponder()
            completion?(nil)
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
        completion?(textField.text ?? "")
    }
}
