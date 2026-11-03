import CoreText
import QuartzCore
import UIKit

#if os(iOS)
import AVKit
import MediaPlayer
#endif

// Localized prompt text pushed from Dart. The literals are the English
// fallback for the window before the push arrives.
struct PromptStrings {
    var endsInTemplate = "Ends in {time}"
    var upNext = "Up Next"
    var playNext = "Play Next"
    var stillWatchingTitle = "Still Watching?"
    var stillWatchingBody = "Playback has been paused. Are you still watching?"
    var stillWatchingContinue = "Continue"
    var stillWatchingStop = "Stop"
    var fetchingSubtitles = "Fetching subtitles"

    func endsIn(_ time: String) -> String {
        endsInTemplate.replacingOccurrences(of: "{time}", with: time)
    }
}

/// Mirrors the Dart PlaybackTimeSlot enum by name.
enum TimeSlot: String {
    case none, elapsed, totalDuration, timeRemaining, endsAt, time
}

/// Defaults match the Dart preferences, so the bar reads the same before the
/// host has pushed anything.
struct TimeSlotConfig {
    var aboveLeft = TimeSlot.none
    var aboveCenter = TimeSlot.none
    var aboveRight = TimeSlot.endsAt
    var belowLeft = TimeSlot.elapsed
    var belowCenter = TimeSlot.none
    var belowRight = TimeSlot.totalDuration
    var use24Hour = false
    var endsAtTemplate = "Ends at {time}"

    func endsAt(_ time: String) -> String {
        endsAtTemplate.replacingOccurrences(of: "{time}", with: time)
    }
}

/// A fixed locale so the label reads the same as the Dart formatter on the other
/// platforms instead of following the device region.
///
/// It sits outside the view controller because the formatter is built in a stored
/// property initializer, and those can't reference `Self`.
private func makeClockFormatter(use24Hour: Bool) -> DateFormatter {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = use24Hour ? "HH:mm" : "h:mm a"
    return formatter
}

final class NativeApplePlayerViewController: UIViewController {
    private let player: AetherPlayerWrapper
    var onExit: (() -> Void)?
    var onNext: (() -> Void)?
    var onPrevious: (() -> Void)?
    var onSelectAudio: ((Int) -> Void)?
    var onSelectSubtitle: ((Int) -> Void)?
    var onSubtitleAction: (([String: Any]) -> Void)?
    var onSetSpeed: ((Double) -> Void)?
    var onSetBitrate: ((Int) -> Void)?
    var onSelectChannel: ((String) -> Void)?
    var onOpenGuide: (() -> Void)?
    var onRecord: (() -> Void)?
    var onToggleOrientation: (() -> Void)?
    var onToggleFavorite: (() -> Void)?
    var onStillWatchingContinue: (() -> Void)?
    var onStillWatchingStop: (() -> Void)?
    var onNextUpPlay: (() -> Void)?
    var onNextUpCancel: (() -> Void)?
    var onNextUpDismiss: (() -> Void)?
    var onSkipSegmentSelect: (() -> Void)?
    /// Sends remote Skip actions back to Dart.
    var onCinemaSkipAction: ((String, Int) -> Void)?
    /// Fires with the target after a scrub or a direct jump the user made.
    /// Carrying the position lets the host hand it to SyncPlay, which is the
    /// only way a seek made on this player reaches the rest of the group.
    var onUserSeek: ((Int) -> Void)?
    var onSearchSubtitles: (() -> Void)?
    var onSubtitleDelayChanged: ((Int) -> Void)?
    var onDownloadSubtitle: ((String) -> Void)?
    var onSyncplayLeave: (() -> Void)?
    var onSyncplayIgnoreWait: ((Bool) -> Void)?
    var onOpenCastPerson: ((String) -> Void)?
    var onOpenEpisodes: (() -> Void)?
    var onSelectEpisodesSeason: ((String) -> Void)?
    var onSelectEpisode: ((String) -> Void)?
    var onEpisodesClosed: (() -> Void)?
    var baseSubtitlePos = 92
    private var didAttachSurface = false
    /// Set while the channel takes the player off screen for Flutter UI, so
    /// leaving the window doesn't stop playback or count as the user exiting.
    var keepsPlayingWhileHidden = false
    private var isOnScreen = false
    /// A message that arrived while the player was on its way onto the screen,
    /// which UIKit won't present over yet.
    private var pendingMessage: (() -> Void)?
    private var updateTimer: Timer?
    private var lastShowAt: TimeInterval = 0
    private var osdDismissed = false
    private var subtitlesRaised = false

    private var skipForwardMs = 30000
    private var skipBackMs = 10000
    private var audioTracks: [(index: Int, label: String, subtitle: String, selected: Bool)] = []
    private var subtitleTracks: [(index: Int, label: String, subtitle: String, selected: Bool)] = []
    private var subtitleControls: [String: Any] = [:]
    private var streamInfoSections: [[String: Any]] = []
    private var streamInfoTitle = "Playback Information"
    private var streamInfoDroppedFramesLabel = "Dropped Frames"
    private var hasCast = false
    private var castPeople:
        [(name: String, subtitle: String, imageUrl: String, personId: String)] = []
    private var canFavorite = false
    private var isFavorite = false
    private var canDownloadSubtitles = false
    private var canBrowseEpisodes = false
    private weak var episodeBrowser: EpisodeBrowserViewController?
    /// The searching / downloading alert. Dart raises and clears it, so both
    /// halves of the flow report their own ending instead of the search one
    /// falling through to "No Subtitles Found" whatever went wrong.
    private weak var subtitleProgressAlert: UIAlertController?
    // Alert action handlers, kept so the session remote can run them.
    private var remoteMenuActions: [ObjectIdentifier: (UIAlertAction) -> Void] = [:]
    private var remoteMenuTransition = false
    private var pendingRemoteMenuCommands: [String] = []
    /// The buttons the player button settings left switched on, in the order
    /// the user put them in. Nil until the Dart side sends one, and the row
    /// offers everything until then.
    private var osdButtonOrder: [String]?
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
    private var trickplaySheetsLoading: Set<Int> = []
    private var trickplayMode: TrickplayMode = .single
    private var trickplayScalePercent = 30
    private var trickplayVerticalPercent = 0
    private var trickplayFollowScrub = true
    private var trickplayPauseWhileScrubbing = true

    // The Next Up card, skip button, and Still Watching prompt are pure
    // renderers. The Dart side owns every decision (when to show, the
    // authoritative countdown, what a press does) so tvOS behaves exactly
    // like the Flutter player. The deadline below only draws the countdown.
    private var nextUpVisible = false
    private var nextUpFocusOnPlay = true
    private var nextUpCountdownDeadline: CFTimeInterval = 0
    private var nextUpCountdownTotalMs = 0
    private var nextUpCountdownStyle = "both"

    private var pauseMeta: (overview: String, imageUrl: String)?

    private var skipSegmentActive = false
    private var cinemaSkipActive = false
    private var cinemaSkipGeneration = 0
    private var skipBottomConstraint: NSLayoutConstraint?
    private let skipSegmentButton = UIView()
    private let skipSegmentGlass = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    private let skipSegmentRow = UIStackView()
    private let skipSegmentIcon = UIImageView()
    private let skipSegmentLabel = UILabel()
    private let skipSegmentTimerLabel = UILabel()
    private let skipSegmentRingContainer = UIView()
    private let skipSegmentRingTrack = CAShapeLayer()
    private let skipSegmentRing = CAShapeLayer()
    private let skipSegmentRingNumber = UILabel()
    private let skipSegmentRingIcon = UIImageView()
    private var skipSegmentStartMs = 0
    private var skipSegmentEndMs = 0
    private var skipSegmentCountdownStyle = "none"
    private let skipRingSize: CGFloat = 72

    private let loadingOverlay = UIView()
    private let loadingSpinner = UIActivityIndicatorView(style: .large)
    private var loadingDismissed = false
    private let subtitleLoadingPill = UIView()
    private let subtitleLoadingSpinner = UIActivityIndicatorView(style: .medium)
    private let subtitleLoadingLabel = UILabel()
    private var subtitleLoadingSince: CFTimeInterval?
    private var subtitleLoadingAboveOsd: NSLayoutConstraint?
    private var subtitleLoadingInCorner: NSLayoutConstraint?

    private var isLive = false
    private var liveProgram:
        (
            name: String, episodeTitle: String, episodeLine: String, startMs: Int, endMs: Int,
            hasTimer: Bool, hasSeriesTimer: Bool
        )?
    /// Set while the airing on now can be recorded. It says whether a series
    /// rule covers it and whether it has a timer of its own, which means it's
    /// recording.
    private var liveRecord: (series: Bool, timer: Bool)?
    /// The rotation lock a live player on a phone or tablet carries, true
    /// while it holds landscape. Nil leaves its button out.
    private var orientationLock: Bool?
    private var liveChannelNumber = ""
    private var channelList: [ChannelCarouselEntry] = []
    private var selectedChannelIndex = 0
    private weak var channelCarousel: ChannelCarouselOverlayViewController?
    private var streamStats: [(label: String, value: String)] = []

    private var scrubTargetMs: Int?
    // Shown on the scrubber from the commit until the player has landed, so
    // the timeline never jumps back to the old position for a frame.
    private var scrubFrozenMs: Int?
    // Bumped whenever a new gesture or an outside seek starts, so an older
    // commit still waiting to land can't resume playback under the new one.
    private var scrubCommitId = 0
    private var scrubConvergeTimer: Timer?
    private var scrubConvergeDeadline: TimeInterval = 0
    private var wasPlayingBeforeScrub = false
    private var scrubHoldTimer: Timer?
    private var scrubHoldForward = false
    private var scrubHoldStart: TimeInterval = 0
    private var panScrubEngaged = false
    private var panScrubLastTranslationX: CGFloat = 0
    // A touch pan borrows the scrubber zone while it runs. The zone the user
    // was in is restored when the pan ends so the control bar stays reachable.
    private var zoneBeforePanScrub: Zone?

    private struct TrickplayData {
        let urls: [String]
        let headers: [String: String]
        let width: Int
        let height: Int
        let cols: Int
        let rows: Int
        let intervalMs: Int
        let timestampsMs: [Int]
    }

    private enum TrickplayMode: String { case disabled, single, strip, full }

    private enum Zone { case scrubber, buttons }
    private enum ControlId {
        case prev, skipBack, playPause, skipForward, next
        case speed, chapters, episodes, subtitles, audio, cast, quality, zoom, info
        case channels, favorite, guide, syncplay, goLive, record, orientation
    }
    private var focusedZone: Zone = .buttons
    private var focusedControlIndex = 0
    private var controls: [ControlId] = []
    private var controlViews: [ControlId: UIView] = [:]
    private var controlIcons: [ControlId: UIImageView] = [:]

    private let osdContainer = UIView()
    private let gradientLayer = CAGradientLayer()
    private let scrubber = UIProgressView(progressViewStyle: .default)
    private let aboveRow = UIView()
    private let belowRow = UIView()
    private let aboveLeftLabel = UILabel()
    private let aboveCenterLabel = UILabel()
    private let aboveRightLabel = UILabel()
    private let belowLeftLabel = UILabel()
    private let belowCenterLabel = UILabel()
    private let belowRightLabel = UILabel()
    private let chapterOverlay = UIView()
    private let controlBar = UIView()
    private let controlStack = UIStackView()

    #if os(iOS)
    /// The whole player is shrunk to fit a phone or tablet, so the buttons are
    /// drawn larger to stay a comfortable size to tap once scaled.
    private static let controlSize: CGFloat = 120
    #else
    private static let controlSize: CGFloat = 64
    #endif
    private static var controlScale: CGFloat { controlSize / 64 }
    /// The size the current row of buttons is drawn at. Only iOS shrinks it.
    private var controlSide = controlSize
    #if os(iOS)
    /// Set from Dart. Off, the transport sits in the middle of the picture the
    /// way the Flutter player draws it on a touch screen.
    private var transportDocked = true
    private let centerTransport = UIStackView()
    private var builtCenterControls: [ControlId] = []
    private static let transportIds: Set<ControlId> = [
        .prev, .skipBack, .playPause, .skipForward, .next,
    ]
    /// Set from Dart: the volume and brightness swipes setting, and whether
    /// their indicators sit on the side opposite the swipe.
    private var swipeGesturesEnabled = false
    private var gestureIndicatorsInverted = false
    private var panDirectionDecided = false
    private var panStartInWindow = CGPoint.zero
    private var verticalSwipe: (isVolume: Bool, startValue: Float)?
    /// The brightness before the first swipe changed it, put back when the
    /// player closes or the app goes to the background.
    private var brightnessBeforeSwipe: (screen: UIScreen, value: CGFloat)?
    private let brightnessIndicator = GestureIndicatorView()
    private let volumeIndicator = GestureIndicatorView()
    private let speedHold = UILongPressGestureRecognizer()
    /// The speed to go back to when a hold for 2x ends.
    private var speedBeforeHold: Double?
    private let speedHoldIndicator = UILabel()
    /// Kept in the view because UIKit raises its own volume HUD over the
    /// player otherwise, and its slider is the only way to set the volume.
    private let volumeView = MPVolumeView(frame: CGRect(x: -400, y: -400, width: 200, height: 40))
    #endif
    private let reconnectView = UIStackView()
    private let reconnectSpinner = UIActivityIndicatorView(style: .large)
    private let reconnectLabel = UILabel()
    private let tooltipView = UIView()
    private let tooltipLabel = UILabel()

    private let trickplayContainer = UIView()
    private let trickplayImageView = UIImageView()
    private let trickplayStrip = UIView()
    private var trickplayStripTiles: [UIImageView] = []
    private let trickplayCover = UIImageView()

    private let osdScrim = UIView()
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
    private let recordingDot = RecordingMarkView(diameter: 18)
    private let programLabel = UILabel()
    private let upNextLabel = UILabel()

    private let defaultAccent = UIColor(red: 0.9, green: 0.1, blue: 0.55, alpha: 1)
    private var glassActive = false
    private var hasThemeConfig = false
    private var glassAccent = UIColor(red: 0.04, green: 0.52, blue: 1.0, alpha: 1)
    private var glassRangeProgress = UIColor(red: 0.04, green: 0.52, blue: 1.0, alpha: 1)
    private var glassRangeTrack = UIColor(white: 1, alpha: 0.2)
    private var glassSurface = UIColor(white: 1, alpha: 0.12)
    private var glassSurfaceVariant = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
    private var glassOnSurface = UIColor.white
    // Dart pushes the accent for every theme, not only glass ones, so this is
    // the accent every prompt surface renders with. The pink constant only
    // covers the window before the first theme config arrives.
    private var themeAccent: UIColor { hasThemeConfig ? glassAccent : defaultAccent }
    private var promptStrings = PromptStrings()
    private let statsStack = UIStackView()

    private let nextUpCard = UIView()
    private let nextUpImage = UIImageView()
    private let nextUpEpisodeLabel = UILabel()
    private let nextUpTitleLabel = UILabel()
    private let nextUpCountdownLabel = UILabel()
    private let nextUpPlayButton = UIView()
    private let nextUpPlayLabel = UILabel()
    private let nextUpCancelButton = UIView()
    private let nextUpCancelIcon = UIImageView()
    private let nextUpRing = CAShapeLayer()
    private var nextUpCardWidth: NSLayoutConstraint?
    private var nextUpImageHeight: NSLayoutConstraint?

    private let pauseOverlay = UIView()
    private let pauseImage = UIImageView()
    private let pauseTitleLabel = UILabel()
    private let pauseTextLabel = UILabel()

    private var chapters: [(title: String, startMs: Int)] = []
    private var showChapterMarkers = false

    private var timeSlots = TimeSlotConfig()
    private var clockFormatter = makeClockFormatter(use24Hour: false)

    init(player: AetherPlayerWrapper) {
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
        #if os(tvOS)
        setupSwipeGestures()
        #else
        setupTouchGestures()
        setupCenterTransport()
        #endif
        rebuildControls()
        layoutHeader()
        rebuildStats()
        restyleForTheme()
    }

    func applyThemeConfig(_ args: [String: Any]) {
        glassActive = (args["isGlass"] as? Bool) ?? false
        hasThemeConfig = true
        if let v = (args["accent"] as? NSNumber)?.intValue {
            glassAccent = Self.color(fromARGB: v)
        }
        if let v = (args["surface"] as? NSNumber)?.intValue {
            glassSurface = Self.color(fromARGB: v)
        }
        if let v = (args["surfaceVariant"] as? NSNumber)?.intValue {
            glassSurfaceVariant = Self.color(fromARGB: v)
        }
        if let v = (args["onSurface"] as? NSNumber)?.intValue {
            glassOnSurface = Self.color(fromARGB: v)
        }
        if let v = (args["rangeProgress"] as? NSNumber)?.intValue {
            glassRangeProgress = Self.color(fromARGB: v)
        }
        if let v = (args["rangeTrack"] as? NSNumber)?.intValue {
            glassRangeTrack = Self.color(fromARGB: v)
        }
        if isViewLoaded {
            restyleForTheme()
        }
    }

    private static func color(fromARGB value: Int) -> UIColor {
        let a = CGFloat((value >> 24) & 0xFF) / 255.0
        let r = CGFloat((value >> 16) & 0xFF) / 255.0
        let g = CGFloat((value >> 8) & 0xFF) / 255.0
        let b = CGFloat(value & 0xFF) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }

    /// The row keeps the label's line height even when every slot in it is
    /// empty, so the scrubber does not move when a user hides the times.
    private func setupTimeRow(
        _ row: UIView, leading: UILabel, center: UILabel, trailing: UILabel, fontSize: CGFloat
    ) {
        let font = UIFont.monospacedDigitSystemFont(ofSize: fontSize, weight: .medium)
        row.translatesAutoresizingMaskIntoConstraints = false
        osdContainer.addSubview(row)
        row.heightAnchor.constraint(equalToConstant: font.lineHeight).isActive = true
        for label in [leading, center, trailing] {
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = font
            label.textColor = UIColor(white: 1, alpha: 0.7)
            row.addSubview(label)
            label.centerYAnchor.constraint(equalTo: row.centerYAnchor).isActive = true
        }
        NSLayoutConstraint.activate([
            leading.leadingAnchor.constraint(equalTo: row.leadingAnchor),
            center.centerXAnchor.constraint(equalTo: row.centerXAnchor),
            trailing.trailingAnchor.constraint(equalTo: row.trailingAnchor),
        ])
    }

    func applyTimeSlots(_ args: [String: Any]) {
        func slot(_ key: String) -> TimeSlot? {
            (args[key] as? String).flatMap(TimeSlot.init(rawValue:))
        }
        if let v = slot("aboveLeft") { timeSlots.aboveLeft = v }
        if let v = slot("aboveCenter") { timeSlots.aboveCenter = v }
        if let v = slot("aboveRight") { timeSlots.aboveRight = v }
        if let v = slot("belowLeft") { timeSlots.belowLeft = v }
        if let v = slot("belowCenter") { timeSlots.belowCenter = v }
        if let v = slot("belowRight") { timeSlots.belowRight = v }
        if let v = args["use24Hour"] as? Bool, v != timeSlots.use24Hour {
            timeSlots.use24Hour = v
            clockFormatter = makeClockFormatter(use24Hour: v)
        }
        if let v = args["endsAt"] as? String { timeSlots.endsAtTemplate = v }
        if isViewLoaded {
            renderProgress()
        }
    }

    func applyPromptStrings(_ args: [String: Any]) {
        if let v = args["endsIn"] as? String { promptStrings.endsInTemplate = v }
        if let v = args["upNext"] as? String { promptStrings.upNext = v }
        if let v = args["playNext"] as? String { promptStrings.playNext = v }
        if let v = args["stillWatchingTitle"] as? String { promptStrings.stillWatchingTitle = v }
        if let v = args["stillWatchingBody"] as? String { promptStrings.stillWatchingBody = v }
        if let v = args["stillWatchingContinue"] as? String { promptStrings.stillWatchingContinue = v }
        if let v = args["stillWatchingStop"] as? String { promptStrings.stillWatchingStop = v }
        if let v = args["fetchingSubtitles"] as? String { promptStrings.fetchingSubtitles = v }
        if isViewLoaded {
            upNextLabel.text = promptStrings.upNext.uppercased()
            nextUpPlayLabel.text = promptStrings.playNext
            subtitleLoadingLabel.text = promptStrings.fetchingSubtitles
        }
    }

