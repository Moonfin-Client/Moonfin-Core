#if canImport(UIKit)
import UIKit

private typealias PlatformColor = UIColor
private typealias PlatformFont = UIFont
private typealias PlatformFontWeight = UIFont.Weight
private typealias PlatformImage = UIImage
private typealias PlatformImageView = UIImageView
private typealias PlatformLabel = UILabel
private typealias PlatformEdgeInsets = UIEdgeInsets
#elseif canImport(AppKit)
import AppKit

private typealias PlatformColor = NSColor
private typealias PlatformFont = NSFont
private typealias PlatformFontWeight = NSFont.Weight
private typealias PlatformImage = NSImage
private typealias PlatformImageView = NSImageView
private typealias PlatformLabel = NSTextField
private typealias PlatformEdgeInsets = NSEdgeInsets
#endif

import QuartzCore

final class SubtitleOverlay: PlatformView {

    #if canImport(UIKit)
    private let outlineLabel = UILabel()
    private let textLabel = UILabel()
    private let referenceTextLabel = UILabel()
    private let bitmapView = UIImageView()
    private let assImageView = UIImageView()
    #else
    private let outlineLabel = NSTextField(labelWithString: "")
    private let textLabel = NSTextField(labelWithString: "")
    private let referenceTextLabel = NSTextField(labelWithString: "")
    private let bitmapView = NSImageView()
    private let assImageView = NSImageView()
    #endif
    private var eventQueue: [SubtitleEvent] = []
    /// Every text cue covering the playhead, not just one: cues sharing a window
    /// are distinct simultaneous speakers and the engine keeps them all.
    private var activeTextEvents: [SubtitleEvent] = []
    private var baseTextEvents: [SubtitleEvent] = []
    private var extraTextOverlays: [SubtitleOverlay] = []
    private var activeBitmapEvents: [SubtitleEvent] = []
    private var extraBitmapViews: [PlatformImageView] = []
    private let textOverflowMask = CAShapeLayer()
    private let outlineOverflowMask = CAShapeLayer()
    private var lastUpdateTime: TimeInterval = 0
    var delaySeconds: TimeInterval = 0 {
        didSet {
            for overlay in extraTextOverlays { overlay.delaySeconds = delaySeconds }
        }
    }
    /// The secondary text follows the primary frame, using its last frame during gaps
    /// in dialogue.
    weak var primaryForStacking: SubtitleOverlay?
    weak var secondaryForStacking: SubtitleOverlay?
    var stackingEnabled = false {
        didSet {
            primaryForStacking?.requestLayout()
            requestLayout()
        }
    }
    /// ASS/SSA primaries use a stable top lane for the secondary instead of
    /// chasing libass regions that can move or animate from frame to frame.
    var secondaryUsesTopFallback = false {
        didSet {
            guard oldValue != secondaryUsesTopFallback else { return }
            secondaryForStacking?.requestLayout()
        }
    }
    // Keep source placement inputs through dialogue gaps. Final screen rectangles
    // go stale when the font, controls lift, spacing or picture geometry changes.
    private enum PrimaryPlacement {
        case text([SubtitleEvent], isMain: Bool)
        case bitmap(SubtitleEvent)
    }
    private var lastPrimaryPlacement: [PrimaryPlacement] = []
    var secondaryVerticalAdjustment: Double = 0 {
        didSet {
            primaryForStacking?.requestLayout()
            requestLayout()
        }
    }

    /// Keep the actual rendered rectangles separate: a cue at the top and
    /// another at the bottom must not block the entire space between them.
    private var visibleRegions: [CGRect] {
        var regions: [CGRect] = []
        if !textLabel.isHidden { regions.append(textLabel.frame) }
        for overlay in extraTextOverlays {
            regions.append(contentsOf: overlay.visibleRegions)
        }
        if !bitmapView.isHidden { regions.append(bitmapView.frame) }
        for view in extraBitmapViews where !view.isHidden {
            regions.append(view.frame)
        }
        return regions.filter { !$0.isEmpty && !$0.isNull }
    }

    private var stackingRegions: [CGRect] {
        let regions = visibleRegions
        if !regions.isEmpty { return regions }
        return lastPrimaryPlacement.compactMap { primaryPlacementFrame($0) }
            .filter { !$0.isEmpty && !$0.isNull }
    }

