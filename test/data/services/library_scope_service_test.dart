import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/library_scope_service.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockUsersApi extends Mock implements UsersApi {}

class _MockViews extends Mock implements UserViewsRepository {}

AggregatedLibrary _library(String id, String collectionType) =>
    AggregatedLibrary(
      id: id,
      name: id,
      collectionType: collectionType,
      serverId: 'srv1',
    );

ServerUser _user({
  bool enableAllFolders = true,
  List<String> enabledFolders = const [],
  List<String> blockedMediaFolders = const [],
}) => ServerUser(
  id: 'usr1',
  name: 'kid',
  policy: UserPolicy(
    enableAllFolders: enableAllFolders,
    enabledFolders: enabledFolders,
    blockedMediaFolders: blockedMediaFolders,
  ),
);

void main() {
  late _MockViews views;
  late _MockUsersApi users;
  late LibraryScopeService scope;

  setUp(() {
    views = _MockViews();
    users = _MockUsersApi();
    final client = _MockClient();
    when(() => client.usersApi).thenReturn(users);
    when(() => users.getCurrentUser()).thenAnswer((_) async => _user());
    scope = LibraryScopeService(client, views);
  });

  group('permittedLibraryIds', () {
    test('is null when the policy allows every folder', () async {
      expect(await scope.permittedLibraryIds(), isNull);
    });

    test('is the allowed set when the policy restricts folders', () async {
      when(() => users.getCurrentUser()).thenAnswer(
        (_) async => _user(
          enableAllFolders: false,
          enabledFolders: ['movies-a', 'shows'],
        ),
      );
      expect(await scope.permittedLibraryIds(), {'movies-a', 'shows'});
    });

    test('drops folders the policy blocks outright', () async {
      when(() => users.getCurrentUser()).thenAnswer(
        (_) async => _user(
          enableAllFolders: false,
          enabledFolders: ['movies-a', 'adult'],
          blockedMediaFolders: ['adult'],
        ),
      );
      expect(await scope.permittedLibraryIds(), {'movies-a'});
    });

    test('is null rather than empty when the allow list is empty', () async {
      // Restricted to nothing is almost always a parse problem, and blanking
      // the app is worse than deferring to the server.
      when(() => users.getCurrentUser()).thenAnswer(
        (_) async => _user(enableAllFolders: false),
      );
      expect(await scope.permittedLibraryIds(), isNull);
    });

    test('is null when the policy cant be read', () async {
      when(() => users.getCurrentUser()).thenThrow(Exception('offline'));
      expect(await scope.permittedLibraryIds(), isNull);
    });

    test('reads the policy once and caches it', () async {
      await scope.permittedLibraryIds();
      await scope.permittedLibraryIds();
      verify(() => users.getCurrentUser()).called(1);
    });
  });

  group('visibleLibraryIds', () {
    test('is null when the user has hidden nothing', () async {
      when(() => views.getMyMediaExcludes()).thenAnswer((_) async => <String>{});
      expect(await scope.visibleLibraryIds(const ['Movie']), isNull);
      verifyNever(() => views.getUserViews());
    });

    test('narrows to the libraries that can hold the type', () async {
      when(
        () => views.getMyMediaExcludes(),
      ).thenAnswer((_) async => {'hidden'});
      when(() => views.getUserViews()).thenAnswer(
        (_) async => [
          _library('movies-a', 'movies'),
          _library('shows', 'tvshows'),
          _library('music', 'music'),
        ],
      );
      expect(await scope.visibleLibraryIds(const ['Movie']), ['movies-a']);
    });

    test('treats a library that claims no type as holding anything', () async {
      when(
        () => views.getMyMediaExcludes(),
      ).thenAnswer((_) async => {'hidden'});
      when(() => views.getUserViews()).thenAnswer(
        (_) async => [_library('mixed', ''), _library('music', 'music')],
      );
      expect(await scope.visibleLibraryIds(const ['Movie']), ['mixed']);
    });

    test('routes collections to a boxsets library', () async {
      when(
        () => views.getMyMediaExcludes(),
      ).thenAnswer((_) async => {'hidden'});
      when(() => views.getUserViews()).thenAnswer(
        (_) async => [
          _library('collections', 'boxsets'),
          _library('movies-a', 'movies'),
        ],
      );
      expect(await scope.visibleLibraryIds(const ['BoxSet']), ['collections']);
    });

    test('leaves out a library the policy does not permit', () async {
      when(() => users.getCurrentUser()).thenAnswer(
        (_) async =>
            _user(enableAllFolders: false, enabledFolders: ['movies-a']),
      );
      when(
        () => views.getMyMediaExcludes(),
      ).thenAnswer((_) async => {'hidden'});
      when(() => views.getUserViews()).thenAnswer(
        (_) async => [
          _library('movies-a', 'movies'),
          _library('movies-b', 'movies'),
        ],
      );
      expect(await scope.visibleLibraryIds(const ['Movie']), ['movies-a']);
    });

    test('falls back to a sweep when nothing is left to search', () async {
      when(
        () => views.getMyMediaExcludes(),
      ).thenAnswer((_) async => {'hidden'});
      when(
        () => views.getUserViews(),
      ).thenAnswer((_) async => [_library('music', 'music')]);
      expect(await scope.visibleLibraryIds(const ['Movie']), isNull);
    });

    test('falls back to a sweep when the views cant be read', () async {
      when(() => views.getMyMediaExcludes()).thenThrow(Exception('offline'));
      expect(await scope.visibleLibraryIds(const ['Movie']), isNull);
    });
  });

  group('retainPermitted', () {
    test('keeps everything when the policy places no restriction', () async {
      expect(await scope.retainPermitted(['a', 'b']), ['a', 'b']);
    });

    test('drops ids a stale preference still names', () async {
      when(() => users.getCurrentUser()).thenAnswer(
        (_) async => _user(enableAllFolders: false, enabledFolders: ['a']),
      );
      expect(await scope.retainPermitted(['a', 'revoked']), ['a']);
    });
  });

  group('withoutHiddenLibraries', () {
    test('drops what the user hid from My Media', () async {
      when(
        () => views.getMyMediaExcludes(),
      ).thenAnswer((_) async => {'hidden'});
      final kept = await scope.withoutHiddenLibraries([
        _library('shown', 'movies'),
        _library('hidden', 'movies'),
      ]);
      expect(kept.map((l) => l.id), ['shown']);
    });

    AggregatedLibrary merged(List<String> ids) => AggregatedLibrary.merged(
      name: 'Movies',
      unifiedKindName: 'movies',
      libraries: [for (final id in ids) _library(id, 'movies')],
    );

    test('a merged tile stays when the library it drew its artwork from is '
        'hidden', () async {
      when(
        () => views.getMyMediaExcludes(),
      ).thenAnswer((_) async => {'first'});
      final kept = await scope.withoutHiddenLibraries([
        merged(['first', 'second', 'third']),
      ]);

      expect(kept.single.unifiedKindName, 'movies');
      expect(kept.single.name, 'Movies');
      // The artwork comes from the first library still shown.
      expect(kept.single.id, 'second');
      expect(kept.single.mergedFrom.map((l) => l.id), ['second', 'third']);
    });

    test('a merged tile keeps its artwork when a later library is '
        'hidden', () async {
      when(
        () => views.getMyMediaExcludes(),
      ).thenAnswer((_) async => {'second'});
      final kept = await scope.withoutHiddenLibraries([
        merged(['first', 'second']),
      ]);
      expect(kept.single.id, 'first');
    });

    test('a merged tile is removed once every library it stands for is '
        'hidden', () async {
      when(
        () => views.getMyMediaExcludes(),
      ).thenAnswer((_) async => {'first', 'second'});
      final kept = await scope.withoutHiddenLibraries([
        merged(['first', 'second']),
        _library('shown', 'music'),
      ]);
      expect(kept.map((l) => l.id), ['shown']);
    });

    group('with a library id two servers share', () {
      AggregatedLibrary on(String serverId, String id) => AggregatedLibrary(
        id: id,
        name: '$id on $serverId',
        collectionType: 'movies',
        serverId: serverId,
      );

      setUp(() {
        scope = LibraryScopeService(_MockClient(), views, () => 'srv1');
        when(() => views.getMyMediaExcludes()).thenAnswer((_) async => {'1'});
      });

      test('only the active server loses the library it hid', () async {
        final kept = await scope.withoutHiddenLibraries([
          on('srv1', '1'),
          on('srv1', '2'),
          on('srv2', '1'),
        ]);
        expect(kept.map((l) => (l.serverId, l.id)), [
          ('srv1', '2'),
          ('srv2', '1'),
        ]);
      });

      test("a merged tile keeps the other server's library", () async {
        final kept = await scope.withoutHiddenLibraries([
          AggregatedLibrary.merged(
            name: 'Movies',
            unifiedKindName: 'movies',
            libraries: [on('srv1', '1'), on('srv2', '1'), on('srv2', '3')],
          ),
        ]);
        expect(kept.single.mergedFrom.map((l) => (l.serverId, l.id)), [
          ('srv2', '1'),
          ('srv2', '3'),
        ]);
        // The artwork comes from the first library still shown.
        expect((kept.single.serverId, kept.single.id), ('srv2', '1'));
      });

      test('a merged tile of other servers only is left as it is', () async {
        final tile = AggregatedLibrary.merged(
          name: 'Movies',
          unifiedKindName: 'movies',
          libraries: [on('srv2', '1'), on('srv3', '1')],
        );
        expect(await scope.withoutHiddenLibraries([tile]), [tile]);
      });
    });

    test('keeps everything when the excludes cant be read', () async {
      when(() => views.getMyMediaExcludes()).thenThrow(Exception('offline'));
      final libraries = [_library('a', 'movies')];
      expect(await scope.withoutHiddenLibraries(libraries), libraries);
    });
  });
}
