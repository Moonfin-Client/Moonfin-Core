import AVFoundation
#if canImport(Flutter)
    import Flutter
#elseif canImport(FlutterMacOS)
    import FlutterMacOS
#endif

@MainActor
final class AppleTvThemeMusicChannel: NSObject {
    private let channel: FlutterMethodChannel
    private var queuePlayer: AVQueuePlayer?
    private var looper: AVPlayerLooper?
    private var currentToken: Int = -1

    init(messenger: FlutterBinaryMessenger) {
        channel = FlutterMethodChannel(
            name: "moonfin/appletv_theme_music", binaryMessenger: messenger)
        super.init()
        channel.setMethodCallHandler { [weak self] call, result in
            Task { @MainActor in self?.handle(call, result: result) }
        }
    }

    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any] ?? [:]
        let token = (args["token"] as? NSNumber)?.intValue ?? -1
        switch call.method {
        case "open":
            guard let urlString = args["url"] as? String, let url = URL(string: urlString) else {
                result(nil)
                return
            }
            open(url: url, token: token)
            result(nil)
        case "setVolume":
            if token == currentToken {
                let volume = (args["volume"] as? NSNumber)?.floatValue ?? 0
                queuePlayer?.volume = max(0, min(1, volume / 100.0))
            }
            result(nil)
        case "stop":
            if token == currentToken { stop() }
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func open(url: URL, token: Int) {
        stop()
        currentToken = token
        let item = AVPlayerItem(url: url)
        let queue = AVQueuePlayer(playerItem: item)
        queue.volume = 0
        let loop = AVPlayerLooper(player: queue, templateItem: item)
        queuePlayer = queue
        looper = loop
        queue.play()
    }

    private func stop() {
        looper?.disableLooping()
        looper = nil
        queuePlayer?.pause()
        queuePlayer?.removeAllItems()
        queuePlayer = nil
    }
}
