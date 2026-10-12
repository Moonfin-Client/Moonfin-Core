import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/playback/cinema_mode_controller.dart';
import 'package:moonfin/playback/cinema_request_picker_session.dart';

class FakeCinemaSeerr extends Fake implements SeerrRepository {
  SeerrMediaInfo? info;
  int permissions = SeerrPermission.requestMovie;
  bool movie4kEnabled = true;
  Completer<Map<String, dynamic>>? settingsResponse;
  Completer<SeerrRequest>? submission;
  Future<SeerrMovieDetails> Function(int)? movieLookup;
  int lookups = 0;
  final submitted = <int>[];
  final requested4k = <bool>[];

  @override
  bool get isAvailable => true;

  @override
  Future<void> ensureInitialized({bool force = false}) async {}

  @override
  Future<SeerrUser> getCurrentUser() async =>
      SeerrUser(id: 5, permissions: permissions);

  @override
  Future<Map<String, dynamic>> getPublicSettings() =>
      settingsResponse?.future ??
      Future.value({'movie4kEnabled': movie4kEnabled});

  @override
  Future<SeerrMovieDetails> getMovieDetails(int tmdbId) async {
    lookups++;
    if (movieLookup != null) return movieLookup!(tmdbId);
    return SeerrMovieDetails(id: tmdbId, title: 'Movie', mediaInfo: info);
  }

  @override
  Future<SeerrRequest> createRequest({
    required int mediaId,
    required String mediaType,
    List<int>? seasons,
    bool allSeasons = false,
    bool is4k = false,
    int? profileId,
    String? rootFolder,
    int? serverId,
  }) {
    expect(mediaType, 'movie');
    submitted.add(mediaId);
    requested4k.add(is4k);
    return submission?.future ??
        Future.value(const SeerrRequest(
          id: 1,
          status: SeerrRequest.statusApproved,
          type: 'movie',
        ));
  }
}

Map<String, dynamic> cinemaItem({int tmdb = 42}) => {
  'Type': 'Movie',
  'RunTimeTicks': 900000000,
  'ProviderIds': {'Tmdb': '$tmdb'},
};

Future<void> flush() => Future<void>.delayed(Duration.zero);

