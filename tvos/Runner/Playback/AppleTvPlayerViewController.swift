import QuartzCore
import UIKit

final class AppleTvPlayerViewController: UIViewController {
    private let player: MpvPlayerWrapper
    var onExit: (() -> Void)?
    var onNext: (() -> Void)?
    var onPrevious: (() -> Void)?
    var onSelectAudio: ((Int) -> Void)?
    var onSelectSubtitle: ((Int) -> Void)?
    var onSetSpeed: ((Double) -> Void)?
    var onSetBitrate: ((Int) -> Void)?
    var onSelectChannel: ((String) -> Void)?
    var onOpenGuide: (() -> Void)?
    var onToggleFavorite: (() -> Void)?
    var onStillWatchingContinue: (() -> Void)?
    var onStillWatchingStop: (() -> Void)?
    var onSearchSubtitles: (() -> Void)?
    var onDownloadSubtitle: ((String) -> Void)?
    var onSyncplayLeave: (() -> Void)?
    var onSyncplayIgnoreWait: ((Bool) -> Void)?
    var baseSubtitlePos = 92
    private var didAttachSurface = false
    private var updateTimer: Timer?
    private var lastShowAt: TimeInterval = 0
    private var subtitlesRaised = false

    private var skipForwardMs = 30000
    private var skipBackMs = 10000
    private var hasNext = false
    private var hasPrevious = false
    private var audioTracks: [(index: Int, label: String, subtitle: String, selected: Bool)] = []
    private var subtitleTracks: [(index: Int, label: String, subtitle: String, selected: Bool)] = []
    private var streamInfoSections: [[String: Any]] = []
    private var hasCast = false
    private var castPeople: [(name: String, subtitle: String, imageUrl: String)] = []
    private var canFavorite = false
    private var isFavorite = false
    private var canDownloadSubtitles = false
    private weak var subtitleSearchingAlert: UIAlertController?
    private var syncPlayEnabled = false
    private var syncPlayGroupName = ""
    private var syncPlayParticipants: [String] = []
    private var syncPlayIgnoreWait = false
    private var stillWatchingShown = false
    private var selectedBitrateMbps = -1
    private var logoUrlString = ""
    private var headerPrimary = ""
    private var headerSecondary = ""
    private var hasLogo = false

    private var trickplay: TrickplayData?
    private var trickplaySheets: [Int: UIImage] = [:]

    private var nextUp: (title: String, imageUrl: String)?
    private var nextUpThresholdMs = 0
    private var nextUpKey = ""
    private var nextUpDismissed = false
    private var nextUpVisible = false

    private var pauseMeta: (overview: String, imageUrl: String)?

    private var mediaSegments: [(startMs: Int, endMs: Int, action: String, label: String)] = []
    private var mediaSegmentsSignature = ""
    private var skippedSegmentKeys: Set<String> = []
    private var activeSkipSegmentKey: String?
    private let skipSegmentButton = UIView()
    private let skipSegmentLabel = UILabel()

    private let loadingOverlay = UIView()
    private let loadingSpinner = UIActivityIndicatorView(style: .large)
    private var loadingDismissed = false

    private var isLive = false
    private var liveProgram:
        (name: String, episodeTitle: String, startMs: Int, endMs: Int, hasTimer: Bool)?
    private var liveChannelNumber = ""
    private var channelList:
        [(id: String, number: String, name: String, logoUrl: String, programName: String,
            selected: Bool)] = []
    private var streamStats: [(label: String, value: String)] = []

    private var scrubTargetMs: Int?
    private var scrubCommitTimer: Timer?

    private struct TrickplayData {
        let urls: [String]
        let headers: [String: String]
        let width: Int
        let height: Int
        let cols: Int
        let rows: Int
        let intervalMs: Int
    }

    private enum Zone { case scrubber, buttons }
    private enum ControlId {
        case prev, skipBack, playPause, skipForward, next
        case speed, chapters, subtitles, audio, cast, quality, zoom, info, channels, favorite
        case syncplay
    }
    private var focusedZone: Zone = .buttons
    private var focusedControlIndex = 0
    private var controls: [ControlId] = []
    private var controlViews: [ControlId: UIView] = [:]
    private var controlIcons: [ControlId: UIImageView] = [:]

    private let osdContainer = UIView()
    private let gradientLayer = CAGradientLayer()
    private let scrubber = UIProgressView(progressViewStyle: .default)
    private let currentTimeLabel = UILabel()
    private let durationLabel = UILabel()
    private let endsAtLabel = UILabel()
    private let chapterOverlay = UIView()
    private let controlBar = UIView()
    private let controlStack = UIStackView()
    private let tooltipView = UIView()
    private let tooltipLabel = UILabel()

    private let trickplayContainer = UIView()
    private let trickplayImageView = UIImageView()
    private var trickplayCenterX: NSLayoutConstraint?
    private var trickplayHeight: NSLayoutConstraint?

    private let topContainer = UIView()
    private let topGradientLayer = CAGradientLayer()
    private let headerStack = UIStackView()
    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()

    private let liveHeaderStack = UIStackView()
    private let liveChannelRow = UIStackView()
    private let channelBadge = PaddedLabel()
    private let channelNameLabel = UILabel()
    private let recordingDot = UIView()
    private let programLabel = UILabel()
    private let statsStack = UIStackView()

    private let nextUpCard = UIView()
    private let nextUpImage = UIImageView()
    private let nextUpTitleLabel = UILabel()
    private let nextUpCountdownLabel = UILabel()

    private let pauseOverlay = UIView()
    private let pauseImage = UIImageView()
    private let pauseTitleLabel = UILabel()
    private let pauseTextLabel = UILabel()

    private var chapters: [(title: String, startMs: Int)] = []

