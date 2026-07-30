#if canImport(UIKit)
import UIKit

private typealias PlatformColor = UIColor
private typealias PlatformFont = UIFont
private typealias PlatformFontWeight = UIFont.Weight
private typealias PlatformImage = UIImage
#elseif canImport(AppKit)
import AppKit

private typealias PlatformColor = NSColor
private typealias PlatformFont = NSFont
private typealias PlatformFontWeight = NSFont.Weight
private typealias PlatformImage = NSImage
#endif

final class SubtitleOverlay: PlatformView {

    #if canImport(UIKit)
    private let textLabel = UILabel()
    private let bitmapView = UIImageView()
    private let assImageView = UIImageView()
    #else
    private let textLabel = NSTextField(labelWithString: "")
    private let bitmapView = NSImageView()
    private let assImageView = NSImageView()
    #endif
    private var eventQueue: [SubtitleEvent] = []
    private var activeEvent: SubtitleEvent?
    private var lastUpdateTime: TimeInterval = 0
    var delaySeconds: TimeInterval = 0

    /// Where the picture sits inside the overlay. A TV gives the video the
    /// whole surface, but a phone letterboxes anything shaped differently, and
    /// bitmap cues are authored against the picture. An empty rect falls back
    /// to the full bounds.
    var videoRectProvider: (() -> CGRect)?

    private var videoBox: CGRect {
        guard let rect = videoRectProvider?(), !rect.isEmpty else { return bounds }
        return rect
    }

    /// The user facing size on the 24 based scale, and the 40 to 100 position.
    /// Both stay raw and become points at layout time, as a fraction of the
    /// view height, so a phone in landscape and a 1080pt TV canvas end up
    /// looking the same. Deriving them late also means a style applied before
    /// the view has bounds doesn't get baked in at the fallback size.
    private var subtitleUserFontSize: CGFloat = 24
    private var subtitlePositionBase = 100
    private var subtitleFontWeight: PlatformFontWeight = .semibold
    private var subtitleTextColor: PlatformColor = .white
    private var subtitleBgColor: PlatformColor = .clear
    private var subtitleStrokeColor: PlatformColor = .black
    private var subtitleStrokeEnabled = true
    /// Point size the label's text was last built at, so layout only rebuilds
    /// it when the height actually changed.
    private var appliedFontSize: CGFloat = 0

    /// The tuned TV mapping (user 24 gives 55pt, floor 24, ceiling 120) held
    /// against a 1080pt canvas. Everything below scales that reference by the
    /// real height, so a 1080pt canvas comes out exactly as it did before.
    private static let referenceHeight: CGFloat = 1080

    private var canvasHeight: CGFloat {
        bounds.height > 0 ? bounds.height : Self.referenceHeight
    }

    private var canvasScale: CGFloat { canvasHeight / Self.referenceHeight }

    private var subtitleFontSize: CGFloat {
        let scale = canvasScale
        let points = subtitleUserFontSize / 24.0 * 55.0 * scale
        return min(max(points, 24 * scale), 120 * scale)
    }

    private var subtitleStrokeWidth: CGFloat {
        subtitleStrokeEnabled ? max(2 * canvasScale, 1) : 0
    }

    /// The 40pt base margin stays absolute rather than scaling with height,
    /// because it also positions bitmap cues that arrive without a canvas rect
    /// and those already sit correctly on a phone.
    private var subtitleBottomOffset: CGFloat {
        40 + canvasHeight * 0.5 * CGFloat(100 - subtitlePositionBase) / 60.0
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        #if canImport(UIKit)
        isUserInteractionEnabled = false
        backgroundColor = .clear

        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        bitmapView.contentMode = .scaleToFill
        assImageView.contentMode = .scaleToFill
        #else
        wantsLayer = true

        textLabel.maximumNumberOfLines = 0
        textLabel.alignment = .center
        textLabel.isBezeled = false
        textLabel.drawsBackground = false
        bitmapView.imageScaling = .scaleAxesIndependently
        assImageView.imageScaling = .scaleAxesIndependently
        #endif
        textLabel.isHidden = true
        addSubview(textLabel)
        bitmapView.isHidden = true
        addSubview(bitmapView)
        assImageView.isHidden = true
        addSubview(assImageView)
    }

