import Foundation
import AVFoundation
import CoreMedia
import UIKit
import os

@MainActor
final class NativePlayerWrapper: MpvPlayerWrapper {
    private let nativeLogger = Logger(subsystem: "org.moonfin.appletv", category: "NativePlayer")
    private var useNativeBackend = false
    private var nativeBackendRequested = false
    static var lastNativeStartDiagnostic = "-"

    nonisolated(unsafe) private var demuxer: FFDemuxer?
    nonisolated(unsafe) private var videoDecoder: VTDecoder?
    nonisolated(unsafe) private var audioRenderer: AudioRenderer?
    private let nativeVideoSurface = NativeVideoSurface()
    nonisolated(unsafe) private var subtitleDecoder: SubtitleDecoder?
    private let subtitleOverlay = SubtitleOverlay(frame: .zero)
    private let assRenderer = AssRenderer()
    nonisolated(unsafe) private var assActive = false
    private var assDelaySeconds: TimeInterval = 0

    private let readQueue = DispatchQueue(label: "nativePlayer.readLoop", qos: .userInitiated)
    nonisolated(unsafe) private var readLoopRunning = false
    nonisolated(unsafe) private var readLoopPaused = false

    nonisolated(unsafe) private var activeVideoStreamIndex: Int32 = -1
    nonisolated(unsafe) private var activeAudioStreamIndex: Int32 = -1
    nonisolated(unsafe) private var activeSubtitleStreamIndex: Int32 = -1
    private var audioStreamIndices: [Int32] = []
    private var subtitleStreamIndices: [Int32] = []
    private var videoConfigured = false
    private var firstFrameDelivered = false
    private var resumeAwaitingFirstFrame = false
    private var resumeGateWorkItem: DispatchWorkItem?
    nonisolated(unsafe) private var pendingDVReconfigure = false

    nonisolated(unsafe) private var pendingStartPosition: TimeInterval?
    nonisolated(unsafe) private var seekTarget: TimeInterval?
    nonisolated(unsafe) private var pendingSeekSeconds: TimeInterval?
    private var nativePlaybackRate: Float = 1.0

    private var nativeRequestedContentRange: VideoDynamicRange = .unknown
    private var nativeSinkIsHdrCapable = false
    private var nativeServerDVProfile: Int?
    private var nativeServerDVLevel: Int?
    private var nativeServerDVBlSignalCompatibilityId: Int?
    private var activeVideoFormatDescription: CMVideoFormatDescription?
    private var videoFrameRate: Double = 24.0
    private var nativeColorPipelineRestoreCount = 0
    private var lastNativeWakeRestoreAt: CFAbsoluteTime = 0
    private let nativeWakeRestoreThrottleInterval: CFAbsoluteTime = 0.25
    nonisolated(unsafe) private var frameSemaphoreTimeoutSeconds: TimeInterval = 0.1
    private var lastVideoPtsSeconds: TimeInterval = 0
    nonisolated(unsafe) private var nativeVideoDriftDropCount: UInt64 = 0
    nonisolated(unsafe) private var nativeVideoHoldCount: UInt64 = 0
    nonisolated(unsafe) private var frameSemaphoreTimeoutCount: UInt64 = 0

    private let maxFrameQueueDepth = 24
    private let frameSemaphore: DispatchSemaphore
    private let pauseCondition = NSCondition()
    private let framePacingQueue = DispatchQueue(label: "nativePlayer.framePacing", qos: .userInitiated)

    nonisolated(unsafe) private var consecutiveReadErrors: Int = 0
    private let maxReadRetries = 5
    nonisolated(unsafe) private var nativeBackgroundPaused = false
    private var nativeLifecycleObservers: [NSObjectProtocol] = []
    private static let minRate: Float = 0.5
    private static let maxRate: Float = 2.0

    private weak var playerHostView: UIView?
    private var watchdogTimer: Timer?
    private var lastDecodedFrameTime: CFAbsoluteTime = 0
    private var watchdogStallCount: Int = 0
    private static let watchdogInterval: TimeInterval = 3
    private static let watchdogStallThreshold: TimeInterval = 5
    private static let watchdogMaxStalls = 3
    private static let resumeFirstFrameTimeout: TimeInterval = 1.5

    override init() {
        frameSemaphore = DispatchSemaphore(value: maxFrameQueueDepth)
        super.init()
    }

    deinit {
        MainActor.assumeIsolated {
            teardownNative()
        }
    }

    // MARK: - Backend directive

    override func configurePreferredBackendForNextPlayback(_ backend: PlaybackBackendDirective, fallbackReason: String?) {
        nativeBackendRequested = (backend == .native)
        if !nativeBackendRequested {
            super.configurePreferredBackendForNextPlayback(backend, fallbackReason: fallbackReason)
        }
    }

    // MARK: - Video view

    override func attachVideoView(_ view: UIView) {
        super.attachVideoView(view)
        playerHostView = view
        subtitleOverlay.frame = view.bounds
        subtitleOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(subtitleOverlay)
    }

    // MARK: - Play

    override func play(url: URL, startPosition: TimeInterval = 0, audioOnly: Bool = false) async {
        if nativeBackendRequested {
            nativeBackendRequested = false
            if startNativePlayback(url.absoluteString, startPosition: startPosition) {
                return
            }
            nativeLogger.warning("native playback failed, falling back")
        }
        await super.play(url: url, startPosition: startPosition, audioOnly: audioOnly)
    }

