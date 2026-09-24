import UIKit

// Every measurement in this file is the Flutter carousel's value doubled,
// which is the scale the native player is drawn at.

enum CarouselIndex {
    /// Maps a position in the strip onto a real channel, wrapping both ways.
    static func channelIndex(for position: Int, count: Int) -> Int {
        guard count > 0 else { return 0 }
        return ((position % count) + count) % count
    }
}

/// One channel's already resolved presentation data. The strip does no
/// fetching and no formatting: the host precomputes every field.
struct ChannelCarouselEntry {
    let channelId: String
    let channelNumber: String
    let channelName: String
    let logoUrl: String
    let isFavorite: Bool
    let programTitle: String
    let episodeTitle: String
    let overview: String
    /// Broadcast window, already localized by the host.
    let timeLabel: String
    let rating: String
    let tags: [String]
    let genreColor: UIColor?
    let isLive: Bool
    let progress: Double
    let hasTimer: Bool
    let seasonEpisode: String

    /// No program yet because the channel's schedule is still unfetched, as
    /// opposed to one whose schedule is loaded and simply has no entry.
    let programLoading: Bool

    init(dictionary entry: [String: Any], accent: UIColor) {
        channelId = (entry["id"] as? String) ?? ""
        channelNumber = (entry["number"] as? String) ?? ""
        channelName = (entry["name"] as? String) ?? ""
        logoUrl = (entry["logoUrl"] as? String) ?? ""
        isFavorite = (entry["isFavorite"] as? Bool) ?? false
        programTitle = (entry["programName"] as? String) ?? ""
        episodeTitle = (entry["episodeTitle"] as? String) ?? ""
        overview = (entry["overview"] as? String) ?? ""
        timeLabel = (entry["timeLabel"] as? String) ?? ""
        rating = (entry["rating"] as? String) ?? ""
        tags = (entry["tags"] as? [String]) ?? []
        seasonEpisode = (entry["seasonEpisode"] as? String) ?? ""
        isLive = (entry["isLive"] as? Bool) ?? false
        progress = (entry["progress"] as? NSNumber)?.doubleValue ?? 0
        hasTimer = (entry["hasTimer"] as? Bool) ?? false
        programLoading = (entry["programLoading"] as? Bool) ?? false
        genreColor = ChannelCarouselEntry.color(
            forGenre: (entry["genre"] as? String) ?? "", accent: accent)
    }

    /// The same five genre accents the guide cells use. A program with no
    /// genre falls back to the theme accent.
    private static func color(forGenre genre: String, accent: UIColor) -> UIColor? {
        switch genre {
        case "movie": return UIColor(red: 0.42, green: 0.29, blue: 0.85, alpha: 1)
        case "series": return UIColor(red: 0.18, green: 0.49, blue: 0.54, alpha: 1)
        case "sports": return UIColor(red: 0.18, green: 0.55, blue: 0.34, alpha: 1)
        case "news": return UIColor(red: 0.75, green: 0.54, blue: 0.18, alpha: 1)
        case "kids": return UIColor(red: 0.75, green: 0.29, blue: 0.48, alpha: 1)
        case "none": return accent
        default: return nil
        }
    }
}

/// Strip geometry for an available width. The strip is center locked, so the
/// pitch is the width over a whole card count, which leaves exactly one gutter
/// of slack and so never clips a card at either edge.
enum ChannelCarouselMetrics {
    static let cardWidth: CGFloat = 400
    static let cardHeight: CGFloat = 216
    static let cardSpacing: CGFloat = 20
    private static let minCardWidth: CGFloat = 300
    private static let maxCardWidth: CGFloat = 560
    private static let minLegibleWidth: CGFloat = 192
    private static let maxCardCount = 15

