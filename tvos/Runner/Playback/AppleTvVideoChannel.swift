import AetherEngine
import Flutter
import UIKit

@MainActor
final class AppleTvVideoChannel: NSObject, FlutterStreamHandler {
    private let control: FlutterMethodChannel
    private let events: FlutterEventChannel
    private nonisolated(unsafe) var eventSink: FlutterEventSink?
    private weak var rootViewController: UIViewController?

    private var player: AetherPlayerWrapper?
    private var playerVC: AppleTvPlayerViewController?
    private var stateTimer: Timer?
    private var lastTextTrackCount = -1
    private var lastClosedCaptionCount = -1
    private var didComplete = false
    private var lastLoggedState: PlayerState?
    private var didReportTerminalError = false
    private var lastMetadata: [String: Any]?
    private var lastSubtitleStyle: [String: Any]?
    private var lastThemeConfig: [String: Any]?
    private var lastPromptStrings: [String: Any]?
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
            if call.method == "showStillWatching" {
                // The Dart side blocks on the answer, so it must know whether
                // the modal is actually on screen before it starts waiting.
                Task { @MainActor in
                    result(self?.playerVC?.presentStillWatching() ?? false)
                }
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
        case "setEngineLogForwarding":
            setEngineLogForwarding((args["enabled"] as? Bool) == true)
        case "setAllowUntrustedTls":
            EngineTLS.allowUntrustedCertificates = (args["enabled"] as? Bool) == true
        case "setUiMetadata":
            lastMetadata = args
            playerVC?.applyUiMetadata(args)
            player?.applyNowPlayingMetadata(args)
        case "showNextUp":
            playerVC?.showNextUpCard(
                title: (args["title"] as? String) ?? "",
                episodeInfo: (args["episodeInfo"] as? String) ?? "",
                imageUrl: (args["imageUrl"] as? String) ?? "",
                isMinimal: (args["isMinimal"] as? Bool) ?? false,
                countdownStyle: (args["countdownStyle"] as? String) ?? "both",
                timeoutMs: (args["timeoutMs"] as? NSNumber)?.intValue ?? 0)
        case "hideNextUp":
            playerVC?.hideNextUpCard()
        case "showSkipSegment":
            playerVC?.showSkipSegment(
                label: (args["label"] as? String) ?? "Skip",
                countdownStyle: (args["countdownStyle"] as? String) ?? "both",
                segmentStartMs: (args["segmentStartMs"] as? NSNumber)?.intValue ?? 0,
                segmentEndMs: (args["segmentEndMs"] as? NSNumber)?.intValue ?? 0)
        case "hideSkipSegment":
            playerVC?.hideSkipSegment()
        case "showRemoteSubtitles":
            let results = (args["results"] as? [[String: Any]]) ?? []
            playerVC?.presentRemoteSubtitleResults(results)
        case "configureSubtitleStyle":
            lastSubtitleStyle = args
            applySubtitleStyle(args)
        case "setThemeConfig":
            lastThemeConfig = args
            playerVC?.applyThemeConfig(args)
        case "setPromptStrings":
            lastPromptStrings = args
            playerVC?.applyPromptStrings(args)
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
            let isExternal = (args["isExternalSubtitle"] as? Bool) == true
            player?.selectSubtitleTrack(
                (args["index"] as? NSNumber)?.int32Value ?? -1,
                externalUrl: isExternal ? args["externalSubtitleUrl"] as? String : nil
            )
        case "addExternalSubtitle":
            addExternalSubtitle(args["url"])
        case "setClosedCaptionTrack":
            player?.setClosedCaptionTrack((args["id"] as? NSNumber)?.int32Value ?? 0)
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

    @discardableResult
    private func addExternalSubtitle(_ value: Any?) -> Bool {
        guard let urlString = value as? String, let url = URL(string: urlString) else {
            return false
        }
        player?.addSubtitle(url: url)
        return true
    }

    private func applySubtitleStyle(_ args: [String: Any]) {
        guard let player = player else { return }
        applySubtitleStyle(args, on: player, vc: playerVC)
    }

    private func applySubtitleStyle(
        _ args: [String: Any], on player: AetherPlayerWrapper,
        vc: AppleTvPlayerViewController?
    ) {
        player.applySubtitleStyle(
            textColor: (args["textColor"] as? NSNumber)?.intValue,
            backgroundColor: (args["backgroundColor"] as? NSNumber)?.intValue,
            strokeColor: (args["strokeColor"] as? NSNumber)?.intValue,
            fontSize: (args["fontSize"] as? NSNumber)?.doubleValue,
            fontWeight: (args["fontWeight"] as? NSNumber)?.intValue,
            verticalOffset: (args["verticalOffset"] as? NSNumber)?.doubleValue)
        vc?.baseSubtitlePos = player.baseSubtitlePos
    }

    private func present(audioOnly: Bool) {
        if player != nil {
            send(["event": "presented"])
            return
        }
        let created = AetherPlayerWrapper()
        player = created
        created.onNowPlayingCommand = { [weak self] payload in
            self?.send(payload)
        }
        created.onPlayerError = { [weak self] payload in
            self?.send(payload)
        }
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
        // Keeps the stored delay on the Dart side in step with what the user
        // set here. Audio delay has no control on this path, so it stays zero.
        vc.onSubtitleDelayChanged = { [weak self] delayMs in
            self?.send([
                "event": "syncDelays",
                "audioDelayMs": 0,
                "subtitleDelayMs": delayMs,
            ])
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
        vc.onNextUpPlay = { [weak self] in
            self?.send(["event": "nextUpPlay"])
        }
        vc.onNextUpCancel = { [weak self] in
            self?.send(["event": "nextUpCancel"])
        }
        vc.onNextUpDismiss = { [weak self] in
            self?.send(["event": "nextUpDismiss"])
        }
        vc.onSkipSegmentSelect = { [weak self] in
            self?.send(["event": "skipSegment"])
        }
        vc.onUserSeek = { [weak self] in
            self?.send(["event": "userSeeked"])
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
        vc.onOpenCastPerson = { [weak self] personId in
            self?.send(["event": "openCastPerson", "personId": personId])
        }
        if let meta = lastMetadata {
            vc.applyUiMetadata(meta)
        }
        if let style = lastSubtitleStyle {
            applySubtitleStyle(style, on: created, vc: vc)
        }
        if let theme = lastThemeConfig {
            vc.applyThemeConfig(theme)
        }
        if let strings = lastPromptStrings {
            vc.applyPromptStrings(strings)
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
        player?.shutdown()
        let vc = playerVC
        playerVC = nil
        player = nil
        lastTextTrackCount = -1
        lastClosedCaptionCount = -1
        didComplete = false
        if let vc {
            vc.dismiss(animated: false) { [weak self] in
                Task { @MainActor in self?.send(["event": "dismissed"]) }
            }
        } else {
            send(["event": "dismissed"])
        }
    }

    /// Engine lines otherwise only reach the device console, which a remote
    /// user can't capture, so a report says nothing about what the reader and
    /// demuxer saw before the failure.
    private func setEngineLogForwarding(_ enabled: Bool) {
        guard enabled else {
            EngineLog.handler = nil
            return
        }
        EngineLog.handler = { [weak self] line in
            DispatchQueue.main.async {
                self?.send(["event": "engineLog", "line": line])
            }
        }
    }

    /// Rides the same event the engine lines use, so a report carries the open
    /// in order rather than as two separate streams.
    private func hostLog(_ line: String) {
        send(["event": "engineLog", "line": "[AppleTvVideoChannel] \(line)"])
    }

    private func setSource(_ args: [String: Any]) {
        guard let player = player, let url = args["url"] as? String else { return }
        didComplete = false
        didReportTerminalError = false
        lastTextTrackCount = -1
        lastClosedCaptionCount = -1
        let startMs = (args["startPositionMs"] as? NSNumber)?.doubleValue ?? 0
        let audioOnly = (args["mediaType"] as? String) == "audio"
        let autoPlay = (args["autoPlay"] as? Bool) ?? true

        var headers: [String: String] = [:]
        if let raw = args["headers"] as? [String: Any] {
            for (key, value) in raw { headers[key] = "\(value)" }
        }
        player.configureSource(
            AetherPlayerWrapper.SourceConfiguration(
                headers: headers,
                isLive: (args["isLive"] as? Bool) ?? false,
                autoPlay: autoPlay,
                audioStreamIndex: (args["audioStreamIndex"] as? NSNumber).flatMap {
                    $0.intValue >= 0 ? Int32($0.intValue) : nil
                }))
        player.setForceSubtitlesDisabledOnStart(
            (args["forceSubtitlesDisabledOnStart"] as? Bool) ?? false)
        player.setReplayGainDb((args["normalizationGainDb"] as? NSNumber)?.doubleValue)

        Task {
            let started = Date()
            await player.play(
                streamUrl: url, startPosition: startMs / 1000.0, audioOnly: audioOnly)
            let elapsed = Int(Date().timeIntervalSince(started) * 1000)
            hostLog(
                "play returned after \(elapsed)ms state=\(player.state) "
                    + "duration=\(Int(player.duration))s audioTracks=\(player.audioTracks.count) "
                    + "subtitleTracks=\(player.subtitleTracks.count)")
            if let speed = (args["speed"] as? NSNumber)?.floatValue, speed != 1.0 {
                player.setRate(speed)
            }
            if let delayMs = (args["subtitleDelayMs"] as? NSNumber)?.doubleValue,
                delayMs != 0
            {
                player.setSubtitleDelay(delayMs / 1000.0)
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
        if p.state != lastLoggedState {
            lastLoggedState = p.state
            hostLog(
                "state \(p.state) at \(String(format: "%.2f", p.currentTime))s "
                    + "buffered=\(Int(p.bufferProgress * 100))%")
        }
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

        // Captions can turn up part way through a live stream, so a change in
        // either list re-emits tracksChanged.
        let textCount = p.subtitleTracks.count
        let ccCount = p.closedCaptionTracks.count
        if mediaIsOpen(p.state),
            textCount != lastTextTrackCount || ccCount != lastClosedCaptionCount
        {
            lastTextTrackCount = textCount
            lastClosedCaptionCount = ccCount
            send([
                "event": "tracksChanged",
                "textTrackCount": textCount,
                "closedCaptionTracks": p.closedCaptionTracks.map { track in
                    [
                        "id": Int(track.id),
                        "label": track.name,
                        "language": track.language ?? "",
                    ]
                },
            ])
        }

        if p.state == .ended, !didComplete {
            didComplete = true
            send(["event": "completed", "completed": true])
        }

        if p.state == .error, !didReportTerminalError {
            didReportTerminalError = true
            send(["event": "error", "error": "Playback error"])
        }
    }
}
