import AVFoundation
import Foundation
import libretro_host

// Plays the host's audio through an AVAudioSourceNode that pulls interleaved S16
// from the host ring. While it runs the host paces on the buffer fill, so audio
// is the emulation clock.
final class GameAudioOutput {
  private let engine = AVAudioEngine()
  private let host: OpaquePointer
  private var sourceNode: AVAudioSourceNode?

  // Scratch for one render pull, sized generously so the audio thread never
  // allocates.
  private let scratchFrames = 8192
  private let scratch: UnsafeMutablePointer<Int16>

  #if os(iOS)
    private var interruptionObserver: NSObjectProtocol?
  #endif

  init(host: OpaquePointer) {
    self.host = host
    scratch = UnsafeMutablePointer<Int16>.allocate(capacity: scratchFrames * 2)
    #if os(iOS)
      // A call or Siri deactivates the session, so resume when it hands back.
      interruptionObserver = NotificationCenter.default.addObserver(
        forName: AVAudioSession.interruptionNotification, object: nil,
        queue: .main
      ) { [weak self] note in
        self?.handleInterruption(note)
      }
    #endif
  }

  deinit {
    #if os(iOS)
      if let observer = interruptionObserver {
        NotificationCenter.default.removeObserver(observer)
      }
    #endif
    scratch.deallocate()
  }

  func start(sampleRate: Double) -> Bool {
    guard
      let format = AVAudioFormat(
        commonFormat: .pcmFormatFloat32, sampleRate: sampleRate, channels: 2,
        interleaved: false)
    else { return false }

    let host = self.host
    let scratch = self.scratch
    let maxFrames = scratchFrames
    let node = AVAudioSourceNode(format: format) {
      _, _, frameCount, audioBufferList -> OSStatus in
      let frames = min(Int(frameCount), maxFrames)
      _ = lh_read_audio(host, scratch, Int32(frames))
      let buffers = UnsafeMutableAudioBufferListPointer(audioBufferList)
      guard buffers.count >= 2,
        let left = buffers[0].mData?.assumingMemoryBound(to: Float.self),
        let right = buffers[1].mData?.assumingMemoryBound(to: Float.self)
      else { return noErr }
      for i in 0..<frames {
        left[i] = Float(scratch[i * 2]) / 32768.0
        right[i] = Float(scratch[i * 2 + 1]) / 32768.0
      }
      for i in frames..<Int(frameCount) {
        left[i] = 0
        right[i] = 0
      }
      return noErr
    }
    sourceNode = node
    engine.attach(node)
    engine.connect(node, to: engine.mainMixerNode, format: format)
    #if os(iOS)
      activateSession()
    #endif
    do {
      try engine.start()
      lh_set_audio_paced(host, 1)
      return true
    } catch {
      return false
    }
  }

  func setPaused(_ paused: Bool) {
    if paused {
      engine.pause()
    } else {
      try? engine.start()
    }
  }

  func stop() {
    engine.stop()
    if let node = sourceNode {
      engine.detach(node)
      sourceNode = nil
    }
    lh_set_audio_paced(host, 0)
    #if os(iOS)
      deactivateSession()
    #endif
  }

  #if os(iOS)
    // macOS has no audio session. On iOS AVAudioEngine stays silent until one is
    // active. Playback category so a game is heard with the ring switch on.
    private func activateSession() {
      let session = AVAudioSession.sharedInstance()
      try? session.setCategory(.playback, mode: .default)
      try? session.setActive(true)
    }

    private func deactivateSession() {
      try? AVAudioSession.sharedInstance().setActive(
        false, options: .notifyOthersOnDeactivation)
    }

    private func handleInterruption(_ note: Notification) {
      guard
        let raw = note.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt,
        let type = AVAudioSession.InterruptionType(rawValue: raw)
      else { return }
      switch type {
      case .began:
        engine.pause()
      case .ended:
        activateSession()
        try? engine.start()
      @unknown default:
        break
      }
    }
  #endif
}