    static func layout(forStripWidth stripWidth: CGFloat)
        -> (pitch: CGFloat, width: CGFloat, count: Int)
    {
        let fallback = (pitch: cardWidth + cardSpacing, width: cardWidth, count: 1)
        guard stripWidth.isFinite, stripWidth > 0 else { return fallback }

        func pitch(_ count: Int) -> CGFloat {
            (stripWidth / CGFloat(count) * 2).rounded(.down) / 2
        }
        func width(_ count: Int) -> CGFloat { pitch(count) - cardSpacing }

        var best = 0
        var bestDistance = CGFloat.infinity
        var widest = 0
        for count in 1...maxCardCount {
            let candidate = width(count)
            if candidate < minLegibleWidth { break }
            widest = count
            if candidate < minCardWidth || candidate > maxCardWidth { continue }
            let distance = abs(candidate - cardWidth)
            if distance < bestDistance {
                bestDistance = distance
                best = count
            }
        }
        // Nothing landed in the comfortable band, so take as many still
        // legible cards as the strip allows rather than one enormous one.
        let count = best != 0 ? best : max(1, widest)
        return (pitch: pitch(count), width: width(count), count: count)
    }
}

/// Theme colors the overlay draws with, handed down from the player so the
/// carousel follows whatever Dart last sent.
struct ChannelCarouselTheme {
    let accent: UIColor
    let surface: UIColor
    let surfaceVariant: UIColor
    let onSurface: UIColor
    let rangeTrack: UIColor
    let rangeProgress: UIColor
    let isGlass: Bool
}

/// One channel in the strip. Pure presentation: the host owns scrolling,
/// selection, and data.
final class ChannelCarouselCardView: UIView {
    private let body = UIView()
    private let genreBar = UIView()
    private let favoriteIcon = UIImageView()
    private let numberLabel = UILabel()
    private let nameLabel = UILabel()
    private let timerDot = UIView()
    private let logoView = UIImageView()
    private let titleLabel = UILabel()
    private let metaLabel = UILabel()
    private let progressTrack = UIView()
    private let progressFill = UIView()
    private let placeholderTop = UIView()
    private let placeholderBottom = UIView()

    private var theme: ChannelCarouselTheme
    private var entry: ChannelCarouselEntry?
    private var centered = false
    private var logoUrl = ""

