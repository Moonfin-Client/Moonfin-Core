import CoreVideo
#if canImport(FlutterMacOS)
import FlutterMacOS
#else
import Flutter
#endif
import Foundation
import libretro_host

// Serves the host's converted frames to Flutter as an external texture. The host
// already writes BGRA, so this copies straight into a 32BGRA CVPixelBuffer.
final class GameVideoOutput: NSObject, FlutterTexture {
  private let textures: FlutterTextureRegistry
  private let host: OpaquePointer
  private(set) var textureId: Int64 = -1

  private var pool: CVPixelBufferPool?
  private var poolWidth = 0
  private var poolHeight = 0
  private var alive = true
  private let lock = NSLock()

  init(textures: FlutterTextureRegistry, host: OpaquePointer) {
    self.textures = textures
    self.host = host
    super.init()
    textureId = textures.register(self)
  }

  func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
    lock.lock()
    defer { lock.unlock() }
    guard alive else { return nil }

    var data: UnsafeRawPointer?
    var width: Int32 = 0
    var height: Int32 = 0
    var stride: Int32 = 0
    guard lh_get_frame(host, &data, &width, &height, &stride) == 1,
      let src = data, width > 0, height > 0
    else { return nil }

    let w = Int(width)
    let h = Int(height)
    if pool == nil || poolWidth != w || poolHeight != h {
      pool = Self.makePool(width: w, height: h)
      poolWidth = w
      poolHeight = h
    }
    guard let pool else { return nil }

    var pbOut: CVPixelBuffer?
    guard CVPixelBufferPoolCreatePixelBuffer(nil, pool, &pbOut) == kCVReturnSuccess,
      let pb = pbOut
    else { return nil }

    CVPixelBufferLockBaseAddress(pb, [])
    if let dst = CVPixelBufferGetBaseAddress(pb) {
      let dstStride = CVPixelBufferGetBytesPerRow(pb)
      let srcStride = Int(stride)
      let rowBytes = min(dstStride, srcStride)
      for row in 0..<h {
        memcpy(
          dst.advanced(by: row * dstStride), src.advanced(by: row * srcStride),
          rowBytes)
      }
    }
    CVPixelBufferUnlockBaseAddress(pb, [])
    return Unmanaged.passRetained(pb)
  }

  // Called from the host run loop when a new frame is ready.
  func frameAvailable() {
    let id = textureId
    lock.lock()
    let isAlive = alive
    lock.unlock()
    guard isAlive else { return }
    DispatchQueue.main.async { [weak self] in
      self?.textures.textureFrameAvailable(id)
    }
  }

  func teardown() {
    lock.lock()
    alive = false
    lock.unlock()
    textures.unregisterTexture(textureId)
  }

  private static func makePool(width: Int, height: Int) -> CVPixelBufferPool? {
    let attrs: [String: Any] = [
      kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
      kCVPixelBufferWidthKey as String: width,
      kCVPixelBufferHeightKey as String: height,
      kCVPixelBufferIOSurfacePropertiesKey as String: [:] as [String: Any],
      kCVPixelBufferMetalCompatibilityKey as String: true,
    ]
    var pool: CVPixelBufferPool?
    CVPixelBufferPoolCreate(nil, nil, attrs as CFDictionary, &pool)
    return pool
  }
}
