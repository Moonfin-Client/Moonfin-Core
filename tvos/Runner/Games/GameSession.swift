import Flutter
import Foundation
import UIKit

// One running emulation: core + video texture + audio + input + run loop.
// The run loop lives on a dedicated thread and is paced by the audio ring
// (block while more than `paceSeconds` is buffered), so audio is the master
// clock. Save/load/reset run as jobs between frames on the same thread.
final class GameSession {
    struct AvInfo {
        var width = 0
        var height = 0
        var aspect = 0.0
        var fps = 60.0
        var sampleRate = 44100.0
    }

    enum SessionError: Error {
        case loadFailed(String)
    }

    let video: GameVideoOutput
    let audio = GameAudioOutput()
    let input = GameInputController()

    private var core: LibretroCore?
    private let coreId: String
    private let romPath: String
    private let saveDir: String
    private let gameId: String

    // C strings handed to the core via GET_*_DIRECTORY; must outlive the core.
    private var systemDirC: UnsafeMutablePointer<CChar>?
    private var saveDirC: UnsafeMutablePointer<CChar>?

    // Core options: id -> current value; definitions captured from SET_VARIABLES.
    nonisolated(unsafe) private var variables: [String: String] = [:]
    nonisolated(unsafe) private var variableDefs: [(key: String, desc: String, choices: [String])] = []
    nonisolated(unsafe) private var variablesDirty = true
    // GET_VARIABLE returns a pointer the core may keep until the next call; keep them alive.
    nonisolated(unsafe) private var variableCStrings: [String: UnsafeMutablePointer<CChar>] = [:]
    nonisolated private let variablesLock = NSLock()

    nonisolated(unsafe) private(set) var avInfo = AvInfo()

    private var thread: Thread?
    nonisolated(unsafe) private var running = false
    nonisolated(unsafe) private var paused = false
    // Set when the core asks to quit, with its last message as the reason.
    nonisolated(unsafe) private var shutdownRequested = false
    nonisolated(unsafe) private var lastCoreMessage: String?
    nonisolated(unsafe) private var fastForward = 1
    nonisolated(unsafe) private var jobs: [() -> Void] = []
    nonisolated private let jobsLock = NSLock()
    private let paceSeconds = 0.05
    private var lastSramFlush = Date()

    var onEvent: (([String: Any]) -> Void)?

    init(
        coreId: String, romPath: String, systemDir: String, saveDir: String,
        gameId: String, options: [String: String], textures: FlutterTextureRegistry
    ) {
        self.coreId = coreId
        self.romPath = romPath
        self.saveDir = saveDir
        self.gameId = gameId
        self.video = GameVideoOutput(textures: textures)
        self.variables = options
        self.systemDirC = strdup(systemDir)
        self.saveDirC = strdup(saveDir)
    }

    // MARK: - Lifecycle (main thread)

    func load() throws -> AvInfo {
        let core = try LibretroCore(coreId: coreId)
        self.core = core
        LibretroBridge.session = self

        core.setEnvironment(LibretroCore.environmentTrampoline)
        core.setVideoRefresh(LibretroCore.videoRefreshTrampoline)
        core.setAudioSample(LibretroCore.audioSampleTrampoline)
        core.setAudioSampleBatch(LibretroCore.audioBatchTrampoline)
        core.setInputPoll(LibretroCore.inputPollTrampoline)
        core.setInputState(LibretroCore.inputStateTrampoline)
        core.retroInit()

        var info = retro_system_info()
        core.getSystemInfo(&info)

        var game = retro_game_info()
        var romData: Data?
        let pathC = strdup(romPath)
        game.path = UnsafePointer(pathC)
        if !info.need_fullpath {
            let data = try Data(contentsOf: URL(fileURLWithPath: romPath), options: .alwaysMapped)
            romData = data
            game.size = data.count
        }
        let ok: Bool
        if let data = romData {
            ok = data.withUnsafeBytes { bytes -> Bool in
                game.data = bytes.baseAddress
                return core.loadGame(&game)
            }
        } else {
            ok = core.loadGame(&game)
        }
        free(pathC)
        // A core that asked to quit during the load has nothing to run.
        guard ok, !shutdownRequested else {
            if ok { core.unloadGame() }
            core.retroDeinit()
            core.close()
            self.core = nil
            LibretroBridge.session = nil
            throw SessionError.loadFailed(
                ok ? "core shut down during load" : "retro_load_game returned false")
        }

        var av = retro_system_av_info()
        core.getSystemAvInfo(&av)
        avInfo = AvInfo(
            width: Int(av.geometry.base_width),
            height: Int(av.geometry.base_height),
            aspect: av.geometry.aspect_ratio > 0
                ? Double(av.geometry.aspect_ratio)
                : Double(av.geometry.base_width) / Double(max(1, av.geometry.base_height)),
            fps: av.timing.fps > 0 ? av.timing.fps : 60,
            sampleRate: av.timing.sample_rate > 0 ? av.timing.sample_rate : 44100)

        loadSram()
        _ = audio.start(sampleRate: avInfo.sampleRate)
        input.start()
        UIApplication.shared.isIdleTimerDisabled = true
        return avInfo
    }

