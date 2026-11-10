import UIKit

/// The watch party the native player follows, as the host screen sends it.
/// Every word in it comes from the app, already translated.
struct WatchPartyState {
    struct Member {
        let name: String
        let initial: String
        let status: String
        let statusColor: UIColor
    }

    struct Face {
        let initial: String
        let ready: Bool
    }

    let title: String
    let subtitle: String
    let chat: Bool
    let reactions: Bool
    let members: [Member]
    let waitingTitle: String?
    let waitingDetail: String?
    let waitingFaces: [Face]
    let countdownTo: Date?
    let leaveLabel: String
    let endLabel: String?
    let strings: [String: String]
    let replies: [String]
    let reactionNames: [String: String]

    init(_ args: [String: Any]) {
        title = (args["title"] as? String) ?? ""
        subtitle = (args["subtitle"] as? String) ?? ""
        chat = (args["chat"] as? Bool) ?? false
        reactions = (args["reactions"] as? Bool) ?? false
        members = ((args["members"] as? [[String: Any]]) ?? []).map {
            Member(
                name: ($0["name"] as? String) ?? "",
                initial: ($0["initial"] as? String) ?? "?",
                status: ($0["status"] as? String) ?? "",
                statusColor: NativeApplePlayerViewController.color(
                    fromARGB: ($0["statusColor"] as? NSNumber)?.intValue ?? 0xFF8A8A8A))
        }
        waitingTitle = args["waitingTitle"] as? String
        waitingDetail = args["waitingDetail"] as? String
        waitingFaces = ((args["waitingFaces"] as? [[String: Any]]) ?? []).map {
            Face(initial: ($0["initial"] as? String) ?? "?", ready: ($0["ready"] as? Bool) ?? false)
        }
        countdownTo = (args["countdownTo"] as? NSNumber).map {
            Date(timeIntervalSince1970: $0.doubleValue / 1000)
        }
        leaveLabel = (args["leaveLabel"] as? String) ?? "Leave"
        endLabel = args["endLabel"] as? String
        strings = (args["strings"] as? [String: String]) ?? [:]
        replies = (args["replies"] as? [String]) ?? []
        reactionNames = (args["reactionNames"] as? [String: String]) ?? [:]
    }

    func string(_ key: String, _ fallback: String) -> String { strings[key] ?? fallback }
}

/// The six reactions, drawn by the app so they look the same everywhere.
enum WatchPartyGlyphs {
    static let kinds = ["love", "haha", "wow", "sad", "fire", "popcorn"]
    static var images: [String: UIImage] = [:]

    /// The app draws each one 128 pixels square, which shows at 48 points.
    static func store(_ glyphs: [String: Data]) {
        for (kind, data) in glyphs {
            if let image = UIImage(data: data, scale: 128.0 / 48.0) {
                images[kind] = image.withRenderingMode(.alwaysOriginal)
            }
        }
    }
}

extension UIPress {
    /// The remote button a press stands for. A keyboard on iPhone and iPad
    /// reports its arrows, Return, Space and Escape as keys.
    var remoteType: UIPress.PressType {
        #if os(iOS)
        switch key?.keyCode {
        case .keyboardUpArrow: return .upArrow
        case .keyboardDownArrow: return .downArrow
        case .keyboardLeftArrow: return .leftArrow
        case .keyboardRightArrow: return .rightArrow
        case .keyboardReturnOrEnter, .keypadEnter: return .select
        case .keyboardSpacebar: return .playPause
        case .keyboardEscape: return .menu
        default: break
        }
        #endif
        return type
    }
}

private func avatar(_ initial: String, side: CGFloat, accent: UIColor) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = initial
    label.textAlignment = .center
    label.font = .systemFont(ofSize: side * 0.45, weight: .semibold)
    label.textColor = .white
    label.backgroundColor = accent
    label.layer.cornerRadius = side / 2
    label.clipsToBounds = true
    NSLayoutConstraint.activate([
        label.widthAnchor.constraint(equalToConstant: side),
        label.heightAnchor.constraint(equalToConstant: side),
    ])
    return label
}

