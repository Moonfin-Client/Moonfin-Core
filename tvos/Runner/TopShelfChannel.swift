import Flutter
import Foundation
import TVServices

@MainActor
final class TopShelfChannel: NSObject {
    private let channel: FlutterMethodChannel
    private var pendingDeepLink: String?
    private var initialDeepLinkRead = false

    private static let appGroupIdentifier = "group.org.moonfin.app"
    private static let cacheFileName = "topshelf_cache.json"

    init(messenger: FlutterBinaryMessenger) {
        channel = FlutterMethodChannel(
            name: "moonfin/appletv_topshelf", binaryMessenger: messenger)
        super.init()
        channel.setMethodCallHandler { [weak self] call, result in
            self?.handle(call, result: result)
        }
    }

    private static var cacheFileURL: URL? {
        guard
            let container = FileManager.default.containerURL(
                forSecurityApplicationGroupIdentifier: appGroupIdentifier)
        else { return nil }
        let dir = container.appendingPathComponent("Library/Caches", isDirectory: true)
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir.appendingPathComponent(cacheFileName)
    }

    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "writeCache":
            let args = call.arguments as? [String: Any] ?? [:]
            let sections = args["sections"] as? [[String: Any]] ?? []
            writeCache(sections: sections)
            result(nil)
        case "clearCache":
            if let url = Self.cacheFileURL {
                try? FileManager.default.removeItem(at: url)
            }
            notifyChanged()
            result(nil)
        case "getInitialDeepLink":
            initialDeepLinkRead = true
            let link = pendingDeepLink
            pendingDeepLink = nil
            result(link)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func writeCache(sections: [[String: Any]]) {
        guard let url = Self.cacheFileURL else { return }
        if sections.isEmpty {
            try? FileManager.default.removeItem(at: url)
            notifyChanged()
            return
        }
        let payload: [String: Any] = ["sections": sections]
        guard JSONSerialization.isValidJSONObject(payload),
            let data = try? JSONSerialization.data(withJSONObject: payload)
        else { return }
        try? data.write(to: url, options: .atomic)
        notifyChanged()
    }

    private func notifyChanged() {
        TVTopShelfContentProvider.topShelfContentDidChange()
    }

    func deliverDeepLink(_ url: URL, isLaunch: Bool) {
        let value = url.absoluteString
        // A scene can reconnect with a link while Dart is already running, after
        // it has read the launch link, so only hold one until that read.
        if isLaunch && !initialDeepLinkRead {
            pendingDeepLink = value
        } else {
            channel.invokeMethod("onDeepLink", arguments: value)
        }
    }
}