    private func restyleForTheme() {
        let accent = themeAccent
        scrubber.progressTintColor = glassActive ? glassRangeProgress : accent
        channelBadge.backgroundColor = accent
        upNextLabel.textColor = accent
        skipSegmentButton.layer.borderColor = accent.cgColor
        skipSegmentIcon.tintColor = accent
        skipSegmentRingIcon.tintColor = accent
        skipSegmentRing.strokeColor = accent.cgColor
        nextUpPlayButton.backgroundColor = accent
    }

    private func setupOsd() {
        osdScrim.translatesAutoresizingMaskIntoConstraints = false
        osdScrim.backgroundColor = UIColor(white: 0, alpha: 0.3)
        osdScrim.alpha = 0
        view.addSubview(osdScrim)
        NSLayoutConstraint.activate([
            osdScrim.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            osdScrim.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            osdScrim.topAnchor.constraint(equalTo: view.topAnchor),
            osdScrim.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

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
            osdContainer.heightAnchor.constraint(equalToConstant: 296 + Self.controlSize),
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
        #if os(iOS)
        // Spread across the width so each button gets room around it.
        controlStack.distribution = .equalSpacing
        #endif
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

        setupTimeRow(
            aboveRow, leading: aboveLeftLabel, center: aboveCenterLabel, trailing: aboveRightLabel,
            fontSize: 24)
        setupTimeRow(
            belowRow, leading: belowLeftLabel, center: belowCenterLabel, trailing: belowRightLabel,
            fontSize: 26)

        #if os(iOS)
        let controlStackTrailing = controlStack.trailingAnchor.constraint(
            equalTo: controlBar.trailingAnchor)
        #else
        let controlStackTrailing = controlStack.trailingAnchor.constraint(
            lessThanOrEqualTo: controlBar.trailingAnchor)
        #endif

        NSLayoutConstraint.activate([
            controlBar.leadingAnchor.constraint(
                equalTo: osdContainer.leadingAnchor, constant: 90),
            controlBar.trailingAnchor.constraint(
                equalTo: osdContainer.trailingAnchor, constant: -90),
            controlBar.bottomAnchor.constraint(
                equalTo: osdContainer.bottomAnchor, constant: -56),
            controlBar.heightAnchor.constraint(equalToConstant: Self.controlSize + 8),

            controlStack.leadingAnchor.constraint(equalTo: controlBar.leadingAnchor),
            controlStack.centerYAnchor.constraint(equalTo: controlBar.centerYAnchor),
            controlStackTrailing,

            belowRow.leadingAnchor.constraint(equalTo: controlBar.leadingAnchor),
            belowRow.trailingAnchor.constraint(equalTo: controlBar.trailingAnchor),
            belowRow.bottomAnchor.constraint(
                equalTo: controlBar.topAnchor, constant: -16),

            scrubber.leadingAnchor.constraint(equalTo: controlBar.leadingAnchor),
            scrubber.trailingAnchor.constraint(equalTo: controlBar.trailingAnchor),
            scrubber.bottomAnchor.constraint(
                equalTo: belowRow.topAnchor, constant: -10),
            scrubber.heightAnchor.constraint(equalToConstant: 6),

            chapterOverlay.leadingAnchor.constraint(equalTo: scrubber.leadingAnchor),
            chapterOverlay.trailingAnchor.constraint(equalTo: scrubber.trailingAnchor),
            chapterOverlay.centerYAnchor.constraint(equalTo: scrubber.centerYAnchor),
            chapterOverlay.heightAnchor.constraint(equalToConstant: 16),

            aboveRow.leadingAnchor.constraint(equalTo: controlBar.leadingAnchor),
            aboveRow.trailingAnchor.constraint(equalTo: controlBar.trailingAnchor),
            aboveRow.bottomAnchor.constraint(
                equalTo: scrubber.topAnchor, constant: -8),
        ])

        setupTrickplay()
        setupNextUpCard()
        setupPauseOverlay()
        setupLiveOverlays()
        setupReconnectOverlay()
        setupSkipSegment()
        setupSubtitleLoadingPill()
        setupLoadingOverlay()
    }

    private func setupReconnectOverlay() {
        reconnectView.translatesAutoresizingMaskIntoConstraints = false
        reconnectView.axis = .vertical
        reconnectView.alignment = .center
        reconnectView.spacing = 32
        reconnectView.isHidden = true
        reconnectView.isUserInteractionEnabled = false
        reconnectSpinner.color = themeAccent
        reconnectSpinner.hidesWhenStopped = true
        reconnectLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        reconnectLabel.textColor = .white
        reconnectView.addArrangedSubview(reconnectSpinner)
        reconnectView.addArrangedSubview(reconnectLabel)
        view.insertSubview(reconnectView, belowSubview: osdScrim)
        #if os(iOS)
        // Clear of the play button a touch screen draws in the middle.
        let below: CGFloat = 260
        #else
        let below: CGFloat = 0
        #endif
        NSLayoutConstraint.activate([
            reconnectView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reconnectView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: below),
        ])
    }

    func setReconnecting(_ label: String?) {
        let text = label ?? ""
        reconnectLabel.text = text
        reconnectView.isHidden = text.isEmpty
        if text.isEmpty {
            reconnectSpinner.stopAnimating()
        } else {
            reconnectSpinner.startAnimating()
        }
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

    // Shown while the chosen external subtitle downloads, which takes a while
    // when the server has to extract it first. It sits above the controls when
    // they're up and drops to the corner when they hide, so it stays in view
    // for the whole wait.
    private func setupSubtitleLoadingPill() {
        subtitleLoadingPill.translatesAutoresizingMaskIntoConstraints = false
        subtitleLoadingPill.backgroundColor = UIColor(white: 0, alpha: 0.55)
        subtitleLoadingPill.layer.cornerRadius = 16
        subtitleLoadingPill.isHidden = true
        view.addSubview(subtitleLoadingPill)

        subtitleLoadingSpinner.color = .white
        subtitleLoadingSpinner.hidesWhenStopped = true
        subtitleLoadingLabel.font = .systemFont(ofSize: 26, weight: .semibold)
        subtitleLoadingLabel.textColor = UIColor(white: 1, alpha: 0.85)
        subtitleLoadingLabel.text = promptStrings.fetchingSubtitles

        let row = UIStackView(arrangedSubviews: [subtitleLoadingSpinner, subtitleLoadingLabel])
        row.translatesAutoresizingMaskIntoConstraints = false
        row.axis = .horizontal
        row.alignment = .center
        row.spacing = 12
        subtitleLoadingPill.addSubview(row)

        let aboveOsd = subtitleLoadingPill.bottomAnchor.constraint(
            equalTo: aboveRow.topAnchor, constant: -16)
        subtitleLoadingAboveOsd = aboveOsd
        subtitleLoadingInCorner = subtitleLoadingPill.bottomAnchor.constraint(
            equalTo: view.bottomAnchor, constant: -56)
        NSLayoutConstraint.activate([
            subtitleLoadingPill.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 90),
            aboveOsd,
            row.leadingAnchor.constraint(equalTo: subtitleLoadingPill.leadingAnchor, constant: 18),
            row.trailingAnchor.constraint(
                equalTo: subtitleLoadingPill.trailingAnchor, constant: -22),
            row.topAnchor.constraint(equalTo: subtitleLoadingPill.topAnchor, constant: 10),
            row.bottomAnchor.constraint(equalTo: subtitleLoadingPill.bottomAnchor, constant: -10),
        ])
    }

    private func updateSubtitleLoadingPill(osdShown: Bool) {
        let now = CACurrentMediaTime()
        if loadingDismissed && player.isSubtitleLoading {
            if subtitleLoadingSince == nil { subtitleLoadingSince = now }
        } else {
            subtitleLoadingSince = nil
        }
        // A cached subtitle answers inside half a second and shouldn't flash it.
        let show = subtitleLoadingSince.map { now - $0 >= 0.5 } ?? false
        if subtitleLoadingPill.isHidden == show {
            subtitleLoadingPill.isHidden = !show
            if show {
                subtitleLoadingSpinner.startAnimating()
            } else {
                subtitleLoadingSpinner.stopAnimating()
            }
        }
        guard let aboveOsd = subtitleLoadingAboveOsd,
            let inCorner = subtitleLoadingInCorner,
            aboveOsd.isActive != osdShown
        else { return }
        if osdShown {
            inCorner.isActive = false
            aboveOsd.isActive = true
        } else {
            aboveOsd.isActive = false
            inCorner.isActive = true
        }
        if show {
            UIView.animate(withDuration: 0.25) { self.view.layoutIfNeeded() }
        }
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

    // Mirrors the Flutter SkipSegmentOverlay at the same 2x scale the Next Up
    // card uses: a glass capsule with an accent focus ring, skip icon, label,
    // optional inline timer, and an optional countdown ring that tracks the
    // segment off the player position.
    private func setupSkipSegment() {
        skipSegmentButton.translatesAutoresizingMaskIntoConstraints = false
        skipSegmentButton.layer.borderWidth = 4
        skipSegmentButton.layer.borderColor = themeAccent.cgColor
        skipSegmentButton.clipsToBounds = true
        skipSegmentButton.isHidden = true
        view.addSubview(skipSegmentButton)

        skipSegmentGlass.translatesAutoresizingMaskIntoConstraints = false
        skipSegmentButton.addSubview(skipSegmentGlass)

        skipSegmentRow.translatesAutoresizingMaskIntoConstraints = false
        skipSegmentRow.axis = .horizontal
        skipSegmentRow.alignment = .center
        skipSegmentButton.addSubview(skipSegmentRow)

        let iconConfig = UIImage.SymbolConfiguration(pointSize: 34, weight: .semibold)
        skipSegmentIcon.image = UIImage(systemName: "forward.end.fill", withConfiguration: iconConfig)
        skipSegmentIcon.tintColor = themeAccent

        skipSegmentLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        skipSegmentLabel.textColor = .white

        skipSegmentTimerLabel.font = .monospacedDigitSystemFont(ofSize: 28, weight: .semibold)
        skipSegmentTimerLabel.textColor = UIColor(white: 1, alpha: 0.5)

        skipSegmentRingContainer.translatesAutoresizingMaskIntoConstraints = false
        let ringPath = UIBezierPath(
            arcCenter: CGPoint(x: skipRingSize / 2, y: skipRingSize / 2),
            radius: skipRingSize / 2 - 3,
            startAngle: -.pi / 2,
            endAngle: .pi * 1.5,
            clockwise: true)
        for layer in [skipSegmentRingTrack, skipSegmentRing] {
            layer.fillColor = UIColor.clear.cgColor
            layer.lineWidth = 6
            layer.frame = CGRect(x: 0, y: 0, width: skipRingSize, height: skipRingSize)
            layer.path = ringPath.cgPath
            skipSegmentRingContainer.layer.addSublayer(layer)
        }
        skipSegmentRingTrack.strokeColor = UIColor(white: 1, alpha: 0.16).cgColor
        skipSegmentRing.strokeColor = themeAccent.cgColor

        skipSegmentRingNumber.translatesAutoresizingMaskIntoConstraints = false
        skipSegmentRingNumber.font = .monospacedDigitSystemFont(ofSize: 28, weight: .semibold)
        skipSegmentRingNumber.textColor = .white
        skipSegmentRingContainer.addSubview(skipSegmentRingNumber)

        let ringIconConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold)
        skipSegmentRingIcon.image = UIImage(systemName: "forward.end.fill", withConfiguration: ringIconConfig)
        skipSegmentRingIcon.tintColor = themeAccent
        skipSegmentRingIcon.translatesAutoresizingMaskIntoConstraints = false
        skipSegmentRingContainer.addSubview(skipSegmentRingIcon)

        for item in [skipSegmentIcon, skipSegmentLabel, skipSegmentTimerLabel, skipSegmentRingContainer] {
            skipSegmentRow.addArrangedSubview(item)
        }
        skipSegmentRow.setCustomSpacing(18, after: skipSegmentIcon)
        skipSegmentRow.setCustomSpacing(16, after: skipSegmentLabel)
        skipSegmentRow.setCustomSpacing(26, after: skipSegmentTimerLabel)

        let bottom = skipSegmentButton.bottomAnchor.constraint(
            equalTo: view.bottomAnchor, constant: -240)
        skipBottomConstraint = bottom
        NSLayoutConstraint.activate([
            skipSegmentButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -48),
            bottom,
            skipSegmentGlass.topAnchor.constraint(equalTo: skipSegmentButton.topAnchor),
            skipSegmentGlass.bottomAnchor.constraint(equalTo: skipSegmentButton.bottomAnchor),
            skipSegmentGlass.leadingAnchor.constraint(equalTo: skipSegmentButton.leadingAnchor),
            skipSegmentGlass.trailingAnchor.constraint(equalTo: skipSegmentButton.trailingAnchor),
            skipSegmentRow.topAnchor.constraint(
                equalTo: skipSegmentButton.topAnchor, constant: 20),
            skipSegmentRow.bottomAnchor.constraint(
                equalTo: skipSegmentButton.bottomAnchor, constant: -20),
            skipSegmentRow.leadingAnchor.constraint(
                equalTo: skipSegmentButton.leadingAnchor, constant: 40),
            skipSegmentRow.trailingAnchor.constraint(
                equalTo: skipSegmentButton.trailingAnchor, constant: -32),
            skipSegmentRingContainer.widthAnchor.constraint(equalToConstant: skipRingSize),
            skipSegmentRingContainer.heightAnchor.constraint(equalToConstant: skipRingSize),
            skipSegmentRingNumber.centerXAnchor.constraint(
                equalTo: skipSegmentRingContainer.centerXAnchor),
            skipSegmentRingNumber.centerYAnchor.constraint(
                equalTo: skipSegmentRingContainer.centerYAnchor),
            skipSegmentRingIcon.centerXAnchor.constraint(
                equalTo: skipSegmentRingContainer.centerXAnchor),
            skipSegmentRingIcon.centerYAnchor.constraint(
                equalTo: skipSegmentRingContainer.centerYAnchor),
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
        recordingDot.isHidden = true
        recordingDot.setContentHuggingPriority(.required, for: .horizontal)
        recordingDot.setContentCompressionResistancePriority(.required, for: .horizontal)

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
        trickplayContainer.backgroundColor = .black
        trickplayContainer.layer.cornerRadius = 8
        trickplayContainer.layer.borderWidth = 2
        trickplayContainer.clipsToBounds = true
        trickplayContainer.isHidden = true
        osdContainer.addSubview(trickplayContainer)

        trickplayImageView.contentMode = .scaleAspectFill
        trickplayContainer.addSubview(trickplayImageView)

        trickplayStrip.isHidden = true
        osdContainer.addSubview(trickplayStrip)

        trickplayCover.backgroundColor = .black
        trickplayCover.isHidden = true
        view.insertSubview(trickplayCover, belowSubview: osdScrim)
    }

    // Mirrors the Flutter NextUpOverlay layout at TV scale: a thumbnail on
    // top (extended only), an UP NEXT eyebrow with the episode pill and the
    // countdown, the title, then a Play Next button beside a close button.
    private func setupNextUpCard() {
        nextUpCard.translatesAutoresizingMaskIntoConstraints = false
        nextUpCard.backgroundColor = UIColor(white: 0.08, alpha: 0.96)
        nextUpCard.layer.cornerRadius = 18
        nextUpCard.clipsToBounds = true
        nextUpCard.isHidden = true
        view.addSubview(nextUpCard)

        nextUpImage.translatesAutoresizingMaskIntoConstraints = false
        nextUpImage.contentMode = .scaleAspectFill
        nextUpImage.clipsToBounds = true
        nextUpCard.addSubview(nextUpImage)

        let upNext = upNextLabel
        upNext.translatesAutoresizingMaskIntoConstraints = false
        upNext.text = promptStrings.upNext.uppercased()
        upNext.font = .systemFont(ofSize: 20, weight: .bold)
        upNext.textColor = themeAccent
        nextUpCard.addSubview(upNext)

        nextUpEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        nextUpEpisodeLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        nextUpEpisodeLabel.textColor = UIColor(white: 1, alpha: 0.75)
        nextUpCard.addSubview(nextUpEpisodeLabel)

        nextUpCountdownLabel.translatesAutoresizingMaskIntoConstraints = false
        nextUpCountdownLabel.font = .systemFont(ofSize: 20, weight: .regular)
        nextUpCountdownLabel.textColor = UIColor(white: 1, alpha: 0.6)
        nextUpCountdownLabel.textAlignment = .right
        nextUpCard.addSubview(nextUpCountdownLabel)

        nextUpTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        nextUpTitleLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        nextUpTitleLabel.textColor = .white
        nextUpTitleLabel.numberOfLines = 2
        nextUpCard.addSubview(nextUpTitleLabel)

        nextUpPlayButton.translatesAutoresizingMaskIntoConstraints = false
        nextUpPlayButton.backgroundColor = themeAccent
        nextUpPlayButton.layer.cornerRadius = 12
        nextUpCard.addSubview(nextUpPlayButton)

        nextUpPlayLabel.translatesAutoresizingMaskIntoConstraints = false
        nextUpPlayLabel.text = promptStrings.playNext
        nextUpPlayLabel.font = .systemFont(ofSize: 26, weight: .semibold)
        nextUpPlayLabel.textColor = .black
        nextUpPlayLabel.textAlignment = .center
        nextUpPlayButton.addSubview(nextUpPlayLabel)

        nextUpRing.fillColor = UIColor.clear.cgColor
        nextUpRing.strokeColor = UIColor(white: 1, alpha: 0.9).cgColor
        nextUpRing.lineWidth = 4
        nextUpRing.strokeEnd = 0
        nextUpPlayButton.layer.addSublayer(nextUpRing)

        nextUpCancelButton.translatesAutoresizingMaskIntoConstraints = false
        nextUpCancelButton.backgroundColor = UIColor(white: 0.25, alpha: 0.9)
        nextUpCancelButton.layer.cornerRadius = 12
        nextUpCard.addSubview(nextUpCancelButton)

        nextUpCancelIcon.translatesAutoresizingMaskIntoConstraints = false
        nextUpCancelIcon.image = UIImage(
            systemName: "xmark",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 22, weight: .semibold))
        nextUpCancelIcon.tintColor = .white
        nextUpCancelButton.addSubview(nextUpCancelIcon)

        let cardWidth = nextUpCard.widthAnchor.constraint(equalToConstant: 680)
        nextUpCardWidth = cardWidth
        let imageHeight = nextUpImage.heightAnchor.constraint(
            equalToConstant: 680 * 9 / 16)
        nextUpImageHeight = imageHeight

        NSLayoutConstraint.activate([
            nextUpCard.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -90),
            nextUpCard.bottomAnchor.constraint(
                equalTo: view.bottomAnchor, constant: -120),
            cardWidth,

            nextUpImage.topAnchor.constraint(equalTo: nextUpCard.topAnchor),
            nextUpImage.leadingAnchor.constraint(equalTo: nextUpCard.leadingAnchor),
            nextUpImage.trailingAnchor.constraint(equalTo: nextUpCard.trailingAnchor),
            imageHeight,

            upNext.leadingAnchor.constraint(
                equalTo: nextUpCard.leadingAnchor, constant: 24),
            upNext.topAnchor.constraint(
                equalTo: nextUpImage.bottomAnchor, constant: 18),

            nextUpEpisodeLabel.leadingAnchor.constraint(
                equalTo: upNext.trailingAnchor, constant: 14),
            nextUpEpisodeLabel.centerYAnchor.constraint(equalTo: upNext.centerYAnchor),

            nextUpCountdownLabel.trailingAnchor.constraint(
                equalTo: nextUpCard.trailingAnchor, constant: -24),
            nextUpCountdownLabel.centerYAnchor.constraint(equalTo: upNext.centerYAnchor),

            nextUpTitleLabel.leadingAnchor.constraint(equalTo: upNext.leadingAnchor),
            nextUpTitleLabel.trailingAnchor.constraint(
                equalTo: nextUpCard.trailingAnchor, constant: -24),
            nextUpTitleLabel.topAnchor.constraint(
                equalTo: upNext.bottomAnchor, constant: 8),

            nextUpPlayButton.leadingAnchor.constraint(equalTo: upNext.leadingAnchor),
            nextUpPlayButton.topAnchor.constraint(
                equalTo: nextUpTitleLabel.bottomAnchor, constant: 18),
            nextUpPlayButton.heightAnchor.constraint(equalToConstant: 64),
            nextUpPlayButton.bottomAnchor.constraint(
                equalTo: nextUpCard.bottomAnchor, constant: -20),

            nextUpPlayLabel.leadingAnchor.constraint(
                equalTo: nextUpPlayButton.leadingAnchor, constant: 28),
            nextUpPlayLabel.trailingAnchor.constraint(
                equalTo: nextUpPlayButton.trailingAnchor, constant: -28),
            nextUpPlayLabel.centerYAnchor.constraint(
                equalTo: nextUpPlayButton.centerYAnchor),

            nextUpCancelButton.leadingAnchor.constraint(
                equalTo: nextUpPlayButton.trailingAnchor, constant: 14),
            nextUpCancelButton.centerYAnchor.constraint(
                equalTo: nextUpPlayButton.centerYAnchor),
            nextUpCancelButton.widthAnchor.constraint(equalToConstant: 64),
            nextUpCancelButton.heightAnchor.constraint(equalToConstant: 64),

            nextUpCancelIcon.centerXAnchor.constraint(
                equalTo: nextUpCancelButton.centerXAnchor),
            nextUpCancelIcon.centerYAnchor.constraint(
                equalTo: nextUpCancelButton.centerYAnchor),
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
            recordingDot.update(
                hasTimer: liveProgram?.hasTimer ?? false,
                hasSeriesTimer: liveProgram?.hasSeriesTimer ?? false)
            recordingDot.isHidden = !recordingDot.shows
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
        case .episodes: return "rectangle.stack"
        case .subtitles: return "captions.bubble"
        case .audio: return "speaker.wave.2"
        case .cast: return "person.2"
        case .quality: return "line.3.horizontal.decrease"
        case .zoom: return player.zoomMode.iconName
        case .info: return "info.circle"
        case .channels: return "square.grid.3x2"
        case .guide: return "list.bullet.rectangle"
        case .favorite: return isFavorite ? "heart.fill" : "heart"
        case .syncplay: return "person.2.wave.2"
        case .goLive: return "dot.radiowaves.left.and.right"
        case .record: return liveRecord?.series == true ? "smallcircle.filled.circle" : "circle.fill"
        case .orientation: return orientationLock == false ? "rotate.right" : "lock.rotation"
        }
    }

    /// The record button keeps the Flutter player's colors. It's red while the
    /// airing records and grey when a series rule skips it.
    private var recordTint: UIColor {
        guard let record = liveRecord else { return UIColor(white: 1, alpha: 0.85) }
        if record.timer { return .systemRed }
        return record.series ? RecordingMarkView.skippedColor : UIColor(white: 1, alpha: 0.85)
    }

    private func makeControl(_ id: ControlId, side: CGFloat? = nil) -> UIView {
        let side = side ?? controlSide
        // The icon keeps the proportions the 64 point TV button has.
        let iconScale = side / 64
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = side / 2
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .white
        iconView.image = UIImage(
            systemName: iconName(for: id),
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 27 * iconScale, weight: .medium))
        container.addSubview(iconView)
        NSLayoutConstraint.activate([
            container.widthAnchor.constraint(equalToConstant: side),
            container.heightAnchor.constraint(equalToConstant: side),
            iconView.widthAnchor.constraint(equalToConstant: 38 * iconScale),
            iconView.heightAnchor.constraint(equalToConstant: 38 * iconScale),
            iconView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        ])
        controlViews[id] = container
        controlIcons[id] = iconView
        #if os(iOS)
        container.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(handleControlTap(_:))))
        #endif
        return container
    }

    /// What the player button settings call this control. The playback
    /// controls carry no switch, so they answer to no id.
    private func osdButtonId(for id: ControlId) -> String? {
        switch id {
        case .speed: return "speed"
        case .chapters: return "chapters"
        case .episodes: return "episodes"
        case .subtitles: return "subtitles"
        case .audio: return "audio"
        case .cast: return "castAndCrew"
        case .quality: return "quality"
        case .zoom: return "zoom"
        case .info: return "info"
        case .favorite: return "favorite"
        case .syncplay: return "syncPlay"
        case .orientation: return "orientation"
        case .prev, .skipBack, .playPause, .skipForward, .next, .channels, .guide, .goLive,
            .record:
            return nil
        }
    }

    private func osdShows(_ id: ControlId) -> Bool {
        guard let order = osdButtonOrder, let settings = osdButtonId(for: id) else {
            return true
        }
        return order.contains(settings)
    }

    /// The ones the user left switched on, in the order they put them in.
    /// Walking their arrangement rather than the candidates is what drops the
    /// switched-off ones, since those never appear in it.
    private func arrangedOsdControls(_ ids: [ControlId]) -> [ControlId] {
        guard let order = osdButtonOrder else { return ids }
        return order.compactMap { settings in
            ids.first { osdButtonId(for: $0) == settings }
        }
    }

    private func rebuildControls() {
        var ids: [ControlId] = []
        controlsBuiltWithRewind = rewindRange != nil
        if isLive {
            if controlsBuiltWithRewind {
                ids += [.skipBack, .playPause, .skipForward, .goLive]
            } else {
                ids.append(.playPause)
            }
            if !channelList.isEmpty { ids.append(.channels) }
            ids.append(.guide)
            if orientationLock != nil, osdShows(.orientation) { ids.append(.orientation) }
            if audioTracks.count > 1, osdShows(.audio) { ids.append(.audio) }
            if !subtitleTracks.isEmpty, osdShows(.subtitles) { ids.append(.subtitles) }
            if osdShows(.quality) { ids.append(.quality) }
            if liveRecord != nil { ids.append(.record) }
            if !streamInfoSections.isEmpty, osdShows(.info) { ids.append(.info) }
        } else {
            // Both always present, because they step chapters before they
            // step the queue, so they have something to do on a lone movie.
            ids.append(.prev)
            ids.append(.skipBack)
            ids.append(.playPause)
            ids.append(.skipForward)
            ids.append(.next)

            // Everything past the transport answers to the player button
            // settings, both for whether it appears and where it sits.
            var secondary: [ControlId] = []
            if canFavorite { secondary.append(.favorite) }
            secondary.append(.speed)
            if chapters.count > 1 { secondary.append(.chapters) }
            if canBrowseEpisodes { secondary.append(.episodes) }
            if !subtitleTracks.isEmpty || canDownloadSubtitles { secondary.append(.subtitles) }
            if audioTracks.count > 1 { secondary.append(.audio) }
            if hasCast { secondary.append(.cast) }
            if syncPlayEnabled { secondary.append(.syncplay) }
            secondary.append(.quality)
            secondary.append(.zoom)
            if !streamInfoSections.isEmpty { secondary.append(.info) }
            ids += arrangedOsdControls(secondary)
        }

        #if os(iOS)
        let centered = transportDocked ? [] : ids.filter { Self.transportIds.contains($0) }
        ids.removeAll { centered.contains($0) }
        let sameButtons = ids == controls && centered == builtCenterControls
        #else
        let sameButtons = ids == controls
        #endif
        // Metadata arrives often, so the same buttons keep their views and only
        // redraw icons. That way a tap that's landing isn't lost to a new set.
        if sameButtons, !controlViews.isEmpty {
            for (id, icon) in controlIcons {
                icon.image = UIImage(
                    systemName: iconName(for: id), withConfiguration: icon.image?.symbolConfiguration)
            }
            updateFocusHighlight()
            return
        }
        controlStack.arrangedSubviews.forEach {
            controlStack.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        controlViews.removeAll()
        controlIcons.removeAll()

        #if os(iOS)
        builtCenterControls = centered
        centerTransport.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for id in centered {
            let side: CGFloat = id == .playPause ? 200 : (id == .prev || id == .next ? 130 : 160)
            centerTransport.addArrangedSubview(makeControl(id, side: side))
        }
        #endif
        controls = ids
        #if os(iOS)
        // The row sits on the 1920 wide canvas inside 90 point margins, and a
        // long one only fits there with smaller buttons.
        let room = 1920 - 180 - CGFloat(max(ids.count - 1, 0)) * controlStack.spacing
        controlSide = min(Self.controlSize, (room / CGFloat(max(ids.count, 1))).rounded(.down))
        #endif
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
        #if os(iOS)
        layoutGestureIndicators()
        #endif
    }

    func applyUiMetadata(_ args: [String: Any]) {
        headerPrimary = (args["topTitle"] as? String) ?? ""
        headerSecondary = (args["topSubtitle"] as? String) ?? ""

        skipForwardMs = (args["skipForwardMs"] as? NSNumber)?.intValue ?? 30000
        skipBackMs = (args["skipBackMs"] as? NSNumber)?.intValue ?? 10000
        // A fast forward or rewind key on a remote reaches the transport
        // commands rather than the clickpad, so they move by the same setting.
        player.nowPlaying.setSkipIntervals(
            forward: Double(skipForwardMs) / 1000.0,
            backward: Double(skipBackMs) / 1000.0)
        audioTracks = parseTracks(args["audioTracks"])
        subtitleTracks = parseTracks(args["subtitleTracks"])
        subtitleControls = (args["subtitleControls"] as? [String: Any]) ?? [:]
        streamInfoSections = (args["streamInfoSections"] as? [[String: Any]]) ?? []
        streamInfoTitle =
            (args["streamInfoTitle"] as? String).flatMap { $0.isEmpty ? nil : $0 }
            ?? "Playback Information"
        streamInfoDroppedFramesLabel =
            (args["streamInfoDroppedFramesLabel"] as? String).flatMap { $0.isEmpty ? nil : $0 }
            ?? "Dropped Frames"
        selectedBitrateMbps = (args["selectedBitrateMbps"] as? NSNumber)?.intValue ?? -1
        hasCast = (args["hasCast"] as? Bool) ?? false
        canFavorite = (args["canFavorite"] as? Bool) ?? false
        isFavorite = (args["isFavorite"] as? Bool) ?? false
        canDownloadSubtitles = (args["canDownloadSubtitles"] as? Bool) ?? false
        canBrowseEpisodes = (args["canBrowseEpisodes"] as? Bool) ?? false
        // A push that carries no arrangement leaves the one already in hand
        // alone rather than emptying the row.
        if let osdButtons = args["osdButtons"] as? [String] {
            osdButtonOrder = osdButtons
        }
        #if os(iOS)
        if let docked = args["transportDocked"] as? Bool {
            transportDocked = docked
        }
        swipeGesturesEnabled = (args["swipeGestures"] as? Bool) ?? false
        gestureIndicatorsInverted = (args["gestureIndicatorsInverted"] as? Bool) ?? false
        #endif
        if let sync = args["syncPlay"] as? [String: Any] {
            syncPlayEnabled = true
            syncPlayGroupName = (sync["groupName"] as? String) ?? "SyncPlay"
            syncPlayParticipants = (sync["participants"] as? [String]) ?? []
            syncPlayIgnoreWait = (sync["ignoreWait"] as? Bool) ?? false
        } else {
            syncPlayEnabled = false
        }
        castPeople = ((args["castPeople"] as? [[String: Any]]) ?? []).compactMap { e in
            guard let name = e["name"] as? String, !name.isEmpty else { return nil }
            return (
                name: name,
                subtitle: (e["subtitle"] as? String) ?? "",
                imageUrl: (e["imageUrl"] as? String) ?? "",
                personId: (e["personId"] as? String) ?? "")
        }

        chapters = ((args["chapters"] as? [[String: Any]]) ?? []).compactMap {
            entry in
            guard let startMs = (entry["startMs"] as? NSNumber)?.intValue else {
                return nil
            }
            let title = (entry["title"] as? String) ?? ""
            return (title: title, startMs: startMs)
        }

        // Gates the scrubber marks alone. The chapters array still arrives in
        // full, because the chapters button and its menu read it too.
        let showMarkers = (args["showChapterMarkers"] as? NSNumber)?.boolValue ?? false
        if showMarkers != showChapterMarkers {
            showChapterMarkers = showMarkers
            layoutChapters()
        }

        parseTrickplay(args["trickplay"])
        parsePauseMeta(args["pauseMeta"])
        parseLive(args)

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
                episodeLine: (dict["episodeLine"] as? String) ?? "",
                startMs: (dict["startMs"] as? NSNumber)?.intValue ?? 0,
                endMs: (dict["endMs"] as? NSNumber)?.intValue ?? 0,
                hasTimer: (dict["hasTimer"] as? Bool) ?? false,
                hasSeriesTimer: (dict["hasSeriesTimer"] as? Bool) ?? false
            )
        } else {
            liveProgram = nil
        }
        if let record = args["liveRecord"] as? [String: Any] {
            liveRecord = (
                series: (record["series"] as? Bool) ?? false,
                timer: (record["timer"] as? Bool) ?? false
            )
        } else {
            liveRecord = nil
        }
        orientationLock = args["orientationLocked"] as? Bool
        #if os(iOS)
        if IosNativePlayerHostController.orientationLock != orientationLock {
            IosNativePlayerHostController.orientationLock = orientationLock
            (parent as? IosNativePlayerHostController)?.refreshOrientation()
        }
        #endif

        let accent = themeAccent
        let rawChannels = (args["channelList"] as? [[String: Any]]) ?? []
        channelList = rawChannels.compactMap { entry in
            guard let id = entry["id"] as? String, !id.isEmpty else { return nil }
            return ChannelCarouselEntry(dictionary: entry, accent: accent)
        }
        // Resolved by id rather than by position, because an entry with no id
        // is dropped and would otherwise shift the index.
        if let tuned = rawChannels.first(where: { ($0["selected"] as? Bool) == true }),
            let id = tuned["id"] as? String,
            let index = channelList.firstIndex(where: { $0.channelId == id })
        {
            selectedChannelIndex = index
        }
        channelCarousel?.update(entries: channelList, theme: carouselTheme)

        streamStats = ((args["streamStats"] as? [[String: Any]]) ?? []).compactMap {
            entry in
            guard let label = entry["label"] as? String else { return nil }
            return (label: label, value: (entry["value"] as? String) ?? "")
        }
    }

    private func parseTrickplay(_ raw: Any?) {
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
            trickplaySheets.removeAll()
            trickplaySheetsLoading.removeAll()
            hideTrickplay()
            return
        }
        // A settings change resends the same sheets, which are worth keeping.
        if trickplay?.urls != urls {
            trickplaySheets.removeAll()
            trickplaySheetsLoading.removeAll()
        }
        let headers = (dict["headers"] as? [String: String]) ?? [:]
        let timestampsMs = (dict["timestampsMs"] as? [NSNumber])?.map(\.intValue) ?? []
        if !timestampsMs.isEmpty && timestampsMs.count != urls.count {
            trickplay = nil
            trickplaySheets.removeAll()
            trickplaySheetsLoading.removeAll()
            hideTrickplay()
            return
        }
        trickplay = TrickplayData(
            urls: urls, headers: headers, width: width, height: height,
            cols: cols, rows: rows, intervalMs: intervalMs,
            timestampsMs: timestampsMs)
        trickplayMode = TrickplayMode(rawValue: (dict["mode"] as? String) ?? "") ?? .single
        trickplayScalePercent = (dict["scalePercent"] as? NSNumber)?.intValue ?? 30
        trickplayVerticalPercent = (dict["verticalPositionPercent"] as? NSNumber)?.intValue ?? 0
        trickplayFollowScrub = (dict["followScrub"] as? Bool) ?? true
        trickplayPauseWhileScrubbing = (dict["pauseWhileScrubbing"] as? Bool) ?? true
        if scrubTargetMs != nil || scrubFrozenMs != nil {
            updateTrickplay()
        }
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

    /// Apply the latest Cinema Skip state, even if the button is hidden or
    /// the player view hasn't appeared yet.
    func applyCinemaSkipState(_ args: [String: Any]) {
        loadViewIfNeeded()
        let wasActive = cinemaSkipActive
        cinemaSkipActive = (args["active"] as? Bool) ?? false
        cinemaSkipGeneration = (args["generation"] as? NSNumber)?.intValue ?? 0
        skipBottomConstraint?.constant = cinemaSkipActive ? -48 : -240
        view.layoutIfNeeded()

        guard cinemaSkipActive else {
            if wasActive { hideSkipSegment() }
            return
        }
        if !wasActive {
            hideOsd()
            updatePauseOverlay()
        }
        if (args["visible"] as? Bool) == true {
            showSkipSegment(
                label: (args["skipLabel"] as? String) ?? "Skip",
                countdownStyle: (args["countdownStyle"] as? String) ?? "progressBar",
                segmentStartMs: 0,
                segmentEndMs: (args["durationMs"] as? NSNumber)?.intValue ?? 0)
        } else {
            hideSkipSegment()
        }
    }

    func showSkipSegment(
        label: String, countdownStyle: String, segmentStartMs: Int, segmentEndMs: Int
    ) {
        skipSegmentActive = true
        skipSegmentLabel.text = label
        skipSegmentCountdownStyle = countdownStyle
        skipSegmentStartMs = segmentStartMs
        skipSegmentEndMs = segmentEndMs
        updateSkipSegmentCountdown()
        guard skipSegmentButton.isHidden || skipSegmentButton.alpha < 1 else { return }
        skipSegmentButton.layer.removeAllAnimations()
        skipSegmentButton.alpha = 0
        skipSegmentButton.isHidden = false
        UIView.animate(withDuration: 0.2) { self.skipSegmentButton.alpha = 1 }
    }

    private func updateSkipSegmentCountdown() {
        guard skipSegmentActive else { return }
        skipSegmentButton.layoutIfNeeded()
        skipSegmentButton.layer.cornerRadius = min(56, skipSegmentButton.bounds.height / 2)

        let durationMs = skipSegmentEndMs - skipSegmentStartMs
        let showTimer =
            skipSegmentCountdownStyle == "timer" || skipSegmentCountdownStyle == "both"
        let showRing =
            skipSegmentCountdownStyle == "progressBar" || skipSegmentCountdownStyle == "both"
        guard durationMs > 0, showTimer || showRing else {
            skipSegmentTimerLabel.isHidden = true
            skipSegmentRingContainer.isHidden = true
            return
        }

        let positionMs = Int(player.currentTime * 1000)
        let remainingSec = min(max(0, (skipSegmentEndMs - positionMs) / 1000), durationMs / 1000)
        let numberInRing = showTimer && showRing && remainingSec < 60
        let progress = 1 - Double(positionMs - skipSegmentStartMs) / Double(durationMs)

        skipSegmentTimerLabel.isHidden = !showTimer || numberInRing
        if !skipSegmentTimerLabel.isHidden {
            let text = remainingSec >= 60
                ? "\(remainingSec / 60):" + String(format: "%02d", remainingSec % 60)
                : ":" + String(format: "%02d", remainingSec)
            skipSegmentTimerLabel.text = promptStrings.endsIn(text)
        }

        skipSegmentRingContainer.isHidden = !showRing
        skipSegmentRingNumber.isHidden = !numberInRing
        skipSegmentRingIcon.isHidden = numberInRing
        if showRing {
            skipSegmentRingNumber.text = "\(remainingSec)"
            skipSegmentRing.strokeEnd = CGFloat(min(1, max(0, progress)))
        }
    }

    func hideSkipSegment() {
        skipSegmentActive = false
        guard !skipSegmentButton.isHidden else { return }
        skipSegmentButton.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.15) {
            self.skipSegmentButton.alpha = 0
        } completion: { _ in
            // Don't let an old fade-out hide the next trailer's Skip button.
            self.skipSegmentButton.isHidden = !self.skipSegmentActive
        }
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
        MoonfinURLSession.shared.dataTask(with: request) { data, _, _ in
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
        guard showChapterMarkers else { return }
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
        isOnScreen = true
        player.notifySurfaceReady()
        focusedZone = .buttons
        focusedControlIndex = controls.firstIndex(of: .playPause) ?? 0
        updateFocusHighlight()
        showOsd()
        updateTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) {
            [weak self] _ in
            Task { @MainActor in self?.updateOsd() }
        }
        if let pending = pendingMessage {
            pendingMessage = nil
            pending()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        isOnScreen = false
        updateTimer?.invalidate()
        updateTimer = nil
        scrubConvergeTimer?.invalidate()
        scrubConvergeTimer = nil
        scrubHoldTimer?.invalidate()
        scrubHoldTimer = nil
        guard !keepsPlayingWhileHidden else { return }
        #if os(iOS)
        restoreBrightness()
        #endif
        player.stop()
        onExit?()
    }

    private func setupSwipeGestures() {
        // The pan begins after a few points of travel and would otherwise
        // cancel the swipes, leaving flicks dead. Both recognize
        // simultaneously instead, which is safe because the pan only acts
        // once horizontal travel dominates and the button zone is not focused.
        for direction in [
            UISwipeGestureRecognizer.Direction.up, .down, .left, .right,
        ] {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
            swipe.direction = direction
            swipe.delegate = self
            view.addGestureRecognizer(swipe)
        }
        // Drag on the remote touch surface to scrub continuously, mapping
        // horizontal travel to timeline time.
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handleScrubPan(_:)))
        pan.allowedTouchTypes = [NSNumber(value: UITouch.TouchType.indirect.rawValue)]
        pan.delegate = self
        view.addGestureRecognizer(pan)
        // The system dismisses a presented controller on menu through its own
        // window level recognizer, and overriding pressesBegan can't stop it.
        // Owning a menu recognizer here wins the arbitration, so back can hide
        // the OSD instead of tearing down the player.
        let menuTap = UITapGestureRecognizer(target: self, action: #selector(handleMenuTap))
        menuTap.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
        view.addGestureRecognizer(menuTap)
    }

    @objc private func handleMenuTap() {
        if cinemaSkipActive {
            if skipSegmentActive {
                hideSkipSegment()
                onCinemaSkipAction?("hide", cinemaSkipGeneration)
            } else {
                dismiss(animated: true)
            }
            return
        }
        if nextUpVisible {
            hideNextUpCard()
            onNextUpDismiss?()
            return
        }
        // Back dismisses the skip button for the rest of the segment, the way
        // the Flutter player does. The segment state machine keeps it from
        // showing again until the segment is left and reentered.
        if skipSegmentActive {
            hideSkipSegment()
            return
        }
        if panScrubEngaged {
            finishPanScrub(commit: false)
            showOsd()
            return
        }
        if scrubTargetMs != nil {
            abandonScrubSession()
            showOsd()
            return
        }
        if !osdDismissed && isOsdOnScreen {
            osdDismissed = true
            hideOsd()
            return
        }
        dismiss(animated: true)
    }

    @objc private func handleSwipe(_ recognizer: UISwipeGestureRecognizer) {
        guard presentedViewController == nil, !nextUpVisible else { return }
        if cinemaSkipActive {
            if recognizer.direction == .right {
                onCinemaSkipAction?("reveal", cinemaSkipGeneration)
            }
            return
        }
        switch recognizer.direction {
        case .up:
            if isLive {
                presentChannelCarousel()
                return
            }
            focusedZone = .scrubber
            updateFocusHighlight()
            showOsd()
        case .down:
            focusedZone = .buttons
            updateFocusHighlight()
            showOsd()
        case .left, .right:
            // Horizontal flicks travel the action buttons. Scrubbing is the
            // pan's job, and an engaged pan owns the scrubber zone anyway.
            guard focusedZone == .buttons, isOsdOnScreen else { return }
            handleHorizontal(forward: recognizer.direction == .right)
            showOsd()
        default:
            break
        }
    }

    @objc private func handleScrubPan(_ recognizer: UIPanGestureRecognizer) {
        // Teardown sits above the guard so a card or modal appearing mid-pan
        // can't strand the engaged state and misroute the next press.
        switch recognizer.state {
        case .ended, .cancelled, .failed:
            finishPanScrub()
            return
        default:
            break
        }
        guard presentedViewController == nil, !nextUpVisible, !isLive || canPanScrubLive,
            !cinemaSkipActive
        else { return }
        switch recognizer.state {
        case .began:
            panScrubEngaged = false
            panScrubLastTranslationX = 0
        case .changed:
            let t = recognizer.translation(in: view)
            if !panScrubEngaged {
                // Engage only once horizontal travel clearly dominates and the
                // buttons aren't focused, so swipes keep switching zones and
                // travelling the buttons instead of scrubbing.
                guard abs(t.x) > 24, abs(t.x) > abs(t.y) else { return }
                #if os(tvOS)
                guard focusedZone == .scrubber || !isOsdOnScreen else { return }
                #endif
                panScrubEngaged = true
                zoneBeforePanScrub = focusedZone
                focusedZone = .scrubber
                updateFocusHighlight()
                showOsd()
                panScrubLastTranslationX = t.x
                return
            }
            let dx = t.x - panScrubLastTranslationX
            panScrubLastTranslationX = t.x
            let width = max(1, view.bounds.width)
            let sweepMs: Int
            if isLive, let range = rewindRange {
                // A full-width sweep covers the window, like the Flutter slider.
                sweepMs = Int((range.upperBound - range.lowerBound) * 1000)
            } else {
                let durationMs = max(1, Int(player.duration * 1000))
                // A full-width sweep covers the larger of 90s or 1/12 of the runtime,
                // so short clips stay fine-grained and long movies still move quickly.
                sweepMs = max(90_000, durationMs / 12)
            }
            let boost = 1 + min(3, abs(recognizer.velocity(in: view).x) / 1500)
            let deltaMs = Int(dx / width * CGFloat(sweepMs) * boost)
            if deltaMs != 0 {
                adjustScrub(byMs: deltaMs)
            }
        default:
            break
        }
    }

    /// A touch screen drags through a live window the way the Flutter
    /// player's slider does. The remote keeps live seeking on its arrows.
    private var canPanScrubLive: Bool {
        #if os(iOS)
        return rewindRange != nil
        #else
        return false
        #endif
    }

    private func finishPanScrub(commit: Bool = true) {
        if panScrubEngaged {
            if commit {
                commitScrub()
            } else {
                abandonScrubSession()
            }
            focusedZone = zoneBeforePanScrub ?? .buttons
            updateFocusHighlight()
        }
        panScrubEngaged = false
        zoneBeforePanScrub = nil
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        if presentedViewController != nil {
            super.pressesBegan(presses, with: event)
            return
        }
        if nextUpVisible {
            for press in presses {
                _ = handleNavigationPress(press.type)
            }
            return
        }
        for press in presses {
            if handleNavigationPress(press.type) { return }
        }
        super.pressesBegan(presses, with: event)
    }

    private func handleNavigationPress(_ type: UIPress.PressType) -> Bool {
        if cinemaSkipActive {
            switch type {
            case .select:
                onCinemaSkipAction?("activate", cinemaSkipGeneration)
            case .rightArrow:
                onCinemaSkipAction?("reveal", cinemaSkipGeneration)
            case .playPause:
                togglePlayPause()
            default:
                break
            }
            return true
        }
        // While the Next Up card is up it owns the remote. Every press is
        // consumed here so nothing falls through to scrubbing, OSD handling,
        // or the default menu behavior underneath the card.
        if nextUpVisible {
            switch type {
            case .select:
                hideNextUpCard()
                if nextUpFocusOnPlay {
                    onNextUpPlay?()
                } else {
                    onNextUpCancel?()
                }
            case .leftArrow:
                nextUpFocusOnPlay = true
                updateNextUpFocusHighlight()
            case .rightArrow:
                nextUpFocusOnPlay = false
                updateNextUpFocusHighlight()
            default:
                // Menu is handled by the tap recognizer.
                break
            }
            return true
        }
        // A press while a touch pan is scrubbing resolves the pan first so
        // the press acts on the restored zone. Select means commit the
        // seek, anything else commits and proceeds. Menu belongs to the
        // tap recognizer, which cancels the pan itself.
        if panScrubEngaged && type != .menu {
            finishPanScrub()
            if type == .select {
                showOsd()
                return true
            }
        }
        switch type {
        case .menu:
            // Consumed so the down press can't reach the system while the
            // recognizer decides on release.
            return true
        case .upArrow:
            if isLive {
                presentChannelCarousel()
                return true
            }
            focusedZone = .scrubber
            updateFocusHighlight()
            showOsd()
            return true
        case .downArrow:
            focusedZone = .buttons
            updateFocusHighlight()
            showOsd()
            return true
        case .playPause:
            togglePlayPause()
            if !isOsdOnScreen {
                focusedZone = .scrubber
            } else {
                focusedZone = .buttons
                focusedControlIndex = controls.firstIndex(of: .playPause) ?? 0
            }
            updateFocusHighlight()
            showOsd()
            return true
        case .select:
            if skipSegmentActive {
                let osdWasOnScreen = isOsdOnScreen
                hideSkipSegment()
                onSkipSegmentSelect?()
                if !osdWasOnScreen {
                    focusedZone = .scrubber
                    updateFocusHighlight()
                }
                showOsd()
                return true
            }
            if !isOsdOnScreen {
                togglePlayPause()
                focusedZone = .scrubber
                updateFocusHighlight()
                showOsd()
                return true
            }
            handleSelect()
            showOsd()
            return true
        case .leftArrow:
            seekOrMoveFocus(forward: false)
            return true
        case .rightArrow:
            seekOrMoveFocus(forward: true)
            return true
        default:
            break
        }
        return false
    }

    /// Handles one complete tap from the session remote. A tap never starts a hold.
    func handleRemoteNavigation(_ command: String) {
        guard viewIfLoaded?.window != nil, !isBeingDismissed else { return }
        if remoteMenuTransition {
            if pendingRemoteMenuCommands.count < 8 { pendingRemoteMenuCommands.append(command) }
            return
        }
        if let modal = presentedViewController {
            if let remote = modal as? RemotePlayerNavigable {
                remote.handleRemoteNavigation(command)
            } else if let alert = modal as? UIAlertController {
                // UIKit ignores a dismiss while the alert is still animating and
                // never finishes the swap, so a tap that lands then is dropped.
                guard !alert.isBeingPresented, !alert.isBeingDismissed else { return }
                if command == "back" {
                    // A progress prompt has no cancellation action.
                    if !alert.actions.isEmpty { alert.dismiss(animated: true) }
                } else if !alert.actions.isEmpty {
                    presentRemoteMenu(for: alert)
                }
            } else if command == "back" {
                modal.dismiss(animated: true)
            }
            return
        }
        if command == "back" { handleMenuTap(); return }
        let key: UIPress.PressType
        switch command {
        case "moveup": key = .upArrow
        case "movedown": key = .downArrow
        case "moveleft": key = .leftArrow
        case "moveright": key = .rightArrow
        case "select": key = .select
        default: return
        }
        _ = handleNavigationPress(key)
        endScrubHold()
    }

    private func makePlayerMenu(title: String?, message: String?, preferredStyle: UIAlertController.Style) -> UIAlertController {
        remoteMenuActions.removeAll()
        return UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
    }

    private func makePlayerAction(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        remoteMenuActions[ObjectIdentifier(action)] = handler ?? { _ in }
        return action
    }

    private func presentRemoteMenu(for alert: UIAlertController) {
        let entries = alert.actions.map { action in
            RemotePlayerMenu.Entry(action: action, invoke: remoteMenuActions[ObjectIdentifier(action)] ?? { _ in })
        }
        let menu = RemotePlayerMenu(title: alert.title, message: alert.message, entries: entries)
        remoteMenuTransition = true
        alert.dismiss(animated: false) { [weak self] in
            guard let self else { return }
            guard self.viewIfLoaded?.window != nil, !self.isBeingDismissed else {
                self.remoteMenuTransition = false
                self.pendingRemoteMenuCommands.removeAll()
                return
            }
            self.present(menu, animated: false) {
                self.remoteMenuTransition = false
                // The tap that opened this menu only shows it, since the action
                // the alert had focused is private. Taps that came in during the
                // swap run here.
                let commands = self.pendingRemoteMenuCommands
                self.pendingRemoteMenuCommands.removeAll()
                for queued in commands { menu.handleRemoteNavigation(queued) }
            }
            // UIKit refuses the menu if something else got presented first, and
            // then its completion never runs.
            if self.presentedViewController !== menu {
                self.remoteMenuTransition = false
                self.pendingRemoteMenuCommands.removeAll()
            }
        }
    }

    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        endScrubHold()
        super.pressesEnded(presses, with: event)
    }

    override func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        endScrubHold()
        super.pressesCancelled(presses, with: event)
    }

    // Hold the D-pad left/right edge to scrub continuously (for users who click
    // the ring instead of swiping); steps accelerate the longer it is held.
    private func beginScrubHold(forward: Bool) {
        guard !isLive else { return }
        scrubHoldTimer?.invalidate()
        scrubHoldForward = forward
        scrubHoldStart = ProcessInfo.processInfo.systemUptime
        scrubHoldTimer = Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) {
            [weak self] _ in
            Task { @MainActor in self?.tickScrubHold() }
        }
    }

    private func tickScrubHold() {
        let held = ProcessInfo.processInfo.systemUptime - scrubHoldStart
        guard held >= 0.4 else { return }
        let base = Double(scrubHoldForward ? skipForwardMs : skipBackMs)
        let accel = min(6.0, 1.0 + held * 1.5)
        let deltaMs = Int(base * 0.25 * accel) * (scrubHoldForward ? 1 : -1)
        adjustScrub(byMs: deltaMs)
        showOsd()
    }

    private func endScrubHold() {
        guard scrubHoldTimer != nil else { return }
        scrubHoldTimer?.invalidate()
        scrubHoldTimer = nil
        // While the preview holds a paused frame the session outlives the key
        // and play is what commits. Otherwise letting go is the commit.
        if scrubTargetMs != nil && !pauseDuringScrub { commitScrub() }
    }

    private func handleSelect() {
        switch focusedZone {
        case .scrubber:
            togglePlayPause()
        case .buttons:
            guard controls.indices.contains(focusedControlIndex) else { return }
            activate(controls[focusedControlIndex])
        }
    }

    /// A sideways press with the OSD down seeks straight away instead of
    /// moving a button highlight nobody can see, which is what made a skip
    /// take three presses: one to raise the OSD, one to reach the button and
    /// one to fire it. The zone follows the seek, so the OSD arrives on the
    /// scrubber and the press after it keeps seeking.
    ///
    /// A live stream seeks only when it keeps a window to rewind through,
    /// and otherwise keeps the button behaviour.
    private func seekOrMoveFocus(forward: Bool) {
        if !isOsdOnScreen, !isLive || rewindRange != nil {
            focusedZone = .scrubber
            updateFocusHighlight()
        }
        handleHorizontal(forward: forward)
        if focusedZone == .scrubber { beginScrubHold(forward: forward) }
        showOsd()
    }

    private func handleHorizontal(forward: Bool) {
        switch focusedZone {
        case .scrubber:
            if isLive {
                seekLive(byMs: forward ? skipForwardMs : -skipBackMs)
            } else {
                adjustScrub(byMs: forward ? skipForwardMs : -skipBackMs)
            }
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
            if isLive {
                seekLive(byMs: -skipBackMs)
            } else {
                seekDirect(toMs: Int(player.currentTime * 1000) - skipBackMs)
            }
        case .playPause:
            togglePlayPause()
        case .skipForward:
            if isLive {
                seekLive(byMs: skipForwardMs)
            } else {
                seekDirect(toMs: Int(player.currentTime * 1000) + skipForwardMs)
            }
        case .next:
            onNext?()
        case .speed:
            presentSpeedMenu()
        case .chapters:
            presentChapterMenu()
        case .episodes:
            onOpenEpisodes?()
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
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 27 * Self.controlScale, weight: .medium))
        case .info:
            presentInfoPanel()
        case .channels:
            presentChannelCarousel()
        case .guide:
            onOpenGuide?()
        case .record:
            onRecord?()
        case .orientation:
            onToggleOrientation?()
        case .favorite:
            onToggleFavorite?()
        case .syncplay:
            presentSyncPlay()
        case .goLive:
            player.seekToLiveEdge()
            if isPaused() { togglePlayPause() }
        }
    }

    // The Dart side pauses before requesting this and resumes on Continue, so
    // the modal never touches the transport itself. Returning true is the
    // promise that the prompt will be on screen, which the Dart side needs
    // before it blocks waiting for an answer.
    func presentStillWatching() -> Bool {
        guard !stillWatchingShown else { return true }
        stillWatchingShown = true
        hideNextUpCard()
        if let presented = presentedViewController {
            presented.dismiss(animated: false) { [weak self] in
                self?.presentStillWatchingPanel()
            }
        } else {
            presentStillWatchingPanel()
        }
        return true
    }

    /// Panels are laid out for a television too, so on iPhone and iPad they go
    /// up through the same scaling host as the player.
    private func presentPanel(_ panel: UIViewController) {
        #if os(iOS)
        present(IosNativePlayerHostController(content: panel, opaque: false), animated: true)
        #else
        let covering = panel
        covering.modalPresentationStyle = .overFullScreen
        present(covering, animated: true)
        #endif
    }

    private func presentStillWatchingPanel() {
        let panel = StillWatchingViewController(
            strings: promptStrings,
            accent: themeAccent,
            surface: hasThemeConfig ? glassSurface : UIColor(white: 0.1, alpha: 1),
            onContinue: { [weak self] in
                guard let self else { return }
                self.stillWatchingShown = false
                self.onStillWatchingContinue?()
            },
            onExit: { [weak self] in
                guard let self else { return }
                self.stillWatchingShown = false
                self.onStillWatchingStop?()
            })
        presentPanel(panel)
    }

    private func presentSyncPlay() {
        let panel = SyncPlayPanelViewController(
            groupName: syncPlayGroupName,
            participants: syncPlayParticipants,
            ignoreWait: syncPlayIgnoreWait,
            onIgnoreWait: { [weak self] value in self?.onSyncplayIgnoreWait?(value) },
            onLeave: { [weak self] in self?.onSyncplayLeave?() })
        presentPanel(panel)
    }

    private var carouselTheme: ChannelCarouselTheme {
        ChannelCarouselTheme(
            accent: themeAccent,
            surface: hasThemeConfig ? glassSurface : UIColor(white: 0.1, alpha: 1),
            surfaceVariant: glassSurfaceVariant,
            onSurface: hasThemeConfig ? glassOnSurface : .white,
            rangeTrack: glassRangeTrack,
            rangeProgress: hasThemeConfig ? glassRangeProgress : themeAccent,
            isGlass: glassActive)
    }

    private func presentChannelCarousel() {
        guard !channelList.isEmpty, presentedViewController == nil else { return }
        // Opening from the OSD button should put the OSD back on the way out.
        let restoreOsd = isOsdOnScreen
        hideOsd()
        let overlay = ChannelCarouselOverlayViewController(
            entries: channelList,
            startIndex: selectedChannelIndex,
            theme: carouselTheme)
        overlay.onChannelSelected = { [weak self] channelId in
            self?.onSelectChannel?(channelId)
        }
        overlay.onShowControls = { [weak self] in
            self?.showOsd()
        }
        overlay.onDismissed = { [weak self] in
            if restoreOsd { self?.showOsd() }
        }
        channelCarousel = overlay
        #if os(iOS)
        // The carousel is laid out for a television, so it goes up through the
        // scaling host. It closes itself on a tap outside, which keeps its
        // slide out and puts the controls back the way the remote does.
        present(
            IosNativePlayerHostController(
                content: overlay, opaque: false, closesOnOutsideTap: false),
            animated: false)
        #else
        overlay.modalPresentationStyle = .overFullScreen
        present(overlay, animated: false)
        #endif
    }

    private func updateFocusHighlight() {
        for (id, container) in controlViews {
            #if os(tvOS)
            let isFocused =
                focusedZone == .buttons && controls.indices.contains(focusedControlIndex)
                && controls[focusedControlIndex] == id
            #else
            // A touch screen has no focus to show.
            let isFocused = false
            #endif
            container.backgroundColor =
                isFocused ? .white : UIColor(white: 1, alpha: 0)
            controlIcons[id]?.tintColor =
                isFocused ? .black : (id == .record ? recordTint : UIColor(white: 1, alpha: 0.85))
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
        case .episodes: return "Episodes"
        case .subtitles: return "Subtitles"
        case .audio: return "Audio"
        case .cast: return "Cast & Crew"
        case .quality: return "Playback Quality"
        case .zoom: return "Zoom Mode"
        case .info: return "Playback Information"
        case .channels: return "Channels"
        case .guide: return "Guide"
        case .favorite: return isFavorite ? "Remove from Favorites" : "Add to Favorites"
        case .syncplay: return "SyncPlay"
        case .goLive: return "Jump to Live"
        case .record: return liveRecord?.timer == true ? "Cancel Recording" : "Record"
        case .orientation: return orientationLock == true ? "Unlock Orientation" : "Lock Landscape"
        }
    }

    private func updateTooltip() {
        #if os(iOS)
        // The tooltip names the focused button, and a touch screen has none.
        tooltipView.isHidden = true
        return
        #endif
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
        // During a paused scrub session play means go to the scrubbed spot
        // and carry on from there, not resume where the video was paused.
        if scrubTargetMs != nil {
            wasPlayingBeforeScrub = true
            commitScrub()
            return
        }
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

    private var hasTrickplayPreview: Bool {
        trickplayMode != .disabled && trickplay != nil
    }

    private var pauseDuringScrub: Bool {
        hasTrickplayPreview && trickplayPauseWhileScrubbing
    }

    // Pauses once per session so the preview has a still frame to sit on,
    // unless the setting is off. Without a preview scrubbing leaves playback
    // alone.
    private func beginScrub() {
        scrubCommitId += 1
        scrubConvergeTimer?.invalidate()
        scrubConvergeTimer = nil
        scrubFrozenMs = nil
        guard pauseDuringScrub else { return }
        if !wasPlayingBeforeScrub {
            wasPlayingBeforeScrub = !isPaused()
            if wasPlayingBeforeScrub { player.pause() }
        }
    }

    // Moves the frozen target only. The one real seek happens in commitScrub.
    private func adjustScrub(byMs deltaMs: Int) {
        let bounds: ClosedRange<Int>
        if isLive {
            guard let range = rewindRange else { return }
            bounds = Int(range.lowerBound * 1000)...Int(range.upperBound * 1000)
        } else {
            let durationMs = Int(player.duration * 1000)
            guard durationMs > 0 else { return }
            bounds = 0...durationMs
        }
        // A quick press after a release lands while the last commit is still
        // converging, when the player still reads the old position.
        let base = scrubTargetMs ?? scrubFrozenMs ?? Int(player.currentTime * 1000)
        if scrubTargetMs == nil { beginScrub() }
        scrubTargetMs = min(bounds.upperBound, max(bounds.lowerBound, base + deltaMs))
        if !isLive { prefetchTrickplay(aroundMs: base, forward: deltaMs > 0, sheetsAhead: 2) }
        renderProgress()
        updateTrickplay()
    }

    private func commitScrub() {
        guard let target = scrubTargetMs else { return }
        scrubTargetMs = nil
        scrubFrozenMs = target
        scrubCommitId += 1
        let commitId = scrubCommitId
        player.seek(to: Double(target) / 1000.0)
        onUserSeek?(target)
        renderProgress()
        updateTrickplay()
        scrubConvergeDeadline = ProcessInfo.processInfo.systemUptime + 2.0
        scrubConvergeTimer?.invalidate()
        scrubConvergeTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {
            [weak self] _ in
            Task { @MainActor in self?.checkScrubConverged(commitId: commitId, targetMs: target) }
        }
    }

    // The frozen timeline lets go once the player reads close to the target,
    // or after two seconds so a seek that never lands can't hold it forever.
    private func checkScrubConverged(commitId: Int, targetMs: Int) {
        guard commitId == scrubCommitId else {
            scrubConvergeTimer?.invalidate()
            scrubConvergeTimer = nil
            return
        }
        let landed = abs(Int(player.currentTime * 1000) - targetMs) <= 800
        let timedOut = ProcessInfo.processInfo.systemUptime >= scrubConvergeDeadline
        guard landed || timedOut else { return }
        scrubConvergeTimer?.invalidate()
        scrubConvergeTimer = nil
        scrubFrozenMs = nil
        if wasPlayingBeforeScrub {
            wasPlayingBeforeScrub = false
            player.resume()
        }
        renderProgress()
        updateTrickplay()
    }

    // A skip, a chapter jump or a seek sent from the app lands somewhere the
    // session knows nothing about, so the session is dropped rather than left
    // to commit its stale target the next time play is pressed.
    private func abandonScrubSession() {
        guard scrubTargetMs != nil || scrubFrozenMs != nil || wasPlayingBeforeScrub else {
            return
        }
        scrubCommitId += 1
        scrubHoldTimer?.invalidate()
        scrubHoldTimer = nil
        scrubConvergeTimer?.invalidate()
        scrubConvergeTimer = nil
        scrubTargetMs = nil
        scrubFrozenMs = nil
        hideTrickplay()
        if wasPlayingBeforeScrub {
            wasPlayingBeforeScrub = false
            player.resume()
        }
        renderProgress()
    }

    /// A window shorter than this is the engine's own buffer rather than
    /// anything worth rewinding through.
    private static let minRewindSeconds: Double = 60
    /// How far behind the edge still counts as live.
    private static let liveEdgeSlackSeconds: Double = 10
    private var controlsBuiltWithRewind = false

    private var rewindRange: ClosedRange<Double>? {
        guard isLive, let range = player.seekableLiveRange,
            range.upperBound - range.lowerBound >= Self.minRewindSeconds
        else { return nil }
        return range
    }

    private func seekLive(byMs deltaMs: Int) {
        guard let range = rewindRange else { return }
        let target = min(
            range.upperBound,
            max(range.lowerBound, player.currentTime + Double(deltaMs) / 1000.0))
        player.seek(to: target)
        onUserSeek?(Int((target * 1000).rounded()))
    }

    private func seekDirect(toMs ms: Int) {
        abandonScrubSession()
        let durationMs = Int(player.duration * 1000)
        let clamped = durationMs > 0 ? min(durationMs, max(0, ms)) : max(0, ms)
        player.seek(to: Double(clamped) / 1000.0)
        onUserSeek?(clamped)
    }

    func seekFromHost(toSeconds seconds: TimeInterval) {
        abandonScrubSession()
        player.seek(to: seconds)
    }

    private func hideTrickplay() {
        trickplayContainer.isHidden = true
        trickplayStrip.isHidden = true
        trickplayCover.isHidden = true
    }

    // The same sizing rule as the Flutter player: the slider maps 10 to 100
    // percent onto half to double the space between the overlays, and a tile
    // never grows past that space or the track width.
    private func resolveTileSize(trackWidth: CGFloat, aspect: CGFloat, budget: CGFloat) -> CGSize {
        let percent = CGFloat(min(100, max(10, trickplayScalePercent)))
        let scale = 0.5 + (percent - 10) / 90 * 1.5
        let safeBudget = max(budget, 32)
        let safeTrack = max(trackWidth, 24)
        let desired = min(max(safeBudget * (scale / 2), 24), safeBudget)
        let height = min(desired, safeTrack * aspect)
        return CGSize(width: height / aspect, height: height)
    }

    private func updateTrickplay() {
        guard hasTrickplayPreview, let tp = trickplay,
            let target = scrubTargetMs ?? scrubFrozenMs, player.duration > 0
        else {
            hideTrickplay()
            return
        }
        let durationMs = Int(player.duration * 1000)
        if trickplayMode == .full {
            trickplayContainer.isHidden = true
            trickplayStrip.isHidden = true
            renderTrickplayCover(tp, targetMs: target)
            return
        }
        trickplayCover.isHidden = true

        let scrubFrame = scrubber.convert(scrubber.bounds, to: osdContainer)
        let trackWidth = scrubFrame.width
        guard trackWidth > 0 else {
            hideTrickplay()
            return
        }
        let aspect = CGFloat(tp.height) / CGFloat(tp.width)
        let scrubberGap: CGFloat = 14
        let previewBottom = scrubFrame.minY - scrubberGap
        let scrubberTopInView = scrubber.convert(scrubber.bounds, to: view).minY
        let budget = scrubberTopInView - scrubberGap - topContainer.frame.maxY
        let tile = resolveTileSize(trackWidth: trackWidth, aspect: aspect, budget: budget)
        let maxTravel = max(min(budget - tile.height, trackWidth), 0)
        let travel = CGFloat(min(100, max(0, trickplayVerticalPercent))) / 100 * maxTravel
        let fraction = CGFloat(min(1, max(0, Double(target) / Double(durationMs))))
        let thumbX = 7 + fraction * max(trackWidth - 14, 0)
        let mainLeft: CGFloat =
            trickplayFollowScrub
            ? min(max(thumbX - tile.width / 2, 0), max(trackWidth - tile.width, 0))
            : (trackWidth - tile.width) / 2
        let y = previewBottom - travel - tile.height

        if trickplayMode == .strip {
            trickplayContainer.isHidden = true
            renderTrickplayStrip(
                tp, targetMs: target, durationMs: durationMs, mainLeft: mainLeft,
                originX: scrubFrame.minX, y: y, tile: tile, trackWidth: trackWidth)
            return
        }
        trickplayStrip.isHidden = true
        trickplayContainer.layer.borderColor = themeAccent.cgColor
        trickplayContainer.frame = CGRect(
            x: scrubFrame.minX + mainLeft, y: y, width: tile.width, height: tile.height)
        trickplayImageView.frame = trickplayContainer.bounds
        if let image = trickplayTile(tp, atMs: target) {
            trickplayImageView.image = image
            trickplayContainer.isHidden = false
        } else {
            trickplayContainer.isHidden = true
        }
    }

    private func renderTrickplayStrip(
        _ tp: TrickplayData, targetMs: Int, durationMs: Int, mainLeft: CGFloat,
        originX: CGFloat, y: CGFloat, tile: CGSize, trackWidth: CGFloat
    ) {
        let spacing: CGFloat = 4
        let overflow: CGFloat = 24
        let step = tile.width + spacing
        guard step > 0 else {
            trickplayStrip.isHidden = true
            return
        }
        let leftCount = min(500, max(0, Int(((mainLeft + overflow) / step).rounded(.down)) + 1))
        let rightCount = min(
            500, max(0, Int(((trackWidth + overflow - mainLeft - tile.width) / step).rounded(.down)) + 1))
        let count = leftCount + 1 + rightCount
        while trickplayStripTiles.count < count {
            let tileView = UIImageView()
            tileView.contentMode = .scaleAspectFill
            tileView.clipsToBounds = true
            tileView.backgroundColor = .black
            tileView.layer.cornerRadius = 8
            trickplayStrip.addSubview(tileView)
            trickplayStripTiles.append(tileView)
        }
        for (index, tileView) in trickplayStripTiles.enumerated() {
            tileView.isHidden = index >= count
        }
        let leftOffset = mainLeft - CGFloat(leftCount) * step
        trickplayStrip.frame = CGRect(
            x: originX + leftOffset, y: y, width: CGFloat(count) * step - spacing,
            height: tile.height)
        let stepMs = max(skipForwardMs, 1)
        for index in 0..<count {
            let slot = index - leftCount
            let tileView = trickplayStripTiles[index]
            tileView.frame = CGRect(
                x: CGFloat(index) * step, y: 0, width: tile.width, height: tile.height)
            tileView.layer.borderWidth = slot == 0 ? 2 : 1
            tileView.layer.borderColor =
                slot == 0 ? themeAccent.cgColor : UIColor(white: 1, alpha: 0.25).cgColor
            let ms = targetMs + slot * stepMs
            let image = ms < 0 || ms > durationMs ? nil : trickplayTile(tp, atMs: ms)
            tileView.image = image
            tileView.alpha = image == nil ? 0 : 1
        }
        trickplayStrip.isHidden = false
    }

    private func renderTrickplayCover(_ tp: TrickplayData, targetMs: Int) {
        trickplayCover.frame = view.bounds
        switch player.zoomMode {
        case .fit: trickplayCover.contentMode = .scaleAspectFit
        case .zoomToFill: trickplayCover.contentMode = .scaleAspectFill
        case .stretch: trickplayCover.contentMode = .scaleToFill
        }
        if let image = trickplayTile(tp, atMs: targetMs) {
            trickplayCover.image = image
            trickplayCover.isHidden = false
        } else {
            trickplayCover.isHidden = true
        }
    }

    // The cropped thumbnail for a position, or nil while its sheet is still
    // on its way. Asking for it is what starts the download.
    private func trickplayTile(_ tp: TrickplayData, atMs ms: Int) -> UIImage? {
        let tilesPerImage = tp.cols * tp.rows
        guard tilesPerImage > 0 else { return nil }
        let lastMs = max(0, Int(player.duration * 1000) - 1)
        let boundedMs = min(max(0, ms), lastMs)
        let imageIndex: Int
        let offset: Int
        if tp.timestampsMs.isEmpty {
            let tileIndex = boundedMs / tp.intervalMs
            imageIndex = tileIndex / tilesPerImage
            offset = tileIndex % tilesPerImage
        } else {
            imageIndex = trickplayImageIndex(tp, atMs: boundedMs)
            offset = 0
        }
        guard let sheet = trickplaySheets[imageIndex] else {
            loadTrickplaySheet(imageIndex)
            return nil
        }
        if !tp.timestampsMs.isEmpty { return sheet }
        guard let cg = sheet.cgImage else { return nil }
        let rect = CGRect(
            x: (offset % tp.cols) * tp.width, y: (offset / tp.cols) * tp.height,
            width: tp.width, height: tp.height)
        return cg.cropping(to: rect).map { UIImage(cgImage: $0) }
    }

    private func prefetchTrickplay(aroundMs ms: Int, forward: Bool, sheetsAhead: Int) {
        guard hasTrickplayPreview, let tp = trickplay, player.duration > 0, sheetsAhead > 0
        else { return }
        let tilesPerImage = tp.cols * tp.rows
        guard tilesPerImage > 0 else { return }
        let lastIndex: Int
        let current: Int
        if tp.timestampsMs.isEmpty {
            lastIndex = max(0, (Int(player.duration * 1000) - 1) / tp.intervalMs / tilesPerImage)
            current = max(0, ms) / tp.intervalMs / tilesPerImage
        } else {
            lastIndex = tp.timestampsMs.count - 1
            current = trickplayImageIndex(tp, atMs: max(0, ms))
        }
        for ahead in 1...sheetsAhead {
            let index = forward ? current + ahead : current - ahead
            if index < 0 || index > lastIndex { break }
            loadTrickplaySheet(index)
        }
    }

    private func trickplayImageIndex(_ tp: TrickplayData, atMs ms: Int) -> Int {
        guard !tp.timestampsMs.isEmpty else { return 0 }
        var low = 0
        var high = tp.timestampsMs.count - 1
        while low <= high {
            let middle = low + (high - low) / 2
            if tp.timestampsMs[middle] <= ms {
                low = middle + 1
            } else {
                high = middle - 1
            }
        }
        return min(max(high, 0), tp.timestampsMs.count - 1)
    }

    private func loadTrickplaySheet(_ index: Int) {
        guard let tp = trickplay, index >= 0, index < tp.urls.count,
            trickplaySheets[index] == nil, !trickplaySheetsLoading.contains(index)
        else { return }
        trickplaySheetsLoading.insert(index)
        loadImage(tp.urls[index], headers: tp.headers) { [weak self] image in
            guard let self else { return }
            self.trickplaySheetsLoading.remove(index)
            guard let image else { return }
            self.trickplaySheets[index] = image
            if self.scrubTargetMs != nil || self.scrubFrozenMs != nil {
                self.updateTrickplay()
            }
        }
    }

    private func setSubtitlesRaised(_ raised: Bool) {
        guard raised != subtitlesRaised else { return }
        subtitlesRaised = raised
        reapplySubtitleClearance()
    }

    /// An appearance change can reset the native position while the OSD is still visible.
    func reapplySubtitleClearance() {
        player.setSubtitlePosition(subtitlesRaised ? min(baseSubtitlePos, 70) : baseSubtitlePos)
    }

    /// The dim, the top bar, the bottom bar and, on iOS, the centered
    /// transport come and go together.
    private func setOsdAlpha(_ alpha: CGFloat) {
        osdScrim.alpha = alpha
        osdContainer.alpha = alpha
        topContainer.alpha = alpha
        #if os(iOS)
        centerTransport.alpha = alpha
        #endif
    }

    private func hideOsd() {
        setSubtitlesRaised(false)
        UIView.animate(withDuration: 0.3) {
            self.setOsdAlpha(0)
        }
    }

    // Alpha drops to 0 the moment the hide animation starts while the OSD
    // keeps rendering through the fade, so the presentation layer is what
    // says whether the user can still see it.
    private var isOsdOnScreen: Bool {
        if osdContainer.alpha > 0.5 { return true }
        guard let presented = osdContainer.layer.presentation() else { return false }
        return presented.opacity > 0.1
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

    /// iPad shows an action sheet as a popover, which UIKit refuses to present
    /// without a view to hang it from. The button that opened the menu is the
    /// natural anchor. tvOS has no popover, so nothing changes there.
    private func presentSheet(_ sheet: UIAlertController, from id: ControlId) {
        #if os(iOS)
        if let popover = sheet.popoverPresentationController {
            let anchor: UIView = controlViews[id] ?? view
            popover.sourceView = anchor
            popover.sourceRect = anchor.bounds
        }
        #endif
        present(sheet, animated: true)
    }

    private func presentAudioMenu() {
        let sheet = self.makePlayerMenu(
            title: "Audio", message: nil, preferredStyle: .actionSheet)
        for track in audioTracks {
            sheet.addAction(
                self.makePlayerAction(title: trackActionTitle(track), style: .default) {
                    [weak self] _ in
                    self?.onSelectAudio?(track.index)
                })
        }
        sheet.addAction(self.makePlayerAction(title: "Cancel", style: .cancel))
        presentSheet(sheet, from: .audio)
    }

    private func subtitleText(_ key: String) -> String {
        (subtitleControls[key] as? String) ?? ""
    }

    private func presentSubtitleMenu(secondary: Bool = false, selectTrack: Bool = false) {
        let secondaryTracks = parseTracks(subtitleControls["tracks"])
        let tracks = secondary ? secondaryTracks : subtitleTracks
        let showSlots = !secondary && !selectTrack && !secondaryTracks.isEmpty
        let showControls = secondary || !selectTrack
        let sheet = makePlayerMenu(
            title: secondary ? subtitleText("secondaryTitle") : subtitleText("menuTitle"),
            message: nil, preferredStyle: .actionSheet)
        if showSlots {
            sheet.addAction(makePlayerAction(title: subtitleText("primaryTitle"), style: .default) {
                [weak self] _ in self?.presentSubtitleMenu(selectTrack: true)
            })
            sheet.addAction(makePlayerAction(title: subtitleText("title"), style: .default) {
                [weak self] _ in self?.presentSubtitleMenu(secondary: true)
            })
        } else {
            let offTitle = (tracks.contains { $0.selected } ? "" : "\u{2713} ") + subtitleText("off")
            sheet.addAction(makePlayerAction(title: offTitle, style: .default) { [weak self] _ in
                self?.selectSubtitle(-1, secondary: secondary)
            })
            for track in tracks {
                sheet.addAction(makePlayerAction(title: trackActionTitle(track), style: .default) {
                    [weak self] _ in self?.selectSubtitle(track.index, secondary: secondary)
                })
            }
        }
        if showControls {
            sheet.addAction(makePlayerAction(title: subtitleText("delayLabel") + "…", style: .default) {
                [weak self] _ in self?.presentSubtitleDelayMenu(secondary: secondary)
            })
            if secondary || (subtitleControls["showPrimaryAppearance"] as? Bool ?? true) {
                for field in secondary ? ["sizeAdjustment", "textColor", "verticalOffset"] : ["primaryFontSize", "primaryVerticalOffset"] {
                    let key = field.contains("Offset") ? "positionLabel" : field == "textColor" ? "colorLabel" : "sizeLabel"
                    sheet.addAction(makePlayerAction(title: subtitleText(key) + "…", style: .default) {
                        [weak self] _ in self?.presentSubtitleAppearanceMenu(field: field)
                    })
                }
            }
        }
        if !secondary && !showSlots && canDownloadSubtitles {
            sheet.addAction(makePlayerAction(title: "Download Subtitles…", style: .default) {
                [weak self] _ in self?.beginSubtitleSearch()
            })
        }
        sheet.addAction(makePlayerAction(title: subtitleText("cancel"), style: .cancel))
        presentSheet(sheet, from: .subtitles)
    }

    private func selectSubtitle(_ index: Int, secondary: Bool) {
        if secondary {
            onSubtitleAction?(["event": "selectSecondarySubtitle", "index": index])
        } else {
            onSelectSubtitle?(index)
        }
    }

    /// Reopen the delay menu after each adjustment so the user can keep changing it
    /// with the remote.
    private func presentSubtitleDelayMenu(secondary: Bool = false) {
        let current = secondary ? player.secondaryDelayAdjustment : player.subtitleOverlay.delaySeconds
        let sheet = self.makePlayerMenu(
            title: subtitleText(secondary ? "secondaryDelayLabel" : "delayLabel"),
            message: String(format: "%+.1f s", current),
            preferredStyle: .actionSheet)
        for step in [-0.5, -0.1, 0.1, 0.5] {
            sheet.addAction(
                self.makePlayerAction(title: String(format: "%+.1f s", step), style: .default) {
                    [weak self] _ in self?.applySubtitleDelay(current + step, secondary: secondary)
                })
        }
        if current != 0 {
            sheet.addAction(
                self.makePlayerAction(title: subtitleText("reset"), style: .default) {
                    [weak self] _ in self?.applySubtitleDelay(0, secondary: secondary)
                })
        }
        sheet.addAction(self.makePlayerAction(title: subtitleText("done"), style: .cancel))
        presentSheet(sheet, from: .subtitles)
    }

    private func applySubtitleDelay(_ seconds: TimeInterval, secondary: Bool = false) {
        let rounded = (seconds * 10).rounded() / 10
        if secondary {
            let bounded = min(max(rounded, -5), 5)
            player.setSecondarySubtitleDelay(bounded)
            onSubtitleAction?(["event": "setSecondarySubtitleDelay", "delayMs": Int((bounded * 1000).rounded())])
        } else {
            player.setSubtitleDelay(rounded)
            onSubtitleDelayChanged?(Int((rounded * 1000).rounded()))
        }
        presentSubtitleDelayMenu(secondary: secondary)
    }

    private func presentSubtitleAppearanceMenu(field: String) {
        let color = field == "textColor"
        let primary = field.hasPrefix("primary")
        let size = field == "sizeAdjustment" || field == "primaryFontSize"
        let current = (subtitleControls[field] as? NSNumber)?.doubleValue ?? 0
        let label = subtitleText(size ? "sizeLabel" : color ? "colorLabel" : "positionLabel")
        let valueLabel = !primary && current == 0 ? subtitleText("defaultLabel")
            : size && primary ? String(format: "%.0f", current)
            : String(format: primary ? "%.0f%%" : "%+.0f%%", size ? current : current * 100)
        let sheet = makePlayerMenu(title: label, message: color ? nil : valueLabel, preferredStyle: .actionSheet)
        if color {
            for entry in (subtitleControls["colors"] as? [[String: Any]]) ?? [] {
                guard let value = entry["value"] as? NSNumber, let title = entry["label"] as? String else { continue }
                sheet.addAction(makePlayerAction(
                    title: (value.doubleValue == current ? "\u{2713} " : "") + title, style: .default
                ) { [weak self] _ in self?.applySubtitleAppearance(field: field, value: value.doubleValue) })
            }
        } else {
            let offsetStepKey = primary ? "primaryOffsetStep" : "secondaryOffsetStep"
            let offsetMinKey = primary ? "primaryOffsetMin" : "secondaryOffsetMin"
            let offsetMaxKey = primary ? "primaryOffsetMax" : "secondaryOffsetMax"
            let offsetStep = (subtitleControls[offsetStepKey] as? NSNumber)?.doubleValue
                ?? 0.02
            let offsetMinimum = (subtitleControls[offsetMinKey] as? NSNumber)?.doubleValue
                ?? 0.0
            let offsetMaximum = (subtitleControls[offsetMaxKey] as? NSNumber)?.doubleValue
                ?? (primary ? 0.36 : 0.06)
            for direction in [-1.0, 1.0] {
                let step = direction * (size ? (primary ? 2 : 10) : offsetStep)
                let title = size && primary ? String(format: "%+.0f", step)
                    : String(format: "%+.0f%%", size ? step : step * 100)
                sheet.addAction(makePlayerAction(title: title, style: .default) { [weak self] _ in
                    let minimum = size ? (primary ? 12.0 : -50.0) : offsetMinimum
                    let maximum = size ? (primary ? 48.0 : 50.0) : offsetMaximum
                    let next: Double
                    if size {
                        next = min(max(current + step, minimum), maximum)
                    } else {
                        let storedKey = primary
                            ? "primaryStoredVerticalOffset" : "secondaryStoredVerticalOffset"
                        let stored = (self?.subtitleControls[storedKey] as? NSNumber)?.doubleValue
                            ?? current
                        next = Self.nextSubtitleOffset(
                            stored: stored, proposed: current + step,
                            minimum: minimum, maximum: maximum, step: offsetStep)
                    }
                    self?.applySubtitleAppearance(field: field, value: (next * 100).rounded() / 100)
                })
            }
        }
        sheet.addAction(makePlayerAction(title: subtitleText("done"), style: .cancel))
        presentSheet(sheet, from: .subtitles)
    }

    private static func nextSubtitleOffset(
        stored: Double, proposed: Double,
        minimum: Double, maximum: Double, step: Double
    ) -> Double {
        let clampedStored = min(max(stored, minimum), maximum)
        guard step > 0 else { return clampedStored }
        if stored < minimum || stored > maximum { return clampedStored }

        let stepIndex = (stored - minimum) / step
        let nearest = stepIndex.rounded()
        if abs(stepIndex - nearest) > 0.000001 {
            if proposed > stored {
                return min(max(minimum + ceil(stepIndex) * step, minimum), maximum)
            }
            if proposed < stored {
                return min(max(minimum + floor(stepIndex) * step, minimum), maximum)
            }
            return clampedStored
        }
        return min(max(proposed, minimum), maximum)
    }

    private func applySubtitleAppearance(field: String, value: Double) {
        let storedKey: String?
        if field == "primaryVerticalOffset" {
            storedKey = "primaryStoredVerticalOffset"
        } else if field == "verticalOffset" {
            storedKey = "secondaryStoredVerticalOffset"
        } else {
            storedKey = nil
        }
        let current = (subtitleControls[field] as? NSNumber)?.doubleValue
        let stored = storedKey.flatMap {
            (subtitleControls[$0] as? NSNumber)?.doubleValue
        }
        // A legacy stored value can already display at the current clamp (for
        // example 50% displayed as 36%). Persist the normalized value even when
        // the effective number on screen doesn't visibly change.
        let storedNeedsNormalization = stored.map { $0 != value } ?? false
        if current != value || storedNeedsNormalization {
            subtitleControls[field] = value
            if let storedKey {
                subtitleControls[storedKey] = value
            }
            if field == "primaryFontSize" {
                onSubtitleAction?(["event": "setSubtitleSize", "fontSize": value])
            } else if field == "primaryVerticalOffset" {
                onSubtitleAction?(["event": "setSubtitlePosition", "verticalOffset": value])
            } else {
                onSubtitleAction?(["event": "configureSecondarySubtitleStyle", field: value])
            }
        }
        presentSubtitleAppearanceMenu(field: field)
    }

    private func beginSubtitleSearch() {
        onSearchSubtitles?()
    }

    /// Put up a spinner-less "working on it" alert for the stretch between
    /// picking a subtitle and the server listing it. Without this the sheet just
    /// closes and nothing happens for as long as the refresh takes, which reads
    /// as the press having been ignored.
    func showSubtitleProgress(_ message: String) {
        let alert = self.makePlayerMenu(title: message, message: nil, preferredStyle: .alert)
        subtitleProgressAlert = alert
        present(alert, animated: true)
    }

    /// Take the progress alert down. A message turns it into an alert the viewer
    /// has to acknowledge, which is how a failure or a subtitle that never
    /// turned up gets reported instead of being swallowed.
    func hideSubtitleProgress(message: String?) {
        dismissSubtitleProgress { [weak self] in
            guard let self, let message, !message.isEmpty else { return }
            let alert = self.makePlayerMenu(title: message, message: nil, preferredStyle: .alert)
            alert.addAction(self.makePlayerAction(title: "OK", style: .cancel))
            self.present(alert, animated: true)
        }
    }

    /// A message from Dart, such as how a recording change went or a channel
    /// that failed to tune. An action label adds a button that calls onAction.
    /// It goes over whatever is already up, like the channel strip.
    func presentMessage(
        _ message: String, actionLabel: String?, closeLabel: String,
        onAction: @escaping () -> Void
    ) {
        let alert = makePlayerMenu(title: message, message: nil, preferredStyle: .alert)
        if let actionLabel, !actionLabel.isEmpty {
            alert.addAction(makePlayerAction(title: actionLabel, style: .default) { _ in onAction() })
        }
        alert.addAction(makePlayerAction(title: closeLabel, style: .cancel))
        let show = { [weak self] in
            guard let self else { return }
            var top: UIViewController = self
            while let next = top.presentedViewController, !next.isBeingDismissed { top = next }
            top.present(alert, animated: true)
        }
        if isOnScreen { show() } else { pendingMessage = show }
    }

    /// Dismissal is asynchronous, so whatever comes next has to wait for the
    /// completion rather than be presented on top of an alert on its way out.
    private func dismissSubtitleProgress(then next: @escaping () -> Void) {
        guard let existing = subtitleProgressAlert else {
            next()
            return
        }
        subtitleProgressAlert = nil
        existing.dismiss(animated: true) { next() }
    }

    func presentRemoteSubtitleResults(_ results: [[String: Any]]) {
        let show = { [weak self] in
            guard let self else { return }
            if results.isEmpty {
                let alert = self.makePlayerMenu(
                    title: "No Subtitles Found", message: nil, preferredStyle: .alert)
                alert.addAction(self.makePlayerAction(title: "OK", style: .cancel))
                self.present(alert, animated: true)
                return
            }
            let sheet = self.makePlayerMenu(
                title: "Download Subtitles", message: nil, preferredStyle: .actionSheet)
            for result in results {
                guard let id = result["id"] as? String, !id.isEmpty else { continue }
                let label = (result["label"] as? String) ?? "Subtitle"
                let subtitle = (result["subtitle"] as? String) ?? ""
                let title = subtitle.isEmpty ? label : "\(label) \u{00B7} \(subtitle)"
                sheet.addAction(
                    self.makePlayerAction(title: title, style: .default) { [weak self] _ in
                        self?.onDownloadSubtitle?(id)
                    })
            }
            sheet.addAction(self.makePlayerAction(title: "Cancel", style: .cancel))
            self.presentSheet(sheet, from: .subtitles)
        }
        dismissSubtitleProgress { show() }
    }

    private func presentChapterMenu() {
        let sheet = self.makePlayerMenu(
            title: "Chapters", message: nil, preferredStyle: .actionSheet)
        for chapter in chapters {
            let stamp = formatTime(Double(chapter.startMs) / 1000.0)
            sheet.addAction(
                self.makePlayerAction(title: "\(chapter.title) · \(stamp)", style: .default) {
                    [weak self] _ in
                    self?.seekDirect(toMs: chapter.startMs)
                    self?.showOsd()
                })
        }
        sheet.addAction(self.makePlayerAction(title: "Cancel", style: .cancel))
        presentSheet(sheet, from: .chapters)
    }

    private func presentSpeedMenu() {
        let sheet = self.makePlayerMenu(
            title: "Playback Speed", message: nil, preferredStyle: .actionSheet)
        let speeds: [Double] = [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0]
        let current = Double(player.rate)
        for speed in speeds {
            let check = abs(speed - current) < 0.01 ? "\u{2713} " : ""
            let label = speed == 1.0 ? "Normal" : String(format: "%gx", speed)
            sheet.addAction(
                self.makePlayerAction(title: "\(check)\(label)", style: .default) {
                    [weak self] _ in
                    self?.onSetSpeed?(speed)
                })
        }
        sheet.addAction(self.makePlayerAction(title: "Cancel", style: .cancel))
        presentSheet(sheet, from: .speed)
    }

    private func presentQualityMenu() {
        let sheet = self.makePlayerMenu(
            title: "Quality", message: nil, preferredStyle: .actionSheet)
        let options = [-1, 40, 20, 12, 8, 4, 2]
        for mbps in options {
            let check = mbps == selectedBitrateMbps ? "\u{2713} " : ""
            let label = mbps < 0 ? "Auto" : "\(mbps) Mbps"
            sheet.addAction(
                self.makePlayerAction(title: "\(check)\(label)", style: .default) {
                    [weak self] _ in
                    self?.onSetBitrate?(mbps)
                })
        }
        sheet.addAction(self.makePlayerAction(title: "Cancel", style: .cancel))
        presentSheet(sheet, from: .quality)
    }

    private func presentInfoPanel() {
        // Dart sends every row except the dropped frame count, which only the
        // engine knows.
        var sections = streamInfoSections
        if let dropped = player.droppedFrameCount,
            let index = sections.firstIndex(where: { ($0["id"] as? String) == "technical" })
        {
            let row: [String: Any] = ["label": streamInfoDroppedFramesLabel, "value": "\(dropped)"]
            let rows = (sections[index]["rows"] as? [[String: Any]]) ?? []
            sections[index]["rows"] = rows + [row]
        }
        let panel = InfoPanelViewController(sections: sections, heading: streamInfoTitle)
        presentPanel(panel)
    }

    /// Dart's answer to the `openEpisodes` the Episodes button sends.
    func showEpisodeBrowser(_ args: [String: Any]) {
        let content = EpisodeBrowserContent(args)
        if let browser = episodeBrowser {
            browser.update(content)
            return
        }
        // Something else already holds the screen, so Dart is told the browser
        // closed rather than left waiting on one that never opened.
        guard presentedViewController == nil else {
            onEpisodesClosed?()
            return
        }
        let browser = EpisodeBrowserViewController(content: content, theme: carouselTheme)
        browser.onSelectSeason = { [weak self] seasonId in
            self?.onSelectEpisodesSeason?(seasonId)
        }
        browser.onSelectEpisode = { [weak self] episodeId in
            self?.onSelectEpisode?(episodeId)
        }
        browser.onClosed = { [weak self] in
            self?.onEpisodesClosed?()
        }
        episodeBrowser = browser
        presentPanel(browser)
    }

    func updateEpisodeBrowser(_ args: [String: Any]) {
        episodeBrowser?.update(EpisodeBrowserContent(args))
    }

    func hideEpisodeBrowser() {
        episodeBrowser?.dismiss(animated: true)
    }

    private func presentCastPanel() {
        let panel = CastPanelViewController(people: castPeople) { [weak self] personId in
            guard let self else { return }
            self.dismiss(animated: true) {
                self.onOpenCastPerson?(personId)
            }
        }
        presentPanel(panel)
    }

    // Content is reassigned on every call so the card can never freeze on a
    // previous episode. The countdown here is display only, the Dart timer
    // decides what actually happens when it runs out.
    func showNextUpCard(
        title: String, episodeInfo: String, imageUrl: String,
        isMinimal: Bool, countdownStyle: String, timeoutMs: Int
    ) {
        // Drop any in-flight touch scrub so its pending seek can't land
        // underneath the card.
        finishPanScrub(commit: false)
        nextUpVisible = true
        nextUpFocusOnPlay = true
        nextUpCountdownStyle = countdownStyle
        nextUpCountdownTotalMs = timeoutMs
        nextUpCountdownDeadline =
            timeoutMs > 0 ? CACurrentMediaTime() + Double(timeoutMs) / 1000.0 : 0
        nextUpTitleLabel.text = title
        nextUpTitleLabel.numberOfLines = isMinimal ? 1 : 2
        nextUpEpisodeLabel.text = episodeInfo
        nextUpEpisodeLabel.isHidden = episodeInfo.isEmpty
        nextUpCountdownLabel.text = ""
        let cardWidth: CGFloat = isMinimal ? 600 : 680
        nextUpCardWidth?.constant = cardWidth
        nextUpImage.isHidden = isMinimal || imageUrl.isEmpty
        nextUpImageHeight?.constant = nextUpImage.isHidden ? 0 : cardWidth * 9 / 16
        nextUpImage.image = nil
        if !nextUpImage.isHidden {
            loadImage(imageUrl) { [weak self] image in
                guard let self, self.nextUpVisible else { return }
                self.nextUpImage.image = image
            }
        }
        nextUpRing.strokeEnd = 0
        updateNextUpFocusHighlight()
        // updateOsd keeps the OSD down while the card is visible, so this
        // doesn't need to latch osdDismissed the way an explicit dismiss does.
        hideOsd()
        if nextUpCard.isHidden {
            nextUpCard.alpha = 0
            nextUpCard.isHidden = false
            UIView.animate(withDuration: 0.25) { self.nextUpCard.alpha = 1 }
        }
        view.layoutIfNeeded()
        updateNextUpRingPath()
    }

    func hideNextUpCard() {
        guard nextUpVisible || !nextUpCard.isHidden else { return }
        nextUpVisible = false
        UIView.animate(withDuration: 0.2) { self.nextUpCard.alpha = 0 } completion: { _ in
            self.nextUpCard.isHidden = true
        }
    }

    private func updateNextUpFocusHighlight() {
        nextUpPlayButton.layer.borderWidth = nextUpFocusOnPlay ? 4 : 0
        nextUpPlayButton.layer.borderColor = UIColor.white.cgColor
        nextUpCancelButton.layer.borderWidth = nextUpFocusOnPlay ? 0 : 4
        nextUpCancelButton.layer.borderColor = UIColor.white.cgColor
    }

    private func updateNextUpRingPath() {
        nextUpRing.frame = nextUpPlayButton.bounds
        nextUpRing.path = UIBezierPath(
            roundedRect: nextUpPlayButton.bounds.insetBy(dx: 2, dy: 2),
            cornerRadius: 10
        ).cgPath
    }

    private func updateNextUpCountdown() {
        guard nextUpVisible, nextUpCountdownTotalMs > 0,
            nextUpCountdownDeadline > 0
        else {
            nextUpRing.strokeEnd = 0
            return
        }
        let remaining = max(0, nextUpCountdownDeadline - CACurrentMediaTime())
        let showTimer =
            nextUpCountdownStyle == "timer" || nextUpCountdownStyle == "both"
        let showRing =
            nextUpCountdownStyle == "progressBar" || nextUpCountdownStyle == "both"
        if showTimer {
            let seconds = Int(remaining.rounded(.up))
            let text = seconds >= 60
                ? "\(seconds / 60):" + String(format: "%02d", seconds % 60)
                : ":" + String(format: "%02d", seconds)
            nextUpCountdownLabel.text = promptStrings.endsIn(text)
        } else {
            nextUpCountdownLabel.text = ""
        }
        if showRing {
            updateNextUpRingPath()
            let total = Double(nextUpCountdownTotalMs) / 1000.0
            nextUpRing.strokeEnd = total > 0 ? CGFloat(remaining / total) : 0
        } else {
            nextUpRing.strokeEnd = 0
        }
    }

    private func updatePauseOverlay() {
        let shouldShow = !cinemaSkipActive && isPaused() && pauseMeta != nil
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
        guard !cinemaSkipActive else { return }
        lastShowAt = CACurrentMediaTime()
        osdDismissed = false
        setSubtitlesRaised(true)
        if osdContainer.alpha < 1 {
            UIView.animate(withDuration: 0.2) {
                self.setOsdAlpha(1)
            }
        }
    }

    private func renderProgress() {
        if isLive {
            renderLiveProgress()
            return
        }
        let duration = player.duration
        let current =
            (scrubTargetMs ?? scrubFrozenMs).map { Double($0) / 1000.0 } ?? player.currentTime
        scrubber.progress = duration > 0 ? Float(min(1, max(0, current / duration))) : 0
        let rate = max(0.01, Double(player.rate))
        let text = { (slot: TimeSlot) in
            self.timeSlotText(slot, current: current, duration: duration, rate: rate)
        }
        aboveLeftLabel.text = text(timeSlots.aboveLeft)
        aboveCenterLabel.text = text(timeSlots.aboveCenter)
        aboveRightLabel.text = text(timeSlots.aboveRight)
        belowLeftLabel.text = text(timeSlots.belowLeft)
        belowCenterLabel.text = text(timeSlots.belowCenter)
        belowRightLabel.text = text(timeSlots.belowRight)
    }

    /// Same fallbacks as the Dart formatter: a slot that can't be computed
    /// shows the total duration rather than going blank.
    private func timeSlotText(
        _ slot: TimeSlot, current: TimeInterval, duration: TimeInterval, rate: Double
    ) -> String {
        switch slot {
        case .none:
            return ""
        case .elapsed:
            return formatTime(current)
        case .totalDuration:
            return formatTime(duration)
        case .timeRemaining:
            return duration > 0 ? "-" + formatTime(max(0, duration - current)) : formatTime(duration)
        case .endsAt:
            let remaining = max(0, duration - current) / rate
            guard duration > 0, remaining > 0 else { return formatTime(duration) }
            return timeSlots.endsAt(clockFormatter.string(from: Date().addingTimeInterval(remaining)))
        case .time:
            return clockFormatter.string(from: Date())
        }
    }

    /// Live has no runtime to lay out, so the program bounds take the outer
    /// slots of the lower row. The episode sits above the timeline on the
    /// left, where the Flutter player puts it, and everything else stays clear.
    private func renderLiveProgress() {
        for label in [aboveCenterLabel, aboveRightLabel, belowCenterLabel] {
            label.text = ""
        }
        aboveLeftLabel.text = liveProgram?.episodeLine ?? ""
        if let range = rewindRange {
            let span = range.upperBound - range.lowerBound
            let current =
                (scrubTargetMs ?? scrubFrozenMs).map { Double($0) / 1000.0 } ?? player.currentTime
            let behind = max(0, range.upperBound - current)
            scrubber.progress = Float(min(1, max(0, (current - range.lowerBound) / span)))
            belowLeftLabel.text = clockFormatter.string(from: Date().addingTimeInterval(-behind))
            belowRightLabel.text =
                behind > Self.liveEdgeSlackSeconds ? "-\(formatTime(behind))" : "LIVE"
            let goLiveFocused =
                focusedZone == .buttons && controls.indices.contains(focusedControlIndex)
                && controls[focusedControlIndex] == .goLive
            if !goLiveFocused {
                controlIcons[.goLive]?.tintColor =
                    behind > Self.liveEdgeSlackSeconds ? UIColor(white: 1, alpha: 0.85) : .systemRed
            }
        } else if let program = liveProgram, program.endMs > program.startMs {
            let nowMs = Date().timeIntervalSince1970 * 1000
            let span = Double(program.endMs - program.startMs)
            let progress = (nowMs - Double(program.startMs)) / span
            scrubber.progress = Float(min(1, max(0, progress)))
            belowLeftLabel.text = clockString(epochMs: program.startMs)
            belowRightLabel.text = clockString(epochMs: program.endMs)
        } else {
            scrubber.progress = 1
            belowLeftLabel.text = clockFormatter.string(from: Date())
            belowRightLabel.text = "LIVE"
        }
    }

    private func clockString(epochMs: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(epochMs) / 1000.0)
        return clockFormatter.string(from: date)
    }

    private func updateOsd() {
        if isLive, (rewindRange != nil) != controlsBuiltWithRewind {
            let focused = controls.indices.contains(focusedControlIndex)
                ? controls[focusedControlIndex] : nil
            rebuildControls()
            if let focused, let index = controls.firstIndex(of: focused) {
                focusedControlIndex = index
                updateFocusHighlight()
            }
        }
        renderProgress()
        if scrubTargetMs == nil && scrubFrozenMs == nil {
            prefetchTrickplay(aroundMs: Int(player.currentTime * 1000), forward: true, sheetsAhead: 1)
        }
        if let playIcon = controlIcons[.playPause] {
            // Keeps whichever size the button was built at, docked or centered.
            playIcon.image = UIImage(
                systemName: isPaused() ? "play.fill" : "pause.fill",
                withConfiguration: playIcon.image?.symbolConfiguration
                    ?? UIImage.SymbolConfiguration(pointSize: 27 * Self.controlScale, weight: .medium))
        }

        updateNextUpCountdown()
        updateSkipSegmentCountdown()
        updatePauseOverlay()
        updateLoadingOverlay()

        let shouldShow =
            !cinemaSkipActive && !osdDismissed && !nextUpVisible
            && (isPaused() || scrubTargetMs != nil || scrubFrozenMs != nil
                || (CACurrentMediaTime() - lastShowAt < 4.0))
        updateSubtitleLoadingPill(osdShown: shouldShow)
        let visible = osdContainer.alpha > 0.5
        if shouldShow && !visible {
            setSubtitlesRaised(true)
            UIView.animate(withDuration: 0.2) {
                self.setOsdAlpha(1)
            }
        } else if !shouldShow && visible {
            setSubtitlesRaised(false)
            UIView.animate(withDuration: 0.3) {
                self.setOsdAlpha(0)
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

extension NativeApplePlayerViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith _: UIGestureRecognizer
    ) -> Bool {
        #if os(iOS)
        // Once the hold wins, a swipe or tap can't start under it.
        if gestureRecognizer === speedHold { return false }
        #endif
        return true
    }

    #if os(iOS)
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        gestureRecognizer !== speedHold || canHoldForSpeed
    }
    #endif
}

/// Roboto only ships in the Flutter assets, so it's registered with Core Text
/// once before the panel uses it.
private let robotoRegistered: Void = {
    guard let fonts = SubtitleFontLocator.bundledFontsDirectory() else { return }
    for name in ["Roboto-Regular", "Roboto-Bold"] {
        let url = URL(fileURLWithPath: fonts).appendingPathComponent("\(name).ttf")
        _ = CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
    }
}()

#if os(iOS)
/// Touch stands in for the Siri Remote on iPhone and iPad. Every gesture ends
/// in the same actions the remote's presses reach.
extension NativeApplePlayerViewController {
    private func setupTouchGestures() {
        let doubleTap = UITapGestureRecognizer(
            target: self, action: #selector(handleTouchDoubleTap(_:)))
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTouchTap))
        tap.require(toFail: doubleTap)
        view.addGestureRecognizer(tap)

        view.addGestureRecognizer(
            UIPanGestureRecognizer(target: self, action: #selector(handleTouchPan(_:))))
        speedHold.addTarget(self, action: #selector(handleSpeedHold(_:)))
        speedHold.delegate = self
        view.addGestureRecognizer(speedHold)
        setupSpeedHoldIndicator()
        volumeView.alpha = 0.01
        view.addSubview(volumeView)
        NotificationCenter.default.addObserver(
            self, selector: #selector(restoreBrightness),
            name: UIApplication.didEnterBackgroundNotification, object: nil)
        for indicator in [brightnessIndicator, volumeIndicator] {
            indicator.alpha = 0
            view.insertSubview(indicator, belowSubview: osdScrim)
        }

        nextUpPlayButton.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(handleNextUpPlayTap)))
        nextUpCancelButton.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(handleNextUpCancelTap)))
        skipSegmentButton.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(handleSkipSegmentTap)))

        setupTopBarButtons()
    }

    /// Not docked, the transport sits across the middle of the picture. It's
    /// added last so the pause card can't cover it, and it fades with the rest
    /// of the controls, which keeps it from taking touches while they're down.
    private func setupCenterTransport() {
        centerTransport.translatesAutoresizingMaskIntoConstraints = false
        centerTransport.axis = .horizontal
        centerTransport.alignment = .center
        centerTransport.spacing = 60
        centerTransport.alpha = osdContainer.alpha
        view.addSubview(centerTransport)
        NSLayoutConstraint.activate([
            centerTransport.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerTransport.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    /// The remote leaves with its Menu button, which a touch screen doesn't
    /// have, so the top bar gets a close button. AirPlay sits beside it, since
    /// a phone is where people pick a speaker or a TV.
    private func setupTopBarButtons() {
        let close = UIButton(type: .system)
        close.translatesAutoresizingMaskIntoConstraints = false
        close.tintColor = .white
        close.setImage(
            UIImage(
                systemName: "xmark",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .semibold)),
            for: .normal)
        close.addAction(
            UIAction { [weak self] _ in self?.dismiss(animated: true) },
            for: .primaryActionTriggered)
        topContainer.addSubview(close)

        let airPlay = AVRoutePickerView()
        airPlay.translatesAutoresizingMaskIntoConstraints = false
        airPlay.tintColor = .white
        airPlay.activeTintColor = themeAccent
        airPlay.prioritizesVideoDevices = true
        topContainer.addSubview(airPlay)

        NSLayoutConstraint.activate([
            close.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor, constant: -90),
            close.topAnchor.constraint(
                equalTo: topContainer.safeAreaLayoutGuide.topAnchor, constant: 40),
            close.widthAnchor.constraint(equalToConstant: 96),
            close.heightAnchor.constraint(equalToConstant: 96),

            airPlay.trailingAnchor.constraint(equalTo: close.leadingAnchor, constant: -24),
            airPlay.centerYAnchor.constraint(equalTo: close.centerYAnchor),
            airPlay.widthAnchor.constraint(equalToConstant: 96),
            airPlay.heightAnchor.constraint(equalToConstant: 96),
        ])
    }

    /// A drag sideways scrubs the way the remote's touch surface does. Up or
    /// down changes brightness on the left half and volume on the right, the
    /// same as the Flutter player, while that setting is on.
    @objc private func handleTouchPan(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            panDirectionDecided = false
            verticalSwipe = nil
            panStartInWindow = recognizer.location(in: nil)
        case .changed:
            if !panDirectionDecided {
                let t = recognizer.translation(in: nil)
                if abs(t.y) > 24, abs(t.y) > abs(t.x) {
                    panDirectionDecided = true
                    beginVerticalSwipe()
                } else if abs(t.x) > 24 {
                    panDirectionDecided = true
                }
            }
            if verticalSwipe != nil {
                updateVerticalSwipe(recognizer)
                return
            }
        case .ended, .cancelled, .failed:
            if verticalSwipe != nil {
                verticalSwipe = nil
                return
            }
        default:
            break
        }
        handleScrubPan(recognizer)
    }

    private func beginVerticalSwipe() {
        guard swipeGesturesEnabled, presentedViewController == nil, !nextUpVisible,
            let window = view.window
        else { return }
        // The top and bottom edges belong to the system's own swipes.
        let top = max(window.safeAreaInsets.top, 48)
        let bottom = max(window.safeAreaInsets.bottom, 48)
        guard panStartInWindow.y > top, panStartInWindow.y < window.bounds.height - bottom
        else { return }
        let isVolume = panStartInWindow.x > window.bounds.width / 2
        if !isVolume, brightnessBeforeSwipe == nil, let screen = window.windowScene?.screen {
            brightnessBeforeSwipe = (screen, screen.brightness)
        }
        let start =
            isVolume
            ? AVAudioSession.sharedInstance().outputVolume
            : Float(window.windowScene?.screen.brightness ?? 0.5)
        verticalSwipe = (isVolume, start)
    }

    @objc func restoreBrightness() {
        guard let saved = brightnessBeforeSwipe else { return }
        brightnessBeforeSwipe = nil
        saved.screen.brightness = saved.value
    }

    private func updateVerticalSwipe(_ recognizer: UIPanGestureRecognizer) {
        guard let swipe = verticalSwipe, let window = view.window else { return }
        let delta = Float(-recognizer.translation(in: nil).y / (window.bounds.height * 0.7))
        let value = min(1, max(0, swipe.startValue + delta))
        let percent = "\(Int((value * 100).rounded()))%"
        if swipe.isVolume {
            volumeView.subviews.lazy.compactMap { $0 as? UISlider }.first?.value = value
            volumeIndicator.flash(
                symbol: value <= 0
                    ? "speaker.slash.fill" : (value < 0.5 ? "speaker.wave.1.fill" : "speaker.wave.3.fill"),
                value: value, label: percent)
        } else {
            window.windowScene?.screen.brightness = CGFloat(value)
            brightnessIndicator.flash(
                symbol: value <= 0.25 ? "sun.min" : (value >= 0.75 ? "sun.max.fill" : "sun.max"),
                value: value, label: percent)
        }
    }

    /// Only with the controls down, so a slow press on a button isn't taken
    /// for a hold. Live can't run ahead of the broadcast.
    private var canHoldForSpeed: Bool {
        presentedViewController == nil && !nextUpVisible && !cinemaSkipActive && !isLive
            && !isOsdOnScreen && scrubTargetMs == nil && player.state == .playing
    }

    @objc private func handleSpeedHold(_ recognizer: UILongPressGestureRecognizer) {
        switch recognizer.state {
        case .began:
            speedBeforeHold = Double(player.rate)
            onSetSpeed?(2)
            UIView.animate(withDuration: 0.2) { self.speedHoldIndicator.alpha = 1 }
        case .ended, .cancelled:
            guard let speed = speedBeforeHold else { return }
            speedBeforeHold = nil
            onSetSpeed?(speed)
            UIView.animate(withDuration: 0.2) { self.speedHoldIndicator.alpha = 0 }
        default:
            break
        }
    }

    /// The Flutter player's 2x pill, at the doubled scale.
    private func setupSpeedHoldIndicator() {
        let text = NSMutableAttributedString(string: "2x ")
        let symbol = NSTextAttachment()
        symbol.image = UIImage(
            systemName: "forward.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
        )?.withTintColor(.white, renderingMode: .alwaysOriginal)
        text.append(NSAttributedString(attachment: symbol))
        speedHoldIndicator.attributedText = text
        speedHoldIndicator.font = .systemFont(ofSize: 32, weight: .semibold)
        speedHoldIndicator.textColor = .white
        speedHoldIndicator.textAlignment = .center
        speedHoldIndicator.backgroundColor = UIColor(white: 0, alpha: 0.6)
        speedHoldIndicator.layer.cornerRadius = 28
        speedHoldIndicator.clipsToBounds = true
        speedHoldIndicator.alpha = 0
        speedHoldIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(speedHoldIndicator)
        NSLayoutConstraint.activate([
            speedHoldIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            speedHoldIndicator.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            speedHoldIndicator.widthAnchor.constraint(equalToConstant: 168),
            speedHoldIndicator.heightAnchor.constraint(equalToConstant: 72),
        ])
    }

    /// Placed the way the Flutter player aligns them, 85% of the way to a side.
    private func layoutGestureIndicators() {
        let size = GestureIndicatorView.size
        let bounds = view.bounds
        func frame(alignX: CGFloat) -> CGRect {
            CGRect(
                x: (bounds.width - size.width) * (alignX + 1) / 2,
                y: (bounds.height - size.height) / 2,
                width: size.width, height: size.height)
        }
        brightnessIndicator.frame = frame(alignX: gestureIndicatorsInverted ? 0.85 : -0.85)
        volumeIndicator.frame = frame(alignX: gestureIndicatorsInverted ? -0.85 : 0.85)
    }

    @objc private func handleTouchTap() {
        guard presentedViewController == nil, !nextUpVisible else { return }
        // Cinema Mode keeps the controls down, so a tap brings up the Skip
        // button the way the remote's right press does.
        if cinemaSkipActive {
            onCinemaSkipAction?("reveal", cinemaSkipGeneration)
            return
        }
        if isOsdOnScreen {
            osdDismissed = true
            hideOsd()
        } else {
            showOsd()
        }
    }

    /// Either side skips the way the remote's skip buttons do, and the middle
    /// plays or pauses.
    @objc private func handleTouchDoubleTap(_ recognizer: UITapGestureRecognizer) {
        guard presentedViewController == nil, !nextUpVisible else { return }
        if cinemaSkipActive {
            togglePlayPause()
            return
        }
        let x = recognizer.location(in: view).x
        let third = view.bounds.width / 3
        if isLive || (x >= third && x <= third * 2) {
            togglePlayPause()
        } else {
            activate(x < third ? .skipBack : .skipForward)
        }
        showOsd()
    }

    @objc private func handleControlTap(_ recognizer: UITapGestureRecognizer) {
        guard let tapped = recognizer.view,
            let id = controlViews.first(where: { $0.value === tapped })?.key
        else { return }
        activate(id)
        showOsd()
    }

    @objc private func handleNextUpPlayTap() {
        guard nextUpVisible else { return }
        hideNextUpCard()
        onNextUpPlay?()
    }

    @objc private func handleNextUpCancelTap() {
        guard nextUpVisible else { return }
        hideNextUpCard()
        onNextUpCancel?()
    }

    @objc private func handleSkipSegmentTap() {
        // Cinema Mode shows its Skip in the same button.
        if cinemaSkipActive {
            onCinemaSkipAction?("activate", cinemaSkipGeneration)
            return
        }
        guard skipSegmentActive else { return }
        hideSkipSegment()
        onSkipSegmentSelect?()
    }
}
#endif

