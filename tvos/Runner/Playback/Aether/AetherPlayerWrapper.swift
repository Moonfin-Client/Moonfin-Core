import AVFoundation
import AetherEngine
import Combine
import Foundation
import MediaPlayer
import QuartzCore
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Playback wrapper backed by AetherEngine. Reproduces the polled member
/// surface the previous mpv wrapper exposed, so `AppleTvVideoChannel`
/// (0.25 s state timer) and `AppleTvPlayerViewController` (OSD timer) keep
/// reading the same `@Published` properties.
///
/// Lifecycle: the wrapper is per-presentation (the channel drops it on
/// dismiss). The engine is app-lifetime. `shutdown()` is the only place the
/// display criteria are reset. Plain `stop()` keeps the panel mode so
/// episode to episode playback doesn't bounce through SDR.
@MainActor
final class AetherPlayerWrapper: NSObject, ObservableObject {

    // MARK: - Polled contract (names match the previous wrapper)

    @Published var state: PlayerState = .idle
    @Published var position: Float = 0
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0
    @Published var bufferProgress: Float = 0
    @Published var audioTracks: [PlayerTrack] = []
    @Published var subtitleTracks: [PlayerTrack] = []
    /// Broadcast captions the engine found inside the video, offered
    /// separately from the server-declared subtitle streams. A PlayerTrack id
    /// here is a 1-based position in this list, not a subtitle ordinal.
    @Published var closedCaptionTracks: [PlayerTrack] = []
    @Published var currentAudioTrackIndex: Int32 = -1
    @Published var currentSubtitleTrackIndex: Int32 = -1
    @Published var rate: Float = 1.0
    @Published internal(set) var zoomMode: ZoomMode = .fit

    private(set) var videoView: PlatformView?

    var isPlaying: Bool { state == .playing }

    let nowPlaying = NowPlayingController()

    /// Remote transport commands (Siri Remote, Control Center, AirPods stem)
    /// forwarded to Flutter so PlaybackManager stays the transport authority.
    var onNowPlayingCommand: (([String: Any]) -> Void)?

    /// Structured playback errors for the Dart transcode-fallback machinery.
    /// Payloads: `{"event": "playerError", "kind": ..., "recoverable": ...,
    /// "message": ...}`.
    var onPlayerError: (([String: Any]) -> Void)?

    // MARK: - Engine

    /// One engine for the app's lifetime. It owns the audio-session
    /// declaration, the loopback server, and the display-criteria controller,
    /// so re-creating it per playback would re-handshake all three.
    private static var _sharedEngine: AetherEngine?
    static func sharedEngine() -> AetherEngine? {
        if let engine = _sharedEngine { return engine }
        _sharedEngine = try? AetherEngine()
        return _sharedEngine
    }

    private let playerView = AetherPlayerView()
    let subtitleOverlay = SubtitleOverlay()
    private var cancellables = Set<AnyCancellable>()
    private var surfaceAttachedContinuations: [CheckedContinuation<Void, Never>] = []
    private var audioSessionActive = false
    private var isAudioOnlySession = false
    private var isLiveSession = false
    private var forceSubtitlesDisabledOnStart = false
    private var didEmitLoadError = false
    private var lastErrorMessage: String?
    private var baseSubtitlePosition: Int = 100

    // Track mapping: Dart speaks 1-based per-type ordinals while the engine
    // speaks TrackInfo.id, the FFmpeg stream index (synthetic 100000+ for
    // externals).
    private var audioTable: [TrackInfo] = []
    private var subtitleTable: [TrackInfo] = []
    private var closedCaptionTable: [TrackInfo] = []
    private var externalSubIDsByURL: [String: Int] = [:]

    // ASS rendering (only active when a libass build is linked).
    private let assRenderer = AssRenderer()
    private var assConfiguredForTrackID: Int?
    private var assSeenCueIDs = Set<Int>()

    // ASS render cadence: engine.clock.$sourceTime arrives on the engine's
    // 100 ms AVPlayer time observer, which drives a scrub bar, so rendering on
    // that tick alone leaves animated ASS (\move, \fad, \k) stepping. A
    // display-rate ticker renders and the engine tick only re-anchors it.
    #if canImport(UIKit)
        private var assDisplayLink: CADisplayLink?
    #elseif canImport(AppKit)
        private var assDisplayLink: Timer?
    #endif
    private var lastKnownSourceTime: Double = 0
    private var lastKnownSourceTimeHostTime: CFTimeInterval = 0

    /// On iOS, `audio_service` (Flutter) owns MPRemoteCommandCenter and the
    /// Now Playing card, and the wrapper driving them too would
    /// double-register handlers. Only tvOS drives Now Playing natively.
    private static var drivesNowPlaying: Bool {
        #if os(tvOS)
            return true
        #else
            return false
        #endif
    }

    override init() {
        super.init()
        if Self.drivesNowPlaying {
            wireNowPlaying()
        }
        subscribeToEngine()
        observeForegroundReturn()
    }

    // MARK: - Background teardown recovery

    private var foregroundObserver: NSObjectProtocol?