/// What a party puts over the video: toasts naming who did what, the last
/// few chat lines, rising reactions, the wait for everyone's player and the
/// 3, 2, 1. It never takes a touch or a press.
final class WatchPartyOverlayView: UIView {
    var accent = UIColor(red: 0.04, green: 0.52, blue: 1.0, alpha: 1)
    private let toastStack = UIStackView()
    private let chatStack = UIStackView()
    private let waitCard = UIView()
    private let waitFaces = UIStackView()
    private let waitTitle = UILabel()
    private let waitDetail = UILabel()
    private let countdownNumber = UILabel()
    private let countdownLabel = UILabel()
    private var chatBottom: NSLayoutConstraint?
    private var bottomInset: CGFloat = 0
    private var state: WatchPartyState?
    private var countdownTimer: Timer?
    private var risingCount = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false

        toastStack.translatesAutoresizingMaskIntoConstraints = false
        toastStack.axis = .vertical
        toastStack.alignment = .center
        toastStack.spacing = 12
        addSubview(toastStack)

        chatStack.translatesAutoresizingMaskIntoConstraints = false
        chatStack.axis = .vertical
        chatStack.alignment = .leading
        chatStack.spacing = 10
        addSubview(chatStack)

        waitCard.translatesAutoresizingMaskIntoConstraints = false
        waitCard.backgroundColor = UIColor(white: 0.06, alpha: 0.9)
        waitCard.layer.cornerRadius = 28
        waitCard.isHidden = true
        addSubview(waitCard)
        waitFaces.translatesAutoresizingMaskIntoConstraints = false
        waitFaces.axis = .horizontal
        waitFaces.spacing = 14
        waitTitle.translatesAutoresizingMaskIntoConstraints = false
        waitTitle.font = .systemFont(ofSize: 34, weight: .semibold)
        waitTitle.textColor = .white
        waitDetail.translatesAutoresizingMaskIntoConstraints = false
        waitDetail.font = .systemFont(ofSize: 26)
        waitDetail.textColor = UIColor(white: 1, alpha: 0.7)
        for v in [waitFaces, waitTitle, waitDetail] as [UIView] { waitCard.addSubview(v) }

        countdownNumber.translatesAutoresizingMaskIntoConstraints = false
        countdownNumber.font = .systemFont(ofSize: 220, weight: .heavy)
        countdownNumber.textColor = .white
        countdownNumber.isHidden = true
        countdownNumber.layer.shadowOpacity = 0.6
        countdownNumber.layer.shadowRadius = 24
        countdownNumber.layer.shadowOffset = .zero
        addSubview(countdownNumber)
        countdownLabel.translatesAutoresizingMaskIntoConstraints = false
        countdownLabel.font = .systemFont(ofSize: 34, weight: .medium)
        countdownLabel.textColor = .white
        countdownLabel.isHidden = true
        addSubview(countdownLabel)

