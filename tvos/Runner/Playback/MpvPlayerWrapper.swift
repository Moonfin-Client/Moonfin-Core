import Foundation
import UIKit
import AVFoundation
import MediaPlayer
import Darwin
import os
#if canImport(Metal)
import Metal
#endif
#if canImport(QuartzCore)
import QuartzCore
#endif
#if canImport(MPVKit)
import MPVKit
#endif
#if canImport(Libmpv)
import Libmpv
#endif

enum PlayerState: Equatable {
    case idle
    case opening
    case buffering(Float)
    case playing
    case paused
    case stopped
    case ended
    case error
}

enum ZoomMode: String, StringRepresentableEnum, CaseIterable {
    case fit = "Fit"
    case autoCrop = "Auto Crop"
    case stretch = "Stretch"

    var displayName: String { rawValue }

    var next: ZoomMode {
        let all = ZoomMode.allCases
        let idx = all.firstIndex(of: self)!
        return all[(idx + 1) % all.count]
    }

    var iconName: String {
        switch self {
        case .fit: return "arrow.down.right.and.arrow.up.left"
        case .autoCrop: return "arrow.up.left.and.arrow.down.right"
        case .stretch: return "arrow.left.and.right"
        }
    }
}

struct PlayerTrack: Identifiable, Equatable {
    let id: Int32
    let name: String
    let language: String?
    let title: String?
    let isDefault: Bool
    let isForced: Bool
    let codec: String?

    init(
        id: Int32,
        name: String,
        language: String? = nil,
        title: String? = nil,
        isDefault: Bool = false,
        isForced: Bool = false,
        codec: String? = nil
    ) {
        self.id = id
        self.name = name
        self.language = language
        self.title = title
        self.isDefault = isDefault
        self.isForced = isForced
        self.codec = codec
    }
}

@MainActor
class MpvPlayerWrapper: NSObject, ObservableObject {
    @Published var state: PlayerState = .idle
    @Published var position: Float = 0
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0
    @Published var bufferProgress: Float = 0
    @Published private(set) var isSeekable: Bool = false
    @Published var audioTracks: [PlayerTrack] = []
    @Published var subtitleTracks: [PlayerTrack] = []
    @Published var currentAudioTrackIndex: Int32 = -1
    @Published var currentSubtitleTrackIndex: Int32 = -1
    @Published var rate: Float = 1.0
    @Published internal(set) var zoomMode: ZoomMode = .fit

    private(set) var videoView: UIView?
    private var subtitleOptions: [String: Any] = [:]
    private var audioSessionActive = false
    private var audioUnitChannelLayoutFixInstalled = false

    private(set) var playbackBackendIdentifier: String = "mpv"
    private(set) var playbackFallbackReason: String?

    var isPlaying: Bool { state == .playing }

    /// Registers Moonfin as the system Now Playing app (lock-screen / Control
    /// Center / AirPods stem) and forwards remote transport commands to Flutter.
    let nowPlaying = NowPlayingController()

    /// Set by the platform channel. Remote commands (AirPods stem, Control
    /// Center, Siri Remote) are forwarded to Flutter so PlaybackManager stays
    /// the source of truth for transport and server progress reporting.
    var onNowPlayingCommand: (([String: Any]) -> Void)?

    private let logger = Logger(subsystem: "org.moonfin.appletv", category: "MpvPlayer")
    nonisolated(unsafe) private var lifecycleObservers: [NSObjectProtocol] = []
    private var wasPlayingBeforeBackground = false
    private var wasPlayingBeforeInterruption = false
    private var engine: MPVEngine?
    private let videoSurface = MPVVideoSurface()
    private var activeProfile: MPVRenderProfile = .metal
    private var activeOutputIntent: MPVOutputIntent = .auto
    private var renderUpdatePending = false
    private var renderDisplayLink: CADisplayLink?
    private var preferredRenderFramesPerSecond: Int = 0
    private let fallbackPropertyPollInterval: CFAbsoluteTime = 1.0
    private let playbackPositionPublishInterval: CFAbsoluteTime = 0.25
    private var lastPropertyEventAt: CFAbsoluteTime = 0
    private var lastFallbackPropertyPollAt: CFAbsoluteTime = 0
    private var lastPositionPublishAt: CFAbsoluteTime = 0
    private var mpvSubtitleOptions: [String: Any] = [:]
    private var forceSubtitlesDisabledOnStart = false
    private var pendingMpvStartPosition: TimeInterval?
    private var pendingMpvSeekAttempts = 0
    private var pendingMpvSeekLastAttemptAt: CFAbsoluteTime = 0
    private let maxPendingMpvSeekAttempts = 60
    private let minPendingMpvSeekRetryInterval: CFAbsoluteTime = 0.2
    private var requestedContentRange: VideoDynamicRange = .unknown
    private var sinkIsHdrCapable = false
    private var detectedSinkGeneration: VideoCapabilityDetector.AppleTVGeneration = .unknown
    private var playbackQualityProfilePreference: PlaybackQualityProfile = .auto
    private var activeMpvQualityProfile: MPVPlaybackQualityProfile = .compatibility
    private var activeToneMappingMode = "auto"
    private var lastRenderTimestamp: CFAbsoluteTime = 0
    private var lastWatchdogWarningAt: CFAbsoluteTime = 0
    private var renderStallCount: Int = 0
    private var renderWatchdogTimer: Timer?
    private var activePlaybackURL: String?
    private var lastEngineInitError: String?
    private var intentChangeInProgress = false
    private let intentChangeDebounceInterval: CFAbsoluteTime = 1.0
    private var pendingOutputIntent: MPVOutputIntent?
    private var pendingOutputIntentDetectedAt: CFAbsoluteTime = 0
    private var mpvResumeAwaitingFirstFrame = false
    private var mpvResumeGateWorkItem: DispatchWorkItem?
    private let mpvResumeGateTimeout: TimeInterval = 1.5
    private var mpvColorPipelineRestoreCount = 0
    private var lastWakeColorRestoreAt: CFAbsoluteTime = 0
    private let wakeColorRestoreThrottleInterval: CFAbsoluteTime = 0.25
    private var surfaceAttachedContinuations: [CheckedContinuation<Void, Never>] = []

    private func subtitleDebug(_ message: @autoclosure () -> String) {}

    override init() {
        super.init()
        registerLifecycleObservers()
        wireNowPlaying()
    }

