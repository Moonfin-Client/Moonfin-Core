import QuartzCore
import UIKit

final class AppleTvPlayerViewController: UIViewController {
    private let player: MpvPlayerWrapper
    var onExit: (() -> Void)?
    private var didAttachSurface = false
    private var updateTimer: Timer?
    private var lastShowAt: TimeInterval = 0

    private let osdContainer = UIView()
    private let gradientLayer = CAGradientLayer()
    private let scrubber = UIProgressView(progressViewStyle: .default)
    private let currentTimeLabel = UILabel()
    private let durationLabel = UILabel()
    private let playPauseLabel = UILabel()

    init(player: MpvPlayerWrapper) {
        self.player = player
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        player.attachVideoView(view)
        didAttachSurface = true
        setupOsd()
    }

    private func setupOsd() {
        osdContainer.translatesAutoresizingMaskIntoConstraints = false
        osdContainer.alpha = 0
        view.addSubview(osdContainer)
        NSLayoutConstraint.activate([
            osdContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            osdContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            osdContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            osdContainer.heightAnchor.constraint(equalToConstant: 240),
        ])

        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor(white: 0, alpha: 0.85).cgColor,
        ]
        osdContainer.layer.addSublayer(gradientLayer)

        scrubber.translatesAutoresizingMaskIntoConstraints = false
        scrubber.progressTintColor = UIColor(red: 0.9, green: 0.1, blue: 0.55, alpha: 1)
        scrubber.trackTintColor = UIColor(white: 1, alpha: 0.25)
        osdContainer.addSubview(scrubber)

        currentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTimeLabel.font = .monospacedDigitSystemFont(ofSize: 30, weight: .medium)
        currentTimeLabel.textColor = .white
        osdContainer.addSubview(currentTimeLabel)

        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.font = .monospacedDigitSystemFont(ofSize: 30, weight: .medium)
        durationLabel.textColor = UIColor(white: 1, alpha: 0.7)
        durationLabel.textAlignment = .right
        osdContainer.addSubview(durationLabel)

        playPauseLabel.translatesAutoresizingMaskIntoConstraints = false
        playPauseLabel.font = .systemFont(ofSize: 34, weight: .bold)
        playPauseLabel.textColor = .white
        osdContainer.addSubview(playPauseLabel)

        NSLayoutConstraint.activate([
            scrubber.leadingAnchor.constraint(
                equalTo: osdContainer.leadingAnchor, constant: 90),
            scrubber.trailingAnchor.constraint(
                equalTo: osdContainer.trailingAnchor, constant: -90),
            scrubber.bottomAnchor.constraint(
                equalTo: osdContainer.bottomAnchor, constant: -70),
            scrubber.heightAnchor.constraint(equalToConstant: 8),

            currentTimeLabel.leadingAnchor.constraint(equalTo: scrubber.leadingAnchor),
            currentTimeLabel.bottomAnchor.constraint(
                equalTo: scrubber.topAnchor, constant: -16),

            durationLabel.trailingAnchor.constraint(equalTo: scrubber.trailingAnchor),
            durationLabel.bottomAnchor.constraint(
                equalTo: scrubber.topAnchor, constant: -16),

            playPauseLabel.centerXAnchor.constraint(equalTo: osdContainer.centerXAnchor),
            playPauseLabel.centerYAnchor.constraint(equalTo: currentTimeLabel.centerYAnchor),
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if didAttachSurface {
            player.notifySurfaceReady()
        }
        gradientLayer.frame = osdContainer.bounds
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.notifySurfaceReady()
        showOsd()
        updateTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) {
            [weak self] _ in
            Task { @MainActor in self?.updateOsd() }
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        updateTimer?.invalidate()
        updateTimer = nil
        player.stop()
        onExit?()
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses {
            switch press.type {
            case .playPause, .select:
                togglePlayPause()
                showOsd()
                return
            case .leftArrow:
                seekBy(-10)
                showOsd()
                return
            case .rightArrow:
                seekBy(10)
                showOsd()
                return
            default:
                break
            }
        }
        super.pressesBegan(presses, with: event)
    }

    private func togglePlayPause() {
        switch player.state {
        case .playing, .buffering, .opening:
            player.pause()
        default:
            player.resume()
        }
    }

    private func seekBy(_ delta: TimeInterval) {
        player.seek(to: max(0, player.currentTime + delta))
    }

    private func isPaused() -> Bool {
        player.state == .paused
    }

    private func showOsd() {
        lastShowAt = CACurrentMediaTime()
        if osdContainer.alpha < 1 {
            UIView.animate(withDuration: 0.2) { self.osdContainer.alpha = 1 }
        }
    }

    private func updateOsd() {
        let duration = player.duration
        let current = player.currentTime
        scrubber.progress = duration > 0 ? Float(min(1, max(0, current / duration))) : 0
        currentTimeLabel.text = formatTime(current)
        durationLabel.text = formatTime(duration)
        playPauseLabel.text = isPaused() ? "❚❚" : "▶"

        let shouldShow = isPaused() || (CACurrentMediaTime() - lastShowAt < 4.0)
        let visible = osdContainer.alpha > 0.5
        if shouldShow && !visible {
            UIView.animate(withDuration: 0.2) { self.osdContainer.alpha = 1 }
        } else if !shouldShow && visible {
            UIView.animate(withDuration: 0.3) { self.osdContainer.alpha = 0 }
        }
    }

    private func formatTime(_ t: TimeInterval) -> String {
        guard t.isFinite, t >= 0 else { return "0:00" }
        let total = Int(t.rounded())
        let h = total / 3600
        let m = (total % 3600) / 60
        let s = total % 60
        return h > 0
            ? String(format: "%d:%02d:%02d", h, m, s)
            : String(format: "%d:%02d", m, s)
    }
}
