import CarPlay
import Flutter
import MediaPlayer
import UIKit

/// Coordinates the CarPlay template UI with the Dart browse/playback layer
/// over the com.moonfin/carplay method channel. Node and media ids are opaque
/// strings minted by Dart; Swift never parses them beyond the msg| prefix.
@available(iOS 14.0, *)
final class CarPlayBridge: NSObject {
  static let shared = CarPlayBridge()

  private enum NowPlayingMode: String {
    case music
    case audiobook
  }

  private static let callTimeout: TimeInterval = 10
  private static let rootNodeId = "root"

  private var channel: FlutterMethodChannel?
  private var interfaceController: CPInterfaceController?
  private var tabTemplates: [String: CPListTemplate] = [:]
  private let artworkCache = NSCache<NSString, UIImage>()
  private var nowPlayingMode = NowPlayingMode.music
  private var observingNowPlaying = false

  private override init() {
    super.init()
  }

  // MARK: - Channel

  func attach(messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(
      name: "com.moonfin/carplay",
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { [weak self] call, result in
      self?.handleDartCall(call, result: result)
    }
    self.channel = channel
  }

  private func handleDartCall(
    _ call: FlutterMethodCall, result: @escaping FlutterResult
  ) {
    switch call.method {
    case "invalidate", "signInStateChanged":
      reloadTabs()
      result(nil)
    case "nowPlayingContextChanged":
      let args = call.arguments as? [String: Any]
      if let mode = NowPlayingMode(rawValue: args?["mode"] as? String ?? "") {
        nowPlayingMode = mode
      }
      configureNowPlayingTemplate()
      result(nil)
    case "playbackModesChanged":
      applyPlaybackModes(call.arguments)
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  /// Calls into Dart with a timeout so a stalled engine leaves the car UI in
  /// its empty state instead of a permanent spinner.
  private func invokeDart(
    _ method: String,
    _ arguments: [String: Any],
    completion: @escaping (Any?) -> Void
  ) {
    guard let channel else {
      completion(nil)
      return
    }
    var completed = false
    let timeoutItem = DispatchWorkItem {
      guard !completed else { return }
      completed = true
      completion(nil)
    }
    DispatchQueue.main.asyncAfter(
      deadline: .now() + Self.callTimeout, execute: timeoutItem)
    channel.invokeMethod(method, arguments: arguments) { response in
      DispatchQueue.main.async {
        guard !completed else { return }
        completed = true
        timeoutItem.cancel()
        if response is FlutterError
          || (response as? NSObject) === FlutterMethodNotImplemented
        {
          completion(nil)
        } else {
          completion(response)
        }
      }
    }
  }

  // MARK: - Scene lifecycle

  func connect(interfaceController: CPInterfaceController) {
    self.interfaceController = interfaceController
    buildRootTemplate()
    configureNowPlayingTemplate()
  }

  func disconnect() {
    interfaceController = nil
    tabTemplates.removeAll()
    if observingNowPlaying {
      CPNowPlayingTemplate.shared.remove(self)
      observingNowPlaying = false
    }
  }

  // MARK: - Templates

  private func buildRootTemplate() {
    guard let interfaceController else { return }
    invokeDart("getChildren", ["nodeId": Self.rootNodeId]) { [weak self] response in
      guard let self, self.interfaceController === interfaceController else {
        return
      }
      let nodes = Self.browseItems(from: response)
      // A lone message (no session, or the server is down) explains itself in
      // the placeholder rather than becoming a tab named after it.
      let message: BrowseItem? =
        nodes.count == 1 && nodes[0].id.hasPrefix("msg|") ? nodes[0] : nil
      let tabNodes: [BrowseItem] =
        message != nil ? [] : Array(nodes.filter { $0.browsable }.prefix(4))
      let templates = tabNodes.map { node in
        self.makeTabTemplate(for: node)
      }
      guard !templates.isEmpty else {
        // Show a single tab whose empty state explains the fix. signInStateChanged
        // rebuilds once the user signs in on the phone.
        let placeholder = CPListTemplate(title: "Moonfin", sections: [])
        placeholder.tabImage = UIImage(systemName: "music.note")
        placeholder.tabTitle = "Moonfin"
        placeholder.emptyViewTitleVariants = [
          message?.title ?? "Open Moonfin on your iPhone to sign in"
        ]
        let tabBar = CPTabBarTemplate(templates: [placeholder])
        interfaceController.setRootTemplate(tabBar, animated: false) { _, _ in }
        return
      }
      let tabBar = CPTabBarTemplate(templates: templates)
      interfaceController.setRootTemplate(tabBar, animated: false) { _, _ in }
      for (node, template) in zip(tabNodes, templates) {
        self.loadChildren(of: node.id, into: template)
      }
    }
  }

  private func makeTabTemplate(for node: BrowseItem) -> CPListTemplate {
    let template = CPListTemplate(title: node.title, sections: [])
    template.tabTitle = node.title
    template.tabImage = UIImage(systemName: Self.tabSymbol(for: node))
    template.emptyViewTitleVariants = ["Loading"]
    tabTemplates[node.id] = template
    return template
  }

  private static func tabSymbol(for node: BrowseItem) -> String {
    if let iconName = node.iconName, !iconName.isEmpty {
      return iconName
    }
    switch node.id {
    case "tab|home": return "play.circle"
    case "tab|music": return "square.stack"
    case "tab|books": return "book"
    case "tab|downloads": return "arrow.down.circle"
    default: return "music.note"
    }
  }

  private func reloadTabs() {
    DispatchQueue.main.async { [weak self] in
      guard let self, self.interfaceController != nil else { return }
      if self.tabTemplates.isEmpty {
        self.buildRootTemplate()
        return
      }
      for (nodeId, template) in self.tabTemplates {
        self.loadChildren(of: nodeId, into: template)
      }
    }
  }

  private func loadChildren(of nodeId: String, into template: CPListTemplate) {
    invokeDart("getChildren", ["nodeId": nodeId]) { [weak self] response in
      guard let self else { return }
      guard let response else {
        template.updateSections([])
        template.emptyViewTitleVariants = ["Can't reach your server"]
        return
      }
      let items = Self.browseItems(from: response)
      if items.count == 1, items[0].id.hasPrefix("msg|") {
        template.updateSections([])
        template.emptyViewTitleVariants = [items[0].title]
        return
      }
      let sections = self.makeSections(items)
      template.updateSections(sections)
      if sections.isEmpty {
        template.emptyViewTitleVariants = ["Nothing here yet"]
      }
    }
  }

  /// Runs of items that share a shelf title become one section, as Android
  /// Auto groups them.
  private func makeSections(_ items: [BrowseItem]) -> [CPListSection] {
    var shelves: [(title: String?, items: [BrowseItem])] = []
    for item in items {
      if let last = shelves.last, last.title == item.shelf {
        shelves[shelves.count - 1].items.append(item)
      } else {
        shelves.append((item.shelf, [item]))
      }
    }
    var budget = Int(CPListTemplate.maximumItemCount)
    var sections: [CPListSection] = []
    for shelf in shelves.prefix(Int(CPListTemplate.maximumSectionCount)) {
      guard budget > 0 else { break }
      if let row = makeShelfRow(title: shelf.title, items: shelf.items) {
        sections.append(CPListSection(items: [row]))
        budget -= 1
      } else {
        let rows = shelf.items.prefix(budget).map { makeListItem(for: $0) }
        sections.append(
          CPListSection(items: rows, header: shelf.title, sectionIndexTitle: nil))
        budget -= rows.count
      }
    }
    return sections
  }

  private func makeListItem(for item: BrowseItem) -> CPListItem {
    let listItem = CPListItem(text: item.title, detailText: item.subtitle)
    listItem.accessoryType = item.browsable ? .disclosureIndicator : .none
    if let progress = item.progress {
      listItem.playbackProgress = CGFloat(min(max(progress, 0), 1))
    }
    listItem.handler = { [weak self] _, completion in
      self?.open(item, completion: completion) ?? completion()
    }
    if item.artUri == nil, let symbol = item.iconName {
      listItem.setImage(symbolImage(symbol))
    }
    applyArtwork(from: item.artUri, to: listItem)
    return listItem
  }

  // CarPlay doesn't tint list images, so a bare symbol comes out black on the
  // dark car screen, and it drops images backed by a UIImageAsset. The symbol
  // is drawn into a plain bitmap in the car screen's text color instead.
  private func symbolImage(_ name: String, pointSize: CGFloat? = nil) -> UIImage? {
    let config = pointSize.map { UIImage.SymbolConfiguration(pointSize: $0) }
    guard let symbol = UIImage(systemName: name, withConfiguration: config) else {
      return nil
    }
    let style = interfaceController?.carTraitCollection.userInterfaceStyle
    let tinted = symbol.withTintColor(
      style == .light ? .black : .white, renderingMode: .alwaysOriginal)
    return UIGraphicsImageRenderer(size: tinted.size).image { _ in
      tinted.draw(at: .zero)
    }
  }

  private func open(_ item: BrowseItem, completion: @escaping () -> Void) {
    if item.browsable {
      pushChildList(for: item, completion: completion)
    } else if item.playable {
      play(item: item, completion: completion)
    } else {
      completion()
    }
  }

  /// One row for a whole shelf, or nil when the shelf stays a list of rows.
  /// Android Auto's icon tiles (the letters, the Listen Now shortcuts) need the
  /// wrapping grid row that CarPlay only has from iOS 26, so earlier versions
  /// keep them as rows.
  private func makeShelfRow(title: String?, items: [BrowseItem]) -> CPListImageRowItem? {
    guard items.count > 1 else { return nil }
    let row: CPListImageRowItem
    let tappable: [BrowseItem]
    if #available(iOS 26.0, *), items.allSatisfy({ $0.tile }) {
      row = makeTileGrid(title: title, items: items)
      tappable = items
    } else if items.allSatisfy({ $0.cover }) {
      tappable = Array(items.prefix(Int(CPMaximumNumberOfGridImages)))
      row = makeImageRow(title: title, items: tappable)
    } else {
      return nil
    }
    row.listImageRowHandler = { [weak self] _, index, completion in
      guard let self, tappable.indices.contains(index) else {
        completion()
        return
      }
      self.open(tappable[index], completion: completion)
    }
    // CarPlay draws a chevron after the shelf title, so the title opens the
    // whole shelf as a plain list.
    row.handler = { [weak self] _, completion in
      guard let self else {
        completion()
        return
      }
      self.pushShelf(title: title, items: items, completion: completion)
    }
    return row
  }

  private func makeImageRow(title: String?, items: [BrowseItem]) -> CPListImageRowItem {
    let placeholder = UIImage(systemName: "music.note") ?? UIImage()
    let row: CPListImageRowItem
    if #available(iOS 26.0, *) {
      let cards = items.map { item in
        CPListImageRowItemCardElement(
          image: placeholder, showsImageFullHeight: false, title: item.title,
          subtitle: item.subtitle, tintColor: nil)
      }
      row = CPListImageRowItem(text: title, cardElements: cards, allowsMultipleLines: false)
      for (card, item) in zip(cards, items) {
        loadArtwork(from: item.artUri) { [weak row] image in
          card.image = image
          // Assigning the elements again is what redraws the row.
          if let row { row.elements = row.elements }
        }
      }
    } else {
      var images = items.map { _ in placeholder }
      row = CPListImageRowItem(
        text: title ?? "", images: images, imageTitles: items.map { $0.title })
      for (index, item) in items.enumerated() {
        loadArtwork(from: item.artUri) { [weak row] image in
          images[index] = image
          row?.update(images)
        }
      }
    }
    return row
  }

  // A one-character title is already the glyph (the letter tiles), so those
  // use the image-only element, which has no grey platter. Tiles that need a
  // label take the labeled element, and CarPlay always draws its platter.
  @available(iOS 26.0, *)
  private func makeTileGrid(title: String?, items: [BrowseItem]) -> CPListImageRowItem {
    func icon(_ item: BrowseItem, side: CGFloat) -> UIImage {
      symbolImage(item.iconName ?? "music.note", pointSize: side * 0.5) ?? UIImage()
    }
    if items.allSatisfy({ $0.title.count == 1 }) {
      let side = CPListImageRowItemGridElement.maximumImageSize.height
      let tiles = items.map { CPListImageRowItemGridElement(image: icon($0, side: side)) }
      return CPListImageRowItem(text: title, gridElements: tiles, allowsMultipleLines: true)
    }
    let side = CPListImageRowItemImageGridElement.maximumImageSize.height
    let tiles = items.map {
      CPListImageRowItemImageGridElement(
        image: icon($0, side: side), imageShape: .roundedRectangle, title: $0.title,
        accessorySymbolName: nil)
    }
    return CPListImageRowItem(text: title, imageGridElements: tiles, allowsMultipleLines: true)
  }

  private func pushShelf(
    title: String?, items: [BrowseItem], completion: @escaping () -> Void
  ) {
    guard let interfaceController else {
      completion()
      return
    }
    let rows = items.prefix(Int(CPListTemplate.maximumItemCount))
      .map { makeListItem(for: $0) }
    let template = CPListTemplate(title: title, sections: [CPListSection(items: rows)])
    interfaceController.pushTemplate(template, animated: true) { _, _ in
      completion()
    }
  }

  private func pushChildList(
    for item: BrowseItem, completion: @escaping () -> Void
  ) {
    guard let interfaceController else {
      completion()
      return
    }
    let template = CPListTemplate(title: item.title, sections: [])
    template.emptyViewTitleVariants = ["Loading"]
    interfaceController.pushTemplate(template, animated: true) { _, _ in
      completion()
    }
    loadChildren(of: item.id, into: template)
  }

  private func play(item: BrowseItem, completion: @escaping () -> Void) {
    invokeDart("playItem", ["mediaId": item.id]) { [weak self] response in
      completion()
      guard let self, let interfaceController = self.interfaceController else {
        return
      }
      let ok = (response as? [String: Any])?["ok"] as? Bool ?? false
      guard ok else { return }
      self.configureNowPlayingTemplate()
      if interfaceController.topTemplate !== CPNowPlayingTemplate.shared {
        interfaceController.pushTemplate(
          CPNowPlayingTemplate.shared, animated: true
        ) { _, _ in }
      }
    }
  }

  // MARK: - Now Playing

  private func configureNowPlayingTemplate() {
    let template = CPNowPlayingTemplate.shared
    if !observingNowPlaying {
      template.add(self)
      observingNowPlaying = true
    }
    template.isUpNextButtonEnabled = true

    switch nowPlayingMode {
    case .audiobook:
      let rateButton = CPNowPlayingPlaybackRateButton { [weak self] _ in
        self?.invokeDart("cyclePlaybackSpeed", [:]) { _ in }
      }
      template.updateNowPlayingButtons([rateButton])
    case .music:
      if #available(iOS 15.0, *) {
        // CarPlay sends these taps to the button's handler, not to the remote
        // commands audio_service listens on, so Dart toggles the mode here and
        // the reply sets the state the buttons show.
        template.updateNowPlayingButtons([
          CPNowPlayingShuffleButton { [weak self] _ in
            self?.invokeDart("toggleShuffle", [:]) { response in
              self?.applyPlaybackModes(response)
            }
          },
          CPNowPlayingRepeatButton { [weak self] _ in
            self?.invokeDart("cycleRepeat", [:]) { response in
              self?.applyPlaybackModes(response)
            }
          },
        ])
      } else {
        template.updateNowPlayingButtons([])
      }
    }
  }

