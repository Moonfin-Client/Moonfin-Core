import Flutter
import UIKit

@MainActor
final class AppleTvVideoChannel: NSObject, FlutterStreamHandler {
    private let control: FlutterMethodChannel
    private let events: FlutterEventChannel
    private nonisolated(unsafe) var eventSink: FlutterEventSink?
    private weak var rootViewController: UIViewController?

    private var player: MpvPlayerWrapper?
    private var playerVC: AppleTvPlayerViewController?
    private var stateTimer: Timer?
    private var lastTextTrackCount = -1
    private var didComplete = false
    static var lastCommand = "-"

    init(messenger: FlutterBinaryMessenger, rootViewController: UIViewController) {
        control = FlutterMethodChannel(
            name: "moonfin/appletv_video_control", binaryMessenger: messenger)
        events = FlutterEventChannel(
            name: "moonfin/appletv_video_events", binaryMessenger: messenger)
        self.rootViewController = rootViewController
        super.init()
        control.setMethodCallHandler { [weak self] call, result in
            result(nil)
            Task { @MainActor in self?.handle(call) }
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

    private func handle(_ call: FlutterMethodCall) {
        let args = call.arguments as? [String: Any] ?? [:]
        Self.lastCommand = call.method
        switch call.method {
        case "present":
            present()
        case "dismiss":
            dismiss()
        case "setSource":
            setSource(args)
        case "play":
            player?.resume()
        case "pause":
            player?.pause()
        case "stop":
            player?.stop()
        case "seek":
            player?.seek(to: ms(args["positionMs"]))
        case "setSpeed":
            player?.setRate((args["speed"] as? NSNumber)?.floatValue ?? 1.0)
        case "setAudioTrack":
            player?.setAudioTrack((args["index"] as? NSNumber)?.int32Value ?? -1)
        case "setSubtitleTrack":
            player?.setSubtitleTrack((args["index"] as? NSNumber)?.int32Value ?? -1)
        case "disableSubtitleTrack":
            player?.setSubtitleTrack(-1)
        case "setVolume":
            break
        case "setAudioDelay":
            player?.setAudioDelay(ms(args["delayMs"]))
        case "setSubtitleDelay":
            player?.setSubtitleDelay(ms(args["delayMs"]))
        default:
            break
        }
    }

    private func ms(_ value: Any?) -> TimeInterval {
        ((value as? NSNumber)?.doubleValue ?? 0) / 1000.0
    }

    private func present() {
        if playerVC != nil {
            send(["event": "presented"])
            return
        }
        let created = MpvPlayerWrapper.makePlayer()
        player = created
        let vc = AppleTvPlayerViewController(player: created)
        vc.modalPresentationStyle = .overFullScreen
        vc.onExit = { [weak self] in self?.send(["event": "userExited"]) }
        playerVC = vc
        rootViewController?.present(vc, animated: false) { [weak self] in
            Task { @MainActor in
                self?.startStateTimer()
                self?.send(["event": "presented"])
            }
        }
    }

    private func dismiss() {
        stopStateTimer()
        player?.stop()
        let vc = playerVC
        playerVC = nil
        player = nil
        lastTextTrackCount = -1
        didComplete = false
        vc?.dismiss(animated: false) { [weak self] in
            Task { @MainActor in self?.send(["event": "dismissed"]) }
        }
    }

    private func setSource(_ args: [String: Any]) {
        guard let player = player, let url = args["url"] as? String else { return }
        didComplete = false
        lastTextTrackCount = -1
        let startMs = (args["startPositionMs"] as? NSNumber)?.doubleValue ?? 0
        let audioOnly = (args["mediaType"] as? String) == "audio"
        let autoPlay = (args["autoPlay"] as? Bool) ?? true
        if let speed = (args["speed"] as? NSNumber)?.floatValue {
            player.setRate(speed)
        }
        Task {
            await player.play(
                streamUrl: url, startPosition: startMs / 1000.0, audioOnly: audioOnly)
            if autoPlay {
                player.resume()
            }
        }
    }

    private func startStateTimer() {
        stateTimer?.invalidate()
        stateTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) {
            [weak self] _ in
            Task { @MainActor in self?.pushState() }
        }
    }

    private func stopStateTimer() {
        stateTimer?.invalidate()
        stateTimer = nil
    }

    private func pushState() {
        guard let p = player else { return }
        var isPlaying = false
        var isBuffering = false
        switch p.state {
        case .playing:
            isPlaying = true
        case .opening, .buffering:
            isBuffering = true
        default:
            break
        }

        send([
            "event": "state",
            "positionMs": Int((p.currentTime * 1000).rounded()),
            "durationMs": Int((p.duration * 1000).rounded()),
            "bufferedMs": Int((p.duration * Double(p.bufferProgress) * 1000).rounded()),
            "isPlaying": isPlaying,
            "isBuffering": isBuffering,
        ])

        let textCount = p.subtitleTracks.count
        if textCount != lastTextTrackCount {
            lastTextTrackCount = textCount
            send(["event": "tracksChanged", "textTrackCount": textCount])
        }

        if p.state == .ended, !didComplete {
            didComplete = true
            send(["event": "completed", "completed": true])
        }

        if p.state == .error {
            send(["event": "error", "error": "Playback error"])
        }
    }
}