        let chatBottom = chatStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
        self.chatBottom = chatBottom
        NSLayoutConstraint.activate([
            toastStack.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            toastStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            chatStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            chatStack.widthAnchor.constraint(lessThanOrEqualToConstant: 760),
            chatBottom,
            waitCard.centerXAnchor.constraint(equalTo: centerXAnchor),
            waitCard.centerYAnchor.constraint(equalTo: centerYAnchor),
            waitFaces.topAnchor.constraint(equalTo: waitCard.topAnchor, constant: 40),
            waitFaces.centerXAnchor.constraint(equalTo: waitCard.centerXAnchor),
            waitTitle.topAnchor.constraint(equalTo: waitFaces.bottomAnchor, constant: 28),
            waitTitle.centerXAnchor.constraint(equalTo: waitCard.centerXAnchor),
            waitTitle.leadingAnchor.constraint(greaterThanOrEqualTo: waitCard.leadingAnchor, constant: 48),
            waitDetail.topAnchor.constraint(equalTo: waitTitle.bottomAnchor, constant: 8),
            waitDetail.centerXAnchor.constraint(equalTo: waitCard.centerXAnchor),
            waitDetail.leadingAnchor.constraint(greaterThanOrEqualTo: waitCard.leadingAnchor, constant: 48),
            waitDetail.bottomAnchor.constraint(equalTo: waitCard.bottomAnchor, constant: -40),
            countdownNumber.centerXAnchor.constraint(equalTo: centerXAnchor),
            countdownNumber.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30),
            countdownLabel.topAnchor.constraint(equalTo: countdownNumber.bottomAnchor),
            countdownLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    deinit { countdownTimer?.invalidate() }

    /// Keeps the chat lines and reactions clear of the controls while they show.
    func setBottomInset(_ inset: CGFloat) {
        guard inset != bottomInset else { return }
        bottomInset = inset
        chatBottom?.constant = -60 - inset
        UIView.animate(withDuration: 0.2) { self.layoutIfNeeded() }
    }

    func apply(_ state: WatchPartyState?) {
        self.state = state
        if state == nil {
            for v in toastStack.arrangedSubviews + chatStack.arrangedSubviews { v.removeFromSuperview() }
        }
        renderWait()
        renderCountdown()
    }

    private func renderWait() {
        guard let state, let title = state.waitingTitle, state.countdownTo == nil else {
            waitCard.isHidden = true
            return
        }
        waitCard.isHidden = false
        waitTitle.text = title
        waitDetail.text = state.waitingDetail
        waitFaces.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for face in state.waitingFaces {
            let a = avatar(face.initial, side: 72, accent: accent)
            a.alpha = face.ready ? 1 : 0.4
            waitFaces.addArrangedSubview(a)
        }
    }

    private func renderCountdown() {
        guard let to = state?.countdownTo, to.timeIntervalSinceNow > 0 else {
            countdownTimer?.invalidate()
            countdownTimer = nil
            countdownNumber.isHidden = true
            countdownLabel.isHidden = true
            return
        }
        countdownLabel.text = state?.string("startingTogether", "Starting together")
        countdownNumber.isHidden = false
        countdownLabel.isHidden = false
        countdownNumber.text = "\(min(3, max(1, Int(ceil(to.timeIntervalSinceNow)))))"
        guard countdownTimer == nil else { return }
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            Task { @MainActor in self?.renderCountdown() }
        }
    }

    func showToast(text: String, icon: String) {
        let pill = UIView()
        pill.backgroundColor = UIColor(white: 0.1, alpha: 0.9)
        pill.layer.cornerRadius = 32
        pill.layer.borderWidth = 1
        pill.layer.borderColor = UIColor(white: 1, alpha: 0.1).cgColor
        let badge = UIView()
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.backgroundColor = accent.withAlphaComponent(0.25)
        badge.layer.cornerRadius = 22
        let symbol = UIImageView(image: UIImage(systemName: Self.toastSymbol(icon)))
        symbol.translatesAutoresizingMaskIntoConstraints = false
        symbol.tintColor = accent
        symbol.contentMode = .scaleAspectFit
        badge.addSubview(symbol)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = .systemFont(ofSize: 26, weight: .medium)
        label.textColor = .white
        pill.addSubview(badge)
        pill.addSubview(label)
        NSLayoutConstraint.activate([
            badge.leadingAnchor.constraint(equalTo: pill.leadingAnchor, constant: 10),
            badge.centerYAnchor.constraint(equalTo: pill.centerYAnchor),
            badge.widthAnchor.constraint(equalToConstant: 44),
            badge.heightAnchor.constraint(equalToConstant: 44),
            symbol.centerXAnchor.constraint(equalTo: badge.centerXAnchor),
            symbol.centerYAnchor.constraint(equalTo: badge.centerYAnchor),
            symbol.widthAnchor.constraint(equalToConstant: 26),
            symbol.heightAnchor.constraint(equalToConstant: 26),
            label.leadingAnchor.constraint(equalTo: badge.trailingAnchor, constant: 14),
            label.trailingAnchor.constraint(equalTo: pill.trailingAnchor, constant: -26),
            label.topAnchor.constraint(equalTo: pill.topAnchor, constant: 14),
            label.bottomAnchor.constraint(equalTo: pill.bottomAnchor, constant: -14),
        ])
        toastStack.insertArrangedSubview(pill, at: 0)
        while toastStack.arrangedSubviews.count > 3 {
            toastStack.arrangedSubviews.last?.removeFromSuperview()
        }
        fadeOut(pill, after: 3.5)
    }

