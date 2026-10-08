import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';

void main() {
  bool unchanged({
    bool? displayHdr = true,
    bool? outputtingHdr = true,
    bool hintOn = true,
    bool hdrContent = true,
  }) => MediaKitPlayerBackend.renegotiationUnchanged(
    displayHdr: displayHdr,
    outputtingHdr: outputtingHdr,
    hintOn: hintOn,
    hdrContent: hdrContent,
  );

  test('HDR title between two HDR screens skips the cycle', () {
    expect(unchanged(), isTrue);
  });

  test('SDR title between two HDR screens skips the cycle', () {
    // On an HDR display mpv targets PQ for SDR content too, so whatever it
    // reports, there is nothing for a cycle to fix.
    expect(unchanged(outputtingHdr: true, hdrContent: false), isTrue);
    expect(unchanged(outputtingHdr: false, hdrContent: false), isTrue);
    expect(unchanged(outputtingHdr: null, hdrContent: false), isTrue);
  });

  test('any title between two SDR screens skips the cycle', () {
    expect(
      unchanged(displayHdr: false, outputtingHdr: false, hintOn: false),
      isTrue,
    );
    expect(
      unchanged(
        displayHdr: false,
        outputtingHdr: false,
        hintOn: false,
        hdrContent: false,
      ),
      isTrue,
    );
  });

  test('a hint that no longer matches the display cycles', () {
    // HDR onto SDR: passthrough would wash the picture out.
    expect(unchanged(displayHdr: false), isFalse);
    // SDR onto HDR with an SDR title: nothing looks wrong yet, but the next
    // HDR title in this session would be tone-mapped.
    expect(
      unchanged(outputtingHdr: false, hintOn: false, hdrContent: false),
      isFalse,
    );
  });

  test('HDR content not reaching an HDR display cycles', () {
    expect(unchanged(outputtingHdr: false), isFalse);
  });

  test('an unknown display always cycles', () {
    expect(unchanged(displayHdr: null), isFalse);
    expect(unchanged(displayHdr: null, hdrContent: false), isFalse);
  });

  test('an unreadable mpv output cycles an HDR title', () {
    expect(unchanged(outputtingHdr: null), isFalse);
  });
}