    private static let endTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }()

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
        rebuildControls()
        layoutHeader()
        rebuildStats()
    }

    private func setupOsd() {
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        topContainer.alpha = 0
        view.addSubview(topContainer)
        NSLayoutConstraint.activate([
            topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topContainer.topAnchor.constraint(equalTo: view.topAnchor),
            topContainer.heightAnchor.constraint(equalToConstant: 280),
        ])

        topGradientLayer.colors = [
            UIColor(white: 0, alpha: 0.85).cgColor,
            UIColor.clear.cgColor,
        ]
        topContainer.layer.addSublayer(topGradientLayer)

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.setContentHuggingPriority(.required, for: .horizontal)
        logoImageView.heightAnchor.constraint(equalToConstant: 82).isActive = true
        logoImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 480).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 42, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 1

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        subtitleLabel.textColor = UIColor(white: 1, alpha: 0.75)
        subtitleLabel.numberOfLines = 1

        headerStack.translatesAutoresizingMaskIntoConstraints = false
        headerStack.axis = .vertical
        headerStack.alignment = .leading
        headerStack.spacing = 10
        topContainer.addSubview(headerStack)
        NSLayoutConstraint.activate([
            headerStack.leadingAnchor.constraint(
                equalTo: topContainer.leadingAnchor, constant: 90),
            headerStack.trailingAnchor.constraint(
                lessThanOrEqualTo: topContainer.trailingAnchor, constant: -90),
            headerStack.topAnchor.constraint(
                equalTo: topContainer.safeAreaLayoutGuide.topAnchor, constant: 40),
        ])

        osdContainer.translatesAutoresizingMaskIntoConstraints = false
        osdContainer.alpha = 0
        view.addSubview(osdContainer)
        NSLayoutConstraint.activate([
            osdContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            osdContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            osdContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            osdContainer.heightAnchor.constraint(equalToConstant: 360),
        ])

        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor(white: 0, alpha: 0.9).cgColor,
        ]
        osdContainer.layer.addSublayer(gradientLayer)

        controlBar.translatesAutoresizingMaskIntoConstraints = false
        osdContainer.addSubview(controlBar)

        controlStack.translatesAutoresizingMaskIntoConstraints = false
        controlStack.axis = .horizontal
        controlStack.alignment = .center
        controlStack.spacing = 20
        controlBar.addSubview(controlStack)

        tooltipView.backgroundColor = UIColor(white: 0, alpha: 0.78)
        tooltipView.layer.cornerRadius = 8
        tooltipView.isHidden = true
        osdContainer.addSubview(tooltipView)
        tooltipLabel.font = .systemFont(ofSize: 24, weight: .medium)
        tooltipLabel.textColor = .white
        tooltipView.addSubview(tooltipLabel)

        scrubber.translatesAutoresizingMaskIntoConstraints = false
        scrubber.progressTintColor = UIColor(red: 0.9, green: 0.1, blue: 0.55, alpha: 1)
        scrubber.trackTintColor = UIColor(white: 1, alpha: 0.25)
        scrubber.layer.cornerRadius = 3
        scrubber.clipsToBounds = true
        osdContainer.addSubview(scrubber)

        chapterOverlay.translatesAutoresizingMaskIntoConstraints = false
        chapterOverlay.isUserInteractionEnabled = false
        osdContainer.addSubview(chapterOverlay)

        currentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTimeLabel.font = .monospacedDigitSystemFont(ofSize: 26, weight: .medium)
        currentTimeLabel.textColor = UIColor(white: 1, alpha: 0.7)
        osdContainer.addSubview(currentTimeLabel)

        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.font = .monospacedDigitSystemFont(ofSize: 26, weight: .medium)
        durationLabel.textColor = UIColor(white: 1, alpha: 0.7)
        durationLabel.textAlignment = .right
        osdContainer.addSubview(durationLabel)

        endsAtLabel.translatesAutoresizingMaskIntoConstraints = false
        endsAtLabel.font = .monospacedDigitSystemFont(ofSize: 24, weight: .medium)
        endsAtLabel.textColor = UIColor(white: 1, alpha: 0.7)
        endsAtLabel.textAlignment = .right
        osdContainer.addSubview(endsAtLabel)

        NSLayoutConstraint.activate([
            controlBar.leadingAnchor.constraint(
                equalTo: osdContainer.leadingAnchor, constant: 90),
            controlBar.trailingAnchor.constraint(
                equalTo: osdContainer.trailingAnchor, constant: -90),
            controlBar.bottomAnchor.constraint(
                equalTo: osdContainer.bottomAnchor, constant: -56),
            controlBar.heightAnchor.constraint(equalToConstant: 72),

            controlStack.leadingAnchor.constraint(equalTo: controlBar.leadingAnchor),
            controlStack.centerYAnchor.constraint(equalTo: controlBar.centerYAnchor),
            controlStack.trailingAnchor.constraint(
                lessThanOrEqualTo: controlBar.trailingAnchor),

            currentTimeLabel.leadingAnchor.constraint(equalTo: controlBar.leadingAnchor),
            currentTimeLabel.bottomAnchor.constraint(
                equalTo: controlBar.topAnchor, constant: -16),

            durationLabel.trailingAnchor.constraint(equalTo: controlBar.trailingAnchor),
            durationLabel.bottomAnchor.constraint(
                equalTo: controlBar.topAnchor, constant: -16),

            scrubber.leadingAnchor.constraint(equalTo: controlBar.leadingAnchor),
            scrubber.trailingAnchor.constraint(equalTo: controlBar.trailingAnchor),
            scrubber.bottomAnchor.constraint(
                equalTo: currentTimeLabel.topAnchor, constant: -10),
            scrubber.heightAnchor.constraint(equalToConstant: 6),

            chapterOverlay.leadingAnchor.constraint(equalTo: scrubber.leadingAnchor),
            chapterOverlay.trailingAnchor.constraint(equalTo: scrubber.trailingAnchor),
            chapterOverlay.centerYAnchor.constraint(equalTo: scrubber.centerYAnchor),
            chapterOverlay.heightAnchor.constraint(equalToConstant: 16),

            endsAtLabel.trailingAnchor.constraint(equalTo: controlBar.trailingAnchor),
            endsAtLabel.bottomAnchor.constraint(
                equalTo: scrubber.topAnchor, constant: -8),
        ])

        setupTrickplay()
        setupNextUpCard()
        setupPauseOverlay()
        setupLiveOverlays()
        setupSkipSegment()
        setupLoadingOverlay()
    }

    private func setupLoadingOverlay() {
        loadingOverlay.translatesAutoresizingMaskIntoConstraints = false
        loadingOverlay.backgroundColor = .black
        view.addSubview(loadingOverlay)
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        loadingSpinner.color = .white
        loadingSpinner.hidesWhenStopped = true
        loadingOverlay.addSubview(loadingSpinner)
        NSLayoutConstraint.activate([
            loadingOverlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingOverlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingOverlay.topAnchor.constraint(equalTo: view.topAnchor),
            loadingOverlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingSpinner.centerXAnchor.constraint(equalTo: loadingOverlay.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: loadingOverlay.centerYAnchor),
        ])
        loadingSpinner.startAnimating()
    }

    private func updateLoadingOverlay() {
        guard !loadingDismissed else { return }
        if player.currentTime > 0 || player.state == .playing || player.state == .error {
            loadingDismissed = true
            loadingSpinner.stopAnimating()
            UIView.animate(withDuration: 0.25) {
                self.loadingOverlay.alpha = 0
            } completion: { _ in
                self.loadingOverlay.isHidden = true
            }
        }
    }

    private func setupSkipSegment() {
        skipSegmentButton.translatesAutoresizingMaskIntoConstraints = false
        skipSegmentButton.backgroundColor = .white
        skipSegmentButton.layer.cornerRadius = 10
        skipSegmentButton.layer.borderWidth = 2
        skipSegmentButton.layer.borderColor = UIColor.white.cgColor
        skipSegmentButton.isHidden = true
        view.addSubview(skipSegmentButton)

        skipSegmentLabel.translatesAutoresizingMaskIntoConstraints = false
        skipSegmentLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        skipSegmentLabel.textColor = .black
        skipSegmentButton.addSubview(skipSegmentLabel)

        NSLayoutConstraint.activate([
            skipSegmentButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -90),
            skipSegmentButton.bottomAnchor.constraint(
                equalTo: view.bottomAnchor, constant: -120),
            skipSegmentLabel.topAnchor.constraint(
                equalTo: skipSegmentButton.topAnchor, constant: 14),
            skipSegmentLabel.bottomAnchor.constraint(
                equalTo: skipSegmentButton.bottomAnchor, constant: -14),
            skipSegmentLabel.leadingAnchor.constraint(
                equalTo: skipSegmentButton.leadingAnchor, constant: 30),
            skipSegmentLabel.trailingAnchor.constraint(
                equalTo: skipSegmentButton.trailingAnchor, constant: -30),
        ])
    }

    private func setupLiveOverlays() {
        channelBadge.translatesAutoresizingMaskIntoConstraints = false
        channelBadge.font = .systemFont(ofSize: 26, weight: .bold)
        channelBadge.textColor = .white
        channelBadge.backgroundColor = UIColor(red: 0.9, green: 0.1, blue: 0.55, alpha: 1)
        channelBadge.layer.cornerRadius = 6
        channelBadge.clipsToBounds = true
        channelBadge.setContentHuggingPriority(.required, for: .horizontal)

        channelNameLabel.translatesAutoresizingMaskIntoConstraints = false
        channelNameLabel.font = .systemFont(ofSize: 42, weight: .bold)
        channelNameLabel.textColor = .white
        channelNameLabel.numberOfLines = 1

        recordingDot.translatesAutoresizingMaskIntoConstraints = false
        recordingDot.backgroundColor = UIColor(red: 0.95, green: 0.2, blue: 0.2, alpha: 1)
        recordingDot.layer.cornerRadius = 9
        recordingDot.isHidden = true
        recordingDot.widthAnchor.constraint(equalToConstant: 18).isActive = true
        recordingDot.heightAnchor.constraint(equalToConstant: 18).isActive = true

        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)

        liveChannelRow.translatesAutoresizingMaskIntoConstraints = false
        liveChannelRow.axis = .horizontal
        liveChannelRow.alignment = .center
        liveChannelRow.spacing = 18
        liveChannelRow.addArrangedSubview(channelBadge)
        liveChannelRow.addArrangedSubview(channelNameLabel)
        liveChannelRow.addArrangedSubview(spacer)
        liveChannelRow.addArrangedSubview(recordingDot)

        programLabel.translatesAutoresizingMaskIntoConstraints = false
        programLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        programLabel.textColor = UIColor(white: 1, alpha: 0.75)
        programLabel.numberOfLines = 1

        liveHeaderStack.translatesAutoresizingMaskIntoConstraints = false
        liveHeaderStack.axis = .vertical
        liveHeaderStack.alignment = .fill
        liveHeaderStack.spacing = 10
        liveHeaderStack.isHidden = true
        liveHeaderStack.addArrangedSubview(liveChannelRow)
        liveHeaderStack.addArrangedSubview(programLabel)
        topContainer.addSubview(liveHeaderStack)

        statsStack.translatesAutoresizingMaskIntoConstraints = false
        statsStack.axis = .horizontal
        statsStack.alignment = .center
        statsStack.spacing = 12
        statsStack.isHidden = true
        osdContainer.addSubview(statsStack)

        NSLayoutConstraint.activate([
            liveHeaderStack.leadingAnchor.constraint(
                equalTo: topContainer.leadingAnchor, constant: 90),
            liveHeaderStack.trailingAnchor.constraint(
                equalTo: topContainer.trailingAnchor, constant: -90),
            liveHeaderStack.topAnchor.constraint(
                equalTo: topContainer.safeAreaLayoutGuide.topAnchor, constant: 40),

            statsStack.leadingAnchor.constraint(equalTo: controlBar.leadingAnchor),
            statsStack.bottomAnchor.constraint(
                equalTo: scrubber.topAnchor, constant: -10),
        ])
    }

    private func rebuildStats() {
        statsStack.arrangedSubviews.forEach {
            statsStack.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        for stat in streamStats {
            statsStack.addArrangedSubview(makeStatChip(stat.label, stat.value))
        }
        statsStack.isHidden = true
    }

    private func makeStatChip(_ label: String, _ value: String) -> UIView {
        let chip = UIView()
        chip.translatesAutoresizingMaskIntoConstraints = false
        chip.backgroundColor = UIColor(white: 1, alpha: 0.12)
        chip.layer.cornerRadius = 8
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 22, weight: .medium)
        text.textColor = .white
        text.text = "\(label): \(value)"
        chip.addSubview(text)
        NSLayoutConstraint.activate([
            text.leadingAnchor.constraint(equalTo: chip.leadingAnchor, constant: 14),
            text.trailingAnchor.constraint(equalTo: chip.trailingAnchor, constant: -14),
            text.topAnchor.constraint(equalTo: chip.topAnchor, constant: 8),
            text.bottomAnchor.constraint(equalTo: chip.bottomAnchor, constant: -8),
        ])
        return chip
    }

    private func setupTrickplay() {
        trickplayContainer.translatesAutoresizingMaskIntoConstraints = false
        trickplayContainer.backgroundColor = .black
        trickplayContainer.layer.cornerRadius = 6
        trickplayContainer.layer.borderWidth = 2
        trickplayContainer.layer.borderColor = UIColor.white.cgColor
        trickplayContainer.clipsToBounds = true
        trickplayContainer.isHidden = true
        osdContainer.addSubview(trickplayContainer)

        trickplayImageView.translatesAutoresizingMaskIntoConstraints = false
        trickplayImageView.contentMode = .scaleAspectFill
        trickplayContainer.addSubview(trickplayImageView)

        let center = trickplayContainer.centerXAnchor.constraint(
            equalTo: scrubber.leadingAnchor)
        let height = trickplayContainer.heightAnchor.constraint(equalToConstant: 135)
        trickplayCenterX = center
        trickplayHeight = height
        NSLayoutConstraint.activate([
            center,
            height,
            trickplayContainer.widthAnchor.constraint(equalToConstant: 240),
            trickplayContainer.bottomAnchor.constraint(
                equalTo: scrubber.topAnchor, constant: -14),
            trickplayImageView.leadingAnchor.constraint(
                equalTo: trickplayContainer.leadingAnchor),
            trickplayImageView.trailingAnchor.constraint(
                equalTo: trickplayContainer.trailingAnchor),
            trickplayImageView.topAnchor.constraint(equalTo: trickplayContainer.topAnchor),
            trickplayImageView.bottomAnchor.constraint(
                equalTo: trickplayContainer.bottomAnchor),
        ])
    }

    private func setupNextUpCard() {
        nextUpCard.translatesAutoresizingMaskIntoConstraints = false
        nextUpCard.backgroundColor = UIColor(white: 0.08, alpha: 0.96)
        nextUpCard.layer.cornerRadius = 14
        nextUpCard.isHidden = true
        view.addSubview(nextUpCard)

        nextUpImage.translatesAutoresizingMaskIntoConstraints = false
        nextUpImage.contentMode = .scaleAspectFill
        nextUpImage.layer.cornerRadius = 8
        nextUpImage.clipsToBounds = true
        nextUpCard.addSubview(nextUpImage)

        let upNext = UILabel()
        upNext.translatesAutoresizingMaskIntoConstraints = false
        upNext.text = "UP NEXT"
        upNext.font = .systemFont(ofSize: 20, weight: .bold)
        upNext.textColor = UIColor(red: 0.9, green: 0.1, blue: 0.55, alpha: 1)
        nextUpCard.addSubview(upNext)

        nextUpTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        nextUpTitleLabel.font = .systemFont(ofSize: 26, weight: .semibold)
        nextUpTitleLabel.textColor = .white
        nextUpTitleLabel.numberOfLines = 2
        nextUpCard.addSubview(nextUpTitleLabel)

        nextUpCountdownLabel.translatesAutoresizingMaskIntoConstraints = false
        nextUpCountdownLabel.font = .systemFont(ofSize: 20, weight: .regular)
        nextUpCountdownLabel.textColor = UIColor(white: 1, alpha: 0.6)
        nextUpCard.addSubview(nextUpCountdownLabel)

        NSLayoutConstraint.activate([
            nextUpCard.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -90),
            nextUpCard.bottomAnchor.constraint(
                equalTo: view.bottomAnchor, constant: -120),
            nextUpCard.widthAnchor.constraint(equalToConstant: 560),
            nextUpCard.heightAnchor.constraint(equalToConstant: 150),

            nextUpImage.leadingAnchor.constraint(
                equalTo: nextUpCard.leadingAnchor, constant: 16),
            nextUpImage.centerYAnchor.constraint(equalTo: nextUpCard.centerYAnchor),
            nextUpImage.widthAnchor.constraint(equalToConstant: 200),
            nextUpImage.heightAnchor.constraint(equalToConstant: 118),

            upNext.leadingAnchor.constraint(
                equalTo: nextUpImage.trailingAnchor, constant: 18),
            upNext.topAnchor.constraint(equalTo: nextUpImage.topAnchor),

            nextUpTitleLabel.leadingAnchor.constraint(equalTo: upNext.leadingAnchor),
            nextUpTitleLabel.trailingAnchor.constraint(
                equalTo: nextUpCard.trailingAnchor, constant: -16),
            nextUpTitleLabel.topAnchor.constraint(
                equalTo: upNext.bottomAnchor, constant: 6),

            nextUpCountdownLabel.leadingAnchor.constraint(equalTo: upNext.leadingAnchor),
            nextUpCountdownLabel.bottomAnchor.constraint(
                equalTo: nextUpImage.bottomAnchor),
        ])
    }

    private func setupPauseOverlay() {
        pauseOverlay.translatesAutoresizingMaskIntoConstraints = false
        pauseOverlay.alpha = 0
        view.addSubview(pauseOverlay)

        pauseImage.translatesAutoresizingMaskIntoConstraints = false
        pauseImage.contentMode = .scaleAspectFill
        pauseImage.layer.cornerRadius = 10
        pauseImage.clipsToBounds = true
        pauseOverlay.addSubview(pauseImage)

        pauseTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        pauseTitleLabel.font = .systemFont(ofSize: 36, weight: .bold)
        pauseTitleLabel.textColor = .white
        pauseTitleLabel.numberOfLines = 2
        pauseOverlay.addSubview(pauseTitleLabel)

        pauseTextLabel.translatesAutoresizingMaskIntoConstraints = false
        pauseTextLabel.font = .systemFont(ofSize: 26, weight: .regular)
        pauseTextLabel.textColor = UIColor(white: 1, alpha: 0.85)
        pauseTextLabel.numberOfLines = 6
        pauseOverlay.addSubview(pauseTextLabel)

        NSLayoutConstraint.activate([
            pauseOverlay.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 90),
            pauseOverlay.trailingAnchor.constraint(
                lessThanOrEqualTo: view.trailingAnchor, constant: -90),
            pauseOverlay.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),

            pauseImage.leadingAnchor.constraint(equalTo: pauseOverlay.leadingAnchor),
            pauseImage.topAnchor.constraint(equalTo: pauseOverlay.topAnchor),
            pauseImage.widthAnchor.constraint(equalToConstant: 300),
            pauseImage.heightAnchor.constraint(equalToConstant: 169),
            pauseImage.bottomAnchor.constraint(
                lessThanOrEqualTo: pauseOverlay.bottomAnchor),

            pauseTitleLabel.leadingAnchor.constraint(
                equalTo: pauseImage.trailingAnchor, constant: 24),
            pauseTitleLabel.topAnchor.constraint(equalTo: pauseImage.topAnchor),
            pauseTitleLabel.widthAnchor.constraint(equalToConstant: 820),

            pauseTextLabel.leadingAnchor.constraint(equalTo: pauseTitleLabel.leadingAnchor),
            pauseTextLabel.trailingAnchor.constraint(equalTo: pauseTitleLabel.trailingAnchor),
            pauseTextLabel.topAnchor.constraint(
                equalTo: pauseTitleLabel.bottomAnchor, constant: 12),
            pauseTextLabel.bottomAnchor.constraint(
                lessThanOrEqualTo: pauseOverlay.bottomAnchor),
        ])
    }

    private func layoutHeader() {
        if isLive {
            headerStack.isHidden = true
            liveHeaderStack.isHidden = false
            channelBadge.text = liveChannelNumber
            channelBadge.isHidden = liveChannelNumber.isEmpty
            channelNameLabel.text = headerPrimary
            let programName = liveProgram?.name ?? headerSecondary
            programLabel.text = programName
            programLabel.isHidden = programName.isEmpty
            recordingDot.isHidden = !(liveProgram?.hasTimer ?? false)
            return
        }

        liveHeaderStack.isHidden = true
        headerStack.isHidden = false
        headerStack.arrangedSubviews.forEach {
            headerStack.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        if hasLogo {
            headerStack.addArrangedSubview(logoImageView)
        } else if !headerPrimary.isEmpty {
            titleLabel.text = headerPrimary
            headerStack.addArrangedSubview(titleLabel)
        }
        if !headerSecondary.isEmpty {
            subtitleLabel.text = headerSecondary
            headerStack.addArrangedSubview(subtitleLabel)
        }
    }

    private func iconName(for id: ControlId) -> String {
        switch id {
        case .prev: return "backward.end.fill"
        case .skipBack: return "backward.fill"
        case .playPause: return isPaused() ? "play.fill" : "pause.fill"
        case .skipForward: return "forward.fill"
        case .next: return "forward.end.fill"
        case .speed: return "gauge.with.dots.needle.67percent"
        case .chapters: return "list.bullet"
        case .subtitles: return "captions.bubble"
        case .audio: return "speaker.wave.2"
        case .cast: return "person.2"
        case .quality: return "line.3.horizontal.decrease"
        case .zoom: return player.zoomMode.iconName
        case .info: return "info.circle"
        case .channels: return "list.bullet.rectangle"
        case .favorite: return isFavorite ? "heart.fill" : "heart"
        case .syncplay: return "person.2.wave.2"
        }
    }

    private func makeControl(_ id: ControlId) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 32
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .white
        iconView.image = UIImage(
            systemName: iconName(for: id),
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 27, weight: .medium))
        container.addSubview(iconView)
        NSLayoutConstraint.activate([
            container.widthAnchor.constraint(equalToConstant: 64),
            container.heightAnchor.constraint(equalToConstant: 64),
            iconView.widthAnchor.constraint(equalToConstant: 38),
            iconView.heightAnchor.constraint(equalToConstant: 38),
            iconView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        ])
        controlViews[id] = container
        controlIcons[id] = iconView
        return container
    }

    private func rebuildControls() {
        controlStack.arrangedSubviews.forEach {
            controlStack.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        controlViews.removeAll()
        controlIcons.removeAll()

        var ids: [ControlId] = []
        if isLive {
            ids.append(.playPause)
            if !channelList.isEmpty { ids.append(.channels) }
            if !streamInfoSections.isEmpty { ids.append(.info) }
        } else {
            if hasPrevious { ids.append(.prev) }
            ids.append(.skipBack)
            ids.append(.playPause)
            ids.append(.skipForward)
            if hasNext { ids.append(.next) }
            if canFavorite { ids.append(.favorite) }
            ids.append(.speed)
            if chapters.count > 1 { ids.append(.chapters) }
            if !subtitleTracks.isEmpty { ids.append(.subtitles) }
            if audioTracks.count > 1 { ids.append(.audio) }
            if hasCast { ids.append(.cast) }
            if syncPlayEnabled { ids.append(.syncplay) }
            ids.append(.quality)
            ids.append(.zoom)
            if !streamInfoSections.isEmpty { ids.append(.info) }
        }

        controls = ids
        for id in ids {
            controlStack.addArrangedSubview(makeControl(id))
        }

        if !controls.indices.contains(focusedControlIndex) {
            focusedControlIndex = controls.firstIndex(of: .playPause) ?? 0
        }
        updateFocusHighlight()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if didAttachSurface {
            player.notifySurfaceReady()
        }
        gradientLayer.frame = osdContainer.bounds
        topGradientLayer.frame = topContainer.bounds
        layoutChapters()
        updateTooltip()
    }

    func applyUiMetadata(_ args: [String: Any]) {
        headerPrimary = (args["topTitle"] as? String) ?? ""
        headerSecondary = (args["topSubtitle"] as? String) ?? ""

        hasNext = (args["hasNext"] as? Bool) ?? false
        hasPrevious = (args["hasPrevious"] as? Bool) ?? false
        skipForwardMs = (args["skipForwardMs"] as? NSNumber)?.intValue ?? 30000
        skipBackMs = (args["skipBackMs"] as? NSNumber)?.intValue ?? 10000
        audioTracks = parseTracks(args["audioTracks"])
        subtitleTracks = parseTracks(args["subtitleTracks"])
        streamInfoSections = (args["streamInfoSections"] as? [[String: Any]]) ?? []
        selectedBitrateMbps = (args["selectedBitrateMbps"] as? NSNumber)?.intValue ?? -1
        nextUpThresholdMs = (args["nextUpThresholdMs"] as? NSNumber)?.intValue ?? 0
        hasCast = (args["hasCast"] as? Bool) ?? false
        canFavorite = (args["canFavorite"] as? Bool) ?? false
        isFavorite = (args["isFavorite"] as? Bool) ?? false
        canDownloadSubtitles = (args["canDownloadSubtitles"] as? Bool) ?? false
        if let sync = args["syncPlay"] as? [String: Any] {
            syncPlayEnabled = true
            syncPlayGroupName = (sync["groupName"] as? String) ?? "SyncPlay"
            syncPlayParticipants = (sync["participants"] as? [String]) ?? []
            syncPlayIgnoreWait = (sync["ignoreWait"] as? Bool) ?? false
        } else {
            syncPlayEnabled = false
        }
        if (args["showStillWatching"] as? Bool) == true {
            presentStillWatching()
        }

        castPeople = ((args["castPeople"] as? [[String: Any]]) ?? []).compactMap { e in
            guard let name = e["name"] as? String, !name.isEmpty else { return nil }
            return (
                name: name,
                subtitle: (e["subtitle"] as? String) ?? "",
                imageUrl: (e["imageUrl"] as? String) ?? "")
        }

        chapters = ((args["chapters"] as? [[String: Any]]) ?? []).compactMap {
            entry in
            guard let startMs = (entry["startMs"] as? NSNumber)?.intValue else {
                return nil
            }
            let title = (entry["title"] as? String) ?? ""
            return (title: title, startMs: startMs)
        }

        parseTrickplay(args["trickplay"])
        parseNextUp(args["nextUp"])
        parsePauseMeta(args["pauseMeta"])
        parseLive(args)
        parseMediaSegments(args["mediaSegments"])

        loadLogo((args["logoUrl"] as? String) ?? "")

        if isViewLoaded {
            layoutHeader()
            rebuildControls()
            rebuildStats()
            view.setNeedsLayout()
        }
    }

    private func parseLive(_ args: [String: Any]) {
        isLive = (args["isLive"] as? Bool) ?? false
        liveChannelNumber = (args["liveChannelNumber"] as? String) ?? ""

        if let dict = args["liveProgram"] as? [String: Any],
            let name = dict["name"] as? String
        {
            liveProgram = (
                name: name,
                episodeTitle: (dict["episodeTitle"] as? String) ?? "",
                startMs: (dict["startMs"] as? NSNumber)?.intValue ?? 0,
                endMs: (dict["endMs"] as? NSNumber)?.intValue ?? 0,
                hasTimer: (dict["hasTimer"] as? Bool) ?? false
            )
        } else {
            liveProgram = nil
        }

        channelList = ((args["channelList"] as? [[String: Any]]) ?? []).compactMap {
            entry in
            guard let id = entry["id"] as? String, !id.isEmpty else { return nil }
            return (
                id: id,
                number: (entry["number"] as? String) ?? "",
                name: (entry["name"] as? String) ?? "",
                logoUrl: (entry["logoUrl"] as? String) ?? "",
                programName: (entry["programName"] as? String) ?? "",
                selected: (entry["selected"] as? Bool) ?? false
            )
        }

        streamStats = ((args["streamStats"] as? [[String: Any]]) ?? []).compactMap {
            entry in
            guard let label = entry["label"] as? String else { return nil }
            return (label: label, value: (entry["value"] as? String) ?? "")
        }
    }

    private func parseTrickplay(_ raw: Any?) {
        trickplaySheets.removeAll()
        guard let dict = raw as? [String: Any],
            let urls = dict["urls"] as? [String],
            let width = (dict["width"] as? NSNumber)?.intValue,
            let height = (dict["height"] as? NSNumber)?.intValue,
            let cols = (dict["cols"] as? NSNumber)?.intValue,
            let rows = (dict["rows"] as? NSNumber)?.intValue,
            let intervalMs = (dict["intervalMs"] as? NSNumber)?.intValue,
            width > 0, height > 0, cols > 0, rows > 0, intervalMs > 0
        else {
            trickplay = nil
            return
        }
        let headers = (dict["headers"] as? [String: String]) ?? [:]
        trickplay = TrickplayData(
            urls: urls, headers: headers, width: width, height: height,
            cols: cols, rows: rows, intervalMs: intervalMs)
        trickplayHeight?.constant = 240.0 * CGFloat(height) / CGFloat(width)
    }

    private func parseNextUp(_ raw: Any?) {
        guard let dict = raw as? [String: Any],
            let title = dict["title"] as? String, !title.isEmpty
        else {
            nextUp = nil
            return
        }
        let imageUrl = (dict["imageUrl"] as? String) ?? ""
        if title != nextUpKey {
            nextUpKey = title
            nextUpDismissed = false
        }
        nextUp = (title: title, imageUrl: imageUrl)
    }

    private func parsePauseMeta(_ raw: Any?) {
        guard let dict = raw as? [String: Any],
            let overview = dict["overview"] as? String, !overview.isEmpty
        else {
            pauseMeta = nil
            return
        }
        pauseMeta = (overview: overview, imageUrl: (dict["imageUrl"] as? String) ?? "")
    }

    private func parseMediaSegments(_ raw: Any?) {
        let parsed = ((raw as? [[String: Any]]) ?? []).compactMap {
            entry -> (startMs: Int, endMs: Int, action: String, label: String)? in
            guard let startMs = (entry["startMs"] as? NSNumber)?.intValue,
                let endMs = (entry["endMs"] as? NSNumber)?.intValue,
                let action = entry["action"] as? String, endMs > startMs
            else { return nil }
            return (
                startMs: startMs, endMs: endMs, action: action,
                label: (entry["label"] as? String) ?? "Skip")
        }
        let signature = parsed.map { "\($0.startMs)-\($0.endMs)" }.joined(separator: ",")
        if signature != mediaSegmentsSignature {
            mediaSegmentsSignature = signature
            skippedSegmentKeys.removeAll()
            hideSkipSegment()
        }
        mediaSegments = parsed
    }

    private func updateMediaSegments() {
        guard !isLive, !mediaSegments.isEmpty, player.duration > 0 else {
            hideSkipSegment()
            return
        }
        let posMs = Int(player.currentTime * 1000)
        skippedSegmentKeys = skippedSegmentKeys.filter { key in
            guard let segment = mediaSegments.first(where: {
                "\($0.startMs)-\($0.endMs)" == key
            }) else { return false }
            return posMs >= segment.startMs
        }

        guard let segment = mediaSegments.first(where: {
            posMs >= $0.startMs && posMs < $0.endMs
        }) else {
            hideSkipSegment()
            return
        }
        let key = "\(segment.startMs)-\(segment.endMs)"
        if skippedSegmentKeys.contains(key) {
            hideSkipSegment()
            return
        }
        if segment.action == "skip" {
            skippedSegmentKeys.insert(key)
            hideSkipSegment()
            player.seek(to: Double(segment.endMs) / 1000.0)
            return
        }
        showSkipSegment(label: segment.label, key: key)
    }

    private func showSkipSegment(label: String, key: String) {
        activeSkipSegmentKey = key
        skipSegmentLabel.text = label
        guard skipSegmentButton.isHidden else { return }
        skipSegmentButton.alpha = 0
        skipSegmentButton.isHidden = false
        UIView.animate(withDuration: 0.2) { self.skipSegmentButton.alpha = 1 }
    }

    private func hideSkipSegment() {
        activeSkipSegmentKey = nil
        guard !skipSegmentButton.isHidden else { return }
        UIView.animate(withDuration: 0.15) {
            self.skipSegmentButton.alpha = 0
        } completion: { _ in
            self.skipSegmentButton.isHidden = true
        }
    }

    private func performSkipSegment() {
        guard let key = activeSkipSegmentKey,
            let segment = mediaSegments.first(where: { "\($0.startMs)-\($0.endMs)" == key })
        else { return }
        skippedSegmentKeys.insert(key)
        hideSkipSegment()
        player.seek(to: Double(segment.endMs) / 1000.0)
    }

    private func loadImage(
        _ urlString: String, headers: [String: String] = [:],
        completion: @escaping (UIImage?) -> Void
    ) {
        guard !urlString.isEmpty, let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        var request = URLRequest(url: url)
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        URLSession.shared.dataTask(with: request) { data, _, _ in
            let image = data.flatMap { UIImage(data: $0) }
            DispatchQueue.main.async { completion(image) }
        }.resume()
    }

    private func loadLogo(_ urlString: String) {
        guard urlString != logoUrlString else { return }
        logoUrlString = urlString
        if urlString.isEmpty {
            hasLogo = false
            logoImageView.image = nil
            layoutHeader()
            return
        }
        let expected = urlString
        loadImage(urlString) { [weak self] image in
            guard let self, self.logoUrlString == expected else { return }
            if let image {
                self.logoImageView.image = image
                self.hasLogo = true
            } else {
                self.hasLogo = false
            }
            self.layoutHeader()
        }
    }

    private func parseTracks(_ raw: Any?)
        -> [(index: Int, label: String, subtitle: String, selected: Bool)]
    {
        guard let arr = raw as? [[String: Any]] else { return [] }
        return arr.compactMap { entry in
            guard let index = (entry["index"] as? NSNumber)?.intValue else {
                return nil
            }
            let label = (entry["label"] as? String) ?? "Track"
            let subtitle = (entry["subtitle"] as? String) ?? ""
            let selected = (entry["selected"] as? Bool) ?? false
            return (index: index, label: label, subtitle: subtitle, selected: selected)
        }
    }

    private func layoutChapters() {
        chapterOverlay.subviews.forEach { $0.removeFromSuperview() }
        let width = chapterOverlay.bounds.width
        let durationMs = player.duration * 1000
        guard width > 0, durationMs > 0, chapters.count > 1 else { return }
        for chapter in chapters {
            let fraction = min(1, max(0, Double(chapter.startMs) / durationMs))
            if fraction <= 0 { continue }
            let tick = UIView()
            tick.backgroundColor = UIColor(white: 1, alpha: 0.9)
            tick.frame = CGRect(
                x: CGFloat(fraction) * width - 1,
                y: 0,
                width: 2,
                height: chapterOverlay.bounds.height)
            chapterOverlay.addSubview(tick)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.notifySurfaceReady()
        focusedZone = .buttons
        focusedControlIndex = controls.firstIndex(of: .playPause) ?? 0
        updateFocusHighlight()
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
        scrubCommitTimer?.invalidate()
        scrubCommitTimer = nil
        player.stop()
        onExit?()
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        if presentedViewController != nil {
            super.pressesBegan(presses, with: event)
            return
        }
        for press in presses {
            switch press.type {
            case .menu:
                if nextUpVisible {
                    dismissNextUp()
                    return
                }
                if scrubTargetMs != nil {
                    cancelScrub()
                    showOsd()
                    return
                }
            case .upArrow:
                if isLive {
                    showOsd()
                    return
                }
                focusedZone = .scrubber
                updateFocusHighlight()
                showOsd()
                return
            case .downArrow:
                focusedZone = .buttons
                updateFocusHighlight()
                showOsd()
                return
            case .playPause:
                togglePlayPause()
                showOsd()
                return
            case .select:
                if nextUpVisible {
                    onNext?()
                    hideNextUp()
                    return
                }
                if activeSkipSegmentKey != nil {
                    performSkipSegment()
                    showOsd()
                    return
                }
                handleSelect()
                showOsd()
                return
            case .leftArrow:
                handleHorizontal(forward: false)
                showOsd()
                return
            case .rightArrow:
                handleHorizontal(forward: true)
                showOsd()
                return
            default:
                break
            }
        }
        super.pressesBegan(presses, with: event)
    }

    private func handleSelect() {
        switch focusedZone {
        case .scrubber:
            if scrubTargetMs != nil {
                commitScrub()
            } else {
                togglePlayPause()
            }
        case .buttons:
            guard controls.indices.contains(focusedControlIndex) else { return }
            activate(controls[focusedControlIndex])
        }
    }

    private func handleHorizontal(forward: Bool) {
        switch focusedZone {
        case .scrubber:
            adjustScrub(byMs: forward ? skipForwardMs : -skipBackMs)
        case .buttons:
            let next = focusedControlIndex + (forward ? 1 : -1)
            focusedControlIndex = min(controls.count - 1, max(0, next))
            updateFocusHighlight()
        }
    }

    private func activate(_ id: ControlId) {
        switch id {
        case .prev:
            onPrevious?()
        case .skipBack:
            adjustScrub(byMs: -skipBackMs)
        case .playPause:
            togglePlayPause()
        case .skipForward:
            adjustScrub(byMs: skipForwardMs)
        case .next:
            onNext?()
        case .speed:
            presentSpeedMenu()
        case .chapters:
            presentChapterMenu()
        case .subtitles:
            presentSubtitleMenu()
        case .audio:
            presentAudioMenu()
        case .cast:
            presentCastPanel()
        case .quality:
            presentQualityMenu()
        case .zoom:
            player.cycleZoomMode()
            controlIcons[.zoom]?.image = UIImage(
                systemName: player.zoomMode.iconName,
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 27, weight: .medium))
        case .info:
            presentInfoPanel()
        case .channels:
            onOpenGuide?()
        case .favorite:
            onToggleFavorite?()
        case .syncplay:
            presentSyncPlay()
        }
    }

    private func presentStillWatching() {
        guard !stillWatchingShown, presentedViewController == nil else { return }
        stillWatchingShown = true
        player.pause()
        let panel = StillWatchingViewController(
            onContinue: { [weak self] in
                guard let self else { return }
                self.stillWatchingShown = false
                self.player.resume()
                self.onStillWatchingContinue?()
            },
            onExit: { [weak self] in
                guard let self else { return }
                self.stillWatchingShown = false
                self.onStillWatchingStop?()
            })
        panel.modalPresentationStyle = .overFullScreen
        present(panel, animated: true)
    }

    private func presentSyncPlay() {
        let panel = SyncPlayPanelViewController(
            groupName: syncPlayGroupName,
            participants: syncPlayParticipants,
            ignoreWait: syncPlayIgnoreWait,
            onIgnoreWait: { [weak self] value in self?.onSyncplayIgnoreWait?(value) },
            onLeave: { [weak self] in self?.onSyncplayLeave?() })
        panel.modalPresentationStyle = .overFullScreen
        present(panel, animated: true)
    }

    private func presentChannelList() {
        guard !channelList.isEmpty else { return }
        let panel = ChannelListViewController(channels: channelList) {
            [weak self] channelId in
            self?.onSelectChannel?(channelId)
        }
        panel.modalPresentationStyle = .overFullScreen
        present(panel, animated: true)
    }

    private func updateFocusHighlight() {
        for (id, container) in controlViews {
            let isFocused =
                focusedZone == .buttons && controls.indices.contains(focusedControlIndex)
                && controls[focusedControlIndex] == id
            container.backgroundColor =
                isFocused ? .white : UIColor(white: 1, alpha: 0)
            controlIcons[id]?.tintColor = isFocused ? .black : UIColor(white: 1, alpha: 0.85)
            container.transform =
                isFocused ? CGAffineTransform(scaleX: 1.12, y: 1.12) : .identity
        }
        let scrubFocused = focusedZone == .scrubber
        scrubber.transform =
            scrubFocused ? CGAffineTransform(scaleX: 1, y: 2.0) : .identity
        scrubber.trackTintColor =
            scrubFocused ? UIColor(white: 1, alpha: 0.45) : UIColor(white: 1, alpha: 0.25)
        updateTooltip()
    }

    private func tooltipText(for id: ControlId) -> String {
        switch id {
        case .prev: return "Previous"
        case .skipBack: return "Seek Back"
        case .playPause: return isPaused() ? "Play" : "Pause"
        case .skipForward: return "Seek Forward"
        case .next: return "Next"
        case .speed: return "Playback Speed"
        case .chapters: return "Chapters"
        case .subtitles: return "Subtitles"
        case .audio: return "Audio"
        case .cast: return "Cast & Crew"
        case .quality: return "Playback Quality"
        case .zoom: return "Zoom Mode"
        case .info: return "Playback Information"
        case .channels: return "Guide"
        case .favorite: return isFavorite ? "Remove from Favorites" : "Add to Favorites"
        case .syncplay: return "SyncPlay"
        }
    }

    private func updateTooltip() {
        guard focusedZone == .buttons,
            controls.indices.contains(focusedControlIndex),
            let control = controlViews[controls[focusedControlIndex]]
        else {
            tooltipView.isHidden = true
            return
        }
        tooltipLabel.text = tooltipText(for: controls[focusedControlIndex])
        tooltipLabel.sizeToFit()
        let padH: CGFloat = 16
        let padV: CGFloat = 8
        let width = tooltipLabel.bounds.width + padH * 2
        let height = tooltipLabel.bounds.height + padV * 2
        let controlFrame = control.convert(control.bounds, to: osdContainer)
        let scrubFrame = scrubber.convert(scrubber.bounds, to: osdContainer)
        tooltipLabel.frame = CGRect(
            x: padH, y: padV, width: tooltipLabel.bounds.width,
            height: tooltipLabel.bounds.height)
        let minX: CGFloat = 90
        let maxX = osdContainer.bounds.width - 90 - width
        let x = min(max(minX, controlFrame.midX - width / 2), max(minX, maxX))
        tooltipView.frame = CGRect(
            x: x, y: scrubFrame.minY - height - 16,
            width: width, height: height)
        tooltipView.isHidden = false
    }

    private func togglePlayPause() {
        switch player.state {
        case .playing, .buffering, .opening:
            player.pause()
        default:
            player.resume()
        }
    }

    private func isPaused() -> Bool {
        player.state == .paused
    }

    private func adjustScrub(byMs deltaMs: Int) {
        guard !isLive else { return }
        let durationMs = Int(player.duration * 1000)
        guard durationMs > 0 else { return }
        let base = scrubTargetMs ?? Int(player.currentTime * 1000)
        scrubTargetMs = min(durationMs, max(0, base + deltaMs))
        renderProgress()
        updateTrickplay()
        scrubCommitTimer?.invalidate()
        scrubCommitTimer = Timer.scheduledTimer(
            withTimeInterval: 0.6, repeats: false
        ) { [weak self] _ in
            Task { @MainActor in self?.commitScrub() }
        }
    }

    private func commitScrub() {
        scrubCommitTimer?.invalidate()
        scrubCommitTimer = nil
        guard let target = scrubTargetMs else { return }
        scrubTargetMs = nil
        trickplayContainer.isHidden = true
        player.seek(to: Double(target) / 1000.0)
    }

    private func cancelScrub() {
        scrubCommitTimer?.invalidate()
        scrubCommitTimer = nil
        scrubTargetMs = nil
        trickplayContainer.isHidden = true
        renderProgress()
    }

    private func updateTrickplay() {
        guard let tp = trickplay, let target = scrubTargetMs, player.duration > 0 else {
            trickplayContainer.isHidden = true
            return
        }
        let tilesPerImage = tp.cols * tp.rows
        guard tilesPerImage > 0 else { return }
        let tileIndex = target / tp.intervalMs
        let imageIndex = tileIndex / tilesPerImage
        let tileOffset = tileIndex % tilesPerImage
        let col = tileOffset % tp.cols
        let row = tileOffset / tp.cols

        let width = scrubber.bounds.width
        if width > 0 {
            let fraction = CGFloat(min(1, max(0, Double(target) / (player.duration * 1000))))
            let half: CGFloat = 120
            let x = min(width - half, max(half, fraction * width))
            trickplayCenterX?.constant = x
        }

        if let sheet = trickplaySheets[imageIndex] {
            cropTrickplay(sheet, col: col, row: row, data: tp)
            trickplayContainer.isHidden = false
        } else {
            trickplayContainer.isHidden = true
            loadTrickplaySheet(imageIndex)
        }
    }

    private func cropTrickplay(_ sheet: UIImage, col: Int, row: Int, data: TrickplayData) {
        guard let cg = sheet.cgImage else { return }
        let rect = CGRect(
            x: col * data.width, y: row * data.height,
            width: data.width, height: data.height)
        if let cropped = cg.cropping(to: rect) {
            trickplayImageView.image = UIImage(cgImage: cropped)
        }
    }

    private func loadTrickplaySheet(_ index: Int) {
        guard let tp = trickplay, index >= 0, index < tp.urls.count,
            trickplaySheets[index] == nil
        else { return }
        loadImage(tp.urls[index], headers: tp.headers) { [weak self] image in
            guard let self, let image else { return }
            self.trickplaySheets[index] = image
            if self.scrubTargetMs != nil {
                self.updateTrickplay()
            }
        }
    }

    private func setSubtitlesRaised(_ raised: Bool) {
        guard raised != subtitlesRaised else { return }
        subtitlesRaised = raised
        let pos = raised ? min(baseSubtitlePos, 70) : baseSubtitlePos
        player.setProperty("sub-pos", value: String(pos))
    }

    private func hideOsd() {
        setSubtitlesRaised(false)
        UIView.animate(withDuration: 0.3) {
            self.osdContainer.alpha = 0
            self.topContainer.alpha = 0
        }
    }

    private func trackActionTitle(
        _ track: (index: Int, label: String, subtitle: String, selected: Bool)
    ) -> String {
        let prefix = track.selected ? "\u{2713} " : ""
        if track.subtitle.isEmpty {
            return "\(prefix)\(track.label)"
        }
        return "\(prefix)\(track.label) · \(track.subtitle)"
    }

    private func presentAudioMenu() {
        let sheet = UIAlertController(
            title: "Audio", message: nil, preferredStyle: .actionSheet)
        for track in audioTracks {
            sheet.addAction(
                UIAlertAction(title: trackActionTitle(track), style: .default) {
                    [weak self] _ in
                    self?.onSelectAudio?(track.index)
                })
        }
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(sheet, animated: true)
    }

    private func presentSubtitleMenu() {
        let sheet = UIAlertController(
            title: "Subtitles", message: nil, preferredStyle: .actionSheet)
        let anySelected = subtitleTracks.contains { $0.selected }
        let offTitle = (anySelected ? "" : "\u{2713} ") + "Off"
        sheet.addAction(
            UIAlertAction(title: offTitle, style: .default) { [weak self] _ in
                self?.onSelectSubtitle?(-1)
            })
        for track in subtitleTracks {
            sheet.addAction(
                UIAlertAction(title: trackActionTitle(track), style: .default) {
                    [weak self] _ in
                    self?.onSelectSubtitle?(track.index)
                })
        }
        if canDownloadSubtitles {
            sheet.addAction(
                UIAlertAction(title: "Download Subtitles\u{2026}", style: .default) {
                    [weak self] _ in
                    self?.beginSubtitleSearch()
                })
        }
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(sheet, animated: true)
    }

    private func beginSubtitleSearch() {
        let alert = UIAlertController(
            title: "Searching for Subtitles\u{2026}", message: nil,
            preferredStyle: .alert)
        subtitleSearchingAlert = alert
        present(alert, animated: true)
        onSearchSubtitles?()
    }

    func presentRemoteSubtitleResults(_ results: [[String: Any]]) {
        let show = { [weak self] in
            guard let self else { return }
            if results.isEmpty {
                let alert = UIAlertController(
                    title: "No Subtitles Found", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alert, animated: true)
                return
            }
            let sheet = UIAlertController(
                title: "Download Subtitles", message: nil, preferredStyle: .actionSheet)
            for result in results {
                guard let id = result["id"] as? String, !id.isEmpty else { continue }
                let label = (result["label"] as? String) ?? "Subtitle"
                let subtitle = (result["subtitle"] as? String) ?? ""
                let title = subtitle.isEmpty ? label : "\(label) \u{00B7} \(subtitle)"
                sheet.addAction(
                    UIAlertAction(title: title, style: .default) { [weak self] _ in
                        self?.onDownloadSubtitle?(id)
                    })
            }
            sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(sheet, animated: true)
        }
        if let searching = subtitleSearchingAlert {
            subtitleSearchingAlert = nil
            searching.dismiss(animated: true) { show() }
        } else {
            show()
        }
    }

    private func presentChapterMenu() {
        let sheet = UIAlertController(
            title: "Chapters", message: nil, preferredStyle: .actionSheet)
        for chapter in chapters {
            let stamp = formatTime(Double(chapter.startMs) / 1000.0)
            sheet.addAction(
                UIAlertAction(title: "\(chapter.title) · \(stamp)", style: .default) {
                    [weak self] _ in
                    self?.player.seek(to: Double(chapter.startMs) / 1000.0)
                    self?.showOsd()
                })
        }
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(sheet, animated: true)
    }

    private func presentSpeedMenu() {
        let sheet = UIAlertController(
            title: "Playback Speed", message: nil, preferredStyle: .actionSheet)
        let speeds: [Double] = [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0]
        let current = Double(player.rate)
        for speed in speeds {
            let check = abs(speed - current) < 0.01 ? "\u{2713} " : ""
            let label = speed == 1.0 ? "Normal" : String(format: "%gx", speed)
            sheet.addAction(
                UIAlertAction(title: "\(check)\(label)", style: .default) {
                    [weak self] _ in
                    self?.onSetSpeed?(speed)
                })
        }
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(sheet, animated: true)
    }

    private func presentQualityMenu() {
        let sheet = UIAlertController(
            title: "Quality", message: nil, preferredStyle: .actionSheet)
        let options = [-1, 40, 20, 12, 8, 4, 2]
        for mbps in options {
            let check = mbps == selectedBitrateMbps ? "\u{2713} " : ""
            let label = mbps < 0 ? "Auto" : "\(mbps) Mbps"
            sheet.addAction(
                UIAlertAction(title: "\(check)\(label)", style: .default) {
                    [weak self] _ in
                    self?.onSetBitrate?(mbps)
                })
        }
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(sheet, animated: true)
    }

    private func presentInfoPanel() {
        var sections: [(title: String, rows: [(label: String, value: String)])] = []
        for section in streamInfoSections {
            let title = (section["title"] as? String) ?? ""
            var rows: [(label: String, value: String)] = []
            for row in (section["rows"] as? [[String: Any]]) ?? [] {
                rows.append(
                    (
                        label: (row["label"] as? String) ?? "",
                        value: (row["value"] as? String) ?? ""
                    ))
            }
            if !rows.isEmpty { sections.append((title: title, rows: rows)) }
        }

        let colorRows = colorTelemetryRows()
        if let idx = sections.firstIndex(where: { $0.title == "Video" }) {
            sections[idx].rows += colorRows
        } else if !colorRows.isEmpty {
            sections.append((title: "Color & HDR", rows: colorRows))
        }

        let deviceRows = deviceDiagnosticRows()
        if let idx = sections.firstIndex(where: { $0.title == "Diagnostics" }) {
            sections[idx].rows = deviceRows + sections[idx].rows
        } else if !deviceRows.isEmpty {
            sections.append((title: "Diagnostics", rows: deviceRows))
        }

        let panel = InfoPanelViewController(sections: sections)
        panel.modalPresentationStyle = .overFullScreen
        present(panel, animated: true)
    }

    private func deviceDiagnosticRows() -> [(label: String, value: String)] {
        var rows: [(label: String, value: String)] = [
            ("OS", UIDevice.current.systemVersion),
            ("Model", VideoCapabilityDetector.deviceModelIdentifier()),
            ("Generation", VideoCapabilityDetector.currentGeneration().rawValue),
        ]
        if let screen = view.window?.screen {
            if let mode = screen.currentMode {
                rows.append(
                    ("Sink Mode", "\(Int(mode.size.width))x\(Int(mode.size.height))"))
            }
            rows.append(("Sink Max FPS", "\(screen.maximumFramesPerSecond)"))
            rows.append(
                ("EDR Potential", String(format: "%.2f", screen.potentialEDRHeadroom)))
            rows.append(
                ("EDR Current", String(format: "%.2f", screen.currentEDRHeadroom)))
        }
        return rows
    }

    private func colorTelemetryRows() -> [(label: String, value: String)] {
        let telemetry = player.dynamicRangeTelemetrySnapshot()
        func value(_ key: String) -> String? {
            guard let v = telemetry[key], !v.isEmpty,
                v != "unknown", v != "no_engine"
            else { return nil }
            return v
        }
        func pair(_ a: String, _ b: String) -> String? {
            guard let first = value(a) else { return nil }
            return "\(first) / \(value(b) ?? "?")"
        }

        var rows: [(label: String, value: String)] = []
        if let v = value("mpv_hdr_type") { rows.append(("HDR Type", v)) }
        if let v = value("mpv_max_cll") { rows.append(("Max CLL", v)) }
        if let v = value("mpv_max_fall") { rows.append(("Max FALL", v)) }
        if let v = pair("mpv_input_primaries", "mpv_input_transfer") {
            rows.append(("Input Color", v))
        }
        if let v = pair("mpv_output_primaries", "mpv_output_transfer") {
            rows.append(("Output Color", v))
        }
        if let v = pair("mpv_active_target_prim", "mpv_active_target_trc") {
            rows.append(("Display Target", v))
        }
        if let v = value("mpv_active_tone_mapping") {
            rows.append(("Tone Mapping", v))
        }
        if let v = value("mpv_intent_sink_hdr_capable") {
            rows.append(("Display HDR Capable", v))
        }
        if let v = value("mpv_intent_content_range") {
            rows.append(("Content Range", v))
        }
        if let v = value("mpv_active_hwdec") {
            rows.append(("Hardware Decode", v))
        }
        if let v = value("mpv_display_fps") { rows.append(("Display FPS", v)) }
        if let v = value("mpv_frame_drop_count") {
            rows.append(("Frames Dropped", v))
        }
        if let v = value("mpv_decoder_frame_drop_count") {
            rows.append(("Decoder Drops", v))
        }

        return rows
    }

    private func presentCastPanel() {
        let panel = CastPanelViewController(people: castPeople)
        panel.modalPresentationStyle = .overFullScreen
        present(panel, animated: true)
    }

    private func showNextUp() {
        guard let next = nextUp, !nextUpVisible else { return }
        nextUpVisible = true
        nextUpTitleLabel.text = next.title
        nextUpImage.image = nil
        loadImage(next.imageUrl) { [weak self] image in
            guard let self, self.nextUpVisible else { return }
            self.nextUpImage.image = image
        }
        nextUpCard.alpha = 0
        nextUpCard.isHidden = false
        UIView.animate(withDuration: 0.25) { self.nextUpCard.alpha = 1 }
    }

    private func hideNextUp() {
        nextUpVisible = false
        UIView.animate(withDuration: 0.2) { self.nextUpCard.alpha = 0 } completion: { _ in
            self.nextUpCard.isHidden = true
        }
    }

    private func dismissNextUp() {
        nextUpDismissed = true
        hideNextUp()
    }

    private func updateNextUp(remaining: TimeInterval) {
        let active =
            nextUp != nil && nextUpThresholdMs > 0 && !nextUpDismissed
            && scrubTargetMs == nil && player.duration > 0
            && remaining <= Double(nextUpThresholdMs) / 1000.0 && remaining > 0
        if active {
            showNextUp()
            nextUpCountdownLabel.text = "Starts in \(Int(remaining.rounded()))s  ·  Select to play"
        } else if nextUpVisible && (remaining <= 0 || nextUp == nil) {
            hideNextUp()
        }
    }

    private func updatePauseOverlay() {
        let shouldShow = isPaused() && pauseMeta != nil
        let visible = pauseOverlay.alpha > 0.5
        if shouldShow && !visible, let meta = pauseMeta {
            pauseTitleLabel.text = hasLogo ? headerPrimary : (headerPrimary.isEmpty ? headerSecondary : headerPrimary)
            pauseTextLabel.text = meta.overview
            pauseImage.image = nil
            loadImage(meta.imageUrl) { [weak self] image in
                self?.pauseImage.image = image
            }
            UIView.animate(withDuration: 0.25) { self.pauseOverlay.alpha = 1 }
        } else if !shouldShow && visible {
            UIView.animate(withDuration: 0.2) { self.pauseOverlay.alpha = 0 }
        }
    }

    private func showOsd() {
        lastShowAt = CACurrentMediaTime()
        setSubtitlesRaised(true)
        if osdContainer.alpha < 1 {
            UIView.animate(withDuration: 0.2) {
                self.osdContainer.alpha = 1
                self.topContainer.alpha = 1
            }
        }
    }

    private func renderProgress() {
        if isLive {
            renderLiveProgress()
            return
        }
        let duration = player.duration
        let current = scrubTargetMs.map { Double($0) / 1000.0 } ?? player.currentTime
        scrubber.progress = duration > 0 ? Float(min(1, max(0, current / duration))) : 0
        currentTimeLabel.text = formatTime(current)
        durationLabel.text = formatTime(duration)

        let rate = max(0.01, Double(player.rate))
        if duration > 0 {
            let remaining = max(0, duration - current) / rate
            let endDate = Date().addingTimeInterval(remaining)
            endsAtLabel.text = "Ends at \(Self.endTimeFormatter.string(from: endDate))"
            endsAtLabel.isHidden = false
        } else {
            endsAtLabel.isHidden = true
        }
    }

    private func renderLiveProgress() {
        endsAtLabel.isHidden = true
        if let program = liveProgram, program.endMs > program.startMs {
            let nowMs = Date().timeIntervalSince1970 * 1000
            let span = Double(program.endMs - program.startMs)
            let progress = (nowMs - Double(program.startMs)) / span
            scrubber.progress = Float(min(1, max(0, progress)))
            currentTimeLabel.text = clockString(epochMs: program.startMs)
            durationLabel.text = clockString(epochMs: program.endMs)
        } else {
            scrubber.progress = 1
            currentTimeLabel.text = Self.endTimeFormatter.string(from: Date())
            durationLabel.text = "LIVE"
        }
    }

    private func clockString(epochMs: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(epochMs) / 1000.0)
        return Self.endTimeFormatter.string(from: date)
    }

    private func updateOsd() {
        renderProgress()
        controlIcons[.playPause]?.image = UIImage(
            systemName: isPaused() ? "play.fill" : "pause.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 27, weight: .medium))

        let duration = player.duration
        if duration > 0 {
            updateNextUp(remaining: max(0, duration - player.currentTime))
        }
        updatePauseOverlay()
        updateMediaSegments()
        updateLoadingOverlay()

        let shouldShow =
            isPaused() || scrubTargetMs != nil
            || (CACurrentMediaTime() - lastShowAt < 4.0)
        let visible = osdContainer.alpha > 0.5
        if shouldShow && !visible {
            setSubtitlesRaised(true)
            UIView.animate(withDuration: 0.2) {
                self.osdContainer.alpha = 1
                self.topContainer.alpha = 1
            }
        } else if !shouldShow && visible {
            setSubtitlesRaised(false)
            UIView.animate(withDuration: 0.3) {
                self.osdContainer.alpha = 0
                self.topContainer.alpha = 0
            }
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

private final class InfoPanelViewController: UIViewController, UITableViewDataSource,
    UITableViewDelegate
{
    private let sections: [(title: String, rows: [(label: String, value: String)])]
    private let tableView = UITableView(frame: .zero, style: .grouped)

    init(sections: [(title: String, rows: [(label: String, value: String)])]) {
        self.sections = sections
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.55)

        let panel = UIView()
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.backgroundColor = UIColor(white: 0.1, alpha: 0.97)
        panel.layer.cornerRadius = 22
        panel.clipsToBounds = true
        view.addSubview(panel)

        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Playback Information"
        title.font = .systemFont(ofSize: 38, weight: .bold)
        title.textColor = .white
        panel.addSubview(title)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 56
        tableView.register(InfoCell.self, forCellReuseIdentifier: "cell")
        panel.addSubview(tableView)

        let closeButton = UIButton(type: .system)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: .normal)
        closeButton.titleLabel?.font = .systemFont(ofSize: 32, weight: .semibold)
        closeButton.addAction(
            UIAction { [weak self] _ in self?.dismiss(animated: true) }, for: .primaryActionTriggered)
        panel.addSubview(closeButton)

        NSLayoutConstraint.activate([
            panel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            panel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            panel.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            panel.widthAnchor.constraint(equalToConstant: 1180),

            title.topAnchor.constraint(equalTo: panel.topAnchor, constant: 40),
            title.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: 56),

            tableView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: panel.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: panel.trailingAnchor),
            tableView.bottomAnchor.constraint(
                equalTo: closeButton.topAnchor, constant: -8),

            closeButton.centerXAnchor.constraint(equalTo: panel.centerXAnchor),
            closeButton.bottomAnchor.constraint(
                equalTo: panel.bottomAnchor, constant: -24),
        ])
    }

    func numberOfSections(in tableView: UITableView) -> Int { sections.count }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int)
        -> UIView?
    {
        let header = UIView()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = sections[section].title
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        header.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -8),
        ])
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int)
        -> CGFloat
    {
        section == 0 ? 56 : 72
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InfoCell
        let row = sections[indexPath.section].rows[indexPath.row]
        cell.configure(label: row.label, value: row.value)
        return cell
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses where press.type == .menu {
            dismiss(animated: true)
            return
        }
        super.pressesBegan(presses, with: event)
    }
}