    deinit {
        MainActor.assumeIsolated {
            stopRenderScheduler()
            resetEngine()
            videoSurface.teardown()
            nowPlaying.teardown()
        }
        for observer in lifecycleObservers {
            NotificationCenter.default.removeObserver(observer)
        }
    }

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
        nowPlaying.onNext = { [weak self] in
            self?.onNowPlayingCommand?(["event": "next"])
        }
        nowPlaying.onPrevious = { [weak self] in
            self?.onNowPlayingCommand?(["event": "previous"])
        }
        nowPlaying.registerCommands()
    }

    /// Populate the system Now Playing card from the UI metadata Flutter already
    /// pushes for the on-screen overlay (title / subtitle / artwork).
    func applyNowPlayingMetadata(_ args: [String: Any]) {
        let title = (args["topTitle"] as? String) ?? ""
        let subtitle = (args["topSubtitle"] as? String) ?? ""
        let logo = args["logoUrl"] as? String
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

    func attachVideoView(_ view: UIView) {
        videoView = view
        videoSurface.attach(to: view)
        if view.window != nil {
            for continuation in surfaceAttachedContinuations {
                continuation.resume()
            }
            surfaceAttachedContinuations.removeAll()
        }
    }

    func notifySurfaceReady() {
        videoSurface.updateLayout()
        for continuation in surfaceAttachedContinuations {
            continuation.resume()
        }
        surfaceAttachedContinuations.removeAll()
    }

    private func waitForSurface() async {
        if videoView?.window != nil { return }
        await withCheckedContinuation { continuation in
            if videoView?.window != nil {
                continuation.resume()
            } else {
                surfaceAttachedContinuations.append(continuation)
            }
        }
    }

    func play(url: URL, startPosition: TimeInterval = 0, audioOnly: Bool = false) async {
        if !audioOnly {
            await waitForSurface()
        }
        if !startMpvPlayback(url.absoluteString, startPosition: startPosition > 0 ? startPosition : nil, audioOnly: audioOnly) {
            logger.error("mpv failed to start playback for \(url.lastPathComponent)")
            state = .error
        }
    }

    func configureSubtitleAppearance(_ options: [String: Any]) {
        subtitleOptions = options
        mpvSubtitleOptions = options
        engine?.applySubtitleStyle(options)
    }

    func setForceSubtitlesDisabledOnStart(_ force: Bool) {
        forceSubtitlesDisabledOnStart = force
    }

    func play(streamUrl: String, startPosition: TimeInterval = 0, audioOnly: Bool = false) async {
        if !audioOnly {
            await waitForSurface()
        }
        if !startMpvPlayback(streamUrl, startPosition: startPosition > 0 ? startPosition : nil, audioOnly: audioOnly) {
            logger.error("mpv failed to start playback for stream")
            state = .error
        }
    }

    func configureDynamicRangeIntent(contentRange: VideoDynamicRange, sinkIsHdrCapable: Bool) {
        requestedContentRange = contentRange
        self.sinkIsHdrCapable = sinkIsHdrCapable
        applyDynamicRangeIntent()
    }

    func configureDolbyVisionMetadata(profile _: Int?, level _: Int?, blSignalCompatibilityId _: Int?) {}

    func configurePreferredRenderFramesPerSecond(_ fps: Int?) {
        let normalized = max(0, fps ?? 0)
        preferredRenderFramesPerSecond = normalized
        if let link = renderDisplayLink {
            link.preferredFramesPerSecond = normalized
        }
    }

    func configurePlaybackQualityProfile(_ profile: PlaybackQualityProfile, generation: VideoCapabilityDetector.AppleTVGeneration) {
        playbackQualityProfilePreference = profile
        detectedSinkGeneration = generation
    }

    func dynamicRangeTelemetrySnapshot() -> [String: String] {
        guard let engine else {
            return [
                "mpv_dynamic_range_telemetry": "no_engine",
                "mpv_intent_content_range": requestedContentRange.rawValue,
                "mpv_intent_sink_hdr_capable": sinkIsHdrCapable ? "true" : "false",
                "mpv_intent_tone_mapping": activeToneMappingMode,
                "mpv_color_pipeline_restorations": "\(mpvColorPipelineRestoreCount)"
            ]
        }

        let inputPrimaries = engine.getStringProperty("video-params/primaries") ?? "unknown"
        let inputTransfer = engine.getStringProperty("video-params/gamma") ?? "unknown"
        let outputPrimaries = engine.getStringProperty("video-out-params/primaries") ?? "unknown"
        let outputTransfer = engine.getStringProperty("video-out-params/gamma") ?? "unknown"
        let inputPeak = engine.getDoubleProperty("video-params/sig-peak")
            .map { String(format: "%.2f", $0) } ?? "unknown"
        let maxCLL = engine.getStringProperty("video-params/max-cll") ?? "unknown"
        let maxFALL = engine.getStringProperty("video-params/max-fall") ?? "unknown"
        let hdrType = engine.getStringProperty("video-params/hdr") ?? "unknown"

        let activePrim = engine.getStringProperty("target-prim") ?? "unknown"
        let activeTrc = engine.getStringProperty("target-trc") ?? "unknown"
        let activeTM = engine.getStringProperty("tone-mapping") ?? "unknown"
        let activeGamut = engine.getStringProperty("gamut-mapping-mode") ?? "unknown"
        let activePeak = engine.getStringProperty("target-peak") ?? "unknown"
        let activeHwdec = engine.getStringProperty("hwdec-current") ?? engine.getStringProperty("hwdec") ?? "unknown"
        let frameDropCount = engine.getInt64Property("frame-drop-count").map { String($0) } ?? "unknown"
        let decoderFrameDropCount = engine.getInt64Property("decoder-frame-drop-count").map { String($0) } ?? "unknown"
        let displayFps = engine.getDoubleProperty("display-fps").map { String(format: "%.2f", $0) } ?? "unknown"
        let estimatedVfFps = engine.getDoubleProperty("estimated-vf-fps").map { String(format: "%.2f", $0) } ?? "unknown"
        let vsyncJitter = engine.getDoubleProperty("vsync-jitter").map { String(format: "%.4f", $0) } ?? "unknown"

        var result: [String: String] = [
            "mpv_dynamic_range_telemetry": "available",
            "mpv_intent_content_range": requestedContentRange.rawValue,
            "mpv_intent_sink_hdr_capable": sinkIsHdrCapable ? "true" : "false",
            "mpv_sink_generation": detectedSinkGeneration.rawValue,
            "mpv_quality_profile_preference": playbackQualityProfilePreference.rawValue,
            "mpv_quality_profile_resolved": resolvedMpvQualityProfile().rawValue,
            "mpv_intent_tone_mapping": activeToneMappingMode,
            "mpv_input_primaries": inputPrimaries,
            "mpv_input_transfer": inputTransfer,
            "mpv_input_sig_peak": inputPeak,
            "mpv_output_primaries": outputPrimaries,
            "mpv_output_transfer": outputTransfer,
            "mpv_max_cll": maxCLL,
            "mpv_max_fall": maxFALL,
            "mpv_hdr_type": hdrType,
            "mpv_render_stall_count": "\(renderStallCount)",
            "mpv_active_target_prim": activePrim,
            "mpv_active_target_trc": activeTrc,
            "mpv_active_tone_mapping": activeTM,
            "mpv_active_gamut_mode": activeGamut,
            "mpv_active_target_peak": activePeak,
            "mpv_active_hwdec": activeHwdec,
            "mpv_frame_drop_count": frameDropCount,
            "mpv_decoder_frame_drop_count": decoderFrameDropCount,
            "mpv_display_fps": displayFps,
            "mpv_estimated_vf_fps": estimatedVfFps,
            "mpv_vsync_jitter": vsyncJitter,
            "mpv_color_pipeline_restorations": "\(mpvColorPipelineRestoreCount)"
        ]
        for entry in engine.initDiagnostics {
            result["mpv_init_\(entry.key)"] = entry.value
        }
        return result
    }

    private func resolvedPlaybackQualityProfile() -> PlaybackQualityProfile {
        switch playbackQualityProfilePreference {
        case .auto:
            return PlaybackQualityProfile.recommended(for: detectedSinkGeneration)
        case .compatibility, .highQuality:
            return playbackQualityProfilePreference
        }
    }

    private func resolvedMpvQualityProfile() -> MPVPlaybackQualityProfile {
        switch resolvedPlaybackQualityProfile() {
        case .highQuality:
            return .highQuality
        case .auto, .compatibility:
            return .compatibility
        }
    }

    private var seekInProgress: Bool {
        pendingMpvStartPosition != nil || pendingMpvSeekAttempts > 0
    }

    private func publishPlaybackPosition(_ timePos: TimeInterval, force: Bool = false) {
        let clamped = max(0, timePos)
        let now = CFAbsoluteTimeGetCurrent()

        if !force && !seekInProgress && now - lastPositionPublishAt < playbackPositionPublishInterval {
            return
        }

        currentTime = clamped
        if duration > 0 {
            position = Float(max(0, min(1, currentTime / duration)))
        }
        lastPositionPublishAt = now
        nowPlaying.updatePlaybackState(
            isPlaying: isPlaying, elapsed: currentTime, duration: duration, rate: rate)
    }

    func pause() {
        cancelMpvResumeGate()
        _ = engine?.setPause(true)
        state = .paused
        nowPlaying.updatePlaybackState(
            isPlaying: false, elapsed: currentTime, duration: duration, rate: rate)
    }

    func resume() {
        cancelMpvResumeGate()
        _ = engine?.setPause(false)
        state = .playing
        nowPlaying.updatePlaybackState(
            isPlaying: true, elapsed: currentTime, duration: duration, rate: rate)
    }

    func stop() {
        stopPlaybackOnly()
        audioSessionActive = false
        resetEngine()
        nowPlaying.clear()
    }

    func stopPlaybackOnly() {
        cancelMpvResumeGate()
        _ = engine?.stopPlayback()
        stopRenderScheduler()
        activePlaybackURL = nil
        renderStallCount = 0
        pendingMpvStartPosition = nil
        pendingMpvSeekAttempts = 0
        pendingMpvSeekLastAttemptAt = 0
        pendingOutputIntent = nil
        pendingOutputIntentDetectedAt = 0
        lastPropertyEventAt = 0
        lastFallbackPropertyPollAt = 0
        lastPositionPublishAt = 0
        state = .idle
        position = 0
        currentTime = 0
        duration = 0
        bufferProgress = 0
        audioTracks = []
        subtitleTracks = []
        currentAudioTrackIndex = -1
        currentSubtitleTrackIndex = -1
    }

    func seek(to seconds: TimeInterval) {
        _ = engine?.seekAbsolute(seconds)
        publishPlaybackPosition(seconds, force: true)
    }

    func seekBy(_ delta: TimeInterval) {
        _ = engine?.seekRelative(delta)
    }

    func seekToPosition(_ pos: Float) {
        let target = TimeInterval(max(0, min(1, pos))) * duration
        _ = engine?.seekAbsolute(target)
    }

    func setRate(_ newRate: Float) {
        _ = engine?.setSpeed(newRate)
        rate = newRate
    }

    func setAudioTrack(_ trackIndex: Int32) {
        _ = engine?.setAudioTrack(trackIndex)
        currentAudioTrackIndex = trackIndex
    }

    func setSubtitleTrack(_ trackIndex: Int32) {
        if trackIndex < 0 {
            disableSubtitles()
            return
        }
        subtitleDebug(
            "subtitle_mpv_set track_id=\(trackIndex) current_track_before=\(self.currentSubtitleTrackIndex) tracks=\(self.subtitleTrackDebugSummary(self.subtitleTracks))"
        )
        _ = engine?.setSubtitleTrack(trackIndex)
        _ = engine?.command(["set", "sub-visibility", "yes"])
        currentSubtitleTrackIndex = trackIndex
        subtitleDebug("subtitle_mpv_set_done track_id=\(trackIndex) current_track_after=\(self.currentSubtitleTrackIndex)")
    }

    func disableSubtitles() {
        subtitleDebug("subtitle_mpv_disable current_track_before=\(self.currentSubtitleTrackIndex)")
        _ = engine?.disableSubtitles()
        _ = engine?.command(["set", "sub-visibility", "no"])
        currentSubtitleTrackIndex = -1
        subtitleDebug("subtitle_mpv_disable_done current_track_after=\(self.currentSubtitleTrackIndex)")
    }

    func setSubtitleDelay(_ interval: TimeInterval) {
        _ = engine?.command(["set", "sub-delay", String(interval)])
    }

    func setAudioDelay(_ interval: TimeInterval) {
        _ = engine?.command(["set", "audio-delay", String(interval)])
    }

    func setMuted(_ muted: Bool) {
        _ = engine?.command(["set", "mute", muted ? "yes" : "no"])
    }

    func setProperty(_ name: String, value: String) {
        _ = engine?.command(["set", name, value])
    }

    func addSubtitle(url: URL) {
        subtitleDebug("subtitle_mpv_add url=\(self.redactedURLString(url)) tracks_before=\(self.subtitleTracks.count)")
        _ = engine?.command(["sub-add", url.absoluteString, "auto", "External"])
    }

    func setZoomMode(_ mode: ZoomMode) {
        switch mode {
        case .fit:
            _ = engine?.command(["set", "video-aspect-override", "-1"])
            _ = engine?.command(["set", "panscan", "0"])
        case .autoCrop:
            _ = engine?.command(["set", "video-aspect-override", "-1"])
            _ = engine?.command(["set", "panscan", "1.0"])
        case .stretch:
            _ = engine?.command(["set", "video-aspect-override", "16:9"])
            _ = engine?.command(["set", "panscan", "0"])
        }
        zoomMode = mode
    }

    func cycleZoomMode() {
        setZoomMode(zoomMode.next)
    }

    func updatePlaybackBackend(identifier: String, fallbackReason: String?) {
        playbackBackendIdentifier = identifier
        playbackFallbackReason = fallbackReason
    }

    func configurePreferredBackendForNextPlayback(_ backend: PlaybackBackendDirective, fallbackReason: String?) {
        updatePlaybackBackend(identifier: backend.rawValue, fallbackReason: fallbackReason)
    }

    func configureAudioSession(installChannelLayoutFix: Bool = true) {
        if installChannelLayoutFix && !audioUnitChannelLayoutFixInstalled {
            installAudioUnitChannelLayoutFix()
            audioUnitChannelLayoutFixInstalled = true
        }

        guard !audioSessionActive else { return }
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, mode: .moviePlayback, policy: .longFormAudio)
            try session.setActive(true)
            let maxChannels = session.maximumOutputNumberOfChannels
            if maxChannels > 2 {
                try? session.setPreferredOutputNumberOfChannels(maxChannels)
            }
            audioSessionActive = true
        } catch {}
    }

    private func startMpvPlayback(_ url: String, startPosition: TimeInterval?, audioOnly: Bool = false) -> Bool {
        activePlaybackURL = url
        pendingMpvStartPosition = (startPosition ?? 0) > 0 ? startPosition : nil
        pendingMpvSeekAttempts = 0
        pendingMpvSeekLastAttemptAt = 0

        configureAudioSession(installChannelLayoutFix: true)

        let intent = resolveOutputIntent()
        activeToneMappingMode = intent == .sdr ? "hable" : "auto"

        if audioOnly {
            if ensureEngine(profile: .metal, outputIntent: intent, audioOnly: true) {
                _ = engine?.setPause(false)
                if engine?.loadFile(url) == true {
                    logger.info("mpv: audio-only engine started")
                    updatePlaybackBackend(identifier: "mpv", fallbackReason: nil)
                    state = .opening
                    startRenderScheduler()
                    return true
                }
            }
            resetEngine()
            pendingMpvStartPosition = nil
            pendingMpvSeekAttempts = 0
            pendingMpvSeekLastAttemptAt = 0
            return false
        }

        let canReuseEngine = engine != nil && activeProfile == .metal && activeOutputIntent == intent
        if !canReuseEngine {
            videoSurface.configureColorSpace(forSDR: intent != .hdr)
        }

        if ensureEngine(profile: .metal, outputIntent: intent) {
            _ = engine?.setPause(false)
            if engine?.loadFile(url) == true {
                logger.info("mpv: metal engine started, intent=\(String(describing: intent))")
                engine?.applySubtitleStyle(mpvSubtitleOptions)
                updatePlaybackBackend(identifier: "mpv", fallbackReason: nil)
                applyDynamicRangeIntent()
                state = .opening
                startRenderScheduler()
                return true
            }
            logger.warning("mpv: metal loadFile failed")
        } else {
            let initError = lastEngineInitError ?? "unknown_init_failure"
            logger.warning("mpv: metal engine init failed, lastError=\(initError)")
            let reason = "metal_renderer_unavailable:\(initError)"
            lastEngineInitError = nil
            resetEngine()

            if ensureEngine(profile: .software, outputIntent: intent) {
                _ = engine?.setPause(false)
                if engine?.loadFile(url) == true {
                    logger.warning("mpv: fell to software engine, metalError=\(initError)")
                    engine?.applySubtitleStyle(mpvSubtitleOptions)
                    updatePlaybackBackend(identifier: "mpv", fallbackReason: reason)
                    applyDynamicRangeIntent()
                    state = .opening
                    startRenderScheduler()
                    return true
                }
            }

            resetEngine()
            pendingMpvStartPosition = nil
            pendingMpvSeekAttempts = 0
            pendingMpvSeekLastAttemptAt = 0
            return false
        }
        resetEngine()
        pendingMpvStartPosition = nil
        pendingMpvSeekAttempts = 0
        pendingMpvSeekLastAttemptAt = 0
        return false
    }

    private func applyStartupSubtitlePolicyIfNeeded() {
        guard forceSubtitlesDisabledOnStart else { return }
        forceSubtitlesDisabledOnStart = false
        _ = engine?.disableSubtitles()
        currentSubtitleTrackIndex = -1
    }

    private func applyPendingMpvStartPositionIfNeeded() {
        guard let startPosition = pendingMpvStartPosition, startPosition > 0, let engine else { return }

        if let current = engine.getDoubleProperty("time-pos"), current.isFinite {
            if abs(current - startPosition) <= 1.5 {
                pendingMpvStartPosition = nil
                pendingMpvSeekAttempts = 0
                pendingMpvSeekLastAttemptAt = 0
                return
            }
        }

        guard pendingMpvSeekAttempts < maxPendingMpvSeekAttempts else {
            pendingMpvStartPosition = nil
            pendingMpvSeekAttempts = 0
            pendingMpvSeekLastAttemptAt = 0
            return
        }

        let now = CFAbsoluteTimeGetCurrent()
        guard pendingMpvSeekLastAttemptAt == 0 || (now - pendingMpvSeekLastAttemptAt) >= minPendingMpvSeekRetryInterval else {
            return
        }

        if engine.seekAbsolute(startPosition) {
            pendingMpvSeekAttempts += 1
            pendingMpvSeekLastAttemptAt = now
        }
    }

    private func resolveOutputIntent() -> MPVOutputIntent {
        switch requestedContentRange {
        case .dolbyVision, .hdr10, .hlg, .hdr10Plus:
            return sinkIsHdrCapable ? .hdr : .sdr
        case .sdr, .unknown:
            return .auto
        }
    }

    private func ensureEngine(profile: MPVRenderProfile, outputIntent: MPVOutputIntent = .auto, audioOnly: Bool = false) -> Bool {
        let qualityProfile = resolvedMpvQualityProfile()

        if let engine,
           activeProfile == profile,
           activeOutputIntent == outputIntent,
           activeMpvQualityProfile == qualityProfile {
            return engine.isReady
        }

        resetEngine()

        let created = MPVEngine(
            renderProfile: profile,
            outputIntent: outputIntent,
            qualityProfile: qualityProfile,
            drawableHandle: audioOnly ? nil : videoSurface.drawableHandle,
            updateHandler: { [weak self] in
                DispatchQueue.main.async {
                    self?.renderUpdatePending = true
                }
            }
        )

        guard created.isReady else {
            lastEngineInitError = created.lastInitError
            return false
        }

        engine = created
        lastEngineInitError = nil
        activeProfile = profile
        activeOutputIntent = outputIntent
        activeMpvQualityProfile = qualityProfile
        return true
    }

    private func resetEngine() {
        guard let oldEngine = engine else { return }
        engine = nil
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            oldEngine.shutdown()
            withExtendedLifetime(oldEngine) {}
        }
    }

    private func applyDynamicRangeIntent() {
        guard let engine else { return }

        let intent = resolveOutputIntent()
        switch intent {
        case .sdr:
            activeToneMappingMode = "hable"
            _ = engine.setRuntimeOption("tone-mapping", value: "hable")
            _ = engine.setRuntimeOption("hdr-compute-peak", value: "no")
            _ = engine.setRuntimeOption("target-colorspace-hint", value: "no")
            _ = engine.setRuntimeOption("target-prim", value: "bt.709")
            _ = engine.setRuntimeOption("target-trc", value: "bt.1886")
            _ = engine.setRuntimeOption("gamut-mapping-mode", value: "perceptual")
            _ = engine.setRuntimeOption("target-peak", value: "auto")
            _ = engine.setRuntimeOption("video-output-levels", value: "full")
            _ = engine.setRuntimeOption("dither-depth", value: "auto")
        case .hdr:
            activeToneMappingMode = "auto"
            _ = engine.setRuntimeOption("tone-mapping", value: "auto")
            _ = engine.setRuntimeOption("hdr-compute-peak", value: "yes")
            _ = engine.setRuntimeOption("target-colorspace-hint", value: "yes")
            _ = engine.setRuntimeOption("target-prim", value: "auto")
            _ = engine.setRuntimeOption("target-trc", value: "auto")
            _ = engine.setRuntimeOption("gamut-mapping-mode", value: "auto")
            _ = engine.setRuntimeOption("target-peak", value: "auto")
            _ = engine.setRuntimeOption("video-output-levels", value: "limited")
            _ = engine.setRuntimeOption("dither-depth", value: "auto")
        case .auto:
            activeToneMappingMode = "auto"
            _ = engine.setRuntimeOption("tone-mapping", value: "auto")
            _ = engine.setRuntimeOption("hdr-compute-peak", value: "no")
            _ = engine.setRuntimeOption("target-colorspace-hint", value: "no")
            _ = engine.setRuntimeOption("target-prim", value: "auto")
            _ = engine.setRuntimeOption("target-trc", value: "auto")
            _ = engine.setRuntimeOption("gamut-mapping-mode", value: "auto")
            _ = engine.setRuntimeOption("target-peak", value: "auto")
            _ = engine.setRuntimeOption("video-output-levels", value: "full")
            _ = engine.setRuntimeOption("dither-depth", value: "auto")
        }

        applyDolbyVisionFallbackHintsIfNeeded(engine)
    }

    private func applyDolbyVisionFallbackHintsIfNeeded(_ engine: MPVEngine) {
        guard requestedContentRange == .dolbyVision else { return }
        _ = engine.setRuntimeOption("dovi-metadata", value: "auto")
    }

    private func restoreColorPipelineAfterWake(force: Bool = false) {
        guard playbackBackendIdentifier == "mpv", engine != nil else { return }

        let now = CFAbsoluteTimeGetCurrent()
        if !force, now - lastWakeColorRestoreAt < wakeColorRestoreThrottleInterval {
            return
        }

        lastWakeColorRestoreAt = now
        let intent = resolveOutputIntent()
        videoSurface.configureColorSpace(forSDR: intent != .hdr)
        videoSurface.prepareForForegroundResume()
        videoSurface.updateLayout()
        applyDynamicRangeIntent()
        renderUpdatePending = true
        mpvColorPipelineRestoreCount += 1
    }

    private func startRenderScheduler() {
        stopRenderScheduler()
        let now = CFAbsoluteTimeGetCurrent()
        lastRenderTimestamp = now
        lastWatchdogWarningAt = 0
        lastPropertyEventAt = now
        lastFallbackPropertyPollAt = now
        lastPositionPublishAt = 0
        let link = CADisplayLink(target: self, selector: #selector(handleRenderTick))
        if preferredRenderFramesPerSecond > 0 {
            link.preferredFramesPerSecond = preferredRenderFramesPerSecond
        }
        link.add(to: .main, forMode: .common)
        renderDisplayLink = link
        renderWatchdogTimer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] _ in
            Task { @MainActor in
                self?.checkRenderWatchdog()
            }
        }
    }

    private func stopRenderScheduler() {
        renderDisplayLink?.invalidate()
        renderDisplayLink = nil
        renderWatchdogTimer?.invalidate()
        renderWatchdogTimer = nil
        renderUpdatePending = false
    }

    private func checkRenderWatchdog() {
        guard state == .playing else { return }
        let now = CFAbsoluteTimeGetCurrent()
        let elapsed = now - lastRenderTimestamp
        if elapsed > 1, now - lastWatchdogWarningAt > 15 {
            lastWatchdogWarningAt = now
            renderStallCount += 1
            logger.warning("render_watchdog stall detected: no render update for \(String(format: "%.1f", elapsed))s (count=\(self.renderStallCount))")
            handleRenderStallRecovery()
        }
    }

    private func handleRenderStallRecovery() {
        if renderStallCount == 3 {
            logger.warning("render_watchdog recovery: force seek")
            _ = engine?.seekAbsolute(currentTime)
        } else if renderStallCount == 8 {
            logger.warning("render_watchdog recovery: engine recreation")
            let url = activePlaybackURL
            let pos = currentTime
            let savedStallCount = renderStallCount
            stopPlaybackOnly()
            renderStallCount = savedStallCount
            if let url {
                _ = startMpvPlayback(url, startPosition: pos)
            }
        } else if renderStallCount == 12 {
            logger.warning("render_watchdog recovery: second engine recreation")
            let url = activePlaybackURL
            let pos = currentTime
            let savedStallCount = renderStallCount
            stopPlaybackOnly()
            renderStallCount = savedStallCount
            if let url {
                _ = startMpvPlayback(url, startPosition: pos)
            }
        }
    }

    @objc private func handleRenderTick() {
        if renderUpdatePending {
            renderUpdatePending = false
            engine?.drainPendingEvents { [weak self] event in
                guard let self else { return }
                self.applyEvent(event)
            }
            lastRenderTimestamp = CFAbsoluteTimeGetCurrent()
        }

        let now = CFAbsoluteTimeGetCurrent()
        if now - lastPropertyEventAt >= fallbackPropertyPollInterval,
           now - lastFallbackPropertyPollAt >= fallbackPropertyPollInterval {
            updateFromMpvProperties()
            lastFallbackPropertyPollAt = now
        }
    }

    private func beginMpvResumeGateIfNeeded() {
        guard playbackBackendIdentifier == "mpv" else { return }
        guard let engine else {
            resume()
            return
        }

        cancelMpvResumeGate()
        mpvResumeAwaitingFirstFrame = true
        state = .buffering(0.25)
        videoSurface.prepareForForegroundResume()

        let workItem = DispatchWorkItem { [weak self] in
            guard let self, self.mpvResumeAwaitingFirstFrame else { return }
            self.completeMpvResumeGate()
        }
        mpvResumeGateWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + mpvResumeGateTimeout, execute: workItem)

        _ = engine.setPause(false)
    }

    private func completeMpvResumeGate() {
        guard mpvResumeAwaitingFirstFrame else { return }
        cancelMpvResumeGate()
        if state != .paused {
            state = .playing
        }
    }

    private func cancelMpvResumeGate() {
        mpvResumeAwaitingFirstFrame = false
        mpvResumeGateWorkItem?.cancel()
        mpvResumeGateWorkItem = nil
    }

    func snapshotPlaybackPosition() -> TimeInterval {
        if let engine, let pos = engine.getDoubleProperty("time-pos"), pos.isFinite, pos >= 0 {
            return pos
        }
        return currentTime
    }

    private func applyEvent(_ event: MPVEngine.Event) {
        switch event.id {
        case MPVEngine.EventID.startFile.rawValue:
            state = .opening
        case MPVEngine.EventID.fileLoaded.rawValue:
            state = .buffering(0.25)
            applyPendingMpvStartPositionIfNeeded()
            refreshTracksFromMpv()
            applyStartupSubtitlePolicyIfNeeded()
        case MPVEngine.EventID.playbackRestart.rawValue:
            applyPendingMpvStartPositionIfNeeded()
            if mpvResumeAwaitingFirstFrame {
                state = .buffering(0.25)
            } else {
                state = .playing
            }
            refreshTracksFromMpv()
        case MPVEngine.EventID.endFile.rawValue:
            if event.endReason == .error {
                state = .error
            } else {
                state = .ended
            }
        case MPVEngine.EventID.seek.rawValue:
            state = .buffering(0.25)
        case MPVEngine.EventID.propertyChange.rawValue:
            applyPropertyEvent(event)
        case MPVEngine.EventID.shutdown.rawValue:
            state = .stopped
            stopRenderScheduler()
            resetEngine()
        default:
            break
        }
    }

    private func applyPropertyEvent(_ event: MPVEngine.Event) {
        guard let propertyName = event.propertyName else { return }
        lastPropertyEventAt = CFAbsoluteTimeGetCurrent()

        switch propertyName {
        case "pause":
            if let paused = event.boolValue {
                if paused {
                    state = .paused
                } else if mpvResumeAwaitingFirstFrame {
                    state = .buffering(0.25)
                } else {
                    state = .playing
                }
            }
        case "time-pos":
            if let timePos = event.doubleValue {
                publishPlaybackPosition(timePos, force: seekInProgress)
                if mpvResumeAwaitingFirstFrame, timePos.isFinite, timePos >= 0 {
                    completeMpvResumeGate()
                }
            }
        case "duration":
            if let dur = event.doubleValue, dur.isFinite, dur > 0 {
                duration = dur
                if duration > 0 {
                    position = Float(max(0, min(1, currentTime / duration)))
                }
            }
        case "paused-for-cache":
            if let pausedForCache = event.boolValue {
                if pausedForCache {
                    state = .buffering(bufferProgress)
                } else if state == .buffering(bufferProgress) {
                    state = .playing
                }
            }
        case "cache-buffering-state":
            if let pct = event.doubleValue {
                let normalized = Float(max(0, min(1, pct / 100)))
                bufferProgress = normalized
                if normalized < 1, state != .paused {
                    state = .buffering(normalized)
                }
            }
        case "eof-reached":
            if event.boolValue == true {
                state = .ended
            }
        case "aid":
            if let aid = event.intValue, let intValue = Int32(exactly: aid) {
                currentAudioTrackIndex = intValue
            }
        case "sid":
            if let sid = event.intValue, let intValue = Int32(exactly: sid) {
                currentSubtitleTrackIndex = intValue
            } else {
                currentSubtitleTrackIndex = -1
            }
        case "track-list/count":
            refreshTracksFromMpv()
        default:
            break
        }
    }

    private func updateFromMpvProperties() {
        guard let engine else { return }

        applyPendingMpvStartPositionIfNeeded()

        if let pos = engine.getDoubleProperty("time-pos") {
            publishPlaybackPosition(pos, force: true)
            if mpvResumeAwaitingFirstFrame, pos.isFinite, pos >= 0 {
                completeMpvResumeGate()
            }
        }

        if let dur = engine.getDoubleProperty("duration"), dur.isFinite, dur > 0 {
            duration = dur
        }

        if duration > 0 {
            position = Float(max(0, min(1, currentTime / duration)))
        }

        if let paused = engine.getFlagProperty("pause") {
            if paused {
                state = .paused
            } else if mpvResumeAwaitingFirstFrame {
                state = .buffering(0.25)
            } else if state == .opening || state == .buffering(0.25) || state == .paused {
                state = .playing
            }
        }

        if let pausedForCache = engine.getFlagProperty("paused-for-cache"), pausedForCache {
            state = .buffering(bufferProgress)
        }

        if let cachePct = engine.getDoubleProperty("cache-buffering-state") {
            let normalized = Float(max(0, min(1, cachePct / 100)))
            bufferProgress = normalized
            if normalized < 1, state != .paused {
                state = .buffering(normalized)
            }
        }

        if let eofReached = engine.getFlagProperty("eof-reached"), eofReached {
            state = .ended
        }

        if let aid = engine.getInt64Property("aid"), let intValue = Int32(exactly: aid) {
            if currentAudioTrackIndex != intValue {
                currentAudioTrackIndex = intValue
            }
        }

        if let sid = engine.getInt64Property("sid"), let intValue = Int32(exactly: sid) {
            if currentSubtitleTrackIndex != intValue {
                currentSubtitleTrackIndex = intValue
            }
        } else if currentSubtitleTrackIndex != -1 {
            currentSubtitleTrackIndex = -1
        }

        checkMidStreamIntentChange(engine: engine)
    }

    private func intentFromVideoParams(_ primaries: String, _ gamma: String) -> MPVOutputIntent {
        let isHdr = gamma == "pq" || gamma == "hlg"
            || primaries == "bt.2020" || primaries == "display-p3"
        if isHdr {
            return sinkIsHdrCapable ? .hdr : .sdr
        }
        return .auto
    }

    private func checkMidStreamIntentChange(engine: MPVEngine) {
        guard !intentChangeInProgress else { return }
        switch state {
        case .playing, .buffering:
            break
        default:
            return
        }

        let primaries = engine.getStringProperty("video-params/primaries") ?? ""
        let gamma = engine.getStringProperty("video-params/gamma") ?? ""
        guard !primaries.isEmpty, !gamma.isEmpty else { return }
        let detected = intentFromVideoParams(primaries, gamma)

        guard detected != activeOutputIntent else {
            pendingOutputIntent = nil
            pendingOutputIntentDetectedAt = 0
            return
        }

        let now = CFAbsoluteTimeGetCurrent()
        if pendingOutputIntent != detected {
            pendingOutputIntent = detected
            pendingOutputIntentDetectedAt = now
            return
        }

        guard now - pendingOutputIntentDetectedAt >= intentChangeDebounceInterval else {
            return
        }

        pendingOutputIntent = nil
        pendingOutputIntentDetectedAt = 0
        handleOutputIntentChange(detected)
    }

    private func handleOutputIntentChange(_ newIntent: MPVOutputIntent) {
        guard newIntent != activeOutputIntent else { return }
        guard let url = activePlaybackURL else { return }
        intentChangeInProgress = true
        pendingOutputIntent = nil
        pendingOutputIntentDetectedAt = 0
        let pos = currentTime
        logger.info("mid-stream intent change: \(String(describing: self.activeOutputIntent)) -> \(String(describing: newIntent))")
        stopPlaybackOnly()
        resetEngine()
        activePlaybackURL = url
        activeToneMappingMode = newIntent == .sdr ? "hable" : "auto"
        videoSurface.configureColorSpace(forSDR: newIntent != .hdr)
        if ensureEngine(profile: activeProfile, outputIntent: newIntent),
           engine?.loadFile(url) == true {
            engine?.applySubtitleStyle(mpvSubtitleOptions)
            applyDynamicRangeIntent()
            state = .opening
            startRenderScheduler()
            if pos > 0 {
                pendingMpvStartPosition = pos
            }
        }
        intentChangeInProgress = false
    }

    private func refreshTracksFromMpv() {
        guard let engine else { return }
        let tracks = engine.trackList()

        let nextAudio = tracks
            .filter { $0.type == .audio }
            .compactMap(makeTrack)

        let nextSubtitles = tracks
            .filter { $0.type == .subtitle }
            .compactMap(makeTrack)

        if nextAudio != audioTracks {
            audioTracks = nextAudio
        }
        if nextSubtitles != subtitleTracks {
            subtitleTracks = nextSubtitles
            subtitleDebug(
                "subtitle_mpv_tracks_refreshed count=\(nextSubtitles.count) tracks=\(self.subtitleTrackDebugSummary(nextSubtitles)) current_sid=\(self.currentSubtitleTrackIndex)"
            )
        }
    }

    private func makeTrack(from track: MPVEngine.TrackInfo) -> PlayerTrack? {
        guard let id = Int32(exactly: track.id) else {
            return nil
        }

        var parts: [String] = []
        if let title = normalizedTrackText(track.title) {
            parts.append(title)
        }
        if let language = normalizedTrackText(track.language), !parts.contains(language) {
            parts.append(language)
        }
        if track.isForced {
            parts.append("Forced")
        }
        if track.isDefault {
            parts.append("Default")
        }

        let name: String
        if parts.isEmpty {
            name = "Track \(id)"
        } else {
            name = parts.joined(separator: " - ")
        }

        return PlayerTrack(
            id: id,
            name: name,
            language: normalizedTrackText(track.language),
            title: normalizedTrackText(track.title),
            isDefault: track.isDefault,
            isForced: track.isForced,
            codec: normalizedTrackText(track.codec)
        )
    }

    private func normalizedTrackText(_ text: String?) -> String? {
        guard let text else { return nil }
        let value = text.trimmingCharacters(in: .whitespacesAndNewlines)
        return value.isEmpty ? nil : value
    }

    private func subtitleTrackDebugSummary(_ tracks: [PlayerTrack]) -> String {
        guard !tracks.isEmpty else { return "[]" }
        return "[" + tracks.map { track in
            let language = track.language ?? "-"
            let title = redactedTrackText(track.title ?? "-")
            let name = redactedTrackText(track.name)
            return "\(track.id){name=\(name),lang=\(language),title=\(title),default=\(track.isDefault),forced=\(track.isForced)}"
        }.joined(separator: ";") + "]"
    }

    private func redactedURLString(_ url: URL) -> String {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return url.absoluteString
        }
        components.query = nil
        components.fragment = nil
        return components.string ?? url.absoluteString
    }

    private func redactedTrackText(_ text: String) -> String {
        var value = text
        value = value.replacingOccurrences(of: "api_key=[^&\\s]+", with: "api_key=<redacted>", options: .regularExpression)
        value = value.replacingOccurrences(of: "x-emby-token=[^&\\s]+", with: "x-emby-token=<redacted>", options: [.regularExpression, .caseInsensitive])
        return value
    }

    private func registerLifecycleObservers() {
        let center = NotificationCenter.default

        lifecycleObservers.append(
            center.addObserver(
                forName: UIApplication.willResignActiveNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                MainActor.assumeIsolated {
                    guard let self else { return }
                    self.cancelMpvResumeGate()
                    self.videoSurface.prepareForForegroundResume()
                    guard self.playbackBackendIdentifier == "mpv" else {
                        self.wasPlayingBeforeBackground = false
                        self.videoSurface.updateLayout()
                        return
                    }

                    self.wasPlayingBeforeBackground = self.isPlaying
                    if self.wasPlayingBeforeBackground {
                        self.pause()
                    }
                    self.videoSurface.updateLayout()
                }
            }
        )

        lifecycleObservers.append(
            center.addObserver(
                forName: UIApplication.didBecomeActiveNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                MainActor.assumeIsolated {
                    guard let self else { return }
                    guard self.playbackBackendIdentifier == "mpv" else {
                        self.wasPlayingBeforeBackground = false
                        self.videoSurface.prepareForForegroundResume()
                        self.videoSurface.updateLayout()
                        return
                    }

                    self.restoreColorPipelineAfterWake(force: true)

                    if self.wasPlayingBeforeBackground {
                        self.wasPlayingBeforeBackground = false
                        self.beginMpvResumeGateIfNeeded()
                    }
                }
            }
        )

        lifecycleObservers.append(
            center.addObserver(
                forName: UIScreen.didConnectNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                MainActor.assumeIsolated {
                    guard let self else { return }
                    self.restoreColorPipelineAfterWake()
                }
            }
        )

        lifecycleObservers.append(
            center.addObserver(
                forName: AVAudioSession.interruptionNotification,
                object: nil,
                queue: .main
            ) { [weak self] notification in
                MainActor.assumeIsolated {
                    guard let self else { return }
                    guard
                        let rawType = notification.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt,
                        let type = AVAudioSession.InterruptionType(rawValue: rawType)
                    else {
                        return
                    }

                    switch type {
                    case .began:
                        self.wasPlayingBeforeInterruption = self.isPlaying
                        if self.wasPlayingBeforeInterruption {
                            self.pause()
                        }
                    case .ended:
                        let optionsRaw = notification.userInfo?[AVAudioSessionInterruptionOptionKey] as? UInt ?? 0
                        let options = AVAudioSession.InterruptionOptions(rawValue: optionsRaw)
                        if self.wasPlayingBeforeInterruption, options.contains(.shouldResume) {
                            self.wasPlayingBeforeInterruption = false
                            self.resume()
                        } else {
                            self.wasPlayingBeforeInterruption = false
                        }
                    @unknown default:
                        self.wasPlayingBeforeInterruption = false
                    }
                }
            }
        )

        // Pause when the current output device disappears (AirPods removed,
        // headphones unplugged). The system does not interrupt for this, so it
        // must be handled as a route change.
        lifecycleObservers.append(
            center.addObserver(
                forName: AVAudioSession.routeChangeNotification,
                object: nil,
                queue: .main
            ) { [weak self] notification in
                MainActor.assumeIsolated {
                    guard let self else { return }
                    guard
                        let rawReason = notification.userInfo?[
                            AVAudioSessionRouteChangeReasonKey] as? UInt,
                        let reason = AVAudioSession.RouteChangeReason(rawValue: rawReason)
                    else {
                        return
                    }
                    if reason == .oldDeviceUnavailable, self.isPlaying {
                        self.pause()
                        self.onNowPlayingCommand?(["event": "pause"])
                    }
                }
            }
        )
    }

    static func makePlayer() -> MpvPlayerWrapper {
        return MpvPlayerWrapper()
    }
}

