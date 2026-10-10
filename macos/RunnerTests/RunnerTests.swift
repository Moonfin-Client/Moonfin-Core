import Cocoa
import AVFoundation
import AetherEngine
import FlutterMacOS
import XCTest

@testable import Moonfin

/// Subtitle overlay cue selection. The overlay holds the only copy of a sidecar
/// track's cues (the engine publishes such a file once and clears its drain
/// target), so anything it drops is gone for the rest of the session.
final class SubtitleOverlayTests: XCTestCase {

    private func cue(_ body: String, _ start: TimeInterval, _ end: TimeInterval) -> SubtitleEvent {
        SubtitleEvent(
            startTime: start, endTime: end, text: body,
            bitmap: nil, bitmapWidth: 0, bitmapHeight: 0)
    }

    private let overlayBounds = CGRect(x: 0, y: 0, width: 1920, height: 1080)

    private func makeOverlay() -> SubtitleOverlay {
        SubtitleOverlay(frame: overlayBounds)
    }

    // MARK: - Selection

    func testCuesSharingAWindowAreAllSelected() {
        let cues = [cue("You know what I think?", 10, 14), cue("Maybe.", 11, 13)]
        let covering = SubtitleOverlay.activeEvents(in: cues, at: 12)
        XCTAssertEqual(covering.count, 2)
    }

    func testSelectionIsHalfOpenOnTheEndTime() {
        let cues = [cue("A", 10, 12), cue("B", 12, 14)]
        XCTAssertEqual(SubtitleOverlay.activeEvents(in: cues, at: 12).map(\.text), ["B"])
    }

    func testSelectionIsEmptyBetweenCues() {
        let cues = [cue("A", 10, 12), cue("B", 14, 16)]
        XCTAssertTrue(SubtitleOverlay.activeEvents(in: cues, at: 13).isEmpty)
    }

    // MARK: - Rendering

    func testSimultaneousSpeakersBothRender() {
        let overlay = makeOverlay()
        overlay.setEvents([cue("- Look at me.", 10, 14), cue("- I am looking.", 10, 14)])
        overlay.update(currentTime: 11)

        XCTAssertEqual(overlay.activeText, "- Look at me.\n- I am looking.")
    }

    /// The reported failure: a sidecar track publishes once, the clock jumps
    /// forward (a seek, a seam shift, a recovery reload landing on its target
    /// before the picture catches up) and then plays the skipped region. Every
    /// line in it has to still be there.
    func testCuesSurviveAForwardClockJump() {
        let overlay = makeOverlay()
        overlay.setEvents([
            cue("You know what I think?", 5, 7),
            cue("You have to forget her.", 9, 11),
            cue("Look at me.", 600, 602),
        ])

        overlay.update(currentTime: 601)
        XCTAssertEqual(overlay.activeText, "Look at me.")

        overlay.update(currentTime: 6)
        XCTAssertEqual(overlay.activeText, "You know what I think?")
        overlay.update(currentTime: 10)
        XCTAssertEqual(overlay.activeText, "You have to forget her.")
    }

    /// The engine rewrites a cue's end time in place to close an open-ended
    /// line, so identity cannot rest on the start time alone.
    func testARewrittenEndTimeRetiresTheLine() {
        let overlay = makeOverlay()
        overlay.setEvents([cue("Maybe.", 10, 20)])
        overlay.update(currentTime: 15)
        XCTAssertEqual(overlay.activeText, "Maybe.")

        overlay.setEvents([cue("Maybe.", 10, 12)])
        XCTAssertEqual(overlay.activeText, "")
    }

    func testClearDropsTheVisibleLine() {
        let overlay = makeOverlay()
        overlay.setEvents([cue("Look at me.", 10, 14)])
        overlay.update(currentTime: 11)
        XCTAssertFalse(overlay.activeText.isEmpty)

        overlay.clear()
        XCTAssertEqual(overlay.activeText, "")
    }

