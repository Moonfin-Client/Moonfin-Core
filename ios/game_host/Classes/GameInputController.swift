import Foundation
import GameController

// Maps connected controllers to per-port RetroPad bitmasks, read by the host on
// its run loop. Button changes on port 0 also mirror to Flutter so the in-game
// overlay can be driven with the same controller, and the Menu button opens it.
final class GameInputController {
  private enum Pad {
    static let b: UInt16 = 1 << 0
    static let y: UInt16 = 1 << 1
    static let select: UInt16 = 1 << 2
    static let start: UInt16 = 1 << 3
    static let up: UInt16 = 1 << 4
    static let down: UInt16 = 1 << 5
    static let left: UInt16 = 1 << 6
    static let right: UInt16 = 1 << 7
    static let a: UInt16 = 1 << 8
    static let x: UInt16 = 1 << 9
    static let l: UInt16 = 1 << 10
    static let r: UInt16 = 1 << 11
    static let l2: UInt16 = 1 << 12
    static let r2: UInt16 = 1 << 13
    static let l3: UInt16 = 1 << 14
    static let r3: UInt16 = 1 << 15
  }

  // Masks are written on the main thread and read from the host run loop, so
  // every access goes through the lock.
  private let maskLock = NSLock()
  private var portMasks = [UInt16](repeating: 0, count: 4)
  private var pulseMask: UInt16 = 0
  private var pulseWork: [Int: DispatchWorkItem] = [:]

  // RetroPad mask supplied from Dart (keyboard play and the deferred Start).
  private var dartMask: UInt16 = 0

  var onButton: ((Int, Bool) -> Void)?
  var onControllersChanged: ((Int) -> Void)?

  private var observers: [NSObjectProtocol] = []

  var controllerCount: Int {
    GCController.controllers().filter { $0.extendedGamepad != nil }.count
  }

  func start() {
    let center = NotificationCenter.default
    observers.append(
      center.addObserver(
        forName: .GCControllerDidConnect, object: nil, queue: .main
      ) { [weak self] _ in
        self?.attachAll()
        self?.onControllersChanged?(self?.controllerCount ?? 0)
      })
    observers.append(
      center.addObserver(
        forName: .GCControllerDidDisconnect, object: nil, queue: .main
      ) { [weak self] _ in
        self?.attachAll()
        self?.onControllersChanged?(self?.controllerCount ?? 0)
      })
    attachAll()
    GCController.startWirelessControllerDiscovery()
  }

  func stop() {
    GCController.stopWirelessControllerDiscovery()
    observers.forEach { NotificationCenter.default.removeObserver($0) }
    observers.removeAll()
    pulseWork.values.forEach { $0.cancel() }
    pulseWork.removeAll()
    for controller in GCController.controllers() {
      controller.extendedGamepad?.valueChangedHandler = nil
      controller.extendedGamepad?.buttonMenu.pressedChangedHandler = nil
    }
    maskLock.lock()
    pulseMask = 0
    portMasks = [0, 0, 0, 0]
    maskLock.unlock()
  }

  func mask(forPort port: Int) -> UInt16 {
    maskLock.lock()
    defer { maskLock.unlock() }
    guard port >= 0, port < portMasks.count else { return 0 }
    guard port == 0 else { return portMasks[port] }
    // Start is withheld from the physical pad because Dart owns it: a quick
    // press is pulsed back down, a hold opens the in game menu. The pulse and
    // Dart masks keep the bit so those paths still work.
    return (portMasks[0] & ~Pad.start) | pulseMask | dartMask
  }

  func setDartMask(_ mask: UInt16) {
    maskLock.lock()
    dartMask = mask
    maskLock.unlock()
  }

  func pulse(index: Int, durationMs: Int) {
    guard index >= 0, index < 16 else { return }
    let bit = UInt16(1) << UInt16(index)
    maskLock.lock()
    pulseMask |= bit
    maskLock.unlock()
    pulseWork[index]?.cancel()
    let work = DispatchWorkItem { [weak self] in
      guard let self else { return }
      self.maskLock.lock()
      self.pulseMask &= ~bit
      self.maskLock.unlock()
    }
    pulseWork[index] = work
    DispatchQueue.main.asyncAfter(
      deadline: .now() + Double(durationMs) / 1000.0, execute: work)
  }

  private func attachAll() {
    let pads = GCController.controllers().filter { $0.extendedGamepad != nil }
    for (port, controller) in pads.enumerated() where port < portMasks.count {
      controller.playerIndex = GCControllerPlayerIndex(rawValue: port) ?? .indexUnset
      let gamepad = controller.extendedGamepad!
      gamepad.valueChangedHandler = { [weak self] pad, _ in
        self?.refresh(pad: pad, port: port)
      }
      // buttonMenu changes do not always reach valueChangedHandler, so refresh
      // from its own handler too.
      gamepad.buttonMenu.pressedChangedHandler = { [weak self] _, _, _ in
        self?.refresh(pad: gamepad, port: port)
      }
    }
    maskLock.lock()
    for port in pads.count..<portMasks.count {
      portMasks[port] = 0
    }
    maskLock.unlock()
  }

  private func refresh(pad: GCExtendedGamepad, port: Int) {
    var mask: UInt16 = 0
    if pad.buttonA.isPressed { mask |= Pad.b }
    if pad.buttonB.isPressed { mask |= Pad.a }
    if pad.buttonX.isPressed { mask |= Pad.y }
    if pad.buttonY.isPressed { mask |= Pad.x }
    if pad.dpad.up.isPressed || pad.leftThumbstick.up.isPressed { mask |= Pad.up }
    if pad.dpad.down.isPressed || pad.leftThumbstick.down.isPressed { mask |= Pad.down }
    if pad.dpad.left.isPressed || pad.leftThumbstick.left.isPressed { mask |= Pad.left }
    if pad.dpad.right.isPressed || pad.leftThumbstick.right.isPressed { mask |= Pad.right }
    if pad.leftShoulder.isPressed { mask |= Pad.l }
    if pad.rightShoulder.isPressed { mask |= Pad.r }
    if pad.leftTrigger.isPressed { mask |= Pad.l2 }
    if pad.rightTrigger.isPressed { mask |= Pad.r2 }
    if pad.leftThumbstickButton?.isPressed == true { mask |= Pad.l3 }
    if pad.rightThumbstickButton?.isPressed == true { mask |= Pad.r3 }
    // Standard layout: the Menu button (Xbox menu, DualSense options) is Start
    // and the Options button (view, create) is Select. Start stays in the full
    // mask here so its presses mirror to Dart, and mask(forPort:) withholds it
    // from the core.
    if pad.buttonMenu.isPressed { mask |= Pad.start }
    if pad.buttonOptions?.isPressed == true { mask |= Pad.select }

    maskLock.lock()
    let old = portMasks[port]
    portMasks[port] = mask
    maskLock.unlock()
    guard port == 0, old != mask, let onButton else { return }
    for bit in 0..<16 where (old ^ mask) & (1 << bit) != 0 {
      onButton(bit, mask & (1 << bit) != 0)
    }
  }
}