private func infoFont(_ size: CGFloat, bold: Bool = false) -> UIFont {
    _ = robotoRegistered
    return UIFont(name: bold ? "Roboto-Bold" : "Roboto-Regular", size: size)
        ?? .systemFont(ofSize: size, weight: bold ? .semibold : .regular)
}

/// The Playback Information panel. Its rows aren't focusable, so Up and Down
/// scroll the list and Select or Back close it.
private final class InfoPanelViewController: UIViewController, RemotePlayerNavigable,
    UIScrollViewDelegate
{
    private static let panelWidth: CGFloat = 935
    private static let border: CGFloat = 2
    private static let side: CGFloat = 27
    private static let textWidth: CGFloat = panelWidth - 2 * border - 2 * side
    private static let scrollStep: CGFloat = 200
    private static let labelGap: CGFloat = 20

    private let sections: [[String: Any]]
    private let heading: String
    private let panel = UIView()
    private let scrollView = UIScrollView()
    private let thumb = UIView()
    private let dimText = UIColor(white: 1, alpha: 0.54)
    private var holdTimer: Timer?
    private var panStartY: CGFloat = 0

    init(sections: [[String: Any]], heading: String) {
        self.sections = sections
        self.heading = heading
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.54)

        // The system dismisses presented controllers on menu through its own
        // window level recognizer. Owning one here wins the arbitration.
        let menuTap = UITapGestureRecognizer(target: self, action: #selector(closePanel))
        menuTap.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
        view.addGestureRecognizer(menuTap)

        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pan.allowedTouchTypes = [NSNumber(value: UITouch.TouchType.indirect.rawValue)]
        view.addGestureRecognizer(pan)

        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.backgroundColor = UIColor(white: 26.0 / 255.0, alpha: 0.9)
        panel.layer.cornerRadius = 33
        panel.layer.borderWidth = Self.border
        panel.layer.borderColor =
            UIColor(red: 142.0 / 255.0, green: 200.0 / 255.0, blue: 240.0 / 255.0, alpha: 0.33)
            .cgColor
        panel.clipsToBounds = true
        view.addSubview(panel)

        // The layer border draws inside the bounds, so the content lays out
        // inside this guide to stay clear of it.
        let inner = UILayoutGuide()
        panel.addLayoutGuide(inner)

        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = heading
        title.font = infoFont(33, bold: true)
        title.textColor = .white
        panel.addSubview(title)

        let rule = UIView()
        rule.translatesAutoresizingMaskIntoConstraints = false
        rule.backgroundColor = UIColor(white: 1, alpha: 0.08)
        panel.addSubview(rule)

        let list = UIStackView(arrangedSubviews: listViews())
        list.translatesAutoresizingMaskIntoConstraints = false
        list.axis = .vertical

        // On tvOS scrolling is driven from the presses and the pan below, so the
        // scroll view's own pan stays out of it. On iOS a finger drags the list.
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        #if os(tvOS)
        scrollView.isScrollEnabled = false
        #endif
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.addSubview(list)
        panel.addSubview(scrollView)

        thumb.backgroundColor = UIColor(white: 1, alpha: 0.3)
        thumb.layer.cornerRadius = 2.5
        thumb.isHidden = true
        panel.addSubview(thumb)

        // Below the labels' compression resistance, so a long list scrolls
        // inside the capped panel instead of squeezing its rows.
        let fitList = scrollView.frameLayoutGuide.heightAnchor.constraint(
            equalTo: scrollView.contentLayoutGuide.heightAnchor)
        fitList.priority = UILayoutPriority(500)

        NSLayoutConstraint.activate([
            panel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            panel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            panel.widthAnchor.constraint(equalToConstant: Self.panelWidth),
            // A phone's canvas is shorter than the 1080 a TV gets.
            panel.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, constant: -80),

            inner.topAnchor.constraint(equalTo: panel.topAnchor, constant: Self.border),
            inner.bottomAnchor.constraint(equalTo: panel.bottomAnchor, constant: -Self.border),
            inner.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: Self.border),
            inner.trailingAnchor.constraint(equalTo: panel.trailingAnchor, constant: -Self.border),

            title.topAnchor.constraint(equalTo: inner.topAnchor, constant: 33),
            title.leadingAnchor.constraint(equalTo: inner.leadingAnchor, constant: 40),
            title.trailingAnchor.constraint(lessThanOrEqualTo: inner.trailingAnchor, constant: -40),

            rule.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            rule.leadingAnchor.constraint(equalTo: inner.leadingAnchor),
            rule.trailingAnchor.constraint(equalTo: inner.trailingAnchor),
            rule.heightAnchor.constraint(equalToConstant: 2),

            scrollView.topAnchor.constraint(equalTo: rule.bottomAnchor, constant: 13),
            scrollView.leadingAnchor.constraint(equalTo: inner.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: inner.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: inner.bottomAnchor, constant: -33),

            list.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            list.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            list.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            list.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -27),
            list.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            fitList,
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // The panel's own subviews take their frames after this pass, so they
        // are laid out first to place the thumb against the final list size.
        panel.layoutIfNeeded()
        layoutThumb()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        endHold()
    }

    private func listViews() -> [UIView] {
        var views: [UIView] = []
        for section in sections {
            let rows = ((section["rows"] as? [[String: Any]]) ?? []).compactMap { rowView($0) }
            guard !rows.isEmpty else { continue }
            let header = makeLabel((section["title"] as? String) ?? "", size: 27, bold: true)
            views.append(padded(header, top: 20, bottom: 7))
            views += rows
        }
        return views
    }

    private func rowView(_ row: [String: Any]) -> UIView? {
        if let note = row["note"] as? String {
            guard !note.isEmpty else { return nil }
            return padded(makeLabel(note, size: 20, color: dimText), top: 0, bottom: 7)
        }
        guard let value = row["value"] as? String, !value.isEmpty else { return nil }
        let name = makeLabel((row["label"] as? String) ?? "", size: 22, color: dimText)
        name.setContentHuggingPriority(.required, for: .horizontal)
        name.setContentCompressionResistancePriority(.required, for: .horizontal)
        let valueLabel = makeLabel(
            value, size: 22, bold: (row["bold"] as? Bool) ?? false,
            width: Self.textWidth - ceil(name.intrinsicContentSize.width) - Self.labelGap)
        valueLabel.textAlignment = .right
        let line = UIStackView(arrangedSubviews: [name, valueLabel])
        line.alignment = .top
        line.spacing = Self.labelGap
        return padded(line, top: 5, bottom: 5)
    }

    /// The wrap width is set up front so each row's height is right on the
    /// first layout pass, which the panel height and the thumb depend on.
    private func makeLabel(
        _ text: String, size: CGFloat, bold: Bool = false, color: UIColor = .white,
        width: CGFloat? = nil
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = infoFont(size, bold: bold)
        label.textColor = color
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = width ?? Self.textWidth
        return label
    }

    private func padded(_ child: UIView, top: CGFloat, bottom: CGFloat) -> UIView {
        let box = UIView()
        child.translatesAutoresizingMaskIntoConstraints = false
        box.addSubview(child)
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: box.topAnchor, constant: top),
            child.bottomAnchor.constraint(equalTo: box.bottomAnchor, constant: -bottom),
            child.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: Self.side),
            child.trailingAnchor.constraint(equalTo: box.trailingAnchor, constant: -Self.side),
        ])
        return box
    }

    private func scroll(by delta: CGFloat) {
        scroll(to: scrollView.contentOffset.y + delta, animated: true)
    }

    private func scroll(to y: CGFloat, animated: Bool) {
        let maxY = max(0, scrollView.contentSize.height - scrollView.bounds.height)
        let target = min(maxY, max(0, y))
        guard target != scrollView.contentOffset.y else { return }
        guard animated else {
            scrollView.contentOffset.y = target
            return
        }
        UIView.animate(
            withDuration: 0.12, delay: 0, options: [.curveEaseOut, .beginFromCurrentState]
        ) {
            self.scrollView.contentOffset.y = target
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        layoutThumb()
    }

    private func layoutThumb() {
        let track = scrollView.frame
        let content = scrollView.contentSize.height
        thumb.isHidden = content <= track.height + 0.5
        guard !thumb.isHidden else { return }
        let length = max(40, track.height * track.height / content)
        let progress = min(1, max(0, scrollView.contentOffset.y / (content - track.height)))
        thumb.frame = CGRect(
            x: track.maxX - 8 - 5, y: track.minY + (track.height - length) * progress,
            width: 5, height: length)
    }

    /// A swipe down moves down the list, the same direction a swipe moves focus.
    @objc private func handlePan(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            panStartY = scrollView.contentOffset.y
        case .changed:
            scroll(to: panStartY + recognizer.translation(in: view).y, animated: false)
        default:
            break
        }
    }

    @objc private func closePanel() {
        endHold()
        guard !isBeingDismissed else { return }
        dismiss(animated: true)
    }

    /// One step per press, then the timer repeats while the key is held. When
    /// tvOS repeats the press itself, each one restarts the timer first.
    private func beginHold(_ direction: CGFloat) {
        holdTimer?.invalidate()
        let delta = direction * Self.scrollStep
        scroll(by: delta)
        let timer = Timer(
            fire: Date().addingTimeInterval(0.35), interval: 0.12, repeats: true
        ) { [weak self] _ in
            Task { @MainActor in self?.scroll(by: delta) }
        }
        RunLoop.main.add(timer, forMode: .common)
        holdTimer = timer
    }

    private func endHold() {
        holdTimer?.invalidate()
        holdTimer = nil
    }

    func handleRemoteNavigation(_ command: String) {
        switch command {
        case "moveup": scroll(by: -Self.scrollStep)
        case "movedown": scroll(by: Self.scrollStep)
        case "select", "back": closePanel()
        default: break
        }
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses {
            switch press.type {
            case .upArrow, .downArrow:
                beginHold(press.type == .downArrow ? 1 : -1)
                return
            case .select:
                closePanel()
                return
            case .menu, .leftArrow, .rightArrow:
                // Menu is consumed so the down press can't reach the system
                // while the recognizer decides on release.
                return
            default:
                break
            }
        }
        super.pressesBegan(presses, with: event)
    }

    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        if presses.contains(where: { $0.type == .upArrow || $0.type == .downArrow }) {
            endHold()
        }
        super.pressesEnded(presses, with: event)
    }

    override func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        endHold()
        super.pressesCancelled(presses, with: event)
    }
}