    private func primaryPlacementFrame(_ reference: PrimaryPlacement) -> CGRect? {
        switch reference {
        case .text(let events, let isMain):
            let placement = Self.textPlacement(events)
            let alignment = Self.effectiveAlignment(placement)
            let text = applyInlineEmphasis(
                to: fillText(events.compactMap(\.text).joined(separator: "\n"), alignment: alignment),
                events: events)
            #if canImport(UIKit)
            referenceTextLabel.attributedText = text
            #else
            referenceTextLabel.attributedStringValue = text
            #endif
            return textLayout(
                for: referenceTextLabel, placement: placement, alignment: alignment,
                centeredPair: isMain && (Self.stackingAlignment(placement) - 1) / 3 == 1).frame
        case .bitmap(let event):
            return bitmapFrame(for: event)
        }
    }

    private var currentPrimaryPlacement: [PrimaryPlacement] {
        Self.textGroups(activeTextEvents).enumerated().map {
            PrimaryPlacement.text($0.element, isMain: $0.offset == 0)
        } + activeBitmapEvents.map { .bitmap($0) }
    }

    private var activeTextPlacement: SubtitleEvent? {
        Self.textPlacement(baseTextEvents)
    }

    private static func textPlacement(_ events: [SubtitleEvent]) -> SubtitleEvent? {
        events.first { $0.alignment != nil || $0.position != nil }
    }

    private static func stackingAlignment(_ placement: SubtitleEvent?) -> Int {
        let alignment = effectiveAlignment(placement)
        guard let position = placement?.position else { return alignment }
        // A WebVTT line anchor isn't a screen region: line:10%,end still
        // needs the secondary below the primary.
        let row = position.y < 1.0 / 3 ? 2 : position.y > 2.0 / 3 ? 0 : 1
        return row * 3 + (alignment - 1) % 3 + 1
    }

    private var currentAlignment: Int {
        if let primary = primaryForStacking, stackingEnabled {
            return primary.currentAlignment
        }
        if !activeTextEvents.isEmpty {
            return Self.stackingAlignment(activeTextPlacement)
        }
        if visibleRegions.isEmpty,
           case .text(let events, _)? = lastPrimaryPlacement.first {
            return Self.stackingAlignment(Self.textPlacement(events))
        }
        let regions = stackingRegions
        guard !regions.isEmpty else { return 2 }
        let frame = regions.reduce(CGRect.null) { $0.union($1) }
        let row = frame.midY < bounds.height / 3 ? 2
            : frame.midY > bounds.height * 2 / 3 ? 0 : 1
        return row * 3 + 2
    }

    func rememberPrimaryPlacement() {
        guard secondaryForStacking != nil,
              bounds.width > 0, bounds.height > 0 else { return }
        guard !visibleRegions.isEmpty else { return }
        lastPrimaryPlacement = currentPrimaryPlacement
    }

    private func updateSecondaryPlacement() {
        rememberPrimaryPlacement()
        guard let secondary = secondaryForStacking else { return }
        if !secondary.baseTextEvents.isEmpty { secondary.setLabelText(secondary.baseText) }
        secondary.layoutTextLabel()
    }

    /// On while a subtitle track is selected. With a fullscreen video alone on
    /// screen, iPadOS 27 can drop these views from frames and macOS flashes the
    /// picture on every subtitle change. A near-invisible backing keeps them
    /// composited with the picture the way the OSD does.
    var keepsVideoComposited = false {
        didSet {
            #if canImport(UIKit)
            backgroundColor = keepsVideoComposited ? UIColor(white: 0, alpha: 0.01) : .clear
            #else
            layer?.backgroundColor = keepsVideoComposited ? NSColor(white: 0, alpha: 0.01).cgColor : nil
            #endif
        }
    }

    /// What the label is showing: the covering cues joined in start order.
    var activeText: String {
        activeTextEvents.compactMap(\.text).joined(separator: "\n")
    }

