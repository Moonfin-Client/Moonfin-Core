import Foundation

/// Locates the Flutter-bundled Noto Sans so subtitle renderers always have a
/// resolvable fallback font (tvOS/iOS have no fontconfig configuration), and
/// materializes in-container font attachments (MKV embedded TTF/OTF) into a
/// directory libass can scan.
enum SubtitleFontLocator {
    static let fontFamily = "Noto Sans"

    static func bundledFontsDirectory() -> String? {
        var candidates: [String] = []
        if let frameworksPath = Bundle.main.privateFrameworksPath {
            candidates.append("\(frameworksPath)/App.framework/flutter_assets/assets/fonts")
        }
        if let resourcePath = Bundle.main.resourcePath {
            candidates.append("\(resourcePath)/flutter_assets/assets/fonts")
        }
        return candidates.first {
            FileManager.default.fileExists(atPath: "\($0)/NotoSans-Regular.ttf")
        }
    }

    /// Writes embedded font attachments to a session temp directory (seeded
    /// with the bundled fonts) and returns its path. Returns the plain bundled
    /// directory when there are no attachments. An attachment sharing a name
    /// with a bundled font is written last and wins.
    static func materializeFontsDirectory(attachments: [(filename: String, data: Data)])
        -> String?
    {
        guard !attachments.isEmpty else { return bundledFontsDirectory() }
        let dir = FileManager.default.temporaryDirectory
            .appendingPathComponent("moonfin-sub-fonts", isDirectory: true)
        let fm = FileManager.default
        try? fm.removeItem(at: dir)
        do {
            try fm.createDirectory(at: dir, withIntermediateDirectories: true)
        } catch {
            return bundledFontsDirectory()
        }
        // Every bundled font comes across, not just the default one. libass
        // scans this directory and nothing else, so anything left behind stops
        // being available as a fallback, and a line whose font the release
        // forgot to attach would render as tofu instead of reaching NotoSansCJK.
        if let bundled = bundledFontsDirectory(),
            let names = try? fm.contentsOfDirectory(atPath: bundled)
        {
            let source = URL(fileURLWithPath: bundled)
            for name in names {
                try? fm.copyItem(
                    at: source.appendingPathComponent(name),
                    to: dir.appendingPathComponent(name))
            }
        }
        for attachment in attachments {
            let name = URL(fileURLWithPath: attachment.filename).lastPathComponent
            guard !name.isEmpty else { continue }
            try? attachment.data.write(to: dir.appendingPathComponent(name))
        }
        return dir.path
    }
}
