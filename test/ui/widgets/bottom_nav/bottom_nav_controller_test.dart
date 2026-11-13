import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/library_scope_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/bottom_nav/bottom_nav_controller.dart';

import 'bottom_nav_fakes.dart';

class _MockMultiServerRepository extends Mock
    implements MultiServerRepository {}

class _MockLibraryScope extends Mock implements LibraryScopeService {}

// Longer than the pause the controller takes before reloading its libraries.
const _pastReloadDebounce = Duration(milliseconds: 400);

void main() {
  late UserPreferences prefs;
  late _MockMultiServerRepository servers;

  /// Swapped by a test to stand for a change of preference taking effect.
  late List<AggregatedLibrary> answer;

  const perServer = AggregatedLibrary(
    id: 'a-movies',
    name: 'Movies (Server a)',
    collectionType: 'movies',
    serverId: 'a',
  );
  final merged = AggregatedLibrary.merged(
    name: 'Movies',
    unifiedKindName: 'movies',
    libraries: const [perServer],
  );

  setUp(() async {
    prefs = (await setUpBottomNav()).prefs;
    await prefs.set(UserPreferences.enableMultiServerLibraries, true);
    await prefs.set(UserPreferences.mergeLibrariesByType, false);

    answer = [perServer];
    servers = _MockMultiServerRepository();
    when(servers.getAggregatedLibraries).thenAnswer((_) async => answer);
    final scope = _MockLibraryScope();
    when(() => scope.withoutHiddenLibraries(any())).thenAnswer(
      (invocation) async =>
          invocation.positionalArguments.single as List<AggregatedLibrary>,
    );
    GetIt.instance
      ..registerSingleton<MultiServerRepository>(servers)
      ..registerSingleton<LibraryScopeService>(scope);
  });

  tearDown(tearDownBottomNav);

  testWidgets('merging libraries by type reloads them', (tester) async {
    final controller = BottomNavController();
    addTearDown(controller.dispose);
    await tester.pump();
    verify(servers.getAggregatedLibraries).called(1);

    await prefs.set(UserPreferences.mergeLibrariesByType, true);
    await tester.pump(_pastReloadDebounce);
    await tester.pump();

    verify(servers.getAggregatedLibraries).called(1);
  });

  testWidgets('a library replaced by the merged tile under the same id is '
      'shown as merged', (tester) async {
    final controller = BottomNavController();
    addTearDown(controller.dispose);
    await tester.pump();
    expect(controller.navLibraries.single.unifiedKindName, isNull);

    // The merged tile keeps the id of the library it replaces.
    answer = [merged];
    await prefs.set(UserPreferences.mergeLibrariesByType, true);
    await tester.pump(_pastReloadDebounce);
    await tester.pump();

    expect(controller.navLibraries.single.unifiedKindName, 'movies');
  });

  testWidgets('a load that finishes after a newer one does not put its '
      'libraries back', (tester) async {
    // The first load is still out when the preference changes.
    final slow = Completer<List<AggregatedLibrary>>();
    when(servers.getAggregatedLibraries).thenAnswer((_) => slow.future);
    final controller = BottomNavController();
    addTearDown(controller.dispose);
    await tester.pump();

    when(servers.getAggregatedLibraries).thenAnswer((_) async => [merged]);
    await prefs.set(UserPreferences.mergeLibrariesByType, true);
    await tester.pump(_pastReloadDebounce);
    await tester.pump();
    expect(controller.navLibraries.single.unifiedKindName, 'movies');

    slow.complete([perServer]);
    await tester.pump();
    await tester.pump();

    expect(controller.navLibraries.single.unifiedKindName, 'movies');
  });

  testWidgets('an unrelated preference leaves the libraries alone', (
    tester,
  ) async {
    final controller = BottomNavController();
    addTearDown(controller.dispose);
    await tester.pump();
    clearInteractions(servers);

    await prefs.set(UserPreferences.showShuffleButton, false);
    await tester.pump(_pastReloadDebounce);
    await tester.pump();

    verifyNever(servers.getAggregatedLibraries);
  });
}
