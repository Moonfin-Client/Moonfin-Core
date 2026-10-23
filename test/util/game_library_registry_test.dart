import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/util/game_library.dart';
import 'package:server_core/server_core.dart';

class _Client extends Mock implements MediaServerClient {}

class _GamesApi extends Mock implements GamesApi {}

void main() {
  late _GamesApi games;

  setUp(() {
    games = _GamesApi();
    final client = _Client();
    when(() => client.gamesApi).thenReturn(games);
    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() => GetIt.instance.reset());

  test('reads the list once for every screen that asks', () async {
    when(() => games.getLibraries()).thenAnswer(
      (_) async => const [GameLibrary(id: 'games', name: 'Games')],
    );
    final registry = GameLibraryRegistry();

    await registry.refresh();
    await registry.refresh();

    verify(() => games.getLibraries()).called(1);
    expect(registry.contains('games'), isTrue);
  });

  test('reads it again after being invalidated', () async {
    when(() => games.getLibraries()).thenAnswer(
      (_) async => const [GameLibrary(id: 'games', name: 'Games')],
    );
    final registry = GameLibraryRegistry();
    await registry.refresh();

    when(() => games.getLibraries()).thenAnswer(
      (_) async => const [GameLibrary(id: 'roms', name: 'ROMs')],
    );
    registry.invalidate();
    expect(registry.contains('games'), isTrue);
    await registry.refresh();

    expect(registry.contains('roms'), isTrue);
    expect(registry.contains('games'), isFalse);
  });

  test('tries again on the next screen when a read fails', () async {
    when(() => games.getLibraries()).thenThrow(Exception('offline'));
    final registry = GameLibraryRegistry();
    await registry.refresh();
    expect(registry.loaded, isFalse);

    when(() => games.getLibraries()).thenAnswer(
      (_) async => const [GameLibrary(id: 'games', name: 'Games')],
    );
    await registry.refresh();

    expect(registry.loaded, isTrue);
  });
}
