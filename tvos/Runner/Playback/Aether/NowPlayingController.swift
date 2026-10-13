import AVFoundation
import Foundation
import MediaPlayer
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Bridges the player to the system Now Playing infrastructure: it owns the
/// Now Playing payload and remote-command handlers so Moonfin becomes the
/// active Now Playing app. Without this, AirPods stem clicks and Control
/// Center transport controls fall through to whatever app last held the Now
/// Playing session.
///
/// Three modes:
/// - Detached (default): `MPRemoteCommandCenter.shared()` +
///   `MPNowPlayingInfoCenter.default()`, used when no AVPlayer is available
///   (software decode path, teardown).
/// - Attached: an `MPNowPlayingSession` bound to a specific `AVPlayer`.
///   Required on tvOS 26, where writes to the default info center race the
///   loopback-HLS player. `attach(player:)` must be called again on every
///   player republish. The engine swaps AVPlayer instances on internal
///   reloads and a stale session binding reintroduces the race.
/// - Adopted: a session the engine owns and publishes from its own player,
///   used for music. Only the command handlers move onto it.
///
/// On iOS audio_service owns the shared centers, so there only the adopted
/// mode does anything.
@MainActor
final class NowPlayingController {
    var onPlay: (@MainActor () -> Void)?
    var onPause: (@MainActor () -> Void)?
    var onToggle: (@MainActor () -> Void)?
    var onSeek: (@MainActor (TimeInterval) -> Void)?
    var onSkip: (@MainActor (TimeInterval) -> Void)?
    var onNext: (@MainActor () -> Void)?
    var onPrevious: (@MainActor () -> Void)?

    private var wantsCommands = false
    private var commandsRegistered = false
    private var registeredTargets: [(MPRemoteCommand, Any)] = []
    private var info: [String: Any] = [:]
    private var artworkURLString: String?
    private var attachedPlayer: AVPlayer?
    private var queueHasNext = false
    private var queueHasPrevious = false

    /// Seconds a transport command moves by. A physical fast forward or rewind
    /// key lands on the seek commands rather than the skip ones, so both read
    /// the same setting and a remote agrees with the on screen buttons.
    private var skipForwardInterval: TimeInterval = 10
    private var skipBackwardInterval: TimeInterval = 10
    private var intervalSkipsEnabled = true

    // MPNowPlayingSession is an iOS and tvOS API. Only tvOS drives Now Playing
    // natively, so on macOS this class stays inert and the default centers
    // stand in for the session.
    #if os(iOS) || os(tvOS)
        private var session: MPNowPlayingSession?
        private var sessionIsAdopted = false

        private var commandCenter: MPRemoteCommandCenter? {
            #if os(iOS)
                return session?.remoteCommandCenter
            #else
                return session?.remoteCommandCenter ?? .shared()
            #endif
        }

        private var infoCenter: MPNowPlayingInfoCenter? {
            #if os(iOS)
                return session?.nowPlayingInfoCenter
            #else
                return session?.nowPlayingInfoCenter ?? .default()
            #endif
        }
    #else
        private var commandCenter: MPRemoteCommandCenter? { .shared() }
        private var infoCenter: MPNowPlayingInfoCenter? { .default() }
    #endif

    /// Binds Now Playing to a concrete AVPlayer via `MPNowPlayingSession`.
    /// Passing `nil` detaches and falls back to the default centers.
    /// Re-registers command handlers against the new session's command center
    /// and replays the current metadata so nothing is lost across a rebind.
    func attach(player: AVPlayer?) {
        #if os(iOS) || os(tvOS)
            if player === attachedPlayer { return }
            if commandsRegistered { unregisterCommands() }
            let savedInfo = info
            if let player {
                let newSession = MPNowPlayingSession(players: [player])
                newSession.automaticallyPublishesNowPlayingInfo = false
                session = newSession
                attachedPlayer = player
                newSession.becomeActiveIfPossible()
            } else {
                session = nil
                attachedPlayer = nil
            }
            sessionIsAdopted = false
            if wantsCommands { registerCommands() }
            if !savedInfo.isEmpty {
                info = savedInfo
                publish(info)
            }
        #else
            attachedPlayer = player
        #endif
    }

    #if os(iOS) || os(tvOS)
        /// Moves the command handlers onto the engine's session, or back to the
        /// shared center for nil. The engine makes that session the active one,
        /// so remote commands only reach handlers registered on it.
        func adopt(session adopted: MPNowPlayingSession?) {
            guard adopted !== session else { return }
            if commandsRegistered { unregisterCommands() }
            session = adopted
            sessionIsAdopted = adopted != nil
            attachedPlayer = nil
            if wantsCommands { registerCommands() }
            // The engine asked before any handler was on, and a session with
            // none isn't eligible to be Now Playing.
            adopted?.becomeActiveIfPossible()
        }
    #endif