/// Bridges the player to the system Now Playing infrastructure: it owns the
/// `MPNowPlayingInfoCenter` payload and `MPRemoteCommandCenter` handlers so
/// Moonfin becomes the active Now Playing app. Without this, AirPods stem
/// clicks and Control Center transport controls fall through to whatever app
/// last held the Now Playing session. Requires no entitlement; the private 
/// `com.apple.mediaremote.set-playback-state` is not used.
@MainActor
final class NowPlayingController {
    var onPlay: (@MainActor () -> Void)?
    var onPause: (@MainActor () -> Void)?
    var onToggle: (@MainActor () -> Void)?
    var onSeek: (@MainActor (TimeInterval) -> Void)?
    var onNext: (@MainActor () -> Void)?
    var onPrevious: (@MainActor () -> Void)?

    private var commandsRegistered = false
    private var registeredTargets: [(MPRemoteCommand, Any)] = []
    private var info: [String: Any] = [:]
    private var artworkURLString: String?

    func registerCommands() {
        guard !commandsRegistered else { return }
        commandsRegistered = true
        let center = MPRemoteCommandCenter.shared()

        addTarget(center.playCommand) { [weak self] _ in
            MainActor.assumeIsolated {
                self?.onPlay?()
                return .success
            }
        }
        addTarget(center.pauseCommand) { [weak self] _ in
            MainActor.assumeIsolated {
                self?.onPause?()
                return .success
            }
        }
        addTarget(center.togglePlayPauseCommand) { [weak self] _ in
            MainActor.assumeIsolated {
                self?.onToggle?()
                return .success
            }
        }
        addTarget(center.changePlaybackPositionCommand) { [weak self] event in
            MainActor.assumeIsolated {
                guard let self,
                    let positionEvent = event as? MPChangePlaybackPositionCommandEvent
                else {
                    return .commandFailed
                }
                self.onSeek?(positionEvent.positionTime)
                return .success
            }
        }
        addTarget(center.nextTrackCommand) { [weak self] _ in
            MainActor.assumeIsolated {
                self?.onNext?()
                return .success
            }
        }
        addTarget(center.previousTrackCommand) { [weak self] _ in
            MainActor.assumeIsolated {
                self?.onPrevious?()
                return .success
            }
        }

        center.playCommand.isEnabled = true
        center.pauseCommand.isEnabled = true
        center.togglePlayPauseCommand.isEnabled = true
        center.changePlaybackPositionCommand.isEnabled = true
    }

