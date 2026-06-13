import AVFoundation
import Flutter
import UIKit
#if canImport(MPVKit)
import MPVKit
#endif
#if canImport(Libmpv)
import Libmpv
#endif

@MainActor
protocol PreviewBackend: AnyObject {
    var textureId: Int64 { get }
    func open(
        url: String, headers: [String: String], volume: Float, live: Bool,
        completion: @escaping (Bool) -> Void)
    func resume()
    func pause()
    func stop()
    func setVolume(_ volume: Float)
    func teardown()
}

@MainActor
final class AppleTvPreviewChannel: NSObject, FlutterStreamHandler {
    private let control: FlutterMethodChannel
    private let events: FlutterEventChannel
    private let textures: FlutterTextureRegistry
    nonisolated(unsafe) private var eventSink: FlutterEventSink?
    private var players: [Int: PreviewBackend] = [:]

    init(messenger: FlutterBinaryMessenger, textures: FlutterTextureRegistry) {
        control = FlutterMethodChannel(
            name: "moonfin/appletv_preview", binaryMessenger: messenger)
        events = FlutterEventChannel(
            name: "moonfin/appletv_preview_events", binaryMessenger: messenger)
        self.textures = textures
        super.init()
        control.setMethodCallHandler { [weak self] call, result in
            guard let self else {
                result(nil)
                return
            }
            Task { @MainActor in self.handle(call, result: result) }
        }
        events.setStreamHandler(self)
    }

    nonisolated func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink)
        -> FlutterError?
    {
        self.eventSink = eventSink
        return nil
    }

    nonisolated func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }

    nonisolated private func send(_ payload: [String: Any]) {
        eventSink?(payload)
    }

    private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any] ?? [:]
        let playerId = (args["playerId"] as? NSNumber)?.intValue ?? -1
        switch call.method {
        case "open":
            guard let url = args["url"] as? String, playerId >= 0 else {
                result(FlutterError(code: "bad_args", message: nil, details: nil))
                return
            }
            let headers = (args["headers"] as? [String: String]) ?? [:]
            let volume = (args["volume"] as? NSNumber)?.floatValue ?? 0
            let live = (args["live"] as? Bool) ?? false
            let wantsMpv = (args["backend"] as? String) == "mpv"
            disposePlayer(playerId)
            let onEvent: ([String: Any]) -> Void = { [weak self] payload in
                self?.send(payload)
            }
            let player: PreviewBackend
            #if canImport(Libmpv)
            if wantsMpv {
                player = MpvPreviewPlayer(
                    playerId: playerId, textures: textures, onEvent: onEvent)
            } else {
                player = PreviewPlayer(
                    playerId: playerId, textures: textures, onEvent: onEvent)
            }
            #else
            player = PreviewPlayer(
                playerId: playerId, textures: textures, onEvent: onEvent)
            #endif
            players[playerId] = player
            player.open(url: url, headers: headers, volume: volume, live: live) { ok in
                if ok {
                    result(["textureId": player.textureId])
                } else {
                    result(FlutterError(code: "open_failed", message: nil, details: nil))
                }
            }
        case "resume":
            players[playerId]?.resume()
            result(nil)
        case "pause":
            players[playerId]?.pause()
            result(nil)
        case "stop":
            players[playerId]?.stop()
            result(nil)
        case "setVolume":
            let volume = (args["volume"] as? NSNumber)?.floatValue ?? 0
            players[playerId]?.setVolume(volume)
            result(nil)
        case "dispose":
            disposePlayer(playerId)
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func disposePlayer(_ playerId: Int) {
        guard let player = players.removeValue(forKey: playerId) else { return }
        player.teardown()
    }
}

@MainActor
private final class PreviewPlayer: NSObject, FlutterTexture, PreviewBackend {
    private let playerId: Int
    private let textures: FlutterTextureRegistry
    private let onEvent: ([String: Any]) -> Void
    private(set) var textureId: Int64 = -1

