import AVFoundation
import AetherEngine
import VideoToolbox
#if canImport(Flutter)
import Flutter
#elseif canImport(FlutterMacOS)
import FlutterMacOS
#endif
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Playback channel driving the shared AetherPlayerWrapper for the Flutter
/// player on iOS, macOS and tvOS.
/// One wrapper lives for the app's lifetime while video surfaces attach and
/// detach around it, so background audio and PiP survive a route pop.
@MainActor
final class AetherVideoChannel: NSObject, FlutterStreamHandler {
    private let control: FlutterMethodChannel
    private let events: FlutterEventChannel
    private nonisolated(unsafe) var eventSink: FlutterEventSink?

    private var playerCreated = false

    private(set) lazy var player: AetherPlayerWrapper = {
        let created = AetherPlayerWrapper()
        created.onPlayerError = { [weak self] payload in
            self?.send(payload)
        }
        created.onNowPlayingCommand = { [weak self] payload in
            self?.send(payload)
        }
        self.playerCreated = true
        return created
    }()

    /// The wrapper if something has already asked for it, so PiP can look for
    /// a layer without building a player nobody is using.
    var playerIfCreated: AetherPlayerWrapper? { playerCreated ? player : nil }

    private var stateTimer: Timer?
    private var lastTextTrackCount = -1
    private var lastClosedCaptionCount = -1
    private var didComplete = false
    private var didReportTerminalError = false
    #if os(iOS)
        private var volumeObservation: NSKeyValueObservation?
    #endif

    init(messenger: FlutterBinaryMessenger) {
        control = FlutterMethodChannel(
            name: "moonfin/ios_aether_control", binaryMessenger: messenger)
        events = FlutterEventChannel(
            name: "moonfin/ios_aether_events", binaryMessenger: messenger)
        super.init()
        control.setMethodCallHandler { [weak self] call, result in
            if call.method == "getCapabilities" {
                #if os(tvOS)
                // An Apple TV can be plugged into any screen, so this asks the
                // display rather than assuming HDR the way a phone can.
                result(VideoCapabilityDetector.deviceProfileCapabilities())
                #else
                result(AetherVideoCapabilities.deviceProfileCapabilities())
                #endif
                return
            }
            result(nil)
            Task { @MainActor in self?.handle(call) }
        }
        events.setStreamHandler(self)
        #if os(iOS)
            volumeObservation = AVAudioSession.sharedInstance().observe(
                \.outputVolume, options: [.new]
            ) { [weak self] _, change in
                guard let volume = change.newValue else { return }
                Task { @MainActor in
                    self?.send(["event": "systemVolume", "value": Double(volume)])
                }
            }
        #endif
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
        switch call.method {
        case "setSource":
            setSource(args)
        case "play":
            player.resume()
        case "pause":
            player.pause()
        case "stop":
            player.stop()
            stopStateTimer()
        case "seek":
            player.seek(to: ms(args["positionMs"]))
        case "setSpeed":
            player.setRate((args["speed"] as? NSNumber)?.floatValue ?? 1.0)
        case "setVolume":
            let volume = (args["volume"] as? NSNumber)?.floatValue ?? 100
            player.setUserVolume(volume / 100.0)
        case "setAudioTrack":
            player.setAudioTrack((args["index"] as? NSNumber)?.int32Value ?? -1)
        case "setSubtitleTrack":
            let isExternal = (args["isExternalSubtitle"] as? Bool) == true
            let externalUrl = isExternal ? args["externalSubtitleUrl"] as? String : nil
            // The player keys its external tracks by the url addExternalSubtitle built,
            // and a downloaded sidecar comes back here as the bare path it was added
            // with, so it takes the same conversion or the lookup misses.
            player.selectSubtitleTrack(
                (args["index"] as? NSNumber)?.int32Value ?? -1,
                externalUrl: externalUrl.flatMap { urlFrom($0)?.absoluteString } ?? externalUrl
            )
        case "addExternalSubtitle":
            if let urlString = args["url"] as? String, let url = urlFrom(urlString) {
                player.addSubtitle(
                    url: url,
                    title: args["title"] as? String,
                    language: args["language"] as? String)
            }
        case "setClosedCaptionTrack":
            player.setClosedCaptionTrack((args["id"] as? NSNumber)?.int32Value ?? 0)
        case "disableSubtitleTrack":
            player.disableSubtitles()
        case "setSecondarySubtitle":
            player.setSecondarySubtitle(
                embeddedTrackId: (args["embeddedTrackId"] as? NSNumber)?.intValue,
                url: (args["url"] as? String).flatMap { urlFrom($0) })
        case "setSecondarySubtitleDelay":
            player.setSecondarySubtitleDelay(ms(args["delayMs"]))
        case "configureSecondarySubtitleStyle":
            player.configureSecondarySubtitleStyle(
                fontSize: (args["fontSize"] as? NSNumber)?.doubleValue,
                verticalOffset: (args["verticalOffset"] as? NSNumber)?.doubleValue,
                textColor: (args["textColor"] as? NSNumber)?.intValue)
        case "setAudioDelay":
            player.setAudioDelay(ms(args["delayMs"]))
        case "setSubtitleDelay":
            player.setSubtitleDelay(ms(args["delayMs"]))
        case "configureSubtitleStyle":
            player.applySubtitleStyle(
                textColor: (args["textColor"] as? NSNumber)?.intValue,
                backgroundColor: (args["backgroundColor"] as? NSNumber)?.intValue,
                strokeColor: (args["strokeColor"] as? NSNumber)?.intValue,
                fontSize: (args["fontSize"] as? NSNumber)?.doubleValue,
                fontWeight: (args["fontWeight"] as? NSNumber)?.intValue,
                verticalOffset: (args["verticalOffset"] as? NSNumber)?.doubleValue)
        case "setAllowUntrustedTls":
            EngineTLS.serverTrustEvaluator = EngineTrustPolicy.evaluator(from: args)
        case "setClientCertificates":
            ClientIdentityStore.setClientCertificates(
                (args["certificates"] as? [[String: Any]]) ?? [])
        case "setSubtitleRendererMode":
            // The host overlay is the only subtitle renderer on this path.
            break
        case "setEngineLogForwarding":
            setEngineLogForwarding((args["enabled"] as? Bool) == true)
        case "setUiMetadata":
            player.applyNowPlayingMetadata(args)
        default:
            break
        }
    }

