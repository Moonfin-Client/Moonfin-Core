import UIKit
import QuartzCore
import XCTest
@testable import Runner

private func cue(_ text: String, start: Double = 1, end: Double = 3,
                 alignment: Int? = nil, position: CGPoint? = nil) -> SubtitleEvent {
    SubtitleEvent(startTime: start, endTime: end, text: text,
        bitmap: nil, bitmapWidth: 0, bitmapHeight: 0, alignment: alignment, position: position)
}

private func assertReloadEventOrder(_ restoresBeforeReady: Bool,
    readiness: (Bool) -> Bool, restoration: (Bool, Bool) -> Bool) {
    if restoresBeforeReady {
        XCTAssertFalse(restoration(true, false))
        XCTAssertTrue(readiness(true))
    } else {
        XCTAssertFalse(readiness(false))
        XCTAssertTrue(restoration(true, true))
    }
}

@MainActor
private extension SubtitleOverlay {
    var caption: UILabel { subviews.compactMap { $0 as? UILabel }.last! }
    var groups: [SubtitleOverlay] { subviews.compactMap { $0 as? SubtitleOverlay } }
    var images: [UIImageView] {
        subviews.compactMap { $0 as? UIImageView }.filter { !$0.isHidden && $0.image != nil }
    }
    func show(_ events: [SubtitleEvent], at time: Double = 2) {
        setEvents(events)
        update(currentTime: time)
    }
    func style(fontSize: Double? = nil, offset: Double? = nil) {
        applyStyle(textColor: nil, backgroundColor: nil, strokeColor: nil,
                   fontSize: fontSize, fontWeight: nil, verticalOffset: offset)
    }
}

@MainActor
private final class OverlayPair {
    let primary = SubtitleOverlay(frame: CGRect(x: 0, y: 0, width: 800, height: 400))
    let secondary = SubtitleOverlay(frame: CGRect(x: 0, y: 0, width: 800, height: 400))
    init(stacking: Bool = true) {
        primary.secondaryForStacking = secondary
        secondary.primaryForStacking = primary
        secondary.stackingEnabled = stacking
    }
    func tick(_ time: Double) {
        primary.update(currentTime: time)
        secondary.update(currentTime: time)
    }
    func layout() {
        primary.layoutIfNeeded()
        secondary.layoutIfNeeded()
    }
    func picture(_ rect: CGRect) {
        for overlay in [primary, secondary] {
            overlay.videoRectProvider = { rect }
            overlay.refreshVideoGeometry()
        }
        layout()
    }
}

final class RunnerTests: XCTestCase {
    @MainActor
    private func image() -> CGImage {
        UIGraphicsImageRenderer(size: CGSize(width: 100, height: 40)).image { context in
            UIColor.white.setFill()
            context.fill(CGRect(x: 0, y: 0, width: 100, height: 40))
        }.cgImage!
    }

    @MainActor
    func testAlignmentOnlyTextUsesTheSameTopAndBottomMarginInEveryColumn() {
        for alignment in 1...9 {
            let f = OverlayPair(stacking: false)
            f.primary.show([cue("Primary", alignment: alignment)])
            let original = f.primary.caption.frame
            for offset in [0.0, 0.36, 0.0] {
                f.primary.style(offset: offset)
                f.layout()
                let frame = f.primary.caption.frame
                let row = (alignment - 1) / 3
                let edge = row == 0 ? frame.maxY : row == 1 ? frame.midY : frame.minY
                let expected = row == 0 ? 400 * (1 - offset) : row == 1 ? 200 : 400 * offset
                XCTAssertEqual(edge, CGFloat(expected), accuracy: 0.1)
                XCTAssertEqual(frame.minX, original.minX, accuracy: 0.1)
            }
        }
    }