    private var player: AVPlayer?
    private var item: AVPlayerItem?
    nonisolated(unsafe) private var output: AVPlayerItemVideoOutput?
    private var displayLink: CADisplayLink?
    private var statusObservation: NSKeyValueObservation?
    private var endObserver: NSObjectProtocol?
    private var openCompletion: ((Bool) -> Void)?

    init(
        playerId: Int, textures: FlutterTextureRegistry,
        onEvent: @escaping ([String: Any]) -> Void
    ) {
        self.playerId = playerId
        self.textures = textures
        self.onEvent = onEvent
        super.init()
        textureId = textures.register(self)
    }

    func open(
        url urlString: String, headers: [String: String], volume: Float, live: Bool,
        completion: @escaping (Bool) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(false)
            return
        }
        openCompletion = completion

        var options: [String: Any] = [:]
        if !headers.isEmpty {
            options["AVURLAssetHTTPHeaderFieldsKey"] = headers
        }
        let asset = AVURLAsset(url: url, options: options)
        let item = AVPlayerItem(asset: asset)
        let attrs: [String: Any] = [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
            kCVPixelBufferIOSurfacePropertiesKey as String: [:] as [String: Any],
        ]
        let output = AVPlayerItemVideoOutput(pixelBufferAttributes: attrs)
        item.add(output)
        self.item = item
        self.output = output

        let player = AVPlayer(playerItem: item)
        player.volume = max(0, min(1, volume / 100.0))
        player.actionAtItemEnd = .pause
        player.preventsDisplaySleepDuringVideoPlayback = false
        self.player = player

        statusObservation = item.observe(\.status, options: [.new]) {
            [weak self] observedItem, _ in
            let status = observedItem.status
            Task { @MainActor in
                guard let self else { return }
                switch status {
                case .readyToPlay:
                    self.finishOpen(success: true)
                case .failed:
                    self.finishOpen(success: false)
                    self.onEvent(["playerId": self.playerId, "event": "error"])
                default:
                    break
                }
            }
        }

        endObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime, object: item, queue: .main
        ) { [weak self] _ in
            Task { @MainActor in
                guard let self else { return }
                self.onEvent(["playerId": self.playerId, "event": "completed"])
            }
        }

        let link = CADisplayLink(target: self, selector: #selector(onFrame))
        link.add(to: .main, forMode: .common)
        displayLink = link
    }

    private func finishOpen(success: Bool) {
        guard let completion = openCompletion else { return }
        openCompletion = nil
        completion(success)
    }

    @objc private func onFrame() {
        guard let output, let item else { return }
        let time = item.currentTime()
        if output.hasNewPixelBuffer(forItemTime: time) {
            textures.textureFrameAvailable(textureId)
        }
    }

    nonisolated func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        guard let output else { return nil }
        let time = output.itemTime(forHostTime: CACurrentMediaTime())
        guard output.hasNewPixelBuffer(forItemTime: time),
            let buffer = output.copyPixelBuffer(forItemTime: time, itemTimeForDisplay: nil)
        else { return nil }
        return Unmanaged.passRetained(buffer)
    }

    func resume() {
        player?.play()
    }

    func pause() {
        player?.pause()
    }

    func stop() {
        player?.pause()
        player?.seek(to: .zero)
    }

    func setVolume(_ volume: Float) {
        player?.volume = max(0, min(1, volume / 100.0))
    }

    func teardown() {
        finishOpen(success: false)
        displayLink?.invalidate()
        displayLink = nil
        statusObservation?.invalidate()
        statusObservation = nil
        if let endObserver {
            NotificationCenter.default.removeObserver(endObserver)
            self.endObserver = nil
        }
        player?.pause()
        player?.replaceCurrentItem(with: nil)
        player = nil
        item = nil
        output = nil
        if textureId >= 0 {
            textures.unregisterTexture(textureId)
            textureId = -1
        }
    }
}

