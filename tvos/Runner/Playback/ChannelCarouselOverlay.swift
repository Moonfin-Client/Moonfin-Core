import UIKit

/// First hold repeat fires this long after key down, so a deliberate single
/// press moves exactly one channel.
private let holdStartDelay: TimeInterval = 0.35

/// Subsequent hold repeats fire at this interval, roughly nine channels a
/// second, which reads as fast continuous scrolling rather than stepping.
private let holdRepeatInterval: TimeInterval = 0.11

/// Watchdog window, refreshed by incoming key events only, so a hold whose
/// repeats stop arriving cannot scroll forever.
private let holdSafety: TimeInterval = 0.9

/// One card's travel takes exactly one repeat interval, so a hold reads as
/// continuous motion.
private let scrollDuration: TimeInterval = holdRepeatInterval

private let carouselEnterDuration: TimeInterval = 0.18

/// The way out is a secret quicker than the way in, so dismissal never feels
/// like it is holding the picture back.
private let carouselExitDuration: TimeInterval = 0.14

private let carouselInactivity: TimeInterval = 120

/// The quick channel changer: a center locked strip of channel cards over a
/// scrim, with the centered channel's program above it. Native port of the
/// Flutter overlay, so the two surfaces behave the same way.
@MainActor
final class ChannelCarouselOverlayViewController: UIViewController {
    var onChannelSelected: ((String) -> Void)?

    /// DOWN leaves the carousel and hands the player its controls.
    var onShowControls: (() -> Void)?

    /// Back or the inactivity timeout, so the player can put back whatever it
    /// had on screen when the changer opened.
    var onDismissed: (() -> Void)?

    private var entries: [ChannelCarouselEntry]
    private var theme: ChannelCarouselTheme

    private let scrim = UIView()
    private let gradient = CAGradientLayer()
    private let headerContainer = UIView()
    private let titleLabel = UILabel()
    private let metaLabel = UILabel()
    private let overviewLabel = UILabel()
    private let stripClip = UIView()
    private let stripContainer = UIView()

    /// One card per visible offset from the center, ordered leading to
    /// trailing. Positions stay within the strip, so a long scroll cannot walk
    /// the geometry out to coordinates CoreAnimation will not draw.
    private var cards: [ChannelCarouselCardView] = []

    private var centerIndex = 0
    private var pitch = ChannelCarouselMetrics.cardWidth + ChannelCarouselMetrics.cardSpacing
    private var cardWidth = ChannelCarouselMetrics.cardWidth
    private var visibleCards = 1
    private var laidOutWidth: CGFloat = 0

    private var holdDirection = 0
    private var holdStartTimer: Timer?
    private var holdRepeatTimer: Timer?
    private var watchdogTimer: Timer?
    private var inactivityTimer: Timer?
    private var headerTimer: Timer?
    private var dismissed = false

    private static let overlayPadding = UIEdgeInsets(top: 48, left: 48, bottom: 48, right: 48)
    private static let headerPadding = UIEdgeInsets(top: 12, left: 32, bottom: 0, right: 32)
    private static let titleGap: CGFloat = 4
    private static let overviewGap: CGFloat = 8
    private static let overviewLines = 2
    private static let stripGap: CGFloat = 24
    private static let headerDebounce: TimeInterval = 0.15

    /// The strip clips horizontally so cards cannot spill past its edges. It
    /// is given room above and below so the centered card's glow is not cut.
    private static let glowMargin: CGFloat = 48

    private var count: Int { entries.count }
    private var centeredIndex: Int {
        CarouselIndex.channelIndex(for: centerIndex, count: count)
    }