    func setQueueCapabilities(hasNext: Bool, hasPrevious: Bool) {
        let center = MPRemoteCommandCenter.shared()
        center.nextTrackCommand.isEnabled = hasNext
        center.previousTrackCommand.isEnabled = hasPrevious
    }

    func updateMetadata(
        title: String, subtitle: String, durationSeconds: TimeInterval, artworkURL: String?
    ) {
        info[MPMediaItemPropertyTitle] = title
        info[MPMediaItemPropertyArtist] = subtitle
        info[MPMediaItemPropertyAlbumTitle] = subtitle
        if durationSeconds > 0 {
            info[MPMediaItemPropertyPlaybackDuration] = durationSeconds
        }
        info[MPNowPlayingInfoPropertyMediaType] = MPNowPlayingInfoMediaType.video.rawValue
        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
        loadArtwork(artworkURL)
    }

    func updatePlaybackState(
        isPlaying: Bool, elapsed: TimeInterval, duration: TimeInterval, rate: Float
    ) {
        guard !info.isEmpty else { return }
        if duration > 0 {
            info[MPMediaItemPropertyPlaybackDuration] = duration
        }
        info[MPNowPlayingInfoPropertyElapsedPlaybackTime] = max(0, elapsed)
        info[MPNowPlayingInfoPropertyPlaybackRate] = isPlaying ? Double(rate <= 0 ? 1 : rate) : 0
        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
    }

