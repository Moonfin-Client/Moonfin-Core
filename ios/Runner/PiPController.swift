import AVKit
import CoreMedia
import CoreVideo

@available(iOS 15.0, *)
final class PiPController: NSObject {

  private static let isSimulator: Bool = {
    #if targetEnvironment(simulator)
      return true
    #else
      return false
    #endif
  }()

  static var isSupported: Bool {
    !isSimulator && AVPictureInPictureController.isPictureInPictureSupported()
  }

  static var unsupportedReason: String {
    if isSimulator {
      return "iOS Simulator does not support Picture in Picture for this player"
    }
    if !AVPictureInPictureController.isPictureInPictureSupported() {
      return "Picture in Picture is not supported on this device"
    }
    return "Picture in Picture is unavailable"
  }

  static func sharedFrameEventName(channel: String) -> Notification.Name {
    Notification.Name("\(channel).frame")
  }

  static func sharedPlaybackEventName(channel: String) -> Notification.Name {
    Notification.Name("\(channel).playback")
  }

  static func sharedControlEventName(channel: String, event: String) -> Notification.Name {
    Notification.Name("\(channel).\(event)")
  }

  // MARK: - Callbacks (set by AppDelegate)

  var onPiPStatusChanged: ((Bool) -> Void)?
  var onPiPAction: ((String) -> Void)?
  private var sharedFrameEventChannel: String?
  private var sharedFrameObserver: NSObjectProtocol?
  private var sharedPlaybackObserver: NSObjectProtocol?
  private var sharedFrameCount: Int = 0

  // MARK: - Private state

  private var displayLayer: AVSampleBufferDisplayLayer?
  private var layerHostView: UIView?
  private var pipController: AVPictureInPictureController?

  private var isActive = false
  private var isInPiP = false
  private var isPlaybackPaused = false
  private var isWarmedUp = false
  // Last frame from the bridge, kept even before the display layer exists so we can
  // prime PiP with a real frame instead of opening on a black layer.
  private var latestSampleBuffer: CMSampleBuffer?

  // Drives the PiP scrubber from the real media position so the window shows a
  // timeline instead of the LIVE badge. Fed by updateTimeline from Dart.
  private var controlTimebase: CMTimebase?
  private var currentTimeSeconds: Double = 0
  private var durationSeconds: Double = 0

  private(set) var lastErrorMessage: String?

  private var pendingPiPStart = false
  private var pipStartTimeoutItem: DispatchWorkItem?

  // MARK: - Initialization

  @discardableResult
  func configureSharedContextBridge(arguments: [String: Any]) -> Bool {
    guard let frameChannel = arguments["frameEventChannel"] as? String,
          !frameChannel.isEmpty else {
      setError("Missing frameEventChannel for sharedContextFork")
      return false
    }

    sharedFrameEventChannel = frameChannel
    installSharedContextObservers()
    lastErrorMessage = nil
    return true
  }

  /// Initialize the PiP controller and warm up the shared-context PiP pipeline.
  @discardableResult
  func initialize(mpvHandleAddress: Int64, viewController: UIViewController? = nil) -> Bool {
    guard Self.isSupported else {
      setError(Self.unsupportedReason)
      return false
    }
    guard sharedFrameEventChannel != nil else {
      setError("sharedContextFork requires configureSharedContextBridge before initialize")
      return false
    }
    lastErrorMessage = nil
    // Arm capture now even without a view controller. Under the scene lifecycle the
    // FlutterViewController can be nil when the mpv handle arrives, and without this
    // we would drop every frame for the session and PiP would open black.
    installSharedContextObservers()
    isActive = true
    if let vc = viewController {
      warmUpPiPPipeline(on: vc)
    }
    return true
  }

  // MARK: - PiP lifecycle

  @discardableResult
  func startPiP(on viewController: UIViewController) -> Bool {
    guard Self.isSupported else {
      setError(Self.unsupportedReason)
      return false
    }
    return startSharedContextPiP(on: viewController)
  }