private final class CastPanelViewController: UIViewController, RemotePlayerNavigable, UICollectionViewDataSource,
    UICollectionViewDelegate
{
    private let people: [(name: String, subtitle: String, imageUrl: String, personId: String)]
    private let onSelect: (String) -> Void
    private var collectionView: UICollectionView!

    init(
        people: [(name: String, subtitle: String, imageUrl: String, personId: String)],
        onSelect: @escaping (String) -> Void
    ) {
        self.people = people
        self.onSelect = onSelect
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

    func collectionView(
        _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath
    ) {
        let person = people[indexPath.item]
        guard !person.personId.isEmpty else { return }
        onSelect(person.personId)
    }

    func handleRemoteNavigation(_ command: String) {
        if command == "back" { dismiss(animated: true); return }
        guard !people.isEmpty else { return }
        let system = UIFocusSystem.focusSystem(for: view)
        let cell = system?.focusedItem as? UICollectionViewCell
        let focused = cell.flatMap { collectionView.indexPath(for: $0) }
        if command == "select", let focused {
            collectionView(collectionView, didSelectItemAt: focused)
            return
        }
        let delta = command == "moveleft" ? -1 : command == "moveright" ? 1 : 0
        let index = focused.map { min(people.count - 1, max(0, $0.item + delta)) } ?? 0
        let target = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: target, at: .centeredHorizontally, animated: false)
        collectionView.layoutIfNeeded()
        if let targetCell = collectionView.cellForItem(at: target) {
            system?.requestFocusUpdate(to: targetCell)
            system?.updateFocusIfNeeded()
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
        MoonfinURLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
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

// Mirrors the Flutter StillWatchingDialog at the same 2x scale the other
// prompt surfaces use: a glass card with an eye badge, title, body copy, a
// full width accent Continue over a quiet Stop. Focus is the two stacked
// buttons with the soft overlay Material renders, no border ring.
private final class StillWatchingViewController: UIViewController, RemotePlayerNavigable {
    private let strings: PromptStrings
    private let accent: UIColor
    private let surface: UIColor
    private let onContinue: () -> Void
    private let onExit: () -> Void

    private let continueOverlay = UIView()
    private let stopOverlay = UIView()
    private var focusOnContinue = true
    private var answered = false

    init(
        strings: PromptStrings,
        accent: UIColor,
        surface: UIColor,
        onContinue: @escaping () -> Void,
        onExit: @escaping () -> Void
    ) {
        self.strings = strings
        self.accent = accent
        self.surface = surface
        self.onContinue = onContinue
        self.onExit = onExit
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.54)

        // The system dismisses presented controllers on menu through its own
        // window level recognizer, which would skip the exit callback and
        // leave the Dart side waiting. Owning a menu recognizer wins the
        // arbitration, the same as the player does.
        let menuTap = UITapGestureRecognizer(target: self, action: #selector(handleMenuTap))
        menuTap.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
        #if os(iOS)
        // A tap recognizer takes every finger too, so a tap on Continue could
        // land here and answer Stop. Only the Menu press should reach this one.
        menuTap.allowedTouchTypes = []
        #endif
        view.addGestureRecognizer(menuTap)

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.layer.cornerRadius = 48
        card.clipsToBounds = true
        view.addSubview(card)

        let glass = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        glass.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(glass)

        let tint = UIView()
        tint.translatesAutoresizingMaskIntoConstraints = false
        tint.backgroundColor = surface.withAlphaComponent(0.22)
        card.addSubview(tint)

        let badge = UIView()
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.backgroundColor = accent.withAlphaComponent(0.16)
        badge.layer.cornerRadius = 54
        badge.layer.borderWidth = 1
        badge.layer.borderColor = accent.withAlphaComponent(0.4).cgColor
        card.addSubview(badge)

        let eye = UIImageView(
            image: UIImage(
                systemName: "eye",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 44, weight: .regular)))
        eye.translatesAutoresizingMaskIntoConstraints = false
        eye.tintColor = accent
        badge.addSubview(eye)

        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = strings.stillWatchingTitle
        title.font = .systemFont(ofSize: 38, weight: .semibold)
        title.textColor = .white
        title.textAlignment = .center
        card.addSubview(title)

        let body = UILabel()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.text = strings.stillWatchingBody
        body.font = .systemFont(ofSize: 28, weight: .regular)
        body.textColor = UIColor(white: 1, alpha: 0.62)
        body.textAlignment = .center
        body.numberOfLines = 0
        card.addSubview(body)

        let continueButton = UIView()
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.backgroundColor = accent
        continueButton.layer.cornerRadius = 28
        continueButton.clipsToBounds = true
        card.addSubview(continueButton)

        continueOverlay.translatesAutoresizingMaskIntoConstraints = false
        continueOverlay.backgroundColor = UIColor(white: 1, alpha: 0.12)
        continueButton.addSubview(continueOverlay)

        let continueLabel = UILabel()
        continueLabel.translatesAutoresizingMaskIntoConstraints = false
        continueLabel.text = strings.stillWatchingContinue
        continueLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        continueLabel.textColor = .white
        continueLabel.textAlignment = .center
        continueButton.addSubview(continueLabel)

        let stopButton = UIView()
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.layer.cornerRadius = 28
        stopButton.clipsToBounds = true
        card.addSubview(stopButton)

        stopOverlay.translatesAutoresizingMaskIntoConstraints = false
        stopOverlay.backgroundColor = UIColor(white: 1, alpha: 0.12)
        stopButton.addSubview(stopOverlay)

        let stopLabel = UILabel()
        stopLabel.translatesAutoresizingMaskIntoConstraints = false
        stopLabel.text = strings.stillWatchingStop
        stopLabel.font = .systemFont(ofSize: 28, weight: .medium)
        stopLabel.textColor = UIColor(white: 1, alpha: 0.6)
        stopLabel.textAlignment = .center
        stopButton.addSubview(stopLabel)

        #if os(iOS)
        continueButton.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(handleContinueTap)))
        stopButton.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(handleStopTap)))
        #endif

        NSLayoutConstraint.activate([
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            card.widthAnchor.constraint(equalToConstant: 720),

            glass.topAnchor.constraint(equalTo: card.topAnchor),
            glass.bottomAnchor.constraint(equalTo: card.bottomAnchor),
            glass.leadingAnchor.constraint(equalTo: card.leadingAnchor),
            glass.trailingAnchor.constraint(equalTo: card.trailingAnchor),
            tint.topAnchor.constraint(equalTo: card.topAnchor),
            tint.bottomAnchor.constraint(equalTo: card.bottomAnchor),
            tint.leadingAnchor.constraint(equalTo: card.leadingAnchor),
            tint.trailingAnchor.constraint(equalTo: card.trailingAnchor),

            badge.topAnchor.constraint(equalTo: card.topAnchor, constant: 52),
            badge.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            badge.widthAnchor.constraint(equalToConstant: 108),
            badge.heightAnchor.constraint(equalToConstant: 108),
            eye.centerXAnchor.constraint(equalTo: badge.centerXAnchor),
            eye.centerYAnchor.constraint(equalTo: badge.centerYAnchor),

            title.topAnchor.constraint(equalTo: badge.bottomAnchor, constant: 32),
            title.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 48),
            title.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -48),

            body.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            body.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 48),
            body.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -48),

            continueButton.topAnchor.constraint(equalTo: body.bottomAnchor, constant: 48),
            continueButton.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 48),
            continueButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -48),
            continueOverlay.topAnchor.constraint(equalTo: continueButton.topAnchor),
            continueOverlay.bottomAnchor.constraint(equalTo: continueButton.bottomAnchor),
            continueOverlay.leadingAnchor.constraint(equalTo: continueButton.leadingAnchor),
            continueOverlay.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor),
            continueLabel.topAnchor.constraint(equalTo: continueButton.topAnchor, constant: 26),
            continueLabel.bottomAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: -26),
            continueLabel.leadingAnchor.constraint(equalTo: continueButton.leadingAnchor),
            continueLabel.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor),

            stopButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 20),
            stopButton.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 48),
            stopButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -48),
            stopButton.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -48),
            stopOverlay.topAnchor.constraint(equalTo: stopButton.topAnchor),
            stopOverlay.bottomAnchor.constraint(equalTo: stopButton.bottomAnchor),
            stopOverlay.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            stopOverlay.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            stopLabel.topAnchor.constraint(equalTo: stopButton.topAnchor, constant: 22),
            stopLabel.bottomAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: -22),
            stopLabel.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            stopLabel.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
        ])

        updateFocusHighlight()
    }

    private func updateFocusHighlight() {
        continueOverlay.isHidden = !focusOnContinue
        stopOverlay.isHidden = focusOnContinue
    }

    private func resolve(continueWatching: Bool) {
        guard !answered else { return }
        answered = true
        dismiss(animated: true) {
            continueWatching ? self.onContinue() : self.onExit()
        }
    }

    @objc private func handleMenuTap() {
        resolve(continueWatching: false)
    }

    @objc private func handleContinueTap() {
        resolve(continueWatching: true)
    }

    @objc private func handleStopTap() {
        resolve(continueWatching: false)
    }

    // If the panel leaves the screen without an answer, resolve as continue
    // so playback resumes instead of the prompt hanging the session.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if !answered {
            answered = true
            onContinue()
        }
    }

    func handleRemoteNavigation(_ command: String) {
        switch command {
        case "moveup": focusOnContinue = true; updateFocusHighlight()
        case "movedown": focusOnContinue = false; updateFocusHighlight()
        case "select": resolve(continueWatching: focusOnContinue)
        case "back": resolve(continueWatching: false)
        default: break
        }
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses {
            switch press.type {
            case .upArrow:
                focusOnContinue = true
                updateFocusHighlight()
                return
            case .downArrow:
                focusOnContinue = false
                updateFocusHighlight()
                return
            case .select:
                resolve(continueWatching: focusOnContinue)
                return
            case .menu:
                return
            default:
                break
            }
        }
        super.pressesBegan(presses, with: event)
    }
}

