import Foundation
import CoreGraphics
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

// Engine-agnostic playback types shared by the player wrapper, the platform
// channel, and the native player UI. Nothing in this file may reference
// AetherEngine.

/// The host view type for the platform this file compiles into. The wrapper
/// and overlay are shared across iOS, tvOS and macOS, so surface plumbing is
/// written against this alias.
#if canImport(UIKit)
typealias PlatformView = UIView
#elseif canImport(AppKit)
typealias PlatformView = NSView
#endif

protocol StringRepresentableEnum {
    var rawValue: String { get }
    init?(rawValue: String)
}

enum PlayerState: Equatable {
    case idle
    case opening
    case buffering(Float)
    case playing
    case paused
    case stopped
    case ended
    case error
}

/// Reduces a libass event line to readable text. ASS markup is preserved on
/// load so libass can render it, but a track that arrives without a style
/// header falls back to the plain label, and showing the line as it stands
/// puts the raw `ReadOrder,Layer,Style,...` fields and `{\override}` blocks
/// on screen.
func plainTextFromAssMarkup(_ raw: String) -> String {
    var text = raw

    // A libass chunk carries nine leading fields before the dialogue itself.
    // Only the first two are numeric, which keeps ordinary subtitle lines that
    // happen to contain commas from being mistaken for one.
    let fields = text.split(
        separator: ",", maxSplits: 8, omittingEmptySubsequences: false)
    if fields.count == 9,
        Int(fields[0].trimmingCharacters(in: .whitespaces)) != nil,
        Int(fields[1].trimmingCharacters(in: .whitespaces)) != nil
    {
        text = String(fields[8])
    }

    var stripped = ""
    var depth = 0
    for character in text {
        switch character {
        case "{":
            depth += 1
        case "}":
            depth = max(0, depth - 1)
        default:
            if depth == 0 { stripped.append(character) }
        }
    }

    return stripped
        .replacingOccurrences(of: "\\N", with: "\n")
        .replacingOccurrences(of: "\\n", with: "\n")
        .replacingOccurrences(of: "\\h", with: " ")
}

/// Whether the engine has opened the media, and so knows its tracks. Track
/// reporting waits on this, since Dart treats the first report as tracks being
/// ready and applies the startup audio and subtitle selection against it. An
/// empty list announced during loading matches nothing, which leaves subtitles
/// switched on but not rendering until the user picks them again.
func mediaIsOpen(_ state: PlayerState) -> Bool {
    switch state {
    case .idle, .opening:
        return false
    case .buffering, .playing, .paused, .stopped, .ended, .error:
        return true
    }
}

enum ZoomMode: String, StringRepresentableEnum, CaseIterable {
    case fit = "Fit"
    case autoCrop = "Auto Crop"
    case stretch = "Stretch"

    var displayName: String { rawValue }

    var next: ZoomMode {
        let all = ZoomMode.allCases
        let idx = all.firstIndex(of: self)!
        return all[(idx + 1) % all.count]
    }

    var iconName: String {
        switch self {
        case .fit: return "arrow.down.right.and.arrow.up.left"
        case .autoCrop: return "arrow.up.left.and.arrow.down.right"
        case .stretch: return "arrow.left.and.right"
        }
    }
}

struct PlayerTrack: Identifiable, Equatable {
    let id: Int32
    let name: String
    let language: String?
    let title: String?
    let isDefault: Bool
    let isForced: Bool
    let codec: String?
    let isExternal: Bool
    let externalFilename: String?

    init(
        id: Int32,
        name: String,
        language: String? = nil,
        title: String? = nil,
        isDefault: Bool = false,
        isForced: Bool = false,
        codec: String? = nil,
        isExternal: Bool = false,
        externalFilename: String? = nil
    ) {
        self.id = id
        self.name = name
        self.language = language
        self.title = title
        self.isDefault = isDefault
        self.isForced = isForced
        self.codec = codec
        self.isExternal = isExternal
        self.externalFilename = externalFilename
    }
}

/// A timed subtitle cue in source-clock seconds. Text cues carry `text`.
/// Bitmap cues carry a pre-rendered `bitmap` positioned by `normalizedRect`
/// within `canvasSize`, the authored composition canvas that gets mapped onto
/// the video rect width-aligned and center-anchored, with the pixel size
/// fields as a fallback when no canvas is known.
struct SubtitleEvent {
    let startTime: TimeInterval
    let endTime: TimeInterval
    let text: String?
    let bitmap: CGImage?
    let bitmapWidth: Int
    let bitmapHeight: Int
    var normalizedRect: CGRect? = nil
    var canvasSize: CGSize? = nil
}