    private var baseText: String {
        baseTextEvents.compactMap(\.text).joined(separator: "\n")
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

    /// ASS positions are authored against the picture, so libass draws into the
    /// video rect. Clamping it to the view leaves fill mode, where the picture runs
    /// past the edges, drawing across the whole view.
    var assCanvas: CGRect {
        let canvas = videoBox.intersection(bounds)
        return canvas.isEmpty ? bounds : canvas
    }

    /// Keep the user font size and native 40 to 100 position value until layout, when the
    /// view size is known. Font size scales with view height. The user text offset is
    /// handled separately using picture height.
    private var subtitleUserFontSize: CGFloat = 24
    private var subtitlePositionBase = 100
    // The authored cue's vertical position remains the baseline. This offset
    // moves top cues down and bottom cues up, never middle cues.
    private var authoredVerticalOffset: CGFloat = 0
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

    /// Keep the 40 to 100 position scale for the temporary lift above playback controls
    /// and for bitmap fallback. The user's text offset uses a fraction of the picture
    /// height.
    private var positionScaleBottomOffset: CGFloat {
        canvasHeight * 0.5 * CGFloat(100 - subtitlePositionBase) / 60.0
    }

    private var textBottomOffset: CGFloat {
        let authoredOffset = videoBox.height * authoredVerticalOffset
        let normalPosition =
            100 - Int((Double(authoredVerticalOffset) * 60).rounded())
        // Only the temporary OSD raise adds clearance. Normal playback must
        // use the exact authored offset, including letterboxed/portrait layouts.
        guard subtitlePositionBase < normalPosition else {
            return authoredOffset
        }
        // Playback controls impose a minimum clearance, but they must never pull a
        // subtitle down from a higher position the user already chose.
        return max(authoredOffset, positionScaleBottomOffset)
    }

    /// A bitmap cue that arrives without a canvas rect has nothing tying it to
    /// the picture, so it keeps a margin off the edge on top of the position.
    /// The margin stays absolute rather than scaling with height, since those
    /// cues already sit correctly on a phone.
    private var bitmapBottomOffset: CGFloat {
        40 + positionScaleBottomOffset
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

        for label in [outlineLabel, textLabel, referenceTextLabel] {
            label.numberOfLines = 0
            label.textAlignment = .center
        }
        bitmapView.contentMode = .scaleToFill
        assImageView.contentMode = .scaleToFill
        #else
        wantsLayer = true

        for label in [outlineLabel, textLabel, referenceTextLabel] {
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
        if subtitleFontSize != appliedFontSize, !baseTextEvents.isEmpty {
            setLabelText(baseText)
        }
        for overlay in extraTextOverlays {
            overlay.frame = bounds
            overlay.layoutOverlay()
        }
        // Lay out the primary first: changing the gap in a centered pair moves both
        // tracks.
        primaryForStacking?.layoutTextLabel()
        layoutTextLabel()
        layoutBitmapViews()
        assImageView.frame = assCanvas
        updateSecondaryPlacement()
    }

    /// Relayout existing captions after Fit/Fill changes the picture rectangle.
    func refreshVideoGeometry() {
        requestLayout()
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
        let fill = text.map { applyInlineEmphasis(to: fillText($0)) }
        let outline = text.map { applyInlineEmphasis(to: outlineText($0)) }
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
            // A zoom change moves the picture without a layout pass, so the frame
            // follows each render instead of waiting for one.
            assImageView.frame = assCanvas
            assImageView.image = Self.platformImage(image)
            assImageView.isHidden = false
        } else {
            assImageView.image = nil
            assImageView.isHidden = true
        }
        if !secondaryUsesTopFallback {
            updateSecondaryPlacement()
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
                $0.startTime == $1.startTime && $0.endTime == $1.endTime
                    && $0.text == $1.text && $0.alignment == $1.alignment
                    && $0.position == $1.position
                    && $0.styledRuns == $1.styledRuns
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

        let bitmaps = covering.filter { $0.bitmap != nil }
        if !Self.drawsTheSameBitmaps(bitmaps, activeBitmapEvents) {
            showBitmaps(bitmaps)
        }
    }

    func clear() {
        eventQueue.removeAll()
        lastUpdateTime = 0
        assImageView.image = nil
        assImageView.isHidden = true
        resetPlacement()
    }

    /// Forget the previous position after a seek without discarding sidecar cues.
    /// Text and bitmap cues redraw on the next update, and libass updates its image separately.
    func resetPlacement() {
        hideAll()
        lastPrimaryPlacement = []
        // Track changes and seeks reset alignment. Ordinary dialogue gaps preserve it.
        if let secondary = secondaryForStacking,
           secondary.stackingEnabled, !secondary.activeTextEvents.isEmpty {
            secondary.setLabelText(secondary.baseText)
            secondary.layoutTextLabel()
        }
    }

    /// Applies the Dart subtitle style. Colors are ARGB integers and fontSize uses the
    /// 24-based scale. verticalOffset is a fraction of picture height: it moves top
    /// text down and bottom text up, leaving middle text unchanged.
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
            authoredVerticalOffset = CGFloat(min(max(verticalOffset, 0), 1))
            setSubtitlePosition(basePosition: 100 - Int((verticalOffset * 60).rounded()))
        }
        if !activeTextEvents.isEmpty {
            showText(activeTextEvents)
        } else {
            updateSecondaryPlacement()
        }
    }

