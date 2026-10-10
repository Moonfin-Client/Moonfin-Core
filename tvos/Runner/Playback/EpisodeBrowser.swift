import UIKit

struct EpisodeBrowserContent {
    struct Season {
        let id: String
        let name: String
        let selected: Bool
    }

    struct Episode {
        let id: String
        let line: String
        let title: String
        let overview: String
        let imageUrl: String
        let progress: CGFloat
        let played: Bool
        let playing: Bool
    }

    let title: String
    let logoUrl: String
    let seasons: [Season]
    let episodes: [Episode]
    let loading: Bool
    let message: String

    init(_ args: [String: Any]) {
        title = (args["title"] as? String) ?? ""
        logoUrl = (args["logoUrl"] as? String) ?? ""
        seasons = ((args["seasons"] as? [[String: Any]]) ?? []).compactMap { entry in
            guard let id = entry["id"] as? String, !id.isEmpty else { return nil }
            return Season(
                id: id,
                name: (entry["name"] as? String) ?? "",
                selected: (entry["selected"] as? Bool) ?? false)
        }
        episodes = ((args["episodes"] as? [[String: Any]]) ?? []).compactMap { entry in
            guard let id = entry["id"] as? String, !id.isEmpty else { return nil }
            return Episode(
                id: id,
                line: (entry["line"] as? String) ?? "",
                title: (entry["title"] as? String) ?? "",
                overview: (entry["overview"] as? String) ?? "",
                imageUrl: (entry["imageUrl"] as? String) ?? "",
                progress: CGFloat((entry["progress"] as? NSNumber)?.doubleValue ?? 0),
                played: (entry["played"] as? Bool) ?? false,
                playing: (entry["playing"] as? Bool) ?? false)
        }
        loading = (args["loading"] as? Bool) ?? false
        message = (args["message"] as? String) ?? ""
    }
}

private let panelWidth: CGFloat = 1040
private let panelPadding: CGFloat = 40
private let rowHeight: CGFloat = 208
private let rowInset: CGFloat = 20
private let logoHeight: CGFloat = 100
private let seasonHeight: CGFloat = 60