    // MARK: - ASS canvas

    // Only a picture that fits inside the overlay moves the canvas, every other
    // case lands on the bounds.

    private func canvas(forVideoRect rect: CGRect?) -> CGRect {
        let overlay = makeOverlay()
        if let rect {
            overlay.videoRectProvider = { rect }
        }
        return overlay.assCanvas
    }

    func testLetterboxedPictureIsTheCanvas() {
        let picture = CGRect(x: 0, y: 135, width: 1920, height: 810)
        XCTAssertEqual(canvas(forVideoRect: picture), picture)
    }

    func testPillarboxedPictureIsTheCanvas() {
        let picture = CGRect(x: 240, y: 0, width: 1440, height: 1080)
        XCTAssertEqual(canvas(forVideoRect: picture), picture)
    }

    func testFillModeStaysOnTheBounds() {
        let picture = CGRect(x: -480, y: 0, width: 2880, height: 1080)
        XCTAssertEqual(canvas(forVideoRect: picture), overlayBounds)
    }

    func testStretchStaysOnTheBounds() {
        XCTAssertEqual(canvas(forVideoRect: overlayBounds), overlayBounds)
    }

    func testNoMeasuredPictureStaysOnTheBounds() {
        XCTAssertEqual(canvas(forVideoRect: .zero), overlayBounds)
    }

    func testNoProviderStaysOnTheBounds() {
        XCTAssertEqual(canvas(forVideoRect: nil), overlayBounds)
    }
}

/// How a reader stall reaches the player UI. The spinner belongs to a picture
/// that has stopped, not to a connection that dropped while AVPlayer still has
/// frames to play.
final class StalledStateTests: XCTestCase {

    private func state(
        isNativePath: Bool = true,
        sawPlayback: Bool = true,
        isSeeking: Bool = false,
        isPlaying: Bool = true,
        isPaused: Bool = false,
        isBuffering: Bool = false,
        secondsSinceClockAdvanced: Double = 0.1
    ) -> PlayerState {
        AetherPlayerWrapper.stalledState(
            isNativePath: isNativePath,
            sawPlayback: sawPlayback,
            isSeeking: isSeeking,
            isPlaying: isPlaying,
            isPaused: isPaused,
            isBuffering: isBuffering,
            secondsSinceClockAdvanced: secondsSinceClockAdvanced,
            bufferProgress: 0.4)
    }

    func testReconnectWhileThePictureMovesKeepsPlaying() {
        XCTAssertEqual(state(), .playing)
    }

    func testAVPlayerWaitingShowsBuffering() {
        XCTAssertEqual(state(isBuffering: true), .buffering(0.4))
    }

    func testAFrozenClockShowsBufferingEvenIfAVPlayerNeverWaits() {
        XCTAssertEqual(state(secondsSinceClockAdvanced: 1), .buffering(0.4))
    }

    func testAClockJustUnderTheFreezeLimitKeepsPlaying() {
        XCTAssertEqual(state(secondsSinceClockAdvanced: 0.99), .playing)
    }

    func testPausingDuringAStallStaysPaused() {
        XCTAssertEqual(state(isPlaying: false, isPaused: true), .paused)
    }

    func testAStallBeforeTheFirstFrameStaysBuffering() {
        XCTAssertEqual(state(sawPlayback: false), .buffering(0.4))
    }

    func testAPausedMountThatStallsStaysBuffering() {
        XCTAssertEqual(
            state(sawPlayback: false, isPlaying: false, isPaused: true), .buffering(0.4))
    }

    func testASeekDuringAStallStaysBuffering() {
        XCTAssertEqual(state(isSeeking: true), .buffering(0.4))
    }

    func testTheSoftwareAndAudioPathsStayBuffering() {
        XCTAssertEqual(state(isNativePath: false), .buffering(0.4))
        XCTAssertEqual(
            state(isNativePath: false, isPlaying: false, isPaused: true), .buffering(0.4))
    }