    @MainActor
    func testPositionedPrimaryStacksByScreenRegionAndResetsOnPrimaryOff() {
        for (alignment, position) in [(2, CGPoint(x: 0.5, y: 0.1)), (8, CGPoint(x: 0.5, y: 0.9)),
            (2, CGPoint(x: 0.5, y: 0.5)), (7, CGPoint(x: 0.1, y: 0.1)), (9, CGPoint(x: 0.9, y: 0.1))] {
            let f = OverlayPair()
            f.secondary.secondaryVerticalAdjustment = 0.04
            f.primary.show([cue("Primary", alignment: alignment, position: position)])
            f.secondary.show([cue("Secondary", end: 8)])
            let main = f.primary.caption.frame
            var stacked = f.secondary.caption.frame
            XCTAssertTrue(position.y < 1.0 / 3 ? stacked.minY > main.maxY : stacked.maxY < main.minY)
            if position.y == 0.5 {
                XCTAssertEqual((stacked.maxY + main.minY) / 2, 200, accuracy: 0.1)
            }
            func alignmentOfSecondary() -> NSTextAlignment? {
                (f.secondary.caption.attributedText?.attribute(.paragraphStyle, at: 0,
                    effectiveRange: nil) as? NSParagraphStyle)?.alignment
            }
            let expected: NSTextAlignment = alignment == 7 ? .left : alignment == 9 ? .right : .center
            XCTAssertEqual(alignmentOfSecondary(), expected)
            f.secondary.show([cue("One\nTwo\nThree", end: 8)])
            XCTAssertEqual(f.primary.caption.frame, main)
            let expanded = f.secondary.caption.frame
            XCTAssertEqual(position.y < 1.0 / 3 ? expanded.minY : expanded.maxY,
                           position.y < 1.0 / 3 ? stacked.minY : stacked.maxY, accuracy: 0.1)
            stacked = expanded
            f.tick(4)
            XCTAssertEqual(f.secondary.caption.frame, stacked)
            XCTAssertEqual(alignmentOfSecondary(), expected)
            f.primary.clear()
            XCTAssertEqual(f.secondary.caption.frame.maxY, 400, accuracy: 0.1)
            XCTAssertEqual(alignmentOfSecondary(), .center)
            XCTAssertEqual(f.secondary.activeText, "One\nTwo\nThree")
        }
    }

    @MainActor
    func testGapRemeasuresFontSpacingGeometryAndControlsWithoutRedrawingPrimary() {
        for change in ["font", "spacing", "geometry", "offset"] {
            let f = OverlayPair()
            let letterbox = CGRect(x: 0, y: 50, width: 800, height: 300)
            f.picture(letterbox)
            var event = cue("First line\nSecond line", alignment: change == "spacing" ? 5 : 2,
                            position: change == "geometry" ? CGPoint(x: 0.5, y: 0.85) : nil)
            event.styledRuns = [SubtitleStyledRun(text: event.text!, isBold: true, isItalic: true,
                                                isUnderlined: false, isStruckThrough: false)]
            f.primary.show([event])
            f.secondary.show([cue("Secondary", end: 8)])
            let original = f.secondary.caption.frame
            f.tick(4)
            switch change {
            case "font":
                f.primary.style(fontSize: 48)
                f.secondary.applySecondaryStyle(from: f.primary, fontSize: 24, textColor: nil)
                XCTAssertLessThan(f.secondary.caption.frame.maxY, original.maxY)
            case "spacing":
                f.secondary.secondaryVerticalAdjustment = 0.04
                f.layout()
                XCTAssertEqual(f.secondary.caption.frame.maxY, original.maxY - 8, accuracy: 0.1)
            case "geometry":
                f.picture(CGRect(x: 0, y: 0, width: 800, height: 400))
                XCTAssertGreaterThan(f.secondary.caption.frame.midY, original.midY)
            default:
                f.primary.style(offset: 0.12)
                f.secondary.applySecondaryStyle(from: f.primary, fontSize: nil, textColor: nil)
                f.layout()
                XCTAssertEqual(f.secondary.caption.frame.minY, original.minY - 36, accuracy: 0.1)
                for (position, lift) in [(70, 100.0), (93, 36.0), (70, 100.0)] {
                    f.primary.setSubtitlePosition(basePosition: position)
                    f.secondary.setSubtitlePosition(basePosition: position)
                    f.layout()
                    XCTAssertEqual(f.secondary.caption.frame.minY, original.minY - lift, accuracy: 0.1)
                }
            }
            let gap = f.secondary.caption.frame
            XCTAssertTrue(f.primary.caption.isHidden, change)
            XCTAssertEqual(f.primary.activeText, "", change)
            f.tick(2)
            XCTAssertEqual(f.secondary.caption.frame, gap, change)
            if change == "geometry" {
                XCTAssertEqual(f.primary.caption.text, event.text)
                f.tick(4)
                f.picture(letterbox)
                XCTAssertEqual(f.secondary.caption.frame, original)
            }
            if change == "offset" {
                f.primary.clear()
                for (position, bottom) in [(93, 364.0), (70, 300.0), (93, 364.0)] {
                    f.secondary.setSubtitlePosition(basePosition: position)
                    f.layout()
                    XCTAssertEqual(f.secondary.caption.frame.maxY, bottom, accuracy: 0.1)
                }
            }
        }
    }