    func showChat(name: String, text: String) {
        let bubble = UIView()
        bubble.backgroundColor = UIColor(white: 0.07, alpha: 0.8)
        bubble.layer.cornerRadius = 18
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        let font = UIFont.systemFont(ofSize: 26)
        if name.isEmpty {
            // A notice, such as who joined, rather than something said.
            label.attributedText = NSAttributedString(
                string: text,
                attributes: [.font: font, .foregroundColor: UIColor(white: 1, alpha: 0.7)])
        } else {
            let line = NSMutableAttributedString(
                string: "\(name)  ",
                attributes: [.font: UIFont.systemFont(ofSize: 26, weight: .bold), .foregroundColor: accent])
            line.append(
                NSAttributedString(string: text, attributes: [.font: font, .foregroundColor: UIColor.white]))
            label.attributedText = line
        }
        bubble.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: bubble.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: bubble.trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: bubble.topAnchor, constant: 12),
            label.bottomAnchor.constraint(equalTo: bubble.bottomAnchor, constant: -12),
        ])
        chatStack.addArrangedSubview(bubble)
        while chatStack.arrangedSubviews.count > 3 {
            chatStack.arrangedSubviews.first?.removeFromSuperview()
        }
        fadeOut(bubble, after: 6)
    }

    func showReaction(kind: String, name: String) {
        guard risingCount < 12 else { return }
        risingCount += 1
        let glyph = UIImageView(image: WatchPartyGlyphs.images[kind])
        glyph.contentMode = .scaleAspectFit
        glyph.frame = CGRect(x: 0, y: 0, width: 72, height: 72)
        let label = UILabel()
        label.text = name
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.shadowOpacity = 0.8
        label.layer.shadowRadius = 4
        label.layer.shadowOffset = .zero
        label.frame = CGRect(x: -40, y: 74, width: 152, height: 26)
        let rising = UIView(frame: CGRect(x: 0, y: 0, width: 72, height: 100))
        rising.addSubview(glyph)
        rising.addSubview(label)
        let x = bounds.width - 140 - CGFloat.random(in: 0...90)
        let startY = bounds.height - bottomInset - 180
        // Stops short of the top bar on a short screen.
        let rise = min(400, startY - 160)
        rising.center = CGPoint(x: x, y: startY)
        addSubview(rising)
        UIView.animateKeyframes(withDuration: 2.4, delay: 0, options: [.calculationModeCubic]) {
            for step in 1...4 {
                let t = Double(step) / 4
                UIView.addKeyframe(withRelativeStartTime: t - 0.25, relativeDuration: 0.25) {
                    rising.center = CGPoint(
                        x: x + CGFloat(sin(t * .pi * 2)) * 16, y: startY - CGFloat(t) * rise)
                    rising.alpha = CGFloat(1 - t)
                }
            }
        } completion: { [weak self] _ in
            rising.removeFromSuperview()
            self?.risingCount -= 1
        }
    }

    private func fadeOut(_ view: UIView, after delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            UIView.animate(withDuration: 0.3) {
                view.alpha = 0
            } completion: { _ in
                view.removeFromSuperview()
            }
        }
    }

    private static func toastSymbol(_ kind: String) -> String {
        switch kind {
        case "paused": return "pause.fill"
        case "resumed": return "play.fill"
        case "skipped": return "forward.fill"
        case "joined": return "person.badge.plus"
        case "left": return "person.badge.minus"
        case "youAreHost", "newHost": return "crown.fill"
        case "policyChanged": return "person.3.fill"
        case "switched": return "film"
        case "noAccess": return "nosign"
        case "reconnecting": return "wifi"
        case "reconnected": return "checkmark"
        case "ended": return "xmark"
        case "hostOnly": return "lock.fill"
        default: return "person.2.fill"
        }
    }
}

/// A button in the party panel, with a ring that shows where the remote,
/// keyboard or game pad is.
private final class PartyPanelButton: UIButton {
    var accent = UIColor.white
    var showsFocus = false {
        didSet { applyStyle() }
    }
    private var tvFocused = false

    func applyStyle() {
        let on = showsFocus || tvFocused
        layer.borderColor = (on ? accent : UIColor(white: 1, alpha: 0.2)).cgColor
        layer.borderWidth = on ? 4 : 1.5
        backgroundColor = on ? UIColor(white: 1, alpha: 0.14) : .clear
        transform = on ? CGAffineTransform(scaleX: 1.06, y: 1.06) : .identity
    }

    #if os(tvOS)
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        tvFocused = isFocused
        coordinator.addCoordinatedAnimations { self.applyStyle() }
    }
    #endif
}