  // CarPlay draws the shuffle and repeat buttons from the remote commands'
  // current types, which audio_service never sets.
  private func applyPlaybackModes(_ response: Any?) {
    guard let modes = response as? [String: Any] else { return }
    let commands = MPRemoteCommandCenter.shared()
    if let shuffle = modes["shuffle"] as? Bool {
      commands.changeShuffleModeCommand.currentShuffleType = shuffle ? .items : .off
    }
    switch modes["repeat"] as? String {
    case "all": commands.changeRepeatModeCommand.currentRepeatType = .all
    case "one": commands.changeRepeatModeCommand.currentRepeatType = .one
    case "none": commands.changeRepeatModeCommand.currentRepeatType = .off
    default: break
    }
  }

  // MARK: - Artwork

  private func applyArtwork(from urlString: String?, to listItem: CPListItem) {
    loadArtwork(from: urlString) { image in
      listItem.setImage(image)
    }
  }

  /// Calls completion on the main queue once the image loads. It's never
  /// called when there's no image.
  private func loadArtwork(
    from urlString: String?, completion: @escaping (UIImage) -> Void
  ) {
    guard let urlString, let url = URL(string: urlString) else { return }
    let key = urlString as NSString
    if let cached = artworkCache.object(forKey: key) {
      completion(cached)
      return
    }
    MoonfinURLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
      guard let self, let data, let image = UIImage(data: data) else { return }
      self.artworkCache.setObject(image, forKey: key)
      DispatchQueue.main.async {
        completion(image)
      }
    }.resume()
  }

  // MARK: - Parsing

  private struct BrowseItem {
    let id: String
    let title: String
    let subtitle: String?
    let artUri: String?
    let browsable: Bool
    let playable: Bool
    let iconName: String?
    let shelf: String?
    let cover: Bool
    let tile: Bool
    let progress: Double?
  }

  private static func browseItems(from response: Any?) -> [BrowseItem] {
    guard let map = response as? [String: Any],
      let rawItems = map["items"] as? [Any]
    else { return [] }
    return rawItems.compactMap { raw in
      guard let dict = raw as? [String: Any],
        let id = dict["id"] as? String,
        let title = dict["title"] as? String
      else { return nil }
      return BrowseItem(
        id: id,
        title: title,
        subtitle: dict["subtitle"] as? String,
        artUri: dict["artUri"] as? String,
        browsable: dict["browsable"] as? Bool ?? false,
        playable: dict["playable"] as? Bool ?? false,
        iconName: dict["iconName"] as? String,
        shelf: dict["shelf"] as? String,
        cover: dict["cover"] as? Bool ?? false,
        tile: dict["tile"] as? Bool ?? false,
        progress: (dict["progress"] as? NSNumber)?.doubleValue
      )
    }
  }
}