    func registerCommands() {
        wantsCommands = true
        guard !commandsRegistered, let center = commandCenter else { return }
        commandsRegistered = true

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
        addTarget(center.skipForwardCommand) { [weak self] event in
            MainActor.assumeIsolated {
                guard let self else { return .commandFailed }
                let interval = (event as? MPSkipIntervalCommandEvent)?.interval
                self.onSkip?(interval ?? self.skipForwardInterval)
                return .success
            }
        }
        addTarget(center.skipBackwardCommand) { [weak self] event in
            MainActor.assumeIsolated {
                guard let self else { return .commandFailed }
                let interval = (event as? MPSkipIntervalCommandEvent)?.interval
                self.onSkip?(-(interval ?? self.skipBackwardInterval))
                return .success
            }
        }
        addTarget(center.seekForwardCommand) { [weak self] event in
            MainActor.assumeIsolated {
                guard let self else { return .commandFailed }
                // A transport key sends begin on the press and end on the
                // release. One jump per press is what the setting describes,
                // so the release is acknowledged and moves nothing.
                if (event as? MPSeekCommandEvent)?.type == .endSeeking {
                    return .success
                }
                self.onSkip?(self.skipForwardInterval)
                return .success
            }
        }
        addTarget(center.seekBackwardCommand) { [weak self] event in
            MainActor.assumeIsolated {
                guard let self else { return .commandFailed }
                if (event as? MPSeekCommandEvent)?.type == .endSeeking {
                    return .success
                }
                self.onSkip?(-self.skipBackwardInterval)
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

        applySkipIntervals()
        center.playCommand.isEnabled = true
        center.pauseCommand.isEnabled = true
        center.togglePlayPauseCommand.isEnabled = true
        center.changePlaybackPositionCommand.isEnabled = true
        center.skipForwardCommand.isEnabled = intervalSkipsEnabled
        center.skipBackwardCommand.isEnabled = intervalSkipsEnabled
        center.seekForwardCommand.isEnabled = true
        center.seekBackwardCommand.isEnabled = true
        center.nextTrackCommand.isEnabled = queueHasNext
        center.previousTrackCommand.isEnabled = queueHasPrevious
    }

    /// Follows the user's skip lengths. Safe before the commands register,
    /// since registration applies whatever is set at the time, and cheap to
    /// call repeatedly, since an unchanged pair is dropped here.
    func setSkipIntervals(forward: TimeInterval, backward: TimeInterval) {
        let forward = max(1, forward)
        let backward = max(1, backward)
        if forward == skipForwardInterval, backward == skipBackwardInterval {
            return
        }
        skipForwardInterval = forward
        skipBackwardInterval = backward
        guard commandsRegistered else { return }
        applySkipIntervals()
    }

    private func applySkipIntervals() {
        guard let center = commandCenter else { return }
        center.skipForwardCommand.preferredIntervals = [
            NSNumber(value: skipForwardInterval)
        ]
        center.skipBackwardCommand.preferredIntervals = [
            NSNumber(value: skipBackwardInterval)
        ]
    }

    /// The system shows interval skips in place of the track buttons when
    /// both are on, so music turns them off to keep next and previous.
    func setIntervalSkipsEnabled(_ enabled: Bool) {
        intervalSkipsEnabled = enabled
        guard commandsRegistered, let center = commandCenter else { return }
        center.skipForwardCommand.isEnabled = enabled
        center.skipBackwardCommand.isEnabled = enabled
    }

    func setQueueCapabilities(hasNext: Bool, hasPrevious: Bool) {
        queueHasNext = hasNext
        queueHasPrevious = hasPrevious
        guard let center = commandCenter else { return }
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
        publish(info)
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
        publish(info)
    }

    func clear() {
        info = [:]
        artworkURLString = nil
        publish(nil)
    }

    func teardown() {
        wantsCommands = false
        unregisterCommands()
        clear()
        #if os(iOS) || os(tvOS)
            session = nil
            sessionIsAdopted = false
        #endif
        attachedPlayer = nil
    }

    private func publish(_ value: [String: Any]?) {
        #if os(iOS) || os(tvOS)
            if sessionIsAdopted { return }
        #endif
        infoCenter?.nowPlayingInfo = value
    }

    private func unregisterCommands() {
        for (command, token) in registeredTargets {
            command.removeTarget(token)
        }
        registeredTargets.removeAll()
        commandsRegistered = false
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
        #if canImport(UIKit)
            guard artworkURLString == urlString, let image = UIImage(data: data) else { return }
        #else
            guard artworkURLString == urlString, let image = NSImage(data: data) else { return }
        #endif
        info[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { _ in
            image
        }
        publish(info)
    }
}