    /// Use the primary size and color when the secondary override is nil. Leave
    /// extra spacing and delay unchanged.
    func applySecondaryStyle(from primary: SubtitleOverlay, fontSize: Double?, textColor: Int?) {
        subtitleUserFontSize = fontSize.map { CGFloat(min(max($0, 6), 72)) }
            ?? primary.subtitleUserFontSize
        subtitleTextColor = textColor.map { Self.colorFromARGB($0) } ?? primary.subtitleTextColor
        subtitleFontWeight = primary.subtitleFontWeight
        subtitleBgColor = primary.subtitleBgColor
        subtitleStrokeColor = primary.subtitleStrokeColor
        subtitleStrokeEnabled = primary.subtitleStrokeEnabled
        authoredVerticalOffset = primary.authoredVerticalOffset
        subtitlePositionBase = primary.subtitlePositionBase
        if !activeTextEvents.isEmpty { showText(activeTextEvents) }
    }

    /// Sets the native 40 to 100 position scale used for the temporary controls lift and
    /// bitmap fallback. A value of 100 adds no bottom offset. Visible controls use
    /// min(base, 70).
    func setSubtitlePosition(basePosition: Int) {
        subtitlePositionBase = min(max(basePosition, 40), 100)
        for overlay in extraTextOverlays {
            overlay.setSubtitlePosition(basePosition: subtitlePositionBase)
        }
        requestLayout()
    }

    // MARK: - Display

    private static func effectiveAlignment(_ cue: SubtitleEvent?) -> Int {
        let value = cue?.alignment ?? 2
        return (1...9).contains(value) ? value : 2
    }

    /// An omitted alignment and an explicit bottom-center alignment mean the same
    /// place. Group by where a cue draws, not by whether it set that default.
    private static func textGroups(_ events: [SubtitleEvent]) -> [[SubtitleEvent]] {
        var groups: [[SubtitleEvent]] = []
        for event in events {
            if let index = groups.firstIndex(where: {
                Self.effectiveAlignment($0[0]) == Self.effectiveAlignment(event)
                    && $0[0].position == event.position
            }) {
                groups[index].append(event)
            } else {
                groups.append([event])
            }
        }
        if let normal = groups.firstIndex(where: {
            Self.effectiveAlignment($0[0]) == 2 && $0[0].position == nil
        }) {
            groups.swapAt(0, normal)
        }
        return groups
    }

    private func copyAppearance(to overlay: SubtitleOverlay) {
        overlay.delaySeconds = delaySeconds
        overlay.subtitleUserFontSize = subtitleUserFontSize
        overlay.subtitlePositionBase = subtitlePositionBase
        overlay.authoredVerticalOffset = authoredVerticalOffset
        overlay.subtitleFontWeight = subtitleFontWeight
        overlay.subtitleTextColor = subtitleTextColor
        overlay.subtitleBgColor = subtitleBgColor
        overlay.subtitleStrokeColor = subtitleStrokeColor
        overlay.subtitleStrokeEnabled = subtitleStrokeEnabled
    }

    private func showText(_ events: [SubtitleEvent]) {
        activeTextEvents = events
        for overlay in extraTextOverlays { overlay.removeFromSuperview() }
        extraTextOverlays.removeAll()
        guard !events.isEmpty else {
            baseTextEvents = []
            setTextHidden(true)
            setLabelText(nil)
            primaryForStacking?.layoutTextLabel()
            secondaryForStacking?.layoutTextLabel()
            return
        }
        // The secondary follows the primary position instead of reusing its own
        // authored positions. Primary text can have independent positioned cues.
        let groups = primaryForStacking != nil && stackingEnabled
            ? [events] : Self.textGroups(events)
        baseTextEvents = groups[0]
        for group in groups.dropFirst() {
            let overlay = SubtitleOverlay(frame: bounds)
            copyAppearance(to: overlay)
            overlay.videoRectProvider = { [weak self] in self?.videoBox ?? .zero }
            addSubview(overlay)
            overlay.setEvents(group)
            overlay.update(currentTime: lastUpdateTime)
            extraTextOverlays.append(overlay)
        }
        setLabelText(baseText)
        setTextHidden(false)
        layoutTextLabel()
        if let primary = primaryForStacking {
            primary.layoutTextLabel()
            layoutTextLabel()
        } else if let secondary = secondaryForStacking {
            // Both the text styling and the secondary position may have changed.
            if !secondary.baseTextEvents.isEmpty {
                secondary.setLabelText(secondary.baseText)
            }
            secondary.layoutTextLabel()
        }
        updateSecondaryPlacement()
    }