/// The party panel: reactions, quick replies and Type, the people with how
/// each one is doing, and Leave. Every button lines up in rows, so Up and Down
/// step through them in reading order on any D-pad.
final class WatchPartyPanelViewController: UIViewController, RemotePlayerNavigable {
    private var state: WatchPartyState
    private let accent: UIColor
    private let surface: UIColor
    private let onAction: ([String: Any]) -> Void
    private let onClosed: () -> Void
    private let scroll = UIScrollView()
    private let stack = UIStackView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let people = UIStackView()
    private var rows: [[PartyPanelButton]] = []
    private var leaveButton: PartyPanelButton?
    private var focused: PartyPanelButton?
    /// A touch screen shows no ring until a key is pressed.
    private var showsFocus: Bool

    init(
        state: WatchPartyState, accent: UIColor, surface: UIColor, showsFocus: Bool,
        onAction: @escaping ([String: Any]) -> Void, onClosed: @escaping () -> Void
    ) {
        self.state = state
        self.accent = accent
        self.surface = surface
        self.showsFocus = showsFocus
        self.onAction = onAction
        self.onClosed = onClosed
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.55)

        let panel = UIView()
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.backgroundColor = surface
        panel.layer.cornerRadius = 28
        panel.clipsToBounds = true
        view.addSubview(panel)

        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        panel.addSubview(scroll)

        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 22
        scroll.addSubview(stack)