    func startRunLoop() {
        guard thread == nil, core != nil, !shutdownRequested else { return }
        running = true
        paused = false
        let t = Thread { [weak self] in self?.runLoop() }
        t.name = "moonfin.game.run"
        t.qualityOfService = .userInteractive
        thread = t
        t.start()
    }

    func setPaused(_ value: Bool) {
        paused = value
        audio.setPaused(value)
    }

    func setFastForward(_ factor: Int) {
        fastForward = max(1, min(8, factor))
    }

    func reset() {
        enqueueJob { [weak self] in self?.core?.reset() }
    }

    func saveState(completion: @escaping (Data?) -> Void) {
        enqueueJob { [weak self] in
            guard let core = self?.core else {
                completion(nil)
                return
            }
            let size = core.serializeSize()
            guard size > 0 else {
                completion(nil)
                return
            }
            var data = Data(count: size)
            let ok = data.withUnsafeMutableBytes { core.serialize($0.baseAddress, size) }
            completion(ok ? data : nil)
        }
    }

    func loadState(_ data: Data, completion: @escaping (Bool) -> Void) {
        enqueueJob { [weak self] in
            guard let core = self?.core else {
                completion(false)
                return
            }
            let ok = data.withUnsafeBytes { core.unserialize($0.baseAddress, data.count) }
            completion(ok)
        }
    }

    func getOptions() -> [[String: Any]] {
        variablesLock.lock()
        defer { variablesLock.unlock() }
        return variableDefs.map { def in
            [
                "id": def.key,
                "label": def.desc,
                "current": variables[def.key] ?? def.choices.first ?? "",
                "choices": def.choices.map { ["value": $0, "label": $0] },
            ]
        }
    }

    func setOption(id: String, value: String) {
        variablesLock.lock()
        variables[id] = value
        variablesDirty = true
        variablesLock.unlock()
    }

    func currentOptions() -> [String: String] {
        variablesLock.lock()
        defer { variablesLock.unlock() }
        return variables
    }

    func stop() {
        running = false
        // The run thread exits its loop, flushes SRAM, and tears the core down.
        // Wait briefly so teardown completes before the texture is unregistered.
        let deadline = Date().addingTimeInterval(2)
        while thread != nil && Date() < deadline {
            usleep(10_000)
        }
        audio.stop()
        input.stop()
        video.teardown()
        UIApplication.shared.isIdleTimerDisabled = false
        LibretroBridge.session = nil
        free(systemDirC)
        free(saveDirC)
        systemDirC = nil
        saveDirC = nil
        variablesLock.lock()
        variableCStrings.values.forEach { free($0) }
        variableCStrings.removeAll()
        variablesLock.unlock()
    }

    // MARK: - Run loop (emulation thread)

    private func runLoop() {
        while running {
            if paused {
                usleep(16_000)
                drainJobs()
                continue
            }
            let iterations = fastForward
            for _ in 0..<iterations where running {
                core?.run()
            }
            drainJobs()
            if !running { break }
            flushSramIfDue()
            // Audio-master pacing: wait until the ring drains to the target level.
            while running && !paused && audio.bufferedSeconds > paceSeconds {
                usleep(2_000)
            }
        }
        // Teardown on the emulation thread so no retro_* call races retro_deinit.
        // A core that quit has no save worth keeping, and its memory pointers
        // may already be gone, so writing SRAM would only risk the good file.
        if !shutdownRequested { flushSram() }
        if let core {
            core.unloadGame()
            core.retroDeinit()
            core.close()
        }
        core = nil
        thread = nil

        // The core quit on its own, so say why instead of leaving a frozen
        // picture behind.
        if shutdownRequested {
            let detail = lastCoreMessage ?? "The emulator core stopped unexpectedly."
            DispatchQueue.main.async { [weak self] in
                self?.onEvent?(["event": "error", "message": detail])
            }
        }
    }

    nonisolated private func deliverCoreMessage(_ text: String) {
        guard !text.isEmpty else { return }
        lastCoreMessage = text
        DispatchQueue.main.async { [weak self] in
            self?.onEvent?(["event": "coreMessage", "message": text])
        }
    }

