import AVFoundation
import Foundation
import UIKit

enum AppConstants {
    static let clientVersion =
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
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

    /// Whether the connected television can show HDR. The caller pairs this
    /// with what the box itself decodes.
    ///
    /// The display gamut trait reports the mode the box is outputting rather
    /// than what the set accepts, so a television sitting in SDR reads as
    /// having no HDR and every HDR title goes back for a tone mapping transcode
    /// the server cannot produce fast enough to play. AVFoundation answers for
    /// the display, so ask it first and let the trait fill in when it reports
    /// nothing.
    static func displaySupportsHdr() -> Bool {
        if !AVPlayer.availableHDRModes.isEmpty {
            return true
        }
        return activeScreen().traitCollection.displayGamut == .P3
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

        // AV1 has no hardware decoder on any Apple TV, so AetherEngine decodes
        // it in software with dav1d. Only advertise it on A12+ boxes and cap it
        // at 1080p so a 4K AV1 rip transcodes instead of stuttering.
        let generation = currentGeneration()
        let softwareAv1 = generation == .k4Gen2 || generation == .k4Gen3

        // Apple TV HD is an A8 with no HEVC decoder, and not enough headroom to
        // decode HEVC, High 10 or VC-1 in software either. Claiming them made
        // the server direct play files the box then couldn't decode, so nothing
        // played. Advertising H.264 only gets those transcoded instead.
        let isHd = generation == .hd
        let avcLevel = isHd ? 42 : 52

        return [
            "supportsAvc": true,
            "avcMainLevel": avcLevel,
            "supportsAvcHigh10": !isHd,
            "avcHigh10Level": avcLevel,
            "supportsHevc": !isHd,
            "hevcMainLevel": 153,
            "supportsHevcMain10": !isHd,
            "hevcMain10Level": 153,
            "supportsHevcDolbyVision": dolbyVision,
            // AetherEngine converts P7 dual-layer to P8.1 per-packet (libdovi),
            // so EL sources direct-play (base-layer quality, no FEL decode).
            "supportsHevcDolbyVisionEl": dolbyVision,
            "supportsHevcHdr10": hdr10,
            "supportsHevcHdr10Plus": hdr10Plus,
            "supportsDvP5": dolbyVision,
            "supportsDvP7": dolbyVision,
            "supportsDvP8": dolbyVision,
            "knownHevcDoviHdr10PlusBug": false,
            // Software decode paths (AVSampleBufferDisplayLayer): VP9, MPEG-2,
            // VC-1, interlaced H.264 all play without server transcode.
            "supportsVc1": !isHd,
            "supportsAv1": softwareAv1,
            "supportsAv1Main10": softwareAv1,
            "supportsAv1Hdr10": softwareAv1 && hdr10,
            "supportsAv1Hdr10Plus": false,
            "supportsAv1DolbyVision": false,
            "maxResolutionAvc": ["width": width, "height": height],
            "maxResolutionHevc": ["width": width, "height": height],
            "maxResolutionAv1": ["width": 1920, "height": 1080],
            "maxResolutionVc1": ["width": 1920, "height": 1080],
            "deviceModel": deviceModelIdentifier(),
            "clientVersion": AppConstants.clientVersion,
        ]
    }
}