    override func play(streamUrl: String, startPosition: TimeInterval = 0, audioOnly: Bool = false) async {
        if nativeBackendRequested {
            nativeBackendRequested = false
            if startNativePlayback(streamUrl, startPosition: startPosition) {
                return
            }
            nativeLogger.warning("native playback failed, falling back")
        } else {
            Self.lastNativeStartDiagnostic = "not_requested"
        }
        await super.play(streamUrl: streamUrl, startPosition: startPosition, audioOnly: audioOnly)
    }

    // MARK: - Transport controls

    override func pause() {
        guard useNativeBackend else { super.pause(); return }
        readLoopPaused = true
        audioRenderer?.pause()
        state = .paused
    }

    override func resume() {
        guard useNativeBackend else { super.resume(); return }
        readLoopPaused = false
        pauseCondition.lock()
        pauseCondition.signal()
        pauseCondition.unlock()
        if !resumeAwaitingFirstFrame {
            audioRenderer?.resume()
        }
        nativeVideoSurface.updateLayout()
        state = .playing
    }

    override func stop() {
        guard useNativeBackend else { super.stop(); return }
        teardownNative()
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

    // MARK: - Seek

    override func seek(to seconds: TimeInterval) {
        guard useNativeBackend else { super.seek(to: seconds); return }
        performSeek(to: seconds)
    }

    override func seekBy(_ delta: TimeInterval) {
        guard useNativeBackend else { super.seekBy(delta); return }
        performSeek(to: max(currentTime + delta, 0))
    }

    override func seekToPosition(_ pos: Float) {
        guard useNativeBackend else { super.seekToPosition(pos); return }
        let target = TimeInterval(max(0, min(1, pos))) * duration
        performSeek(to: target)
    }

    // MARK: - Rate

    override func setRate(_ newRate: Float) {
        guard useNativeBackend else { super.setRate(newRate); return }
        let clamped = min(Self.maxRate, max(Self.minRate, newRate))
        nativePlaybackRate = clamped
        audioRenderer?.setRate(clamped)
        rate = clamped
    }

    // MARK: - Tracks

    override func setAudioTrack(_ trackIndex: Int32) {
        guard useNativeBackend else { super.setAudioTrack(trackIndex); return }
        switchAudioTrack(trackIndex)
    }

    override func setSubtitleTrack(_ trackIndex: Int32) {
        guard useNativeBackend else { super.setSubtitleTrack(trackIndex); return }
        currentSubtitleTrackIndex = trackIndex
        subtitleOverlay.clear()
        subtitleDecoder?.close()
        deactivateAss()
        if trackIndex >= 1,
           let streamIndex = ffmpegStreamIndex(forOrdinal: trackIndex, in: subtitleStreamIndices),
           let demuxer,
           let streamInfo = demuxer.streams.first(where: { $0.index == streamIndex && $0.type == .subtitle }),
           let codecpar = demuxer.codecpar(forStreamIndex: streamIndex) {
            if subtitleDecoder == nil { subtitleDecoder = SubtitleDecoder() }
            if subtitleDecoder?.configure(codecId: streamInfo.codecId, codecpar: codecpar) == true {
                activeSubtitleStreamIndex = streamIndex
                activateAssIfAvailable()
            } else {
                activeSubtitleStreamIndex = -1
            }
        } else {
            activeSubtitleStreamIndex = -1
        }
    }

    private func activateAssIfAvailable() {
        assActive = false
        assRenderer.close()
        guard let header = subtitleDecoder?.subtitleHeader, !header.isEmpty else { return }
        if assRenderer.configure(header: header) {
            assActive = true
        }
    }

    private func deactivateAss() {
        assActive = false
        assRenderer.close()
    }

    override func disableSubtitles() {
        guard useNativeBackend else { super.disableSubtitles(); return }
        currentSubtitleTrackIndex = -1
        activeSubtitleStreamIndex = -1
        subtitleOverlay.clear()
        subtitleDecoder?.close()
        deactivateAss()
    }

    override func addSubtitle(url: URL) {
        guard useNativeBackend else { super.addSubtitle(url: url); return }

        let subDemux = FFDemuxer()
        guard subDemux.open(url: url.absoluteString) else { return }

        guard let subStream = subDemux.streams.first(where: { $0.type == .subtitle }),
              let codecpar = subDemux.codecpar(forStreamIndex: subStream.index) else {
            subDemux.close()
            return
        }

        let decoder = SubtitleDecoder()
        guard decoder.configure(codecId: subStream.codecId, codecpar: codecpar) else {
            subDemux.close()
            return
        }

        subtitleDecoder?.close()
        subtitleDecoder = decoder
        subtitleOverlay.clear()
        activeSubtitleStreamIndex = -1
        deactivateAss()
        activateAssIfAvailable()

        let timeBase = subDemux.timeBase(forStreamIndex: subStream.index)
        let streamIdx = subStream.index

        nonisolated(unsafe) let demux = subDemux
        nonisolated(unsafe) let dec = decoder
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            while true {
                let result = demux.readPacket()
                switch result {
                case .packet(let pkt):
                    guard pkt.streamIndex == streamIdx else { continue }
                    if let event = dec.decodePacket(pkt, timeBase: timeBase) {
                        DispatchQueue.main.async { [weak self] in
                            self?.dispatchSubtitleEvent(event)
                        }
                    }
                case .eof:
                    return
                case .wouldBlock:
                    Thread.sleep(forTimeInterval: 0.01)
                case .error:
                    return
                }
            }
        }
    }

