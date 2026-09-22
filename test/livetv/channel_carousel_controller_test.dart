import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/live_tv/channel_carousel_controller.dart';

void main() {
  test('a hold advances one channel per repeat whatever the lineup size', () {
    // Owner requirement: holding LEFT/RIGHT scrolls rapidly one channel at a
    // time. Advancing by the visible count turned the whole viewport over per
    // repeat, which is what read as lurching.
    expect(holdStep(3), 1);
    expect(holdStep(5), 1);
    expect(holdStep(48), 1);
  });

  test('a single channel does not move', () {
    expect(holdStep(1), 0);
    expect(holdStep(0), 0);
  });

  test('index mapping wraps in both directions', () {
    expect(channelIndexFor(0, 3), 0);
    expect(channelIndexFor(4, 3), 1);
    expect(channelIndexFor(-1, 3), 2);
  });

  test('recentring preserves the selected channel', () {
    const count = 48;
    const seed = count * 500;
    final raw = seed + 3;
    expect(channelIndexFor(recentre(raw, count, seed), count),
        channelIndexFor(raw, count));
  });

  test('recentring preserves selection when drifted forward', () {
    const count = 48;
    const seed = count * 500;
    final raw = seed + count * 300 + 17;
    expect(needsRecentre(raw, count, seed), isTrue);
    expect(channelIndexFor(recentre(raw, count, seed), count),
        channelIndexFor(raw, count));
  });

  test('recentring preserves selection when drifted backward', () {
    const count = 48;
    const seed = count * 500;
    final raw = seed - count * 300 - 17;
    expect(needsRecentre(raw, count, seed), isTrue);
    expect(channelIndexFor(recentre(raw, count, seed), count),
        channelIndexFor(raw, count));
  });

  test('recentre lands the raw index back near the seed', () {
    const count = 48;
    const seed = count * 500;
    final raw = seed + count * 300 + 17;
    final recentred = recentre(raw, count, seed);
    expect(needsRecentre(recentred, count, seed), isFalse);
  });

  test('a small drift does not trigger recentring', () {
    const count = 48;
    const seed = count * 500;
    expect(needsRecentre(seed + 3, count, seed), isFalse);
  });
}