  @discardableResult
  private func startSharedContextPiP(on viewController: UIViewController) -> Bool {
    guard sharedFrameEventChannel != nil else {
      setError("sharedContextFork requires configureSharedContextBridge before startPiP")
      return false
    }

    installSharedContextObservers()
    isActive = true
    guard setupPiPLayer(on: viewController) else {
      return false
    }

    // Prime the layer with the last frame so PiP never opens on an empty black layer.
    // This covers warm-up having run before a view controller was available.
    if let latest = latestSampleBuffer {
      displayLayer?.enqueue(latest)
      if sharedFrameCount == 0 { sharedFrameCount = 1 }
    }

    if sharedFrameCount > 0 {
      pipController?.startPictureInPicture()
      lastErrorMessage = nil
      return true
    }

    // No frame yet. Don't force-start on an empty layer, that is what shows black.
    // Wait briefly for the first frame, and give up if none arrives.
    pendingPiPStart = true
    pipStartTimeoutItem?.cancel()
    let timeoutItem = DispatchWorkItem { [weak self] in
      guard let self, self.pendingPiPStart else { return }
      self.pendingPiPStart = false
      if let latest = self.latestSampleBuffer {
        self.displayLayer?.enqueue(latest)
        self.pipController?.startPictureInPicture()
      } else {
        self.setError("PiP aborted: no video frame available")
        self.handlePiPTermination(notifyStopWhenNotWarmedUp: true)
      }
    }
    pipStartTimeoutItem = timeoutItem
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: timeoutItem)

