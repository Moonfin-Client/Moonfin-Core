import Foundation
import Darwin
import CoreGraphics
#if canImport(Libavcodec)
import Libavcodec
#endif

struct SubtitleEvent {
    let startTime: TimeInterval
    let endTime: TimeInterval
    let text: String?
    let assLine: String?
    let bitmap: CGImage?
    let bitmapX: Int
    let bitmapY: Int
    let bitmapWidth: Int
    let bitmapHeight: Int
}

final class SubtitleDecoder {

    private var codecCtx: UnsafeMutablePointer<AVCodecContext>?
    private(set) var codecId: UInt32 = 0
    private(set) var subtitleHeader: Data?

    // AVSubtitle offsets (FFmpeg 7.x, 64-bit)
    private static let subStartDisplayTimeOff = 0x04
    private static let subEndDisplayTimeOff = 0x08
    private static let subNumRectsOff = 0x0C
    private static let subRectsOff = 0x10
    private static let subPtsOff = 0x18
    private static let avSubtitleSize = 32

    // AVSubtitleRect offsets (FFmpeg 7.x, no deprecated pict field, 64-bit)
    private static let rectXOff = 0x00
    private static let rectYOff = 0x04
    private static let rectWOff = 0x08
    private static let rectHOff = 0x0C
    private static let rectData0Off = 0x18
    private static let rectData1Off = 0x20
    private static let rectLinesize0Off = 0x38
    private static let rectTypeOff = 0x48
    private static let rectTextOff = 0x50
    private static let rectAssOff = 0x58

    private static let SUBTITLE_BITMAP: Int32 = 1
    private static let SUBTITLE_TEXT: Int32 = 2
    private static let SUBTITLE_ASS: Int32 = 3

    init() {}

    deinit {
        close()
    }

    var isReady: Bool {
#if canImport(Libavcodec)
        return true
#else
        return false
#endif
    }

    func configure(codecId: UInt32, codecpar: UnsafeRawPointer) -> Bool {
#if canImport(Libavcodec)
        close()
        guard let decoder = avcodec_find_decoder(AVCodecID(codecId)) else { return false }
        guard let ctx = avcodec_alloc_context3(decoder) else { return false }
        codecCtx = ctx
        self.codecId = codecId

        let par = codecpar.assumingMemoryBound(to: AVCodecParameters.self)
        guard avcodec_parameters_to_context(ctx, par) >= 0 else {
            close()
            return false
        }
        guard avcodec_open2(ctx, decoder, nil) >= 0 else {
            close()
            return false
        }
        if let headerPtr = ctx.pointee.subtitle_header, ctx.pointee.subtitle_header_size > 0 {
            subtitleHeader = Data(bytes: headerPtr, count: Int(ctx.pointee.subtitle_header_size))
        } else {
            subtitleHeader = nil
        }
        return true
#else
        return false
#endif
    }

    func decodePacket(_ pkt: FFPacket, timeBase: (num: Int32, den: Int32)) -> SubtitleEvent? {
#if canImport(Libavcodec)
        guard let codecCtx else { return nil }

        let subBuf = UnsafeMutableRawPointer.allocate(byteCount: Self.avSubtitleSize, alignment: 8)
        subBuf.initializeMemory(as: UInt8.self, repeating: 0, count: Self.avSubtitleSize)
        defer {
            avsubtitle_free(subBuf.assumingMemoryBound(to: AVSubtitle.self))
            subBuf.deallocate()
        }

        var gotSub: Int32 = 0
        let pktPtr = pkt.rawPacket.assumingMemoryBound(to: AVPacket.self)
        let result = avcodec_decode_subtitle2(codecCtx, subBuf.assumingMemoryBound(to: AVSubtitle.self), &gotSub, pktPtr)
        guard result >= 0, gotSub > 0 else { return nil }

        let pts = subBuf.advanced(by: Self.subPtsOff).assumingMemoryBound(to: Int64.self).pointee
        let startMs = subBuf.advanced(by: Self.subStartDisplayTimeOff).assumingMemoryBound(to: UInt32.self).pointee
        let endMs = subBuf.advanced(by: Self.subEndDisplayTimeOff).assumingMemoryBound(to: UInt32.self).pointee
        let numRects = subBuf.advanced(by: Self.subNumRectsOff).assumingMemoryBound(to: UInt32.self).pointee
        let rectsPtr = subBuf.advanced(by: Self.subRectsOff)
            .assumingMemoryBound(to: UnsafeMutablePointer<UnsafeMutableRawPointer?>?.self).pointee

        guard numRects > 0, let rectsPtr else { return nil }

        let ptsSeconds: Double
        if pts != Int64(bitPattern: 0x8000000000000000) {
            ptsSeconds = Double(pts) / 1_000_000.0
        } else {
            ptsSeconds = Double(pkt.pts) * Double(timeBase.num) / Double(timeBase.den)
        }

        let startTime = ptsSeconds + Double(startMs) / 1000.0
        let endTime: TimeInterval
        if endMs > startMs {
            endTime = ptsSeconds + Double(endMs) / 1000.0
        } else {
            endTime = startTime + 5.0
        }

        guard let rectPtr = rectsPtr[0] else { return nil }
        let rectType = rectPtr.advanced(by: Self.rectTypeOff).assumingMemoryBound(to: Int32.self).pointee

        switch rectType {
        case Self.SUBTITLE_TEXT:
            return decodeTextRect(rectPtr, startTime: startTime, endTime: endTime)
        case Self.SUBTITLE_ASS:
            return decodeASSRect(rectPtr, startTime: startTime, endTime: endTime)
        case Self.SUBTITLE_BITMAP:
            return decodeBitmapRect(rectPtr, startTime: startTime, endTime: endTime)
        default:
            return nil
        }
#else
        return nil
#endif
    }