#if canImport(Libmpv)
@MainActor
private final class MpvPreviewPlayer: NSObject, FlutterTexture, PreviewBackend {
    nonisolated let playerId: Int
    nonisolated(unsafe) let textures: FlutterTextureRegistry
    nonisolated(unsafe) let onEvent: ([String: Any]) -> Void
    nonisolated(unsafe) private(set) var textureId: Int64 = -1

    nonisolated(unsafe) private var handle: OpaquePointer?
    nonisolated(unsafe) private var renderContext: OpaquePointer?
    nonisolated(unsafe) private var pixelBufferPool: CVPixelBufferPool?
    nonisolated(unsafe) private var swFormat: UnsafeMutablePointer<CChar>? = strdup("bgra")
    nonisolated(unsafe) private var currentFrame: CVPixelBuffer?
    nonisolated(unsafe) private var openCompletion: ((Bool) -> Void)?
    nonisolated(unsafe) private var isAlive = true
    nonisolated(unsafe) private var contextFreed = false
    nonisolated(unsafe) private var isLive = false

    nonisolated private let stateLock = NSLock()
    nonisolated private let workQueue = DispatchQueue(label: "moonfin.mpvpreview.render")

    nonisolated private let renderWidth: Int32 = 1280
    nonisolated private let renderHeight: Int32 = 720

    init(
        playerId: Int, textures: FlutterTextureRegistry,
        onEvent: @escaping ([String: Any]) -> Void
    ) {
        self.playerId = playerId
        self.textures = textures
        self.onEvent = onEvent
        super.init()
        textureId = textures.register(self)
    }

    func open(
        url: String, headers: [String: String], volume: Float, live: Bool,
        completion: @escaping (Bool) -> Void
    ) {
        guard let created = mpv_create() else {
            completion(false)
            return
        }
        handle = created
        isLive = live

        setOpt("vo", "libmpv")
        setOpt("hwdec", "videotoolbox")
        setOpt("vid", "auto")
        setOpt("audio-display", "no")
        setOpt("cache", "yes")
        setOpt("network-timeout", "30")
        setOpt("keepaspect", "yes")
        if live {
            setOpt("cache-secs", "10")
            setOpt("demuxer-readahead-secs", "5")
        }

        let muted = volume <= 0
        if muted {
            setOpt("ao", "null")
            setOpt("mute", "yes")
        } else {
            installAudioUnitChannelLayoutFix()
            setOpt("mute", "no")
            setOpt("volume", "\(Int(max(0, min(100, volume))))")
        }
        applyHeaders(headers)
        setOpt("pause", "yes")

        guard mpv_initialize(created) >= 0 else {
            cleanupHandle()
            completion(false)
            return
        }

        var contextOk = false
        workQueue.sync { contextOk = self.createRenderContext() }
        guard contextOk else {
            cleanupHandle()
            completion(false)
            return
        }

        let selfPtr = Unmanaged.passUnretained(self).toOpaque()
        mpv_render_context_set_update_callback(
            renderContext, MpvPreviewPlayer.updateTrampoline, selfPtr)
        mpv_set_wakeup_callback(created, MpvPreviewPlayer.wakeupTrampoline, selfPtr)

        openCompletion = completion
        _ = command(["loadfile", url])
    }

    nonisolated private func createRenderContext() -> Bool {
        guard let handle else { return false }
        let apiType = strdup(MPV_RENDER_API_TYPE_SW)
        defer { free(apiType) }
        var params = [
            mpv_render_param(
                type: MPV_RENDER_PARAM_API_TYPE,
                data: UnsafeMutableRawPointer(apiType)),
            mpv_render_param(type: MPV_RENDER_PARAM_INVALID, data: nil),
        ]
        var ctx: OpaquePointer?
        let rc = params.withUnsafeMutableBufferPointer {
            mpv_render_context_create(&ctx, handle, $0.baseAddress)
        }
        guard rc >= 0, ctx != nil else { return false }
        renderContext = ctx
        pixelBufferPool = makePool()
        return pixelBufferPool != nil
    }