private final class InfoCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let valueLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(white: 1, alpha: 0.06)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 26, weight: .regular)
        nameLabel.textColor = UIColor(white: 1, alpha: 0.6)
        nameLabel.numberOfLines = 0
        contentView.addSubview(nameLabel)

        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = .systemFont(ofSize: 26, weight: .medium)
        valueLabel.textColor = .white
        valueLabel.numberOfLines = 1
        valueLabel.lineBreakMode = .byTruncatingTail
        contentView.addSubview(valueLabel)

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 12),
            nameLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -12),
            nameLabel.widthAnchor.constraint(equalToConstant: 360),

            valueLabel.leadingAnchor.constraint(
                equalTo: nameLabel.trailingAnchor, constant: 24),
            valueLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -8),
            valueLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(label: String, value: String) {
        nameLabel.text = label
        valueLabel.text = value
    }

    override func didUpdateFocus(
        in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator
    ) {
        coordinator.addCoordinatedAnimations {
            if self.isFocused {
                self.backgroundColor = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 0.9)
                self.nameLabel.textColor = .white
            } else {
                self.backgroundColor = UIColor(white: 1, alpha: 0.06)
                self.nameLabel.textColor = UIColor(white: 1, alpha: 0.6)
            }
        }
    }
}

private final class CastPanelViewController: UIViewController, UICollectionViewDataSource,
    UICollectionViewDelegate
{
    private let people: [(name: String, subtitle: String, imageUrl: String)]
    private var collectionView: UICollectionView!

    init(people: [(name: String, subtitle: String, imageUrl: String)]) {
        self.people = people
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.6)

        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Cast & Crew"
        title.font = .systemFont(ofSize: 40, weight: .bold)
        title.textColor = .white
        view.addSubview(title)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 240, height: 360)
        layout.minimumLineSpacing = 36
        layout.sectionInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 90)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CastCell.self, forCellWithReuseIdentifier: "cast")
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 40),
            collectionView.heightAnchor.constraint(equalToConstant: 420),
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)
        -> Int
    {
        people.count
    }

    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "cast", for: indexPath)
            as! CastCell
        let person = people[indexPath.item]
        cell.configure(name: person.name, subtitle: person.subtitle, imageUrl: person.imageUrl)
        return cell
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses where press.type == .menu {
            dismiss(animated: true)
            return
        }
        super.pressesBegan(presses, with: event)
    }
}

