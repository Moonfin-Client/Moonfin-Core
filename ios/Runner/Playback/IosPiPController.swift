import AVFoundation
import AVKit
import Combine
import Flutter
import UIKit
import AetherEngine

/// Picture-in-Picture for the AetherEngine backend.
///
/// Native path: the engine plays through AVPlayer inside the wrapper's render
/// view, so find its `AVPlayerLayer` and build
/// `AVPictureInPictureController(playerLayer:)`. The engine republishes
/// `currentAVPlayer` on every internal reload (audio switch, AirPlay toggle,
/// recovery), and a controller bound to the previous player shows a black PiP
/// window, so the controller is rebuilt on every republish.
///
/// Software path (VP9 / MPEG-2 / VC-1 / software AV1): the engine publishes
/// `softwarePiPSource` (an `AVSampleBufferDisplayLayer` + transport answers)
/// exactly for this, so build a sample-buffer content source around it.
///
/// Keeps the channel name `org.moonfin.ios/pip` and the inbound Dart contract
/// (`onPiPChanged` / `onPiPAction` / `onScreenLock`) from the previous
/// implementation, plus a new inbound `onPipReady` that arms the Dart side.
@MainActor
final class IosPiPController: NSObject {
    private let channel: FlutterMethodChannel
    private let wrapperProvider: () -> AetherPlayerWrapper?
    private var cancellables = Set<AnyCancellable>()

    private var pipController: AVPictureInPictureController?
    private var boundPlayer: AVPlayer?
    private var boundSoftwareSource: SoftwarePiPSource?
    private var reportedReady = false
    private weak var nativeSubtitleWrapper: AetherPlayerWrapper?

