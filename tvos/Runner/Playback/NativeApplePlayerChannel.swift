import AVFoundation
import AetherEngine
import Combine
import Flutter
import UIKit

@MainActor
final class NativeApplePlayerChannel: NSObject, FlutterStreamHandler {
    private let control: FlutterMethodChannel
    private let events: FlutterEventChannel
    private nonisolated(unsafe) var eventSink: FlutterEventSink?
    private let rootProvider: () -> UIViewController?
    private let textures: FlutterTextureRegistry?

    private var player: AetherPlayerWrapper?
    /// Set while the player is off screen for Flutter UI with playback still
    /// running, which is how the Live TV guide keeps the channel playing.
    private var suspendedFrames: EngineFrameTexture?
    private var isSuspended = false

    /// The wrapper this channel is playing through, if any.
    var activePlayer: AetherPlayerWrapper? { player }

    /// Fires once the player is on screen and again once it's gone, so PiP can
    /// follow the engine into whichever view is hosting it.
    var onPlayerChanged: (() -> Void)?
    private var playerVC: NativeApplePlayerViewController?
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
    private var lastTimeSlots: [String: Any]?
    private var lastCinemaSkipState: [String: Any]?
    static var lastCommand = "-"

    /// The root is looked up per presentation because on iOS the Flutter window
    /// can be missing when CarPlay starts the engine and come later.
    init(
        messenger: FlutterBinaryMessenger, textures: FlutterTextureRegistry?,
        rootProvider: @escaping () -> UIViewController?
    ) {
        control = FlutterMethodChannel(
            name: "moonfin/native_apple_player_control", binaryMessenger: messenger)
        events = FlutterEventChannel(
            name: "moonfin/native_apple_player_events", binaryMessenger: messenger)
        self.rootProvider = rootProvider
        self.textures = textures
        super.init()
        control.setMethodCallHandler { [weak self] call, result in
            if call.method == "getCapabilities" {
                #if os(tvOS)
                result(VideoCapabilityDetector.deviceProfileCapabilities())
                #else
                result(AetherVideoCapabilities.deviceProfileCapabilities())
                #endif
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
            if call.method == "suspend" {
                Task { @MainActor in self?.suspend(result: result) }
                return
            }
            if call.method == "setVolume" {
                Task { @MainActor in
                    guard let player = self?.player else {
                        result(FlutterError(code: "no_player", message: "No playback session", details: nil))
                        return
                    }
                    let args = call.arguments as? [String: Any]
                    guard let value = (args?["volume"] as? NSNumber)?.doubleValue, value.isFinite else {
                        result(FlutterError(code: "invalid_volume", message: "Expected a finite percentage", details: nil))
                        return
                    }
                    Self.lastCommand = call.method
                    player.setUserVolume(Float(min(max(value, 0), 100) / 100))
                    result(nil)
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
        case "resume":
            resumePresentation()
        case "setReconnecting":
            playerVC?.setReconnecting(args["label"] as? String)
        case "showMessage":
            playerVC?.presentMessage(
                (args["message"] as? String) ?? "",
                actionLabel: args["actionLabel"] as? String,
                closeLabel: (args["closeLabel"] as? String) ?? "OK"
            ) { [weak self] in
                self?.send(["event": "messageAction"])
            }
        case "remoteNavigation":
            if let command = args["command"] as? String {
                playerVC?.handleRemoteNavigation(command)
            }
        case "setSource":
            setSource(args)
        case "setEngineLogForwarding":
            setEngineLogForwarding((args["enabled"] as? Bool) == true)
        case "setAllowUntrustedTls":
            EngineTLS.serverTrustEvaluator = EngineTrustPolicy.evaluator(from: args)
        case "setClientCertificates":
            ClientIdentityStore.setClientCertificates(
                (args["certificates"] as? [[String: Any]]) ?? [])
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
        case "setCinemaSkipState":
            // Save the latest Cinema Skip state until the native player is ready.
            lastCinemaSkipState = args
            playerVC?.applyCinemaSkipState(args)
        case "showSkipSegment":
            // Don't show regular Skip Segment prompts during Cinema Mode trailers.
            if (lastCinemaSkipState?["active"] as? Bool) != true {
                playerVC?.showSkipSegment(
                    label: (args["label"] as? String) ?? "Skip",
                    countdownStyle: (args["countdownStyle"] as? String) ?? "both",
                    segmentStartMs: (args["segmentStartMs"] as? NSNumber)?.intValue ?? 0,
                    segmentEndMs: (args["segmentEndMs"] as? NSNumber)?.intValue ?? 0)
            }
        case "hideSkipSegment":
            if (lastCinemaSkipState?["active"] as? Bool) != true {
                playerVC?.hideSkipSegment()
            }
        case "showEpisodeBrowser":
            playerVC?.showEpisodeBrowser(args)
        case "updateEpisodeBrowser":
            playerVC?.updateEpisodeBrowser(args)
        case "hideEpisodeBrowser":
            playerVC?.hideEpisodeBrowser()
        case "showRemoteSubtitles":
            let results = (args["results"] as? [[String: Any]]) ?? []
            playerVC?.presentRemoteSubtitleResults(results)
        case "showSubtitleProgress":
            playerVC?.showSubtitleProgress((args["message"] as? String) ?? "Working\u{2026}")
        case "hideSubtitleProgress":
            playerVC?.hideSubtitleProgress(message: args["message"] as? String)
        case "configureSubtitleStyle":
            lastSubtitleStyle = args
            applySubtitleStyle(args)
        case "setThemeConfig":
            lastThemeConfig = args
            playerVC?.applyThemeConfig(args)
        case "setPromptStrings":
            lastPromptStrings = args
            playerVC?.applyPromptStrings(args)
        case "setTimeSlots":
            lastTimeSlots = args
            playerVC?.applyTimeSlots(args)
        case "play":
            player?.resume()
        case "pause":
            player?.pause()
        case "stop":
            player?.stop()
        case "seek":
            // Through the player screen when it is up, so a seek the app sends
            // (a remote skip, a segment skip) drops any scrub in progress.
            if let vc = playerVC {
                vc.seekFromHost(toSeconds: ms(args["positionMs"]))
            } else {
                player?.seek(to: ms(args["positionMs"]))
            }
            // State is otherwise only pushed by the 0.25s timer, so until the
            // next tick Dart still reads the pre-seek position with the player
            // reported as playing. Anything measuring how far behind we are
            // takes that sample as real and corrects against a position the
            // seek has already left. Android emits on the same discontinuity
            // for the same reason (Media3VideoView.onPositionDiscontinuity).
            markSeekInFlight()
        case "setSpeed":
            player?.setRate((args["speed"] as? NSNumber)?.floatValue ?? 1.0)
        case "setAudioTrack":
            player?.setAudioTrack((args["index"] as? NSNumber)?.int32Value ?? -1)
        case "setSubtitleTrack":
            let isExternal = (args["isExternalSubtitle"] as? Bool) == true
            let externalUrl = isExternal ? args["externalSubtitleUrl"] as? String : nil
            // The player keys its external tracks by the url addExternalSubtitle
            // built, so a selection takes the same conversion or the lookup misses
            // and selection falls back to guessing by position.
            player?.selectSubtitleTrack(
                (args["index"] as? NSNumber)?.int32Value ?? -1,
                externalUrl: externalUrl.flatMap { urlFrom($0)?.absoluteString } ?? externalUrl
            )
        case "addExternalSubtitle":
            addExternalSubtitle(args)
        case "setClosedCaptionTrack":
            player?.setClosedCaptionTrack((args["id"] as? NSNumber)?.int32Value ?? 0)
        case "disableSubtitleTrack":
            player?.disableSubtitles()
        case "setSecondarySubtitle":
            player?.setSecondarySubtitle(
                embeddedTrackId: (args["embeddedTrackId"] as? NSNumber)?.intValue,
                url: (args["url"] as? String).flatMap { urlFrom($0) })
        case "setSecondarySubtitleDelay":
            player?.setSecondarySubtitleDelay(ms(args["delayMs"]))
        case "configureSecondarySubtitleStyle":
            player?.configureSecondarySubtitleStyle(
                fontSize: (args["fontSize"] as? NSNumber)?.doubleValue,
                verticalOffset: (args["verticalOffset"] as? NSNumber)?.doubleValue,
                textColor: (args["textColor"] as? NSNumber)?.intValue)
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

    private func urlFrom(_ string: String) -> URL? {
        string.hasPrefix("/") ? URL(fileURLWithPath: string) : URL(string: string)
    }

    @discardableResult
    private func addExternalSubtitle(_ args: [String: Any]) -> Bool {
        guard let urlString = args["url"] as? String, let url = urlFrom(urlString) else {
            return false
        }
        // The name and language ride along, or the track lists as a bare entry
        // and nothing can match it by language.
        player?.addSubtitle(
            url: url,
            title: args["title"] as? String,
            language: args["language"] as? String)
        return true
    }

    private func applySubtitleStyle(_ args: [String: Any]) {
        guard let player = player else { return }
        applySubtitleStyle(args, on: player, vc: playerVC)
    }

    private func applySubtitleStyle(
        _ args: [String: Any], on player: AetherPlayerWrapper,
        vc: NativeApplePlayerViewController?
    ) {
        player.applySubtitleStyle(
            textColor: (args["textColor"] as? NSNumber)?.intValue,
            backgroundColor: (args["backgroundColor"] as? NSNumber)?.intValue,
            strokeColor: (args["strokeColor"] as? NSNumber)?.intValue,
            fontSize: (args["fontSize"] as? NSNumber)?.doubleValue,
            fontWeight: (args["fontWeight"] as? NSNumber)?.intValue,
            verticalOffset: (args["verticalOffset"] as? NSNumber)?.doubleValue)
        vc?.baseSubtitlePos = player.baseSubtitlePos
        vc?.reapplySubtitleClearance()
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
        let vc = NativeApplePlayerViewController(player: created)
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
        vc.onSubtitleAction = { [weak self] action in
            self?.send(action)
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
        vc.onRecord = { [weak self] in
            self?.send(["event": "record"])
        }
        vc.onToggleOrientation = { [weak self] in
            self?.send(["event": "toggleOrientation"])
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
        vc.onCinemaSkipAction = { [weak self] action, generation in
            self?.send([
                "event": "cinemaSkipAction",
                "action": action,
                "generation": generation,
            ])
        }
        vc.onUserSeek = { [weak self] positionMs in
            self?.send(["event": "userSeeked", "positionMs": positionMs])
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
        vc.onOpenEpisodes = { [weak self] in
            self?.send(["event": "openEpisodes"])
        }
        vc.onSelectEpisodesSeason = { [weak self] seasonId in
            self?.send(["event": "selectEpisodesSeason", "seasonId": seasonId])
        }
        vc.onSelectEpisode = { [weak self] episodeId in
            self?.send(["event": "selectEpisode", "episodeId": episodeId])
        }
        vc.onEpisodesClosed = { [weak self] in
            self?.send(["event": "episodesClosed"])
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
        if let slots = lastTimeSlots {
            vc.applyTimeSlots(slots)
        }
        if let cinema = lastCinemaSkipState {
            vc.applyCinemaSkipState(cinema)
        }
        guard let presenter = presentingController() else {
            created.shutdown()
            player = nil
            send(["event": "error", "error": "No window to show the player in"])
            // Dart marks the player presented before asking, so without this it
            // would skip every later present and the next video would never show.
            send(["event": "dismissed"])
            return
        }
        playerVC = vc
        #if os(iOS)
        let presented: UIViewController = IosNativePlayerHostController(content: vc)
        #else
        let presented: UIViewController = vc
        #endif
        presenter.present(presented, animated: false) { [weak self] in
            Task { @MainActor in
                self?.startStateTimer()
                self?.send(["event": "presented"])
                self?.onPlayerChanged?()
            }
        }
    }

    private func presentingController() -> UIViewController? {
        var top = rootProvider()
        #if os(iOS)
        // Something like the AirPlay picker can already be up over Flutter,
        // and UIKit refuses to present from a controller that is covered.
        while let next = top?.presentedViewController, !next.isBeingDismissed {
            top = next
        }
        #endif
        return top
    }

    private func dismiss() {
        lastCinemaSkipState = nil
        stopStateTimer()
        player?.shutdown()
        suspendedFrames?.teardown()
        suspendedFrames = nil
        let wasSuspended = isSuspended
        isSuspended = false
        #if os(iOS)
        IosNativePlayerHostController.orientationLock = nil
        #endif
        let vc = playerVC
        playerVC = nil
        player = nil
        lastTextTrackCount = -1
        lastClosedCaptionCount = -1
        didComplete = false
        if let vc {
            // A sheet or panel can be up over the player, and dismissing the
            // player itself would only close that. Dismissing from whatever
            // presented the player closes the whole stack. On iOS the player
            // sits inside the scaling host, which is what was presented.
            let top = vc.parent ?? vc
            if wasSuspended {
                // Already off screen, so there's nothing for UIKit to dismiss.
                vc.onExit = nil
                #if os(iOS)
                vc.restoreBrightness()
                #endif
                send(["event": "dismissed"])
            } else if let presenter = top.presentingViewController {
                // Still Watching answers "continue" when it leaves unanswered,
                // which the session being torn down must not hear.
                vc.onStillWatchingContinue = nil
                vc.onStillWatchingStop = nil
                presenter.dismiss(animated: false) { [weak self] in
                    Task { @MainActor in self?.send(["event": "dismissed"]) }
                }
            } else {
                vc.dismiss(animated: false) { [weak self] in
                    Task { @MainActor in self?.send(["event": "dismissed"]) }
                }
            }
        } else {
            send(["event": "dismissed"])
        }
        onPlayerChanged?()
    }

    /// Takes the player off screen while the engine keeps playing, so Flutter
    /// can show the Live TV guide or a dialog over the live picture.
    private func suspend(result: @escaping FlutterResult) {
        guard let vc = playerVC, !isSuspended else {
            result(suspendedFrames?.textureId)
            return
        }
        isSuspended = true
        vc.keepsPlayingWhileHidden = true
        if let textures {
            suspendedFrames = EngineFrameTexture(textures: textures)
        }
        hostLog("suspended, frames \(suspendedFrames == nil ? "unavailable" : "shared")")
        let top = vc.parent ?? vc
        guard let presenter = top.presentingViewController else {
            result(suspendedFrames?.textureId)
            return
        }
        presenter.dismiss(animated: false) { [weak self] in
            Task { @MainActor in result(self?.suspendedFrames?.textureId) }
        }
    }

    private func resumePresentation() {
        guard isSuspended, let vc = playerVC else { return }
        isSuspended = false
        suspendedFrames?.teardown()
        suspendedFrames = nil
        vc.keepsPlayingWhileHidden = false
        guard let presenter = presentingController() else { return }
        #if os(iOS)
        let presented: UIViewController = IosNativePlayerHostController(content: vc)
        #else
        let presented: UIViewController = vc
        #endif
        presenter.present(presented, animated: false)
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
        send(["event": "engineLog", "line": "[NativeApplePlayerChannel] \(line)"])
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
                },
                audioBridgeLossless: (args["audioBridgeLossless"] as? Bool) ?? false,
                dolbyVisionBaseLayerOnly: (args["dolbyVisionBaseLayerOnly"] as? Bool) ?? false,
                externalSubtitles: AetherPlayerWrapper.externalSubtitleTracks(
                    from: args["externalSubtitles"]),
                subtitleDelay: ((args["subtitleDelayMs"] as? NSNumber)?.doubleValue ?? 0) / 1000,
                secondarySubtitle: AetherPlayerWrapper.secondarySubtitleConfiguration(from: args)))
        player.setForceSubtitlesDisabledOnStart(
            (args["forceSubtitlesDisabledOnStart"] as? Bool) ?? false)
        player.setReplayGainDb((args["normalizationGainDb"] as? NSNumber)?.doubleValue)
        if let volume = (args["volume"] as? NSNumber)?.doubleValue, volume.isFinite {
            player.setUserVolume(Float(min(max(volume, 0), 100) / 100))
        }

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

    /// Reports the seek immediately rather than waiting for the next timer
    /// tick. The engine has not moved its clock yet, so the position is still
    /// the old one; what matters is that it goes out flagged as buffering, so
    /// nothing downstream mistakes it for a settled measurement.
    private func markSeekInFlight() {
        guard let p = player else { return }
        send(statePayload(p, isPlaying: false, isBuffering: true))
    }

    private func statePayload(_ p: AetherPlayerWrapper, isPlaying: Bool, isBuffering: Bool) -> [String: Any] {
        [
            "event": "state",
            "positionMs": Int((p.currentTime * 1000).rounded()),
            "durationMs": Int((p.duration * 1000).rounded()),
            "bufferedMs": Int((p.duration * Double(p.bufferProgress) * 1000).rounded()),
            "isPlaying": isPlaying,
            "isBuffering": isBuffering,
        ]
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

        send(statePayload(p, isPlaying: isPlaying, isBuffering: isBuffering))

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

/// The picture the engine is playing, as a Flutter texture. While the player
/// is suspended this is what keeps the live channel moving in the guide's
/// mini player, from the same stream rather than a second tune.
@MainActor
final class EngineFrameTexture: NSObject, FlutterTexture {
    private let textures: FlutterTextureRegistry
    private(set) var textureId: Int64 = -1
    // Flutter copies frames on its raster thread while the main thread swaps
    // or clears the output.
    private let outputLock = NSLock()
    nonisolated(unsafe) private var lockedOutput: AVPlayerItemVideoOutput?
    nonisolated private var output: AVPlayerItemVideoOutput? {
        get {
            outputLock.lock()
            defer { outputLock.unlock() }
            return lockedOutput
        }
        set {
            outputLock.lock()
            lockedOutput = newValue
            outputLock.unlock()
        }
    }
    private var item: AVPlayerItem?
    private var itemSubscription: AnyCancellable?
    private var displayLink: CADisplayLink?

    /// Nil when the engine has no AVPlayer item, which is the software path.
    init?(textures: FlutterTextureRegistry) {
        guard let engine = AetherPlayerWrapper.sharedEngine(),
            engine.currentAVPlayerItem != nil
        else { return nil }
        self.textures = textures
        super.init()
        textureId = textures.register(self)
        // The engine swaps items in place on an audio switch or a recovery.
        itemSubscription = engine.$currentAVPlayerItem
            .receive(on: DispatchQueue.main)
            .sink { [weak self] item in self?.attach(to: item) }
        let link = CADisplayLink(target: self, selector: #selector(onFrame))
        link.add(to: .main, forMode: .common)
        displayLink = link
    }

    private func attach(to newItem: AVPlayerItem?) {
        guard newItem !== item else { return }
        if let item, let output { item.remove(output) }
        item = newItem
        output = nil
        guard let newItem else { return }
        let output = AVPlayerItemVideoOutput(pixelBufferAttributes: [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
            kCVPixelBufferIOSurfacePropertiesKey as String: [:] as [String: Any],
        ])
        newItem.add(output)
        self.output = output
    }

    @objc private func onFrame() {
        guard let output, let item else { return }
        if output.hasNewPixelBuffer(forItemTime: item.currentTime()) {
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

    func teardown() {
        displayLink?.invalidate()
        displayLink = nil
        itemSubscription = nil
        if let item, let output { item.remove(output) }
        item = nil
        output = nil
        if textureId >= 0 {
            textures.unregisterTexture(textureId)
            textureId = -1
        }
    }
}