    @MainActor
    func testSeekResetsPlacementWithoutDiscardingQueuedCues() {
        let f = OverlayPair()
        f.primary.setEvents([cue("Top left", alignment: 7), cue("Later", start: 10, end: 12)])
        f.secondary.setEvents([cue("Secondary", start: 0, end: 15)])
        for target in [6.0, 0.5] {
            f.tick(2)
            let previous = f.secondary.caption.frame
            f.primary.resetPlacement()
            f.tick(target)
            XCTAssertEqual(f.primary.activeText, "")
            XCTAssertEqual(f.secondary.activeText, "Secondary")
            XCTAssertGreaterThan(f.secondary.caption.frame.minY, 200)
            f.primary.resetPlacement()
            f.tick(2)
            XCTAssertEqual(f.primary.activeText, "Top left")
            XCTAssertEqual(f.secondary.caption.frame, previous)
        }
        f.tick(11)
        XCTAssertEqual(f.primary.activeText, "Later")
        XCTAssertEqual(f.secondary.activeText, "Secondary")
    }

    @MainActor
    func testBitmapRegionsStayVisibleAndReservePlacementThroughGapsAndResizes() {
        let f = OverlayPair()
        let bitmap = image()
        func event(_ y: CGFloat) -> SubtitleEvent {
            SubtitleEvent(startTime: 1, endTime: 3, text: nil, bitmap: bitmap,
                bitmapWidth: 100, bitmapHeight: 40,
                normalizedRect: CGRect(x: 0.25, y: y, width: 0.5, height: 0.1),
                canvasSize: CGSize(width: 800, height: 300))
        }
        f.picture(CGRect(x: 0, y: 50, width: 800, height: 300))
        f.secondary.show([cue("Secondary", end: 8)])
        f.primary.show([event(0.65), event(0.8)])
        XCTAssertEqual(f.primary.images.count, 2)
        XCTAssertLessThan(f.secondary.caption.frame.maxY, f.primary.images.map(\.frame.minY).min()!)
        f.primary.show([event(0.8)])
        XCTAssertEqual(f.primary.images.count, 1)
        let original = f.secondary.caption.frame
        XCTAssertLessThan(original.maxY, 290)
        XCTAssertEqual(original.midX, 400, accuracy: 0.1)
        f.tick(4)
        XCTAssertEqual(f.secondary.caption.frame, original)
        f.picture(CGRect(x: 100, y: 50, width: 600, height: 300))
        let resized = f.secondary.caption.frame
        XCTAssertEqual(resized.minY, original.minY - 22.5, accuracy: 0.1)
        f.tick(2)
        XCTAssertEqual(f.secondary.caption.frame, resized)
    }