    /// The provider answers with whichever wrapper is hosting the engine right
    /// now, since the Flutter player and the native player each have their own.
    init(
        messenger: FlutterBinaryMessenger,
        wrapperProvider: @escaping () -> AetherPlayerWrapper?,
        engine: AetherEngine?
    ) {
        channel = FlutterMethodChannel(
            name: "org.moonfin.ios/pip", binaryMessenger: messenger)
        self.wrapperProvider = wrapperProvider
        super.init()

        channel.setMethodCallHandler { [weak self] call, result in
            Task { @MainActor in
                self?.handle(call, result: result)
            }
        }

        guard let engine else { return }
        engine.$currentAVPlayer
            .receive(on: DispatchQueue.main)
            .sink { [weak self] player in self?.rebindNative(player: player) }
            .store(in: &cancellables)
        engine.$softwarePiPSource
            .receive(on: DispatchQueue.main)
            .sink { [weak self] source in self?.rebindSoftware(source: source) }
            .store(in: &cancellables)

        NotificationCenter.default.addObserver(
            self, selector: #selector(onLock),
            name: UIApplication.protectedDataWillBecomeUnavailableNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self, selector: #selector(onUnlock),
            name: UIApplication.protectedDataDidBecomeAvailableNotification,
            object: nil)
    }

    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "initialize", "configureSharedContextBridge":
            // No-ops kept for channel compatibility. Readiness now arrives
            // through onPipReady.
            result(nil)
        case "startPiP":
            if let pip = pipController, pip.isPictureInPicturePossible {
                pip.startPictureInPicture()
                result(nil)
            } else {
                result(
                    FlutterError(
                        code: "pip_unavailable", message: "No PiP source", details: nil))
            }
        case "dismissPiP":
            pipController?.stopPictureInPicture()
            result(nil)
        case "updateTimeline", "updatePlaybackState":
            // AVPlayer owns the PiP timeline now.
            result(nil)
        default:
            result(nil)
        }
    }

    // MARK: - Source binding

    /// Switching between the Flutter player and the native player moves the
    /// engine into another view, which leaves the controller bound to a layer
    /// that's gone. Rebuilding from the engine's current output finds the new one.
    func rebind() {
        guard let engine = AetherPlayerWrapper.sharedEngine() else { return }
        teardownController()
        boundPlayer = nil
        boundSoftwareSource = nil
        if let source = engine.softwarePiPSource {
            rebindSoftware(source: source)
        } else {
            rebindNative(player: engine.currentAVPlayer)
        }
    }

    private func rebindNative(player: AVPlayer?) {
        guard let player else {
            if boundPlayer != nil {
                teardownController()
                boundPlayer = nil
            }
            return
        }
        boundSoftwareSource = nil
        guard player !== boundPlayer || pipController == nil else { return }
        boundPlayer = player
        teardownController()

        guard let layer = findPlayerLayer(for: player) else {
            // The layer may not be hosted yet, so retry on the next runloop
            // turn after the engine attaches it.
            DispatchQueue.main.async { [weak self] in
                guard let self, self.boundPlayer === player else { return }
                if let layer = self.findPlayerLayer(for: player) {
                    self.buildController(playerLayer: layer)
                }
            }
            return
        }
        buildController(playerLayer: layer)
    }

    private func rebindSoftware(source: SoftwarePiPSource?) {
        guard let source else {
            if boundSoftwareSource != nil {
                teardownController()
                boundSoftwareSource = nil
            }
            return
        }
        boundPlayer = nil
        boundSoftwareSource = source
        teardownController()
        let contentSource = AVPictureInPictureController.ContentSource(
            sampleBufferDisplayLayer: source.layer, playbackDelegate: self)
        let pip = AVPictureInPictureController(contentSource: contentSource)
        configure(pip)
    }

    private func buildController(playerLayer: AVPlayerLayer) {
        guard AVPictureInPictureController.isPictureInPictureSupported() else { return }
        guard let pip = AVPictureInPictureController(playerLayer: playerLayer) else {
            return
        }
        configure(pip)
    }

    private func configure(_ pip: AVPictureInPictureController) {
        pip.delegate = self
        pip.canStartPictureInPictureAutomaticallyFromInline = true
        pipController = pip
        if !reportedReady {
            reportedReady = true
            channel.invokeMethod("onPipReady", arguments: nil)
        }
    }

    private func teardownController() {
        if let pip = pipController {
            // didStop may already be queued when a rebind removes the old
            // delegate. Clear its recorded state before identity guards reject
            // that obsolete callback.
            if pip.isPictureInPictureActive || AetherPlayerWrapper.sharedEngine()?.pictureInPictureActive == true {
                AetherPlayerWrapper.sharedEngine()?.pictureInPictureActive = false
                channel.invokeMethod("onPiPChanged", arguments: false)
            }
            restoreInlineSubtitles()
        }
        pipController?.delegate = nil
        pipController = nil
    }

    private func prepareNativeSubtitles(for pip: AVPictureInPictureController) {
        guard pipController === pip else { return }
        restoreInlineSubtitles()
        // The new native controller may exist before it takes over playback from Flutter.
        // Hide the overlay on the player that currently owns playback, and remember that
        // player so we can restore its overlay when PiP ends.
        let wrapper = AetherPlayerWrapper.activePlaybackOwner ?? wrapperProvider()
        nativeSubtitleWrapper = wrapper
        wrapper?.setNativeSubtitlePresentationRequired(true)
    }

    private func restoreInlineSubtitles() {
        let wrapper = nativeSubtitleWrapper
        nativeSubtitleWrapper = nil
        wrapper?.setNativeSubtitlePresentationRequired(false)
    }

    private func findPlayerLayer(for player: AVPlayer) -> AVPlayerLayer? {
        guard let root = wrapperProvider()?.renderView.layer else { return nil }
        return Self.firstPlayerLayer(in: root, matching: player)
    }

    private static func firstPlayerLayer(
        in layer: CALayer, matching player: AVPlayer
    ) -> AVPlayerLayer? {
        if let playerLayer = layer as? AVPlayerLayer, playerLayer.player === player {
            return playerLayer
        }
        for sublayer in layer.sublayers ?? [] {
            if let found = firstPlayerLayer(in: sublayer, matching: player) {
                return found
            }
        }
        return nil
    }

    // MARK: - Screen lock

    @objc private func onLock() {
        channel.invokeMethod("onScreenLock", arguments: true)
    }

    @objc private func onUnlock() {
        channel.invokeMethod("onScreenLock", arguments: false)
    }
}