    nonisolated private func makePool() -> CVPixelBufferPool? {
        let attrs: [String: Any] = [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
            kCVPixelBufferWidthKey as String: Int(renderWidth),
            kCVPixelBufferHeightKey as String: Int(renderHeight),
            kCVPixelBufferIOSurfacePropertiesKey as String: [:] as [String: Any],
            kCVPixelBufferMetalCompatibilityKey as String: true,
        ]
        var pool: CVPixelBufferPool?
        CVPixelBufferPoolCreate(nil, nil, attrs as CFDictionary, &pool)
        return pool
    }

    nonisolated private func renderIfAlive() {
        if contextFreed { return }
        guard let ctx = renderContext, let pool = pixelBufferPool,
            let swFormat = swFormat
        else { return }
        let flags = mpv_render_context_update(ctx)
        if flags & UInt64(MPV_RENDER_UPDATE_FRAME.rawValue) == 0 { return }

        var pbOut: CVPixelBuffer?
        guard CVPixelBufferPoolCreatePixelBuffer(nil, pool, &pbOut) == kCVReturnSuccess,
            let pb = pbOut
        else { return }

        CVPixelBufferLockBaseAddress(pb, [])
        let sizePtr = UnsafeMutablePointer<Int32>.allocate(capacity: 2)
        sizePtr[0] = renderWidth
        sizePtr[1] = renderHeight
        let stridePtr = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        stridePtr.pointee = CVPixelBufferGetBytesPerRow(pb)
        defer {
            sizePtr.deallocate()
            stridePtr.deallocate()
        }
        var params = [
            mpv_render_param(
                type: MPV_RENDER_PARAM_SW_SIZE,
                data: UnsafeMutableRawPointer(sizePtr)),
            mpv_render_param(
                type: MPV_RENDER_PARAM_SW_FORMAT,
                data: UnsafeMutableRawPointer(swFormat)),
            mpv_render_param(
                type: MPV_RENDER_PARAM_SW_STRIDE,
                data: UnsafeMutableRawPointer(stridePtr)),
            mpv_render_param(
                type: MPV_RENDER_PARAM_SW_POINTER,
                data: CVPixelBufferGetBaseAddress(pb)),
            mpv_render_param(type: MPV_RENDER_PARAM_INVALID, data: nil),
        ]
        params.withUnsafeMutableBufferPointer {
            _ = mpv_render_context_render(ctx, $0.baseAddress)
        }
        CVPixelBufferUnlockBaseAddress(pb, [])

        stateLock.lock()
        let alive = isAlive
        if alive { currentFrame = pb }
        let tid = textureId
        stateLock.unlock()
        if alive {
            DispatchQueue.main.async { [weak self] in
                self?.textures.textureFrameAvailable(tid)
            }
        }
    }