    @MainActor
    func testAssPrimaryUsesStableTopFallbackAcrossRedraws() {
        let f = OverlayPair()
        f.primary.secondaryUsesTopFallback = true
        f.primary.style(offset: 0.04)
        f.secondary.secondaryVerticalAdjustment = 0.02
        f.secondary.show([cue("Secondary")])
        f.layout()

        let original = f.secondary.caption.frame
        XCTAssertEqual(original.minY, 24, accuracy: 0.1)
        XCTAssertEqual(original.midX, 400, accuracy: 0.1)

        let bitmap = image()
        f.primary.showAssImage(bitmap)
        f.layout()
        XCTAssertEqual(f.secondary.caption.frame, original)
        f.primary.showAssImage(nil)
        f.layout()
        XCTAssertEqual(f.secondary.caption.frame, original)
        f.primary.showAssImage(bitmap)
        f.layout()
        XCTAssertEqual(f.secondary.caption.frame, original)

        f.secondary.secondaryVerticalAdjustment = 0.06
        f.layout()
        XCTAssertEqual(f.secondary.caption.frame.minY, 40, accuracy: 0.1)

        // Fit/fill geometry can move the stable lane, but ASS redraws can't.
        f.picture(CGRect(x: 100, y: 50, width: 600, height: 300))
        let resized = f.secondary.caption.frame
        XCTAssertEqual(resized.minY, 80, accuracy: 0.1)
        XCTAssertEqual(resized.midX, 400, accuracy: 0.1)
        f.primary.showAssImage(bitmap)
        f.layout()
        XCTAssertEqual(f.secondary.caption.frame, resized)
    }

    @MainActor
    func testBothTracksPreserveEmphasisAndCanRestyleIdenticalCues() {
        let f = OverlayPair()
        f.secondary.applySecondaryStyle(from: f.primary, fontSize: 18, textColor: 0xFFFFFF00)
        var event = cue("Normal bold italic underlined")
        event.styledRuns = [
            SubtitleStyledRun(text: "Normal ", isBold: false, isItalic: false, isUnderlined: false, isStruckThrough: false),
            SubtitleStyledRun(text: "bold italic ", isBold: true, isItalic: true, isUnderlined: false, isStruckThrough: false),
            SubtitleStyledRun(text: "underlined", isBold: false, isItalic: false, isUnderlined: true, isStruckThrough: false)]
        for overlay in [f.primary, f.secondary] {
            overlay.show([event])
            let text = overlay.caption.attributedText!
            let font = text.attribute(.font, at: 7, effectiveRange: nil) as! UIFont
            XCTAssertTrue(font.fontDescriptor.symbolicTraits.contains([.traitBold, .traitItalic]))
            XCTAssertEqual(text.attribute(.underlineStyle, at: 19, effectiveRange: nil) as? Int,
                           NSUnderlineStyle.single.rawValue)
            XCTAssertNil(text.attribute(.underlineStyle, at: 0, effectiveRange: nil))
        }
        XCTAssertEqual(f.secondary.caption.attributedText?.attribute(
            .foregroundColor, at: 0, effectiveRange: nil) as? UIColor, .yellow)
        event.styledRuns = nil
        f.primary.setEvents([event])
        let reset = f.primary.caption.attributedText!.attribute(.font, at: 7, effectiveRange: nil) as! UIFont
        XCTAssertFalse(reset.fontDescriptor.symbolicTraits.contains(.traitItalic))
    }