private final class CastCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let roleLabel = UILabel()
    private var imageUrl = ""

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = UIColor(white: 0.2, alpha: 1)
        contentView.addSubview(imageView)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 1
        contentView.addSubview(nameLabel)

        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        roleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        roleLabel.textColor = UIColor(white: 1, alpha: 0.6)
        roleLabel.numberOfLines = 1
        contentView.addSubview(roleLabel)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 280),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            roleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            roleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            roleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(name: String, subtitle: String, imageUrl: String) {
        nameLabel.text = name
        roleLabel.text = subtitle
        roleLabel.isHidden = subtitle.isEmpty
        self.imageUrl = imageUrl
        imageView.image = nil
        guard !imageUrl.isEmpty, let url = URL(string: imageUrl) else { return }
        let expected = imageUrl
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            let image = data.flatMap { UIImage(data: $0) }
            DispatchQueue.main.async {
                guard let self, self.imageUrl == expected else { return }
                self.imageView.image = image
            }
        }.resume()
    }

    override func didUpdateFocus(
        in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator
    ) {
        coordinator.addCoordinatedAnimations {
            let focused = self.isFocused
            self.imageView.transform =
                focused ? CGAffineTransform(scaleX: 1.1, y: 1.1) : .identity
            self.imageView.layer.borderWidth = focused ? 4 : 0
            self.imageView.layer.borderColor = UIColor.white.cgColor
        }
    }
}

