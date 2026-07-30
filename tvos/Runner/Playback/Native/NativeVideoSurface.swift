import AVFoundation
import CoreMedia
import UIKit
import Darwin

final class NativeVideoSurface {
    private weak var hostView: UIView?
    private let displayLayer = AVSampleBufferDisplayLayer()
    private let enqueueQueue = DispatchQueue(label: "nativeVideoSurface.enqueue")
    private var pendingFrames: [(CVPixelBuffer, CMTime, CMTime)] = []
    private let lock = NSLock()
    private var requestingData = false
    private var activeFormatDescription: CMVideoFormatDescription?
    private var activeDynamicRange: VideoDynamicRange = .unknown
    private var blackFrameCache: CVPixelBuffer?
    private var blackFrameCacheWidth: Int = 0
    private var blackFrameCacheHeight: Int = 0

    init() {
        displayLayer.backgroundColor = UIColor.black.cgColor
        displayLayer.videoGravity = .resizeAspect
        displayLayer.preventsDisplaySleepDuringVideoPlayback = true
        displayLayer.isOpaque = true
    }

    func attach(to view: UIView) {
        hostView = view
        displayLayer.removeFromSuperlayer()
        view.layer.addSublayer(displayLayer)
        updateLayout()
        beginRequestingMediaData()
    }

    func updateLayout() {
        guard let hostView else { return }
        let bounds = hostView.bounds
        if displayLayer.frame != bounds {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            displayLayer.frame = bounds
            CATransaction.commit()
        }
    }

    func setFormatDescription(_ formatDescription: CMVideoFormatDescription?) {
        lock.lock()
        activeFormatDescription = formatDescription
        lock.unlock()
    }

    func setDynamicRange(_ dynamicRange: VideoDynamicRange) {
        lock.lock()
        activeDynamicRange = dynamicRange
        lock.unlock()
    }

    func enqueue(pixelBuffer: CVPixelBuffer, pts: CMTime, duration: CMTime) {
        attachColorMetadata(to: pixelBuffer)
        lock.lock()
        pendingFrames.append((pixelBuffer, pts, duration))
        lock.unlock()
    }