    private func renderAss(atSeconds seconds: Double) {
        guard assActive else { return }
        let scale = subtitleOverlay.window?.screen.scale ?? 1
        let width = Int32((subtitleOverlay.bounds.width * scale).rounded())
        let height = Int32((subtitleOverlay.bounds.height * scale).rounded())
        assRenderer.setFrameSize(width: width, height: height)
        switch assRenderer.render(atTimeMs: Int64(seconds * 1000)) {
        case .image(let cgImage):
            subtitleOverlay.showAssImage(cgImage)
        case .cleared:
            subtitleOverlay.showAssImage(nil)
        case .unchanged:
            break
        }
    }

    private func dispatchSubtitleEvent(_ event: SubtitleEvent) {
        if assActive, let line = event.assLine {
            let startMs = Int64(event.startTime * 1000)
            let durationMs = Int64((event.endTime - event.startTime) * 1000)
            assRenderer.processEvent(line, startMs: startMs, durationMs: durationMs)
        } else {
            subtitleOverlay.enqueue(event)
        }
    }

    override func configureSubtitleAppearance(_ options: [String: Any]) {
        super.configureSubtitleAppearance(options)
        subtitleOverlay.applyStyle(options: options)
    }

    // MARK: - Delay

    override func setSubtitleDelay(_ interval: TimeInterval) {
        guard useNativeBackend else { super.setSubtitleDelay(interval); return }
        subtitleOverlay.delaySeconds = interval
        assDelaySeconds = interval
    }

    override func setAudioDelay(_ interval: TimeInterval) {
        guard useNativeBackend else { super.setAudioDelay(interval); return }
        audioRenderer?.setAudioDelay(interval)
    }

    // MARK: - Zoom

    override func setZoomMode(_ mode: ZoomMode) {
        guard useNativeBackend else { super.setZoomMode(mode); return }
        nativeVideoSurface.setVideoGravity(mode)
        zoomMode = mode
    }

    override func cycleZoomMode() {
        setZoomMode(zoomMode.next)
    }

    // MARK: - Snapshot

    override func snapshotPlaybackPosition() -> TimeInterval {
        guard useNativeBackend else { return super.snapshotPlaybackPosition() }
        if let renderer = audioRenderer {
            let t = renderer.currentTime
            if t.isFinite && t >= 0 { return t }
        }
        if lastVideoPtsSeconds > 0 { return lastVideoPtsSeconds }
        return currentTime
    }

    // MARK: - Dynamic range

    override func configureDynamicRangeIntent(contentRange: VideoDynamicRange, sinkIsHdrCapable: Bool) {
        nativeRequestedContentRange = contentRange
        self.nativeSinkIsHdrCapable = sinkIsHdrCapable
        nativeVideoSurface.setDynamicRange(contentRange)
        super.configureDynamicRangeIntent(contentRange: contentRange, sinkIsHdrCapable: sinkIsHdrCapable)
    }

    override func configureDolbyVisionMetadata(profile: Int?, level: Int?, blSignalCompatibilityId: Int?) {
        nativeServerDVProfile = profile
        nativeServerDVLevel = level
        nativeServerDVBlSignalCompatibilityId = blSignalCompatibilityId
    }

    override func dynamicRangeTelemetrySnapshot() -> [String: String] {
        guard useNativeBackend else { return super.dynamicRangeTelemetrySnapshot() }
        var snapshot: [String: String] = [
            "native_backend": "active",
            "native_content_range": nativeRequestedContentRange.rawValue,
            "native_sink_hdr_capable": nativeSinkIsHdrCapable ? "true" : "false",
            "native_color_pipeline_restorations": "\(nativeColorPipelineRestoreCount)",
            "native_frame_queue_depth": "\(maxFrameQueueDepth)",
            "native_frame_semaphore_timeout_ms": "\(Int(frameSemaphoreTimeoutSeconds * 1000))",
            "native_frame_semaphore_timeouts": "\(frameSemaphoreTimeoutCount)",
            "native_video_drift_drops": "\(nativeVideoDriftDropCount)",
            "native_video_frame_holds": "\(nativeVideoHoldCount)",
        ]
        if let dv = demuxer?.dvConfig {
            snapshot["native_dv_profile"] = "\(dv.profile)"
            snapshot["native_dv_level"] = "\(dv.level)"
            snapshot["native_bl_compat_id"] = "\(dv.blSignalCompatibilityId)"
        }
        if let decoder = videoDecoder {
            snapshot["native_frames_decoded"] = "\(decoder.decodedCount)"
            snapshot["native_frames_dropped"] = "\(decoder.droppedCount)"
            snapshot["native_decoder_status"] = decoder.hasUnrecoverableError ? "error" : "hardware"
        }
        if let renderer = audioRenderer {
            snapshot["native_audio_samples_rendered"] = "\(renderer.renderedSampleCount)"
            snapshot["native_audio_samples_dropped"] = "\(renderer.droppedSampleCount)"
            snapshot["native_audio_underrun_events"] = "\(renderer.underrunEventCount)"
            snapshot["native_audio_overflow_samples"] = "\(renderer.overflowDroppedSampleCount)"
        }
        return snapshot
    }

