import AVFoundation
import Flutter
import UIKit

/// Exposes a lightweight audio-capability probe to Dart on tvOS.
///
/// Unlike Android there is no API for a third-party app (which decodes with its
/// own pipeline, mpv) to learn the receiver's supported codecs, so this probe
/// reports decode-everything / passthrough-nothing and focuses on the one thing
/// tvOS *does* expose: the output channel count. That drives multichannel-PCM
/// vs stereo-downmix automatically via the shared device-profile builder.
///
/// Method channel `moonfin/appletv_audio` (method `audioCapabilities`) +
/// event channel `moonfin/appletv_audio_events` (pushes on route changes).
final class AppleTvAudioChannel: NSObject {
    private let methodChannel: FlutterMethodChannel
    private let eventChannel: FlutterEventChannel
    private var eventSink: FlutterEventSink?

    init(messenger: FlutterBinaryMessenger) {
        methodChannel = FlutterMethodChannel(
            name: "moonfin/appletv_audio", binaryMessenger: messenger)
        eventChannel = FlutterEventChannel(
            name: "moonfin/appletv_audio_events", binaryMessenger: messenger)
        super.init()
        methodChannel.setMethodCallHandler { [weak self] call, result in
            self?.handle(call, result: result)
        }
        eventChannel.setStreamHandler(self)
    }

    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "audioCapabilities":
            result(AppleTvAudioChannel.currentCapabilities())
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    /// Reads the current output capabilities, focused on the output channel count.
    static func currentCapabilities() -> [String: Any] {
        let session = AVAudioSession.sharedInstance()
        let maxChannels = max(2, resolvedMaxOutputChannels(session))
        return [
            "maxPcmChannels": maxChannels,
            "activeRouteType": resolveRouteType(session),
            "routeSupportsHdAudio": false,
            // Decoding happens locally and tvOS never bitstreams, so
            // passthrough is off.
            "canDecodeAc3": true,
            "canDecodeEac3": true,
            "canDecodeDts": true,
            "canDecodeDtsHd": true,
            "canDecodeTrueHd": true,
            "canDecodeFlac": true,
            "canPassthroughAc3": false,
            "canPassthroughEac3": false,
            "canPassthroughEac3Joc": false,
            "canPassthroughDts": false,
            "canPassthroughDtsHd": false,
            "canPassthroughDtsX": false,
            "canPassthroughTrueHd": false,
            "canPassthroughTrueHdJoc": false,
        ]
    }

    private static func resolvedMaxOutputChannels(_ session: AVAudioSession) -> Int {
        let current = session.maximumOutputNumberOfChannels
        if current > 2 {
            return current
        }
        do {
            try session.setCategory(.playback, mode: .moviePlayback, policy: .longFormAudio)
            try session.setActive(true)
            let negotiated = session.maximumOutputNumberOfChannels
            if negotiated > 2 {
                try? session.setPreferredOutputNumberOfChannels(negotiated)
            }
            return negotiated
        } catch {
            return current
        }
    }

    private static func resolveRouteType(_ session: AVAudioSession) -> String {
        for output in session.currentRoute.outputs where output.portType == .HDMI {
            return "hdmi"
        }
        return "other"
    }

    private func emit() {
        let caps = AppleTvAudioChannel.currentCapabilities()
        DispatchQueue.main.async { [weak self] in
            self?.eventSink?(caps)
        }
    }

    @objc private func routeChanged(_ notification: Notification) {
        emit()
    }
}

extension AppleTvAudioChannel: FlutterStreamHandler {
    func onListen(
        withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink
    ) -> FlutterError? {
        eventSink = events
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(routeChanged(_:)),
            name: AVAudioSession.routeChangeNotification,
            object: nil)
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        NotificationCenter.default.removeObserver(
            self, name: AVAudioSession.routeChangeNotification, object: nil)
        eventSink = nil
        return nil
    }
}