final class PaddedLabel: UILabel {
    var insets = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + insets.left + insets.right,
            height: size.height + insets.top + insets.bottom)
    }
}

private final class ChannelListViewController: UIViewController, UITableViewDataSource,
    UITableViewDelegate
{
    private let channels:
        [(id: String, number: String, name: String, logoUrl: String, programName: String,
            selected: Bool)]
    private let onSelect: (String) -> Void
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let selectedIndex: Int

    init(
        channels: [(
            id: String, number: String, name: String, logoUrl: String, programName: String,
            selected: Bool
        )],
        onSelect: @escaping (String) -> Void
    ) {
        self.channels = channels
        self.onSelect = onSelect
        self.selectedIndex = channels.firstIndex(where: { $0.selected }) ?? 0
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.55)

        let panel = UIView()
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.backgroundColor = UIColor(white: 0.1, alpha: 0.97)
        panel.layer.cornerRadius = 22
        panel.clipsToBounds = true
        view.addSubview(panel)

        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Channels"
        title.font = .systemFont(ofSize: 38, weight: .bold)
        title.textColor = .white
        panel.addSubview(title)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 110
        tableView.remembersLastFocusedIndexPath = true
        tableView.register(ChannelRowCell.self, forCellReuseIdentifier: "channel")
        panel.addSubview(tableView)

        NSLayoutConstraint.activate([
            panel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            panel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            panel.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            panel.widthAnchor.constraint(equalToConstant: 980),

            title.topAnchor.constraint(equalTo: panel.topAnchor, constant: 40),
            title.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: 56),

            tableView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: panel.trailingAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: panel.bottomAnchor, constant: -24),
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard channels.indices.contains(selectedIndex) else { return }
        tableView.scrollToRow(
            at: IndexPath(row: selectedIndex, section: 0), at: .middle, animated: false)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        channels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "channel", for: indexPath)
            as! ChannelRowCell
        let channel = channels[indexPath.row]
        cell.configure(
            number: channel.number, name: channel.name, program: channel.programName,
            logoUrl: channel.logoUrl, isCurrent: channel.selected)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = channels[indexPath.row]
        dismiss(animated: true) { [onSelect] in
            onSelect(channel.id)
        }
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses where press.type == .menu {
            dismiss(animated: true)
            return
        }
        super.pressesBegan(presses, with: event)
    }
}