@available(iOS 14.0, *)
extension CarPlayBridge: CPNowPlayingTemplateObserver {
  func nowPlayingTemplateUpNextButtonTapped(_ template: CPNowPlayingTemplate) {
    guard let interfaceController else { return }
    invokeDart("getQueue", [:]) { [weak self] response in
      guard let self, self.interfaceController === interfaceController else {
        return
      }
      guard let map = response as? [String: Any] else { return }
      let items = Self.browseItems(from: map)
      let currentIndex = map["currentIndex"] as? Int ?? -1
      let listItems = items.enumerated().map { index, item -> CPListItem in
        let listItem = CPListItem(text: item.title, detailText: item.subtitle)
        listItem.isPlaying = index == currentIndex
        listItem.handler = { [weak self] _, completion in
          self?.invokeDart("skipToQueueItem", ["index": index]) { _ in
            completion()
            self?.interfaceController?.popTemplate(animated: true) { _, _ in }
          }
        }
        self.applyArtwork(from: item.artUri, to: listItem)
        return listItem
      }
      let maxCount = CPListTemplate.maximumItemCount
      let queueTemplate = CPListTemplate(
        title: "Up Next",
        sections: [CPListSection(items: Array(listItems.prefix(maxCount)))]
      )
      interfaceController.pushTemplate(queueTemplate, animated: true) { _, _ in }
    }
  }
}