    /// The engine tears the video pipeline down when the app is suspended
    /// without PiP or background playback keeping it alive, and by its own
    /// contract the host reloads and repauses on foreground return. Without
    /// this the picture comes back black and play does nothing until the
    /// player is reopened. macOS never suspends the app this way, so there is
    /// nothing to observe there.
    private func observeForegroundReturn() {
        #if canImport(UIKit)
            foregroundObserver = NotificationCenter.default.addObserver(
                forName: UIApplication.didBecomeActiveNotification,
                object: nil, queue: .main
            ) { [weak self] _ in
                // Queued as a task so the engine's own activation handler,
                // which registered first, has already run by the time this
                // executes.
                Task { @MainActor in
                    await self?.reloadAfterBackgroundTeardownIfNeeded()
                }
            }
        #endif
    }

    private func stopObservingForegroundReturn() {
        if let observer = foregroundObserver {
            NotificationCenter.default.removeObserver(observer)
            foregroundObserver = nil
        }
    }

    private func reloadAfterBackgroundTeardownIfNeeded() async {
        guard !isAudioOnlySession else { return }
        // The teardown leaves the session paused with no backend, which is
        // the one state an ordinary pause never produces.
        guard state == .paused else { return }
        guard let engine = Self.sharedEngine(),
            engine.playbackBackend == .none
        else { return }
        do {
            try await engine.reloadAtCurrentPosition()
            engine.pause()
        } catch {
            onPlayerError?([
                "event": "playerError",
                "kind": "backgroundReload",
                "recoverable": true,
                "message": "Reload after background return failed: \(error)",
            ])
        }
    }

    // MARK: - Engine subscriptions

    private func subscribeToEngine() {
        guard let engine = Self.sharedEngine() else { return }

        engine.$playbackPhase
            .receive(on: DispatchQueue.main)
            .sink { [weak self] phase in self?.applyPhase(phase) }
            .store(in: &cancellables)

        engine.$duration
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self else { return }
                self.duration = self.isLiveSession ? 0 : value
            }
            .store(in: &cancellables)