private final class SyncPlayPanelViewController: UIViewController, RemotePlayerNavigable {
    private let groupName: String
    private let participants: [String]
    private var ignoreWait: Bool
    private let onIgnoreWait: (Bool) -> Void
    private let onLeave: () -> Void
    private let ignoreWaitButton = UIButton(type: .system)
    private let leaveButton = UIButton(type: .system)

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

    func handleRemoteNavigation(_ command: String) {
        if command == "back" { dismiss(animated: true); return }
        let system = UIFocusSystem.focusSystem(for: view)
        if command == "select", let button = system?.focusedItem as? UIButton {
            button.sendActions(for: .primaryActionTriggered)
            return
        }
        guard command == "moveup" || command == "movedown" else { return }
        let target = command == "movedown" ? leaveButton : ignoreWaitButton
        system?.requestFocusUpdate(to: target)
        system?.updateFocusIfNeeded()
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses where press.type == .menu {
            dismiss(animated: true)
            return
        }
        super.pressesBegan(presses, with: event)
    }
}

/// An overlay on the native player that handles session remote commands itself.
@MainActor
protocol RemotePlayerNavigable: AnyObject {
    func handleRemoteNavigation(_ command: String)
}

/// UIKit has no public way to trigger a UIAlertAction from code, so when a
/// session remote command reaches an alert, this table replaces it with the
/// same actions. Alerts driven by the Siri Remote stay native.
private final class RemotePlayerMenu: UITableViewController, RemotePlayerNavigable {
    struct Entry {
        let action: UIAlertAction
        let invoke: (UIAlertAction) -> Void
    }
    private let entries: [Entry]
    private let message: String?
    private var selectedIndex = 0
    private var answered = false