    @MainActor
    func testPrimaryGroupsKeepStyleAndAvoidCollisionsThroughControlsAndGaps() {
        for centered in [false, true] {
            let f = OverlayPair(stacking: false)
            if !centered { f.picture(CGRect(x: 0, y: 50, width: 800, height: 300)) }
            f.secondary.secondaryVerticalAdjustment = centered ? 0.06 : 0
            let top = cue("First speaker", alignment: centered ? 5 : 8,
                          position: CGPoint(x: 0.5, y: centered ? 0.5 : 0.1))
            var bottom = cue("Italic", start: 1.1, alignment: centered ? 8 : 2,
                             position: CGPoint(x: 0.5, y: centered ? 0.56 : 0.85))
            bottom.styledRuns = [SubtitleStyledRun(text: "Italic", isBold: false, isItalic: true,
                                                 isUnderlined: false, isStruckThrough: false)]
            f.primary.show([top, bottom])
            var extra = f.primary.groups.first!
            let topFrame = f.primary.caption.frame
            let bottomFrame = extra.caption.frame
            let font = extra.caption.attributedText!.attribute(.font, at: 0, effectiveRange: nil) as! UIFont
            XCTAssertTrue(font.fontDescriptor.symbolicTraits.contains(.traitItalic))
            XCTAssertLessThan(topFrame.maxY, bottomFrame.minY)
            if !centered {
                f.primary.style(offset: 0.04) // Four percent of the picture height is 12pt.
                // Applying style rebuilds the positioned text groups.
                extra = f.primary.groups.first!
                let restyledFont = extra.caption.attributedText!.attribute(.font, at: 0, effectiveRange: nil) as! UIFont
                XCTAssertTrue(restyledFont.fontDescriptor.symbolicTraits.contains(.traitItalic))
                for (position, lift) in [(70, 100.0), (98, 12.0)] {
                    f.primary.setSubtitlePosition(basePosition: position)
                    f.layout()
                    XCTAssertEqual(f.primary.caption.frame.minY, topFrame.minY + 12, accuracy: 0.1)
                    XCTAssertEqual(extra.caption.frame.maxY, bottomFrame.maxY - lift, accuracy: 0.1)
                }
            }
            let main = f.primary.caption.frame
            let lower = extra.caption.frame
            f.secondary.stackingEnabled = true
            f.secondary.show([cue("Secondary", end: 8)])
            f.layout()
            let active = f.secondary.caption.frame
            XCTAssertFalse(active.intersects(main))
            XCTAssertFalse(active.intersects(lower))
            XCTAssertNil(f.secondary.caption.layer.mask)
            if centered {
                f.tick(4)
                XCTAssertEqual(f.primary.activeText, "")
                XCTAssertEqual(f.secondary.caption.frame, active)
                f.secondary.secondaryVerticalAdjustment = 0.04
                f.layout()
                let gap = f.secondary.caption.frame
                XCTAssertNotEqual(gap, active)
                f.tick(2)
                XCTAssertEqual(f.primary.caption.frame, main)
                XCTAssertEqual(f.primary.groups.first!.caption.frame, lower)
                XCTAssertEqual(f.secondary.caption.frame, gap)
                XCTAssertLessThan(gap.maxY, main.minY)
            }
            f.primary.clear()
            XCTAssertTrue(f.primary.groups.isEmpty)
            bottom.alignment = 2
            bottom.position = nil
            f.primary.show([cue("First speaker"), bottom])
            XCTAssertTrue(f.primary.groups.isEmpty)
            XCTAssertEqual(f.primary.caption.text, "First speaker\nItalic")
        }
    }

    @MainActor
    func testSecondarySpacingIncreasesFromDefaultThroughSixPercent() {
        var previousGap: CGFloat?
        for spacing in [0.0, 0.02, 0.04, 0.06] {
            let f = OverlayPair()
            f.primary.show([cue("Primary")])
            f.secondary.secondaryVerticalAdjustment = spacing
            f.secondary.show([cue("Secondary", end: 8)])
            f.layout()
            XCTAssertFalse(f.secondary.caption.frame.intersects(f.primary.caption.frame))
            let gap = f.primary.caption.frame.minY - f.secondary.caption.frame.maxY
            if let previousGap { XCTAssertGreaterThan(gap, previousGap) }
            previousGap = gap
        }
    }

    @MainActor
    func testControlsClearanceNeverLowersAThirtySixPercentUserOffset() {
        let f = OverlayPair(stacking: false)
        f.primary.show([cue("Primary")])

        f.primary.style(offset: 0.36)
        f.layout()
        let high = f.primary.caption.frame
        f.primary.setSubtitlePosition(basePosition: 70)
        f.layout()
        XCTAssertEqual(f.primary.caption.frame, high)

        f.primary.style(offset: 0.20)
        f.layout()
        let lower = f.primary.caption.frame
        f.primary.setSubtitlePosition(basePosition: 70)
        f.layout()
        XCTAssertLessThan(f.primary.caption.frame.maxY, lower.maxY)
    }

