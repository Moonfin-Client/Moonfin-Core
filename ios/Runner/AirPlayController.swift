import AVFoundation
import AVKit
import MediaPlayer
import UIKit

final class AirPlayController {
    private var eventSink: FlutterEventSink?
    private(set) var isActive = false
    private var playbackState = "idle"
    private var latestPositionTicks: Int64 = 0

    private var avPlayer: AVPlayer?
    private var playerViewController: AVPlayerViewController?
    private var avPlayerTimeObserver: Any?
    private var externalPlaybackObserver: NSKeyValueObservation?
    private var playerItemStatusObserver: NSKeyValueObservation?
    private var playerItemFailedObserver: NSObjectProtocol?
    private var currentStreamURL: URL?
    private var hasRetriedCurrentStream = false
    private var streamStartPositionSeconds: Double = 0
    private var pendingTitle: String = ""
    private var pendingPositionSeconds: Double = 0
    private var remoteCommandTargets: [(MPRemoteCommand, Any)] = []

    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleRouteChange(_:)),
            name: AVAudioSession.routeChangeNotification,
            object: nil
        )
        refreshRouteStatus()
    }

    deinit {
        stopNativePlayer()
        NotificationCenter.default.removeObserver(self)
        teardownRemoteCommands()
    }

    // MARK: - Native AirPlay playback (detail-screen cast)

    func presentPlayerForAirPlay(
        urlString: String,
        title: String,
        positionSeconds: Double,
        from presenter: UIViewController
    ) {
        pendingTitle = title
        pendingPositionSeconds = positionSeconds

        // Take over the system transport controls only while casting.
        setupRemoteCommands()

        guard let url = URL(string: urlString) else { return }

        stopNativePlayer()
        currentStreamURL = url
        hasRetriedCurrentStream = false
        streamStartPositionSeconds = positionSeconds

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {}

        let playerItem = AVPlayerItem(url: url)
        let player = AVPlayer(playerItem: playerItem)
        player.allowsExternalPlayback = true
        player.usesExternalPlaybackWhileExternalScreenIsActive = true
        avPlayer = player
        attachPlayerItemDebugObservers(playerItem)

        let pvc = AVPlayerViewController()
        pvc.player = player
        pvc.allowsPictureInPicturePlayback = false
        pvc.modalPresentationStyle = .fullScreen
        playerViewController = pvc

        externalPlaybackObserver = player.observe(\.isExternalPlaybackActive, options: [.new]) { [weak self] player, _ in
            guard let self else { return }
            DispatchQueue.main.async {
                if player.isExternalPlaybackActive {
                    self.onVideoAirPlayActivated()
                } else {
                    self.onVideoAirPlayDeactivated()
                }
            }
        }

        avPlayerTimeObserver = player.addPeriodicTimeObserver(
            forInterval: CMTime(seconds: 1, preferredTimescale: 600),
            queue: .main
        ) { [weak self] time in
            guard let self, self.avPlayer != nil else { return }
            let absoluteSeconds = time.seconds + self.streamStartPositionSeconds
            self.latestPositionTicks = Int64(absoluteSeconds * 10_000_000)
            if self.isActive {
                self.emitCurrentPlaybackEvent(force: false)
            }
        }

        presenter.present(pvc, animated: true) { [weak player] in
            player?.play()
        }
    }

    private func onVideoAirPlayActivated() {
        guard !isActive else { return }
        isActive = true
        playbackState = "playing"

        let nowPlayingInfo: [String: Any] = [
            MPMediaItemPropertyTitle: pendingTitle,
            MPNowPlayingInfoPropertyPlaybackRate: 1.0,
            MPNowPlayingInfoPropertyElapsedPlaybackTime: pendingPositionSeconds,
        ]
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
        pendingPositionSeconds = 0

        emitEvent(state: "connected")
        emitCurrentPlaybackEvent(force: true)
    }

    private func onVideoAirPlayDeactivated() {
        guard isActive else { return }
        isActive = false
        emitEvent(state: "disconnected")
    }

    private func stopNativePlayer() {
        if let observer = playerItemFailedObserver {
            NotificationCenter.default.removeObserver(observer)
            playerItemFailedObserver = nil
        }
        playerItemStatusObserver?.invalidate()
        playerItemStatusObserver = nil
        externalPlaybackObserver?.invalidate()
        externalPlaybackObserver = nil
        if let observer = avPlayerTimeObserver {
            avPlayer?.removeTimeObserver(observer)
            avPlayerTimeObserver = nil
        }
        avPlayer?.pause()
        avPlayer = nil
        if let pvc = playerViewController {
            pvc.player = nil
            if pvc.presentingViewController != nil {
                pvc.dismiss(animated: true)
            }
            playerViewController = nil
        }
        currentStreamURL = nil
        hasRetriedCurrentStream = false
        streamStartPositionSeconds = 0
    }

    private func attachPlayerItemDebugObservers(_ playerItem: AVPlayerItem) {
        playerItemFailedObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemFailedToPlayToEndTime,
            object: playerItem,
            queue: .main
        ) { [weak self] _ in
            self?.retryCurrentStreamOnceIfNeeded()
        }

        playerItemStatusObserver = playerItem.observe(\.status, options: [.new]) { [weak self] item, _ in
            if item.status == .failed {
                self?.retryCurrentStreamOnceIfNeeded()
            }
        }
    }

    private func retryCurrentStreamOnceIfNeeded() {
        guard !hasRetriedCurrentStream else { return }
        guard let player = avPlayer, let url = currentStreamURL else { return }
        hasRetriedCurrentStream = true
        streamStartPositionSeconds = 0

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self, weak player] in
            guard let self, let player else { return }
            let retryURL = self.urlWithoutStartTimeTicks(url)
            let retryItem = AVPlayerItem(url: retryURL)
            self.attachPlayerItemDebugObservers(retryItem)
            player.replaceCurrentItem(with: retryItem)
            player.play()
        }
    }

    private func urlWithoutStartTimeTicks(_ url: URL) -> URL {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let items = components.queryItems, !items.isEmpty else {
            return url
        }

        let filtered = items.filter { $0.name.caseInsensitiveCompare("StartTimeTicks") != .orderedSame }
        guard filtered.count != items.count else { return url }
        components.queryItems = filtered
        return components.url ?? url
    }

    func setEventSink(_ sink: FlutterEventSink?) {
        eventSink = sink
        guard sink != nil else { return }
        emitEvent(state: isActive ? "connected" : "disconnected")
        emitCurrentPlaybackEvent(force: true)
    }

    // MARK: - Transport control (called from Flutter method channel)

    func pause() {
        avPlayer?.pause()
        updateNowPlayingRate(0.0)
        playbackState = "paused"
        emitCurrentPlaybackEvent(force: true)
    }

    func play() {
        avPlayer?.play()
        updateNowPlayingRate(1.0)
        playbackState = "playing"
        emitCurrentPlaybackEvent(force: true)
    }

    func seek(positionTicks: Int64) {
        latestPositionTicks = max(0, positionTicks)
        if let player = avPlayer {
            let seconds = Double(max(0, positionTicks)) / 10_000_000.0
            player.seek(to: CMTime(seconds: seconds, preferredTimescale: 600))
        }
        updateNowPlayingElapsed(positionTicks)
        emitCurrentPlaybackEvent(force: true)
    }

    func updatePlaybackState(isPlaying: Bool, isBuffering: Bool, positionTicks: Int64) {
        if avPlayer != nil {
            stopNativePlayer()
        }
        latestPositionTicks = max(0, positionTicks)
        if isBuffering {
            playbackState = "buffering"
        } else if isPlaying {
            playbackState = "playing"
        } else {
            playbackState = "paused"
        }

        updateNowPlayingElapsed(latestPositionTicks)
        updateNowPlayingRate(isPlaying && !isBuffering ? 1.0 : 0.0)
        emitCurrentPlaybackEvent(force: false)
    }

    func stop() {
        stopNativePlayer()
        teardownRemoteCommands()
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nil
        if isActive {
            isActive = false
            emitEvent(state: "disconnected")
        }
        playbackState = "idle"
        latestPositionTicks = 0
        emitCurrentPlaybackEvent(force: true)
    }

    // MARK: - Private

    private func detectAirPlay() -> Bool {
        return AVAudioSession.sharedInstance().currentRoute.outputs.contains {
            $0.portType == .airPlay
        }
    }

    private func refreshRouteStatus() {
        let nextActive = detectAirPlay()
        let wasActive = isActive

        guard avPlayer == nil else { return }

        isActive = nextActive
        guard wasActive != isActive else { return }

        DispatchQueue.main.async {
            self.emitEvent(state: self.isActive ? "connected" : "disconnected")
            self.emitCurrentPlaybackEvent(force: true)
        }
    }

    @objc private func handleRouteChange(_ notification: Notification) {
        refreshRouteStatus()
    }

    private func setupRemoteCommands() {
        guard remoteCommandTargets.isEmpty else { return }
        let cc = MPRemoteCommandCenter.shared()

        cc.playCommand.isEnabled = true
        let playToken = cc.playCommand.addTarget { [weak self] _ in
            self?.playbackState = "playing"
            self?.emitEvent(state: "command", command: "play")
            return .success
        }
        remoteCommandTargets.append((cc.playCommand, playToken))

        cc.pauseCommand.isEnabled = true
        let pauseToken = cc.pauseCommand.addTarget { [weak self] _ in
            self?.playbackState = "paused"
            self?.emitEvent(state: "command", command: "pause")
            return .success
        }
        remoteCommandTargets.append((cc.pauseCommand, pauseToken))

        cc.changePlaybackPositionCommand.isEnabled = true
        let seekToken = cc.changePlaybackPositionCommand.addTarget { [weak self] event in
            guard let posEvent = event as? MPChangePlaybackPositionCommandEvent else {
                return .commandFailed
            }
            let ticks = Int64(posEvent.positionTime * 10_000_000)
            self?.emitEvent(state: "command", command: "seek", positionTicks: ticks)
            return .success
        }
        remoteCommandTargets.append((cc.changePlaybackPositionCommand, seekToken))
    }

    private func teardownRemoteCommands() {
        for (command, token) in remoteCommandTargets {
            command.removeTarget(token)
        }
        remoteCommandTargets.removeAll()
    }

    private func emitCurrentPlaybackEvent(force: Bool) {
        guard isActive || force else { return }
        emitEvent(state: playbackState, positionTicks: latestPositionTicks)
    }

    private func updateNowPlayingRate(_ rate: Double) {
        var info = MPNowPlayingInfoCenter.default().nowPlayingInfo ?? [:]
        info[MPNowPlayingInfoPropertyPlaybackRate] = rate
        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
    }

    private func updateNowPlayingElapsed(_ positionTicks: Int64) {
        let seconds = Double(max(0, positionTicks)) / 10_000_000.0
        var info = MPNowPlayingInfoCenter.default().nowPlayingInfo ?? [:]
        info[MPNowPlayingInfoPropertyElapsedPlaybackTime] = seconds
        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
    }

    private func emitEvent(state: String, command: String? = nil, positionTicks: Int64? = nil) {
        var event: [String: Any] = [
            "kind": "airPlay",
            "state": state,
        ]
        if let command { event["command"] = command }
        if let positionTicks, positionTicks > 0 { event["positionTicks"] = positionTicks }
        eventSink?(event)
    }
}