    // MARK: - Native playback lifecycle

    private func startNativePlayback(_ url: String, startPosition: TimeInterval) -> Bool {
        guard FFmpegAvailability.isAvailable else {
            Self.lastNativeStartDiagnostic = "no_ffmpeg"
            return false
        }

        teardownNative()

        let demux = FFDemuxer()
        guard demux.isReady else {
            Self.lastNativeStartDiagnostic = "demuxer_not_ready"
            return false
        }
        guard demux.open(url: url) else {
            Self.lastNativeStartDiagnostic = "demux_open_failed"
            return false
        }
        _ = demux.seedDVConfigFromServer(
            profile: nativeServerDVProfile,
            level: nativeServerDVLevel,
            blSignalCompatibilityId: nativeServerDVBlSignalCompatibilityId
        )
        demuxer = demux

        guard demux.videoStreamIndex >= 0 else {
            Self.lastNativeStartDiagnostic = "no_video_stream"
            teardownNative()
            return false
        }

        let videoInfo = demux.streams.first { $0.index == demux.videoStreamIndex }
        guard let videoInfo, let extradata = videoInfo.extradata, !extradata.isEmpty else {
            Self.lastNativeStartDiagnostic = "no_extradata"
            teardownNative()
            return false
        }

        let decoder = VTDecoder()
        guard decoder.configure(extradata: extradata, dvConfig: demux.dvConfig) else {
            Self.lastNativeStartDiagnostic = "decoder_config_failed"
            teardownNative()
            return false
        }
        videoDecoder = decoder
        activeVideoStreamIndex = demux.videoStreamIndex
        videoConfigured = true
        pendingDVReconfigure = (demux.dvConfig == nil)
        videoFrameRate = videoInfo.frameRate > 0 ? videoInfo.frameRate : 24.0
        nativeColorPipelineRestoreCount = 0
        let frameDuration = 1.0 / max(videoFrameRate, 1.0)
        frameSemaphoreTimeoutSeconds = max(0.05, min(frameDuration * 2.0, 0.25))
        nativeVideoDriftDropCount = 0
        nativeVideoHoldCount = 0
        frameSemaphoreTimeoutCount = 0

        if let fmtDesc = decoder.formatDescription {
            activeVideoFormatDescription = fmtDesc
            let fps = Float(videoInfo.frameRate > 0 ? videoInfo.frameRate : 24)
            DisplayCriteriaManager.shared.applyNative(formatDescription: fmtDesc, refreshRate: fps)
            nativeVideoSurface.setFormatDescription(fmtDesc)
        } else {
            activeVideoFormatDescription = nil
        }

        decoder.onFrameDecoded = { [weak self] pixelBuffer, pts in
            self?.handleDecodedFrame(pixelBuffer, pts: pts)
        }
        decoder.onDecoderError = { [weak self] in
            DispatchQueue.main.async {
                self?.handleUnrecoverableError()
            }
        }

        let audio = AudioRenderer()
        if audio.isReady, demux.audioStreamIndex >= 0 {
            let audioInfo = demux.streams.first { $0.index == demux.audioStreamIndex }
            if let audioInfo, let codecpar = demux.codecpar(forStreamIndex: demux.audioStreamIndex) {
                if audio.configure(streamInfo: audioInfo, codecpar: codecpar) {
                    audioRenderer = audio
                    activeAudioStreamIndex = demux.audioStreamIndex
                }
            }
        }

        if let view = playerHostView {
            nativeVideoSurface.attach(to: view)
        }
        nativeVideoSurface.setDynamicRange(nativeRequestedContentRange)

        useNativeBackend = true
        Self.lastNativeStartDiagnostic = "active"
        updatePlaybackBackend(identifier: "native", fallbackReason: nil)

        duration = demux.duration
        state = .opening

        populateTracks(demux)

        if startPosition > 0 {
            pendingStartPosition = startPosition
        }

        firstFrameDelivered = false

        configureAudioSession(installChannelLayoutFix: false)
        if let ar = audioRenderer {
            _ = ar.start()
        }

        registerNativeLifecycleObservers()
        registerMemoryPressureObserver()
        startWatchdog()
        startReadLoop()
        return true
    }

    private func teardownNative() {
        stopWatchdog()
        unregisterNativeLifecycleObservers()
        stopReadLoop()
        audioRenderer?.stop()
        audioRenderer = nil
        videoDecoder?.invalidate()
        videoDecoder = nil
        nativeVideoSurface.setDynamicRange(.unknown)
        nativeVideoSurface.teardown()
        subtitleOverlay.clear()
        subtitleOverlay.removeFromSuperview()
        subtitleDecoder?.close()
        subtitleDecoder = nil
        deactivateAss()
        demuxer?.close()
        demuxer = nil
        useNativeBackend = false
        videoConfigured = false
        firstFrameDelivered = false
        pendingDVReconfigure = false
        resumeGateWorkItem?.cancel()
        resumeGateWorkItem = nil
        resumeAwaitingFirstFrame = false
        activeVideoStreamIndex = -1
        activeAudioStreamIndex = -1
        activeSubtitleStreamIndex = -1
        pendingStartPosition = nil
        seekTarget = nil
        nativePlaybackRate = 1.0
        videoFrameRate = 24.0
        frameSemaphoreTimeoutSeconds = 0.1
        nativeServerDVProfile = nil
        nativeServerDVLevel = nil
        nativeServerDVBlSignalCompatibilityId = nil
        activeVideoFormatDescription = nil
        nativeColorPipelineRestoreCount = 0
        nativeVideoDriftDropCount = 0
        nativeVideoHoldCount = 0
        frameSemaphoreTimeoutCount = 0
        consecutiveReadErrors = 0
        nativeBackgroundPaused = false
        watchdogStallCount = 0
        lastDecodedFrameTime = 0
        lastVideoPtsSeconds = 0
    }

