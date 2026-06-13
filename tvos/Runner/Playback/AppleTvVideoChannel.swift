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
    private var lastMetadata: [String: Any]?
    private var lastSubtitleStyle: [String: Any]?
    static var lastCommand = "-"

    init(messenger: FlutterBinaryMessenger, rootViewController: UIViewController) {
        control = FlutterMethodChannel(
            name: "moonfin/appletv_video_control", binaryMessenger: messenger)
        events = FlutterEventChannel(
            name: "moonfin/appletv_video_events", binaryMessenger: messenger)
        self.rootViewController = rootViewController
        super.init()
        control.setMethodCallHandler { [weak self] call, result in
            if call.method == "getCapabilities" {
                result(VideoCapabilityDetector.deviceProfileCapabilities())
                return
            }
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
            present(audioOnly: (args["audioOnly"] as? Bool) ?? false)
        case "dismiss":
            dismiss()
        case "setSource":
            setSource(args)
        case "setUiMetadata":
            lastMetadata = args
            playerVC?.applyUiMetadata(args)
        case "showRemoteSubtitles":
            let results = (args["results"] as? [[String: Any]]) ?? []
            playerVC?.presentRemoteSubtitleResults(results)
        case "configureSubtitleStyle":
            lastSubtitleStyle = args
            applySubtitleStyle(args)
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
            player?.disableSubtitles()
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

    private func applySubtitleStyle(_ args: [String: Any]) {
        guard let player = player else { return }
        applySubtitleStyle(args, on: player, vc: playerVC)
    }

    private func applySubtitleStyle(
        _ args: [String: Any], on player: MpvPlayerWrapper,
        vc: AppleTvPlayerViewController?
    ) {
        func argbString(_ value: Any?) -> String? {
            guard let n = (value as? NSNumber)?.int64Value else { return nil }
            let a = (n >> 24) & 0xFF
            let r = (n >> 16) & 0xFF
            let g = (n >> 8) & 0xFF
            let b = n & 0xFF
            return String(format: "#%02X%02X%02X%02X", a, r, g, b)
        }

        if let color = argbString(args["textColor"]) {
            player.setProperty("sub-color", value: color)
        }
        if let color = argbString(args["backgroundColor"]) {
            player.setProperty("sub-back-color", value: color)
        }
        if let color = argbString(args["strokeColor"]) {
            player.setProperty("sub-border-color", value: color)
            player.setProperty("sub-border-size", value: "3")
        }
        if let size = (args["fontSize"] as? NSNumber)?.doubleValue, size > 0 {
            let mpvSize = Int((size * 55.0 / 24.0).rounded())
            player.setProperty("sub-font-size", value: String(mpvSize))
        }
        if let weight = (args["fontWeight"] as? NSNumber)?.intValue {
            player.setProperty("sub-bold", value: weight >= 600 ? "yes" : "no")
        }
        var subPos = 92
        if let offset = (args["verticalOffset"] as? NSNumber)?.doubleValue {
            subPos = min(100, max(40, 100 - Int((offset * 100).rounded())))
        }
        player.setProperty("sub-pos", value: String(subPos))
        vc?.baseSubtitlePos = subPos
    }

    private func present(audioOnly: Bool) {
        if player != nil {
            send(["event": "presented"])
            return
        }
        let created: MpvPlayerWrapper = NativePlayerWrapper()
        player = created
        if audioOnly {
            startStateTimer()
            send(["event": "presented"])
            return
        }
        let vc = AppleTvPlayerViewController(player: created)
        vc.modalPresentationStyle = .overFullScreen
        vc.onExit = { [weak self] in self?.send(["event": "userExited"]) }
        vc.onNext = { [weak self] in self?.send(["event": "next"]) }
        vc.onPrevious = { [weak self] in self?.send(["event": "previous"]) }
        vc.onSelectAudio = { [weak self] index in
            self?.send(["event": "selectAudio", "index": index])
        }
        vc.onSelectSubtitle = { [weak self] index in
            self?.send(["event": "selectSubtitle", "index": index])
        }
        vc.onSetSpeed = { [weak self] speed in
            self?.send(["event": "setSpeed", "speed": speed])
        }
        vc.onSetBitrate = { [weak self] mbps in
            self?.send(["event": "setBitrate", "mbps": mbps])
        }
        vc.onSelectChannel = { [weak self] channelId in
            self?.send(["event": "selectChannel", "channelId": channelId])
        }
        vc.onOpenGuide = { [weak self] in
            self?.send(["event": "openGuide"])
        }
        vc.onToggleFavorite = { [weak self] in
            self?.send(["event": "toggleFavorite"])
        }
        vc.onStillWatchingContinue = { [weak self] in
            self?.send(["event": "stillWatchingContinue"])
        }
        vc.onStillWatchingStop = { [weak self] in
            self?.send(["event": "stillWatchingStop"])
        }
        vc.onSearchSubtitles = { [weak self] in
            self?.send(["event": "searchSubtitles"])
        }
        vc.onDownloadSubtitle = { [weak self] id in
            self?.send(["event": "downloadSubtitle", "id": id])
        }
        vc.onSyncplayLeave = { [weak self] in
            self?.send(["event": "syncplayLeave"])
        }
        vc.onSyncplayIgnoreWait = { [weak self] value in
            self?.send(["event": "syncplayIgnoreWait", "value": value])
        }
        if let meta = lastMetadata {
            vc.applyUiMetadata(meta)
        }
        if let style = lastSubtitleStyle {
            applySubtitleStyle(style, on: created, vc: vc)
        }
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
        DisplayCriteriaManager.shared.reset()
        let vc = playerVC
        playerVC = nil
        player = nil
        lastTextTrackCount = -1
        didComplete = false
        if let vc {
            vc.dismiss(animated: false) { [weak self] in
                Task { @MainActor in self?.send(["event": "dismissed"]) }
            }
        } else {
            send(["event": "dismissed"])
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

        let dvProfile = (args["videoDvProfile"] as? NSNumber)?.intValue ?? -1
        let nativeDvEnabled = (args["nativeDvEnabled"] as? Bool) ?? false
        let atmosPassthrough = (args["atmosPassthrough"] as? Bool) ?? false
        let audioCodec = (args["audioCodec"] as? String ?? "").lowercased()
        let audioProfile = (args["audioProfile"] as? String ?? "").lowercased()
        let audioChannels = (args["audioChannels"] as? NSNumber)?.intValue ?? 0
        let isAtmosFamily =
            audioCodec == "truehd" || audioCodec == "mlp"
            || (audioCodec == "eac3" && audioProfile.contains("joc"))
        let preferNative =
            !audioOnly
            && ((dvProfile == 7 && nativeDvEnabled)
                || (atmosPassthrough && isAtmosFamily && audioChannels != 2))
        player.configurePreferredBackendForNextPlayback(
            preferNative ? .native : .mpv, fallbackReason: nil)

        if !preferNative && !audioOnly {
            DisplayCriteriaManager.shared.applyForStream(
                codec: args["videoCodec"] as? String,
                width: (args["videoWidth"] as? NSNumber)?.intValue ?? 0,
                height: (args["videoHeight"] as? NSNumber)?.intValue ?? 0,
                frameRate: (args["videoFrameRate"] as? NSNumber)?.doubleValue ?? 0,
                rangeType: args["videoRangeType"] as? String)
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