private final class ChannelRowCell: UITableViewCell {
    private let logoView = UIImageView()
    private let numberLabel = UILabel()
    private let nameLabel = UILabel()
    private let programLabel = UILabel()
    private let liveTag = PaddedLabel()
    private var logoUrl = ""

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none

        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.contentMode = .scaleAspectFit
        logoView.backgroundColor = UIColor(white: 1, alpha: 0.08)
        logoView.layer.cornerRadius = 8
        logoView.clipsToBounds = true
        contentView.addSubview(logoView)

        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.font = .monospacedDigitSystemFont(ofSize: 28, weight: .bold)
        numberLabel.textColor = UIColor(white: 1, alpha: 0.7)
        numberLabel.textAlignment = .center
        contentView.addSubview(numberLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 1
        contentView.addSubview(nameLabel)

        programLabel.translatesAutoresizingMaskIntoConstraints = false
        programLabel.font = .systemFont(ofSize: 22, weight: .regular)
        programLabel.textColor = UIColor(white: 1, alpha: 0.55)
        programLabel.numberOfLines = 1
        contentView.addSubview(programLabel)

        liveTag.translatesAutoresizingMaskIntoConstraints = false
        liveTag.text = "NOW PLAYING"
        liveTag.font = .systemFont(ofSize: 18, weight: .bold)
        liveTag.textColor = .white
        liveTag.backgroundColor = UIColor(red: 0.9, green: 0.1, blue: 0.55, alpha: 1)
        liveTag.layer.cornerRadius = 6
        liveTag.clipsToBounds = true
        liveTag.isHidden = true
        contentView.addSubview(liveTag)

        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 12),
            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            numberLabel.widthAnchor.constraint(equalToConstant: 84),