    /// Engine lines otherwise only reach the device console, which a remote
    /// user cannot capture, so a report says nothing about what the reader and
    /// demuxer saw before the failure.
    ///
    /// The sink only accepts calls from the platform thread and the engine logs
    /// from whichever thread did the work, so every line hops before it is sent.
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

    private func ms(_ value: Any?) -> TimeInterval {
        ((value as? NSNumber)?.doubleValue ?? 0) / 1000.0
    }

    private func urlFrom(_ string: String) -> URL? {
        string.hasPrefix("/") ? URL(fileURLWithPath: string) : URL(string: string)
    }

    private func setSource(_ args: [String: Any]) {
        guard let url = args["url"] as? String else { return }
        didComplete = false
        didReportTerminalError = false
        lastTextTrackCount = -1
        lastClosedCaptionCount = -1

        var headers: [String: String] = [:]
        if let raw = args["headers"] as? [String: Any] {
            for (key, value) in raw { headers[key] = "\(value)" }
        }
        player.configureSource(
            AetherPlayerWrapper.SourceConfiguration(
                headers: headers,
                isLive: (args["isLive"] as? Bool) ?? false,
                autoPlay: (args["autoPlay"] as? Bool) ?? true,
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

        let audioOnly = (args["mediaType"] as? String) == "audio"
        let startMs = (args["startPositionMs"] as? NSNumber)?.doubleValue ?? 0
        startStateTimer()
        Task {
            await player.play(
                streamUrl: url, startPosition: startMs / 1000.0, audioOnly: audioOnly)
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

    private func pushState() {
        let p = player
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

        var state: [String: Any] = [
            "event": "state",
            "positionMs": Int((p.currentTime * 1000).rounded()),
            "durationMs": Int((p.duration * 1000).rounded()),
            "bufferedMs": Int((p.duration * Double(p.bufferProgress) * 1000).rounded()),
            "isPlaying": isPlaying,
            "isBuffering": isBuffering,
            "isSubtitleLoading": p.isSubtitleLoading,
        ]
        if let range = p.seekableLiveRange {
            state["liveWindowStartMs"] = Int((range.lowerBound * 1000).rounded())
            state["liveEdgeMs"] = Int((range.upperBound * 1000).rounded())
        }
        send(state)

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

/// Device-profile capabilities for AetherEngine. HEVC and H.264 decode in
/// hardware everywhere this builds. AV1 has hardware on the newest chips with
/// software dav1d covering the rest, and VP9, MPEG-2, VC-1 and interlaced
/// H.264 route through the engine's software path.
///
/// Every iOS device that reaches the deployment floor has an HDR capable
/// screen. A Mac may be driving anything, so there HDR and Dolby Vision are
/// advertised only when the display has the headroom to show them, and an SDR
/// monitor gets a tone mapped transcode instead.
enum AetherVideoCapabilities {
    private static var displaySupportsHdr: Bool {
        #if os(macOS)
            guard let screen = NSScreen.main else { return false }
            return screen.maximumPotentialExtendedDynamicRangeColorComponentValue > 1.0
        #else
            return true
        #endif
    }

    private static var deviceModel: String {
        #if os(macOS)
            return "Mac"
        #else
            return UIDevice.current.model
        #endif
    }

    // Even an M1 decodes heavy 4K HDR10 AV1 at about 2.9x real time, so Apple
    // Silicon Macs and M1 or M2 iPads lift the 1080p SDR cap. Those iPads are
    // the only iOS devices with 8 GB or more and no AV1 hardware. iOS reports a
    // little under the real size, which is why the check is 7 GB.
    private static var softwareAv1HandlesUhd: Bool {
        #if os(macOS) && arch(arm64)
            return true
        #elseif os(iOS)
            return ProcessInfo.processInfo.physicalMemory >= 7 << 30
        #else
            return false
        #endif
    }

    static func deviceProfileCapabilities() -> [String: Any] {
        let hardwareAv1 = VTIsHardwareDecodeSupported(kCMVideoCodecType_AV1)
        let fullAv1 = hardwareAv1 || softwareAv1HandlesUhd
        let av1Width = fullAv1 ? 3840 : 1920
        let av1Height = fullAv1 ? 2160 : 1080
        let hdr = displaySupportsHdr
        return [
            "supportsAvc": true,
            "avcMainLevel": 52,
            "supportsAvcHigh10": true,
            "avcHigh10Level": 52,
            "supportsHevc": true,
            "hevcMainLevel": 153,
            "supportsHevcMain10": true,
            "hevcMain10Level": 153,
            "supportsHevcDolbyVision": hdr,
            "supportsHevcDolbyVisionEl": hdr,
            "supportsHevcHdr10": hdr,
            "supportsHevcHdr10Plus": hdr,
            "supportsDvP5": hdr,
            "supportsDvP7": hdr,
            "supportsDvP8": hdr,
            "knownHevcDoviHdr10PlusBug": false,
            "supportsVc1": true,
            "supportsAv1": true,
            "supportsAv1Main10": true,
            "supportsAv1Hdr10": fullAv1 && hdr,
            "supportsAv1Hdr10Plus": false,
            "supportsAv1DolbyVision": false,
            "maxResolutionAvc": ["width": 3840, "height": 2160],
            "maxResolutionHevc": ["width": 3840, "height": 2160],
            "maxResolutionAv1": ["width": av1Width, "height": av1Height],
            "maxResolutionVc1": ["width": 1920, "height": 1080],
            "deviceModel": deviceModel,
        ]
    }
}