    func testAnEngineLeavingPlaybackStaysBuffering() {
        XCTAssertEqual(state(isPlaying: false, isPaused: false), .buffering(0.4))
    }
}

/// A mid-play failure only goes to a server transcode when the stream is the
/// problem. A dead connection would fail the transcode the same way.
final class SessionErrorClassificationTests: XCTestCase {

    private func kind(_ engineKind: String?, domain: String? = nil) -> String {
        AetherPlayerWrapper.classifySessionError(engineKind: engineKind, underlyingDomain: domain)
    }

    func testADeadVODSourceIsANetworkFailure() {
        XCTAssertEqual(kind("vodSourceFailed"), "network")
    }

    func testRateLimitingIsANetworkFailure() {
        XCTAssertEqual(kind("sourceRateLimited"), "network")
    }

    func testANativeItemFailingOnAURLErrorIsANetworkFailure() {
        XCTAssertEqual(kind("nativeItemFailed", domain: NSURLErrorDomain), "network")
    }

    func testANativeItemFailingInAVFoundationStillTranscodes() {
        XCTAssertEqual(kind("nativeItemFailed", domain: "AVFoundationErrorDomain"), "unsupported_container")
    }

    func testARefusedSourceStillTranscodes() {
        XCTAssertEqual(kind("sourceRefused"), "unsupported_container")
    }

    func testAnUnclassifiedFailureStillTranscodes() {
        XCTAssertEqual(kind(nil), "unsupported_container")
    }
}

/// Reading the sidecars out of a setSource payload. They are declared with the
/// load because the engine clears its external registry when a load begins, so
/// a file handed over afterwards is dropped.
final class ExternalSubtitleTrackParsingTests: XCTestCase {

    func testBareFilesystemPathBecomesAFileURL() {
        let tracks = AetherPlayerWrapper.externalSubtitleTracks(from: [
            ["url": "/Downloads/Movie_sub_3.ass", "codec": "ass", "language": "eng"]
        ])
        XCTAssertEqual(tracks.count, 1)
        XCTAssertEqual(tracks.first?.url.isFileURL, true)
        XCTAssertEqual(tracks.first?.url.path, "/Downloads/Movie_sub_3.ass")
        XCTAssertEqual(tracks.first?.language, "eng")
        XCTAssertEqual(tracks.first?.formatHint, "ass")
    }

    func testRemoteUrlIsKeptAsIs() {
        let tracks = AetherPlayerWrapper.externalSubtitleTracks(from: [
            ["url": "https://host.test/Stream.srt", "codec": "srt"]
        ])
        XCTAssertEqual(tracks.first?.url.absoluteString, "https://host.test/Stream.srt")
    }

    func testOrderIsPreserved() {
        let tracks = AetherPlayerWrapper.externalSubtitleTracks(from: [
            ["url": "/a_sub_3.ass"], ["url": "/b_sub_4.ass"], ["url": "/c_sub_5.ass"],
        ])
        XCTAssertEqual(tracks.map { $0.url.lastPathComponent },
                       ["a_sub_3.ass", "b_sub_4.ass", "c_sub_5.ass"])
    }

    func testEntriesWithNoUsableUrlAreDropped() {
        let tracks = AetherPlayerWrapper.externalSubtitleTracks(from: [
            ["url": ""], ["codec": "srt"], ["url": "/good_sub_3.srt"],
        ])
        XCTAssertEqual(tracks.count, 1)
        XCTAssertEqual(tracks.first?.url.lastPathComponent, "good_sub_3.srt")
    }

    func testEmptyStringsDoNotBecomeTrackMetadata() {
        let tracks = AetherPlayerWrapper.externalSubtitleTracks(from: [
            ["url": "/x_sub_3.srt", "title": "", "language": "", "codec": ""]
        ])
        XCTAssertNil(tracks.first?.name)
        XCTAssertNil(tracks.first?.language)
        XCTAssertNil(tracks.first?.formatHint)
    }