    func flush() {
        lock.lock()
        pendingFrames.removeAll()
        lock.unlock()
        if #available(tvOS 11.0, *) {
            displayLayer.flushAndRemoveImage()
        } else {
            displayLayer.flush()
        }
        enqueueFallbackBlackFrameIfPossible()
    }

    func primeAfterWake() {
        displayLayer.backgroundColor = UIColor.black.cgColor
        displayLayer.isOpaque = true
        updateLayout()
        beginRequestingMediaData()
        enqueueFallbackBlackFrameIfPossible()
    }

    func teardown() {
        stopRequestingMediaData()
        lock.lock()
        pendingFrames.removeAll()
        activeFormatDescription = nil
        blackFrameCache = nil
        blackFrameCacheWidth = 0
        blackFrameCacheHeight = 0
        lock.unlock()
        if #available(tvOS 11.0, *) {
            displayLayer.flushAndRemoveImage()
        } else {
            displayLayer.flush()
        }
        displayLayer.removeFromSuperlayer()
        hostView = nil
    }

    func setVideoGravity(_ mode: ZoomMode) {
        switch mode {
        case .fit:
            displayLayer.videoGravity = .resizeAspect
        case .autoCrop:
            displayLayer.videoGravity = .resizeAspectFill
        case .stretch:
            displayLayer.videoGravity = .resize
        }
    }

    // MARK: - Pull-based enqueue

    private func beginRequestingMediaData() {
        guard !requestingData else { return }
        requestingData = true
        displayLayer.requestMediaDataWhenReady(on: enqueueQueue) { [weak self] in
            self?.drainPendingFrames()
        }
    }

    private func stopRequestingMediaData() {
        requestingData = false
        displayLayer.stopRequestingMediaData()
    }

    private func drainPendingFrames() {
        while displayLayer.isReadyForMoreMediaData {
            lock.lock()
            guard !pendingFrames.isEmpty else {
                lock.unlock()
                return
            }
            let (pixelBuffer, pts, duration) = pendingFrames.removeFirst()
            let fmtDesc = activeFormatDescription
            lock.unlock()

            guard let sampleBuffer = makeSampleBuffer(from: pixelBuffer, pts: pts, duration: duration, formatDescription: fmtDesc) else {
                continue
            }
            displayLayer.enqueue(sampleBuffer)
        }
    }

    // MARK: - CMSampleBuffer creation

    private func makeSampleBuffer(
        from pixelBuffer: CVPixelBuffer,
        pts: CMTime,
        duration: CMTime,
        formatDescription _: CMVideoFormatDescription?
    ) -> CMSampleBuffer? {
        // This surface receives decoded image buffers, so its sample format must
        // describe the CVPixelBuffer (for example, x420 video range), not the
        // compressed hvc1/dvh1 stream fed into VideoToolbox. Reusing the decoder
        // input description here can cause AVSampleBufferDisplayLayer to lose or
        // misinterpret the decoded buffer's range and HDR attachments, producing
        // elevated blacks. Keep the compressed description separately for
        // AVDisplayCriteria and source dimensions only.
        var imageDesc: CMVideoFormatDescription?
        let status = CMVideoFormatDescriptionCreateForImageBuffer(
            allocator: kCFAllocatorDefault,
            imageBuffer: pixelBuffer,
            formatDescriptionOut: &imageDesc
        )
        guard status == noErr, let fmt = imageDesc else { return nil }

        var timing = CMSampleTimingInfo(
            duration: duration,
            presentationTimeStamp: pts,
            decodeTimeStamp: .invalid
        )

        var sampleBuffer: CMSampleBuffer?
        let result = CMSampleBufferCreateReadyWithImageBuffer(
            allocator: kCFAllocatorDefault,
            imageBuffer: pixelBuffer,
            formatDescription: fmt,
            sampleTiming: &timing,
            sampleBufferOut: &sampleBuffer
        )
        guard result == noErr else { return nil }
        return sampleBuffer
    }

    private func attachColorMetadata(to pixelBuffer: CVPixelBuffer) {
        let dynamicRange: VideoDynamicRange
        lock.lock()
        dynamicRange = activeDynamicRange
        lock.unlock()

        switch dynamicRange {
        case .dolbyVision, .hdr10, .hdr10Plus:
            CVBufferSetAttachment(pixelBuffer, kCVImageBufferColorPrimariesKey, kCVImageBufferColorPrimaries_ITU_R_2020, .shouldPropagate)
            CVBufferSetAttachment(pixelBuffer, kCVImageBufferTransferFunctionKey, kCVImageBufferTransferFunction_SMPTE_ST_2084_PQ, .shouldPropagate)
            CVBufferSetAttachment(pixelBuffer, kCVImageBufferYCbCrMatrixKey, kCVImageBufferYCbCrMatrix_ITU_R_2020, .shouldPropagate)
        case .hlg:
            CVBufferSetAttachment(pixelBuffer, kCVImageBufferColorPrimariesKey, kCVImageBufferColorPrimaries_ITU_R_2020, .shouldPropagate)
            CVBufferSetAttachment(pixelBuffer, kCVImageBufferTransferFunctionKey, kCVImageBufferTransferFunction_ITU_R_2100_HLG, .shouldPropagate)
            CVBufferSetAttachment(pixelBuffer, kCVImageBufferYCbCrMatrixKey, kCVImageBufferYCbCrMatrix_ITU_R_2020, .shouldPropagate)
        case .sdr, .unknown:
            CVBufferSetAttachment(pixelBuffer, kCVImageBufferColorPrimariesKey, kCVImageBufferColorPrimaries_ITU_R_709_2, .shouldPropagate)
            CVBufferSetAttachment(pixelBuffer, kCVImageBufferTransferFunctionKey, kCVImageBufferTransferFunction_ITU_R_709_2, .shouldPropagate)
            CVBufferSetAttachment(pixelBuffer, kCVImageBufferYCbCrMatrixKey, kCVImageBufferYCbCrMatrix_ITU_R_709_2, .shouldPropagate)
        }
    }

    private func enqueueFallbackBlackFrameIfPossible() {
        guard hostView != nil else { return }

        let dimensions: CMVideoDimensions
        lock.lock()
        let formatDescription = activeFormatDescription
        lock.unlock()

        if let formatDescription {
            dimensions = CMVideoFormatDescriptionGetDimensions(formatDescription)
        } else {
            dimensions = CMVideoDimensions(width: 16, height: 16)
        }

        let width = max(16, Int(dimensions.width))
        let height = max(16, Int(dimensions.height))
        guard let pixelBuffer = blackFramePixelBuffer(width: width, height: height) else { return }

        attachColorMetadata(to: pixelBuffer)
        let duration = CMTime(value: 1, timescale: 60)
        guard let sampleBuffer = makeSampleBuffer(
            from: pixelBuffer,
            pts: .zero,
            duration: duration,
            formatDescription: nil
        ) else {
            return
        }

        displayLayer.enqueue(sampleBuffer)
    }

    private func blackFramePixelBuffer(width: Int, height: Int) -> CVPixelBuffer? {
        lock.lock()
        if let cached = blackFrameCache,
           blackFrameCacheWidth == width,
           blackFrameCacheHeight == height {
            lock.unlock()
            return cached
        }
        lock.unlock()

        var pixelBuffer: CVPixelBuffer?
        let attrs: [CFString: Any] = [
            kCVPixelBufferIOSurfacePropertiesKey: [:] as [String: Any]
        ]
        let status = CVPixelBufferCreate(
            kCFAllocatorDefault,
            width,
            height,
            kCVPixelFormatType_32BGRA,
            attrs as CFDictionary,
            &pixelBuffer
        )
        guard status == kCVReturnSuccess, let pixelBuffer else { return nil }

        CVPixelBufferLockBaseAddress(pixelBuffer, [])
        if let base = CVPixelBufferGetBaseAddress(pixelBuffer) {
            memset(base, 0, CVPixelBufferGetDataSize(pixelBuffer))
        }
        CVPixelBufferUnlockBaseAddress(pixelBuffer, [])

        lock.lock()
        blackFrameCache = pixelBuffer
        blackFrameCacheWidth = width
        blackFrameCacheHeight = height
        lock.unlock()
        return pixelBuffer
    }
}