    @MainActor
    func testStackedSecondaryPrefersTheIntendedSideBeforeUsingTheNearestGap() {
        for below in [false, true] {
            let anchor = CGRect(x: 50, y: below ? 200 : 700, width: 900, height: 100)
            let obstacle = CGRect(x: 50, y: below ? 360 : 400, width: 900, height: 240)
            let result = SubtitleOverlay.stackedSecondaryTop(
                occupied: [anchor, obstacle], anchor: anchor, x: 100, width: 800,
                height: 100, gap: 15, preferBelow: below, minimumY: 0, maximumY: 1000)
            XCTAssertEqual(result.top, below ? 615 : 285, accuracy: 0.001)
            XCTAssertNil(result.clip)
        }
        let nearTop = CGRect(x: 50, y: 50, width: 900, height: 100)
        let fallback = SubtitleOverlay.stackedSecondaryTop(
            occupied: [nearTop], anchor: nearTop, x: 100, width: 800,
            height: 100, gap: 15, preferBelow: false, minimumY: 0, maximumY: 1000)
        XCTAssertEqual(fallback.top, 165, accuracy: 0.001)
        XCTAssertNil(fallback.clip)
    }

    @MainActor
    func testOversizedSecondaryIsMaskedAndRecoversOnPrimaryOff() {
        let f = OverlayPair()
        f.primary.show([cue("Primary")])
        f.secondary.show([cue(Array(repeating: "Long subtitle line", count: 40).joined(separator: "\n"))])
        let mask = f.secondary.caption.layer.mask as? CAShapeLayer
        XCTAssertNotNil(mask)
        XCTAssertLessThan(mask!.path!.boundingBox.height, f.secondary.caption.frame.height)
        f.primary.clear()
        XCTAssertNil(f.secondary.caption.layer.mask)
    }

    @MainActor
    func testSecondaryReloadRestoresLatestOffInsteadOfOldTrack() {
        var state = SubtitleReloadState<AetherPlayerWrapper.SecondarySubtitleSelection>()
        let old = AetherPlayerWrapper.SecondarySubtitleSelection(embeddedTrackId: nil,
            url: URL(string: "https://example.com/old.srt")!)
        let off = AetherPlayerWrapper.SecondarySubtitleSelection(embeddedTrackId: nil, url: nil)
        state.startSource(old)
        state.beginReload(previouslyActive: true)
        state.remember(off)
        // Readiness alone is too early: Aether restores its stale old track
        // afterward. Wait for that activity publication, then overwrite it.
        XCTAssertFalse(state.shouldReapplyAtReadiness(active: false))
        XCTAssertFalse(state.shouldReapplyAfterRestoration(active: false, ready: true))
        XCTAssertTrue(state.shouldReapplyAfterRestoration(active: true, ready: true))
        XCTAssertEqual(state.takeLatest(), off)
        XCTAssertFalse(state.needsReapply)
        XCTAssertNil(state.takeLatest())
    }

    @MainActor
    func testSecondaryReloadRestoresNewerBAndPreviouslyOffSelections() {
        var state = SubtitleReloadState<AetherPlayerWrapper.SecondarySubtitleSelection>()
        let a = AetherPlayerWrapper.SecondarySubtitleSelection(embeddedTrackId: 1, url: nil)
        let b = AetherPlayerWrapper.SecondarySubtitleSelection(embeddedTrackId: 2, url: nil)
        state.startSource(a)
        state.beginReload(previouslyActive: true)
        state.remember(b)
        XCTAssertFalse(state.shouldReapplyAtReadiness(active: false))
        XCTAssertEqual(state.takeLatest(force: true), b,
            "A foreground reload completion must use the latest B choice")

        // With the old source Off there is no late active-track publication.
        state.startSource(.init(embeddedTrackId: nil, url: nil))
        state.beginReload(previouslyActive: false)
        state.remember(b)
        XCTAssertTrue(state.shouldReapplyAtReadiness(active: false))
        XCTAssertEqual(state.takeLatest(), b)

        // A new source must invalidate any old reconstruction snapshot.
        state.startSource(a)
        XCTAssertFalse(state.needsReapply)
        XCTAssertNil(state.takeLatest())
        XCTAssertEqual(state.latestChoice, a)
    }