extension IosPiPController: AVPictureInPictureControllerDelegate {
    nonisolated func pictureInPictureControllerWillStartPictureInPicture(
        _ pictureInPictureController: AVPictureInPictureController
    ) {
        Task { @MainActor in
            prepareNativeSubtitles(for: pictureInPictureController)
        }
    }

    nonisolated func pictureInPictureControllerDidStartPictureInPicture(
        _ pictureInPictureController: AVPictureInPictureController
    ) {
        Task { @MainActor in
            guard pipController === pictureInPictureController else { return }
            AetherPlayerWrapper.sharedEngine()?.pictureInPictureActive = true
            channel.invokeMethod("onPiPChanged", arguments: true)
        }
    }

    nonisolated func pictureInPictureControllerDidStopPictureInPicture(
        _ pictureInPictureController: AVPictureInPictureController
    ) {
        Task { @MainActor in
            guard pipController === pictureInPictureController else { return }
            AetherPlayerWrapper.sharedEngine()?.pictureInPictureActive = false
            restoreInlineSubtitles()
            wrapperProvider()?.nowPlaying.reclaim()
            channel.invokeMethod("onPiPChanged", arguments: false)
        }
    }

    nonisolated func pictureInPictureController(
        _ pictureInPictureController: AVPictureInPictureController,
        failedToStartPictureInPictureWithError error: Error
    ) {
        Task { @MainActor in
            guard pipController === pictureInPictureController else { return }
            restoreInlineSubtitles()
        }
    }

    nonisolated func pictureInPictureController(
        _ pictureInPictureController: AVPictureInPictureController,
        restoreUserInterfaceForPictureInPictureStopWithCompletionHandler
            completionHandler: @escaping (Bool) -> Void
    ) {
        Task { @MainActor in
            channel.invokeMethod("onPiPAction", arguments: "restore")
            completionHandler(true)
        }
    }
}

extension IosPiPController: AVPictureInPictureSampleBufferPlaybackDelegate {
    nonisolated func pictureInPictureController(
        _ pictureInPictureController: AVPictureInPictureController, setPlaying playing: Bool
    ) {
        Task { @MainActor in
            boundSoftwareSource?.setPlaying(playing)
        }
    }

    nonisolated func pictureInPictureControllerTimeRangeForPlayback(
        _ pictureInPictureController: AVPictureInPictureController
    ) -> CMTimeRange {
        MainActor.assumeIsolated {
            boundSoftwareSource?.timeRange()
                ?? CMTimeRange(start: .negativeInfinity, duration: .positiveInfinity)
        }
    }

    nonisolated func pictureInPictureControllerIsPlaybackPaused(
        _ pictureInPictureController: AVPictureInPictureController
    ) -> Bool {
        MainActor.assumeIsolated {
            boundSoftwareSource?.isPaused ?? true
        }
    }

    nonisolated func pictureInPictureController(
        _ pictureInPictureController: AVPictureInPictureController,
        didTransitionToRenderSize newRenderSize: CMVideoDimensions
    ) {}

    nonisolated func pictureInPictureController(
        _ pictureInPictureController: AVPictureInPictureController,
        skipByInterval skipInterval: CMTime,
        completion completionHandler: @escaping () -> Void
    ) {
        Task { @MainActor in
            boundSoftwareSource?.skip(by: skipInterval.seconds)
            completionHandler()
        }
    }
}
