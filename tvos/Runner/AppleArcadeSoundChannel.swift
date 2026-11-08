import AVFoundation
#if canImport(Flutter)
    import Flutter
#elseif canImport(FlutterMacOS)
    import FlutterMacOS
#endif

/// The After Hours arcade's effects and menu music on Apple, where the libmpv
/// players the other platforms use are not built in. Dart sends each clip's
/// bytes once and then triggers it by name.
@MainActor
final class AppleArcadeSoundChannel: NSObject {
    private let channel: FlutterMethodChannel
    private var players: [String: AVAudioPlayer] = [:]

    init(messenger: FlutterBinaryMessenger) {
        channel = FlutterMethodChannel(
            name: "moonfin/arcade_sound", binaryMessenger: messenger)
        super.init()
        channel.setMethodCallHandler { [weak self] call, result in
            Task { @MainActor in self?.handle(call, result: result) }
        }
    }

    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any] ?? [:]
        let id = args["id"] as? String ?? ""
        switch call.method {
        case "load":
            guard let data = args["data"] as? FlutterStandardTypedData,
                let player = try? AVAudioPlayer(data: data.data)
            else {
                result(false)
                return
            }
            player.numberOfLoops = (args["loop"] as? Bool ?? false) ? -1 : 0
            player.volume = (args["volume"] as? NSNumber)?.floatValue ?? 1
            player.prepareToPlay()
            players[id]?.stop()
            players[id] = player
            result(true)
        case "play":
            players[id]?.currentTime = 0
            players[id]?.play()
            result(nil)
        case "resume":
            players[id]?.play()
            result(nil)
        case "pause":
            players[id]?.pause()
            result(nil)
        case "unload":
            players.removeValue(forKey: id)?.stop()
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