    // MARK: - Read loop

    private func startReadLoop() {
        guard !readLoopRunning else { return }
        readLoopRunning = true
        readLoopPaused = false

        readQueue.async { [weak self] in
            self?.readLoop()
        }
    }

    private func stopReadLoop() {
        readLoopRunning = false
        readLoopPaused = false
        pauseCondition.lock()
        pauseCondition.signal()
        pauseCondition.unlock()
        for _ in 0..<maxFrameQueueDepth {
            frameSemaphore.signal()
        }
    }

    private nonisolated func readLoop() {
        while readLoopRunning {
            pauseCondition.lock()
            let seekRequest = pendingSeekSeconds
            pendingSeekSeconds = nil
            pauseCondition.unlock()
            if let seekRequest {
                _ = demuxer?.seek(to: seekRequest)
            }
            if readLoopPaused || nativeBackgroundPaused {
                pauseCondition.lock()
                while (readLoopPaused || nativeBackgroundPaused) && readLoopRunning {
                    pauseCondition.wait(until: Date(timeIntervalSinceNow: 0.5))
                }
                pauseCondition.unlock()
                continue
            }

            let waitSeconds = max(0.01, self.frameSemaphoreTimeoutSeconds)
            let waitNanoseconds = max(1, Int(waitSeconds * 1_000_000_000))
            let waitResult = frameSemaphore.wait(timeout: .now() + .nanoseconds(waitNanoseconds))
            guard readLoopRunning else { break }
            if waitResult == .timedOut {
                self.frameSemaphoreTimeoutCount += 1
                continue
            }

            let readResult: FFReadResult
            let demux = self.demuxer
            guard let demux else { break }
            readResult = demux.readPacket()

            switch readResult {
            case .packet(let pkt):
                self.consecutiveReadErrors = 0
                processPacket(pkt)

            case .eof:
                DispatchQueue.main.async { [weak self] in
                    self?.handleEOF()
                }
                return

            case .wouldBlock:
                frameSemaphore.signal()
                DispatchQueue.main.async { [weak self] in
                    guard let self, self.useNativeBackend else { return }
                    if case .playing = self.state { self.state = .buffering(0.0) }
                }
                Thread.sleep(forTimeInterval: 0.01)

            case .error(let code):
                frameSemaphore.signal()
                self.consecutiveReadErrors += 1
                let retries = self.consecutiveReadErrors
                if retries > maxReadRetries {
                    nativeLogger.error("demuxer read failed after \(retries) retries, code=\(code)")
                    DispatchQueue.main.async { [weak self] in
                        self?.handleUnrecoverableError()
                    }
                    return
                }
                nativeLogger.warning("demuxer read error code=\(code), retry \(retries)/\(self.maxReadRetries)")
                DispatchQueue.main.async { [weak self] in
                    guard let self, self.useNativeBackend else { return }
                    self.state = .buffering(0.0)
                }
                let delay = min(Double(1 << retries) * 0.1, 2.0)
                Thread.sleep(forTimeInterval: delay)
            }
        }
    }

    private nonisolated func processPacket(_ pkt: FFPacket) {
        let videoIdx = self.activeVideoStreamIndex
        let audioIdx = self.activeAudioStreamIndex
        let subtitleIdx = self.activeSubtitleStreamIndex
        let seekTgt = self.seekTarget
        let pendingStart = self.pendingStartPosition

        if pkt.streamIndex == videoIdx {
            let decoder = self.videoDecoder
            let demuxRef = self.demuxer
            let needsDVCheck = self.pendingDVReconfigure
            guard let decoder, let demuxRef else {
                frameSemaphore.signal()
                return
            }

            if needsDVCheck {
                checkPacketDVConfig(pkt, decoder: decoder, demuxRef: demuxRef)
            }

            let tb = demuxRef.timeBase(forStreamIndex: videoIdx)
            let pts = cmTime(from: pkt.pts, timeBase: tb)
            let dts = cmTime(from: pkt.dts, timeBase: tb)
            let dur = cmTime(from: pkt.duration, timeBase: tb)

            if let target = seekTgt ?? pendingStart, pts != .invalid {
                let ptsSeconds = CMTimeGetSeconds(pts)
                if ptsSeconds < target - 0.5 && !pkt.isKeyframe {
                    frameSemaphore.signal()
                    return
                }
            }

            _ = decoder.decode(
                data: pkt.data!,
                size: Int(pkt.size),
                pts: pts,
                dts: dts,
                duration: dur
            )
        } else if pkt.streamIndex == audioIdx {
            let renderer = self.audioRenderer
            let demuxRef = self.demuxer
            let timeBase = demuxRef?.timeBase(forStreamIndex: audioIdx)
            renderer?.decodePacket(pkt, timeBase: timeBase)
            frameSemaphore.signal()
        } else if subtitleIdx >= 0 && pkt.streamIndex == subtitleIdx {
            let decoder = self.subtitleDecoder
            let demuxRef = self.demuxer
            if let decoder, let demuxRef {
                let tb = demuxRef.timeBase(forStreamIndex: subtitleIdx)
                if let event = decoder.decodePacket(pkt, timeBase: tb) {
                    DispatchQueue.main.async { [weak self] in
                        self?.dispatchSubtitleEvent(event)
                    }
                }
            }
            frameSemaphore.signal()
        } else {
            frameSemaphore.signal()
        }
    }

