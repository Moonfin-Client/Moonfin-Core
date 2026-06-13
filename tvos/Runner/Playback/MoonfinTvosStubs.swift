import Foundation
import UIKit

protocol StringRepresentableEnum {
    var rawValue: String { get }
    init?(rawValue: String)
}

enum AppConstants {
    static let clientVersion =
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
}

enum VideoDynamicRange: String {
    case sdr
    case hdr10
    case hlg
    case hdr10Plus
    case dolbyVision
    case unknown
}

enum PlaybackBackendDirective: String {
    case mpv
    case native
}

enum VideoCapabilityDetector {
    enum AppleTVGeneration: String {
        case hd
        case k4Gen1
        case k4Gen2
        case k4Gen3
        case unknown
    }

    static func deviceModelIdentifier() -> String {
        var size = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        guard size > 0 else { return "" }
        var machine = [CChar](repeating: 0, count: size)
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: machine)
    }

    static func currentGeneration() -> AppleTVGeneration {
        switch deviceModelIdentifier() {
        case "AppleTV5,3": return .hd
        case "AppleTV6,2": return .k4Gen1
        case "AppleTV11,1": return .k4Gen2
        case "AppleTV14,1": return .k4Gen3
        default: return .unknown
        }
    }

    static func activeScreen() -> UIScreen {
        if let sceneScreen = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive })?
            .screen
        {
            return sceneScreen
        }
        return UIScreen.main
    }

    static func displaySupportsHdr() -> Bool {
        let supportsHdr10: Bool
        switch currentGeneration() {
        case .hd:
            supportsHdr10 = false
        case .k4Gen1, .k4Gen2, .k4Gen3, .unknown:
            supportsHdr10 = true
        }
        return supportsHdr10 && activeScreen().traitCollection.displayGamut == .P3
    }

    static func dynamicRange(fromRangeType rangeType: String?) -> VideoDynamicRange {
        let value = (rangeType ?? "").uppercased()
        if value.contains("DOVI") || value.contains("DOLBYVISION") { return .dolbyVision }
        if value.contains("HDR10PLUS") || value.contains("HDR10+") { return .hdr10Plus }
        if value.contains("HLG") { return .hlg }
        if value.contains("HDR") { return .hdr10 }
        return .sdr
    }

    static func deviceProfileCapabilities() -> [String: Any] {
        let is4K: Bool
        let hdr10Gen: Bool
        let hdr10PlusGen: Bool
        let dolbyVisionGen: Bool
        switch currentGeneration() {
        case .hd:
            is4K = false
            hdr10Gen = false
            hdr10PlusGen = false
            dolbyVisionGen = false
        case .k4Gen1:
            is4K = true
            hdr10Gen = true
            hdr10PlusGen = false
            dolbyVisionGen = true
        case .k4Gen2:
            is4K = true
            hdr10Gen = true
            hdr10PlusGen = false
            dolbyVisionGen = true
        case .k4Gen3:
            is4K = true
            hdr10Gen = true
            hdr10PlusGen = true
            dolbyVisionGen = true
        case .unknown:
            is4K = true
            hdr10Gen = true
            hdr10PlusGen = false
            dolbyVisionGen = true
        }

        let sinkHdrCapable = displaySupportsHdr()
        let hdr10 = hdr10Gen && sinkHdrCapable
        let hdr10Plus = hdr10PlusGen && sinkHdrCapable
        let dolbyVision = dolbyVisionGen && sinkHdrCapable
        let width = is4K ? 3840 : 1920
        let height = is4K ? 2160 : 1080
        return [
            "supportsAvc": true,
            "avcMainLevel": 52,
            "supportsAvcHigh10": true,
            "avcHigh10Level": 52,
            "supportsHevc": true,
            "hevcMainLevel": 153,
            "supportsHevcMain10": true,
            "hevcMain10Level": 153,
            "supportsHevcDolbyVision": dolbyVision,
            "supportsHevcDolbyVisionEl": false,
            "supportsHevcHdr10": hdr10,
            "supportsHevcHdr10Plus": hdr10Plus,
            "supportsDvP5": dolbyVision,
            "supportsDvP7": dolbyVision,
            "supportsDvP8": dolbyVision,
            "knownHevcDoviHdr10PlusBug": false,
            "maxResolutionAvc": ["width": width, "height": height],
            "maxResolutionHevc": ["width": width, "height": height],
            "deviceModel": deviceModelIdentifier(),
            "clientVersion": AppConstants.clientVersion,
        ]
    }
}

enum PlaybackQualityProfile: String {
    case auto
    case compatibility
    case highQuality

    static func recommended(for generation: VideoCapabilityDetector.AppleTVGeneration)
        -> PlaybackQualityProfile
    {
        return .compatibility
    }
}
