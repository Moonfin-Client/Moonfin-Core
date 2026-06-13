import AVKit
import CoreMedia
import UIKit

@MainActor
final class DisplayCriteriaManager {

    static let shared = DisplayCriteriaManager()
    private init() {}

    func applyNative(formatDescription: CMVideoFormatDescription, refreshRate: Float) {
        guard let manager = displayManager() else { return }
        guard manager.isDisplayCriteriaMatchingEnabled else { return }
        if #available(tvOS 17.0, *) {
            manager.preferredDisplayCriteria = AVDisplayCriteria(
                refreshRate: refreshRate,
                formatDescription: formatDescription
            )
        } else {
            manager.preferredDisplayCriteria = nil
        }
    }

    func reset() {
        displayManager()?.preferredDisplayCriteria = nil
    }

    func applyForStream(
        codec: String?, width: Int, height: Int, frameRate: Double, rangeType: String?
    ) {
        guard let window = activeWindow(), let manager = displayManager(for: window)
        else { return }
        guard manager.isDisplayCriteriaMatchingEnabled else { return }
        guard #available(tvOS 17.0, *) else { return }
        let dynamicRange = Self.dynamicRange(from: rangeType)
        let refreshRate = resolvedRefreshRate(frameRate: frameRate, screen: window.screen)
        guard
            let formatDescription = makeFormatDescription(
                codec: codec, width: width, height: height, dynamicRange: dynamicRange)
        else { return }
        manager.preferredDisplayCriteria = AVDisplayCriteria(
            refreshRate: refreshRate, formatDescription: formatDescription)
    }

    private func activeWindow() -> UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first { $0.activationState == .foregroundActive }?
            .windows
            .first { $0.isKeyWindow }
    }

    private func displayManager() -> AVDisplayManager? {
        guard let window = activeWindow() else { return nil }
        return displayManager(for: window)
    }

    private func displayManager(for window: UIWindow) -> AVDisplayManager? {
        guard window.responds(to: NSSelectorFromString("avDisplayManager")) else {
            return nil
        }
        return window.avDisplayManager
    }

    private func resolvedRefreshRate(frameRate: Double, screen: UIScreen) -> Float {
        let safe = (frameRate.isFinite && frameRate > 0) ? frameRate : 24
        let screenMax = Float(max(1, screen.maximumFramesPerSecond))
        return min(Float(safe), screenMax)
    }

    private func makeFormatDescription(
        codec: String?, width: Int, height: Int, dynamicRange: VideoDynamicRange
    ) -> CMFormatDescription? {
        let codecType = resolveCodecType(codec: codec, dynamicRange: dynamicRange)
        let w = Int32(max(16, width <= 0 ? 3840 : width))
        let h = Int32(max(16, height <= 0 ? 2160 : height))
        let extensions = makeColorExtensions(dynamicRange: dynamicRange)
        var formatDescription: CMFormatDescription?
        let status = CMVideoFormatDescriptionCreate(
            allocator: kCFAllocatorDefault,
            codecType: codecType,
            width: w,
            height: h,
            extensions: extensions,
            formatDescriptionOut: &formatDescription)
        guard status == noErr else { return nil }
        return formatDescription
    }

    private func resolveCodecType(codec: String?, dynamicRange: VideoDynamicRange)
        -> CMVideoCodecType
    {
        if dynamicRange == .dolbyVision {
            return kCMVideoCodecType_DolbyVisionHEVC
        }
        switch codec?.lowercased() {
        case "hevc", "h265":
            return kCMVideoCodecType_HEVC
        case "av1":
            return kCMVideoCodecType_AV1
        case "vp9":
            return kCMVideoCodecType_VP9
        default:
            return kCMVideoCodecType_H264
        }
    }

    private func makeColorExtensions(dynamicRange: VideoDynamicRange) -> CFDictionary {
        var dict: [CFString: CFString] = [:]
        switch dynamicRange {
        case .hdr10, .hdr10Plus, .dolbyVision:
            dict[kCMFormatDescriptionExtension_ColorPrimaries] =
                kCMFormatDescriptionColorPrimaries_ITU_R_2020
            dict[kCMFormatDescriptionExtension_TransferFunction] =
                kCMFormatDescriptionTransferFunction_SMPTE_ST_2084_PQ
            dict[kCMFormatDescriptionExtension_YCbCrMatrix] =
                kCMFormatDescriptionYCbCrMatrix_ITU_R_2020
        case .hlg:
            dict[kCMFormatDescriptionExtension_ColorPrimaries] =
                kCMFormatDescriptionColorPrimaries_ITU_R_2020
            dict[kCMFormatDescriptionExtension_TransferFunction] =
                kCMFormatDescriptionTransferFunction_ITU_R_2100_HLG
            dict[kCMFormatDescriptionExtension_YCbCrMatrix] =
                kCMFormatDescriptionYCbCrMatrix_ITU_R_2020
        case .sdr, .unknown:
            break
        }
        return dict as CFDictionary
    }

    private static func dynamicRange(from rangeType: String?) -> VideoDynamicRange {
        let value = (rangeType ?? "").uppercased()
        if value.contains("DOVI") || value.contains("DOLBYVISION") { return .dolbyVision }
        if value.contains("HDR10PLUS") || value.contains("HDR10+") { return .hdr10Plus }
        if value.contains("HLG") { return .hlg }
        if value.contains("HDR") { return .hdr10 }
        return .sdr
    }
}
