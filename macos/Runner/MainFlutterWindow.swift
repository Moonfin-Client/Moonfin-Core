import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  private var sfSymbolChannel: FlutterMethodChannel?

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let minimumWindowSize = NSSize(width: 1200, height: 760)
    self.minSize = minimumWindowSize

    var windowFrame = self.frame
    if windowFrame.size.width < minimumWindowSize.width ||
      windowFrame.size.height < minimumWindowSize.height {
      if let visibleFrame = self.screen?.visibleFrame ?? NSScreen.main?.visibleFrame {
        windowFrame.size.width = min(max(windowFrame.size.width, minimumWindowSize.width), visibleFrame.width)
        windowFrame.size.height = min(max(windowFrame.size.height, minimumWindowSize.height), visibleFrame.height)
        windowFrame.origin.x = visibleFrame.midX - (windowFrame.size.width / 2)
        windowFrame.origin.y = visibleFrame.midY - (windowFrame.size.height / 2)
      } else {
        windowFrame.size.width = max(windowFrame.size.width, minimumWindowSize.width)
        windowFrame.size.height = max(windowFrame.size.height, minimumWindowSize.height)
      }
    }

    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    self.titlebarAppearsTransparent = true
    self.titleVisibility = .hidden
    self.backgroundColor = NSColor(white: 0.04, alpha: 1.0)

    RegisterGeneratedPlugins(registry: flutterViewController)

    let sfSymbolChannel = FlutterMethodChannel(
      name: "moonfin/sf_symbols",
      binaryMessenger: flutterViewController.engine.binaryMessenger
    )
    self.sfSymbolChannel = sfSymbolChannel
    sfSymbolChannel.setMethodCallHandler { (call, result) in
      guard call.method == "render",
        let args = call.arguments as? [String: Any],
        let name = args["name"] as? String
      else {
        result(FlutterMethodNotImplemented)
        return
      }
      guard #available(macOS 12.0, *) else {
        result(nil)
        return
      }
      let size = CGFloat(args["size"] as? Double ?? 18)
      let color = NSColor(
        red: CGFloat(args["r"] as? Double ?? 1),
        green: CGFloat(args["g"] as? Double ?? 1),
        blue: CGFloat(args["b"] as? Double ?? 1),
        alpha: CGFloat(args["a"] as? Double ?? 1)
      )
      let config = NSImage.SymbolConfiguration(pointSize: size, weight: .regular)
      guard
        let symbol = NSImage(systemSymbolName: name, accessibilityDescription: nil),
        let configured = symbol.withSymbolConfiguration(config)
      else {
        result(nil)
        return
      }
      let imageSize = configured.size
      let output = NSImage(size: imageSize)
      output.lockFocus()
      configured.draw(in: NSRect(origin: .zero, size: imageSize))
      color.set()
      NSRect(origin: .zero, size: imageSize).fill(using: .sourceAtop)
      output.unlockFocus()
      guard let tiff = output.tiffRepresentation,
        let rep = NSBitmapImageRep(data: tiff),
        let png = rep.representation(using: .png, properties: [:])
      else {
        result(nil)
        return
      }
      result(FlutterStandardTypedData(bytes: png))
    }

    super.awakeFromNib()
  }
}