    @MainActor
    func testPrimaryOffWinsAetherReloadForEitherEventOrder() {
        for restoresBeforeReady in [false, true] {
            var state = SubtitleReloadState<PrimarySubtitleChoice>()
            state.remember(.text(1, nil))
            state.beginReload(previouslyActive: true)
            state.remember(.off)
            assertReloadEventOrder(restoresBeforeReady,
                readiness: { state.shouldReapplyAtReadiness(active: $0) },
                restoration: { state.shouldReapplyAfterRestoration(active: $0, ready: $1) })
            XCTAssertEqual(state.takeLatest(), .off)
            XCTAssertNil(state.takeLatest())
        }
    }

    @MainActor
    func testPrimaryReloadReplaysNewerTextCaptionAndPreviouslyOff() {
        var state = SubtitleReloadState<PrimarySubtitleChoice>()
        state.remember(.text(1, nil))
        state.beginReload(previouslyActive: true)
        state.remember(.text(2, "https://example.com/second.srt"))
        XCTAssertEqual(state.takeLatest(force: true),
            .text(2, "https://example.com/second.srt"))

        state.reset()
        state.remember(.off)
        state.beginReload(previouslyActive: false)
        state.remember(.caption(1))
        XCTAssertTrue(state.shouldReapplyAtReadiness(active: false))
        XCTAssertEqual(state.takeLatest(), .caption(1))
        state.reset()
        XCTAssertNil(state.latestChoice)
        XCTAssertFalse(state.needsReapply)
    }

    @MainActor
    func testSecondaryReloadReplaysForEitherRestorationEventOrder() {
        let a = AetherPlayerWrapper.SecondarySubtitleSelection(embeddedTrackId: 1, url: nil)
        let b = AetherPlayerWrapper.SecondarySubtitleSelection(embeddedTrackId: 2, url: nil)
        for restoresBeforeReady in [false, true] {
            var state = SubtitleReloadState<AetherPlayerWrapper.SecondarySubtitleSelection>()
            state.startSource(a)
            state.beginReload(previouslyActive: true)
            state.remember(b)
            assertReloadEventOrder(restoresBeforeReady,
                readiness: { state.shouldReapplyAtReadiness(active: $0) },
                restoration: { state.shouldReapplyAfterRestoration(active: $0, ready: $1) })
            XCTAssertEqual(state.takeLatest(), b)
            XCTAssertFalse(state.shouldReapplyAtReadiness(active: true))
            XCTAssertFalse(state.shouldReapplyAfterRestoration(active: true, ready: true))
        }
    }

    @MainActor
    func testPositionedGroupsFollowDelayChangesWhilePaused() {
        let f = OverlayPair()
        for time in [42.0, 0.0] {
            f.primary.update(currentTime: 42)
            f.primary.clear()
            // Use the publisher's presentation method without supplying a later clock tick.
            AetherPlayerWrapper.presentSubtitleEvents(
                [cue("New language", start: max(0, time - 1), end: time + 3)], in: f.primary, at: time)
            XCTAssertEqual(f.primary.activeText, "New language")
        }
        f.primary.setEvents([(8.0, 10.0, "Early"), (10.0, 14.0, "Late")].flatMap { start, end, name in
            [cue("\(name) top", start: start, end: end, alignment: 8, position: CGPoint(x: 0.5, y: 0.1)),
             cue("\(name) bottom", start: start, end: end, position: CGPoint(x: 0.5, y: 0.85))]
        })
        for (delay, name) in [(0.0, "Late"), (4.0, "Early"), (3.0, "Early")] {
            f.primary.delaySeconds = delay
            f.primary.update(currentTime: 12)
            let nested = f.primary.groups.first!
            XCTAssertEqual(Set([f.primary.caption.text, nested.caption.text]), Set(["\(name) top", "\(name) bottom"]))
            XCTAssertEqual(nested.delaySeconds, delay, accuracy: 0.001)
        }
    }
}