        let height = panel.heightAnchor.constraint(equalTo: stack.heightAnchor, constant: 96)
        height.priority = .defaultHigh
        NSLayoutConstraint.activate([
            panel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            panel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            panel.widthAnchor.constraint(equalToConstant: 1120),
            panel.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, constant: -60),
            height,
            scroll.topAnchor.constraint(equalTo: panel.topAnchor),
            scroll.bottomAnchor.constraint(equalTo: panel.bottomAnchor),
            scroll.leadingAnchor.constraint(equalTo: panel.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: panel.trailingAnchor),
            stack.topAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor, constant: 48),
            stack.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.bottomAnchor, constant: -48),
            stack.leadingAnchor.constraint(equalTo: scroll.contentLayoutGuide.leadingAnchor, constant: 56),
            stack.widthAnchor.constraint(equalTo: scroll.frameLayoutGuide.widthAnchor, constant: -112),
        ])
        build()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        #if os(iOS)
        becomeFirstResponder()
        #endif
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isBeingDismissed || parent?.isBeingDismissed == true { onClosed() }
    }

    #if os(iOS)
    override var canBecomeFirstResponder: Bool { true }
    #endif

    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        focused.map { [$0] } ?? rows.first?.first.map { [$0] } ?? super.preferredFocusEnvironments
    }

    /// A new room snapshot. The buttons stay where they are unless the room
    /// turned chat or reactions on or off, so the ring doesn't jump.
    func apply(_ newState: WatchPartyState) {
        let sameButtons =
            newState.chat == state.chat && newState.reactions == state.reactions
            && (newState.endLabel == nil) == (state.endLabel == nil)
            && newState.replies == state.replies
        state = newState
        guard isViewLoaded else { return }
        guard sameButtons else {
            let at = position(of: focused)
            build()
            if let at {
                let row = min(at.row, rows.count - 1)
                if row >= 0 { focus(rows[row][min(at.col, rows[row].count - 1)]) }
            }
            return
        }
        titleLabel.text = state.title
        subtitleLabel.text = state.subtitle
        leaveButton?.configuration?.title = state.leaveLabel
        renderPeople()
    }

    private func build() {
        stack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        rows = []
        focused = nil

        titleLabel.text = state.title
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textColor = .white
        subtitleLabel.text = state.subtitle
        subtitleLabel.font = .systemFont(ofSize: 26)
        subtitleLabel.textColor = UIColor(white: 1, alpha: 0.6)
        let heading = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        heading.axis = .vertical
        heading.spacing = 4
        stack.addArrangedSubview(heading)

        if state.reactions {
            let buttons = WatchPartyGlyphs.kinds.map { kind -> PartyPanelButton in
                let button = makeButton(image: WatchPartyGlyphs.images[kind]) { [weak self] in
                    self?.onAction(["event": "partyReaction", "kind": kind])
                }
                button.accessibilityLabel = state.reactionNames[kind]
                return button
            }
            addRow(buttons)
        }
        if state.chat {
            addRow(state.replies.map { reply in
                makeButton(title: reply) { [weak self] in
                    self?.onAction(["event": "partyChat", "text": reply])
                }
            })
            let type = makeButton(
                title: state.string("type", "Type"), image: UIImage(systemName: "keyboard")
            ) { [weak self] in
                self?.askMessage()
            }
            addRow([type])
        }
        let hint = UILabel()
        hint.text = state.string("backToClose", "Back to close")
        hint.font = .systemFont(ofSize: 24)
        hint.textColor = UIColor(white: 1, alpha: 0.55)
        stack.addArrangedSubview(hint)

        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(white: 1, alpha: 0.15)
        stack.addArrangedSubview(divider)
        NSLayoutConstraint.activate([
            divider.heightAnchor.constraint(equalToConstant: 2),
            divider.widthAnchor.constraint(equalTo: stack.widthAnchor),
        ])

        people.axis = .vertical
        people.spacing = 18
        stack.addArrangedSubview(people)
        renderPeople()

        let leave = makeButton(
            title: state.leaveLabel, image: UIImage(systemName: "rectangle.portrait.and.arrow.right")
        ) { [weak self] in
            self?.close(then: ["event": "partyLeave"])
        }
        leaveButton = leave
        var exits = [leave]
        if let end = state.endLabel {
            let endButton = makeButton(title: end) { [weak self] in
                self?.close(then: ["event": "partyEnd"])
            }
            endButton.configuration?.baseForegroundColor = UIColor(red: 0.95, green: 0.35, blue: 0.35, alpha: 1)
            exits.append(endButton)
        }
        addRow(exits)

        if let first = rows.first?.first { focus(first) }
    }

    private func renderPeople() {
        people.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for member in state.members {
            let name = UILabel()
            name.text = member.name
            name.font = .systemFont(ofSize: 28, weight: .semibold)
            name.textColor = .white
            let dot = UIView()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.backgroundColor = member.statusColor
            dot.layer.cornerRadius = 7
            let status = UILabel()
            status.text = member.status
            status.font = .systemFont(ofSize: 24)
            status.textColor = UIColor(white: 1, alpha: 0.65)
            let statusRow = UIStackView(arrangedSubviews: [dot, status])
            statusRow.spacing = 10
            statusRow.alignment = .center
            dot.isHidden = member.status.isEmpty
            NSLayoutConstraint.activate([
                dot.widthAnchor.constraint(equalToConstant: 14),
                dot.heightAnchor.constraint(equalToConstant: 14),
            ])
            let text = UIStackView(arrangedSubviews: [name, statusRow])
            text.axis = .vertical
            text.spacing = 4
            let row = UIStackView(arrangedSubviews: [avatar(member.initial, side: 64, accent: accent), text])
            row.spacing = 20
            row.alignment = .center
            people.addArrangedSubview(row)
        }
    }

    private func addRow(_ buttons: [PartyPanelButton]) {
        guard !buttons.isEmpty else { return }
        let row = UIStackView(arrangedSubviews: buttons)
        row.spacing = 16
        stack.addArrangedSubview(row)
        rows.append(buttons)
    }

    private func makeButton(
        title: String? = nil, image: UIImage? = nil, action: @escaping () -> Void
    ) -> PartyPanelButton {
        var config = UIButton.Configuration.plain()
        config.title = title
        config.image = image
        config.imagePadding = 12
        config.baseForegroundColor = .white
        config.contentInsets = title == nil
            ? NSDirectionalEdgeInsets(top: 14, leading: 40, bottom: 14, trailing: 40)
            : NSDirectionalEdgeInsets(top: 18, leading: 34, bottom: 18, trailing: 34)
        config.titleLineBreakMode = .byTruncatingTail
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
            var attributes = $0
            attributes.font = .systemFont(ofSize: 28, weight: .semibold)
            return attributes
        }
        // A custom button has no system focus look, so the ring is the only one.
        let button = PartyPanelButton(type: .custom)
        button.configuration = config
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        button.accent = accent
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.applyStyle()
        button.addAction(UIAction { _ in action() }, for: .primaryActionTriggered)
        return button
    }

    private func position(of button: PartyPanelButton?) -> (row: Int, col: Int)? {
        guard let button else { return nil }
        for (r, row) in rows.enumerated() {
            if let c = row.firstIndex(of: button) { return (r, c) }
        }
        return nil
    }

    private func focus(_ button: PartyPanelButton) {
        focused?.showsFocus = false
        focused = button
        #if os(tvOS)
        let system = UIFocusSystem.focusSystem(for: view)
        system?.requestFocusUpdate(to: button)
        system?.updateFocusIfNeeded()
        #else
        button.showsFocus = showsFocus
        #endif
        view.layoutIfNeeded()
        scroll.scrollRectToVisible(button.convert(button.bounds, to: scroll).insetBy(dx: 0, dy: -40), animated: true)
    }

    private func currentlyFocused() -> PartyPanelButton? {
        #if os(tvOS)
        if let item = UIFocusSystem.focusSystem(for: view)?.focusedItem as? PartyPanelButton {
            focused = item
        }
        #endif
        return focused
    }

    /// Left and Right move along a row. Up and Down go to the row above or
    /// below, to the button nearest across from this one.
    private func move(_ type: UIPress.PressType) {
        guard let current = currentlyFocused(), let at = position(of: current) else {
            if let first = rows.first?.first { focus(first) }
            return
        }
        switch type {
        case .leftArrow where at.col > 0:
            focus(rows[at.row][at.col - 1])
        case .rightArrow where at.col < rows[at.row].count - 1:
            focus(rows[at.row][at.col + 1])
        case .upArrow where at.row > 0, .downArrow where at.row < rows.count - 1:
            let target = rows[at.row + (type == .upArrow ? -1 : 1)]
            let x = current.convert(current.bounds, to: view).midX
            let nearest = target.min {
                abs($0.convert($0.bounds, to: view).midX - x) < abs($1.convert($1.bounds, to: view).midX - x)
            }
            if let nearest { focus(nearest) }
        default:
            break
        }
    }

    private func activate() {
        currentlyFocused()?.sendActions(for: .primaryActionTriggered)
    }

    private func close(then action: [String: Any]? = nil) {
        dismissPanel {
            if let action { self.onAction(action) }
        }
    }

    private func dismissPanel(completion: (() -> Void)? = nil) {
        // On iPhone and iPad the panel sits inside the scaling host, which is
        // what was presented.
        (parent ?? self).dismiss(animated: true, completion: completion)
    }

    private func askMessage() {
        let alert = UIAlertController(
            title: state.string("chatTitle", "Chat"), message: nil, preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = self.state.string("sendToParty", "Send to the party")
            field.returnKeyType = .send
        }
        alert.addAction(
            UIAlertAction(title: state.string("cancel", "Cancel"), style: .cancel) { [weak self] _ in
                self?.reclaimKeys()
            })
        let send = UIAlertAction(title: state.string("send", "Send"), style: .default) { [weak self, weak alert] _ in
            let text = alert?.textFields?.first?.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            if !text.isEmpty { self?.onAction(["event": "partyChat", "text": String(text.prefix(500))]) }
            self?.reclaimKeys()
        }
        alert.addAction(send)
        alert.preferredAction = send
        present(alert, animated: true)
    }

    private func reclaimKeys() {
        #if os(iOS)
        DispatchQueue.main.async { self.becomeFirstResponder() }
        #endif
    }

    func handleRemoteNavigation(_ command: String) {
        switch command {
        case "back": dismissPanel()
        case "select": activate()
        case "moveup": move(.upArrow)
        case "movedown": move(.downArrow)
        case "moveleft": move(.leftArrow)
        case "moveright": move(.rightArrow)
        default: break
        }
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses {
            let type = press.remoteType
            if type == .menu {
                dismissPanel()
                return
            }
            #if os(iOS)
            // The focus engine moves the Siri Remote's ring itself. A keyboard
            // on iPhone and iPad has no focus engine behind it.
            switch type {
            case .upArrow, .downArrow, .leftArrow, .rightArrow:
                if !showsFocus {
                    showsFocus = true
                    if let focused { focus(focused) }
                } else {
                    move(type)
                }
                return
            case .select:
                if showsFocus { activate() }
                return
            default:
                break
            }
            #endif
        }
        super.pressesBegan(presses, with: event)
    }
}