    #if canImport(UIKit)
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutOverlay()
    }
    #else
    // Keeps the shared top-left layout math valid on AppKit.
    override var isFlipped: Bool { true }

    // The overlay sits above the video but must never eat clicks meant for
    // the Flutter OSD underneath the platform view.
    override func hitTest(_ point: NSPoint) -> NSView? { nil }

    override func layout() {
        super.layout()
        layoutOverlay()
    }
    #endif

    private func layoutOverlay() {
        // The point size follows the height, so it changes on resize and on
        // the first real layout after a style was applied against zero bounds.
        if subtitleFontSize != appliedFontSize, let text = activeEvent?.text {
            setLabelText(styledText(text))
        }
        layoutTextLabel()
        layoutBitmapView()
        assImageView.frame = bounds
    }

    private func requestLayout() {
        #if canImport(UIKit)
        setNeedsLayout()
        #else
        needsLayout = true
        #endif
    }

    private func setLabelText(_ text: NSAttributedString?) {
        #if canImport(UIKit)
        textLabel.attributedText = text
        #else
        textLabel.attributedStringValue = text ?? NSAttributedString()
        #endif
    }

    private static func platformImage(_ image: CGImage) -> PlatformImage {
        #if canImport(UIKit)
        return UIImage(cgImage: image)
        #else
        return NSImage(
            cgImage: image, size: NSSize(width: image.width, height: image.height))
        #endif
    }

    func showAssImage(_ image: CGImage?) {
        if let image {
            assImageView.image = Self.platformImage(image)
            assImageView.isHidden = false
        } else {
            assImageView.image = nil
            assImageView.isHidden = true
        }
    }

    /// The engine republishes the full active-cue set, so replace the queue
    /// wholesale and re-evaluate at the last known clock so a cue swap shows
    /// without waiting for the next tick.
    func setEvents(_ events: [SubtitleEvent]) {
        eventQueue = events.sorted { $0.startTime < $1.startTime }
        if lastUpdateTime > 0 {
            evaluate(at: lastUpdateTime, evict: false)
        } else if events.isEmpty, activeEvent != nil {
            hideAll()
        }
    }

    func update(currentTime: TimeInterval) {
        lastUpdateTime = currentTime
        evaluate(at: currentTime, evict: true)
    }

    private func evaluate(at currentTime: TimeInterval, evict: Bool) {
        let adjusted = currentTime - delaySeconds
        if evict {
            eventQueue.removeAll { $0.endTime < adjusted - 0.5 }
        }
        let current = eventQueue.first { adjusted >= $0.startTime && adjusted < $0.endTime }

        if let current {
            if activeEvent == nil || activeEvent!.startTime != current.startTime {
                showEvent(current)
            }
        } else if activeEvent != nil {
            hideAll()
        }
    }

    func clear() {
        eventQueue.removeAll()
        lastUpdateTime = 0
        hideAll()
        assImageView.image = nil
        assImageView.isHidden = true
    }

    /// Moonfin's typed subtitle-style contract, mirroring the Dart
    /// `configureSubtitleStyle` call. Colors are ARGB ints, `fontSize` is the
    /// user-facing size on the 24-based scale, and `verticalOffset` from 0 to
    /// 1 maps to a bottom margin.
    func applyStyle(
        textColor: Int?,
        backgroundColor: Int?,
        strokeColor: Int?,
        fontSize: Double?,
        fontWeight: Int?,
        verticalOffset: Double?
    ) {
        if let textColor { subtitleTextColor = Self.colorFromARGB(textColor) }
        if let backgroundColor { subtitleBgColor = Self.colorFromARGB(backgroundColor) }
        if let strokeColor {
            subtitleStrokeColor = Self.colorFromARGB(strokeColor)
            subtitleStrokeEnabled = Self.colorFromARGB(strokeColor) != .clear
        }
        if let fontSize, fontSize > 0 {
            subtitleUserFontSize = CGFloat(fontSize)
        }
        if let fontWeight {
            subtitleFontWeight = fontWeight >= 600 ? .bold : .semibold
        }
        if let verticalOffset {
            setSubtitlePosition(basePosition: 100 - Int((verticalOffset * 60).rounded()))
        }
        if let event = activeEvent, event.text != nil {
            showEvent(event)
        }
    }

    /// Subtitle position on a 40 to 100 scale, where 100 is the bottom edge.
    /// It becomes a bottom offset in points at layout time. The OSD raise path
    /// calls this with min(base, 70) while controls are up.
    func setSubtitlePosition(basePosition: Int) {
        subtitlePositionBase = min(max(basePosition, 40), 100)
        requestLayout()
    }

    // MARK: - Display

    private func showEvent(_ event: SubtitleEvent) {
        activeEvent = event
        if let text = event.text {
            bitmapView.isHidden = true
            bitmapView.image = nil
            setLabelText(styledText(text))
            textLabel.isHidden = false
            layoutTextLabel()
        } else if let bitmap = event.bitmap {
            textLabel.isHidden = true
            setLabelText(nil)
            bitmapView.image = Self.platformImage(bitmap)
            bitmapView.isHidden = false
            layoutBitmapView()
        }
    }

    private func hideAll() {
        activeEvent = nil
        textLabel.isHidden = true
        setLabelText(nil)
        bitmapView.isHidden = true
        bitmapView.image = nil
    }

    private func layoutTextLabel() {
        guard !textLabel.isHidden else { return }
        let maxWidth = bounds.width * 0.9
        let size = textLabel.sizeThatFits(CGSize(width: maxWidth, height: bounds.height * 0.4))
        textLabel.frame = CGRect(
            x: (bounds.width - size.width) / 2,
            y: bounds.height - size.height - subtitleBottomOffset,
            width: size.width,
            height: size.height
        )
    }

    private func layoutBitmapView() {
        guard !bitmapView.isHidden, let event = activeEvent else { return }
        let box = videoBox
        if let rect = event.normalizedRect, let canvas = event.canvasSize,
            canvas.width > 0, canvas.height > 0
        {
            // Map the authored composition canvas onto the picture
            // width-aligned and center-anchored (the canvas may be taller than
            // the coded video for cropped rips), then place the cue inside it.
            let scale = box.width / canvas.width
            let canvasHeight = canvas.height * scale
            let yOrigin = box.midY - canvasHeight / 2
            bitmapView.frame = CGRect(
                x: box.minX + rect.origin.x * box.width,
                y: yOrigin + rect.origin.y * canvasHeight,
                width: rect.size.width * box.width,
                height: rect.size.height * canvasHeight
            )
        } else if event.bitmapWidth > 0 {
            // No canvas means nothing ties the cue to the picture, so it keeps
            // measuring from the surface.
            let scale = min(bounds.width / CGFloat(event.bitmapWidth), 1.0)
            let w = CGFloat(event.bitmapWidth) * scale
            let h = CGFloat(event.bitmapHeight) * scale
            bitmapView.frame = CGRect(
                x: (bounds.width - w) / 2,
                y: bounds.height - h - subtitleBottomOffset,
                width: w,
                height: h
            )
        }
    }

    private func styledText(_ text: String) -> NSAttributedString {
        appliedFontSize = subtitleFontSize
        let font = PlatformFont.systemFont(ofSize: appliedFontSize, weight: subtitleFontWeight)
        var attrs: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: subtitleTextColor,
        ]
        if subtitleStrokeWidth > 0 {
            attrs[.strokeColor] = subtitleStrokeColor
            attrs[.strokeWidth] = -subtitleStrokeWidth
        }
        if subtitleBgColor != .clear {
            attrs[.backgroundColor] = subtitleBgColor
        }
        return NSAttributedString(string: text, attributes: attrs)
    }

    private static func colorFromARGB(_ argb: Int) -> PlatformColor {
        let alpha = (argb >> 24) & 0xFF
        if alpha == 0 { return .clear }
        return PlatformColor(
            red: CGFloat((argb >> 16) & 0xFF) / 255.0,
            green: CGFloat((argb >> 8) & 0xFF) / 255.0,
            blue: CGFloat(argb & 0xFF) / 255.0,
            alpha: CGFloat(alpha) / 255.0
        )
    }

}