    func flush() {
#if canImport(Libavcodec)
        guard let codecCtx else { return }
        avcodec_flush_buffers(codecCtx)
#endif
    }

    func close() {
#if canImport(Libavcodec)
        if codecCtx != nil {
            avcodec_free_context(&codecCtx)
        }
#endif
        codecCtx = nil
        codecId = 0
        subtitleHeader = nil
    }

    // MARK: - Rect decoding

    private func decodeTextRect(
        _ rect: UnsafeMutableRawPointer,
        startTime: TimeInterval,
        endTime: TimeInterval
    ) -> SubtitleEvent? {
        let textPtr = rect.advanced(by: Self.rectTextOff)
            .assumingMemoryBound(to: UnsafePointer<CChar>?.self).pointee
        guard let textPtr else { return nil }
        let text = String(cString: textPtr)
        guard !text.isEmpty else { return nil }
        return SubtitleEvent(
            startTime: startTime, endTime: endTime,
            text: text, assLine: nil, bitmap: nil,
            bitmapX: 0, bitmapY: 0, bitmapWidth: 0, bitmapHeight: 0
        )
    }

    private func decodeASSRect(
        _ rect: UnsafeMutableRawPointer,
        startTime: TimeInterval,
        endTime: TimeInterval
    ) -> SubtitleEvent? {
        let assPtr = rect.advanced(by: Self.rectAssOff)
            .assumingMemoryBound(to: UnsafePointer<CChar>?.self).pointee
        guard let assPtr else { return nil }
        let raw = String(cString: assPtr)
        let text = Self.stripASSFormatting(raw)
        guard !text.isEmpty || !raw.isEmpty else { return nil }
        return SubtitleEvent(
            startTime: startTime, endTime: endTime,
            text: text, assLine: raw, bitmap: nil,
            bitmapX: 0, bitmapY: 0, bitmapWidth: 0, bitmapHeight: 0
        )
    }

    private func decodeBitmapRect(
        _ rect: UnsafeMutableRawPointer,
        startTime: TimeInterval,
        endTime: TimeInterval
    ) -> SubtitleEvent? {
        let x = Int(rect.advanced(by: Self.rectXOff).assumingMemoryBound(to: Int32.self).pointee)
        let y = Int(rect.advanced(by: Self.rectYOff).assumingMemoryBound(to: Int32.self).pointee)
        let w = Int(rect.advanced(by: Self.rectWOff).assumingMemoryBound(to: Int32.self).pointee)
        let h = Int(rect.advanced(by: Self.rectHOff).assumingMemoryBound(to: Int32.self).pointee)
        let pixelData = rect.advanced(by: Self.rectData0Off)
            .assumingMemoryBound(to: UnsafeMutablePointer<UInt8>?.self).pointee
        let palette = rect.advanced(by: Self.rectData1Off)
            .assumingMemoryBound(to: UnsafeMutablePointer<UInt8>?.self).pointee
        let linesize = Int(rect.advanced(by: Self.rectLinesize0Off).assumingMemoryBound(to: Int32.self).pointee)

        guard w > 0, h > 0, let pixelData, let palette, linesize > 0 else { return nil }
        guard let bitmap = Self.convertPaletteBitmap(
            pixels: pixelData, palette: palette,
            width: w, height: h, linesize: linesize
        ) else { return nil }

        return SubtitleEvent(
            startTime: startTime, endTime: endTime,
            text: nil, assLine: nil, bitmap: bitmap,
            bitmapX: x, bitmapY: y, bitmapWidth: w, bitmapHeight: h
        )
    }

    // MARK: - ASS formatting

    static func stripASSFormatting(_ line: String) -> String {
        // ASS event: ReadOrder,Layer,Style,Name,MarginL,MarginR,MarginV,Effect,Text
        var commaCount = 0
        var textStart = line.startIndex
        for i in line.indices {
            if line[i] == "," {
                commaCount += 1
                if commaCount == 8 {
                    textStart = line.index(after: i)
                    break
                }
            }
        }
        let raw = commaCount >= 8 ? String(line[textStart...]) : line
        var result = ""
        var inTag = false
        for ch in raw {
            if ch == "{" { inTag = true; continue }
            if ch == "}" { inTag = false; continue }
            if !inTag { result.append(ch) }
        }
        result = result.replacingOccurrences(of: "\\N", with: "\n")
        result = result.replacingOccurrences(of: "\\n", with: "\n")
        return result.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    // MARK: - Bitmap conversion

    private static func convertPaletteBitmap(
        pixels: UnsafeMutablePointer<UInt8>,
        palette: UnsafeMutablePointer<UInt8>,
        width: Int, height: Int, linesize: Int
    ) -> CGImage? {
        let rgbaData = UnsafeMutablePointer<UInt8>.allocate(capacity: width * height * 4)
        defer { rgbaData.deallocate() }

        for row in 0..<height {
            for col in 0..<width {
                let idx = Int(pixels[row * linesize + col])
                let pOff = idx * 4
                let dOff = (row * width + col) * 4
                // PAL8 palette is BGRA on little-endian
                rgbaData[dOff + 0] = palette[pOff + 2]
                rgbaData[dOff + 1] = palette[pOff + 1]
                rgbaData[dOff + 2] = palette[pOff + 0]
                rgbaData[dOff + 3] = palette[pOff + 3]
            }
        }

        guard let ctx = CGContext(
            data: rgbaData,
            width: width, height: height,
            bitsPerComponent: 8, bytesPerRow: width * 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        ) else { return nil }
        return ctx.makeImage()
    }

}
