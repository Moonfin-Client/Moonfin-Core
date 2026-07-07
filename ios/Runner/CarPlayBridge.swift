import CarPlay
import Flutter
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
      let tabNodes = Array(nodes.filter { $0.browsable }.prefix(4))
      let templates = tabNodes.map { node in
        self.makeTabTemplate(for: node)
      }
      guard !templates.isEmpty else {
        // No session yet: show a single tab whose empty state explains the fix;
        // signInStateChanged rebuilds once the user signs in on the phone.
        let placeholder = CPListTemplate(title: "Moonfin", sections: [])
        placeholder.tabImage = UIImage(systemName: "music.note")
        placeholder.tabTitle = "Moonfin"
        placeholder.emptyViewTitleVariants = ["Open Moonfin on your iPhone to sign in"]
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
    case "tab|music": return "music.note"
    case "tab|books": return "book"
    case "tab|playlists": return "music.note.list"
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
      let maxCount = CPListTemplate.maximumItemCount
      let listItems = items.prefix(maxCount).map { self.makeListItem(for: $0) }
      template.updateSections([CPListSection(items: Array(listItems))])
      if listItems.isEmpty {
        template.emptyViewTitleVariants = ["Nothing here yet"]
      }
    }
  }

  private func makeListItem(for item: BrowseItem) -> CPListItem {
    let listItem = CPListItem(text: item.title, detailText: item.subtitle)
    listItem.accessoryType = item.browsable ? .disclosureIndicator : .none
    listItem.handler = { [weak self] _, completion in
      guard let self else {
        completion()
        return
      }
      if item.browsable {
        self.pushChildList(for: item, completion: completion)
      } else if item.playable {
        self.play(item: item, completion: completion)
      } else {
        completion()
      }
    }
    applyArtwork(from: item.artUri, to: listItem)
    return listItem
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
        // Shuffle and repeat route through MPRemoteCommandCenter, which
        // audio_service already handles.
        template.updateNowPlayingButtons([
          CPNowPlayingShuffleButton { _ in },
          CPNowPlayingRepeatButton { _ in },
        ])
      } else {
        template.updateNowPlayingButtons([])
      }
    }
  }

  // MARK: - Artwork

  private func applyArtwork(from urlString: String?, to listItem: CPListItem) {
    guard let urlString, let url = URL(string: urlString) else { return }
    let key = urlString as NSString
    if let cached = artworkCache.object(forKey: key) {
      listItem.setImage(cached)
      return
    }
    URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
      guard let self, let data, let image = UIImage(data: data) else { return }
      self.artworkCache.setObject(image, forKey: key)
      DispatchQueue.main.async {
        listItem.setImage(image)
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
        iconName: dict["iconName"] as? String
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