    private static func drawsTheSameBitmaps(
        _ lhs: [SubtitleEvent], _ rhs: [SubtitleEvent]
    ) -> Bool {
        lhs.count == rhs.count && zip(lhs, rhs).allSatisfy {
            $0.startTime == $1.startTime && $0.endTime == $1.endTime
                && $0.normalizedRect == $1.normalizedRect
                && $0.canvasSize == $1.canvasSize
                && $0.bitmapWidth == $1.bitmapWidth
                && $0.bitmapHeight == $1.bitmapHeight
                && $0.bitmap === $1.bitmap
        }
    }

    private func showBitmaps(_ events: [SubtitleEvent]) {
        defer { updateSecondaryPlacement() }
        activeBitmapEvents = events
        while extraBitmapViews.count < max(0, events.count - 1) {
            let view = PlatformImageView()
            #if canImport(UIKit)
            view.contentMode = .scaleToFill
            insertSubview(view, belowSubview: assImageView)
            #else
            view.imageScaling = .scaleAxesIndependently
            addSubview(view, positioned: .below, relativeTo: assImageView)
            #endif
            extraBitmapViews.append(view)
        }
        for (index, view) in ([bitmapView] + extraBitmapViews).enumerated() {
            let bitmap = index < events.count ? events[index].bitmap : nil
            view.image = bitmap.map(Self.platformImage)
            view.isHidden = bitmap == nil
        }
        layoutBitmapViews()
    }

    private func hideAll() {
        showText([])
        showBitmaps([])
    }

    private func setTextHidden(_ hidden: Bool) {
        textLabel.isHidden = hidden
        outlineLabel.isHidden = hidden
        if hidden { applyOverflowClip(nil, left: 0, right: bounds.width) }
    }

    /// Find room next to the primary without treating gaps between other cues
    /// as occupied. The optional range limits visible text if no gap fits.
    static func stackedSecondaryTop(
        occupied: [CGRect], anchor: CGRect, x: CGFloat, width: CGFloat,
        height: CGFloat, gap: CGFloat, preferBelow: Bool,
        minimumY: CGFloat, maximumY: CGFloat
    ) -> (top: CGFloat, clip: ClosedRange<CGFloat>?) {
        let desired = preferBelow ? anchor.maxY + gap : anchor.minY - gap - height
        let blocked = occupied
            .filter { $0.maxX > x && $0.minX < x + width }
            .map { (max(minimumY, $0.minY - gap), min(maximumY, $0.maxY + gap)) }
            .filter { $0.0 < $0.1 }
            .sorted { $0.0 < $1.0 }
        var free: [ClosedRange<CGFloat>] = []
        var cursor = minimumY
        for (start, end) in blocked {
            if start > cursor { free.append(cursor...start) }
            cursor = max(cursor, end)
        }
        if cursor < maximumY { free.append(cursor...maximumY) }

        var best: CGFloat?
        var bestDistance = CGFloat.infinity
        var bestOnPreferredSide = false
        for interval in free where interval.upperBound - interval.lowerBound >= height {
            let top = min(max(desired, interval.lowerBound), interval.upperBound - height)
            let distance = abs(top - desired)
            let onPreferredSide = preferBelow
                ? top >= anchor.maxY + gap - 0.001
                : top + height <= anchor.minY - gap + 0.001
            // Keep the track order when a farther gap fits on the intended side.
            if best == nil || (onPreferredSide && !bestOnPreferredSide) ||
                (onPreferredSide == bestOnPreferredSide && distance < bestDistance) {
                best = top
                bestDistance = distance
                bestOnPreferredSide = onPreferredSide
            }
        }
        if let best { return (best, nil) }

        // Not enough room for the full text. Show the largest free portion,
        // masking the rest so it can't cover another subtitle or a cutout.
        guard var largest = free.first else {
            return (minimumY, minimumY...minimumY)
        }
        for interval in free.dropFirst() {
            let space = interval.upperBound - interval.lowerBound
            let largestSpace = largest.upperBound - largest.lowerBound
            if space > largestSpace ||
                (space == largestSpace &&
                 abs(interval.lowerBound - desired) < abs(largest.lowerBound - desired)) {
                largest = interval
            }
        }
        return (largest.lowerBound, largest)
    }