    private static let radius: CGFloat = 20
    private static let genreBarWidth: CGFloat = 8
    private static let contentPadding = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 16)
    private static let headerGap: CGFloat = 12
    private static let statusGap: CGFloat = 6
    private static let logoHeight: CGFloat = 60
    private static let logoMaxWidth: CGFloat = 88
    private static let progressHeight: CGFloat = 8
    private static let progressInset: CGFloat = 16
    private static let metaSeparator = " · "

    init(theme: ChannelCarouselTheme) {
        self.theme = theme
        super.init(frame: .zero)
        clipsToBounds = false
        body.layer.cornerRadius = Self.radius
        body.clipsToBounds = true
        addSubview(body)

        body.addSubview(genreBar)

        favoriteIcon.image = UIImage(
            systemName: "heart.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: .semibold))
        favoriteIcon.tintColor = UIColor(red: 0.94, green: 0.27, blue: 0.27, alpha: 1)
        favoriteIcon.contentMode = .scaleAspectFit
        body.addSubview(favoriteIcon)

        numberLabel.font = .systemFont(ofSize: 44, weight: .bold)
        body.addSubview(numberLabel)

        nameLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        body.addSubview(nameLabel)

        timerDot.backgroundColor = UIColor(red: 0.88, green: 0.41, blue: 0.36, alpha: 1)
        timerDot.layer.cornerRadius = 10
        body.addSubview(timerDot)

        logoView.contentMode = .scaleAspectFit
        body.addSubview(logoView)

        titleLabel.font = .systemFont(ofSize: 32, weight: .regular)
        titleLabel.numberOfLines = 2
        body.addSubview(titleLabel)

        metaLabel.font = .systemFont(ofSize: 28, weight: .regular)
        metaLabel.numberOfLines = 1
        metaLabel.lineBreakMode = .byClipping
        body.addSubview(metaLabel)

        for bar in [placeholderTop, placeholderBottom] {
            bar.layer.cornerRadius = 6
            bar.isHidden = true
            body.addSubview(bar)
        }

        progressTrack.layer.cornerRadius = Self.progressHeight / 2
        progressTrack.clipsToBounds = true
        body.addSubview(progressTrack)
        progressFill.layer.cornerRadius = Self.progressHeight / 2
        progressTrack.addSubview(progressFill)

        applyTheme(theme)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func applyTheme(_ theme: ChannelCarouselTheme) {
        self.theme = theme
        numberLabel.textColor = theme.onSurface
        nameLabel.textColor = theme.onSurface
        titleLabel.textColor = theme.onSurface
        metaLabel.textColor = theme.onSurface.withAlphaComponent(0.6)
        progressTrack.backgroundColor = theme.rangeTrack
        progressFill.backgroundColor = theme.rangeProgress
        let placeholder = theme.onSurface.withAlphaComponent(0.12)
        placeholderTop.backgroundColor = placeholder
        placeholderBottom.backgroundColor = placeholder
        if let entry { configure(entry, centered: centered) }
    }

    func configure(_ entry: ChannelCarouselEntry, centered: Bool) {
        self.entry = entry
        self.centered = centered

        let genre = entry.genreColor ?? theme.surfaceVariant
        // A hint of the program's genre over a dark base, so the card carries
        // a little color without competing with its own text.
        body.backgroundColor = theme.surface
            .blended(with: genre, alpha: centered ? 0.22 : 0.14)
            .withAlphaComponent(centered ? 0.88 : 0.74)
        genreBar.backgroundColor = entry.genreColor ?? theme.accent

        if centered {
            body.layer.borderWidth = 4
            body.layer.borderColor = theme.accent.cgColor
            layer.shadowColor = theme.accent.cgColor
            layer.shadowOpacity = theme.isGlass ? 0.45 : 0
            layer.shadowRadius = 24
            layer.shadowOffset = .zero
        } else {
            body.layer.borderWidth = theme.isGlass ? 2 : 0
            body.layer.borderColor = UIColor(white: 1, alpha: 0.16).cgColor
            layer.shadowOpacity = 0
        }

        favoriteIcon.isHidden = !entry.isFavorite
        numberLabel.text = entry.channelNumber
        numberLabel.isHidden = entry.channelNumber.isEmpty
        nameLabel.text = entry.channelName
        timerDot.isHidden = !entry.hasTimer

        titleLabel.text = entry.programTitle
        titleLabel.isHidden = entry.programTitle.isEmpty
        let showPlaceholder = entry.programTitle.isEmpty && entry.programLoading
        placeholderTop.isHidden = !showPlaceholder
        placeholderBottom.isHidden = !showPlaceholder

        progressTrack.isHidden = !entry.isLive

        loadLogo(entry.logoUrl)
        setNeedsLayout()
    }

    private func loadLogo(_ url: String) {
        guard logoUrl != url else { return }
        logoUrl = url
        logoView.image = nil
        logoView.isHidden = url.isEmpty
        guard let parsed = URL(string: url) else { return }
        URLSession.shared.dataTask(with: parsed) { [weak self] data, _, _ in
            let image = data.flatMap { UIImage(data: $0) }
            DispatchQueue.main.async {
                guard let self, self.logoUrl == url else { return }
                self.logoView.image = image
            }
        }.resume()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        body.frame = bounds
        let padding = Self.contentPadding
        let content = bounds.inset(by: padding)
        genreBar.frame = CGRect(x: 0, y: 0, width: Self.genreBarWidth, height: bounds.height)

        // Header: the heart sits with the number it belongs to, the name takes
        // the slack, and the logo owns the right edge.
        let headerHeight = max(Self.logoHeight, numberLabel.font.lineHeight.rounded(.up))
        var x = content.minX
        if !favoriteIcon.isHidden {
            favoriteIcon.frame = CGRect(
                x: x, y: content.minY + (headerHeight - 26) / 2, width: 26, height: 26)
            x += 26 + 8
        }
        if !numberLabel.isHidden {
            let width = min(numberLabel.intrinsicContentSize.width, content.width * 0.5)
            numberLabel.frame = CGRect(
                x: x, y: content.minY, width: width, height: headerHeight)
            x += width + 12
        }

        var rightEdge = content.maxX
        if !logoView.isHidden {
            logoView.frame = CGRect(
                x: rightEdge - Self.logoMaxWidth, y: content.minY,
                width: Self.logoMaxWidth, height: Self.logoHeight)
            rightEdge -= Self.logoMaxWidth + 16
        }
        if !timerDot.isHidden {
            timerDot.frame = CGRect(
                x: rightEdge - 20, y: content.minY + (headerHeight - 20) / 2,
                width: 20, height: 20)
            rightEdge -= 20 + Self.statusGap
        }
        nameLabel.frame = CGRect(
            x: x, y: content.minY, width: max(0, rightEdge - x), height: headerHeight)

        let belowY = content.minY + headerHeight + Self.headerGap
        let belowHeight = content.maxY - belowY
        let titleLine = titleLabel.font.lineHeight.rounded(.up)
        let metaLine = metaLabel.font.lineHeight.rounded(.up)
        metaLabel.text = fittingMeta(width: content.width)
        let showMeta = !(metaLabel.text ?? "").isEmpty && belowHeight >= titleLine + metaLine
        metaLabel.isHidden = !showMeta
        let wrapTitle = belowHeight >= 2 * titleLine + (showMeta ? metaLine : 0)
        titleLabel.numberOfLines = wrapTitle ? 2 : 1
        let titleHeight = titleLine * CGFloat(wrapTitle ? 2 : 1)
        titleLabel.frame = CGRect(
            x: content.minX, y: belowY, width: content.width, height: titleHeight)
        if showMeta {
            metaLabel.frame = CGRect(
                x: content.minX, y: belowY + titleHeight,
                width: content.width, height: metaLine)
        }

        placeholderTop.frame = CGRect(
            x: content.minX, y: belowY, width: content.width, height: 20)
        placeholderBottom.frame = CGRect(
            x: content.minX, y: belowY + 32, width: content.width * 0.5, height: 16)

        // Progress reads as a seekbar, not as card structure: inset from the
        // genre bar and from both card edges so it never looks like a border.
        let trackX = Self.genreBarWidth + Self.progressInset
        progressTrack.frame = CGRect(
            x: trackX,
            y: bounds.height - Self.progressInset - Self.progressHeight,
            width: max(0, bounds.width - trackX - Self.progressInset),
            height: Self.progressHeight)
        progressFill.frame = CGRect(
            x: 0, y: 0,
            width: progressTrack.bounds.width
                * CGFloat(min(1, max(0, entry?.progress ?? 0))),
            height: Self.progressHeight)

        if layer.shadowOpacity > 0 {
            layer.shadowPath = UIBezierPath(
                roundedRect: bounds, cornerRadius: Self.radius).cgPath
        }
    }

    /// Metadata that fits the given width. Time, then rating, then tags,
    /// dropping from the end once the line is full.
    private func fittingMeta(width: CGFloat) -> String {
        guard let entry else { return "" }
        let items = ([entry.timeLabel, entry.rating] + entry.tags)
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
        guard !items.isEmpty else { return "" }
        let attributes: [NSAttributedString.Key: Any] = [.font: metaLabel.font as Any]
        var fitted: [String] = []
        var used: CGFloat = 0
        for item in items {
            let piece = fitted.isEmpty ? item : Self.metaSeparator + item
            let pieceWidth = (piece as NSString).size(withAttributes: attributes).width
            if used + pieceWidth > width { break }
            used += pieceWidth
            fitted.append(item)
        }
        return fitted.joined(separator: Self.metaSeparator)
    }
}

extension UIColor {
    /// Composites `other` at `alpha` over the receiver.
    func blended(with other: UIColor, alpha: CGFloat) -> UIColor {
        var br: CGFloat = 0, bg: CGFloat = 0, bb: CGFloat = 0, ba: CGFloat = 0
        var fr: CGFloat = 0, fg: CGFloat = 0, fb: CGFloat = 0, fa: CGFloat = 0
        getRed(&br, green: &bg, blue: &bb, alpha: &ba)
        other.getRed(&fr, green: &fg, blue: &fb, alpha: &fa)
        return UIColor(
            red: fr * alpha + br * (1 - alpha),
            green: fg * alpha + bg * (1 - alpha),
            blue: fb * alpha + bb * (1 - alpha),
            alpha: ba)
    }
}