    func testFlagsRideAlong() {
        let tracks = AetherPlayerWrapper.externalSubtitleTracks(from: [
            ["url": "/x_sub_3.srt", "isForced": true, "isDefault": true]
        ])
        XCTAssertEqual(tracks.first?.isForced, true)
        XCTAssertEqual(tracks.first?.isDefault, true)
    }

    func testAMissingOrMalformedPayloadYieldsNothing() {
        XCTAssertTrue(AetherPlayerWrapper.externalSubtitleTracks(from: nil).isEmpty)
        XCTAssertTrue(AetherPlayerWrapper.externalSubtitleTracks(from: "nonsense").isEmpty)
        XCTAssertTrue(AetherPlayerWrapper.externalSubtitleTracks(from: []).isEmpty)
    }
}

/// The Intel override depends on a private FlutterDartProject getter. If a
/// Flutter upgrade renames it, Intel Macs quietly go back to Impeller.
final class MoonfinDartProjectTests: XCTestCase {

    private func impellerEnabled(_ project: FlutterDartProject) -> Bool? {
        project.value(forKey: "enableImpeller") as? Bool
    }

    func testFlutterStillHasTheEnableImpellerGetter() {
        XCTAssertTrue(
            FlutterDartProject.instancesRespond(to: NSSelectorFromString("enableImpeller")))
    }

    func testIntelStaysOnSkiaAndAppleSiliconKeepsTheDefault() {
        #if arch(x86_64)
        XCTAssertEqual(impellerEnabled(MoonfinDartProject()), false)
        #else
        XCTAssertEqual(
            impellerEnabled(MoonfinDartProject()), impellerEnabled(FlutterDartProject()))
        #endif
    }
}