    private func enqueueJob(_ job: @escaping () -> Void) {
        if thread == nil {
            job()
            return
        }
        jobsLock.lock()
        jobs.append(job)
        jobsLock.unlock()
    }

    private func drainJobs() {
        jobsLock.lock()
        let pending = jobs
        jobs.removeAll()
        jobsLock.unlock()
        pending.forEach { $0() }
    }

    // MARK: - SRAM

    private var sramPath: String { "\(saveDir)/\(gameId).srm" }

    private func loadSram() {
        guard let core,
            let data = try? Data(contentsOf: URL(fileURLWithPath: sramPath)),
            !data.isEmpty
        else { return }
        let size = core.getMemorySize(UInt32(RETRO_MEMORY_SAVE_RAM))
        guard size > 0, let mem = core.getMemoryData(UInt32(RETRO_MEMORY_SAVE_RAM)) else { return }
        data.withUnsafeBytes { bytes in
            memcpy(mem, bytes.baseAddress, min(size, data.count))
        }
    }

    private func flushSramIfDue() {
        guard Date().timeIntervalSince(lastSramFlush) > 30 else { return }
        flushSram()
    }

    private func flushSram() {
        lastSramFlush = Date()
        guard let core else { return }
        let size = core.getMemorySize(UInt32(RETRO_MEMORY_SAVE_RAM))
        guard size > 0, let mem = core.getMemoryData(UInt32(RETRO_MEMORY_SAVE_RAM)) else { return }
        let data = Data(bytes: mem, count: size)
        try? data.write(to: URL(fileURLWithPath: sramPath), options: .atomic)
    }

    // MARK: - libretro callbacks (emulation thread unless noted)

    nonisolated func handleVideoRefresh(_ data: UnsafeRawPointer?, _ width: Int, _ height: Int, _ pitch: Int) {
        video.pushFrame(data, width: width, height: height, pitch: pitch)
    }

    nonisolated func handleAudioBatch(_ data: UnsafePointer<Int16>?, _ frames: Int) -> Int {
        guard let data, frames > 0 else { return frames }
        if fastForward <= 1 {
            audio.push(data, frames: frames)
        }
        // During fast-forward, drop audio (ring would saturate and stall pacing anyway).
        return frames
    }

    nonisolated func handleInputState(port: UInt32, device: UInt32, index: UInt32, id: UInt32) -> Int16 {
        guard device == UInt32(RETRO_DEVICE_JOYPAD) else { return 0 }
        let mask = input.mask(forPort: Int(port))
        if id == UInt32(RETRO_DEVICE_ID_JOYPAD_MASK) {
            return Int16(bitPattern: UInt16(truncatingIfNeeded: mask))
        }
        guard id < 16 else { return 0 }
        return (mask & (1 << UInt16(id))) != 0 ? 1 : 0
    }

