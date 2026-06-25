import Foundation
import CoreGraphics
#if canImport(Libass)
import Libass
#endif

enum AssRenderResult {
    case unchanged
    case cleared
    case image(CGImage)
}

final class AssRenderer {

#if canImport(Libass)
    private var library: OpaquePointer?
    private var renderer: OpaquePointer?
    private var track: UnsafeMutablePointer<ASS_Track>?
    private var frameWidth: Int32 = 0
    private var frameHeight: Int32 = 0

    func configure(header: Data?) -> Bool {
        close()
        guard let library = ass_library_init() else { return false }
        self.library = library
        guard let renderer = ass_renderer_init(library) else {
            close()
            return false
        }
        self.renderer = renderer
        ass_set_fonts(renderer, nil, "Sans", 1, nil, 1)
        guard let track = ass_new_track(library) else {
            close()
            return false
        }
        self.track = track
        if let header, !header.isEmpty {
            header.withUnsafeBytes { raw in
                if let base = raw.bindMemory(to: CChar.self).baseAddress {
                    ass_process_codec_private(track, base, Int32(header.count))
                }
            }
        }
        return true
    }

    func setFrameSize(width: Int32, height: Int32) {
        guard let renderer, width > 0, height > 0 else { return }
        if width == frameWidth && height == frameHeight { return }
        frameWidth = width
        frameHeight = height
        ass_set_storage_size(renderer, width, height)
        ass_set_frame_size(renderer, width, height)
    }

    func processEvent(_ assLine: String, startMs: Int64, durationMs: Int64) {
        guard let track else { return }
        assLine.withCString { ptr in
            ass_process_chunk(track, ptr, Int32(strlen(ptr)), startMs, max(0, durationMs))
        }
    }

    func render(atTimeMs ms: Int64) -> AssRenderResult {
        guard let renderer, let track, frameWidth > 0, frameHeight > 0 else {
            return .unchanged
        }
        var changed: Int32 = 0
        let first = ass_render_frame(renderer, track, ms, &changed)
        if changed == 0 {
            return .unchanged
        }
        guard let first else {
            return .cleared
        }
        if let image = composite(first) {
            return .image(image)
        }
        return .cleared
    }

    func reset() {
        if let track {
            ass_flush_events(track)
        }
        frameWidth = 0
        frameHeight = 0
    }

    func close() {
        if let track {
            ass_free_track(track)
            self.track = nil
        }
        if let renderer {
            ass_renderer_done(renderer)
            self.renderer = nil
        }
        if let library {
            ass_library_done(library)
            self.library = nil
        }
        frameWidth = 0
        frameHeight = 0
    }

    deinit {
        close()
    }

    private func composite(_ first: UnsafeMutablePointer<ASS_Image>) -> CGImage? {
        let width = Int(frameWidth)
        let height = Int(frameHeight)
        let bytesPerRow = width * 4
        let dest = UnsafeMutablePointer<UInt8>.allocate(capacity: bytesPerRow * height)
        dest.initialize(repeating: 0, count: bytesPerRow * height)
        defer { dest.deallocate() }

        var node: UnsafeMutablePointer<ASS_Image>? = first
        while let current = node {
            let image = current.pointee
            blend(image, into: dest, width: width, height: height, bytesPerRow: bytesPerRow)
            node = image.next
        }

        guard let provider = CGDataProvider(
            data: Data(bytes: dest, count: bytesPerRow * height) as CFData
        ) else { return nil }

        return CGImage(
            width: width,
            height: height,
            bitsPerComponent: 8,
            bitsPerPixel: 32,
            bytesPerRow: bytesPerRow,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue),
            provider: provider,
            decode: nil,
            shouldInterpolate: false,
            intent: .defaultIntent
        )
    }

    private func blend(
        _ image: ASS_Image,
        into dest: UnsafeMutablePointer<UInt8>,
        width: Int,
        height: Int,
        bytesPerRow: Int
    ) {
        guard let bitmap = image.bitmap, image.w > 0, image.h > 0 else { return }
        let r = Int((image.color >> 24) & 0xFF)
        let g = Int((image.color >> 16) & 0xFF)
        let b = Int((image.color >> 8) & 0xFF)
        let opacity = 255 - Int(image.color & 0xFF)
        guard opacity > 0 else { return }

        let stride = Int(image.stride)
        let imgW = Int(image.w)
        let imgH = Int(image.h)
        let originX = Int(image.dst_x)
        let originY = Int(image.dst_y)

        for y in 0..<imgH {
            let destY = originY + y
            if destY < 0 || destY >= height { continue }
            let rowBase = y * stride
            let destRow = destY * bytesPerRow
            for x in 0..<imgW {
                let coverage = Int(bitmap[rowBase + x])
                if coverage == 0 { continue }
                let destX = originX + x
                if destX < 0 || destX >= width { continue }
                let alpha = coverage * opacity / 255
                if alpha == 0 { continue }
                let inverse = 255 - alpha
                let offset = destRow + destX * 4
                dest[offset] = UInt8((r * alpha + Int(dest[offset]) * inverse) / 255)
                dest[offset + 1] = UInt8((g * alpha + Int(dest[offset + 1]) * inverse) / 255)
                dest[offset + 2] = UInt8((b * alpha + Int(dest[offset + 2]) * inverse) / 255)
                dest[offset + 3] = UInt8(alpha + Int(dest[offset + 3]) * inverse / 255)
            }
        }
    }
#else
    func configure(header: Data?) -> Bool { false }
    func setFrameSize(width: Int32, height: Int32) {}
    func processEvent(_ assLine: String, startMs: Int64, durationMs: Int64) {}
    func render(atTimeMs ms: Int64) -> AssRenderResult { .unchanged }
    func reset() {}
    func close() {}
#endif
}