    nonisolated func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        stateLock.lock()
        defer { stateLock.unlock() }
        guard isAlive, let frame = currentFrame else { return nil }
        return Unmanaged.passRetained(frame)
    }

    nonisolated private func drainEvents() {
        if contextFreed { return }
        guard let handle else { return }
        while true {
            guard let evPtr = mpv_wait_event(handle, 0) else { return }
            let ev = evPtr.pointee
            let id = ev.event_id
            if id == MPV_EVENT_NONE { return }
            switch id {
            case MPV_EVENT_FILE_LOADED:
                finishOpen(true)
            case MPV_EVENT_END_FILE:
                if let data = ev.data {
                    let end = data.assumingMemoryBound(to: mpv_event_end_file.self).pointee
                    if end.reason == MPV_END_FILE_REASON_ERROR {
                        finishOpen(false)
                        emit("error")
                    } else if end.reason == MPV_END_FILE_REASON_EOF, !isLive {
                        emit("completed")
                    }
                }
            case MPV_EVENT_SHUTDOWN:
                return
            default:
                break
            }
        }
    }

    nonisolated private func finishOpen(_ ok: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self, let completion = self.openCompletion else { return }
            self.openCompletion = nil
            completion(ok)
        }
    }

    nonisolated private func emit(_ event: String) {
        let id = playerId
        let cb = onEvent
        DispatchQueue.main.async {
            cb(["playerId": id, "event": event])
        }
    }

    func resume() {
        setProperty("pause", "no")
    }

    func pause() {
        setProperty("pause", "yes")
    }

    func stop() {
        _ = command(["stop"])
    }

    func setVolume(_ volume: Float) {
        let clamped = Int(max(0, min(100, volume)))
        setProperty("mute", volume <= 0 ? "yes" : "no")
        setProperty("volume", "\(clamped)")
    }

    func teardown() {
        finishOpen(false)
        stateLock.lock()
        isAlive = false
        stateLock.unlock()
        if textureId >= 0 {
            textures.unregisterTexture(textureId)
            textureId = -1
        }
        if let ctx = renderContext {
            mpv_render_context_set_update_callback(ctx, nil, nil)
        }
        if let handle {
            mpv_set_wakeup_callback(handle, nil, nil)
        }
        workQueue.async { [self] in
            contextFreed = true
            if let ctx = renderContext {
                mpv_render_context_free(ctx)
                renderContext = nil
            }
            if let handle {
                mpv_terminate_destroy(handle)
                self.handle = nil
            }
            stateLock.lock()
            currentFrame = nil
            stateLock.unlock()
            if let fmt = swFormat {
                free(fmt)
                swFormat = nil
            }
        }
    }

    private func applyHeaders(_ headers: [String: String]) {
        if headers.isEmpty { return }
        var rest: [String] = []
        for (key, value) in headers {
            switch key.lowercased() {
            case "user-agent":
                setOpt("user-agent", value)
            case "referer", "referrer":
                setOpt("referrer", value)
            default:
                rest.append("\(key): \(value)")
            }
        }
        if !rest.isEmpty {
            setOpt("http-header-fields", rest.joined(separator: ","))
        }
    }

    private func cleanupHandle() {
        if let handle {
            mpv_terminate_destroy(handle)
            self.handle = nil
        }
    }

    @discardableResult
    nonisolated private func setOpt(_ name: String, _ value: String) -> Bool {
        guard let handle else { return false }
        return mpv_set_option_string(handle, name, value) >= 0
    }

    @discardableResult
    nonisolated private func setProperty(_ name: String, _ value: String) -> Bool {
        guard let handle else { return false }
        return mpv_set_property_string(handle, name, value) >= 0
    }

    @discardableResult
    nonisolated private func command(_ args: [String]) -> Bool {
        guard let handle else { return false }
        let cArgs = args.map { strdup($0) }
        defer { cArgs.forEach { free($0) } }
        var argPointers = cArgs.map { ptr in ptr.map { UnsafePointer<CChar>($0) } }
        argPointers.append(nil)
        let result = argPointers.withUnsafeMutableBufferPointer { buffer in
            mpv_command(handle, buffer.baseAddress)
        }
        return result >= 0
    }

    nonisolated private static let updateTrampoline:
        @convention(c) (UnsafeMutableRawPointer?) -> Void = { context in
            guard let context else { return }
            let owner = Unmanaged<MpvPreviewPlayer>.fromOpaque(context)
                .takeUnretainedValue()
            owner.workQueue.async { owner.renderIfAlive() }
        }

    nonisolated private static let wakeupTrampoline:
        @convention(c) (UnsafeMutableRawPointer?) -> Void = { context in
            guard let context else { return }
            let owner = Unmanaged<MpvPreviewPlayer>.fromOpaque(context)
                .takeUnretainedValue()
            owner.workQueue.async { owner.drainEvents() }
        }
}
#endif
