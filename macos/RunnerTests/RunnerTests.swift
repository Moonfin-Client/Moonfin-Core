import Cocoa
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