    // Environment commands. Values are the plain-integer macros from libretro.h;
    // parenthesized (N | EXPERIMENTAL) macros do not bridge to Swift, so those are
    // written out with the 0x10000 flag applied.
    nonisolated func handleEnvironment(_ cmd: UInt32, _ data: UnsafeMutableRawPointer?) -> Bool {
        let experimental: UInt32 = 0x10000
        switch cmd {
        case 3:  // GET_CAN_DUPE
            data?.assumingMemoryBound(to: Bool.self).pointee = true
            return true
        case 8:  // SET_PERFORMANCE_LEVEL
            return true
        case 7:  // SHUTDOWN
            // A core asks for this when a boot or a reset failed, and then
            // answers the next retro_run with a machine it never initialised.
            // Ending the loop keeps that frame from faulting inside the core.
            shutdownRequested = true
            running = false
            return true
        case 6:  // SET_MESSAGE
            guard let data else { return false }
            let msg = data.assumingMemoryBound(to: retro_message.self).pointee
            if let text = msg.msg { deliverCoreMessage(String(cString: text)) }
            return true
        case 60:  // SET_MESSAGE_EXT
            guard let data else { return false }
            let msg = data.assumingMemoryBound(to: retro_message_ext.self).pointee
            if let text = msg.msg { deliverCoreMessage(String(cString: text)) }
            return true
        case 59:  // GET_MESSAGE_INTERFACE_VERSION
            data?.assumingMemoryBound(to: UInt32.self).pointee = 1
            return true
        case 9:  // GET_SYSTEM_DIRECTORY
            guard let data, let dir = systemDirC else { return false }
            data.assumingMemoryBound(to: UnsafePointer<CChar>?.self).pointee = UnsafePointer(dir)
            return true
        case 10:  // SET_PIXEL_FORMAT
            guard let data else { return false }
            let format = data.assumingMemoryBound(to: UInt32.self).pointee
            guard format <= GameVideoOutput.formatRGB565 else { return false }
            video.pixelFormat = format
            return true
        case 11, 35:  // SET_INPUT_DESCRIPTORS, SET_CONTROLLER_INFO
            return true
        case 14:  // SET_HW_RENDER - software rendering only
            return false
        case 15:  // GET_VARIABLE
            guard let data else { return false }
            let variable = data.assumingMemoryBound(to: retro_variable.self)
            guard let keyPtr = variable.pointee.key else { return false }
            let key = String(cString: keyPtr)
            variablesLock.lock()
            defer { variablesLock.unlock() }
            guard let value = variables[key] else { return false }
            if let cached = variableCStrings[key], String(cString: cached) == value {
                variable.pointee.value = UnsafePointer(cached)
            } else {
                if let old = variableCStrings[key] { free(old) }
                let c = strdup(value)
                variableCStrings[key] = c
                variable.pointee.value = UnsafePointer(c)
            }
            return true
        case 16:  // SET_VARIABLES
            guard let data else { return false }
            var cursor = data.assumingMemoryBound(to: retro_variable.self)
            var defs: [(key: String, desc: String, choices: [String])] = []
            while let keyPtr = cursor.pointee.key, let valPtr = cursor.pointee.value {
                let key = String(cString: keyPtr)
                let raw = String(cString: valPtr)
                // Format: "Description; choice1|choice2|choice3"
                let parts = raw.components(separatedBy: "; ")
                let desc = parts.first ?? key
                let choices = parts.count > 1 ? parts[1].components(separatedBy: "|") : []
                defs.append((key, desc, choices))
                cursor = cursor.advanced(by: 1)
            }
            variablesLock.lock()
            variableDefs = defs
            for def in defs where variables[def.key] == nil {
                variables[def.key] = def.choices.first ?? ""
            }
            variablesDirty = true
            variablesLock.unlock()
            return true
        case 17:  // GET_VARIABLE_UPDATE
            variablesLock.lock()
            let dirty = variablesDirty
            variablesDirty = false
            variablesLock.unlock()
            data?.assumingMemoryBound(to: Bool.self).pointee = dirty
            return true
        case 27:  // GET_LOG_INTERFACE - refuse; cores fall back to stderr
            return false
        case 31:  // GET_SAVE_DIRECTORY
            guard let data, let dir = saveDirC else { return false }
            data.assumingMemoryBound(to: UnsafePointer<CChar>?.self).pointee = UnsafePointer(dir)
            return true
        case 32:  // SET_SYSTEM_AV_INFO
            guard let data else { return false }
            let av = data.assumingMemoryBound(to: retro_system_av_info.self).pointee
            applyGeometry(av.geometry)
            return true
        case 37:  // SET_GEOMETRY
            guard let data else { return false }
            let geometry = data.assumingMemoryBound(to: retro_game_geometry.self).pointee
            applyGeometry(geometry)
            return true
        case 39:  // GET_LANGUAGE
            data?.assumingMemoryBound(to: UInt32.self).pointee = 0  // English
            return true
        case 47 | experimental:  // GET_AUDIO_VIDEO_ENABLE
            data?.assumingMemoryBound(to: Int32.self).pointee = 3  // video + audio
            return true
        case 49 | experimental:  // GET_FASTFORWARDING
            data?.assumingMemoryBound(to: Bool.self).pointee = fastForward > 1
            return true
        case 51 | experimental:  // GET_INPUT_BITMASKS
            return true
        case 52:  // GET_CORE_OPTIONS_VERSION - 0 makes cores use legacy SET_VARIABLES
            data?.assumingMemoryBound(to: UInt32.self).pointee = 0
            return true
        case 56:  // GET_PREFERRED_HW_RENDER - none, software only
            return false
        default:
            return false
        }
    }

    nonisolated private func applyGeometry(_ geometry: retro_game_geometry) {
        avInfo.width = Int(geometry.base_width)
        avInfo.height = Int(geometry.base_height)
        avInfo.aspect = geometry.aspect_ratio > 0
            ? Double(geometry.aspect_ratio)
            : Double(geometry.base_width) / Double(max(1, geometry.base_height))
        let payload: [String: Any] = [
            "event": "videoGeometry",
            "width": avInfo.width,
            "height": avInfo.height,
            "aspect": avInfo.aspect,
        ]
        DispatchQueue.main.async { [weak self] in
            self?.onEvent?(payload)
        }
    }
}
