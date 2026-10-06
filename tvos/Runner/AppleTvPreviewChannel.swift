import AVFoundation
#if canImport(Flutter)
    import Flutter
#elseif canImport(FlutterMacOS)
    import FlutterMacOS
#endif

@MainActor
protocol PreviewBackend: AnyObject {
    var textureId: Int64 { get }
    func open(
        url: String, headers: [String: String], volume: Float, live: Bool,
        startPositionMs: Int, audioLanguage: String?, completion: @escaping (Bool) -> Void)
    func resume()
    func pause()
    func stop()
    func setVolume(_ volume: Float)
    func teardown()
}

@MainActor
final class AppleTvPreviewChannel: NSObject, FlutterStreamHandler {
    private let control: FlutterMethodChannel
    private let events: FlutterEventChannel
    private let textures: FlutterTextureRegistry
    nonisolated(unsafe) private var eventSink: FlutterEventSink?
    private var players: [Int: PreviewBackend] = [:]

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
            let live = (args["live"] as? Bool) ?? false
            let startPositionMs = (args["startPositionMs"] as? NSNumber)?.intValue ?? 0
            let audioLanguage = args["audioLanguage"] as? String
            disposePlayer(playerId)
            let onEvent: ([String: Any]) -> Void = { [weak self] payload in
                self?.send(payload)
            }
            let player: PreviewBackend = PreviewPlayer(
                playerId: playerId, textures: textures, onEvent: onEvent)
            players[playerId] = player
            player.open(
                url: url, headers: headers, volume: volume, live: live,
                startPositionMs: startPositionMs, audioLanguage: audioLanguage
            ) { ok in
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
private final class PreviewPlayer: NSObject, FlutterTexture, PreviewBackend {
    private let playerId: Int
    private let textures: FlutterTextureRegistry
    private let onEvent: ([String: Any]) -> Void
    private(set) var textureId: Int64 = -1

    private var player: AVPlayer?
    private var item: AVPlayerItem?
    nonisolated(unsafe) private var output: AVPlayerItemVideoOutput?
    #if os(macOS)
        private var frameTimer: Timer?
    #else
        private var displayLink: CADisplayLink?
    #endif
    private var statusObservation: NSKeyValueObservation?
    private var timeControlObservation: NSKeyValueObservation?
    private var endObserver: NSObjectProtocol?
    private var stallObserver: NSObjectProtocol?
    private var errorLogObserver: NSObjectProtocol?
    private var openCompletion: ((Bool) -> Void)?
    private var isLive = false
    private var startPositionMs = 0
    private var openedAt: CFTimeInterval = 0
    private var framesShown = 0
    private var endLogged = false

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
        url urlString: String, headers: [String: String], volume: Float, live: Bool,
        startPositionMs: Int, audioLanguage: String?, completion: @escaping (Bool) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(false)
            return
        }
        openCompletion = completion
        isLive = live
        self.startPositionMs = startPositionMs
        openedAt = CACurrentMediaTime()
        let start = String(format: "%.1fs", Double(startPositionMs) / 1000)
        log("opening, start at \(start)\(live ? ", live" : "")")

        var options: [String: Any] = [:]
        if !headers.isEmpty {
            options["AVURLAssetHTTPHeaderFieldsKey"] = headers
        }
        let asset = AVURLAsset(url: url, options: options)
        let item = AVPlayerItem(asset: asset)
        // Previews should start fast, not buffer deep.
        item.preferredForwardBufferDuration = live ? 0 : 5
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
        player.isMuted = volume <= 0
        player.actionAtItemEnd = .pause
        player.preventsDisplaySleepDuringVideoPlayback = false
        if let audioLanguage, !audioLanguage.isEmpty {
            player.setMediaSelectionCriteria(
                AVPlayerMediaSelectionCriteria(
                    preferredLanguages: [audioLanguage], preferredMediaCharacteristics: nil),
                forMediaCharacteristic: .audible)
        }
        self.player = player

        statusObservation = item.observe(\.status, options: [.new]) {
            [weak self] observedItem, _ in
            let status = observedItem.status
            let duration = PreviewPlayer.format(observedItem.duration)
            let error = PreviewPlayer.format(observedItem.error)
            Task { @MainActor in
                guard let self else { return }
                switch status {
                case .readyToPlay:
                    self.log("ready after \(self.elapsed), duration \(duration)")
                    self.seekToStartThenFinishOpen()
                case .failed:
                    self.log("failed after \(self.elapsed): \(error)")
                    self.finishOpen(success: false)
                    self.onEvent(["playerId": self.playerId, "event": "error"])
                default:
                    break
                }
            }
        }

        timeControlObservation = player.observe(\.timeControlStatus, options: [.new]) {
            [weak self] observedPlayer, _ in
            let status = observedPlayer.timeControlStatus
            let reason = observedPlayer.reasonForWaitingToPlay?.rawValue
            let time = PreviewPlayer.format(observedPlayer.currentTime())
            Task { @MainActor in
                guard let self else { return }
                switch status {
                case .playing:
                    self.log("playing at \(time)")
                case .waitingToPlayAtSpecifiedRate:
                    self.log("waiting at \(time), \(reason ?? "no reason given")")
                default:
                    break
                }
            }
        }

        endObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime, object: item, queue: .main
        ) { [weak self] _ in
            Task { @MainActor in
                guard let self, !self.isLive else { return }
                self.log("reached the end")
                self.onEvent(["playerId": self.playerId, "event": "completed"])
            }
        }

        stallObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemPlaybackStalled, object: item, queue: .main
        ) { [weak self] _ in
            Task { @MainActor in
                guard let self else { return }
                self.log("stalled at \(PreviewPlayer.format(self.item?.currentTime() ?? .invalid))")
            }
        }

        // AVPlayer records failed playlist and segment fetches here, often
        // without failing the item.
        errorLogObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemNewErrorLogEntry, object: item, queue: .main
        ) { [weak self] _ in
            Task { @MainActor in
                guard let self, let entry = self.item?.errorLog()?.events.last else { return }
                let parts = [
                    "stream error \(entry.errorStatusCode) \(entry.errorDomain)",
                    entry.errorComment, entry.uri,
                ].compactMap { $0 }
                self.log(parts.joined(separator: ", "))
            }
        }

        startFramePump()
    }

    /// The server refuses a start offset on an HLS segment request, so the offset arrives
    /// here instead. Open finishes only once the seek lands, because the caller resumes as
    /// soon as it returns and would otherwise show a frame from the start of the file.
    private func seekToStartThenFinishOpen() {
        guard startPositionMs > 0, let player else {
            finishOpen(success: true)
            return
        }
        let target = CMTime(value: CMTimeValue(startPositionMs), timescale: 1000)
        let tolerance = CMTime(seconds: 5, preferredTimescale: 1000)
        log("seeking to \(PreviewPlayer.format(target))")
        player.seek(to: target, toleranceBefore: tolerance, toleranceAfter: tolerance) {
            [weak self] finished in
            Task { @MainActor in
                guard let self else { return }
                let landed = PreviewPlayer.format(self.player?.currentTime() ?? .invalid)
                self.log("seek \(finished ? "landed" : "was cut short") at \(landed) after \(self.elapsed)")
                self.finishOpen(success: true)
            }
        }
    }

    private func finishOpen(success: Bool) {
        guard let completion = openCompletion else { return }
        openCompletion = nil
        completion(success)
    }

    /// Polls the output for a new frame at display rate. macOS has no
    /// CADisplayLink initializer that takes a target, so it runs a main runloop
    /// timer at the same interval.
    private func startFramePump() {
        #if os(macOS)
            let timer = Timer(timeInterval: 1.0 / 60.0, repeats: true) { [weak self] _ in
                Task { @MainActor in self?.onFrame() }
            }
            RunLoop.main.add(timer, forMode: .common)
            frameTimer = timer
        #else
            let link = CADisplayLink(target: self, selector: #selector(onFrame))
            link.add(to: .main, forMode: .common)
            displayLink = link
        #endif
    }

    private func stopFramePump() {
        #if os(macOS)
            frameTimer?.invalidate()
            frameTimer = nil
        #else
            displayLink?.invalidate()
            displayLink = nil
        #endif
    }

    @objc private func onFrame() {
        guard let output else { return }
        #if os(macOS)
            // Ask on the same clock copyPixelBuffer fetches on. A display link
            // keeps the item clock close to host time, but a plain timer does
            // not, and the mismatch means a frame is never reported ready.
            let time = output.itemTime(forHostTime: CACurrentMediaTime())
        #else
            guard let item else { return }
            let time = item.currentTime()
        #endif
        if output.hasNewPixelBuffer(forItemTime: time) {
            framesShown += 1
            if framesShown == 1 {
                log("first frame at \(PreviewPlayer.format(time)) after \(elapsed)")
            }
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
        logEnd("stopped")
        player?.pause()
        if !isLive {
            player?.seek(to: .zero)
        }
    }

    func setVolume(_ volume: Float) {
        player?.volume = max(0, min(1, volume / 100.0))
        player?.isMuted = volume <= 0
    }

    func teardown() {
        logEnd("closed")
        finishOpen(success: false)
        stopFramePump()
        statusObservation?.invalidate()
        statusObservation = nil
        timeControlObservation?.invalidate()
        timeControlObservation = nil
        for observer in [endObserver, stallObserver, errorLogObserver].compactMap({ $0 }) {
            NotificationCenter.default.removeObserver(observer)
        }
        endObserver = nil
        stallObserver = nil
        errorLogObserver = nil
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

    /// The app keeps these in its diagnostic log only while logging is on.
    private func log(_ message: String) {
        onEvent(["playerId": playerId, "event": "log", "message": message])
    }

    private var elapsed: String {
        String(format: "%.1fs", CACurrentMediaTime() - openedAt)
    }

    /// No frames means a black preview and a handful means a frozen one.
    private func logEnd(_ how: String) {
        guard !endLogged else { return }
        endLogged = true
        let time = PreviewPlayer.format(player?.currentTime() ?? .invalid)
        log("\(how) at \(time) after \(elapsed), \(framesShown) frames shown")
    }

    nonisolated private static func format(_ time: CMTime) -> String {
        time.isNumeric ? String(format: "%.1fs", time.seconds) : "unknown"
    }

    nonisolated private static func format(_ error: Error?) -> String {
        guard let error else { return "no error given" }
        let nsError = error as NSError
        var text = "\(nsError.domain) \(nsError.code) \(nsError.localizedDescription)"
        if let underlying = nsError.userInfo[NSUnderlyingErrorKey] as? NSError {
            text += ", caused by \(underlying.domain) \(underlying.code)"
        }
        return text
    }
}