/// The player's episode browser: a panel over the right of the picture with
/// season tabs along the top and the open season's episodes underneath,
/// opening on the one that's playing. It only draws what Dart hands it and
/// reports what the viewer picks.
@MainActor
final class EpisodeBrowserViewController: UIViewController, RemotePlayerNavigable,
    UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    var onSelectSeason: ((String) -> Void)?
    var onSelectEpisode: ((String) -> Void)?
    var onClosed: (() -> Void)?

    private var content: EpisodeBrowserContent
    private let theme: ChannelCarouselTheme
    private var openSeasonId: String?
    // Cleared once the playing episode has had the remote, so later updates
    // leave the viewer wherever they've moved to.
    private var needsInitialFocus = true

    private let panel = UIView()
    private let logoView = UIImageView()
    private let titleLabel = UILabel()
    private let spinner = UIActivityIndicatorView(style: .large)
    private let messageLabel = UILabel()
    private var seasonsView: UICollectionView!
    private var episodesView: UICollectionView!
    private var seasonsHeight: NSLayoutConstraint!
    private var logoWidth: NSLayoutConstraint!
    private var logoUrl = ""

    init(content: EpisodeBrowserContent, theme: ChannelCarouselTheme) {
        self.content = content
        self.theme = theme
        openSeasonId = content.seasons.first(where: { $0.selected })?.id
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)

        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.backgroundColor = theme.surface.withAlphaComponent(0.96)
        panel.layer.cornerRadius = 28
        panel.layer.borderWidth = 2
        panel.layer.borderColor = UIColor(white: 1, alpha: 0.2).cgColor
        view.addSubview(panel)

        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.contentMode = .scaleAspectFit
        panel.addSubview(logoView)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 44, weight: .bold)
        titleLabel.textColor = .white
        panel.addSubview(titleLabel)

        let seasonsLayout = UICollectionViewFlowLayout()
        seasonsLayout.scrollDirection = .horizontal
        seasonsLayout.minimumLineSpacing = 16
        seasonsLayout.sectionInset = UIEdgeInsets(top: 0, left: rowInset, bottom: 0, right: rowInset)
        seasonsView = UICollectionView(frame: .zero, collectionViewLayout: seasonsLayout)
        seasonsView.translatesAutoresizingMaskIntoConstraints = false
        seasonsView.backgroundColor = .clear
        seasonsView.clipsToBounds = false
        seasonsView.showsHorizontalScrollIndicator = false
        seasonsView.dataSource = self
        seasonsView.delegate = self
        seasonsView.register(EpisodeSeasonCell.self, forCellWithReuseIdentifier: "season")
        panel.addSubview(seasonsView)

        let rowWidth = panelWidth - panelPadding * 2 - rowInset * 2
        let episodesLayout = UICollectionViewFlowLayout()
        episodesLayout.scrollDirection = .vertical
        episodesLayout.itemSize = CGSize(width: rowWidth, height: rowHeight)
        episodesLayout.minimumLineSpacing = 16
        episodesLayout.sectionInset = UIEdgeInsets(top: 12, left: rowInset, bottom: 24, right: rowInset)
        episodesView = UICollectionView(frame: .zero, collectionViewLayout: episodesLayout)
        episodesView.translatesAutoresizingMaskIntoConstraints = false
        episodesView.backgroundColor = .clear
        episodesView.dataSource = self
        episodesView.delegate = self
        episodesView.register(EpisodeRowCell.self, forCellWithReuseIdentifier: "episode")
        panel.addSubview(episodesView)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .white
        panel.addSubview(spinner)

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.font = .systemFont(ofSize: 30, weight: .regular)
        messageLabel.textColor = UIColor(white: 1, alpha: 0.7)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        panel.addSubview(messageLabel)

        seasonsHeight = seasonsView.heightAnchor.constraint(equalToConstant: 0)
        logoWidth = logoView.widthAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            panel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            panel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            panel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            panel.widthAnchor.constraint(equalToConstant: panelWidth),

            logoView.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: panelPadding + rowInset),
            logoView.topAnchor.constraint(equalTo: panel.topAnchor, constant: 36),
            logoView.heightAnchor.constraint(equalToConstant: logoHeight),
            logoWidth,

            titleLabel.leadingAnchor.constraint(equalTo: logoView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: panel.trailingAnchor, constant: -panelPadding),
            titleLabel.centerYAnchor.constraint(equalTo: logoView.centerYAnchor),

            seasonsView.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: panelPadding),
            seasonsView.trailingAnchor.constraint(equalTo: panel.trailingAnchor, constant: -panelPadding),
            seasonsView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 24),
            seasonsHeight,

            episodesView.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: panelPadding),
            episodesView.trailingAnchor.constraint(equalTo: panel.trailingAnchor, constant: -panelPadding),
            episodesView.topAnchor.constraint(equalTo: seasonsView.bottomAnchor, constant: 12),
            episodesView.bottomAnchor.constraint(equalTo: panel.bottomAnchor, constant: -12),

            spinner.centerXAnchor.constraint(equalTo: episodesView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: episodesView.centerYAnchor),

            messageLabel.leadingAnchor.constraint(equalTo: episodesView.leadingAnchor, constant: rowInset),
            messageLabel.trailingAnchor.constraint(equalTo: episodesView.trailingAnchor, constant: -rowInset),
            messageLabel.centerYAnchor.constraint(equalTo: episodesView.centerYAnchor),
        ])

        applyContent(previous: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        focusPlayingEpisodeIfNeeded()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        onClosed?()
    }

    func update(_ content: EpisodeBrowserContent) {
        let previous = self.content
        self.content = content
        openSeasonId = content.seasons.first(where: { $0.selected })?.id ?? openSeasonId
        guard isViewLoaded else { return }
        applyContent(previous: previous)
        focusPlayingEpisodeIfNeeded()
    }

    private func applyContent(previous: EpisodeBrowserContent?) {
        titleLabel.text = content.title
        loadLogo(content.logoUrl)

        let showsSeasons = content.seasons.count > 1
        seasonsView.isHidden = !showsSeasons
        seasonsHeight.constant = showsSeasons ? seasonHeight + 16 : 0
        if previous.map({ $0.seasons.map(\.id) == content.seasons.map(\.id) }) == true {
            refreshVisibleCells(in: seasonsView)
        } else {
            seasonsView.reloadData()
        }

        // The same list coming back refreshed keeps its cells, so the remote
        // isn't thrown off the row it's on.
        if previous.map({ $0.episodes.map(\.id) == content.episodes.map(\.id) }) == true {
            refreshVisibleCells(in: episodesView)
        } else {
            episodesView.reloadData()
        }

        let empty = content.episodes.isEmpty
        episodesView.isHidden = empty
        if empty && content.loading {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
        }
        messageLabel.text = content.message
        messageLabel.isHidden = !empty || content.loading
    }

    private func refreshVisibleCells(in collectionView: UICollectionView) {
        for cell in collectionView.visibleCells {
            guard let indexPath = collectionView.indexPath(for: cell) else { continue }
            configure(cell, in: collectionView, at: indexPath)
        }
    }

    private func loadLogo(_ urlString: String) {
        guard urlString != logoUrl else { return }
        logoUrl = urlString
        logoView.image = nil
        logoWidth.constant = 0
        titleLabel.isHidden = false
        guard !urlString.isEmpty, let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            let image = data.flatMap { UIImage(data: $0) }
            DispatchQueue.main.async {
                guard let self, self.logoUrl == urlString, let image, image.size.height > 0 else {
                    return
                }
                self.logoView.image = image
                let aspect = image.size.width / image.size.height
                self.logoWidth.constant = min(
                    panelWidth - (panelPadding + rowInset) * 2, logoHeight * aspect)
                self.titleLabel.isHidden = true
            }
        }.resume()
    }

    /// The remote goes to the playing episode the first time there's a list,
    /// unless the viewer has already moved up to the season tabs.
    private func focusPlayingEpisodeIfNeeded() {
        guard needsInitialFocus, view.window != nil, !content.episodes.isEmpty else { return }
        needsInitialFocus = false
        episodesView.layoutIfNeeded()
        episodesView.scrollToItem(
            at: IndexPath(item: playingIndex, section: 0), at: .centeredVertically, animated: false)
        if let focused = UIFocusSystem.focusSystem(for: view)?.focusedItem as? UICollectionViewCell,
            seasonsView.indexPath(for: focused) != nil
        {
            return
        }
        setNeedsFocusUpdate()
        updateFocusIfNeeded()
    }

    private var playingIndex: Int {
        content.episodes.firstIndex(where: { $0.playing }) ?? 0
    }

    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        if !content.episodes.isEmpty { return [episodesView] }
        if content.seasons.count > 1 { return [seasonsView] }
        return super.preferredFocusEnvironments
    }

    func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
        if collectionView === seasonsView {
            let index = content.seasons.firstIndex(where: { $0.id == openSeasonId }) ?? 0
            return content.seasons.isEmpty ? nil : IndexPath(item: index, section: 0)
        }
        return content.episodes.isEmpty ? nil : IndexPath(item: playingIndex, section: 0)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)
        -> Int
    {
        collectionView === seasonsView ? content.seasons.count : content.episodes.count
    }

    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let identifier = collectionView === seasonsView ? "season" : "episode"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        configure(cell, in: collectionView, at: indexPath)
        return cell
    }

    private func configure(_ cell: UICollectionViewCell, in collectionView: UICollectionView, at indexPath: IndexPath) {
        if let seasonCell = cell as? EpisodeSeasonCell, content.seasons.indices.contains(indexPath.item) {
            let season = content.seasons[indexPath.item]
            seasonCell.configure(name: season.name, isOpen: season.id == openSeasonId, accent: theme.accent)
        } else if let episodeCell = cell as? EpisodeRowCell,
            content.episodes.indices.contains(indexPath.item)
        {
            episodeCell.configure(content.episodes[indexPath.item], accent: theme.accent)
        }
    }

    func collectionView(
        _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        guard collectionView === seasonsView else {
            return (collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize ?? .zero
        }
        let name = content.seasons[indexPath.item].name as NSString
        let width = name.size(withAttributes: [.font: EpisodeSeasonCell.font]).width
        return CGSize(width: ceil(width) + 60, height: seasonHeight)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView === seasonsView {
            let season = content.seasons[indexPath.item]
            guard season.id != openSeasonId else { return }
            openSeasonId = season.id
            refreshVisibleCells(in: seasonsView)
            onSelectSeason?(season.id)
            return
        }
        onSelectEpisode?(content.episodes[indexPath.item].id)
        dismiss(animated: true)
    }

    func handleRemoteNavigation(_ command: String) {
        if command == "back" {
            dismiss(animated: true)
            return
        }
        let focused = UIFocusSystem.focusSystem(for: view)?.focusedItem as? UICollectionViewCell
        let inSeasons = focused.flatMap { seasonsView.indexPath(for: $0) }
        let inEpisodes = focused.flatMap { episodesView.indexPath(for: $0) }
        if command == "select" {
            if let inSeasons {
                collectionView(seasonsView, didSelectItemAt: inSeasons)
            } else if let inEpisodes {
                collectionView(episodesView, didSelectItemAt: inEpisodes)
            }
            return
        }
        if let inSeasons {
            switch command {
            case "moveleft": focus(seasonsView, index: inSeasons.item - 1)
            case "moveright": focus(seasonsView, index: inSeasons.item + 1)
            case "movedown": focus(episodesView, index: indexPathForPreferredFocusedView(in: episodesView)?.item ?? 0)
            default: break
            }
        } else if let inEpisodes {
            switch command {
            case "moveup" where inEpisodes.item == 0 && !seasonsView.isHidden:
                focus(seasonsView, index: indexPathForPreferredFocusedView(in: seasonsView)?.item ?? 0)
            case "moveup": focus(episodesView, index: inEpisodes.item - 1)
            case "movedown": focus(episodesView, index: inEpisodes.item + 1)
            default: break
            }
        } else {
            focus(episodesView, index: indexPathForPreferredFocusedView(in: episodesView)?.item ?? 0)
        }
    }

    private func focus(_ collectionView: UICollectionView, index: Int) {
        let count = collectionView.numberOfItems(inSection: 0)
        guard count > 0, !collectionView.isHidden else { return }
        let target = IndexPath(item: min(count - 1, max(0, index)), section: 0)
        collectionView.scrollToItem(
            at: target,
            at: collectionView === seasonsView ? .centeredHorizontally : .centeredVertically,
            animated: false)
        collectionView.layoutIfNeeded()
        guard let cell = collectionView.cellForItem(at: target) else { return }
        let system = UIFocusSystem.focusSystem(for: view)
        system?.requestFocusUpdate(to: cell)
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

private final class EpisodeSeasonCell: UICollectionViewCell {
    static let font = UIFont.systemFont(ofSize: 28, weight: .semibold)

    private let label = UILabel()
    private var isOpen = false
    private var accent: UIColor = .white

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = seasonHeight / 2
        contentView.layer.borderWidth = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Self.font
        label.textAlignment = .center
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(name: String, isOpen: Bool, accent: UIColor) {
        label.text = name
        self.isOpen = isOpen
        self.accent = accent
        applyStyle()
    }

    private func applyStyle() {
        let focused = isFocused
        contentView.backgroundColor =
            focused ? .white : isOpen ? accent.withAlphaComponent(0.35) : UIColor(white: 1, alpha: 0.1)
        contentView.layer.borderColor = (isOpen && !focused ? accent : UIColor.clear).cgColor
        label.textColor = focused ? .black : .white
        transform = focused ? CGAffineTransform(scaleX: 1.08, y: 1.08) : .identity
    }

    override func didUpdateFocus(
        in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator
    ) {
        coordinator.addCoordinatedAnimations {
            self.applyStyle()
        }
    }
}

private final class EpisodeRowCell: UICollectionViewCell {
    private let card = UIView()
    private let thumb = UIImageView()
    private let progressBar = EpisodeProgressView()
    private let playedBadge = UIImageView()
    private let lineLabel = UILabel()
    private let titleLabel = UILabel()
    private let overviewLabel = UILabel()
    private var imageUrl = ""
    private var isPlayingEpisode = false
    private var accent: UIColor = .white

    override init(frame: CGRect) {
        super.init(frame: frame)

        card.translatesAutoresizingMaskIntoConstraints = false
        card.layer.cornerRadius = 20
        card.layer.borderWidth = 4
        contentView.addSubview(card)

        thumb.translatesAutoresizingMaskIntoConstraints = false
        thumb.contentMode = .scaleAspectFill
        thumb.clipsToBounds = true
        thumb.layer.cornerRadius = 12
        thumb.backgroundColor = UIColor(white: 1, alpha: 0.08)
        card.addSubview(thumb)

        progressBar.translatesAutoresizingMaskIntoConstraints = false
        thumb.addSubview(progressBar)

        playedBadge.translatesAutoresizingMaskIntoConstraints = false
        playedBadge.image = UIImage(
            systemName: "checkmark.circle.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold))
        playedBadge.contentMode = .scaleAspectFit
        playedBadge.backgroundColor = .white
        playedBadge.layer.cornerRadius = 17
        playedBadge.clipsToBounds = true
        thumb.addSubview(playedBadge)

        lineLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        lineLabel.textColor = UIColor(white: 1, alpha: 0.6)
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.textColor = .white
        overviewLabel.font = .systemFont(ofSize: 23, weight: .regular)
        overviewLabel.textColor = UIColor(white: 1, alpha: 0.72)
        overviewLabel.numberOfLines = 3

        let texts = UIStackView(arrangedSubviews: [lineLabel, titleLabel, overviewLabel])
        texts.translatesAutoresizingMaskIntoConstraints = false
        texts.axis = .vertical
        texts.spacing = 6
        texts.setCustomSpacing(10, after: titleLabel)
        card.addSubview(texts)

        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.topAnchor),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            thumb.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 14),
            thumb.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            thumb.widthAnchor.constraint(equalToConstant: 320),
            thumb.heightAnchor.constraint(equalToConstant: 180),

            progressBar.leadingAnchor.constraint(equalTo: thumb.leadingAnchor, constant: 8),
            progressBar.trailingAnchor.constraint(equalTo: thumb.trailingAnchor, constant: -8),
            progressBar.bottomAnchor.constraint(equalTo: thumb.bottomAnchor, constant: -8),
            progressBar.heightAnchor.constraint(equalToConstant: 6),

            playedBadge.topAnchor.constraint(equalTo: thumb.topAnchor, constant: 8),
            playedBadge.trailingAnchor.constraint(equalTo: thumb.trailingAnchor, constant: -8),
            playedBadge.widthAnchor.constraint(equalToConstant: 34),
            playedBadge.heightAnchor.constraint(equalToConstant: 34),

            texts.leadingAnchor.constraint(equalTo: thumb.trailingAnchor, constant: 26),
            texts.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),
            texts.topAnchor.constraint(equalTo: thumb.topAnchor, constant: 2),
            texts.bottomAnchor.constraint(lessThanOrEqualTo: card.bottomAnchor, constant: -14),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ episode: EpisodeBrowserContent.Episode, accent: UIColor) {
        lineLabel.text = episode.line
        lineLabel.isHidden = episode.line.isEmpty
        titleLabel.text = episode.title
        overviewLabel.text = episode.overview
        overviewLabel.isHidden = episode.overview.isEmpty
        progressBar.progress = min(1, max(0, episode.progress))
        progressBar.isHidden = progressBar.progress <= 0
        progressBar.fill.backgroundColor = accent
        playedBadge.isHidden = !episode.played
        playedBadge.tintColor = accent
        isPlayingEpisode = episode.playing
        self.accent = accent
        applyStyle()
        loadThumb(episode.imageUrl)
    }

    private func loadThumb(_ urlString: String) {
        guard urlString != imageUrl else { return }
        imageUrl = urlString
        thumb.image = nil
        guard !urlString.isEmpty, let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            let image = data.flatMap { UIImage(data: $0) }
            DispatchQueue.main.async {
                guard let self, self.imageUrl == urlString else { return }
                self.thumb.image = image
            }
        }.resume()
    }

    private func applyStyle() {
        let focused = isFocused
        card.backgroundColor =
            focused
            ? accent.withAlphaComponent(0.3)
            : isPlayingEpisode ? accent.withAlphaComponent(0.16) : UIColor(white: 1, alpha: 0.06)
        card.layer.borderColor =
            (focused ? UIColor.white : isPlayingEpisode ? accent.withAlphaComponent(0.6) : UIColor.clear)
            .cgColor
        transform = focused ? CGAffineTransform(scaleX: 1.02, y: 1.02) : .identity
    }

    override func didUpdateFocus(
        in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator
    ) {
        coordinator.addCoordinatedAnimations {
            self.applyStyle()
        }
    }
}

private final class EpisodeProgressView: UIView {
    let fill = UIView()

    var progress: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0, alpha: 0.55)
        layer.cornerRadius = 3
        clipsToBounds = true
        addSubview(fill)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        fill.frame = CGRect(x: 0, y: 0, width: bounds.width * progress, height: bounds.height)
    }
}