        engine.clock.$currentTime
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self else { return }
                self.currentTime = value
                self.position =
                    self.duration > 0 ? Float(value / self.duration) : 0
            }
            .store(in: &cancellables)

        engine.clock.$bufferedPosition
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self else { return }
                self.bufferProgress =
                    self.duration > 0
                    ? Float(min(max(value / self.duration, 0), 1)) : 0
            }
            .store(in: &cancellables)

        // Subtitle cues are rendered against the source clock: cue PTS are
        // raw source timestamps, and `currentTime` holds the seek target
        // while `sourceTime` tracks the rendered frame.
        engine.clock.$sourceTime
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in self?.tickSubtitles(at: value) }
            .store(in: &cancellables)

        engine.$audioTracks
            .receive(on: DispatchQueue.main)
            .sink { [weak self] tracks in self?.rebuildAudioTable(tracks) }
            .store(in: &cancellables)

        engine.$subtitleTracks
            .receive(on: DispatchQueue.main)
            .sink { [weak self] tracks in self?.rebuildSubtitleTable(tracks) }
            .store(in: &cancellables)

        engine.$activeAudioTrackIndex
            .receive(on: DispatchQueue.main)
            .sink { [weak self] id in
                guard let self else { return }
                self.currentAudioTrackIndex = self.ordinal(for: id, in: self.audioTable)
            }
            .store(in: &cancellables)

        engine.$activeSubtitleTrackIndex
            .receive(on: DispatchQueue.main)
            .sink { [weak self] id in
                guard let self else { return }
                self.currentSubtitleTrackIndex = self.ordinal(for: id, in: self.subtitleTable)
                if id == nil { self.resetAssState() }
            }
            .store(in: &cancellables)

        engine.$subtitleCues
            .receive(on: DispatchQueue.main)
            .sink { [weak self] cues in self?.applySubtitleCues(cues) }
            .store(in: &cancellables)

        // Rebind Now Playing on EVERY player republish: the engine swaps
        // AVPlayer instances on internal reloads (audio switch, AirPlay,
        // recovery) and a stale MPNowPlayingSession binding reintroduces the
        // tvOS 26 info-center race.
        engine.$currentAVPlayer
            .receive(on: DispatchQueue.main)
            .sink { [weak self] player in
                guard let self, Self.drivesNowPlaying, !self.isAudioOnlySession else {
                    return
                }
                self.nowPlaying.attach(player: player)
            }
            .store(in: &cancellables)

        engine.liveSourceReset
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.emitError(kind: "live_source_reset", recoverable: true, message: "Live source reset")
            }
            .store(in: &cancellables)
    }

    private func applyPhase(_ phase: PlaybackPhase) {
        switch phase {
        case .idle: state = .idle
        case .loading: state = .opening
        case .playing: state = .playing
        case .paused: state = .paused
        case .seeking, .rebuffering: state = .buffering(bufferProgress)
        case .stalled: state = .buffering(bufferProgress)
        case .ended: state = .ended
        case .error(let message):
            state = .error
            lastErrorMessage = message
            if !didEmitLoadError {
                // Mid-play failures rarely name a codec, so classify at the
                // container level and let the Dart side retry via server transcode.
                emitError(kind: "unsupported_container", recoverable: true, message: message)
            }
        }
        if Self.drivesNowPlaying, isPlaying || state == .paused {
            nowPlaying.updatePlaybackState(
                isPlaying: isPlaying, elapsed: currentTime, duration: duration, rate: rate)
        }
    }

    // MARK: - Now Playing

    private func wireNowPlaying() {
        nowPlaying.onPlay = { [weak self] in
            self?.onNowPlayingCommand?(["event": "play"])
        }
        nowPlaying.onPause = { [weak self] in
            self?.onNowPlayingCommand?(["event": "pause"])
        }
        nowPlaying.onToggle = { [weak self] in
            guard let self else { return }
            self.onNowPlayingCommand?(["event": self.isPlaying ? "pause" : "play"])
        }
        nowPlaying.onSeek = { [weak self] seconds in
            self?.onNowPlayingCommand?([
                "event": "seek",
                "positionMs": Int((seconds * 1000).rounded()),
            ])
        }
        nowPlaying.onSkip = { [weak self] delta in
            guard let self else { return }
            let target = max(0, self.currentTime + delta)
            self.onNowPlayingCommand?([
                "event": "seek",
                "positionMs": Int((target * 1000).rounded()),
            ])
        }
        nowPlaying.onNext = { [weak self] in
            self?.onNowPlayingCommand?(["event": "next"])
        }
        nowPlaying.onPrevious = { [weak self] in
            self?.onNowPlayingCommand?(["event": "previous"])
        }
        nowPlaying.registerCommands()
    }

    /// Populate the system Now Playing card from the UI metadata Flutter
    /// pushes for the on-screen overlay. In audio-only mode the engine's own
    /// audio host owns the Now Playing session, so route through it instead of
    /// creating a competing session.
    func applyNowPlayingMetadata(_ args: [String: Any]) {
        guard Self.drivesNowPlaying else { return }
        let title = (args["topTitle"] as? String) ?? ""
        let subtitle = (args["topSubtitle"] as? String) ?? ""
        let logo = args["logoUrl"] as? String
        // The engine's audio Now Playing bridge is an iOS/tvOS API. This whole
        // method is a no-op off tvOS through drivesNowPlaying, but the call
        // still has to compile out on macOS.
        #if os(iOS) || os(tvOS)
            if isAudioOnlySession, let engine = Self.sharedEngine() {
                var info: [String: Any] = [
                    MPMediaItemPropertyTitle: title,
                    MPMediaItemPropertyArtist: subtitle,
                    MPMediaItemPropertyAlbumTitle: subtitle,
                    MPNowPlayingInfoPropertyMediaType:
                        MPNowPlayingInfoMediaType.audio.rawValue,
                ]
                if duration > 0 {
                    info[MPMediaItemPropertyPlaybackDuration] = duration
                }
                engine.setAudioNowPlayingInfo(info)
                return
            }
        #endif
        nowPlaying.updateMetadata(
            title: title,
            subtitle: subtitle,
            durationSeconds: duration,
            artworkURL: (logo?.isEmpty ?? true) ? nil : logo)
        nowPlaying.setQueueCapabilities(
            hasNext: (args["hasNext"] as? Bool) ?? false,
            hasPrevious: (args["hasPrevious"] as? Bool) ?? false)
        nowPlaying.updatePlaybackState(
            isPlaying: isPlaying, elapsed: currentTime, duration: duration, rate: rate)
    }

    // MARK: - Surface

    func attachVideoView(_ view: PlatformView) {
        videoView = view
        playerView.frame = view.bounds
        subtitleOverlay.frame = view.bounds
        #if canImport(UIKit)
            playerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.insertSubview(playerView, at: 0)
            subtitleOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.insertSubview(subtitleOverlay, aboveSubview: playerView)
        #elseif canImport(AppKit)
            playerView.autoresizingMask = [.width, .height]
            view.addSubview(playerView, positioned: .below, relativeTo: nil)
            subtitleOverlay.autoresizingMask = [.width, .height]
            view.addSubview(subtitleOverlay, positioned: .above, relativeTo: playerView)
        #endif
        subtitleOverlay.videoRectProvider = { [weak self] in
            self?.currentVideoRect() ?? .zero
        }
        Self.sharedEngine()?.bind(view: playerView)
        if view.window != nil {
            resumeSurfaceWaiters()
        }
    }

    /// The video rect AVPlayerLayer measures, letterbox included. Empty before
    /// the first frame and on the software path, which has no equivalent.
    private func currentVideoRect() -> CGRect {
        let root: CALayer? = playerView.layer
        guard let root, let rect = Self.firstPlayerLayer(in: root)?.videoRect,
            !rect.isEmpty
        else { return .zero }
        #if canImport(UIKit)
            return rect
        #else
            // The overlay measures from the top while a layer-backed NSView
            // measures from the bottom, so the box has to be flipped to line up.
            return CGRect(
                x: rect.minX, y: playerView.bounds.height - rect.maxY,
                width: rect.width, height: rect.height)
        #endif
    }

    /// Searched for rather than read off a known sublayer, so moving where the
    /// engine hosts it cannot quietly stop finding it.
    private static func firstPlayerLayer(in layer: CALayer) -> AVPlayerLayer? {
        if let playerLayer = layer as? AVPlayerLayer { return playerLayer }
        for sublayer in layer.sublayers ?? [] {
            if let found = firstPlayerLayer(in: sublayer) { return found }
        }
        return nil
    }

    func notifySurfaceReady() {
        resumeSurfaceWaiters()
    }

    /// Platform-view lifecycle (iOS): the Flutter view is disposed on route
    /// pop while playback may continue (background audio, PiP). Remove the
    /// render subviews but keep the engine binding, the next attach re-hosts
    /// the same playerView. No-op if another view has attached since.
    func detachVideoView(from view: PlatformView) {
        guard videoView === view else { return }
        playerView.removeFromSuperview()
        subtitleOverlay.removeFromSuperview()
        subtitleOverlay.videoRectProvider = nil
        videoView = nil
    }

    /// The engine-bound render view. PiP introspects it for the active
    /// AVPlayerLayer.
    var renderView: PlatformView { playerView }

    private func resumeSurfaceWaiters() {
        for continuation in surfaceAttachedContinuations {
            continuation.resume()
        }
        surfaceAttachedContinuations.removeAll()
    }

    /// Seconds to wait for a hosted render surface before loading anyway.
    private static let surfaceWaitTimeout: Double = 2

    /// Waits for the render view to be in a window so the first frame has
    /// somewhere to land. Bounded, because the surface only signals again on a
    /// fresh attach: a view briefly out of its window with no re-attach coming
    /// would park the load forever on a black screen. Loading without it is
    /// recoverable, since the engine binds the view whenever it turns up.
    private func waitForSurface() async {
        if videoView?.window != nil { return }
        Task { @MainActor [weak self] in
            try? await Task.sleep(
                nanoseconds: UInt64(Self.surfaceWaitTimeout * 1_000_000_000))
            self?.resumeSurfaceWaiters()
        }
        await withCheckedContinuation { continuation in
            if videoView?.window != nil {
                continuation.resume()
            } else {
                surfaceAttachedContinuations.append(continuation)
            }
        }
    }

    // MARK: - Playback

    struct SourceConfiguration {
        var headers: [String: String] = [:]
        var isLive = false
        var autoPlay = true
        var audioStreamIndex: Int32?
        var audioBridgeLossless = false
    }

    private var sourceConfiguration = SourceConfiguration()

    func configureSource(_ configuration: SourceConfiguration) {
        sourceConfiguration = configuration
    }

    func setForceSubtitlesDisabledOnStart(_ force: Bool) {
        forceSubtitlesDisabledOnStart = force
    }

    func play(streamUrl: String, startPosition: TimeInterval = 0, audioOnly: Bool = false) async {
        let url: URL
        if streamUrl.hasPrefix("/") {
            url = URL(fileURLWithPath: streamUrl)
        } else if let parsed = URL(string: streamUrl) {
            url = parsed
        } else {
            emitError(kind: "unsupported_container", recoverable: false, message: "Invalid URL")
            state = .error
            return
        }
        await play(url: url, startPosition: startPosition, audioOnly: audioOnly)
    }

    func play(url: URL, startPosition: TimeInterval = 0, audioOnly: Bool = false) async {
        guard let engine = Self.sharedEngine() else {
            emitError(
                kind: "engine_unavailable", recoverable: false,
                message: "Playback engine unavailable")
            state = .error
            return
        }
        isAudioOnlySession = audioOnly
        isLiveSession = sourceConfiguration.isLive
        didEmitLoadError = false
        resetAssState()
        subtitleOverlay.clear()
        state = .opening

        if !audioOnly {
            await waitForSurface()
        }
        activateAudioSession()

        let isRemotePlaylist = url.path.lowercased().hasSuffix(".m3u8")
        #if canImport(Libass)
            let preserveASS = true
        #else
            let preserveASS = false
        #endif
        let options = LoadOptions(
            httpHeaders: sourceConfiguration.headers,
            matchContentEnabled: displayCriteriaMatchingEnabled(),
            panelIsInHDRMode: panelIsInHDRMode(),
            audioBridgeMode: sourceConfiguration.audioBridgeLossless ? .lossless : .surroundCompat,
            isLive: isLiveSession,
            audioOnly: audioOnly,
            dvrWindowSeconds: isLiveSession && !isRemotePlaylist ? 1800 : nil,
            liveJoinProfile: .fastZap,
            nativeRemoteHLS: isLiveSession && isRemotePlaylist,
            preserveASSMarkup: preserveASS,
            autoplay: sourceConfiguration.autoPlay
        )

        do {
            _ = try await engine.load(
                url: url,
                startPosition: startPosition > 0 ? startPosition : nil,
                options: options,
                audioSourceStreamIndex: sourceConfiguration.audioStreamIndex)
            if forceSubtitlesDisabledOnStart {
                engine.clearSubtitle()
            }
        } catch {
            didEmitLoadError = true
            state = .error
            let (kind, message) = Self.classifyLoadError(error)
            emitError(kind: kind, recoverable: true, message: message)
        }
    }

    static func classifyLoadError(_ error: Error) -> (kind: String, message: String) {
        let message = (error as? LocalizedError)?.errorDescription ?? String(describing: error)
        // A transport failure is not a container the engine cannot read, and
        // labeling it as one sends the host into a transcode retry that meets
        // the same network and fails the same way.
        var cursor: NSError? = error as NSError
        while let current = cursor {
            if current.domain == NSURLErrorDomain {
                return ("network", message)
            }
            cursor = current.userInfo[NSUnderlyingErrorKey] as? NSError
        }
        if let engineError = error as? AetherEngineError {
            switch engineError {
            case .dolbyVisionUnplayableOnSoftwarePath:
                return ("unsupported_video", message)
            case .noAudioStream:
                return ("unsupported_audio", message)
            case .noVideoStream, .hlsPlaylistOnRawLivePath:
                return ("unsupported_container", message)
            }
        }
        let description = String(describing: error)
        if description.contains("unsupportedCodec") || description.contains("unsupportedDVProfile") {
            return ("unsupported_video", message)
        }
        return ("unsupported_container", message)
    }

    private func emitError(kind: String, recoverable: Bool, message: String) {
        onPlayerError?([
            "event": "playerError",
            "kind": kind,
            "recoverable": recoverable,
            "message": message,
        ])
    }

    func pause() {
        Self.sharedEngine()?.pause()
    }

    func resume() {
        Self.sharedEngine()?.play()
    }

    /// Stops playback but keeps the panel's display mode: queue advance and
    /// Dart-initiated stops go through here so back to back DV episodes don't bounce
    /// through SDR.
    func stop() {
        Self.sharedEngine()?.stop(resetDisplayCriteria: false)
        state = .stopped
        subtitleOverlay.clear()
        resetAssState()
    }

    /// Full teardown on dismiss: resets display criteria, releases the view
    /// binding and the audio session. The engine itself stays alive.
    func shutdown() {
        stopObservingForegroundReturn()
        guard let engine = Self.sharedEngine() else { return }
        engine.stop(resetDisplayCriteria: true)
        cancellables.removeAll()
        engine.unbind(view: playerView)
        subtitleOverlay.clear()
        resetAssState()
        nowPlaying.teardown()
        deactivateAudioSession()
        state = .stopped
    }

    func seek(to seconds: TimeInterval) {
        Task { await Self.sharedEngine()?.seek(to: seconds) }
    }

    func seekBy(_ delta: TimeInterval) {
        seek(to: max(0, currentTime + delta))
    }

    func seekToPosition(_ pos: Float) {
        guard duration > 0 else { return }
        seek(to: Double(pos) * duration)
    }

    func setRate(_ newRate: Float) {
        guard let engine = Self.sharedEngine() else { return }
        let clamped = min(max(newRate, 0), engine.maxSupportedRate)
        engine.setRate(clamped)
        rate = clamped == 0 ? rate : clamped
    }

    // MARK: - Volume / ReplayGain

    private var userVolume: Float = 1
    private var replayGainScalar: Float = 1

    /// 0.0 to 1.0. On iOS the Dart side pins this to 1.0 and drives the
    /// system volume instead. It still participates so ReplayGain composes.
    func setUserVolume(_ volume: Float) {
        userVolume = min(max(volume, 0), 1)
        applyVolume()
    }

    /// ReplayGain from the server (`normalizationGainDb`). Negative gains map
    /// exactly and positive gains clamp at unity, since there is no pre-amp
    /// headroom on the AVPlayer path. Pass nil to reset.
    func setReplayGainDb(_ db: Double?) {
        if let db {
            replayGainScalar = Float(min(1.0, pow(10.0, db / 20.0)))
        } else {
            replayGainScalar = 1
        }
        applyVolume()
    }

    private func applyVolume() {
        Self.sharedEngine()?.volume = userVolume * replayGainScalar
    }

    // MARK: - Tracks

    private func rebuildAudioTable(_ tracks: [TrackInfo]) {
        audioTable = tracks
        audioTracks = tracks.enumerated().map { index, info in
            PlayerTrack(
                id: Int32(index + 1),
                name: info.name,
                language: info.language,
                title: info.isAtmos ? "\(info.name) (Atmos)" : nil,
                isDefault: info.isDefault,
                isForced: info.isForced,
                codec: info.codec,
                isExternal: info.isExternal,
                externalFilename: nil)
        }
        if let engine = Self.sharedEngine() {
            currentAudioTrackIndex = ordinal(for: engine.activeAudioTrackIndex, in: audioTable)
        }
    }

    /// True for the in-band CEA-608/708 caption tracks the engine discovers
    /// inside the video. The engine has the same check but doesn't expose it.
    private static func isClosedCaptionCodec(_ codec: String?) -> Bool {
        guard let c = codec?.lowercased() else { return false }
        return c == "eia_608" || c == "eia_708" || c == "cea708" || c == "cea_708"
    }

    private func rebuildSubtitleTable(_ allTracks: [TrackInfo]) {
        // The engine reports broadcast captions in the same list as the
        // demuxed subtitle streams. They have no place in the server's stream
        // list, so they are kept out of the positions that list is matched
        // against and offered separately through closedCaptionTracks.
        let tracks = allTracks.filter { !Self.isClosedCaptionCodec($0.codec) }
        closedCaptionTable = allTracks.filter { Self.isClosedCaptionCodec($0.codec) }
        closedCaptionTracks = closedCaptionTable.enumerated().map { index, info in
            PlayerTrack(
                id: Int32(index + 1),
                name: info.name.isEmpty ? "CC\(index + 1)" : info.name,
                language: info.language,
                codec: info.codec)
        }
        subtitleTable = tracks
        subtitleTracks = tracks.enumerated().map { index, info in
            PlayerTrack(
                id: Int32(index + 1),
                name: info.name,
                language: info.language,
                title: nil,
                isDefault: info.isDefault,
                isForced: info.isForced,
                codec: info.codec,
                isExternal: info.isExternal,
                externalFilename: externalFilename(forTrackID: info.id))
        }
        if let engine = Self.sharedEngine() {
            currentSubtitleTrackIndex = ordinal(
                for: engine.activeSubtitleTrackIndex, in: subtitleTable)
        }
    }

    private func externalFilename(forTrackID id: Int) -> String? {
        externalSubIDsByURL.first { $0.value == id }?.key
    }

    private func ordinal(for trackID: Int?, in table: [TrackInfo]) -> Int32 {
        guard let trackID, let index = table.firstIndex(where: { $0.id == trackID }) else {
            return -1
        }
        return Int32(index + 1)
    }

    func setAudioTrack(_ trackIndex: Int32) {
        let index = Int(trackIndex) - 1
        guard index >= 0, index < audioTable.count else { return }
        Self.sharedEngine()?.selectAudioTrack(index: audioTable[index].id)
    }

    func setSubtitleTrack(_ trackIndex: Int32) {
        selectSubtitleTrack(trackIndex, externalUrl: nil)
    }

    func selectSubtitleTrack(_ trackIndex: Int32, externalUrl: String?) {
        guard let engine = Self.sharedEngine() else { return }
        if trackIndex < 0 {
            disableSubtitles()
            return
        }
        resetAssState()
        if let externalUrl, let id = externalSubIDsByURL[externalUrl] {
            engine.selectSubtitleTrack(index: id)
            return
        }
        if let externalUrl,
            let match = subtitleTable.first(where: { info in
                info.isExternal
                    && externalFilename(forTrackID: info.id)?.hasSuffix(
                        URL(string: externalUrl)?.lastPathComponent ?? externalUrl) == true
            })
        {
            engine.selectSubtitleTrack(index: match.id)
            return
        }
        let index = Int(trackIndex) - 1
        guard index >= 0, index < subtitleTable.count else { return }
        engine.selectSubtitleTrack(index: subtitleTable[index].id)
    }

    /// Turns on one of `closedCaptionTracks` by its 1-based position. Turning
    /// captions back off goes through `disableSubtitles`, the same as any
    /// other subtitle.
    func setClosedCaptionTrack(_ id: Int32) {
        guard let engine = Self.sharedEngine() else { return }
        let index = Int(id) - 1
        guard index >= 0, index < closedCaptionTable.count else { return }
        resetAssState()
        engine.selectSubtitleTrack(index: closedCaptionTable[index].id)
    }

    func disableSubtitles() {
        Self.sharedEngine()?.clearSubtitle()
        subtitleOverlay.clear()
        resetAssState()
    }

    func addSubtitle(url: URL) {
        addSubtitle(url: url, title: nil, language: nil)
    }

    func addSubtitle(url: URL, title: String?, language: String?) {
        guard let engine = Self.sharedEngine() else { return }
        let track = engine.addExternalSubtitleTrack(
            ExternalSubtitleTrack(url: url, name: title, language: language))
        externalSubIDsByURL[url.absoluteString] = track.id
    }

    // MARK: - Subtitles (cues, ASS, style)

    private func applySubtitleCues(_ cues: [SubtitleCue]) {
        guard let engine = Self.sharedEngine() else { return }
        let activeTrack = subtitleTable.first { $0.id == engine.activeSubtitleTrackIndex }

        #if canImport(Libass)
            if let track = activeTrack, track.assHeader != nil {
                configureAssIfNeeded(for: track, engine: engine)
                for cue in cues where !assSeenCueIDs.contains(cue.id) {
                    assSeenCueIDs.insert(cue.id)
                    if let line = cue.text {
                        assRenderer.processEvent(
                            line,
                            startMs: Int64((cue.startTime * 1000).rounded()),
                            durationMs: Int64(
                                (max(0, cue.endTime - cue.startTime) * 1000).rounded()))
                    }
                }
                return
            }
        #endif

        let events = cues.map { cue -> SubtitleEvent in
            switch cue.body {
            case .text(let text):
                return SubtitleEvent(
                    startTime: cue.startTime, endTime: cue.endTime,
                    text: plainTextFromAssMarkup(text),
                    bitmap: nil, bitmapWidth: 0, bitmapHeight: 0)
            case .richText(let runs):
                return SubtitleEvent(
                    startTime: cue.startTime, endTime: cue.endTime,
                    text: plainTextFromAssMarkup(runs.map(\.text).joined()),
                    bitmap: nil, bitmapWidth: 0, bitmapHeight: 0)
            case .image(let image):
                return SubtitleEvent(
                    startTime: cue.startTime, endTime: cue.endTime, text: nil,
                    bitmap: image.cgImage,
                    bitmapWidth: image.cgImage.width, bitmapHeight: image.cgImage.height,
                    normalizedRect: image.position,
                    canvasSize: image.canvasSize == .zero ? nil : image.canvasSize)
            }
        }
        subtitleOverlay.setEvents(events)
    }

    private func tickSubtitles(at sourceTime: Double) {
        subtitleOverlay.update(currentTime: sourceTime)
        #if canImport(Libass)
            lastKnownSourceTime = sourceTime
            lastKnownSourceTimeHostTime = CACurrentMediaTime()
            if assConfiguredForTrackID != nil {
                renderAss(atSeconds: extrapolatedAssSeconds())
            }
        #endif
    }

    #if canImport(Libass)
        /// Extrapolates past the last engine tick using wall-clock elapsed
        /// time, scaled by the rate so a second of wall clock is not taken for
        /// a second of source. Frozen while not playing.
        private func extrapolatedAssSeconds() -> Double {
            let base = lastKnownSourceTime - subtitleOverlay.delaySeconds
            guard isPlaying else { return base }
            let elapsed = CACurrentMediaTime() - lastKnownSourceTimeHostTime
            guard elapsed > 0 else { return base }
            return base + elapsed * Double(rate)
        }
    #endif

    #if canImport(Libass)
        private func configureAssIfNeeded(for track: TrackInfo, engine: AetherEngine) {
            guard assConfiguredForTrackID != track.id else { return }
            let attachments = engine.fontAttachments.map { ($0.filename, $0.data) }
            let fontsDir = SubtitleFontLocator.materializeFontsDirectory(attachments: attachments)
            if assRenderer.configure(
                header: track.assHeader.flatMap { $0.data(using: .utf8) },
                fontsDir: fontsDir
            ) {
                assConfiguredForTrackID = track.id
                startAssDisplayLinkIfNeeded()
            }
        }

        /// Drives libass at display rate. See comment on `assDisplayLink`.
        private func startAssDisplayLinkIfNeeded() {
            guard assDisplayLink == nil else { return }
            #if canImport(UIKit)
                let link = CADisplayLink(
                    target: AssTickProxy(owner: self),
                    selector: #selector(AssTickProxy.tick))
                link.add(to: .main, forMode: .common)
                assDisplayLink = link
            #elseif canImport(AppKit)
                let timer = Timer(timeInterval: 1.0 / 60.0, repeats: true) { [weak self] _ in
                    self?.handleAssDisplayLinkTick()
                }
                RunLoop.main.add(timer, forMode: .common)
                assDisplayLink = timer
            #endif
        }

        private func stopAssDisplayLink() {
            assDisplayLink?.invalidate()
            assDisplayLink = nil
        }

        fileprivate func handleAssDisplayLinkTick() {
            guard assConfiguredForTrackID != nil else { return }
            // Paused, the extrapolation is frozen and the engine tick still
            // draws, seeks included, so there is no gap left to fill.
            guard isPlaying else { return }
            renderAss(atSeconds: extrapolatedAssSeconds())
        }

        private func renderAss(atSeconds seconds: Double) {
            guard let view = videoView else { return }
            #if canImport(UIKit)
                let scale = view.window?.screen.scale ?? 1
            #else
                let scale = view.window?.screen?.backingScaleFactor ?? 1
            #endif
            assRenderer.setFrameSize(
                width: Int32(view.bounds.width * scale),
                height: Int32(view.bounds.height * scale))
            switch assRenderer.render(atTimeMs: Int64((seconds * 1000).rounded())) {
            case .unchanged:
                break
            case .cleared:
                subtitleOverlay.showAssImage(nil)
            case .image(let image):
                subtitleOverlay.showAssImage(image)
            }
        }
    #endif

    private func resetAssState() {
        #if canImport(Libass)
            assRenderer.reset()
            stopAssDisplayLink()
        #endif
        assConfiguredForTrackID = nil
        assSeenCueIDs.removeAll()
        subtitleOverlay.showAssImage(nil)
    }

    func applySubtitleStyle(
        textColor: Int?, backgroundColor: Int?, strokeColor: Int?,
        fontSize: Double?, fontWeight: Int?, verticalOffset: Double?
    ) {
        subtitleOverlay.applyStyle(
            textColor: textColor, backgroundColor: backgroundColor,
            strokeColor: strokeColor, fontSize: fontSize,
            fontWeight: fontWeight, verticalOffset: verticalOffset)
        if let verticalOffset {
            baseSubtitlePosition = 100 - Int((verticalOffset * 60).rounded())
        }
    }

    /// mpv-style sub-pos (40…100). The OSD raise path passes min(base, 70)
    /// while transport controls are visible.
    func setSubtitlePosition(_ pos: Int) {
        subtitleOverlay.setSubtitlePosition(basePosition: pos)
    }

    var baseSubtitlePos: Int { baseSubtitlePosition }

    func setSubtitleDelay(_ interval: TimeInterval) {
        subtitleOverlay.delaySeconds = interval
    }

    /// No audio-delay control exists on the AVFoundation path.
    func setAudioDelay(_ interval: TimeInterval) {}

    // MARK: - Zoom

    func setZoomMode(_ mode: ZoomMode) {
        zoomMode = mode
        guard let engine = Self.sharedEngine() else { return }
        switch mode {
        case .fit: engine.videoGravity = .resizeAspect
        case .autoCrop: engine.videoGravity = .resizeAspectFill
        case .stretch: engine.videoGravity = .resize
        }
    }

    func cycleZoomMode() {
        setZoomMode(zoomMode.next)
    }

    // MARK: - Audio session

    private func activateAudioSession() {
        // macOS has no AVAudioSession, audio routing is system managed.
        #if os(iOS) || os(tvOS)
            guard !audioSessionActive else { return }
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                audioSessionActive = true
            } catch {
                // Non-fatal: the engine's AVPlayer host can still activate.
            }
        #endif
    }

    private func deactivateAudioSession() {
        #if os(iOS) || os(tvOS)
            guard audioSessionActive else { return }
            audioSessionActive = false
            try? AVAudioSession.sharedInstance().setActive(
                false, options: .notifyOthersOnDeactivation)
        #endif
    }

    // MARK: - Display criteria inputs

    private func displayCriteriaMatchingEnabled() -> Bool {
        #if os(tvOS)
            guard
                let windowScene = UIApplication.shared.connectedScenes
                    .compactMap({ $0 as? UIWindowScene }).first,
                let window = windowScene.windows.first(where: { $0.isKeyWindow })
                    ?? windowScene.windows.first
            else { return false }
            return window.avDisplayManager.isDisplayCriteriaMatchingEnabled
        #else
            // Display-criteria matching is a tvOS concept. iOS panels manage
            // EDR themselves.
            return false
        #endif
    }

    private func panelIsInHDRMode() -> Bool {
        #if canImport(UIKit)
            return UIScreen.main.potentialEDRHeadroom > 1.0
                && UIScreen.main.currentEDRHeadroom > 1.0
        #else
            guard let screen = NSScreen.main else { return false }
            return screen.maximumPotentialExtendedDynamicRangeColorComponentValue > 1.0
                && screen.maximumExtendedDynamicRangeColorComponentValue > 1.0
        #endif
    }

    // MARK: - Telemetry

    func dynamicRangeTelemetrySnapshot() -> [String: String] {
        guard let engine = Self.sharedEngine() else { return [:] }
        var snapshot: [String: String] = [
            "engine": "AetherEngine",
            "backend": String(describing: engine.playbackBackend),
            "video_format": String(describing: engine.videoFormat),
            "source_format": String(describing: engine.sourceVideoFormat),
            "is_live": isLiveSession ? "yes" : "no",
        ]
        if let profile = engine.sourceDVProfile {
            snapshot["dv_profile"] = profile == 7 ? "P7 converted to P8.1" : "P\(profile)"
        }
        if let fps = engine.sourceVideoFrameRate {
            snapshot["source_fps"] = String(format: "%.3f", fps)
        }
        if engine.sourceVideoBitrate > 0 {
            snapshot["source_bitrate"] = String(
                format: "%.1f Mbps", Double(engine.sourceVideoBitrate) / 1_000_000)
        }
        if let decoder = engine.activeVideoDecoder {
            snapshot["video_decoder"] = decoder
        }
        if let decoder = engine.activeAudioDecoder {
            snapshot["audio_decoder"] = decoder
        }
        if let telemetry = engine.diagnostics.liveTelemetry {
            let mirror = Mirror(reflecting: telemetry)
            for child in mirror.children {
                guard let label = child.label else { continue }
                snapshot["telemetry_\(label)"] = "\(child.value)"
            }
        }
        if let item = engine.currentAVPlayer?.currentItem,
            let access = item.accessLog()?.events.last
        {
            snapshot["indicated_bitrate"] = String(
                format: "%.1f Mbps", access.indicatedBitrate / 1_000_000)
            snapshot["observed_bitrate"] = String(
                format: "%.1f Mbps", access.observedBitrateStandardDeviation.isNaN
                    ? access.indicatedBitrate / 1_000_000
                    : access.averageVideoBitrate / 1_000_000)
            snapshot["dropped_frames"] = "\(access.numberOfDroppedVideoFrames)"
            snapshot["stalls"] = "\(access.numberOfStalls)"
        }
        if let message = lastErrorMessage {
            snapshot["last_error"] = message
        }
        return snapshot
    }
}

#if canImport(UIKit) && canImport(Libass)
    /// CADisplayLink retains its target, so it gets a proxy instead of the
    /// wrapper. A link outliving its stop would otherwise hold the wrapper
    /// alive and rendering.
    private final class AssTickProxy: NSObject {
        private weak var owner: AetherPlayerWrapper?

        init(owner: AetherPlayerWrapper) {
            self.owner = owner
        }

        @objc func tick() {
            MainActor.assumeIsolated {
                owner?.handleAssDisplayLinkTick()
            }
        }
    }
#endif