            logoView.leadingAnchor.constraint(
                equalTo: numberLabel.trailingAnchor, constant: 12),
            logoView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 120),
            logoView.heightAnchor.constraint(equalToConstant: 72),

            nameLabel.leadingAnchor.constraint(
                equalTo: logoView.trailingAnchor, constant: 24),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: liveTag.leadingAnchor, constant: -16),

            programLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            programLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor, constant: 4),
            programLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: liveTag.leadingAnchor, constant: -16),

            liveTag.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16),
            liveTag.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(
        number: String, name: String, program: String, logoUrl: String, isCurrent: Bool
    ) {
        numberLabel.text = number
        nameLabel.text = name
        programLabel.text = program
        programLabel.isHidden = program.isEmpty
        liveTag.isHidden = !isCurrent
        self.logoUrl = logoUrl
        logoView.image = nil
        guard !logoUrl.isEmpty, let url = URL(string: logoUrl) else { return }
        let expected = logoUrl
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            let image = data.flatMap { UIImage(data: $0) }
            DispatchQueue.main.async {
                guard let self, self.logoUrl == expected else { return }
                self.logoView.image = image
            }
        }.resume()
    }

    override func didUpdateFocus(
        in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator
    ) {
        coordinator.addCoordinatedAnimations {
            if self.isFocused {
                self.backgroundColor = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 0.9)
                self.numberLabel.textColor = .white
                self.programLabel.textColor = UIColor(white: 1, alpha: 0.85)
            } else {
                self.backgroundColor = .clear
                self.numberLabel.textColor = UIColor(white: 1, alpha: 0.7)
                self.programLabel.textColor = UIColor(white: 1, alpha: 0.55)
            }
        }
    }
}