    notifySharedBridge(event: "start")
    lastErrorMessage = nil
    return true
  }

  private func warmUpPiPPipeline(on viewController: UIViewController) {
    guard setupPiPLayer(on: viewController) else { return }
    isActive = true
    isWarmedUp = true
    notifySharedBridge(event: "start")
  }

  @discardableResult
  private func setupPiPLayer(on viewController: UIViewController) -> Bool {
    if let layer = displayLayer, layer.status == .failed {
      displayLayer?.removeFromSuperlayer()
      layerHostView?.removeFromSuperview()
      layerHostView = nil
      displayLayer = nil
      pipController = nil
    }

    if layerHostView != nil, displayLayer != nil, pipController != nil {
      if layerHostView?.window == nil {
        viewController.view.addSubview(layerHostView!)
      }
      return true
    }

    let layer = AVSampleBufferDisplayLayer()
    layer.videoGravity = .resizeAspect
    displayLayer = layer

    // Give the layer a control timebase set to the current media position so the PiP
    // scrubber tracks real playback instead of showing LIVE. Frames still display
    // immediately (DisplayImmediately attachment), so this never gates the video.
    var timebase: CMTimebase?
    CMTimebaseCreateWithSourceClock(
      allocator: kCFAllocatorDefault,
      sourceClock: CMClockGetHostTimeClock(),
      timebaseOut: &timebase
    )
    if let timebase {
      CMTimebaseSetTime(timebase, time: CMTime(seconds: currentTimeSeconds, preferredTimescale: 600))
      CMTimebaseSetRate(timebase, rate: isPlaybackPaused ? 0 : 1)
      layer.controlTimebase = timebase
      controlTimebase = timebase
    }

    // AVSampleBufferDisplayLayer must live in a view hierarchy for PiP.
    let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: 2))
    hostView.alpha = 0
    layer.frame = hostView.bounds
    hostView.layer.addSublayer(layer)
    viewController.view.addSubview(hostView)
    layerHostView = hostView

    let contentSource = AVPictureInPictureController.ContentSource(
      sampleBufferDisplayLayer: layer,
      playbackDelegate: self
    )
    let pip = AVPictureInPictureController(contentSource: contentSource)
    pip.delegate = self
    pip.canStartPictureInPictureAutomaticallyFromInline = true
    pipController = pip
    return true
  }

  private func installSharedContextObservers() {
    removeSharedContextObservers()
    guard let channel = sharedFrameEventChannel else { return }

    let frameName = Self.sharedFrameEventName(channel: channel)
    sharedFrameObserver = NotificationCenter.default.addObserver(
      forName: frameName,
      object: nil,
      queue: .main
    ) { [weak self] notification in
      self?.handleSharedFrameNotification(notification)
    }

    let playbackName = Self.sharedPlaybackEventName(channel: channel)
    sharedPlaybackObserver = NotificationCenter.default.addObserver(
      forName: playbackName,
      object: nil,
      queue: .main
    ) { [weak self] notification in
      self?.handleSharedPlaybackNotification(notification)
    }
  }

  private func removeSharedContextObservers() {
    if let observer = sharedFrameObserver {
      NotificationCenter.default.removeObserver(observer)
      sharedFrameObserver = nil
    }
    if let observer = sharedPlaybackObserver {
      NotificationCenter.default.removeObserver(observer)
      sharedPlaybackObserver = nil
    }
  }

  private func handleSharedFrameNotification(_ notification: Notification) {
    guard isActive else { return }

    let buffer: CMSampleBuffer?
    if let sample = notification.userInfo?["sampleBuffer"] {
      let cf = sample as CFTypeRef
      buffer = CFGetTypeID(cf) == CMSampleBufferGetTypeID()
        ? unsafeBitCast(cf, to: CMSampleBuffer.self)
        : nil
    } else if let pixel = notification.userInfo?["pixelBuffer"] {
      let cf = pixel as CFTypeRef
      if CFGetTypeID(cf) == CVPixelBufferGetTypeID() {
        let pixelBuffer = unsafeBitCast(cf, to: CVPixelBuffer.self)
        buffer = wrapInSampleBuffer(pixelBuffer)
      } else {
        buffer = nil
      }
    } else {
      buffer = nil
    }

    guard let sampleBuffer = buffer else { return }
    latestSampleBuffer = sampleBuffer
    displayLayer?.enqueue(sampleBuffer)

    sharedFrameCount += 1

    if pendingPiPStart && sharedFrameCount >= 2 {
      resetPendingPiPStartState()
      pipController?.startPictureInPicture()
    }
  }

  private func handleSharedPlaybackNotification(_ notification: Notification) {
    if let isPlaying = notification.userInfo?["isPlaying"] as? Bool {
      updatePlaybackState(isPlaying: isPlaying)
    }
  }

  private func notifySharedBridge(event: String) {
    guard let channel = sharedFrameEventChannel else { return }
    NotificationCenter.default.post(
      name: Self.sharedControlEventName(channel: channel, event: event),
      object: self,
      userInfo: nil
    )
  }

  func stopPiP() {
    isActive = false
    isWarmedUp = false
    pipController?.stopPictureInPicture()
    notifySharedBridge(event: "stop")
    teardown()
  }

  func dismissPiP() {
    guard isInPiP else { return }
    resetPendingPiPStartState()
    displayLayer?.flushAndRemoveImage()
    pipController?.stopPictureInPicture()
  }

  func updatePlaybackState(isPlaying: Bool) {
    isPlaybackPaused = !isPlaying
    if let timebase = controlTimebase {
      CMTimebaseSetRate(timebase, rate: isPlaying ? 1 : 0)
    }
    pipController?.invalidatePlaybackState()
  }

  func updateTimeline(positionSeconds: Double, durationSeconds: Double, isPlaying: Bool) {
    currentTimeSeconds = max(0, positionSeconds)
    self.durationSeconds = max(0, durationSeconds)
    if let timebase = controlTimebase {
      // The timebase advances on its own, so only resync it when it has drifted
      // (after a seek or a stall) to keep the scrubber from stuttering.
      let drift = abs(CMTimebaseGetTime(timebase).seconds - currentTimeSeconds)
      if drift > 0.75 {
        CMTimebaseSetTime(timebase, time: CMTime(seconds: currentTimeSeconds, preferredTimescale: 600))
      }
    }
    updatePlaybackState(isPlaying: isPlaying)
  }

  private func teardown() {
    pendingPiPStart = false
    pipStartTimeoutItem?.cancel()
    pipStartTimeoutItem = nil
    sharedFrameCount = 0
    latestSampleBuffer = nil
    controlTimebase = nil
    currentTimeSeconds = 0
    durationSeconds = 0
    removeSharedContextObservers()
    layerHostView?.removeFromSuperview()
    layerHostView = nil
    displayLayer = nil
    pipController = nil
  }

  // MARK: - Helpers

  private func wrapInSampleBuffer(_ pixelBuffer: CVPixelBuffer) -> CMSampleBuffer? {
    var formatDesc: CMVideoFormatDescription?
    CMVideoFormatDescriptionCreateForImageBuffer(
      allocator: nil,
      imageBuffer: pixelBuffer,
      formatDescriptionOut: &formatDesc
    )
    guard let fd = formatDesc else { return nil }

    let now = CMClockGetTime(CMClockGetHostTimeClock())
    var timing = CMSampleTimingInfo(
      duration:               .invalid,
      presentationTimeStamp:  now,
      decodeTimeStamp:        .invalid
    )

    var sb: CMSampleBuffer?
    CMSampleBufferCreateForImageBuffer(
      allocator:             nil,
      imageBuffer:           pixelBuffer,
      dataReady:             true,
      makeDataReadyCallback: nil,
      refcon:                nil,
      formatDescription:     fd,
      sampleTiming:          &timing,
      sampleBufferOut:       &sb
    )
    if let sb {
      if let attachments = CMSampleBufferGetSampleAttachmentsArray(sb, createIfNecessary: true) {
        let attachment = unsafeBitCast(CFArrayGetValueAtIndex(attachments, 0), to: CFMutableDictionary.self)
        CFDictionarySetValue(
          attachment,
          Unmanaged.passUnretained(kCMSampleAttachmentKey_DisplayImmediately).toOpaque(),
          Unmanaged.passUnretained(kCFBooleanTrue).toOpaque()
        )
      }
    }
    return sb
  }

  deinit {
    removeSharedContextObservers()
  }

  private func setError(_ message: String) {
    lastErrorMessage = message
  }

  private func resetPendingPiPStartState() {
    pendingPiPStart = false
    pipStartTimeoutItem?.cancel()
    pipStartTimeoutItem = nil
  }

  private func handlePiPTermination(notifyStopWhenNotWarmedUp: Bool) {
    onPiPStatusChanged?(false)
    sharedFrameCount = 0
    if isWarmedUp {
      isActive = true
      notifySharedBridge(event: "start")
    } else {
      isActive = false
      if notifyStopWhenNotWarmedUp {
        notifySharedBridge(event: "stop")
      }
    }
  }
}

