import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:server_core/server_core.dart';

class _Client extends Mock implements MediaServerClient {}

class _UserLibraryApi extends Mock implements UserLibraryApi {}

void main() {
  late _UserLibraryApi api;
  late ItemMutationRepository repository;
  late List<Completer<void>> requests;

  setUp(() {
    userDataSync.reset();
    api = _UserLibraryApi();
    requests = [];
    Future<void> held(Invocation _) {
      final request = Completer<void>();
      requests.add(request);
      return request.future;
    }

    when(() => api.markFavorite(any())).thenAnswer(held);
    when(() => api.unmarkFavorite(any())).thenAnswer(held);
    final client = _Client();
    when(() => client.userLibraryApi).thenReturn(api);
    repository = ItemMutationRepository(client);
  });

  tearDown(userDataSync.reset);

  /// What a favorite button does: flip whatever is showing.
  Future<void> toggle() => repository.setFavorite(
    'ch',
    isFavorite: !(userDataSync.favoriteFor('ch') ?? false),
  );

  Future<void> settle() => Future<void>.delayed(Duration.zero);

  test('toggles made while a request is out end on the last choice', () async {
    final runs = [toggle()];
    await settle();
    runs
      ..add(toggle())
      ..add(toggle());
    expect(userDataSync.favoriteFor('ch'), isTrue);

    requests.single.complete();
    await Future.wait(runs);
    verify(() => api.markFavorite('ch')).called(1);
    verifyNever(() => api.unmarkFavorite(any()));
    expect(userDataSync.favoriteFor('ch'), isTrue);
    expect(userDataSync.favoriteChangePending('ch'), isFalse);
  });

  test('a change made during a request is sent after it', () async {
    final runs = [toggle()];
    await settle();
    runs.add(toggle());
    requests.single.complete();
    await settle();
    expect(requests, hasLength(2));
    requests.last.complete();
    await Future.wait(runs);

    verifyInOrder([
      () => api.markFavorite('ch'),
      () => api.unmarkFavorite('ch'),
    ]);
    expect(userDataSync.favoriteFor('ch'), isFalse);
  });

  test('a user switch drops changes still waiting to be sent', () async {
    final runs = [toggle()];
    await settle();
    runs.add(toggle());
    userDataSync.reset();
    requests.single.complete();
    await Future.wait(runs);

    verify(() => api.markFavorite('ch')).called(1);
    verifyNever(() => api.unmarkFavorite(any()));
    expect(userDataSync.favoriteFor('ch'), isNull);
  });

  test('toggling back before anything is sent sends nothing', () async {
    await Future.wait([toggle(), toggle()]);
    verifyNever(() => api.markFavorite(any()));
    verifyNever(() => api.unmarkFavorite(any()));
    expect(userDataSync.favoriteFor('ch'), isFalse);
  });

  group('a page that undoes its own toggle on error', () {
    var shown = false;

    // As the detail page does: show the toggle, undo it if the call throws.
    Future<void> pageToggle() async {
      final next = !shown;
      shown = next;
      try {
        await repository.setFavorite('ch', isFavorite: next);
      } catch (_) {
        shown = !next;
      }
    }

    setUp(() => shown = false);

    test('ends on the server value after on, then off', () async {
      final runs = [pageToggle()];
      await settle();
      runs.add(pageToggle());
      requests.single.completeError(Exception('offline'));
      await Future.wait(runs);

      expect(shown, isFalse);
      expect(userDataSync.favoriteFor('ch'), isFalse);
    });

    test('ends on the server value after on, off, on', () async {
      final runs = [pageToggle()];
      await settle();
      runs
        ..add(pageToggle())
        ..add(pageToggle());
      requests.single.completeError(Exception('offline'));
      await Future.wait(runs);

      expect(shown, isFalse);
      expect(userDataSync.favoriteFor('ch'), isFalse);
    });
  });

  group('two servers that hold the same id', () {
    late _UserLibraryApi otherApi;
    late ItemMutationRepository other;
    late List<Completer<void>> otherRequests;

    setUp(() {
      otherApi = _UserLibraryApi();
      otherRequests = [];
      Future<void> held(Invocation _) {
        final request = Completer<void>();
        otherRequests.add(request);
        return request.future;
      }

      when(() => otherApi.markFavorite(any())).thenAnswer(held);
      when(() => otherApi.unmarkFavorite(any())).thenAnswer(held);
      final client = _Client();
      when(() => client.userLibraryApi).thenReturn(otherApi);
      other = ItemMutationRepository(client);
    });

    Future<void> setOnBoth(bool isFavorite) => Future.wait([
      repository.setFavorite('ch', isFavorite: isFavorite),
      other.setFavorite('ch', isFavorite: isFavorite),
    ]);

    test('are each sent the change', () async {
      final run = setOnBoth(true);
      await settle();
      requests.single.complete();
      otherRequests.single.complete();
      await run;

      verify(() => api.markFavorite('ch')).called(1);
      verify(() => otherApi.markFavorite('ch')).called(1);
      expect(userDataSync.favoriteFor('ch'), isTrue);
      expect(userDataSync.favoriteChangePending('ch'), isFalse);
    });

    test('each end on the last choice, whichever answers first', () async {
      final runs = [setOnBoth(true)];
      await settle();
      runs.add(setOnBoth(false));
      // The first server is done with both requests before the second has
      // answered its first.
      requests.single.complete();
      await settle();
      requests.last.complete();
      await settle();
      otherRequests.single.complete();
      await settle();
      expect(otherRequests, hasLength(2));
      otherRequests.last.complete();
      await Future.wait(runs);

      verifyInOrder([
        () => api.markFavorite('ch'),
        () => api.unmarkFavorite('ch'),
      ]);
      verifyInOrder([
        () => otherApi.markFavorite('ch'),
        () => otherApi.unmarkFavorite('ch'),
      ]);
      expect(userDataSync.favoriteFor('ch'), isFalse);
      expect(userDataSync.favoriteChangePending('ch'), isFalse);
    });

    test('a failure on one leaves the other changed', () async {
      final first = repository.setFavorite('ch', isFavorite: true);
      final second = other.setFavorite('ch', isFavorite: true);
      await settle();
      otherRequests.single.completeError(Exception('offline'));
      await expectLater(second, throwsException);
      requests.single.complete();
      await first;

      verify(() => api.markFavorite('ch')).called(1);
      verifyNever(() => api.unmarkFavorite(any()));
    });
  });

  test('a failed request shows what the server last held', () async {
    final run = toggle();
    await settle();
    requests.single.completeError(Exception('offline'));

    await expectLater(run, throwsException);
    expect(userDataSync.favoriteFor('ch'), isFalse);
    expect(userDataSync.favoriteChangePending('ch'), isFalse);
  });
}
