import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/viewmodels/game_system_browse_view_model.dart';
import 'package:server_core/server_core.dart';

void main() {
  late _FakeGamesApi api;
  late GameSystemBrowseViewModel viewModel;

  setUp(() {
    api = _FakeGamesApi();
    viewModel = GameSystemBrowseViewModel(
      gamesApi: api,
      libraryId: 'retro',
      systemId: 'atari2600',
    );
  });

  tearDown(() => viewModel.dispose());

  test('loads sorted games without inventing an active selection', () async {
    await viewModel.load();

    expect(viewModel.loading, isFalse);
    expect(viewModel.error, isNull);
    expect(viewModel.displaySystemName, 'Atari 2600');
    expect(viewModel.visibleGames.map((game) => game.title), [
      'Élite',
      'River Raid',
    ]);
    expect(viewModel.activeGame, isNull);
    expect(api.detailRequests, 0);
  });

  test('debounces filtering and folds accents', () async {
    await viewModel.load();

    viewModel.updateSearch('elite');
    await Future<void>.delayed(const Duration(milliseconds: 100));
    expect(viewModel.visibleGames, hasLength(2));

    await Future<void>.delayed(const Duration(milliseconds: 75));
    expect(viewModel.visibleGames.map((game) => game.title), ['Élite']);
  });

  test('starting a search resets an existing alphabet filter', () async {
    await viewModel.load();
    viewModel.selectLetter('R');
    expect(viewModel.selectedLetter, 'R');
    expect(viewModel.visibleGames.map((game) => game.title), ['River Raid']);

    viewModel.updateSearch('elite');

    expect(viewModel.selectedLetter, isEmpty);
    expect(viewModel.visibleGames, hasLength(2));
    await Future<void>.delayed(const Duration(milliseconds: 175));
    expect(viewModel.visibleGames.map((game) => game.title), ['Élite']);
  });

  test('only requests details when the caller displays the HUD', () async {
    await viewModel.load();
    final game = viewModel.visibleGames.first;

    viewModel.activateGame(game, showBackdrop: false, loadDetails: false);
    await Future<void>.delayed(const Duration(milliseconds: 100));
    expect(api.detailRequests, 0);

    viewModel.activateGame(game, showBackdrop: false, loadDetails: true);
    await Future<void>.delayed(const Duration(milliseconds: 100));
    expect(api.detailRequests, 1);
    expect(viewModel.hudGame?.id, game.id);
    expect(viewModel.gameDetails[game.id]?.overview, 'Game overview');
  });

  test(
    'reveals the title and description together after the hover guard',
    () async {
      await viewModel.load();
      final game = viewModel.visibleGames.first;

      viewModel.activateGame(game, showBackdrop: false, loadDetails: true);

      expect(viewModel.activeGame?.id, game.id);
      expect(viewModel.hudGame, isNull);
      await Future<void>.delayed(const Duration(milliseconds: 100));
      expect(viewModel.hudGame?.id, game.id);
      expect(viewModel.gameDetails[game.id]?.overview, 'Game overview');
    },
  );

  test('loads description details before changing the backdrop', () async {
    await viewModel.load();
    final game = viewModel.visibleGames.first;

    viewModel.activateGame(game, showBackdrop: true, loadDetails: true);
    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(api.detailRequests, 1);
    expect(viewModel.backdropGame, isNull);

    await Future<void>.delayed(const Duration(milliseconds: 575));
    expect(viewModel.backdropGame?.id, game.id);
  });

  test('unsupported servers expose a stable error state', () async {
    final unsupported = GameSystemBrowseViewModel(
      gamesApi: null,
      libraryId: 'retro',
      systemId: 'atari2600',
    );
    addTearDown(unsupported.dispose);

    await unsupported.load();

    expect(unsupported.loading, isFalse);
    expect(unsupported.error, GameSystemBrowseError.unsupported);
  });
}

class _FakeGamesApi implements GamesApi {
  int detailRequests = 0;

  static const _games = [
    GameSummary(
      id: 'river',
      title: 'River Raid',
      system: 'atari2600',
      core: 'stella',
      fileName: 'River Raid (USA).a26',
    ),
    GameSummary(
      id: 'elite',
      title: 'Élite',
      system: 'atari2600',
      core: 'stella',
      fileName: 'Elite (Europe).a26',
    ),
  ];

  @override
  Future<List<GameSummary>> getGames(
    String libraryId, {
    String? system,
  }) async => [..._games];

  @override
  Future<List<GameSystem>> getSystems(String libraryId) async => const [
    GameSystem(
      id: 'atari2600',
      name: 'Atari 2600',
      core: 'stella',
      gameCount: 2,
    ),
  ];

  @override
  Future<GameDetail?> getGame(String libraryId, String gameId) async {
    detailRequests++;
    final game = _games.firstWhere((candidate) => candidate.id == gameId);
    return GameDetail(
      id: game.id,
      title: game.title,
      system: game.system,
      core: game.core,
      fileName: game.fileName,
      sizeBytes: 0,
      bios: const [],
      overview: 'Game overview',
    );
  }

  @override
  Future<List<GameLibrary>> getLibraries() async => const [];

  @override
  String thumbUrl({
    required String libraryId,
    required String gameId,
    String kind = 'boxart',
  }) => '';

  @override
  String playerUrl({
    required String libraryId,
    required String gameId,
    required String core,
    String? biosId,
    String? gameName,
    bool includeSaveUrl = false,
  }) => '';

  @override
  Future<void> downloadRom(
    String libraryId,
    String gameId,
    String destPath, {
    void Function(int received, int total)? onProgress,
  }) async {}

  @override
  Future<void> downloadBios(
    String libraryId,
    String biosId,
    String destPath,
  ) async {}

  @override
  Future<List<int>?> getSave(String gameId, {String kind = 'state'}) async =>
      null;

  @override
  Future<void> putSave(
    String gameId,
    List<int> data, {
    String kind = 'state',
  }) async {}
}