    private func handleDecodedFrame(_ pixelBuffer: CVPixelBuffer, pts: CMTime) {
        frameSemaphore.signal()
        lastDecodedFrameTime = CFAbsoluteTimeGetCurrent()
        watchdogStallCount = 0

        let ptsSec = CMTimeGetSeconds(pts)
        if ptsSec.isFinite && ptsSec >= 0 { lastVideoPtsSeconds = ptsSec }
        let dur = CMTime(seconds: 1.0 / videoFrameRate, preferredTimescale: 90000)

        let action = evaluateFrameDrift(ptsSec)
        switch action {
        case .drop:
            nativeVideoDriftDropCount += 1
            return
        case .hold(let delay):
            nativeVideoHoldCount += 1
            framePacingQueue.asyncAfter(deadline: .now() + delay) { [weak self] in
                self?.enqueueDecodedFrame(pixelBuffer, pts: pts, duration: dur, ptsSec: ptsSec)
            }
            return
        case .display:
            enqueueDecodedFrame(pixelBuffer, pts: pts, duration: dur, ptsSec: ptsSec)
            return
        }
    }

    private func enqueueDecodedFrame(
        _ pixelBuffer: CVPixelBuffer,
        pts: CMTime,
        duration: CMTime,
        ptsSec: Double
    ) {
        guard useNativeBackend else { return }
        nativeVideoSurface.enqueue(pixelBuffer: pixelBuffer, pts: pts, duration: duration)

        if !firstFrameDelivered {
            firstFrameDelivered = true
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.completeResumeAfterWakeGate()
                if let pending = self.pendingStartPosition {
                    self.pendingStartPosition = nil
                    self.performSeek(to: pending)
                } else {
                    self.state = .playing
                }
            }
        }

        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            if ptsSec.isFinite && ptsSec >= 0 {
                self.currentTime = ptsSec
                self.subtitleOverlay.update(currentTime: ptsSec)
                self.renderAss(atSeconds: ptsSec - self.assDelaySeconds)
                if self.duration > 0 {
                    self.position = Float(max(0, min(1, ptsSec / self.duration)))
                }
            }
            if let st = self.seekTarget, ptsSec >= st - 0.1 {
                self.seekTarget = nil
                self.completeResumeAfterWakeGate()
                self.state = .playing
            } else if case .buffering = self.state, self.seekTarget == nil {
                self.completeResumeAfterWakeGate()
                self.state = .playing
            }
        }
    }

    private enum FrameAction { case display, hold(TimeInterval), drop }

    private func evaluateFrameDrift(_ ptsSec: Double) -> FrameAction {
        guard let renderer = audioRenderer, renderer.currentTime > 0, ptsSec.isFinite else {
            return .display
        }
        let audioClock = renderer.currentTime
        let drift = ptsSec - audioClock
        let frameDuration = 1.0 / max(videoFrameRate, 1.0)
        let adaptiveThreshold = max(0.040, frameDuration * 1.5)

        if drift > adaptiveThreshold {
            let slack = min(0.010, adaptiveThreshold * 0.25)
            let delay = min(max(0, drift - slack), frameDuration * 2.0)
            return .hold(delay)
        } else if drift < -adaptiveThreshold {
            return .drop
        }
        return .display
    }

    private func handleEOF() {
        guard useNativeBackend else { return }
        state = .ended
    }

    private func handleUnrecoverableError() {
        guard useNativeBackend else { return }
        nativeLogger.error("unrecoverable native playback error, falling back")
        let savedTime = currentTime
        let savedUrl = demuxer?.url
        teardownNative()
        if let url = savedUrl {
            Task {
                await super.play(streamUrl: url, startPosition: savedTime)
            }
        } else {
            state = .error
        }
    }

    // MARK: - Seek

    private func performSeek(to seconds: TimeInterval) {
        guard demuxer != nil else { return }
        state = .buffering(0.25)
        seekTarget = seconds
        consecutiveReadErrors = 0
        lastVideoPtsSeconds = 0
        firstFrameDelivered = false

        videoDecoder?.flush()
        videoDecoder?.resetErrorState()
        nativeVideoSurface.flush()
        audioRenderer?.flush()
        subtitleOverlay.clear()
        subtitleDecoder?.flush()
        assRenderer.reset()

        pauseCondition.lock()
        pendingSeekSeconds = seconds
        pauseCondition.signal()
        pauseCondition.unlock()
        if !readLoopRunning {
            readLoopRunning = true
            readQueue.async { [weak self] in self?.readLoop() }
        }
    }

    // MARK: - Track switching

    private func switchAudioTrack(_ trackIndex: Int32) {
        guard let demuxer, let audioRenderer else {
            currentAudioTrackIndex = trackIndex
            return
        }

        guard let streamIndex = ffmpegStreamIndex(forOrdinal: trackIndex, in: audioStreamIndices),
              let streamInfo = demuxer.streams.first(where: { $0.index == streamIndex && $0.type == .audio }),
              let codecpar = demuxer.codecpar(forStreamIndex: streamIndex) else {
            currentAudioTrackIndex = trackIndex
            return
        }

        if audioRenderer.setAudioTrack(streamInfo: streamInfo, codecpar: codecpar) {
            activeAudioStreamIndex = streamIndex
            currentAudioTrackIndex = trackIndex
        }
    }

    // MARK: - Track population

    private func populateTracks(_ demux: FFDemuxer) {
        var audioList: [PlayerTrack] = []
        var subtitleList: [PlayerTrack] = []

        for stream in demux.streams {
            switch stream.type {
            case .audio:
                audioList.append(makeTrack(from: stream))
            case .subtitle:
                subtitleList.append(makeTrack(from: stream))
            default:
                break
            }
        }

        audioTracks = audioList
        subtitleTracks = subtitleList
        audioStreamIndices = audioList.map { $0.id }
        subtitleStreamIndices = subtitleList.map { $0.id }

        if demux.audioStreamIndex >= 0,
           let position = audioStreamIndices.firstIndex(of: demux.audioStreamIndex) {
            currentAudioTrackIndex = Int32(position + 1)
        }
    }

    private func ffmpegStreamIndex(forOrdinal ordinal: Int32, in indices: [Int32]) -> Int32? {
        let pos = Int(ordinal) - 1
        guard pos >= 0, pos < indices.count else { return nil }
        return indices[pos]
    }

    private func makeTrack(from stream: FFStreamInfo) -> PlayerTrack {
        var parts: [String] = []
        if let title = stream.title?.trimmingCharacters(in: .whitespacesAndNewlines), !title.isEmpty {
            parts.append(title)
        }
        if let lang = stream.language?.trimmingCharacters(in: .whitespacesAndNewlines), !lang.isEmpty,
           !parts.contains(lang) {
            parts.append(lang)
        }
        if stream.isDefault {
            parts.append("Default")
        }

        let name = parts.isEmpty ? "Track \(Int(stream.index))" : parts.joined(separator: " - ")

        let codec: String? = {
            switch stream.type {
            case .audio:
                return codecName(for: stream.codecId, type: .audio)
            case .subtitle:
                return codecName(for: stream.codecId, type: .subtitle)
            default:
                return nil
            }
        }()

        return PlayerTrack(
            id: stream.index,
            name: name,
            language: stream.language,
            title: stream.title,
            isDefault: stream.isDefault,
            isForced: false,
            codec: codec
        )
    }

    private func codecName(for codecId: UInt32, type: FFStreamType) -> String? {
        switch type {
        case .audio:
            switch codecId {
            case 0x15001: return "aac"
            case 0x15002: return "ac3"
            case 0x15003: return "dts"
            case 0x15004: return "vorbis"
            case 0x15005: return "mp2"
            case 0x15006: return "mp3"
            case 0x15007: return "pcm"
            case 0x15010: return "flac"
            case 0x15008: return "alac"
            case 0x15015: return "eac3"
            case 0x15016: return "opus"
            case 0x1501B: return "truehd"
            default: return nil
            }
        case .subtitle:
            switch codecId {
            case 0x17000: return "srt"
            case 0x17002: return "ass"
            case 0x17003: return "ssa"
            case 0x17005: return "mov_text"
            case 0x17006: return "hdmv_pgs"
            case 0x17008: return "dvb_sub"
            case 0x1700C: return "webvtt"
            default: return nil
            }
        default:
            return nil
        }
    }

    // MARK: - Lifecycle observers

    private func registerNativeLifecycleObservers() {
        let center = NotificationCenter.default

        nativeLifecycleObservers.append(
            center.addObserver(
                forName: UIApplication.willResignActiveNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                MainActor.assumeIsolated {
                    guard let self, self.useNativeBackend else { return }
                    self.nativeBackgroundPaused = true
                    if let formatDescription = self.videoDecoder?.formatDescription ?? self.activeVideoFormatDescription {
                        self.activeVideoFormatDescription = formatDescription
                    }
                    self.audioRenderer?.pause()
                    self.resumeGateWorkItem?.cancel()
                    self.resumeGateWorkItem = nil
                    self.resumeAwaitingFirstFrame = false
                    self.nativeVideoSurface.flush()
                }
            }
        )

        nativeLifecycleObservers.append(
            center.addObserver(
                forName: UIApplication.didBecomeActiveNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                MainActor.assumeIsolated {
                    guard let self, self.useNativeBackend, self.nativeBackgroundPaused else { return }
                    self.nativeBackgroundPaused = false
                    self.pauseCondition.lock()
                    self.pauseCondition.signal()
                    self.pauseCondition.unlock()
                    self.restoreNativeDisplayPipelineAfterWake(force: true)
                    if case .playing = self.state {
                        self.beginResumeAfterWakeGate()
                        let resumePoint = max(0, self.snapshotPlaybackPosition())
                        self.performSeek(to: resumePoint)
                    }
                }
            }
        )

        nativeLifecycleObservers.append(
            center.addObserver(
                forName: UIScreen.didConnectNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                MainActor.assumeIsolated {
                    guard let self, self.useNativeBackend else { return }
                    self.restoreNativeDisplayPipelineAfterWake()
                }
            }
        )
    }

    private func restoreNativeDisplayPipelineAfterWake(force: Bool = false) {
        guard useNativeBackend else { return }

        let now = CFAbsoluteTimeGetCurrent()
        if !force, now - lastNativeWakeRestoreAt < nativeWakeRestoreThrottleInterval {
            return
        }
        lastNativeWakeRestoreAt = now

        if let formatDescription = videoDecoder?.formatDescription ?? activeVideoFormatDescription {
            activeVideoFormatDescription = formatDescription
            let refreshRate = Float(videoFrameRate > 0 ? videoFrameRate : 24)
            DisplayCriteriaManager.shared.applyNative(formatDescription: formatDescription, refreshRate: refreshRate)
            nativeVideoSurface.setFormatDescription(formatDescription)
        }

        nativeVideoSurface.setDynamicRange(nativeRequestedContentRange)
        nativeVideoSurface.primeAfterWake()
        nativeColorPipelineRestoreCount += 1
    }

    private func beginResumeAfterWakeGate() {
        resumeAwaitingFirstFrame = true
        firstFrameDelivered = false
        state = .buffering(0.25)

        resumeGateWorkItem?.cancel()
        let workItem = DispatchWorkItem { [weak self] in
            guard let self, self.resumeAwaitingFirstFrame else { return }
            self.completeResumeAfterWakeGate()
            self.state = .playing
        }
        resumeGateWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + Self.resumeFirstFrameTimeout, execute: workItem)
    }

    private func completeResumeAfterWakeGate() {
        guard resumeAwaitingFirstFrame else { return }
        resumeAwaitingFirstFrame = false
        resumeGateWorkItem?.cancel()
        resumeGateWorkItem = nil
        audioRenderer?.resume()
    }

    private func unregisterNativeLifecycleObservers() {
        let center = NotificationCenter.default
        for observer in nativeLifecycleObservers {
            center.removeObserver(observer)
        }
        nativeLifecycleObservers.removeAll()
    }

    // MARK: - Packet DV config

    private nonisolated func checkPacketDVConfig(_ pkt: FFPacket, decoder: VTDecoder, demuxRef: FFDemuxer) {
        let doviConfType: Int32 = 23
        guard let sd = pkt.sideData.first(where: { $0.type == doviConfType }), sd.data.count >= 5 else {
            self.pendingDVReconfigure = false
            return
        }
        let d = sd.data
        let dv = DVConfiguration(
            versionMajor: d[0],
            versionMinor: d[1],
            profile: d[2] >> 1,
            level: ((d[2] & 0x01) << 5) | (d[3] >> 3),
            rpuPresent: (d[3] & 0x04) != 0,
            elPresent: (d[3] & 0x02) != 0,
            blPresent: (d[3] & 0x01) != 0,
            blSignalCompatibilityId: d[4] >> 4,
            mdCompression: d[4] & 0x0F
        )
        self.pendingDVReconfigure = false
        self.demuxer?.setDVConfigFromPacket(dv)
        let videoIdx = self.activeVideoStreamIndex
        if let extradata = demuxRef.streams.first(where: { $0.index == videoIdx })?.extradata {
            _ = decoder.configure(extradata: extradata, dvConfig: dv)
        }
    }

    // MARK: - Watchdog

    private func startWatchdog() {
        stopWatchdog()
        lastDecodedFrameTime = CFAbsoluteTimeGetCurrent()
        watchdogStallCount = 0
        watchdogTimer = Timer.scheduledTimer(withTimeInterval: Self.watchdogInterval, repeats: true) { [weak self] _ in
            Task { @MainActor in
                self?.checkWatchdog()
            }
        }
    }

    private func stopWatchdog() {
        watchdogTimer?.invalidate()
        watchdogTimer = nil
    }

    private func checkWatchdog() {
        guard useNativeBackend, state == .playing else { return }
        let elapsed = CFAbsoluteTimeGetCurrent() - lastDecodedFrameTime
        guard elapsed > Self.watchdogStallThreshold else { return }
        watchdogStallCount += 1
        nativeLogger.warning("watchdog: no frames decoded for \(String(format: "%.1f", elapsed))s (stall \(self.watchdogStallCount)/\(Self.watchdogMaxStalls))")
        if watchdogStallCount >= Self.watchdogMaxStalls {
            handleUnrecoverableError()
        }
    }

    // MARK: - Memory pressure

    private func registerMemoryPressureObserver() {
        nativeLifecycleObservers.append(
            NotificationCenter.default.addObserver(
                forName: UIApplication.didReceiveMemoryWarningNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                MainActor.assumeIsolated {
                    guard let self, self.useNativeBackend else { return }
                    self.nativeLogger.warning("memory pressure: flushing decoder reorder buffer")
                    self.videoDecoder?.flush()
                }
            }
        )
    }

    // MARK: - Helpers

    private nonisolated func cmTime(from value: Int64, timeBase: (num: Int32, den: Int32)) -> CMTime {
        guard value != Int64(bitPattern: 0x8000000000000000) else { return .invalid }
        let seconds = Double(value) * Double(timeBase.num) / Double(timeBase.den)
        return CMTime(seconds: seconds, preferredTimescale: 90000)
    }
}