// MARK: - AVPictureInPictureControllerDelegate

@available(iOS 15.0, *)
extension PiPController: AVPictureInPictureControllerDelegate {

  func pictureInPictureControllerDidStartPictureInPicture(
    _ controller: AVPictureInPictureController
  ) {
    isInPiP = true
    onPiPStatusChanged?(true)
  }

  func pictureInPictureControllerDidStopPictureInPicture(
    _ controller: AVPictureInPictureController
  ) {
    isInPiP = false
    resetPendingPiPStartState()
    handlePiPTermination(notifyStopWhenNotWarmedUp: true)
  }

  func pictureInPictureController(
    _ controller: AVPictureInPictureController,
    failedToStartPictureInPictureWithError error: Error
  ) {
    resetPendingPiPStartState()
    handlePiPTermination(notifyStopWhenNotWarmedUp: false)
  }

  func pictureInPictureController(
    _ controller: AVPictureInPictureController,
    restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void
  ) {
    completionHandler(true)
  }
}

// MARK: - AVPictureInPictureSampleBufferPlaybackDelegate

@available(iOS 15.0, *)
extension PiPController: AVPictureInPictureSampleBufferPlaybackDelegate {

  func pictureInPictureController(
    _ pictureInPictureController: AVPictureInPictureController,
    setPlaying playing: Bool
  ) {
    onPiPAction?(playing ? "play" : "pause")
  }

  func pictureInPictureControllerTimeRangeForPlayback(
    _ pictureInPictureController: AVPictureInPictureController
  ) -> CMTimeRange {
    // Once Dart has reported a duration, hand back a real timeline so PiP drops the
    // LIVE badge and shows a scrubber. Until then, fall back to the live range.
    guard durationSeconds > 0 else {
      return CMTimeRange(start: .negativeInfinity, duration: .positiveInfinity)
    }
    return CMTimeRange(
      start: .zero,
      duration: CMTime(seconds: durationSeconds, preferredTimescale: 600)
    )
  }

  func pictureInPictureControllerIsPlaybackPaused(
    _ pictureInPictureController: AVPictureInPictureController
  ) -> Bool {
    isPlaybackPaused
  }

  func pictureInPictureController(
    _ pictureInPictureController: AVPictureInPictureController,
    didTransitionToRenderSize newRenderSize: CMVideoDimensions
  ) {}

  func pictureInPictureController(
    _ pictureInPictureController: AVPictureInPictureController,
    skipByInterval skipInterval: CMTime,
    completion completionHandler: @escaping () -> Void
  ) {
    // The system tells us the direction; Dart does the actual seek using the app's
    // configured skip length, so PiP matches the on-screen skip buttons.
    onPiPAction?(skipInterval.seconds < 0 ? "skipBackward" : "skipForward")
    completionHandler()
  }
}
