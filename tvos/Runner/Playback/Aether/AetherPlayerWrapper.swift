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
/// surface the previous mpv wrapper exposed, so `NativeApplePlayerChannel`
/// (0.25 s state timer) and `NativeApplePlayerViewController` (OSD timer) keep
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
    /// Where a live stream can be rewound within, on the same clock as
    /// `currentTime`. Nil when it keeps nothing to go back to.
    @Published var seekableLiveRange: ClosedRange<Double>?
    @Published internal(set) var zoomMode: ZoomMode = .fit

    private(set) var videoView: PlatformView?

    var isPlaying: Bool { state == .playing }

    /// True while the primary or secondary subtitle file is loading.
    var isSubtitleLoading: Bool {
        guard let engine = Self._sharedEngine else { return false }
        return engine.isLoadingSubtitles || engine.isLoadingSecondarySubtitles
    }

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

    #if os(iOS)
        /// iOS runs two wrappers over the one engine: the Flutter player's and
        /// the native player's. The one that last started a load owns it, and
        /// only the owner stops it, reloads it or reports its errors, so the
        /// idle wrapper can't act on a session that isn't its own.
        private static weak var engineOwner: AetherPlayerWrapper?
        static var activePlaybackOwner: AetherPlayerWrapper? { engineOwner }
        private var isShutDown = false
        private var ownsEngine: Bool {
            Self.engineOwner == nil || Self.engineOwner === self
        }
    #else
        /// Every other platform has one wrapper at a time.
        private var ownsEngine: Bool { true }
    #endif

    private let playerView = AetherPlayerView()
    let subtitleOverlay = SubtitleOverlay()
    let secondarySubtitleOverlay = SubtitleOverlay()
    private var pendingSecondarySubtitle: SecondarySubtitleSelection?
    // Aether can restore the subtitle selections it captured before an internal
    // reload. Keep the host's latest choices (including Off) as the authority.
    private var secondaryReloadSelection = SubtitleReloadState<SecondarySubtitleSelection>()
    private var primaryReloadSelection = SubtitleReloadState<PrimarySubtitleChoice>()
    private var lastReadyPrimaryActive = false
    private var lastReadySecondaryActive = false
    // Audio switching snapshots the old selection before its async rebuild
    // makes readiness fall. An Off choice can arrive between those steps.
    private var audioSwitchSecondarySnapshotActive: Bool?
    private var audioSwitchPrimarySnapshotActive: Bool?
    private var secondarySubtitlesReady = false
    private(set) var secondaryDelayAdjustment: Double = 0
    private var secondaryFontSize: Double?
    private var secondaryTextColor: Int?
    // During HLS playback, AVPlayer normally displays the external primary subtitles
    // supplied at startup. With dual subtitles enabled, render the primary in our overlay.
    // Keep its track ID so the picker still shows the selection and native playback can
    // restore it.
    private var primarySidecarTrackID: Int?
    private var nativePrimaryBridge: NativePrimarySubtitleBridge?
    private var nativePrimaryBridgeFailure: (item: AVPlayerItem, trackID: Int, hideSecondary: Bool)?
    private var nativeSubtitleItem: AVPlayerItem?
    private var nativeSubtitleSelectionObserver: NSObjectProtocol?
    private var externalPlaybackSubscription: AnyCancellable?
    private var nativeSubtitlePresentationRequired = false
    private var cancellables = Set<AnyCancellable>()
    private var surfaceAttachedContinuations: [CheckedContinuation<Void, Never>] = []
    private var audioSessionActive = false
    private var isAudioOnlySession = false
    #if os(iOS) || os(tvOS)
        private var audioNowPlayingInfo: [String: Any] = [:]
        private var audioArtworkURL: String?
        private var audioArtwork: MPMediaItemArtwork?
        private var pendingAudioMetadata: [String: Any]?
    #endif
    private var isLiveSession = false
    private var forceSubtitlesDisabledOnStart = false
    private var didEmitLoadError = false
    private var didEmitAudioDrop = false
    private var lastPhase: PlaybackPhase = .idle
    private var sawPlaybackThisLoad = false
    private var lastClockAdvanceAt = CACurrentMediaTime()
    private var stallCheckTimer: Timer?

    /// Ties the load watchdog and the load's own continuation to the load
    /// that started them, so neither acts after a newer load has taken over.
    private var loadGeneration: UInt64 = 0
    private static let loadWatchdogNanoseconds: UInt64 = 30_000_000_000

    /// The engine probes a live source for up to 50 MB or 60 s of it, spent at
    /// the wire rate on a tuner, so a channel carrying a stream FFmpeg can
    /// never identify (a DVB data carousel, say) outlives the watchdog above
    /// and fails every time instead of ever starting. These bound the probe to
    /// land well inside it, whichever is reached first.
    ///
    /// Deliberately not tighter. A transport stream declares its video, audio
    /// and teletext in the PMT so those resolve almost at once, but an
    /// over-tight budget drops whatever resolves late rather than failing, and
    /// a channel quietly missing a subtitle track is worse than a slow start.
    private static let liveProbeBytes: Int64 = 8 * 1024 * 1024
    private static let liveProbeMicroseconds: Int64 = 10 * 1_000_000

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
    private var assConfiguredHeader: String?
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

    private static func isAssSubtitleCodec(_ codec: String?) -> Bool {
        guard let value = codec?.lowercased() else { return false }
        return value == "ass" || value == "ssa"
    }

    private func primaryUsesAssTopFallback(_ id: Int?) -> Bool {
        guard let id else { return false }
        let track = subtitleTable.first { $0.id == id }
            ?? closedCaptionTable.first { $0.id == id }
        return track.map { Self.isAssSubtitleCodec($0.codec) } ?? false
    }

    /// Video gets a Now Playing session bound to its AVPlayer. On iOS the
    /// shared centers stay with `audio_service`, but they can't win Now Playing
    /// back once Picture in Picture or another app has taken it.
    private static var drivesNowPlaying: Bool {
        #if os(iOS) || os(tvOS)
            return true
        #else
            return false
        #endif
    }

    override init() {
        super.init()
        secondarySubtitleOverlay.primaryForStacking = subtitleOverlay
        subtitleOverlay.secondaryForStacking = secondarySubtitleOverlay
        #if os(iOS) || os(tvOS)
            // On iOS the handlers only ever land on a session, the video
            // player's or the engine's music one, never the shared center.
            wireNowPlaying()
        #endif
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
        guard ownsEngine, !isAudioOnlySession else { return }
        // The teardown leaves the session paused with no backend, which is
        // the one state an ordinary pause never produces.
        guard state == .paused else { return }
        guard let engine = Self.sharedEngine(),
            engine.playbackBackend == .none
        else { return }
        // The engine's reload restores an older subtitle snapshot after its
        // async load. Re-assert the latest host choice only once that completes.
        let generation = loadGeneration
        secondaryReloadSelection.beginReload(previouslyActive: lastReadySecondaryActive)
        primaryReloadSelection.beginReload(previouslyActive: lastReadyPrimaryActive)
        do {
            try await engine.reloadAtCurrentPosition()
            guard ownsEngine, generation == loadGeneration else { return }
            reapplySecondaryAfterReload(force: true)
            if engine.isSessionReady { reapplyPrimaryAfterReload(force: true) }
            engine.pause()
        } catch {
            // Every recovery downstream re-resolves against the server, which
            // the manager refuses for local media, so a recoverable failure
            // here is dropped and the player spins on.
            onPlayerError?([
                "event": "playerError",
                "kind": "backgroundReload",
                "recoverable": false,
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

        // A stall reports nothing new while the buffer drains under it, so
        // buffering changes re-check it.
        engine.$isBuffering
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in self?.applyStalledState() }
            .store(in: &cancellables)

        // Audio-track reconstruction doesn't go through our load() or the
        // foreground reload method. Track its readiness edge and wait for
        // Aether's stale secondary restoration before replaying the latest
        // host request. A previously-Off selection has no restoration event.
        engine.$isSessionReady
            .receive(on: DispatchQueue.main)
            .sink { [weak self, weak engine] ready in
                guard let self, let engine, self.ownsEngine, self.secondarySubtitlesReady,
                      !self.isAudioOnlySession else { return }
                if !ready {
                    self.secondaryReloadSelection.beginReload(
                        previouslyActive: self.audioSwitchSecondarySnapshotActive
                            ?? self.lastReadySecondaryActive)
                    self.primaryReloadSelection.beginReload(
                        previouslyActive: self.audioSwitchPrimarySnapshotActive
                            ?? self.lastReadyPrimaryActive)
                    self.audioSwitchSecondarySnapshotActive = nil
                    self.audioSwitchPrimarySnapshotActive = nil
                } else {
                    // Aether can restore an old selection before AVPlayer is
                    // ready. The active flags retain that event until readiness.
                    if self.secondaryReloadSelection.shouldReapplyAtReadiness(
                        active: engine.isSecondarySubtitleActive
                    ) {
                        self.reapplySecondaryAfterReload()
                    }
                    if self.primaryReloadSelection.shouldReapplyAtReadiness(
                        active: engine.isSubtitleActive
                    ) {
                        self.reapplyPrimaryAfterReload()
                    }
                }
            }
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
                if value != self.currentTime {
                    self.lastClockAdvanceAt = CACurrentMediaTime()
                }
                self.currentTime = value
                self.position =
                    self.duration > 0 ? Float(value / self.duration) : 0
            }
            .store(in: &cancellables)

        engine.clock.$seekableLiveRange
            .receive(on: DispatchQueue.main)
            .sink { [weak self] range in self?.seekableLiveRange = range }
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

        // Native controls can seek without going through this wrapper. Wait for
        // a landing so rejected or superseded seeks don't erase placement.
        engine.seekEvents
            .receive(on: DispatchQueue.main)
            .sink { [weak self, weak engine] event in
                guard case .landed = event.outcome, let self, let engine else { return }
                self.subtitleOverlay.resetPlacement()
                self.tickSubtitles(at: engine.sourceTime)
                // libass may keep the same image without publishing it again.
                self.subtitleOverlay.rememberPrimaryPlacement()
            }
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

        engine.$isSubtitleActive
            .receive(on: DispatchQueue.main)
            .sink { [weak self, weak engine] active in
                guard let self, let engine else { return }
                if self.ownsEngine,
                   self.primaryReloadSelection.shouldReapplyAfterRestoration(
                       active: active, ready: engine.isSessionReady
                   ) {
                    self.reapplyPrimaryAfterReload()
                }
                if engine.isSessionReady && !self.primaryReloadSelection.needsReapply {
                    self.lastReadyPrimaryActive = engine.isSubtitleActive
                }
            }
            .store(in: &cancellables)

        engine.$activeSubtitleTrackIndex
            .receive(on: DispatchQueue.main)
            .sink { [weak self, weak engine] _ in
                guard let self, let engine else { return }
                // Sidecar decoding publishes nil. Read the current selection,
                // not an older publication queued before a track switch.
                if let id = engine.activeSubtitleTrackIndex,
                   let retained = self.primarySidecarTrackID, id != retained {
                    self.endNativePrimaryBridge(restoreNative: false)
                }
                let id = self.effectivePrimaryTrackID(engine)
                self.currentSubtitleTrackIndex = self.ordinal(for: id, in: self.subtitleTable)
                self.subtitleOverlay.keepsVideoComposited = id != nil
                self.resetAssState()
                self.subtitleOverlay.secondaryUsesTopFallback =
                    self.primaryUsesAssTopFallback(id)
                self.updateNativePrimaryBridge()
            }
            .store(in: &cancellables)

        engine.$subtitleCues
            .combineLatest(engine.$sidecarASSHeader, engine.$isLoadingSubtitles)
            .receive(on: DispatchQueue.main)
            .sink { [weak self, weak engine] _ in
                guard let engine else { return }
                // Read the complete decode result after delivery. Loading also
                // publishes a failure, which has no new cues or ASS header.
                self?.applySubtitleCues(engine.subtitleCues)
            }
            .store(in: &cancellables)

        engine.$secondarySubtitleCues
            .receive(on: DispatchQueue.main)
            .sink { [weak self, weak engine] _ in
                guard let self, let engine else { return }
                // A stale decode completion after Secondary Off must never
                // repaint the overlay while engine reconstruction settles.
                guard self.secondaryReloadSelection.latestChoice?.isEnabled == true else {
                    self.secondarySubtitleOverlay.clear()
                    return
                }
                Self.presentSubtitleEvents(
                    Self.subtitleEvents(from: engine.secondarySubtitleCues),
                    in: self.secondarySubtitleOverlay, at: engine.sourceTime)
            }
            .store(in: &cancellables)

        engine.$isSecondarySubtitleActive
            .receive(on: DispatchQueue.main)
            .sink { [weak self, weak engine] active in
                guard let self, let engine else { return }
                if self.ownsEngine,
                   self.secondaryReloadSelection.shouldReapplyAfterRestoration(
                       active: active, ready: engine.isSessionReady
                   ) {
                    self.reapplySecondaryAfterReload()
                }
                if engine.isSessionReady && !self.secondaryReloadSelection.needsReapply {
                    self.lastReadySecondaryActive = engine.isSecondarySubtitleActive
                }
                self.secondarySubtitleOverlay.keepsVideoComposited =
                    self.secondaryReloadSelection.latestChoice?.isEnabled == true
                        && engine.isSecondarySubtitleActive
            }
            .store(in: &cancellables)

        engine.$currentAVPlayerItem
            .receive(on: DispatchQueue.main)
            .sink { [weak self, weak engine] _ in
                self?.observeNativeSubtitleItem(engine?.currentAVPlayerItem)
            }
            .store(in: &cancellables)

        engine.$videoRoute.combineLatest(engine.$isSessionReady)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in self?.updateNativePrimaryBridge() }
            .store(in: &cancellables)

        // Rebind Now Playing on EVERY player republish: the engine swaps
        // AVPlayer instances on internal reloads (audio switch, AirPlay,
        // recovery) and a stale MPNowPlayingSession binding reintroduces the
        // tvOS 26 info-center race.
        engine.$currentAVPlayer
            .receive(on: DispatchQueue.main)
            .sink { [weak self] player in
                self?.externalPlaybackSubscription = player?
                    .publisher(for: \.isExternalPlaybackActive, options: [.initial, .new])
                    .receive(on: DispatchQueue.main)
                    .sink { [weak self] _ in self?.updateNativePrimaryBridge() }
                // The idle wrapper on iOS would otherwise build a second session
                // on the same AVPlayer and could take Now Playing from the owner.
                guard let self, Self.drivesNowPlaying, !self.isAudioOnlySession,
                    self.ownsEngine
                else {
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

        // When the engine can't deliver the audio it keeps playing without
        // sound instead of failing, so the transcode has to be asked for here.
        engine.$audioDelivery
            .receive(on: DispatchQueue.main)
            .sink { [weak self] delivery in
                guard let self, delivery == .droppedNoPipeline,
                    !self.didEmitLoadError, !self.didEmitAudioDrop
                else { return }
                self.didEmitAudioDrop = true
                self.emitError(
                    kind: "unsupported_audio", recoverable: true,
                    message: "The audio track couldn't be played")
            }
            .store(in: &cancellables)
    }

    private func applyPhase(_ phase: PlaybackPhase) {
        lastPhase = phase
        switch phase {
        case .idle:
            state = .idle
            sawPlaybackThisLoad = false
        case .loading:
            state = .opening
            sawPlaybackThisLoad = false
        case .playing:
            state = .playing
            sawPlaybackThisLoad = true
        case .paused: state = .paused
        case .seeking: state = .buffering(bufferProgress)
        case .rebuffering:
            state = .buffering(bufferProgress)
            sawPlaybackThisLoad = true
        case .stalled: applyStalledState()
        case .ended: state = .ended
        case .error(let message):
            state = .error
            if !didEmitLoadError {
                let info = Self.sharedEngine()?.errorInfo
                let kind = Self.classifySessionError(
                    engineKind: info?.kind.rawValue, underlyingDomain: info?.underlyingDomain)
                emitError(kind: kind, recoverable: true, message: message)
            }
        }
        updateStallCheckTimer()
        if Self.drivesNowPlaying, isPlaying || state == .paused {
            nowPlaying.updatePlaybackState(
                isPlaying: isPlaying, elapsed: currentTime, duration: duration, rate: rate)
        }
    }

    /// A stall means the engine lost its connection to the server, not that
    /// the picture stopped. On the native path AVPlayer keeps playing what it
    /// already has, so the stall only counts as buffering once AVPlayer waits
    /// or the clock stops moving. The software and audio paths report no
    /// buffering of their own, and nothing is playing before the first frame,
    /// so both still treat the stall itself as buffering.
    nonisolated static func stalledState(
        isNativePath: Bool,
        sawPlayback: Bool,
        isSeeking: Bool,
        isPlaying: Bool,
        isPaused: Bool,
        isBuffering: Bool,
        secondsSinceClockAdvanced: Double,
        bufferProgress: Float
    ) -> PlayerState {
        let buffering = PlayerState.buffering(bufferProgress)
        guard isNativePath, sawPlayback, !isSeeking else { return buffering }
        if isPaused { return .paused }
        guard isPlaying else { return buffering }
        let frozen = secondsSinceClockAdvanced >= stalledClockFreezeSeconds
        return isBuffering || frozen ? buffering : .playing
    }

    /// Ten times the native clock's tick, so a moving picture never trips it.
    private nonisolated static let stalledClockFreezeSeconds: Double = 1

    private func applyStalledState() {
        guard case .stalled = lastPhase, let engine = Self.sharedEngine() else { return }
        let next = Self.stalledState(
            isNativePath: engine.playbackBackend == .native,
            sawPlayback: sawPlaybackThisLoad,
            isSeeking: engine.isSeeking || engine.state == .seeking,
            isPlaying: engine.state == .playing,
            isPaused: engine.state == .paused,
            isBuffering: engine.isBuffering,
            secondsSinceClockAdvanced: CACurrentMediaTime() - lastClockAdvanceAt,
            bufferProgress: bufferProgress)
        if next != state { state = next }
    }

    /// A frozen clock publishes nothing, so a native stall re-checks it.
    private func updateStallCheckTimer() {
        guard case .stalled = lastPhase, Self.sharedEngine()?.playbackBackend == .native else {
            stallCheckTimer?.invalidate()
            stallCheckTimer = nil
            return
        }
        guard stallCheckTimer == nil else { return }
        stallCheckTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {
            [weak self] _ in
            Task { @MainActor in self?.applyStalledState() }
        }
    }

    private func resetStallTracking() {
        lastPhase = .idle
        sawPlaybackThisLoad = false
        stallCheckTimer?.invalidate()
        stallCheckTimer = nil
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
                "isForwardSkip": delta > 0,
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
        let title = (args["topTitle"] as? String) ?? ""
        let subtitle = (args["topSubtitle"] as? String) ?? ""
        let logo = args["logoUrl"] as? String
        // The engine's music session only exists on iOS and tvOS.
        #if os(iOS) || os(tvOS)
            nowPlaying.setQueueCapabilities(
                hasNext: (args["hasNext"] as? Bool) ?? false,
                hasPrevious: (args["hasPrevious"] as? Bool) ?? false)
            if isAudioOnlySession {
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
                audioNowPlayingInfo = info
                loadAudioArtwork(logo)
                publishAudioNowPlaying()
                return
            }
            // Flutter sends the first song's info before its play(audioOnly:),
            // so hold it until the music session opens. Info that comes in
            // while a video plays belongs to that video.
            switch state {
            case .idle, .stopped, .ended, .error: pendingAudioMetadata = args
            default: break
            }
        #endif
        guard Self.drivesNowPlaying else { return }
        nowPlaying.updateMetadata(
            title: title,
            subtitle: subtitle,
            durationSeconds: duration,
            artworkURL: (logo?.isEmpty ?? true) ? nil : logo)
        nowPlaying.updatePlaybackState(
            isPlaying: isPlaying, elapsed: currentTime, duration: duration, rate: rate)
    }

    #if os(iOS) || os(tvOS)
        private func publishAudioNowPlaying() {
            var info = audioNowPlayingInfo
            info[MPMediaItemPropertyArtwork] = audioArtwork
            Self.sharedEngine()?.setAudioNowPlayingInfo(info)
        }

        private func loadAudioArtwork(_ logo: String?) {
            let wanted = logo?.isEmpty == false ? logo : nil
            guard wanted != audioArtworkURL else { return }
            audioArtworkURL = wanted
            audioArtwork = nil
            guard let urlString = wanted, let url = URL(string: urlString) else { return }
            Task { [weak self] in
                guard let (data, _) = try? await MoonfinURLSession.shared.data(from: url),
                    let artwork = Self.audioArtwork(from: data),
                    let self, self.audioArtworkURL == urlString
                else { return }
                self.audioArtwork = artwork
                self.publishAudioNowPlaying()
            }
        }

        // The engine's session asks for the bitmap from its own queue, so the
        // image is decoded up front and the artwork built off the main actor.
        nonisolated private static func audioArtwork(from data: Data) -> MPMediaItemArtwork? {
            guard let image = UIImage(data: data)?.preparingForDisplay() else { return nil }
            return MPMediaItemArtwork(boundsSize: image.size) { _ in image }
        }
    #endif

    // MARK: - Surface

    func attachVideoView(_ view: PlatformView) {
        // Hold the outgoing view until the store is done: its deinit calls
        // detachVideoView, which reads videoView, and releasing it inside the
        // assignment would overlap that read with the write (a Swift
        // exclusivity violation, fatal at runtime).
        let previous = videoView
        videoView = view
        withExtendedLifetime(previous) {}
        playerView.frame = view.bounds
        subtitleOverlay.frame = view.bounds
        secondarySubtitleOverlay.frame = view.bounds
        #if canImport(UIKit)
            playerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.insertSubview(playerView, at: 0)
            subtitleOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.insertSubview(subtitleOverlay, aboveSubview: playerView)
            secondarySubtitleOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.insertSubview(secondarySubtitleOverlay, aboveSubview: subtitleOverlay)
        #elseif canImport(AppKit)
            playerView.autoresizingMask = [.width, .height]
            view.addSubview(playerView, positioned: .below, relativeTo: nil)
            subtitleOverlay.autoresizingMask = [.width, .height]
            view.addSubview(subtitleOverlay, positioned: .above, relativeTo: playerView)
            secondarySubtitleOverlay.autoresizingMask = [.width, .height]
            view.addSubview(secondarySubtitleOverlay, positioned: .above, relativeTo: subtitleOverlay)
        #endif
        subtitleOverlay.videoRectProvider = { [weak self] in
            self?.currentVideoRect() ?? .zero
        }
        secondarySubtitleOverlay.videoRectProvider = subtitleOverlay.videoRectProvider
        Self.sharedEngine()?.bind(view: playerView)
        updateNativePrimaryBridge()
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
        updateNativePrimaryBridge()
    }

    /// Platform-view lifecycle (iOS): the Flutter view is disposed on route
    /// pop while playback may continue (background audio, PiP). Remove the
    /// render subviews but keep the engine binding, the next attach re-hosts
    /// the same playerView. No-op if another view has attached since.
    func detachVideoView(from view: PlatformView) {
        guard videoView === view else { return }
        endNativePrimaryBridge(restoreNative: true)
        playerView.removeFromSuperview()
        subtitleOverlay.removeFromSuperview()
        subtitleOverlay.videoRectProvider = nil
        secondarySubtitleOverlay.videoRectProvider = nil
        secondarySubtitleOverlay.removeFromSuperview()
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
        var dolbyVisionBaseLayerOnly = false

        /// Sidecars the host wants listed. They ride the load rather than
        /// arriving after it, because the engine clears its external registry
        /// when a load begins and only re-seats what the load itself declared.
        var externalSubtitles: [ExternalSubtitleTrack] = []
        var subtitleDelay: Double = 0
        var secondarySubtitle = SecondarySubtitleConfiguration()
    }

    struct SecondarySubtitleSelection: Equatable {
        var embeddedTrackId: Int?
        var url: URL?
        var isEnabled: Bool { embeddedTrackId != nil || url != nil }
    }

    struct SecondarySubtitleConfiguration {
        var selection = SecondarySubtitleSelection()
        var delay: Double = 0
        var offset: Double = 0
        var fontSize: Double?
        var textColor: Int?
    }

    static func secondarySubtitleConfiguration(from args: [String: Any]) -> SecondarySubtitleConfiguration {
        let url = (args["secondarySubtitleUrl"] as? String).flatMap {
            $0.hasPrefix("/") ? URL(fileURLWithPath: $0) : URL(string: $0)
        }
        return SecondarySubtitleConfiguration(
            selection: .init(
                embeddedTrackId: (args["secondarySubtitleTrackId"] as? NSNumber)?.intValue,
                url: url),
            delay: ((args["secondarySubtitleDelayMs"] as? NSNumber)?.doubleValue ?? 0) / 1000,
            offset: (args["secondarySubtitleOffset"] as? NSNumber)?.doubleValue ?? 0,
            fontSize: (args["secondarySubtitleFontSize"] as? NSNumber)?.doubleValue,
            textColor: (args["secondarySubtitleTextColor"] as? NSNumber)?.intValue)
    }

    /// Reads the sidecars out of a `setSource` payload. Anything without a
    /// usable url is dropped rather than sent on as a track that can't open.
    nonisolated static func externalSubtitleTracks(from raw: Any?) -> [ExternalSubtitleTrack] {
        guard let entries = raw as? [[String: Any]] else { return [] }
        return entries.compactMap { entry in
            func text(_ key: String) -> String? {
                guard let value = entry[key] as? String, !value.isEmpty else { return nil }
                return value
            }
            guard let urlString = text("url"),
                let url = urlString.hasPrefix("/")
                    ? URL(fileURLWithPath: urlString) : URL(string: urlString)
            else { return nil }
            return ExternalSubtitleTrack(
                url: url,
                name: text("title"),
                language: text("language"),
                isForced: (entry["isForced"] as? Bool) ?? false,
                isDefault: (entry["isDefault"] as? Bool) ?? false,
                formatHint: text("codec"))
        }
    }

    private var sourceConfiguration = SourceConfiguration()

    /// Urls handed to the engine with the load. A later add of the same file
    /// would list it a second time and shift every ordinal after it.
    private var declaredSubtitleURLs: Set<String> = []

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
        #if os(iOS)
            if Self.engineOwner !== self {
                Self.engineOwner?.endNativePrimaryBridge(restoreNative: false)
                // The other wrapper deactivates the shared audio session when
                // it shuts down, so this one can't trust its own flag.
                audioSessionActive = false
                Self.engineOwner = self
            }
        #endif
        endNativePrimaryBridge(restoreNative: false)
        nativePrimaryBridgeFailure = nil
        // A load from a healthy or just ended session goes straight to
        // engine.load, whose internal supersede keeps the AVPlayer instance
        // and current item alive across the seam for PiP and Control Center.
        // The states below have no session worth keeping: a fresh engine, a
        // load that never finished, or a failure. Resetting first is what a
        // stop before play has always done, and skipping it here is what left
        // the first tap of a session spinning while the second tap worked.
        if state == .idle || state == .opening || state == .error {
            engine.stop(resetDisplayCriteria: false)
        }
        isAudioOnlySession = audioOnly
        #if os(iOS) || os(tvOS)
            if audioOnly, let pending = pendingAudioMetadata {
                applyNowPlayingMetadata(pending)
            }
            pendingAudioMetadata = nil
        #endif
        isLiveSession = sourceConfiguration.isLive
        didEmitLoadError = false
        didEmitAudioDrop = false
        resetStallTracking()
        resetAssState()
        subtitleOverlay.clear()
        secondarySubtitleOverlay.clear()
        secondarySubtitlesReady = false
        setSubtitleDelay(sourceConfiguration.subtitleDelay)
        let secondary = sourceConfiguration.secondarySubtitle
        pendingSecondarySubtitle = secondary.selection
        primaryReloadSelection.reset()
        lastReadyPrimaryActive = false
        audioSwitchPrimarySnapshotActive = nil
        secondaryReloadSelection.startSource(secondary.selection)
        lastReadySecondaryActive = false
        audioSwitchSecondarySnapshotActive = nil
        secondarySubtitleOverlay.stackingEnabled = secondary.selection.isEnabled
        setSecondarySubtitleDelay(secondary.delay)
        configureSecondarySubtitleStyle(
            fontSize: secondary.fontSize, verticalOffset: secondary.offset,
            textColor: secondary.textColor)
        externalSubIDsByURL.removeAll()
        declaredSubtitleURLs = Set(
            sourceConfiguration.externalSubtitles.map { $0.url.absoluteString })
        state = .opening
        loadGeneration &+= 1
        let generation = loadGeneration

        if !audioOnly {
            await waitForSurface()
        }
        #if os(iOS)
            // Closing the player while the load waited for its surface would
            // otherwise start playback with nothing on screen to stop it.
            guard !isShutDown else { return }
        #endif
        guard loadGeneration == generation else { return }
        activateAudioSession()

        let isRemotePlaylist = url.path.lowercased().hasSuffix(".m3u8")
        #if canImport(Libass)
            let preserveASS = true
        #else
            let preserveASS = false
        #endif
        let options = LoadOptions(
            httpHeaders: sourceConfiguration.headers,
            dolbyVisionHandling: sourceConfiguration.dolbyVisionBaseLayerOnly
                ? .baseLayerOnly : .automatic,
            preferDualLayerDolbyVision: true,
            matchContentEnabled: displayCriteriaMatchingEnabled(),
            panelIsInHDRMode: panelIsInHDRMode(),
            audioBridgeMode: sourceConfiguration.audioBridgeLossless ? .lossless : .surroundCompat,
            isLive: isLiveSession,
            audioOnly: audioOnly,
            dvrWindowSeconds: isLiveSession && !isRemotePlaylist ? 1800 : nil,
            liveJoinProfile: .fastZap,
            nativeRemoteHLS: isLiveSession && isRemotePlaylist,
            preserveASSMarkup: preserveASS,
            probesize: isLiveSession ? Self.liveProbeBytes : nil,
            maxAnalyzeDuration: isLiveSession ? Self.liveProbeMicroseconds : nil,
            externalSubtitles: sourceConfiguration.externalSubtitles,
            autoplay: sourceConfiguration.autoPlay
        )

        // Nothing else bounds the open. A load wedged on the network keeps
        // the wrapper at opening, which the state poll reports as buffering
        // forever, and the host shows a spinner with no way out.
        let watchdog = Task { [weak self] in
            try? await Task.sleep(nanoseconds: Self.loadWatchdogNanoseconds)
            guard !Task.isCancelled, let self, self.loadGeneration == generation,
                self.state == .opening, self.ownsEngine
            else { return }
            self.didEmitLoadError = true
            self.state = .error
            Self.sharedEngine()?.stop(resetDisplayCriteria: false)
            self.emitError(
                kind: "startup_timeout", recoverable: false,
                message: "The stream did not start in time")
        }
        defer { watchdog.cancel() }

        do {
            _ = try await engine.load(
                url: url,
                startPosition: startPosition > 0 ? startPosition : nil,
                options: options,
                audioSourceStreamIndex: sourceConfiguration.audioStreamIndex)
            // A load that outlived its watchdog or was superseded finished
            // against an engine that has already been stopped or reloaded.
            guard loadGeneration == generation, !didEmitLoadError else { return }
            #if os(iOS) || os(tvOS)
                // The engine opens its music session during the load, so it
                // can only be adopted once the load returns.
                if audioOnly {
                    nowPlaying.adopt(session: engine.audioNowPlayingSession)
                } else {
                    #if os(iOS)
                        // A load into the same AVPlayer keeps its session, which
                        // another app may have taken in the meantime.
                        nowPlaying.reclaim()
                    #endif
                }
                nowPlaying.setIntervalSkipsEnabled(!audioOnly)
            #endif
            seatDeclaredSubtitles(engine)
            if forceSubtitlesDisabledOnStart {
                engine.clearSubtitle()
            }
            secondarySubtitlesReady = true
            applyPendingSecondarySubtitle()
            updateNativePrimaryBridge()
        } catch {
            guard loadGeneration == generation, !didEmitLoadError else { return }
            declaredSubtitleURLs.removeAll()
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
            // Both come from a reload rather than a load, so neither reaches
            // this classifier. They are here because the switch has to be
            // exhaustive.
            case .loadIdentityNotCorrectable, .sessionNotReloadable:
                return ("unsupported_container", message)
            }
        }
        let description = String(describing: error)
        if description.contains("unsupportedCodec") || description.contains("unsupportedDVProfile") {
            return ("unsupported_video", message)
        }
        return ("unsupported_container", message)
    }

    /// Engine error kinds where the connection failed, not the stream.
    private nonisolated static let transportErrorKinds: Set<String> = [
        PlaybackErrorKind.vodSourceFailed.rawValue,
        PlaybackErrorKind.sourceRateLimited.rawValue,
        PlaybackErrorKind.sourceCertificateRejected.rawValue,
        PlaybackErrorKind.liveSourceUnavailable.rawValue,
    ]

    /// A mid-play failure only carries a message, so the engine's `errorInfo`
    /// is the only way to tell a dropped connection from a stream it can't
    /// play. Only the second is worth a server transcode.
    nonisolated static func classifySessionError(
        engineKind: String?, underlyingDomain: String?
    ) -> String {
        if underlyingDomain == NSURLErrorDomain { return "network" }
        if let engineKind, transportErrorKinds.contains(engineKind) { return "network" }
        return "unsupported_container"
    }

    private func emitError(kind: String, recoverable: Bool, message: String) {
        guard ownsEngine else { return }
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
        loadGeneration &+= 1
        resetSecondarySubtitle()
        #if os(iOS)
            // A stop from a wrapper that was shut down, or that another one has
            // taken the engine from, would land on whatever plays next.
            if ownsEngine && !isShutDown {
                Self.sharedEngine()?.stop(resetDisplayCriteria: false)
            }
        #else
            Self.sharedEngine()?.stop(resetDisplayCriteria: false)
        #endif
        resetStallTracking()
        state = .stopped
        subtitleOverlay.clear()
        resetAssState()
    }

    /// Full teardown on dismiss: resets display criteria, releases the view
    /// binding and the audio session. The engine itself stays alive.
    func shutdown() {
        loadGeneration &+= 1
        resetSecondarySubtitle()
        stopObservingForegroundReturn()
        guard let engine = Self.sharedEngine() else { return }
        #if os(iOS)
            let owned = ownsEngine
            isShutDown = true
            if Self.engineOwner === self { Self.engineOwner = nil }
            if owned {
                engine.stop(resetDisplayCriteria: true)
            }
        #else
            engine.stop(resetDisplayCriteria: true)
        #endif
        cancellables.removeAll()
        externalPlaybackSubscription = nil
        if let observer = nativeSubtitleSelectionObserver {
            NotificationCenter.default.removeObserver(observer)
            nativeSubtitleSelectionObserver = nil
        }
        nativeSubtitleItem = nil
        resetStallTracking()
        engine.unbind(view: playerView)
        subtitleOverlay.clear()
        resetAssState()
        nowPlaying.teardown()
        #if os(iOS)
            // The audio session is shared with the other wrapper, so only the
            // owner lets it go.
            if owned {
                deactivateAudioSession()
            } else {
                audioSessionActive = false
            }
        #else
            deactivateAudioSession()
        #endif
        state = .stopped
    }

    func seek(to seconds: TimeInterval) {
        Task { await Self.sharedEngine()?.seek(to: seconds) }
    }

    func seekToLiveEdge() {
        Task { await Self.sharedEngine()?.seekToLiveEdge() }
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
                for: effectivePrimaryTrackID(engine), in: subtitleTable)
        }
        applyPendingSecondarySubtitle()
        updateNativePrimaryBridge()
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
        guard index >= 0, index < audioTable.count,
              let engine = Self.sharedEngine() else { return }
        // Capture before Aether schedules the rebuild: a newer Off/B choice
        // can land before the old session actually begins tearing down.
        if engine.isSessionReady, engine.videoRoute != .remoteBypass,
           engine.activeAudioTrackIndex != audioTable[index].id {
            audioSwitchSecondarySnapshotActive = engine.isSecondarySubtitleActive
            audioSwitchPrimarySnapshotActive = engine.isSubtitleActive
        }
        engine.selectAudioTrack(index: audioTable[index].id)
    }

    func setSubtitleTrack(_ trackIndex: Int32) {
        selectSubtitleTrack(trackIndex, externalUrl: nil)
    }

    /// A new primary track must not inherit the previous track's placement.
    /// Ordinary dialogue gaps still keep that placement inside SubtitleOverlay.
    private func selectResolvedSubtitleTrack(_ id: Int, engine: AetherEngine) {
        if effectivePrimaryTrackID(engine) != id {
            subtitleOverlay.clear()
        }
        subtitleOverlay.secondaryUsesTopFallback = primaryUsesAssTopFallback(id)
        endNativePrimaryBridge(restoreNative: false)
        nativePrimaryBridgeFailure = nil
        engine.selectSubtitleTrack(index: id)
        updateNativePrimaryBridge()
    }

    func selectSubtitleTrack(_ trackIndex: Int32, externalUrl: String?) {
        guard let engine = Self.sharedEngine() else { return }
        if trackIndex < 0 {
            disableSubtitles()
            return
        }
        primaryReloadSelection.remember(.text(trackIndex, externalUrl))
        resetAssState()
        if let externalUrl, let id = externalSubIDsByURL[externalUrl] {
            logSubtitleSelection(requested: trackIndex, route: "urlMap", resolvedID: id)
            selectResolvedSubtitleTrack(id, engine: engine)
            return
        }
        if let externalUrl,
            let match = subtitleTable.first(where: { info in
                info.isExternal
                    && externalFilename(forTrackID: info.id)?.hasSuffix(
                        URL(string: externalUrl)?.lastPathComponent ?? externalUrl) == true
            })
        {
            logSubtitleSelection(requested: trackIndex, route: "filename", resolvedID: match.id)
            selectResolvedSubtitleTrack(match.id, engine: engine)
            return
        }
        let index = Int(trackIndex) - 1
        guard index >= 0, index < subtitleTable.count else {
            logSubtitleSelection(requested: trackIndex, route: "ordinal", resolvedID: nil)
            return
        }
        logSubtitleSelection(
            requested: trackIndex, route: "ordinal", resolvedID: subtitleTable[index].id)
        selectResolvedSubtitleTrack(subtitleTable[index].id, engine: engine)
    }

    private func hostLog(_ line: String) {
        EngineLog.emit("[AetherPlayerWrapper] \(line)", category: .engine)
    }

    /// The ordinal route indexes into a table rebuilt from an engine publisher, so a report needs
    /// the id that actually went out next to the list it came from.
    private func logSubtitleSelection(requested: Int32, route: String, resolvedID: Int?) {
        let table = subtitleTable
            .map { "\($0.id)\($0.isExternal ? "x" : "e")" }
            .joined(separator: ",")
        var resolved = "none"
        if let resolvedID {
            let external = subtitleTable.first { $0.id == resolvedID }?.isExternal
            resolved =
                "id=\(resolvedID) external=\(external.map { $0 ? "true" : "false" } ?? "unknown")"
        }
        hostLog(
            "selectSubtitleTrack requested=\(requested) route=\(route) \(resolved) table=[\(table)]")
    }

    /// Turns on one of `closedCaptionTracks` by its 1-based position. Turning
    /// captions back off goes through `disableSubtitles`, the same as any
    /// other subtitle.
    func setClosedCaptionTrack(_ id: Int32) {
        guard let engine = Self.sharedEngine() else { return }
        let index = Int(id) - 1
        guard index >= 0, index < closedCaptionTable.count else { return }
        primaryReloadSelection.remember(.caption(id))
        resetAssState()
        selectResolvedSubtitleTrack(closedCaptionTable[index].id, engine: engine)
    }

    func disableSubtitles() {
        primaryReloadSelection.remember(.off)
        subtitleOverlay.secondaryUsesTopFallback = false
        endNativePrimaryBridge(restoreNative: false)
        nativePrimaryBridgeFailure = nil
        Self.sharedEngine()?.clearSubtitle()
        subtitleOverlay.clear()
        resetAssState()
    }

    /// Learns the ids the engine gave the declared sidecars. Reading them back
    /// beats deriving them, because the id space is the engine's to assign.
    private func seatDeclaredSubtitles(_ engine: AetherEngine) {
        let declared = sourceConfiguration.externalSubtitles
        guard !declared.isEmpty else { return }
        let seated = engine.subtitleTracks.filter { $0.isExternal }
        guard seated.count == declared.count else {
            hostLog(
                "declared subtitles not seated (declared=\(declared.count) "
                    + "seated=\(seated.count))")
            declaredSubtitleURLs.removeAll()
            // With none seated the runtime path is the only way back to a
            // subtitle. A partial listing can't be paired to its urls, and adding
            // everything again would list the seated ones twice.
            if seated.isEmpty {
                for track in declared {
                    addSubtitle(url: track.url, title: track.name, language: track.language)
                }
            }
            return
        }
        for (track, info) in zip(declared, seated) {
            externalSubIDsByURL[track.url.absoluteString] = info.id
        }
    }

    func addSubtitle(url: URL) {
        addSubtitle(url: url, title: nil, language: nil)
    }

    func addSubtitle(url: URL, title: String?, language: String?) {
        guard let engine = Self.sharedEngine() else { return }
        guard !declaredSubtitleURLs.contains(url.absoluteString) else { return }
        let track = engine.addExternalSubtitleTrack(
            ExternalSubtitleTrack(url: url, name: title, language: language))
        externalSubIDsByURL[url.absoluteString] = track.id
        hostLog(
            "addExternalSubtitleTrack id=\(track.id) file=\(url.lastPathComponent) "
                + "tableCount=\(subtitleTable.count)")
    }

    // MARK: - Native HLS primary while dual subtitles are on screen

    private func effectivePrimaryTrackID(_ engine: AetherEngine) -> Int? {
        engine.activeSubtitleTrackIndex ?? primarySidecarTrackID
    }

    /// PiP needs AVPlayer's selected rendition, because the on-screen overlay can't
    /// travel with its video layer. The existing native track remains the source.
    func setNativeSubtitlePresentationRequired(_ required: Bool) {
        nativeSubtitlePresentationRequired = required
        updateNativePrimaryBridge()
    }

    private func observeNativeSubtitleItem(_ item: AVPlayerItem?) {
        guard nativeSubtitleItem !== item else { return }
        endNativePrimaryBridge(restoreNative: false, retainTrackID: true)
        nativePrimaryBridgeFailure = nil
        if let observer = nativeSubtitleSelectionObserver {
            NotificationCenter.default.removeObserver(observer)
        }
        nativeSubtitleItem = item
        nativeSubtitleSelectionObserver = item.map { item in
            NotificationCenter.default.addObserver(
                forName: AVPlayerItem.mediaSelectionDidChangeNotification,
                object: item, queue: .main
            ) { [weak self, weak item] _ in
                Task { @MainActor in
                    guard let self, let item, self.nativeSubtitleItem === item else { return }
                    self.nativeSubtitleSelectionDidChange()
                }
            }
        }
        updateNativePrimaryBridge()
    }

    /// Only declared text sidecars can be injected into the VOD HLS master.
    /// Ordinary file playback, live TV and runtime-added sidecars keep their
    /// existing subtitle path.
    private func declaredPrimarySidecar(_ id: Int) -> ExternalSubtitleTrack? {
        guard let track = subtitleTable.first(where: { $0.id == id && $0.isExternal }),
              ["srt", "subrip", "vtt", "webvtt", "ass", "ssa"].contains(track.codec.lowercased()),
              let rawURL = externalFilename(forTrackID: id),
              declaredSubtitleURLs.contains(rawURL) else { return nil }
        return sourceConfiguration.externalSubtitles.first {
            $0.url.absoluteString == rawURL && $0.sourceStreamIndex == nil
        }
    }

    private func updateNativePrimaryBridge() {
        guard ownsEngine, let engine = Self._sharedEngine else {
            endNativePrimaryBridge(restoreNative: false)
            return
        }
        // Internal reloads temporarily clear the player item and playback route. Keep the
        // primary track ID while Aether restores the subtitle URL.
        guard engine.isSessionReady, engine.videoRoute != .none else {
            endNativePrimaryBridge(restoreNative: false, retainTrackID: true)
            return
        }
        let nativePresentation = nativeSubtitlePresentationRequired || engine.pictureInPictureActive
            || (engine.currentAVPlayer?.isExternalPlaybackActive ?? false)
        guard secondarySubtitlesReady, secondarySubtitleOverlay.stackingEnabled,
              !isLiveSession, !engine.isLive, engine.videoRoute == .remoteBypass,
              videoView != nil, !nativePresentation else {
            endNativePrimaryBridge(restoreNative: true)
            secondarySubtitleOverlay.isHidden = nativePresentation
            return
        }
        guard let id = effectivePrimaryTrackID(engine), let sidecar = declaredPrimarySidecar(id),
              let item = engine.currentAVPlayerItem else {
            endNativePrimaryBridge(restoreNative: true)
            secondarySubtitleOverlay.isHidden = false
            return
        }
        if let failure = nativePrimaryBridgeFailure,
           failure.item === item, failure.trackID == id {
            secondarySubtitleOverlay.isHidden = failure.hideSecondary
            return
        }
        if let bridge = nativePrimaryBridge, bridge.item === item, bridge.trackID == id {
            prepareNativePrimaryBridgeIfDecoded()
            return
        }
        // If proxy injection fell back to the engine's ordinary sidecar route,
        // it already supplies primary geometry and needs no native suppression.
        if primarySidecarTrackID == nil,
           engine.isLoadingSubtitles || !engine.subtitleCues.isEmpty { return }

        endNativePrimaryBridge(restoreNative: false, retainTrackID: true)
        let bridge = NativePrimarySubtitleBridge(
            item: item, trackID: id, sidecar: sidecar, generation: loadGeneration)
        nativePrimaryBridge = bridge
        secondarySubtitleOverlay.isHidden = true
        if primarySidecarTrackID != nil, engine.activeSubtitleTrackIndex == nil {
            // Reloading the same session restores the subtitle URL but not AVPlayer's
            // subtitle selection. Select the track again before decoding it for the
            // overlay.
            engine.selectSubtitleTrack(index: id)
        }
        bridge.groupTask = Task { @MainActor [weak self, weak bridge] in
            let group = try? await item.asset.loadMediaSelectionGroup(for: .legible)
            guard let self, let bridge, self.isCurrentNativePrimaryBridge(bridge),
                  !Task.isCancelled else { return }
            guard let group else {
                // A failed proxy injection keeps the normal engine sidecar path.
                self.nativePrimaryBridgeFailure = (item, id, false)
                self.endNativePrimaryBridge(restoreNative: true)
                self.secondarySubtitleOverlay.isHidden = false
                return
            }
            bridge.group = group
            self.nativeSubtitleSelectionDidChange()
        }
    }

    private func isCurrentNativePrimaryBridge(_ bridge: NativePrimarySubtitleBridge) -> Bool {
        ownsEngine && nativePrimaryBridge === bridge && loadGeneration == bridge.generation
            && Self._sharedEngine?.currentAVPlayerItem === bridge.item
    }

    private func nativeSubtitleSelectionDidChange() {
        guard let bridge = nativePrimaryBridge, isCurrentNativePrimaryBridge(bridge),
              let group = bridge.group, let engine = Self._sharedEngine else {
            updateNativePrimaryBridge()
            return
        }
        let selected = bridge.item.currentMediaSelection.selectedMediaOption(in: group)
        switch bridge.phase {
        case .waitingForSelection:
            // No native option means there is no native caption to replace.
            // A late injected selection will call us again through the observer.
            guard let selected else { return }
            bridge.option = selected
            bridge.phase = .decoding
            primarySidecarTrackID = bridge.trackID
            engine.selectSidecarSubtitle(url: bridge.sidecar.url, httpHeaders: bridge.sidecar.httpHeaders)
        case .waitingForClear:
            guard selected == nil else {
                // A queued engine selection can finish after our clear request.
                // Wait for the observed empty selection before suppressing it.
                bridge.option = selected
                bridge.item.select(nil, in: group)
                return
            }
            activateNativePrimaryBridge(bridge)
        default:
            break
        }
    }

    private func prepareNativePrimaryBridgeIfDecoded() {
        guard let bridge = nativePrimaryBridge, isCurrentNativePrimaryBridge(bridge),
              bridge.phase == .decoding, let engine = Self._sharedEngine,
              !engine.isLoadingSubtitles else { return }
        guard !engine.subtitleCues.isEmpty else {
            // Keep the previously working native primary if the extra decode
            // fails. Don't retry on every state publication or overlap it with
            // a secondary for which we still have no primary geometry.
            nativePrimaryBridgeFailure = (bridge.item, bridge.trackID, true)
            endNativePrimaryBridge(restoreNative: true)
            secondarySubtitleOverlay.isHidden = true
            hostLog("primary sidecar unavailable for dual HLS subtitles, native primary restored")
            return
        }
        guard let group = bridge.group else { return }
        bridge.phase = .waitingForClear
        if let option = bridge.item.currentMediaSelection.selectedMediaOption(in: group) {
            bridge.option = option
            engine.currentAVPlayer?.appliesMediaSelectionCriteriaAutomatically = false
            // Wait for AVPlayer to confirm that subtitles are off before suppressing its
            // subtitle rendering. Suppressing rendering too early can leave the last native
            // subtitle stuck on screen.
            bridge.item.select(nil, in: group)
        } else {
            // No selected option: there is no clear notification to wait for.
            activateNativePrimaryBridge(bridge)
        }
    }

    private func activateNativePrimaryBridge(_ bridge: NativePrimarySubtitleBridge) {
        guard isCurrentNativePrimaryBridge(bridge), let group = bridge.group,
              let engine = Self._sharedEngine else { return }
        let output = AVPlayerItemLegibleOutput()
        output.suppressesPlayerRendering = true
        bridge.item.add(output)
        bridge.output = output
        bridge.phase = .overlay
        // Keep the native subtitle track selected so Aether can use its timing callbacks to
        // align the source clock. Render the overlays from the complete decoded cue lists
        // so delays and paused seeks still work.
        bridge.item.select(bridge.option, in: group)
        resetAssState()
        subtitleOverlay.clear()
        applySubtitleCues(engine.subtitleCues)
        tickSubtitles(at: engine.sourceTime)
        secondarySubtitleOverlay.isHidden = false
    }

    private func endNativePrimaryBridge(restoreNative: Bool, retainTrackID: Bool = false) {
        let id = primarySidecarTrackID
        let bridge = nativePrimaryBridge
        bridge?.groupTask?.cancel()
        nativePrimaryBridge = nil
        if let bridge {
            let ownsItem = ownsEngine && Self._sharedEngine?.currentAVPlayerItem === bridge.item
            // Off and a new primary must also clear AVMediaSelection: the
            // engine's one-shot sidecar has no active registered ID to clear.
            if id != nil, !restoreNative, !retainTrackID, ownsItem,
               let group = bridge.group {
                bridge.item.select(nil, in: group)
            }
            if let output = bridge.output { bridge.item.remove(output) }
            if restoreNative, id != nil, ownsItem,
               let group = bridge.group, let option = bridge.option {
                // Restore the actual item immediately for PiP. The engine call
                // below synchronizes the registered identity asynchronously.
                bridge.item.select(option, in: group)
            }
        }
        if !retainTrackID { primarySidecarTrackID = nil }
        if id != nil || bridge != nil {
            subtitleOverlay.clear()
            resetAssState()
        }
        if restoreNative, ownsEngine, let id, let engine = Self._sharedEngine,
           engine.subtitleTracks.contains(where: { $0.id == id }) {
            engine.selectSubtitleTrack(index: id)
        }
    }

    // MARK: - Secondary subtitles

    func setSecondarySubtitle(embeddedTrackId: Int?, url: URL?) {
        nativePrimaryBridgeFailure = nil
        let selection = SecondarySubtitleSelection(embeddedTrackId: embeddedTrackId, url: url)
        secondaryReloadSelection.remember(selection)
        stageSecondarySelection(selection)
    }

    private func stageSecondarySelection(_ selection: SecondarySubtitleSelection) {
        Self.sharedEngine()?.clearSecondarySubtitle()
        secondarySubtitleOverlay.clear()
        secondarySubtitleOverlay.stackingEnabled = selection.isEnabled
        pendingSecondarySubtitle = selection
        applyPendingSecondarySubtitle()
        updateNativePrimaryBridge()
    }

    /// Reapply after an internal rebuild instead of accepting Aether's older
    /// selection snapshot. Consumes the replay before touching the engine, so
    /// the activity publications from our own selection can't retrigger it.
    private func reapplySecondaryAfterReload(force: Bool = false) {
        guard ownsEngine, secondarySubtitlesReady,
              let choice = secondaryReloadSelection.takeLatest(force: force)
        else { return }
        stageSecondarySelection(choice)
    }

    /// Aether's own primary restore runs after its async rebuild. Reapply the
    /// latest explicit host choice rather than an earlier source snapshot.
    private func reapplyPrimaryAfterReload(force: Bool = false) {
        guard ownsEngine, secondarySubtitlesReady, let engine = Self._sharedEngine,
              engine.isSessionReady,
              let choice = primaryReloadSelection.takeLatest(force: force)
        else { return }
        switch choice {
        case .off:
            disableSubtitles()
        case .text(let index, let url):
            selectSubtitleTrack(index, externalUrl: url)
        case .caption(let id):
            setClosedCaptionTrack(id)
        }
    }

    private func applyPendingSecondarySubtitle() {
        guard secondarySubtitlesReady, let pending = pendingSecondarySubtitle,
            let engine = Self.sharedEngine()
        else { return }
        // A track switch made while rebuilding must wait for the new source,
        // not resolve against the outgoing file's subtitle table.
        if secondaryReloadSelection.needsReapply && !engine.isSessionReady { return }

        // The server's embedded ordinal is 1-based and excludes external
        // subtitles and broadcast captions. A missing ordinal may still arrive
        // from the demuxer, so only fall back to a supplied sidecar once ready.
        let tracks = engine.subtitleTracks.filter {
            !$0.isExternal && !Self.isClosedCaptionCodec($0.codec)
        }
        if let ordinal = pending.embeddedTrackId, ordinal > 0 {
            if ordinal <= tracks.count {
                let track = tracks[ordinal - 1]
                engine.selectSecondarySubtitleTrack(index: track.id)
                hostLog("secondary subtitle ordinal=\(ordinal) stream=\(track.id)")
            } else if let url = pending.url {
                engine.selectSecondarySidecarSubtitle(url: url)
                hostLog("secondary subtitle ordinal=\(ordinal) unavailable, using sidecar")
            } else {
                return
            }
        } else if let url = pending.url {
            engine.selectSecondarySidecarSubtitle(url: url)
            hostLog("secondary subtitle sidecar selected")
        } else {
            engine.clearSecondarySubtitle()
        }
        pendingSecondarySubtitle = nil
    }

    private func resetSecondarySubtitle() {
        endNativePrimaryBridge(restoreNative: false)
        nativePrimaryBridgeFailure = nil
        secondarySubtitlesReady = false
        pendingSecondarySubtitle = nil
        secondaryReloadSelection.reset()
        primaryReloadSelection.reset()
        lastReadyPrimaryActive = false
        lastReadySecondaryActive = false
        audioSwitchSecondarySnapshotActive = nil
        audioSwitchPrimarySnapshotActive = nil
        secondarySubtitleOverlay.clear()
        secondarySubtitleOverlay.stackingEnabled = false
        secondarySubtitleOverlay.keepsVideoComposited = false
        secondarySubtitleOverlay.isHidden = false
    }

    func setSecondarySubtitleDelay(_ seconds: Double) {
        secondaryDelayAdjustment = min(max(seconds, -5), 5)
        secondarySubtitleOverlay.delaySeconds = subtitleOverlay.delaySeconds + secondaryDelayAdjustment
        secondarySubtitleOverlay.update(currentTime: Self._sharedEngine?.sourceTime ?? 0)
    }

    func configureSecondarySubtitleStyle(
        fontSize: Double?, verticalOffset: Double?, textColor: Int?
    ) {
        if let verticalOffset {
            secondarySubtitleOverlay.secondaryVerticalAdjustment = verticalOffset
        }
        secondaryFontSize = fontSize
        secondaryTextColor = textColor
        secondarySubtitleOverlay.applySecondaryStyle(
            from: subtitleOverlay, fontSize: fontSize, textColor: textColor)
    }

    // MARK: - Subtitles (cues, ASS, style)

    private func applySubtitleCues(_ cues: [SubtitleCue]) {
        guard let engine = Self.sharedEngine() else { return }
        if let bridge = nativePrimaryBridge, bridge.phase != .overlay {
            if !cues.isEmpty, engine.activeSubtitleTrackIndex != nil,
               bridge.phase == .waitingForSelection {
                // The bypass proxy can decline injection and leave the registered
                // track on Aether's usual overlay path. Keep those complete cues.
                endNativePrimaryBridge(restoreNative: false)
                secondarySubtitleOverlay.isHidden = false
            } else {
                prepareNativePrimaryBridgeIfDecoded()
                return
            }
        }
        let activeTrack = subtitleTable.first { $0.id == effectivePrimaryTrackID(engine) }
        subtitleOverlay.secondaryUsesTopFallback =
            activeTrack.map { Self.isAssSubtitleCodec($0.codec) } ?? false

        #if canImport(Libass)
            if let track = activeTrack,
                let header = track.isExternal ? engine.sidecarASSHeader : track.assHeader,
                configureAssIfNeeded(for: track, header: header, engine: engine)
            {
                subtitleOverlay.setEvents([])
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
                // A sidecar can finish decoding while paused, with no display tick.
                renderAss(atSeconds: engine.sourceTime - subtitleOverlay.delaySeconds)
                return
            }
        #endif

        resetAssState()
        Self.presentSubtitleEvents(
            Self.subtitleEvents(from: cues), in: subtitleOverlay, at: engine.sourceTime)
    }

    /// Shared by both engine cue publishers: a paused player sends no further clock tick.
    static func presentSubtitleEvents(
        _ events: [SubtitleEvent], in overlay: SubtitleOverlay, at sourceTime: Double
    ) {
        overlay.setEvents(events)
        overlay.update(currentTime: sourceTime)
    }

    private static func subtitleEvents(from cues: [SubtitleCue]) -> [SubtitleEvent] {
        cues.map { cue -> SubtitleEvent in
            switch cue.body {
            case .text(let text):
                return SubtitleEvent(
                    startTime: cue.startTime, endTime: cue.endTime,
                    text: plainTextFromAssMarkup(text),
                    bitmap: nil, bitmapWidth: 0, bitmapHeight: 0,
                    alignment: cue.placement?.alignment,
                    position: cue.placement?.position)
            case .richText(let runs):
                let styled = runs.map { run in
                    SubtitleStyledRun(
                        text: plainTextFromAssMarkup(run.text),
                        isBold: run.isBold, isItalic: run.isItalic,
                        isUnderlined: run.isUnderlined,
                        isStruckThrough: run.isStruckThrough)
                }
                return SubtitleEvent(
                    startTime: cue.startTime, endTime: cue.endTime,
                    text: styled.map(\.text).joined(),
                    bitmap: nil, bitmapWidth: 0, bitmapHeight: 0,
                    alignment: cue.placement?.alignment,
                    position: cue.placement?.position,
                    styledRuns: styled)
            case .image(let image):
                return SubtitleEvent(
                    startTime: cue.startTime, endTime: cue.endTime, text: nil,
                    bitmap: image.cgImage,
                    bitmapWidth: image.cgImage.width, bitmapHeight: image.cgImage.height,
                    normalizedRect: image.position,
                    canvasSize: image.canvasSize == .zero ? nil : image.canvasSize)
            }
        }
    }

    private func tickSubtitles(at sourceTime: Double) {
        subtitleOverlay.update(currentTime: sourceTime)
        secondarySubtitleOverlay.update(currentTime: sourceTime)
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
        private func configureAssIfNeeded(
            for track: TrackInfo, header: String, engine: AetherEngine
        ) -> Bool {
            if assConfiguredForTrackID == track.id && assConfiguredHeader == header {
                return true
            }
            resetAssState()
            let attachments = engine.fontAttachments.map { ($0.filename, $0.data) }
            let fontsDir = SubtitleFontLocator.materializeFontsDirectory(attachments: attachments)
            guard assRenderer.configure(
                header: header.data(using: .utf8),
                fontsDir: fontsDir
            ) else { return false }
            assConfiguredForTrackID = track.id
            assConfiguredHeader = header
            startAssDisplayLinkIfNeeded()
            return true
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
            let canvas = subtitleOverlay.assCanvas
            assRenderer.setFrameSize(
                width: Int32(canvas.width * scale),
                height: Int32(canvas.height * scale))
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
        assConfiguredHeader = nil
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
        secondarySubtitleOverlay.applySecondaryStyle(
            from: subtitleOverlay, fontSize: secondaryFontSize, textColor: secondaryTextColor)
        if let verticalOffset {
            baseSubtitlePosition = 100 - Int((verticalOffset * 60).rounded())
        }
    }

    /// mpv-style sub-pos (40…100). The OSD raise path passes min(base, 70)
    /// while transport controls are visible.
    func setSubtitlePosition(_ pos: Int) {
        subtitleOverlay.setSubtitlePosition(basePosition: pos)
        secondarySubtitleOverlay.setSubtitlePosition(basePosition: pos)
    }

    var baseSubtitlePos: Int { baseSubtitlePosition }

    func setSubtitleDelay(_ interval: TimeInterval) {
        subtitleOverlay.delaySeconds = interval
        let sourceTime = Self._sharedEngine?.sourceTime ?? 0
        subtitleOverlay.update(currentTime: sourceTime)
        setSecondarySubtitleDelay(secondaryDelayAdjustment)
        #if canImport(Libass)
        if assConfiguredForTrackID != nil {
            renderAss(atSeconds: sourceTime - interval)
        }
        #endif
    }

    /// No audio-delay control exists on the AVFoundation path.
    func setAudioDelay(_ interval: TimeInterval) {}

    // MARK: - Zoom

    func setZoomMode(_ mode: ZoomMode) {
        zoomMode = mode
        guard let engine = Self.sharedEngine() else { return }
        switch mode {
        case .fit: engine.videoGravity = .resizeAspect
        case .zoomToFill: engine.videoGravity = .resizeAspectFill
        case .stretch: engine.videoGravity = .resize
        }
        subtitleOverlay.refreshVideoGeometry()
        secondarySubtitleOverlay.refreshVideoGeometry()
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

    /// Frames dropped this session on either render path, nil when the engine
    /// can't count them.
    var droppedFrameCount: Int? {
        Self.sharedEngine()?.liveTelemetry?.droppedFrameCount
    }
}

/// Tracks a primary subtitle selection for a specific source and player item. Discarding
/// this state prevents queued callbacks and media-group loads from changing a newer
/// selection.
@MainActor
private final class NativePrimarySubtitleBridge {
    enum Phase { case waitingForSelection, decoding, waitingForClear, overlay }
    let item: AVPlayerItem
    let trackID: Int
    let sidecar: ExternalSubtitleTrack
    let generation: UInt64
    var phase = Phase.waitingForSelection
    var groupTask: Task<Void, Never>?
    var group: AVMediaSelectionGroup?
    var option: AVMediaSelectionOption?
    var output: AVPlayerItemLegibleOutput?

    init(item: AVPlayerItem, trackID: Int, sidecar: ExternalSubtitleTrack, generation: UInt64) {
        self.item = item
        self.trackID = trackID
        self.sidecar = sidecar
        self.generation = generation
    }
}


enum PrimarySubtitleChoice: Equatable {
    case off
    case text(Int32, String?)
    case caption(Int32)
}

/// Host-authoritative subtitle intent through Aether's asynchronous
/// session-preserving reloads.
struct SubtitleReloadState<Choice: Equatable> {
    private(set) var latestChoice: Choice?
    private(set) var needsReapply = false
    private var wasActiveBeforeReload = false

    mutating func remember(_ choice: Choice) { latestChoice = choice }

    mutating func startSource(_ choice: Choice) {
        self = Self()
        latestChoice = choice
    }

    mutating func beginReload(previouslyActive: Bool) {
        guard latestChoice != nil, !needsReapply else { return }
        wasActiveBeforeReload = previouslyActive
        needsReapply = true
    }

    func shouldReapplyAtReadiness(active: Bool) -> Bool {
        needsReapply && (!wasActiveBeforeReload || active)
    }

    func shouldReapplyAfterRestoration(active: Bool, ready: Bool) -> Bool {
        needsReapply && wasActiveBeforeReload && active && ready
    }

    mutating func takeLatest(force: Bool = false) -> Choice? {
        guard force || needsReapply else { return nil }
        needsReapply = false
        return latestChoice
    }

    mutating func reset() { self = Self() }
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
