import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

class _Owner implements AudioOwnable {
  _Owner(this.audioProducerId);

  @override
  final AudioProducer audioProducerId;

  final List<RevokeReason> revocations = [];

  @override
  Future<void> onAudioRevoked(RevokeReason reason) async {
    revocations.add(reason);
  }
}

void main() {
  late PlaybackArbiter arbiter;
  late _Owner trailer;
  late _Owner preview;
  late _Owner themeMusic;
  late _Owner video;

  setUp(() {
    arbiter = PlaybackArbiter();
    trailer = _Owner(AudioProducer.mediaBarTrailer);
    preview = _Owner(AudioProducer.inlinePreview);
    themeMusic = _Owner(AudioProducer.themeMusic);
    video = _Owner(AudioProducer.mainPlayback);
    for (final owner in [trailer, preview, themeMusic, video]) {
      arbiter.register(owner);
    }
  });

  test('a game silences every other producer', () async {
    await arbiter.acquire(AudioProducer.game);

    expect(trailer.revocations, [RevokeReason.exclusive]);
    expect(preview.revocations, [RevokeReason.exclusive]);
    expect(themeMusic.revocations, [RevokeReason.exclusive]);
    expect(video.revocations, [RevokeReason.exclusive]);
  });

  test('ambient sound leaves a running game alone', () async {
    final game = _Owner(AudioProducer.game);
    arbiter.register(game);

    await arbiter.acquire(AudioProducer.mediaBarTrailer);

    expect(game.revocations, isEmpty);
    expect(video.revocations, isEmpty);
    expect(preview.revocations, [RevokeReason.ambientHandoff]);
  });

  test('an ambient acquire hands off softly, a non-ambient one does not',
      () async {
    await arbiter.acquire(AudioProducer.mediaBarTrailer);
    expect(themeMusic.revocations, [RevokeReason.ambientHandoff]);

    await arbiter.acquire(AudioProducer.mainPlayback);
    expect(
      themeMusic.revocations,
      [RevokeReason.ambientHandoff, RevokeReason.exclusive],
    );
    expect(trailer.revocations, [RevokeReason.exclusive]);
  });
}