void main() {
  late FakeCinemaSeerr seerr;
  late CinemaModeController controller;
  var skips = 0;

  setUp(() {
    seerr = FakeCinemaSeerr();
    skips = 0;
    controller = CinemaModeController(
      seerr: () async => seerr,
      accountKey: () => 'server/user',
      onSkip: () async {
        skips++;
      },
    );
  });
  tearDown(() => controller.dispose());

  void enter({int tmdb = 42}) => controller.enter(
    item: cinemaItem(tmdb: tmdb),
    resolveMedia: () async => null,
  );

  test('an uncertain movie timeout never submits the same quality twice', () {
    fakeAsync((clock) {
      seerr.submission = Completer<SeerrRequest>();
      seerr.info = const SeerrMediaInfo(status: SeerrMediaStatus.unknown);
      enter();
      clock.flushMicrotasks();
      controller.request();
      clock.flushMicrotasks();
      clock.elapse(const Duration(seconds: 20));
      clock.flushMicrotasks();

      expect(seerr.lookups, 2);
      expect(controller.canRequest, isFalse);
      controller.request();
      clock.flushMicrotasks();
      expect(seerr.submitted, [42]);

      seerr.submission!.complete(
        const SeerrRequest(id: 1, status: 2, type: 'movie'),
      );
      clock.flushMicrotasks();
      expect(controller.canRequest, isFalse);
    });
  });

  test('late movie recovery cannot hide Request on the next trailer', () {
    fakeAsync((clock) {
      final recovery = Completer<SeerrMovieDetails>();
      final next = Completer<SeerrMovieDetails>();
      seerr.submission = Completer<SeerrRequest>();
      enter();
      clock.flushMicrotasks();
      controller.request();
      clock.flushMicrotasks();
      seerr.movieLookup = (id) => id == 42 ? recovery.future : next.future;
      seerr.submission!.completeError(StateError('Lost request response'));
      clock.flushMicrotasks();

      enter(tmdb: 99);
      clock.flushMicrotasks();
      recovery.complete(const SeerrMovieDetails(
        id: 42,
        title: 'Previous movie',
        mediaInfo: SeerrMediaInfo(status: SeerrMediaStatus.processing),
      ));
      clock.flushMicrotasks();
      next.complete(const SeerrMovieDetails(id: 99, title: 'Next movie'));
      clock.flushMicrotasks();
      expect(controller.media?.tmdbId, 99);
      expect(controller.canRequest, isTrue);
    });
  });

  test('movie recovery preserves the status confirmed by Seerr', () {
    fakeAsync((clock) {
      for (final entry in {
        SeerrMediaStatus.processing: CinemaSeerrState.processing,
        SeerrMediaStatus.available: CinemaSeerrState.available,
      }.entries) {
        seerr.info = null;
        seerr.submission = Completer<SeerrRequest>();
        enter();
        clock.flushMicrotasks();
        controller.request();
        clock.flushMicrotasks();
        seerr.info = SeerrMediaInfo(status: entry.key);
        seerr.submission!.completeError(StateError('Lost request response'));
        clock.flushMicrotasks();
        expect(controller.seerrState, entry.value);
        expect(controller.canRequest, isFalse);
      }
    });
  });

  test('movie picker grace cannot cross users or changed credentials', () {
    for (final change in ['none', 'user', 'token']) {
      fakeAsync((clock) {
        var account = 'original';
        var token = 'original-token';
        Object sessionKey() => (account, token);
        final repo = FakeCinemaSeerr()
          ..permissions = SeerrPermission.requestMovie | SeerrPermission.request4kMovie;
        final picked = Completer<bool>();
        late CinemaRequestPickerSession session;
        final choice = CinemaModeController(
          seerr: () async => repo,
          accountKey: sessionKey,
          onSkip: () async {},
          onRequestMovie: (_, _, _, _, submit) async {
            session = CinemaRequestPickerSession(
              accountKey: sessionKey,
              isMounted: () => true,
            );
            final is4k = await picked.future;
            session.markSubmitting();
            await submit(is4k, () => session.isCurrent);
            session.dispose();
          },
        );
        choice.enter(item: cinemaItem(), resolveMedia: () async => null);
        clock.flushMicrotasks();
        choice.request();
        clock.flushMicrotasks();
        session.beginGrace();
        choice.enter(item: cinemaItem(tmdb: 99), resolveMedia: () async => null);
        clock.flushMicrotasks();
        if (change == 'user') account = 'other';
        if (change == 'token') token = 'new-token';
        picked.complete(true);
        clock.flushMicrotasks();
        expect(repo.submitted, change == 'none' ? [42] : isEmpty);
        expect(repo.requested4k, change == 'none' ? [true] : isEmpty);
        if (change == 'none') expect(choice.canRequest, isTrue);
        choice.dispose();
      });
    }
  });

  test('standard Request works while optional 4K settings are pending', () async {
    seerr.permissions =
        SeerrPermission.requestMovie | SeerrPermission.request4kMovie;
    seerr.info = const SeerrMediaInfo(
      status: SeerrMediaStatus.unknown,
      status4k: SeerrMediaStatus.available,
    );
    seerr.settingsResponse = Completer<Map<String, dynamic>>();
    enter();
    await flush();
    expect(controller.canRequest, isTrue);

    // Submit before the settings request has finished.
    await controller.request();
    expect(seerr.requested4k, [false]);
    seerr.settingsResponse!.complete({'movie4kEnabled': false});
    await flush();
  });

  test('disabling 4K moves Request focus back to Skip', () async {
    seerr.permissions = SeerrPermission.request4kMovie;
    seerr.settingsResponse = Completer<Map<String, dynamic>>();
    enter();
    await flush();
    expect(controller.canRequest, isTrue);
    controller.moveLeft();
    expect(controller.focusedAction, CinemaAction.request);

    seerr.settingsResponse!.complete({'movie4kEnabled': false});
    await flush();
    expect(controller.canRequest, isFalse);
    expect(controller.focusedAction, CinemaAction.skip);

    controller.activate();
    expect(skips, 1);
    expect(seerr.submitted, isEmpty);
  });

  test('HD availability does not prevent a direct 4K request', () async {
    seerr.permissions =
        SeerrPermission.requestMovie | SeerrPermission.request4kMovie;
    seerr.info = const SeerrMediaInfo(
      status: SeerrMediaStatus.available,
      status4k: SeerrMediaStatus.unknown,
    );
    enter();
    await flush();
    expect(controller.only4kRequestable, isTrue);
    await controller.request();
    expect(seerr.requested4k, [true]);
  });

  test('both qualities prompt, then the remaining one submits directly', () async {
    seerr.permissions =
        SeerrPermission.requestMovie | SeerrPermission.request4kMovie;
    var prompts = 0;
    final choice = CinemaModeController(
      seerr: () async => seerr,
      accountKey: () => 'server/user',
      onSkip: () async {},
      onRequestMovie: (repository, details, user, isCurrent, submit) async {
        prompts++;
        await submit(true, isCurrent);
      },
    );
    try {
      choice.enter(item: cinemaItem(), resolveMedia: () async => null);
      await flush();
      await choice.request();
      expect(prompts, 1);
      expect(seerr.requested4k, [true]);

      await choice.request();
      expect(prompts, 1);
      expect(seerr.requested4k, [true, false]);
      expect(choice.canRequest, isFalse);
    } finally {
      choice.dispose();
    }
  });

  test('rapid double Skip does not advance twice', () {
    enter();
    controller.skip();
    controller.skip();
    expect(skips, 1);
    enter(tmdb: 99);
    controller.skip();
    expect(skips, 1);
  });
}
