import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/media_bar_state.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/media_bar_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/viewmodels/media_bar_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Repository extends Mock implements MediaBarRepository {}

class _MdbList extends Mock implements MdbListRepository {}

class _Client extends Mock implements MediaServerClient {}

class _Sync extends ChangeNotifier implements PluginSyncService {
  bool available = false;

  @override
  bool get pluginAvailable => available;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late UserPreferences prefs;
  late _Repository repository;
  late _Sync sync;
  late List<Completer<MediaBarState>> loads;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    sync = _Sync();
    GetIt.instance.registerSingleton<PluginSyncService>(sync);
    loads = [];
    repository = _Repository();
    when(() => repository.loadItems()).thenAnswer((_) {
      final load = Completer<MediaBarState>();
      loads.add(load);
      return load.future;
    });
  });

  tearDown(() => GetIt.instance.reset());

  MediaBarViewModel create() =>
      MediaBarViewModel(repository, _MdbList(), prefs, _Client());

  test('a source change made during a load runs once that load ends', () async {
    final viewModel = create();
    unawaited(viewModel.load());
    await prefs.set(UserPreferences.mediaBarLibraryIds, 'lib');
    expect(loads, hasLength(1));

    loads.first.complete(const MediaBarDisabled());
    await pumpEventQueue();

    expect(loads, hasLength(2));
  });

  test('picked lists load again once Moonbase answers', () async {
    await prefs.set(UserPreferences.mediaBarExternalLists, 'imdb_top_250_movies');
    final viewModel = create();
    unawaited(viewModel.load());
    loads.first.complete(const MediaBarDisabled());
    await pumpEventQueue();

    sync
      ..available = true
      ..notifyListeners();
    await pumpEventQueue();

    expect(loads, hasLength(2));
    viewModel.dispose();
  });
}
