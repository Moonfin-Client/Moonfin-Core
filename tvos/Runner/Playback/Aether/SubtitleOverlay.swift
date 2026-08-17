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
    private let outlineLabel = UILabel()
    private let textLabel = UILabel()
    private let bitmapView = UIImageView()
    private let assImageView = UIImageView()
    #else
    private let outlineLabel = NSTextField(labelWithString: "")
    private let textLabel = NSTextField(labelWithString: "")
    private let bitmapView = NSImageView()
    private let assImageView = NSImageView()
    #endif
    private var eventQueue: [SubtitleEvent] = []
    /// Every text cue covering the playhead, not just one: cues sharing a window
    /// are distinct simultaneous speakers and the engine keeps them all.
    private var activeTextEvents: [SubtitleEvent] = []
    private var activeBitmapEvent: SubtitleEvent?
    private var lastUpdateTime: TimeInterval = 0
    var delaySeconds: TimeInterval = 0

    /// What the label is showing: the covering cues joined in start order.
    var activeText: String {
        activeTextEvents.compactMap(\.text).joined(separator: "\n")
    }

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

    /// The lowest position puts the text on the bottom edge itself, which is
    /// what the setting reads as zero and what a wide film needs to keep its
    /// lines inside the black bar under the picture.
    private var textBottomOffset: CGFloat {
        canvasHeight * 0.5 * CGFloat(100 - subtitlePositionBase) / 60.0
    }

    /// A bitmap cue that arrives without a canvas rect has nothing tying it to
    /// the picture, so it keeps a margin off the edge on top of the position.
    /// The margin stays absolute rather than scaling with height, since those
    /// cues already sit correctly on a phone.
    private var bitmapBottomOffset: CGFloat {
        40 + textBottomOffset
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

        for label in [outlineLabel, textLabel] {
            label.numberOfLines = 0
            label.textAlignment = .center
        }
        bitmapView.contentMode = .scaleToFill
        assImageView.contentMode = .scaleToFill
        #else
        wantsLayer = true

        for label in [outlineLabel, textLabel] {
            label.maximumNumberOfLines = 0
            label.alignment = .center
            label.isBezeled = false
            label.drawsBackground = false
        }
        bitmapView.imageScaling = .scaleAxesIndependently
        assImageView.imageScaling = .scaleAxesIndependently
        #endif
        // The outline goes under the fill, so it is added first.
        for label in [outlineLabel, textLabel] {
            label.isHidden = true
            addSubview(label)
        }
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
        if subtitleFontSize != appliedFontSize, !activeTextEvents.isEmpty {
            setLabelText(activeText)
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

    private func setLabelText(_ text: String?) {
        appliedFontSize = subtitleFontSize
        let fill = text.map(fillText)
        let outline = text.map(outlineText)
        #if canImport(UIKit)
        textLabel.attributedText = fill
        outlineLabel.attributedText = outline
        #else
        textLabel.attributedStringValue = fill ?? NSAttributedString()
        outlineLabel.attributedStringValue = outline ?? NSAttributedString()
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
    /// without waiting for the next tick. The only writer of `eventQueue`: the
    /// overlay never drops a cue itself, because for a sidecar track this queue
    /// is the only copy there is. The engine publishes such a file once and
    /// clears its drain target, so a cue discarded here never comes back and the
    /// rest of the session plays with holes in it. Retention belongs to the
    /// engine, which prunes the tracks it actually drains.
    func setEvents(_ events: [SubtitleEvent]) {
        eventQueue = events.sorted { $0.startTime < $1.startTime }
        if lastUpdateTime > 0 {
            evaluate(at: lastUpdateTime)
        } else if events.isEmpty {
            hideAll()
        }
    }

    func update(currentTime: TimeInterval) {
        lastUpdateTime = currentTime
        evaluate(at: currentTime)
    }

    /// Every cue whose window covers `adjustedTime`. Static and pure for unit
    /// tests: a clock that jumps forward and back, and two speakers sharing a
    /// window, are both decided here.
    static func activeEvents(
        in events: [SubtitleEvent], at adjustedTime: TimeInterval
    ) -> [SubtitleEvent] {
        events.filter { adjustedTime >= $0.startTime && adjustedTime < $0.endTime }
    }

    /// Whether two cue sets would draw the same block. Keyed on the window as
    /// well as the text, since the engine rewrites a cue's end time in place to
    /// close an open-ended line (a teletext page replacement, a PGS trim), and a
    /// start-only comparison leaves the retired line on screen.
    private static func drawsTheSame(_ lhs: [SubtitleEvent], _ rhs: [SubtitleEvent]) -> Bool {
        lhs.count == rhs.count
            && zip(lhs, rhs).allSatisfy {
                $0.startTime == $1.startTime && $0.endTime == $1.endTime && $0.text == $1.text
            }
    }

    private func evaluate(at currentTime: TimeInterval) {
        let adjusted = currentTime - delaySeconds
        let covering = Self.activeEvents(in: eventQueue, at: adjusted)

        // Text and bitmap are tracked apart so neither hides the other.
        let texts = covering.filter { $0.text != nil }
        if !Self.drawsTheSame(texts, activeTextEvents) {
            showText(texts)
        }

        let bitmap = covering.first { $0.bitmap != nil }
        if bitmap?.startTime != activeBitmapEvent?.startTime {
            showBitmap(bitmap)
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
        if !activeTextEvents.isEmpty {
            showText(activeTextEvents)
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

    /// Draws the cues covering the playhead as one block, joined in start order,
    /// so the label keeps a single centred frame and the styling stays exactly
    /// as it was for the common one-cue case.
    private func showText(_ events: [SubtitleEvent]) {
        activeTextEvents = events
        guard !events.isEmpty else {
            setTextHidden(true)
            setLabelText(nil)
            return
        }
        setLabelText(activeText)
        setTextHidden(false)
        layoutTextLabel()
    }

    private func showBitmap(_ event: SubtitleEvent?) {
        activeBitmapEvent = event
        guard let bitmap = event?.bitmap else {
            bitmapView.isHidden = true
            bitmapView.image = nil
            return
        }
        bitmapView.image = Self.platformImage(bitmap)
        bitmapView.isHidden = false
        layoutBitmapView()
    }

    private func hideAll() {
        showText([])
        showBitmap(nil)
    }

    private func setTextHidden(_ hidden: Bool) {
        textLabel.isHidden = hidden
        outlineLabel.isHidden = hidden
    }

    private func layoutTextLabel() {
        guard !textLabel.isHidden else { return }
        let maxWidth = bounds.width * 0.9
        let size = textLabel.sizeThatFits(CGSize(width: maxWidth, height: bounds.height * 0.4))
        let frame = CGRect(
            x: (bounds.width - size.width) / 2,
            y: bounds.height - size.height - textBottomOffset,
            width: size.width,
            height: size.height
        )
        textLabel.frame = frame
        outlineLabel.frame = frame
    }

    private func layoutBitmapView() {
        guard !bitmapView.isHidden, let event = activeBitmapEvent else { return }
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
                y: bounds.height - h - bitmapBottomOffset,
                width: w,
                height: h
            )
        }
    }

    private func labelFont() -> PlatformFont {
        PlatformFont.systemFont(ofSize: appliedFontSize, weight: subtitleFontWeight)
    }

    private func fillText(_ text: String) -> NSAttributedString {
        NSAttributedString(
            string: text,
            attributes: [
                .font: labelFont(),
                .foregroundColor: subtitleTextColor,
            ])
    }

    /// What sits under the text: the background box, and the outline when one
    /// is wanted. The outline is its own copy of the line rather than a stroke
    /// on the glyphs, since a stroke traces every contour a glyph is built from
    /// and letters made of overlapping pieces come out with the seams drawn
    /// across them. The fill on top covers those, leaving only the half of the
    /// line that falls outside the letter.
    private func outlineText(_ text: String) -> NSAttributedString {
        var attrs: [NSAttributedString.Key: Any] = [
            .font: labelFont(),
            // Nothing to fill here, or this copy shows through as a second set
            // of glyphs whenever there is no outline to draw.
            .foregroundColor: PlatformColor.clear,
        ]
        if subtitleStrokeWidth > 0 {
            attrs[.strokeColor] = subtitleStrokeColor
            // Doubled, since only the outer half survives the fill on top.
            attrs[.strokeWidth] = subtitleStrokeWidth * 2
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