private final class StillWatchingViewController: UIViewController {
    private let onContinue: () -> Void
    private let onExit: () -> Void

    init(onContinue: @escaping () -> Void, onExit: @escaping () -> Void) {
        self.onContinue = onContinue
        self.onExit = onExit
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)

        let panel = UIView()
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.backgroundColor = UIColor(white: 0.1, alpha: 0.97)
        panel.layer.cornerRadius = 22
        view.addSubview(panel)

        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Are you still watching?"
        title.font = .systemFont(ofSize: 40, weight: .bold)
        title.textColor = .white
        title.textAlignment = .center
        panel.addSubview(title)

        let continueButton = UIButton(type: .system)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("Continue Watching", for: .normal)
        continueButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .semibold)
        continueButton.addAction(
            UIAction { [weak self] _ in
                self?.dismiss(animated: true) { self?.onContinue() }
            }, for: .primaryActionTriggered)

        let exitButton = UIButton(type: .system)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.setTitle("Exit", for: .normal)
        exitButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .semibold)
        exitButton.addAction(
            UIAction { [weak self] _ in
                self?.dismiss(animated: true) { self?.onExit() }
            }, for: .primaryActionTriggered)

        let buttons = UIStackView(arrangedSubviews: [continueButton, exitButton])
        buttons.translatesAutoresizingMaskIntoConstraints = false
        buttons.axis = .horizontal
        buttons.spacing = 40
        buttons.distribution = .fillEqually
        panel.addSubview(buttons)

        NSLayoutConstraint.activate([
            panel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            panel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            panel.widthAnchor.constraint(equalToConstant: 820),

            title.topAnchor.constraint(equalTo: panel.topAnchor, constant: 56),
            title.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: 56),
            title.trailingAnchor.constraint(equalTo: panel.trailingAnchor, constant: -56),

            buttons.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 48),
            buttons.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: 80),
            buttons.trailingAnchor.constraint(equalTo: panel.trailingAnchor, constant: -80),
            buttons.bottomAnchor.constraint(equalTo: panel.bottomAnchor, constant: -56),
        ])
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses where press.type == .menu {
            dismiss(animated: true) { self.onExit() }
            return
        }
        super.pressesBegan(presses, with: event)
    }
}

private final class SyncPlayPanelViewController: UIViewController {
    private let groupName: String
    private let participants: [String]
    private var ignoreWait: Bool
    private let onIgnoreWait: (Bool) -> Void
    private let onLeave: () -> Void
    private let ignoreWaitButton = UIButton(type: .system)

    init(
        groupName: String, participants: [String], ignoreWait: Bool,
        onIgnoreWait: @escaping (Bool) -> Void, onLeave: @escaping () -> Void
    ) {
        self.groupName = groupName
        self.participants = participants
        self.ignoreWait = ignoreWait
        self.onIgnoreWait = onIgnoreWait
        self.onLeave = onLeave
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.6)

        let panel = UIView()
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.backgroundColor = UIColor(white: 0.1, alpha: 0.97)
        panel.layer.cornerRadius = 22
        view.addSubview(panel)

        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = groupName
        title.font = .systemFont(ofSize: 38, weight: .bold)
        title.textColor = .white
        panel.addSubview(title)

        let countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.text = participants.count == 1
            ? "1 participant" : "\(participants.count) participants"
        countLabel.font = .systemFont(ofSize: 24, weight: .regular)
        countLabel.textColor = UIColor(white: 1, alpha: 0.6)
        panel.addSubview(countLabel)

        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 8
        for participant in participants {
            let label = UILabel()
            label.text = participant
            label.font = .systemFont(ofSize: 24, weight: .medium)
            label.textColor = .white
            stack.addArrangedSubview(label)
        }
        panel.addSubview(stack)

        ignoreWaitButton.translatesAutoresizingMaskIntoConstraints = false
        ignoreWaitButton.titleLabel?.font = .systemFont(ofSize: 28, weight: .semibold)
        updateIgnoreWaitTitle()
        ignoreWaitButton.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                self.ignoreWait.toggle()
                self.updateIgnoreWaitTitle()
                self.onIgnoreWait(self.ignoreWait)
            }, for: .primaryActionTriggered)
        panel.addSubview(ignoreWaitButton)

        let leaveButton = UIButton(type: .system)
        leaveButton.translatesAutoresizingMaskIntoConstraints = false
        leaveButton.setTitle("Leave Group", for: .normal)
        leaveButton.setTitleColor(
            UIColor(red: 0.95, green: 0.3, blue: 0.3, alpha: 1), for: .normal)
        leaveButton.titleLabel?.font = .systemFont(ofSize: 28, weight: .semibold)
        leaveButton.addAction(
            UIAction { [weak self] _ in
                self?.dismiss(animated: true) { self?.onLeave() }
            }, for: .primaryActionTriggered)
        panel.addSubview(leaveButton)

        NSLayoutConstraint.activate([
            panel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            panel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            panel.widthAnchor.constraint(equalToConstant: 820),

            title.topAnchor.constraint(equalTo: panel.topAnchor, constant: 48),
            title.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: 56),

            countLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 6),
            countLabel.leadingAnchor.constraint(equalTo: title.leadingAnchor),

            stack.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 24),
            stack.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: panel.trailingAnchor, constant: -56),

            ignoreWaitButton.topAnchor.constraint(
                equalTo: stack.bottomAnchor, constant: 32),
            ignoreWaitButton.leadingAnchor.constraint(equalTo: title.leadingAnchor),

            leaveButton.topAnchor.constraint(
                equalTo: ignoreWaitButton.bottomAnchor, constant: 16),
            leaveButton.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            leaveButton.bottomAnchor.constraint(equalTo: panel.bottomAnchor, constant: -48),
        ])
    }

    private func updateIgnoreWaitTitle() {
        ignoreWaitButton.setTitle(
            ignoreWait ? "Ignore Wait: On" : "Ignore Wait: Off", for: .normal)
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses where press.type == .menu {
            dismiss(animated: true)
            return
        }
        super.pressesBegan(presses, with: event)
    }
}