    func clear() {
        info = [:]
        artworkURLString = nil
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nil
    }

    func teardown() {
        for (command, token) in registeredTargets {
            command.removeTarget(token)
        }
        registeredTargets.removeAll()
        commandsRegistered = false
        clear()
    }

    private func addTarget(
        _ command: MPRemoteCommand,
        handler: @escaping (MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus
    ) {
        let token = command.addTarget(handler: handler)
        registeredTargets.append((command, token))
    }

    private func loadArtwork(_ urlString: String?) {
        guard let urlString, !urlString.isEmpty, urlString != artworkURLString,
            let url = URL(string: urlString)
        else {
            return
        }
        artworkURLString = urlString
        Task { @MainActor [weak self] in
            guard let (data, _) = try? await URLSession.shared.data(from: url) else { return }
            self?.applyArtworkData(data, for: urlString)
        }
    }

    private func applyArtworkData(_ data: Data, for urlString: String) {
        guard artworkURLString == urlString, let image = UIImage(data: data) else { return }
        info[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { _ in
            image
        }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
    }
}

private enum MPVRenderProfile {
    case metal
    case software
}

private enum MPVOutputIntent {
    case auto
    case sdr
    case hdr
}

private enum MPVPlaybackQualityProfile: String {
    case compatibility
    case highQuality
}

private final class MPVVideoSurface {
    private weak var hostView: UIView?
    private let metalLayer = SafeMetalLayer()

    init() {
#if canImport(Metal)
        metalLayer.device = MTLCreateSystemDefaultDevice()
#endif
        metalLayer.framebufferOnly = true
        metalLayer.backgroundColor = UIColor.black.cgColor
        metalLayer.isOpaque = true
    }

    var drawableHandle: UInt64? {
        UInt64(UInt(bitPattern: Unmanaged.passUnretained(metalLayer).toOpaque()))
    }

    func attach(to view: UIView) {
        hostView = view
        metalLayer.removeFromSuperlayer()
        view.layer.addSublayer(metalLayer)
        updateLayout()
    }

    func updateLayout() {
        guard let hostView else { return }
        let bounds = hostView.bounds
        if metalLayer.frame != bounds {
            metalLayer.frame = bounds
        }
        let scale = hostView.window?.screen.nativeScale ?? UIScreen.main.nativeScale
        if metalLayer.contentsScale != scale {
            metalLayer.contentsScale = scale
        }
    }

    func prepareForForegroundResume() {
        metalLayer.isOpaque = true
        metalLayer.backgroundColor = UIColor.black.cgColor
    }

    func teardown() {
        metalLayer.removeFromSuperlayer()
        hostView = nil
    }

    func configureColorSpace(forSDR: Bool) {
        if forSDR {
            metalLayer.pixelFormat = .bgra8Unorm
            metalLayer.colorspace = CGColorSpace(name: CGColorSpace.sRGB)
        } else {
            metalLayer.pixelFormat = .rgba16Float
            metalLayer.colorspace = CGColorSpace(name: CGColorSpace.itur_2100_PQ)
        }
    }
}

private final class SafeMetalLayer: CAMetalLayer {
    override var drawableSize: CGSize {
        get { super.drawableSize }
        set {
            if Int(newValue.width) > 1 && Int(newValue.height) > 1 {
                super.drawableSize = newValue
            }
        }
    }
}

private final class MPVEngine {
    private static let logger = Logger(subsystem: "org.moonfin.appletv", category: "MPVEngine")
    enum TrackType: String {
        case audio
        case subtitle = "sub"
        case video
        case unknown
    }

    struct TrackInfo {
        var id: Int64
        var type: TrackType
        var title: String?
        var language: String?
        var isDefault: Bool
        var isForced: Bool
        var codec: String?
    }

    enum EventID: Int32 {
        case shutdown = 1
        case startFile = 6
        case endFile = 7
        case fileLoaded = 8
        case playbackRestart = 21
        case propertyChange = 22
        case seek = 20
    }

    enum EndReason: Int32 {
        case eof = 0
        case stop = 2
        case quit = 3
        case error = 4
        case redirect = 5
    }

    struct Event {
        var id: Int32
        var endReason: EndReason?
        var propertyName: String?
        var boolValue: Bool?
        var doubleValue: Double?
        var intValue: Int64?
    }

    private var handle: OpaquePointer?
    private var wakeupHandler: (() -> Void)?
    private(set) var initDiagnostics: [String: String] = [:]

    var isReady: Bool { handle != nil }
    private(set) var lastInitError: String?

    init(renderProfile: MPVRenderProfile, outputIntent: MPVOutputIntent = .auto, qualityProfile: MPVPlaybackQualityProfile = .compatibility, drawableHandle: UInt64?, updateHandler: @escaping () -> Void) {
        guard let created = mpv_create() else { return }

        if let drawableHandle {
            var layerHandle = Int64(bitPattern: drawableHandle)
            _ = setInt64Option("wid", value: &layerHandle, on: created)
            _ = setOptionString("vo", value: "gpu-next", on: created)
            _ = setOptionString("gpu-api", value: "vulkan", on: created)
            _ = setOptionString("gpu-context", value: "moltenvk", on: created)
            _ = setOptionString("hwdec-codecs", value: "h264,hevc,vp9,av1", on: created)
        } else {
            _ = setOptionString("vo", value: "null", on: created)
            _ = setOptionString("vid", value: "no", on: created)
        }

        _ = setOptionString("subs-match-os-language", value: "yes", on: created)
        _ = setOptionString("subs-fallback", value: "yes", on: created)

        initDiagnostics["output_intent"] = "\(outputIntent)"
        initDiagnostics["quality_profile"] = qualityProfile.rawValue

        if drawableHandle != nil {
            func setTracked(_ name: String, _ value: String) {
                let ok = setOptionString(name, value: value, on: created)
                initDiagnostics["opt_\(name)"] = ok ? "ok" : "FAIL"
            }

            switch outputIntent {
            case .sdr:
                setTracked("target-colorspace-hint", "no")
                setTracked("target-prim", "bt.709")
                setTracked("target-trc", "bt.1886")
                setTracked("tone-mapping", "hable")
                setTracked("gamut-mapping-mode", "perceptual")
                setTracked("target-peak", "auto")
                setTracked("hdr-compute-peak", "no")
                setTracked("video-output-levels", "full")
                setTracked("dither-depth", "auto")
            case .hdr:
                setTracked("target-colorspace-hint", "yes")
                setTracked("target-prim", "auto")
                setTracked("target-trc", "auto")
                setTracked("tone-mapping", "auto")
                setTracked("gamut-mapping-mode", "auto")
                setTracked("target-peak", "auto")
                setTracked("hdr-compute-peak", "yes")
                setTracked("video-output-levels", "limited")
                setTracked("dither-depth", "auto")
            case .auto:
                setTracked("target-colorspace-hint", "no")
                setTracked("target-prim", "auto")
                setTracked("target-trc", "auto")
                setTracked("tone-mapping", "auto")
                setTracked("gamut-mapping-mode", "auto")
                setTracked("target-peak", "auto")
                setTracked("hdr-compute-peak", "no")
                setTracked("video-output-levels", "full")
                setTracked("dither-depth", "auto")
            }

            if qualityProfile == .highQuality {
                _ = setOptionString("deband", value: "yes", on: created)
                _ = setOptionString("temporal-dither", value: "yes", on: created)
                _ = setOptionString("interpolation", value: "yes", on: created)
                _ = setOptionString("scale", value: "ewa_lanczos", on: created)
                _ = setOptionString("cscale", value: "ewa_lanczos", on: created)
            }

            _ = setOptionString("vd-lavc-film-grain", value: "gpu", on: created)
            _ = setOptionString("video-rotate", value: "no", on: created)
            _ = setOptionString("deinterlace", value: "auto", on: created)
        }

        _ = setOptionString("network-timeout", value: "120", on: created)
        _ = setOptionString("user-agent", value: "Moonfin-tvOS/\(AppConstants.clientVersion)", on: created)

        switch renderProfile {
        case .metal:
            if drawableHandle == nil {
                break
            }
#if targetEnvironment(simulator)
            _ = setOptionString("hwdec", value: "no", on: created)
#else
            _ = setOptionString("hwdec", value: "videotoolbox", on: created)
#endif
        case .software:
            if drawableHandle != nil {
                _ = setOptionString("hwdec", value: "no", on: created)
                _ = setOptionString("gpu-sw", value: "yes", on: created)
            }
        }

        let initResult = mpv_initialize(created)
        guard initResult >= 0 else {
            let cStr = mpv_error_string(initResult)
            if let cStr {
                lastInitError = String(cString: cStr)
            }
            mpv_terminate_destroy(created)
            return
        }

        handle = created
        wakeupHandler = updateHandler
        installWakeupCallback()
        mpv_request_log_messages(created, "warn")
        observeCoreProperties()
    }

    func shutdown() {
        guard let handle else { return }
        clearWakeupCallback()
        wakeupHandler = nil
        _ = stopPlayback()
        let deadline = CFAbsoluteTimeGetCurrent() + 0.3
        while CFAbsoluteTimeGetCurrent() < deadline {
            guard let event = mpv_wait_event(handle, 0.05) else { break }
            let id = event.pointee.event_id
            if id == MPV_EVENT_IDLE || id == MPV_EVENT_SHUTDOWN { break }
        }
    }

    deinit {
        clearWakeupCallback()
        if let handle {
            mpv_terminate_destroy(handle)
        }
    }

    func loadFile(_ url: String) -> Bool {
        command(["loadfile", url, "replace"])
    }

    func setPause(_ paused: Bool) -> Bool {
        command(["set", "pause", paused ? "yes" : "no"])
    }

    func stopPlayback() -> Bool {
        command(["stop"])
    }

    func seekAbsolute(_ seconds: TimeInterval) -> Bool {
        command(["seek", String(seconds), "absolute"])
    }

    func seekRelative(_ seconds: TimeInterval) -> Bool {
        command(["seek", String(seconds), "relative"])
    }

    func setSpeed(_ speed: Float) -> Bool {
        command(["set", "speed", String(speed)])
    }

    func setAudioTrack(_ trackId: Int32) -> Bool {
        command(["set", "aid", String(trackId)])
    }

    func setSubtitleTrack(_ trackId: Int32) -> Bool {
        command(["set", "sid", String(trackId)])
    }

    func disableSubtitles() -> Bool {
        command(["set", "sid", "no"])
    }

    func setRuntimeOption(_ name: String, value: String) -> Bool {
        guard let handle else { return false }
        let result = mpv_set_property_string(handle, name, value)
        return result >= 0
    }

    func applySubtitleStyle(_ options: [String: Any]) {
        let mappings: [(String, String)] = [
            ("sub-margin", "sub-margin-y"),
            ("freetype-outline-thickness", "sub-border-size")
        ]

        for (sourceKey, targetKey) in mappings {
            guard let value = options[sourceKey] else { continue }
            _ = setRuntimeOption(targetKey, value: String(describing: value))
        }

        if let relSize = options["freetype-rel-fontsize"] as? Int, relSize > 0 {
            let mpvSize = Int(round(1080.0 / Double(relSize) * (55.0 / 24.0)))
            _ = setRuntimeOption("sub-font-size", value: String(mpvSize))
        }

        if let color = options["freetype-color"] as? Int {
            _ = setRuntimeOption("sub-color", value: vlcColorToMpv(color, alpha: 255))
        }

        if let outlineColor = options["freetype-outline-color"] as? Int {
            _ = setRuntimeOption("sub-border-color", value: vlcColorToMpv(outlineColor, alpha: 255))
        }

        let bgOpacity = options["freetype-background-opacity"] as? Int ?? 0
        if let bgColor = options["freetype-background-color"] as? Int {
            _ = setRuntimeOption("sub-back-color", value: vlcColorToMpv(bgColor, alpha: bgOpacity))
        } else {
            _ = setRuntimeOption("sub-back-color", value: vlcColorToMpv(0, alpha: bgOpacity))
        }

        if let bold = options["freetype-bold"] as? Bool {
            _ = setRuntimeOption("sub-bold", value: bold ? "yes" : "no")
        }

        if let assOverride = options["sub-ass-override"] as? String {
            _ = setRuntimeOption("sub-ass-override", value: assOverride)
        }
    }

    private func vlcColorToMpv(_ rgb: Int, alpha: Int) -> String {
        let r = (rgb >> 16) & 0xFF
        let g = (rgb >> 8) & 0xFF
        let b = rgb & 0xFF
        let a = min(max(alpha, 0), 255)
        return String(format: "#%02X%02X%02X%02X", a, r, g, b)
    }

    func getDoubleProperty(_ name: String) -> Double? {
        guard let handle else { return nil }
        var value: Double = 0
        let result = mpv_get_property(handle, name, MPV_FORMAT_DOUBLE, &value)
        return result >= 0 ? value : nil
    }

    func getFlagProperty(_ name: String) -> Bool? {
        guard let handle else { return nil }
        var value: Int32 = 0
        let result = mpv_get_property(handle, name, MPV_FORMAT_FLAG, &value)
        return result >= 0 ? value != 0 : nil
    }

    func getInt64Property(_ name: String) -> Int64? {
        guard let handle else { return nil }
        var value: Int64 = 0
        let result = mpv_get_property(handle, name, MPV_FORMAT_INT64, &value)
        return result >= 0 ? value : nil
    }

    func getStringProperty(_ name: String) -> String? {
        guard let handle else { return nil }
        var raw: UnsafeMutablePointer<CChar>?
        let result = mpv_get_property(handle, name, MPV_FORMAT_STRING, &raw)
        guard result >= 0, let raw else { return nil }
        defer { mpv_free(raw) }
        return String(cString: raw)
    }

    func trackList() -> [TrackInfo] {
        guard let count = getInt64Property("track-list/count"), count > 0 else {
            return []
        }

        var tracks: [TrackInfo] = []
        tracks.reserveCapacity(Int(count))

        for index in 0..<Int(count) {
            let prefix = "track-list/\(index)"
            guard
                let id = getInt64Property("\(prefix)/id"),
                let typeRaw = getStringProperty("\(prefix)/type")
            else {
                continue
            }

            let type = TrackType(rawValue: typeRaw) ?? .unknown
            let title = getStringProperty("\(prefix)/title")
            let language = getStringProperty("\(prefix)/lang")
            let isDefault = getFlagProperty("\(prefix)/default") ?? false
            let isForced = getFlagProperty("\(prefix)/forced") ?? false
            let codec = getStringProperty("\(prefix)/codec")

            tracks.append(
                TrackInfo(
                    id: id,
                    type: type,
                    title: title,
                    language: language,
                    isDefault: isDefault,
                    isForced: isForced,
                    codec: codec
                )
            )
        }

        return tracks
    }

    func drainPendingEvents(_ handler: (Event) -> Void) {
        guard let handle else { return }

        while true {
            guard let eventPtr = mpv_wait_event(handle, 0) else { return }
            let event = eventPtr.pointee
            if event.event_id == MPV_EVENT_NONE {
                return
            }
            if event.event_id == MPV_EVENT_LOG_MESSAGE, let data = event.data {
                let msg = data.assumingMemoryBound(to: mpv_event_log_message.self).pointee
                let prefix = msg.prefix.map { String(cString: $0) } ?? "?"
                let text = msg.text.map { String(cString: $0).trimmingCharacters(in: .whitespacesAndNewlines) } ?? ""
                let level = msg.log_level
                if level.rawValue <= MPV_LOG_LEVEL_ERROR.rawValue {
                    Self.logger.error("[\(prefix)] \(text)")
                } else {
                    Self.logger.warning("[\(prefix)] \(text)")
                }
                continue
            }
            handler(parseEvent(event))
        }
    }

    private func parseEvent(_ event: mpv_event) -> Event {
        var mapped = Event(id: Int32(event.event_id.rawValue))

        if event.event_id == MPV_EVENT_END_FILE,
           let data = event.data {
            let end = data.assumingMemoryBound(to: mpv_event_end_file.self).pointee
            mapped.endReason = EndReason(rawValue: Int32(end.reason.rawValue))
        }

        if event.event_id == MPV_EVENT_PROPERTY_CHANGE,
           let data = event.data {
            let property = data.assumingMemoryBound(to: mpv_event_property.self).pointee
            if let cName = property.name {
                mapped.propertyName = String(cString: cName)
            }

            switch property.format {
            case MPV_FORMAT_FLAG:
                if let p = property.data {
                    mapped.boolValue = p.load(as: Int32.self) != 0
                }
            case MPV_FORMAT_INT64:
                if let p = property.data {
                    mapped.intValue = p.load(as: Int64.self)
                }
            case MPV_FORMAT_DOUBLE:
                if let p = property.data {
                    mapped.doubleValue = p.load(as: Double.self)
                }
            default:
                break
            }
        }

        return mapped
    }

    private func installWakeupCallback() {
        guard let handle else { return }
        mpv_set_wakeup_callback(handle, MPVEngine.wakeupTrampoline, Unmanaged.passUnretained(self).toOpaque())
    }

    private func observeCoreProperties() {
        _ = observeProperty("time-pos", format: MPV_FORMAT_DOUBLE, userData: 1)
        _ = observeProperty("duration", format: MPV_FORMAT_DOUBLE, userData: 2)
        _ = observeProperty("pause", format: MPV_FORMAT_FLAG, userData: 3)
        _ = observeProperty("eof-reached", format: MPV_FORMAT_FLAG, userData: 4)
        _ = observeProperty("paused-for-cache", format: MPV_FORMAT_FLAG, userData: 5)
        _ = observeProperty("cache-buffering-state", format: MPV_FORMAT_DOUBLE, userData: 6)
        _ = observeProperty("aid", format: MPV_FORMAT_INT64, userData: 7)
        _ = observeProperty("sid", format: MPV_FORMAT_INT64, userData: 8)
        _ = observeProperty("track-list/count", format: MPV_FORMAT_INT64, userData: 9)
    }

    private func observeProperty(_ name: String, format: mpv_format, userData: UInt64) -> Bool {
        guard let handle else { return false }
        let result = mpv_observe_property(handle, userData, name, format)
        return result >= 0
    }

    private func clearWakeupCallback() {
        guard let handle else { return }
        mpv_set_wakeup_callback(handle, nil, nil)
    }

    private static let wakeupTrampoline: @convention(c) (UnsafeMutableRawPointer?) -> Void = { context in
        guard let context else { return }
        let owner = Unmanaged<MPVEngine>.fromOpaque(context).takeUnretainedValue()
        owner.wakeupHandler?()
    }

    fileprivate func command(_ args: [String]) -> Bool {
        guard let handle else { return false }

        let cArgs = args.map { strdup($0) }
        defer {
            for cArg in cArgs {
                free(cArg)
            }
        }

        var argPointers = cArgs.map { ptr in
            ptr.map { UnsafePointer<CChar>($0) }
        }
        argPointers.append(nil)

        let result = argPointers.withUnsafeMutableBufferPointer { buffer in
            mpv_command(handle, buffer.baseAddress)
        }

        return result >= 0
    }

    private func setInt64Option(_ name: String, value: inout Int64, on handle: OpaquePointer?) -> Bool {
        guard let handle else { return false }
        let result = mpv_set_option(handle, name, MPV_FORMAT_INT64, &value)
        return result >= 0
    }

    private func setOptionString(_ name: String, value: String, on handle: OpaquePointer?) -> Bool {
        guard let handle else { return false }
        let result = mpv_set_option_string(handle, name, value)
        return result >= 0
    }
}