    init(entries: [ChannelCarouselEntry], startIndex: Int, theme: ChannelCarouselTheme) {
        self.entries = entries
        self.theme = theme
        super.init(nibName: nil, bundle: nil)
        centerIndex = min(max(0, startIndex), max(0, entries.count - 1))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        // Reaches most of its darkness by the time it is behind the
        // description, which carries no panel of its own.
        gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.82).cgColor,
            UIColor.black.withAlphaComponent(0.94).cgColor,
        ]
        gradient.locations = [0, 0.28, 1]
        scrim.layer.addSublayer(gradient)
        view.addSubview(scrim)

        titleLabel.font = .systemFont(ofSize: 36, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 1
        headerContainer.addSubview(titleLabel)

        metaLabel.font = .systemFont(ofSize: 26, weight: .regular)
        metaLabel.textColor = UIColor(white: 1, alpha: 0.7)
        metaLabel.numberOfLines = 1
        headerContainer.addSubview(metaLabel)

        overviewLabel.font = .systemFont(ofSize: 32, weight: .regular)
        overviewLabel.textColor = UIColor(white: 1, alpha: 0.6)
        overviewLabel.numberOfLines = Self.overviewLines
        headerContainer.addSubview(overviewLabel)

        scrim.addSubview(headerContainer)
        stripClip.clipsToBounds = true
        stripClip.addSubview(stripContainer)
        scrim.addSubview(stripClip)

        addMenuRecognizer()
        addSwipeRecognizers()
        updateHeader()
        resetInactivity()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let padding = Self.overlayPadding
        let stripWidth = view.bounds.width - padding.left - padding.right
        let headerHeight = headerExtent()
        let scrimHeight =
            padding.top + headerHeight + Self.stripGap
            + ChannelCarouselMetrics.cardHeight + padding.bottom

        // Set through bounds and center rather than frame, because the
        // entrance leaves a transform on the scrim and a frame written under
        // one lands somewhere undefined.
        scrim.bounds = CGRect(x: 0, y: 0, width: view.bounds.width, height: scrimHeight)
        scrim.center = CGPoint(
            x: view.bounds.midX, y: view.bounds.height - scrimHeight / 2)
        gradient.frame = scrim.bounds

        headerContainer.frame = CGRect(
            x: padding.left, y: padding.top, width: stripWidth, height: headerHeight)
        layoutHeader()

        stripClip.frame = CGRect(
            x: padding.left,
            y: padding.top + headerHeight + Self.stripGap - Self.glowMargin,
            width: stripWidth,
            height: ChannelCarouselMetrics.cardHeight + 2 * Self.glowMargin)

        if laidOutWidth != stripWidth {
            laidOutWidth = stripWidth
            applyLayout(stripWidth: stripWidth)
        }
    }

    private func layoutHeader() {
        let padding = Self.headerPadding
        let width = headerContainer.bounds.width - padding.left - padding.right
        let titleLine = titleLabel.font.lineHeight.rounded(.up)
        let metaLine = metaLabel.font.lineHeight.rounded(.up)
        let overviewLine = overviewLabel.font.lineHeight.rounded(.up)
        var y = padding.top
        titleLabel.frame = CGRect(x: padding.left, y: y, width: width, height: titleLine)
        y += titleLine + Self.titleGap
        metaLabel.frame = CGRect(x: padding.left, y: y, width: width, height: metaLine)
        y += metaLine + Self.overviewGap
        overviewLabel.frame = CGRect(
            x: padding.left, y: y, width: width,
            height: overviewLine * CGFloat(Self.overviewLines))
    }

    /// The header reserves room for its lines whether or not the centered
    /// program fills them, so the strip never shifts as the selection moves.
    private func headerExtent() -> CGFloat {
        Self.headerPadding.top + Self.headerPadding.bottom
            + titleLabel.font.lineHeight.rounded(.up)
            + Self.titleGap
            + metaLabel.font.lineHeight.rounded(.up)
            + Self.overviewGap
            + CGFloat(Self.overviewLines) * overviewLabel.font.lineHeight.rounded(.up)
    }

    // MARK: - Entrance and exit

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard scrim.transform.isIdentity, scrim.frame.height > 0 else { return }
        scrim.transform = CGAffineTransform(translationX: 0, y: scrim.frame.height)
        UIView.animate(
            withDuration: carouselEnterDuration, delay: 0,
            options: [.curveEaseOut]
        ) {
            self.scrim.transform = .identity
        }
    }

    private func stopTimers() {
        endHold()
        inactivityTimer?.invalidate()
        headerTimer?.invalidate()
    }

    private func dismissCarousel(showingControls: Bool = false) {
        guard !dismissed else { return }
        dismissed = true
        stopTimers()
        UIView.animate(
            withDuration: carouselExitDuration, delay: 0,
            options: [.curveEaseIn],
            animations: {
                self.scrim.transform = CGAffineTransform(
                    translationX: 0, y: self.scrim.frame.height)
            },
            completion: { _ in
                self.dismiss(animated: false) {
                    if showingControls {
                        self.onShowControls?()
                    } else {
                        self.onDismissed?()
                    }
                }
            })
    }

    // MARK: - Data

    /// Adopts a fresh lineup. Cards are rebound in place so a schedule arriving
    /// mid scroll cannot move the selection.
    func update(entries: [ChannelCarouselEntry], theme: ChannelCarouselTheme) {
        let previousId = self.entries.indices.contains(centeredIndex)
            ? self.entries[centeredIndex].channelId : ""
        self.theme = theme
        let countChanged = entries.count != self.entries.count
        self.entries = entries
        if countChanged {
            centerIndex = entries.firstIndex { $0.channelId == previousId } ?? 0
            rebuildCards()
        } else {
            for card in cards { card.applyTheme(theme) }
            bindCards()
        }
        updateHeader()
    }

    // MARK: - Strip

    private func applyLayout(stripWidth: CGFloat) {
        let layout = ChannelCarouselMetrics.layout(forStripWidth: stripWidth)
        visibleCards = layout.count
        pitch = layout.pitch
        cardWidth = layout.width
        stripContainer.frame = CGRect(
            x: 0, y: Self.glowMargin,
            width: stripWidth, height: ChannelCarouselMetrics.cardHeight)
        rebuildCards()
    }

    private var centerOffset: CGFloat { (stripClip.bounds.width - cardWidth) / 2 }

    /// Cards either side of the center, plus two beyond the viewport so a card
    /// is never seen arriving.
    private var halfSpan: Int { visibleCards / 2 + 2 }

    private func rebuildCards() {
        for card in cards { card.removeFromSuperview() }
        cards.removeAll()
        guard count > 0 else { return }
        for offset in -halfSpan...halfSpan {
            let card = ChannelCarouselCardView(theme: theme)
            card.frame = CGRect(
                x: centerOffset + CGFloat(offset) * pitch, y: 0,
                width: cardWidth, height: ChannelCarouselMetrics.cardHeight)
            stripContainer.addSubview(card)
            cards.append(card)
        }
        stripContainer.frame.origin.x = 0
        bindCards()
    }

    private func bindCards() {
        guard count > 0 else { return }
        for (slot, card) in cards.enumerated() {
            let offset = slot - halfSpan
            let index = CarouselIndex.channelIndex(for: centerIndex + offset, count: count)
            card.configure(entries[index], centered: offset == 0)
        }
    }

    // MARK: - Motion

    /// Rebinding moves the lineup under the center instantly, so the strip is
    /// first pushed back by the same distance and then animated home. A step
    /// arriving mid flight measures from where the strip actually is, which is
    /// what keeps a held press reading as one continuous run.
    private func move(by delta: Int) {
        guard count > 1, delta != 0, !cards.isEmpty else { return }
        let current =
            stripContainer.layer.presentation()?.frame.origin.x
            ?? stripContainer.frame.origin.x
        stripContainer.layer.removeAllAnimations()
        stripContainer.frame.origin.x = current + CGFloat(delta) * pitch

        centerIndex = CarouselIndex.channelIndex(for: centerIndex + delta, count: count)
        bindCards()

        UIView.animate(
            withDuration: scrollDuration, delay: 0,
            options: [.curveLinear, .allowUserInteraction]
        ) {
            self.stripContainer.frame.origin.x = 0
        }
        scheduleHeader()
    }

    // MARK: - Header

    private func scheduleHeader() {
        headerTimer?.invalidate()
        clearHeader()
        headerTimer = Timer.scheduledTimer(
            withTimeInterval: Self.headerDebounce, repeats: false
        ) { [weak self] _ in
            Task { @MainActor in self?.updateHeader() }
        }
    }

    private func clearHeader() {
        titleLabel.text = ""
        metaLabel.text = ""
        overviewLabel.text = ""
    }

    private func updateHeader() {
        guard entries.indices.contains(centeredIndex) else { return }
        let entry = entries[centeredIndex]
        // Some sources repeat the program name as the episode title. Showing
        // it twice reads as a glitch.
        let episode =
            !entry.episodeTitle.isEmpty && entry.episodeTitle != entry.programTitle
            ? " - " + entry.episodeTitle : ""
        let name = entry.programTitle.isEmpty ? entry.channelName : entry.programTitle
        titleLabel.text = name + episode + entry.seasonEpisode

        // The channel number and call sign are on the focused card already.
        var meta: [String] = []
        if !entry.timeLabel.isEmpty { meta.append(entry.timeLabel) }
        let rating = entry.rating.trimmingCharacters(in: .whitespaces)
        if !rating.isEmpty { meta.append(rating) }
        meta.append(contentsOf: entry.tags)
        metaLabel.text = meta.joined(separator: " · ")
        overviewLabel.text = entry.overview
    }

    // MARK: - Input

    private func addMenuRecognizer() {
        // The system dismisses a presented controller on menu through its own
        // window level recognizer, which overriding pressesBegan cannot stop.
        let menuTap = UITapGestureRecognizer(target: self, action: #selector(handleMenuTap))
        menuTap.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
        view.addGestureRecognizer(menuTap)
    }

    private func addSwipeRecognizers() {
        for direction in [
            UISwipeGestureRecognizer.Direction.left, .right, .down,
        ] {
            let swipe = UISwipeGestureRecognizer(
                target: self, action: #selector(handleSwipe(_:)))
            swipe.direction = direction
            view.addGestureRecognizer(swipe)
        }
    }

    @objc private func handleMenuTap() {
        dismissCarousel()
    }

    @objc private func handleSwipe(_ recognizer: UISwipeGestureRecognizer) {
        resetInactivity()
        switch recognizer.direction {
        case .left: move(by: -1)
        case .right: move(by: 1)
        case .down: dismissCarousel(showingControls: true)
        default: break
        }
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        resetInactivity()
        for press in presses {
            switch press.type {
            case .menu:
                // Consumed so the down press cannot reach the system while the
                // recognizer decides on release.
                return
            case .select:
                guard entries.indices.contains(centeredIndex) else { return }
                let id = entries[centeredIndex].channelId
                dismissed = true
                stopTimers()
                dismiss(animated: false) { [weak self] in
                    self?.onChannelSelected?(id)
                }
                return
            case .leftArrow:
                refreshWatchdog()
                beginHold(direction: -1)
                return
            case .rightArrow:
                refreshWatchdog()
                beginHold(direction: 1)
                return
            case .downArrow:
                dismissCarousel(showingControls: true)
                return
            default:
                break
            }
        }
        super.pressesBegan(presses, with: event)
    }

    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses where press.type == .leftArrow || press.type == .rightArrow {
            endHold()
        }
        super.pressesEnded(presses, with: event)
    }

    override func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        endHold()
        super.pressesCancelled(presses, with: event)
    }

    /// One card per discrete press, then the hold timers take over.
    private func beginHold(direction: Int) {
        holdStartTimer?.invalidate()
        holdRepeatTimer?.invalidate()
        holdDirection = direction
        move(by: direction)
        holdStartTimer = Timer.scheduledTimer(
            withTimeInterval: holdStartDelay, repeats: false
        ) { [weak self] _ in
            Task { @MainActor in
                guard let self, self.holdDirection != 0 else { return }
                self.stepFromTimer()
                self.holdRepeatTimer = Timer.scheduledTimer(
                    withTimeInterval: holdRepeatInterval, repeats: true
                ) { [weak self] _ in
                    Task { @MainActor in self?.stepFromTimer() }
                }
            }
        }
    }

    private func endHold() {
        holdStartTimer?.invalidate()
        holdStartTimer = nil
        holdRepeatTimer?.invalidate()
        holdRepeatTimer = nil
        watchdogTimer?.invalidate()
        watchdogTimer = nil
        holdDirection = 0
    }

    /// Timer driven movement. It must never refresh the watchdog.
    private func stepFromTimer() {
        guard holdDirection != 0, count > 1 else { return }
        move(by: holdDirection)
    }

    /// Refreshed by incoming presses only. Firing it ends the hold, which is
    /// what stops paging if a press end never lands.
    private func refreshWatchdog() {
        watchdogTimer?.invalidate()
        watchdogTimer = Timer.scheduledTimer(
            withTimeInterval: holdSafety, repeats: false
        ) { [weak self] _ in
            Task { @MainActor in self?.endHold() }
        }
    }

    private func resetInactivity() {
        inactivityTimer?.invalidate()
        guard !dismissed else { return }
        inactivityTimer = Timer.scheduledTimer(
            withTimeInterval: carouselInactivity, repeats: false
        ) { [weak self] _ in
            Task { @MainActor in self?.dismissCarousel() }
        }
    }
}