    /// Mask only the secondary text, not the overlay's video-compositing backing.
    /// In crowded layouts it must not bleed into another cue or a screen cutout.
    private func applyOverflowClip(
        _ visibleY: ClosedRange<CGFloat>?, left: CGFloat, right: CGFloat
    ) {
        guard let visibleY else {
            #if canImport(UIKit)
            textLabel.layer.mask = nil
            outlineLabel.layer.mask = nil
            #else
            textLabel.layer?.mask = nil
            outlineLabel.layer?.mask = nil
            #endif
            return
        }
        let visible = CGRect(
            x: left, y: visibleY.lowerBound,
            width: max(0, right - left),
            height: max(0, visibleY.upperBound - visibleY.lowerBound))
        for (label, mask) in [
            (textLabel, textOverflowMask), (outlineLabel, outlineOverflowMask)
        ] {
            let local = visible.offsetBy(
                dx: -label.frame.minX, dy: -label.frame.minY).intersection(label.bounds)
            mask.frame = label.bounds
            mask.path = CGPath(rect: local.isNull ? .zero : local, transform: nil)
            #if canImport(UIKit)
            label.layer.mask = mask
            #else
            label.wantsLayer = true
            label.layer?.mask = mask
            #endif
        }
    }

    /// Local safe-area insets can be zero inside Flutter's platform view. Convert
    /// the window/root safe regions into this overlay's coordinates, so a video
    /// surface already inset around the camera housing isn't inset again.
    private var effectiveTextSafeAreaInsets: PlatformEdgeInsets {
        #if os(iOS)
        guard let window else { return safeAreaInsets }
        var inherited = [
            convert(window.bounds.inset(by: window.safeAreaInsets), from: window)
        ]
        if let root = window.rootViewController?.view {
            inherited.append(convert(root.bounds.inset(by: root.safeAreaInsets), from: root))
        }
        return Self.resolvedSafeAreaInsets(
            bounds: bounds, local: safeAreaInsets, inheritedRects: inherited)
        #else
        return safeAreaInsets
        #endif
    }

    #if os(iOS)
    static func resolvedSafeAreaInsets(
        bounds: CGRect, local: UIEdgeInsets, inheritedRects: [CGRect]
    ) -> UIEdgeInsets {
        var result = local
        for rect in inheritedRects {
            let safe = bounds.intersection(rect)
            guard safe.width > 0, safe.height > 0 else { continue }
            result.top = max(result.top, safe.minY - bounds.minY)
            result.left = max(result.left, safe.minX - bounds.minX)
            result.bottom = max(result.bottom, bounds.maxY - safe.maxY)
            result.right = max(result.right, bounds.maxX - safe.maxX)
        }
        return result
    }
    #endif

    private func layoutTextLabel() {
        guard !textLabel.isHidden else { return }
        let topFallback =
            stackingEnabled && primaryForStacking?.secondaryUsesTopFallback == true
        let placement = primaryForStacking != nil && stackingEnabled ? nil
            : activeTextPlacement
        let alignment = topFallback ? 8
            : primaryForStacking != nil && stackingEnabled
                ? currentAlignment : Self.effectiveAlignment(placement)
        let layout = textLayout(
            for: textLabel, placement: placement, alignment: alignment,
            centeredPair: !topFallback && (currentAlignment - 1) / 3 == 1)
        textLabel.frame = layout.frame
        outlineLabel.frame = layout.frame
        applyOverflowClip(layout.clip, left: layout.left, right: layout.right)
        rememberPrimaryPlacement()
    }