    init(title: String?, message: String?, entries: [Entry]) {
        self.entries = entries.filter { $0.action.isEnabled }
        self.message = message
        super.init(style: .grouped)
        self.title = title
        modalPresentationStyle = .overFullScreen
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(white: 0.08, alpha: 0.98)
        tableView.contentInset = UIEdgeInsets(top: 60, left: 240, bottom: 60, right: 240)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "action")
        tableView.remembersLastFocusedIndexPath = true
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        [title, message].compactMap { $0 }.joined(separator: "\n")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { entries.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "action", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = entries[indexPath.row].action.title
        cell.contentConfiguration = content
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { activate(indexPath.row) }

    override func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let next = context.nextFocusedIndexPath { selectedIndex = next.row }
    }

    override func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        entries.isEmpty ? nil : IndexPath(row: selectedIndex, section: 0)
    }

    private func activate(_ index: Int) {
        guard !answered, !isBeingDismissed, entries.indices.contains(index) else { return }
        answered = true
        let entry = entries[index]
        dismiss(animated: true) { entry.invoke(entry.action) }
    }

    func handleRemoteNavigation(_ command: String) {
        guard !answered, !isBeingDismissed else { return }
        if command == "back" {
            if let cancel = entries.firstIndex(where: { $0.action.style == .cancel }) {
                activate(cancel)
            } else {
                answered = true
                dismiss(animated: true)
            }
            return
        }
        guard !entries.isEmpty else { return }
        if command == "select" { activate(selectedIndex); return }
        switch command {
        case "moveup", "moveleft": selectedIndex = max(0, selectedIndex - 1)
        case "movedown", "moveright": selectedIndex = min(entries.count - 1, selectedIndex + 1)
        default: return
        }
        let path = IndexPath(row: selectedIndex, section: 0)
        tableView.scrollToRow(at: path, at: .middle, animated: false)
        tableView.layoutIfNeeded()
        if let cell = tableView.cellForRow(at: path) {
            let system = UIFocusSystem.focusSystem(for: view)
            system?.requestFocusUpdate(to: cell)
            system?.updateFocusIfNeeded()
        }
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        if presses.contains(where: { $0.type == .menu }) {
            handleRemoteNavigation("back")
            return
        }
        super.pressesBegan(presses, with: event)
    }
}