/// Exercises the production wrapper with whole-file subtitle decoding. No
/// network server, application account or copyrighted media is needed.
@MainActor
final class ExternalASSRenderingTests: XCTestCase {
    private func makeFixtures() async throws -> URL {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        var completed = false
        defer { if !completed { try? FileManager.default.removeItem(at: directory) } }
        let writer = try AVAssetWriter(outputURL: directory.appendingPathComponent("video.mp4"), fileType: .mp4)
        let input = AVAssetWriterInput(mediaType: .video, outputSettings: [
            AVVideoCodecKey: AVVideoCodecType.h264,
            AVVideoWidthKey: 640, AVVideoHeightKey: 360,
        ])
        let adaptor = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: input,
            sourcePixelBufferAttributes: [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32ARGB])
        writer.add(input)
        XCTAssertTrue(writer.startWriting())
        writer.startSession(atSourceTime: .zero)
        var pixelBuffer: CVPixelBuffer?
        XCTAssertEqual(CVPixelBufferCreate(kCFAllocatorDefault, 640, 360,
            kCVPixelFormatType_32ARGB, nil, &pixelBuffer), kCVReturnSuccess)
        let buffer = try XCTUnwrap(pixelBuffer)
        CVPixelBufferLockBaseAddress(buffer, [])
        memset(CVPixelBufferGetBaseAddress(buffer), 0, CVPixelBufferGetDataSize(buffer))
        CVPixelBufferUnlockBaseAddress(buffer, [])
        for second in [0, 30, 60] {
            for _ in 0..<100 where !input.isReadyForMoreMediaData {
                try await Task.sleep(for: .milliseconds(10))
            }
            XCTAssertTrue(adaptor.append(buffer, withPresentationTime: CMTime(value: Int64(second), timescale: 1)))
        }
        input.markAsFinished()
        await writer.finishWriting()
        XCTAssertEqual(writer.status, .completed)
        let header = """
        [Script Info]
        ScriptType: v4.00+
        PlayResX: 1920
        PlayResY: 1080
        [V4+ Styles]
        Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding
        Style: Default,Arial,64,&H000000FF,&H000000FF,&H00000000,&H80000000,0,0,0,0,100,100,0,0,1,5,1,8,80,80,80,1
        [Events]
        Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text
        Dialogue: 0,0:00:00.00,0:01:00.00,Default,,0,0,0,,Synthetic red sign
        """
        try header.write(to: directory.appendingPathComponent("red.ass"), atomically: true, encoding: .utf8)
        try header.replacingOccurrences(of: "&H000000FF", with: "&H0000FF00")
            .replacingOccurrences(of: "Synthetic red sign", with: "Synthetic green sign")
            .write(to: directory.appendingPathComponent("green.ass"), atomically: true, encoding: .utf8)
        try "1\n00:00:00,000 --> 00:01:00,000\nSynthetic plain caption\n"
            .write(to: directory.appendingPathComponent("plain.srt"), atomically: true, encoding: .utf8)
        completed = true
        return directory
    }

    private func waitUntil(_ condition: () -> Bool) async throws {
        for _ in 0..<200 {
            if condition() { return }
            try await Task.sleep(for: .milliseconds(50))
        }
        struct Timeout: Error {}
        XCTFail("Timed out waiting for the subtitle renderer")
        throw Timeout()
    }

    private func styledImage(_ wrapper: AetherPlayerWrapper) -> NSImage? {
        // The final image view is the ASS overlay, above text and bitmap cues.
        let view = wrapper.subtitleOverlay.subviews.compactMap { $0 as? NSImageView }.last
        return view?.isHidden == false ? view?.image : nil
    }

    private func colorPixels(_ image: NSImage, red: Bool) throws -> Int {
        let cgImage = try XCTUnwrap(image.cgImage(forProposedRect: nil, context: nil, hints: nil))
        let bitmap = NSBitmapImageRep(cgImage: cgImage)
        var count = 0
        // The authored alignment is top-center. Plain-text fallback is white
        // and bottom-center, so it cannot satisfy either color/location check.
        for y in 0..<(bitmap.pixelsHigh / 3) {
            for x in 0..<bitmap.pixelsWide {
                guard let color = bitmap.colorAt(x: x, y: y)?.usingColorSpace(.deviceRGB) else { continue }
                if red ? (color.redComponent > 0.6 && color.greenComponent < 0.2)
                    : (color.greenComponent > 0.6 && color.redComponent < 0.2) {
                    count += 1
                }
            }
        }
        return count
    }

    func testEmbeddedASSStillUsesItsTrackHeader() async throws {
        _ = NSApplication.shared
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 960, height: 540),
            styleMask: [.borderless], backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        let view = try XCTUnwrap(window.contentView)
        let wrapper = AetherPlayerWrapper()
        wrapper.attachVideoView(view)
        defer { wrapper.shutdown(); window.close() }
        let fixture = try XCTUnwrap(Bundle(for: Self.self)
            .url(forResource: "embedded-ass", withExtension: "mkv"))
        await wrapper.play(url: fixture)
        try await waitUntil { wrapper.subtitleTracks.count == 1 && wrapper.isPlaying }
        wrapper.setSubtitleTrack(1)
        try await waitUntil { self.styledImage(wrapper) != nil }
        let engine = try XCTUnwrap(AetherPlayerWrapper.sharedEngine())
        XCTAssertNotNil(engine.subtitleTracks.first?.assHeader)
        XCTAssertNil(engine.sidecarASSHeader)
        XCTAssertGreaterThan(try colorPixels(try XCTUnwrap(styledImage(wrapper)), red: true), 100)
    }

    func testExternalASSStylesSurviveDecodeTrackChangesAndResize() async throws {
        _ = NSApplication.shared
        let fixtures = try await makeFixtures()
        defer { try? FileManager.default.removeItem(at: fixtures) }
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 960, height: 540),
            styleMask: [.borderless], backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        let view = NSView(frame: window.contentView!.bounds)
        window.contentView = view
        let wrapper = AetherPlayerWrapper()
        wrapper.attachVideoView(view)
        defer { wrapper.shutdown(); window.close() }
        var source = AetherPlayerWrapper.SourceConfiguration()
        source.externalSubtitles = ["red.ass", "green.ass", "plain.srt"].map {
            ExternalSubtitleTrack(url: fixtures.appendingPathComponent($0), language: "eng")
        }
        wrapper.configureSource(source)
        await wrapper.play(url: fixtures.appendingPathComponent("video.mp4"))
        try await waitUntil { wrapper.subtitleTracks.count == 3 && wrapper.isPlaying }
        try await Task.sleep(for: .milliseconds(200))
        let engine = try XCTUnwrap(AetherPlayerWrapper.sharedEngine())
        wrapper.setSubtitleTrack(1)
        try await waitUntil { self.styledImage(wrapper) != nil }
        XCTAssertNotNil(engine.sidecarASSHeader)
        XCTAssertNil(engine.subtitleTracks.first?.assHeader)
        let first = try XCTUnwrap(styledImage(wrapper))
        XCTAssertGreaterThan(try colorPixels(first, red: true), 100)
        XCTAssertTrue(wrapper.subtitleOverlay.subviews.compactMap { $0 as? NSTextField }.allSatisfy(\.isHidden))

        // Both sidecars have the same cue IDs. Old event deduplication must
        // not prevent the second file's events from reaching libass.
        wrapper.setSubtitleTrack(2)
        try await waitUntil { engine.sidecarASSHeader?.contains("&H0000FF00") == true && self.styledImage(wrapper) != nil }
        XCTAssertGreaterThan(try colorPixels(try XCTUnwrap(styledImage(wrapper)), red: false), 100)
        wrapper.setSubtitleTrack(3)
        try await waitUntil {
            self.styledImage(wrapper) == nil && wrapper.subtitleOverlay.subviews
                .compactMap { $0 as? NSTextField }.contains { !$0.isHidden && $0.stringValue == "Synthetic plain caption" }
        }
        wrapper.setSubtitleTrack(1)
        try await waitUntil { engine.sidecarASSHeader?.contains("&H000000FF") == true && self.styledImage(wrapper) != nil }
        XCTAssertGreaterThan(try colorPixels(try XCTUnwrap(styledImage(wrapper)), red: true), 100)
        for index: Int32 in [1, 2, 3, 2] { wrapper.setSubtitleTrack(index) }
        try await waitUntil { engine.sidecarASSHeader?.contains("&H0000FF00") == true && self.styledImage(wrapper) != nil }
        XCTAssertGreaterThan(try colorPixels(try XCTUnwrap(styledImage(wrapper)), red: false), 100)
        wrapper.disableSubtitles()
        try await waitUntil { engine.activeSubtitleTrackIndex == nil && self.styledImage(wrapper) == nil }
        wrapper.setSubtitleTrack(1)
        try await waitUntil { self.styledImage(wrapper) != nil }

        // The bitmap follows the backing-pixel canvas at both HD and UHD.
        let scale = window.backingScaleFactor
        for pixels in [NSSize(width: 1920, height: 1080), NSSize(width: 3840, height: 2160)] {
            let size = NSSize(width: pixels.width / scale, height: pixels.height / scale)
            view.setFrameSize(size)
            view.layoutSubtreeIfNeeded()
            wrapper.subtitleOverlay.layoutSubtreeIfNeeded()
            try await waitUntil { self.styledImage(wrapper)?.size == NSSize(
                width: size.width * scale, height: size.height * scale) }
            let image = try XCTUnwrap(styledImage(wrapper))
            XCTAssertEqual(image.size.width, size.width * scale)
            XCTAssertEqual(image.size.height, size.height * scale)
            XCTAssertGreaterThan(try colorPixels(image, red: true), 100)
        }
    }
}