    /// Visible text and retained primary groups use the same measurement,
    /// safe-area bounds and placement rules.
    private func textLayout(
        for label: PlatformLabel, placement: SubtitleEvent?, alignment: Int, centeredPair: Bool
    ) -> (frame: CGRect, clip: ClosedRange<CGFloat>?, left: CGFloat, right: CGFloat) {
        // An alignment-only cue still uses the screen edges. An explicit
        // authored coordinate is the case that may deliberately enter a cutout.
        let usesSafeArea = placement?.position == nil
        let safeInsets = effectiveTextSafeAreaInsets
        let safeWidth = usesSafeArea
            ? bounds.width - safeInsets.left - safeInsets.right : bounds.width
        let maxWidth = max(1, safeWidth * 0.9)
        let size = label.sizeThatFits(
            CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude))
        let column = (alignment - 1) % 3
        let row = (alignment - 1) / 3
        let picture = videoBox
        let xAnchor = placement?.position.map { picture.minX + $0.x * picture.width }
            ?? bounds.width * ([0.05, 0.5, 0.95][column])
        let yAnchor = placement?.position.map { position -> CGFloat in
            let direction: CGFloat = position.y < 1.0 / 3 ? 1
                : position.y > 2.0 / 3 ? -1 : 0
            // Bottom cues keep their authored baseline while using the same
            // temporary controls lift as unpositioned text.
            let offset = direction < 0 ? textBottomOffset
                : picture.height * authoredVerticalOffset
            let y = position.y * picture.height + direction * offset
            return picture.minY + min(max(y, 0), picture.height)
        } ?? (row == 0 ? bounds.height - textBottomOffset
                : row == 1 ? bounds.height / 2
                    : textBottomOffset)
        var x = xAnchor - size.width * CGFloat(column) / 2
        var y = yAnchor - size.height * CGFloat(2 - row) / 2
        let gap = 8 * canvasScale
        let minimumX: CGFloat = usesSafeArea ? safeInsets.left : 0
        let maximumX: CGFloat = usesSafeArea
            ? bounds.width - safeInsets.right : bounds.width
        let minimumY: CGFloat = usesSafeArea ? safeInsets.top : 0
        let maximumY: CGFloat = usesSafeArea
            ? bounds.height - safeInsets.bottom : bounds.height
        x = min(max(x, minimumX), max(minimumX, maximumX - size.width))
        var overflowClip: ClosedRange<CGFloat>?
        let primary = stackingEnabled ? primaryForStacking : nil
        let occupied = primary?.stackingRegions ?? []
        if let primary, primary.secondaryUsesTopFallback {
            // The primary's authored offset remains the shared base position.
            // Secondary Position adds only its relative 0...+6% adjustment.
            let top = picture.minY + picture.height * (
                primary.authoredVerticalOffset + CGFloat(secondaryVerticalAdjustment))
            x = minimumX + max(0, maximumX - minimumX - size.width) / 2
            y = min(max(top, minimumY), max(minimumY, maximumY - size.height))
        } else if let primary, let parentFrame = occupied.first {
            let parentAlignment = primary.currentAlignment
            let parentColumn = (parentAlignment - 1) % 3
            let parentRow = (parentAlignment - 1) / 3
            x = parentColumn == 0 ? parentFrame.minX
                : parentColumn == 2 ? parentFrame.maxX - size.width
                : parentFrame.midX - size.width / 2
            x = min(max(x, minimumX), max(minimumX, maximumX - size.width))
            let pairGap = max(2 * canvasScale, gap +
                CGFloat(secondaryVerticalAdjustment) * bounds.height)
            let resolved = Self.stackedSecondaryTop(
                occupied: occupied, anchor: parentFrame,
                x: x, width: size.width, height: size.height, gap: pairGap,
                preferBelow: parentRow == 2,
                minimumY: minimumY, maximumY: maximumY)
            y = resolved.top
            overflowClip = resolved.clip
        } else if centeredPair, let secondary = secondaryForStacking,
                  secondary.stackingEnabled {
            let pairGap = max(2 * canvasScale, gap +
                CGFloat(secondary.secondaryVerticalAdjustment) * bounds.height)
            let candidateY = min(max(yAnchor + pairGap / 2, minimumY),
                                 max(minimumY, maximumY - size.height))
            let candidate = CGRect(x: x, y: candidateY, width: size.width, height: size.height)
            // A centered pair must not move the primary into another primary cue.
            // Remeasure source placements so dialogue gaps and resizes agree.
            let references = activeTextEvents.isEmpty ? lastPrimaryPlacement : currentPrimaryPlacement
            let overlapsPrimary = references.contains { reference in
                if case .text(_, isMain: true) = reference { return false }
                return primaryPlacementFrame(reference)?.intersects(candidate) == true
            }
            if !overlapsPrimary { y = candidateY }
        }
        if overflowClip == nil {
            y = min(max(y, minimumY), max(minimumY, maximumY - size.height))
        }
        return (CGRect(x: x, y: y, width: size.width, height: size.height),
                overflowClip, minimumX, maximumX)
    }

    private func layoutBitmapViews() {
        for (index, event) in activeBitmapEvents.enumerated() {
            let view = index == 0 ? bitmapView : extraBitmapViews[index - 1]
            if let frame = bitmapFrame(for: event) { view.frame = frame }
        }
    }

    private func bitmapFrame(for event: SubtitleEvent) -> CGRect? {
        let box = videoBox
        if let rect = event.normalizedRect, let canvas = event.canvasSize,
            canvas.width > 0, canvas.height > 0
        {
            // Authored image regions share one composition canvas.
            let scale = box.width / canvas.width
            let canvasHeight = canvas.height * scale
            let yOrigin = box.midY - canvasHeight / 2
            return CGRect(
                x: box.minX + rect.origin.x * box.width,
                y: yOrigin + rect.origin.y * canvasHeight,
                width: rect.size.width * box.width,
                height: rect.size.height * canvasHeight
            )
        } else if event.bitmapWidth > 0 {
            let scale = min(bounds.width / CGFloat(event.bitmapWidth), 1.0)
            let w = CGFloat(event.bitmapWidth) * scale
            let h = CGFloat(event.bitmapHeight) * scale
            return CGRect(
                x: (bounds.width - w) / 2,
                y: bounds.height - h - bitmapBottomOffset,
                width: w, height: h
            )
        }
        return nil
    }

    private func labelFont() -> PlatformFont {
        PlatformFont.systemFont(ofSize: subtitleFontSize, weight: subtitleFontWeight)
    }

    /// Set paragraph alignment on the attributed string from the cue alignment. Use the
    /// glyph height for line spacing so background fills don't leave gaps between
    /// lines.
    private func paragraphStyle(for font: PlatformFont, alignment: Int? = nil) -> NSParagraphStyle {
        let style = NSMutableParagraphStyle()
        let column = ((alignment ?? currentAlignment) - 1) % 3
        style.alignment = column == 0 ? .left : (column == 2 ? .right : .center)
        let glyphBox = font.ascender - font.descender
        style.minimumLineHeight = glyphBox
        style.maximumLineHeight = glyphBox
        return style
    }

    private func styledFont(for run: SubtitleStyledRun) -> PlatformFont {
        let font = PlatformFont.systemFont(
            ofSize: subtitleFontSize, weight: run.isBold ? .bold : subtitleFontWeight)
        guard run.isItalic else { return font }
        #if canImport(UIKit)
        let traits = font.fontDescriptor.symbolicTraits.union(.traitItalic)
        guard let descriptor = font.fontDescriptor.withSymbolicTraits(traits) else { return font }
        return PlatformFont(descriptor: descriptor, size: subtitleFontSize)
        #else
        return NSFontManager.shared.convert(font, toHaveTrait: .italicFontMask)
        #endif
    }

    private func applyInlineEmphasis(
        to text: NSAttributedString, events: [SubtitleEvent]? = nil
    ) -> NSAttributedString {
        let events = events ?? baseTextEvents
        guard events.contains(where: { $0.styledRuns != nil }) else { return text }
        let result = NSMutableAttributedString(attributedString: text)
        var location = 0
        for (index, event) in events.enumerated() {
            if index > 0 { location += 1 }  // Joined cues have one newline between them.
            let length = event.text?.utf16.count ?? 0
            if let runs = event.styledRuns,
               runs.reduce(0, { $0 + $1.text.utf16.count }) == length {
                var runStart = location
                for run in runs {
                    let runLength = run.text.utf16.count
                    let range = NSRange(location: runStart, length: runLength)
                    if runLength > 0 {
                        if run.isBold || run.isItalic {
                            result.addAttribute(.font, value: styledFont(for: run), range: range)
                        }
                        if run.isUnderlined {
                            result.addAttribute(
                                .underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
                        }
                        if run.isStruckThrough {
                            result.addAttribute(
                                .strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: range)
                        }
                    }
                    runStart += runLength
                }
            }
            location += length
        }
        return result
    }

    private func fillText(_ text: String, alignment: Int? = nil) -> NSAttributedString {
        let font = labelFont()
        return NSAttributedString(
            string: text,
            attributes: [
                .font: font,
                .foregroundColor: subtitleTextColor,
                .paragraphStyle: paragraphStyle(for: font, alignment: alignment),
            ])
    }

    /// What sits under the text: the background box, and the outline when one
    /// is wanted. The outline is its own copy of the line rather than a stroke
    /// on the glyphs, since a stroke traces every contour a glyph is built from
    /// and letters made of overlapping pieces come out with the seams drawn
    /// across them. The fill on top covers those, leaving only the half of the
    /// line that falls outside the letter.
    private func outlineText(_ text: String) -> NSAttributedString {
        let font = labelFont()
        var attrs: [NSAttributedString.Key: Any] = [
            .font: font,
            // Nothing to fill here, or this copy shows through as a second set
            // of glyphs whenever there is no outline to draw.
            .foregroundColor: PlatformColor.clear,
            // Must match the fill, or the outline drifts off the letters.
            .paragraphStyle: paragraphStyle(for: font),
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
