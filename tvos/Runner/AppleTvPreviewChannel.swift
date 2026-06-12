import AVFoundation
import Flutter
import UIKit

@MainActor
final class AppleTvPreviewChannel: NSObject, FlutterStreamHandler {
    private let control: FlutterMethodChannel
    private let events: FlutterEventChannel
    private let textures: FlutterTextureRegistry
    nonisolated(unsafe) private var eventSink: FlutterEventSink?
    private var players: [Int: PreviewPlayer] = [:]

    init(messenger: FlutterBinaryMessenger, textures: FlutterTextureRegistry) {
        control = FlutterMethodChannel(
            name: "moonfin/appletv_preview", binaryMessenger: messenger)
        events = FlutterEventChannel(
            name: "moonfin/appletv_preview_events", binaryMessenger: messenger)
        self.textures = textures
        super.init()
        control.setMethodCallHandler { [weak self] call, result in
            guard let self else {
                result(nil)
                return
            }
            Task { @MainActor in self.handle(call, result: result) }
        }
        events.setStreamHandler(self)
    }

    nonisolated func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink)
        -> FlutterError?
    {
        self.eventSink = eventSink
        return nil
    }

    nonisolated func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }

    nonisolated private func send(_ payload: [String: Any]) {
        eventSink?(payload)
    }

    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any] ?? [:]
        let playerId = (args["playerId"] as? NSNumber)?.intValue ?? -1
        switch call.method {
        case "open":
            guard let url = args["url"] as? String, playerId >= 0 else {
                result(FlutterError(code: "bad_args", message: nil, details: nil))
                return
            }
            let headers = (args["headers"] as? [String: String]) ?? [:]
            let volume = (args["volume"] as? NSNumber)?.floatValue ?? 0
            disposePlayer(playerId)
            let player = PreviewPlayer(
                playerId: playerId, textures: textures,
                onEvent: { [weak self] payload in self?.send(payload) })
            players[playerId] = player
            player.open(url: url, headers: headers, volume: volume) { ok in
                if ok {
                    result(["textureId": player.textureId])
                } else {
                    result(FlutterError(code: "open_failed", message: nil, details: nil))
                }
            }
        case "resume":
            players[playerId]?.resume()
            result(nil)
        case "pause":
            players[playerId]?.pause()
            result(nil)
        case "stop":
            players[playerId]?.stop()
            result(nil)
        case "setVolume":
            let volume = (args["volume"] as? NSNumber)?.floatValue ?? 0
            players[playerId]?.setVolume(volume)
            result(nil)
        case "dispose":
            disposePlayer(playerId)
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func disposePlayer(_ playerId: Int) {
        guard let player = players.removeValue(forKey: playerId) else { return }
        player.teardown()
    }
}

@MainActor
private final class PreviewPlayer: NSObject, FlutterTexture {
    private let playerId: Int
    private let textures: FlutterTextureRegistry
    private let onEvent: ([String: Any]) -> Void
    private(set) var textureId: Int64 = -1

    private var player: AVPlayer?
    private var item: AVPlayerItem?
    nonisolated(unsafe) private var output: AVPlayerItemVideoOutput?
    private var displayLink: CADisplayLink?
    private var statusObservation: NSKeyValueObservation?
    private var endObserver: NSObjectProtocol?
    private var openCompletion: ((Bool) -> Void)?

    init(
        playerId: Int, textures: FlutterTextureRegistry,
        onEvent: @escaping ([String: Any]) -> Void
    ) {
        self.playerId = playerId
        self.textures = textures
        self.onEvent = onEvent
        super.init()
        textureId = textures.register(self)
    }

    func open(
        url urlString: String, headers: [String: String], volume: Float,
        completion: @escaping (Bool) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(false)
            return
        }
        openCompletion = completion

        var options: [String: Any] = [:]
        if !headers.isEmpty {
            options["AVURLAssetHTTPHeaderFieldsKey"] = headers
        }
        let asset = AVURLAsset(url: url, options: options)
        let item = AVPlayerItem(asset: asset)
        let attrs: [String: Any] = [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
            kCVPixelBufferIOSurfacePropertiesKey as String: [:] as [String: Any],
        ]
        let output = AVPlayerItemVideoOutput(pixelBufferAttributes: attrs)
        item.add(output)
        self.item = item
        self.output = output

        let player = AVPlayer(playerItem: item)
        player.volume = max(0, min(1, volume / 100.0))
        player.actionAtItemEnd = .pause
        player.preventsDisplaySleepDuringVideoPlayback = false
        self.player = player

        statusObservation = item.observe(\.status, options: [.new]) {
            [weak self] observedItem, _ in
            let status = observedItem.status
            Task { @MainActor in
                guard let self else { return }
                switch status {
                case .readyToPlay:
                    self.finishOpen(success: true)
                case .failed:
                    self.finishOpen(success: false)
                    self.onEvent(["playerId": self.playerId, "event": "error"])
                default:
                    break
                }
            }
        }

        endObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime, object: item, queue: .main
        ) { [weak self] _ in
            Task { @MainActor in
                guard let self else { return }
                self.onEvent(["playerId": self.playerId, "event": "completed"])
            }
        }

        let link = CADisplayLink(target: self, selector: #selector(onFrame))
        link.add(to: .main, forMode: .common)
        displayLink = link
    }

    private func finishOpen(success: Bool) {
        guard let completion = openCompletion else { return }
        openCompletion = nil
        completion(success)
    }

    @objc private func onFrame() {
        guard let output, let item else { return }
        let time = item.currentTime()
        if output.hasNewPixelBuffer(forItemTime: time) {
            textures.textureFrameAvailable(textureId)
        }
    }

    nonisolated func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        guard let output else { return nil }
        let time = output.itemTime(forHostTime: CACurrentMediaTime())
        guard output.hasNewPixelBuffer(forItemTime: time),
            let buffer = output.copyPixelBuffer(forItemTime: time, itemTimeForDisplay: nil)
        else { return nil }
        return Unmanaged.passRetained(buffer)
    }

    func resume() {
        player?.play()
    }

    func pause() {
        player?.pause()
    }

    func stop() {
        player?.pause()
        player?.seek(to: .zero)
    }

    func setVolume(_ volume: Float) {
        player?.volume = max(0, min(1, volume / 100.0))
    }

    func teardown() {
        finishOpen(success: false)
        displayLink?.invalidate()
        displayLink = nil
        statusObservation?.invalidate()
        statusObservation = nil
        if let endObserver {
            NotificationCenter.default.removeObserver(endObserver)
            self.endObserver = nil
        }
        player?.pause()
        player?.replaceCurrentItem(with: nil)
        player = nil
        item = nil
        output = nil
        if textureId >= 0 {
            textures.unregisterTexture(textureId)
            textureId = -1
        }
    }
}