#if os(iOS)
/// The Flutter player's brightness and volume indicator, drawn at the doubled
/// scale the rest of the player uses.
private final class GestureIndicatorView: UIView {
    static let size = CGSize(width: 232, height: 424)
    private static let barHeight: CGFloat = 240
    private let iconView = UIImageView()
    private let track = UIView()
    private let fill = UIView()
    private let label = UILabel()
    private var value: CGFloat = 0
    private var hideTimer: Timer?

    init() {
        super.init(frame: CGRect(origin: .zero, size: Self.size))
        backgroundColor = UIColor(white: 0, alpha: 0.6)
        layer.cornerRadius = 28
        isUserInteractionEnabled = false
        iconView.tintColor = .white
        iconView.contentMode = .scaleAspectFit
        track.backgroundColor = UIColor(white: 1, alpha: 0.24)
        track.layer.cornerRadius = 4
        track.clipsToBounds = true
        fill.backgroundColor = .white
        track.addSubview(fill)
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        for subview in [iconView, track, label] { addSubview(subview) }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.width
        iconView.frame = CGRect(x: (width - 48) / 2, y: 32, width: 48, height: 48)
        track.frame = CGRect(
            x: (width - 8) / 2, y: iconView.frame.maxY + 20, width: 8, height: Self.barHeight)
        label.frame = CGRect(x: 28, y: track.frame.maxY + 20, width: width - 56, height: 32)
        layoutFill()
    }

    private func layoutFill() {
        let height = Self.barHeight * value
        fill.frame = CGRect(x: 0, y: Self.barHeight - height, width: 8, height: height)
    }

    /// Fades out shortly after the last change, the way the Flutter one does.
    func flash(symbol: String, value: Float, label text: String) {
        iconView.image = UIImage(
            systemName: symbol,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .medium))
        self.value = CGFloat(min(1, max(0, value)))
        layoutFill()
        label.text = text
        if alpha < 1 {
            UIView.animate(withDuration: 0.2) { self.alpha = 1 }
        }
        hideTimer?.invalidate()
        hideTimer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { [weak self] _ in
            Task { @MainActor in
                guard let self else { return }
                UIView.animate(withDuration: 0.2) { self.alpha = 0 }
            }
        }
    }
}
#endif
