import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/util/game_cores.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockGamesApi extends Mock implements GamesApi {}

void main() {
  _coreOptionDefaultsTests();

  TestWidgetsFlutterBinding.ensureInitialized();

  group('resolveNativeGameBackend', () {
    test('uses EmulatorJS when native emulation is disabled', () {
      expect(
        resolveNativeGameBackend(
          nativeSelected: false,
          nativeSupported: true,
          emulatorAvailable: true,
          nativeCoreAvailable: true,
        ),
        isFalse,
      );
    });

    test('uses native backend when its selected core is installed', () {
      expect(
        resolveNativeGameBackend(
          nativeSelected: true,
          nativeSupported: true,
          emulatorAvailable: true,
          nativeCoreAvailable: true,
        ),
        isTrue,
      );
    });

    test('falls back to EmulatorJS when downloadable core is absent', () {
      expect(
        resolveNativeGameBackend(
          nativeSelected: true,
          nativeSupported: true,
          emulatorAvailable: true,
          nativeCoreAvailable: false,
        ),
        isFalse,
      );
    });

    test('retains native route where EmulatorJS is unavailable', () {
      expect(
        resolveNativeGameBackend(
          nativeSelected: true,
          nativeSupported: false,
          emulatorAvailable: false,
          nativeCoreAvailable: false,
        ),
        isTrue,
      );
    });
  });

  group('core mappings', () {
    test('every core id in the catalog is unique', () {
      final coreIds = gameCoreCatalog.map((core) => core.coreId).toList();
      expect(coreIds.toSet(), hasLength(coreIds.length));
    });

    test('every EmulatorJS system-core mapping in the catalog is unique', () {
      final systemCores = gameCoreCatalog
          .expand((core) => core.emulatorJsSystemCores)
          .toList();
      expect(systemCores.toSet(), hasLength(systemCores.length));
    });

    test('downloadableCores preserves the catalog order', () {
      final coreIds = gameCoreCatalog.map((core) => core.coreId).toList();
      expect(
        downloadableCores.map((core) => core.coreId),
        orderedEquals(coreIds),
      );
    });

    test('MAME is never routed as an EmulatorJS system core', () {
      final systemCores = gameCoreCatalog
          .expand((core) => core.emulatorJsSystemCores)
          .toList();
      expect(systemCores, isNot(contains('mame')));
    });

    test('no Apple-bundled core requires JIT', () {
      // Apple platforms cannot JIT in bundled/non-debug builds, so a core
      // that needs it must never be marked bundledOnApple.
      expect(
        gameCoreCatalog
            .where((core) => core.bundledOnApple)
            .any((core) => core.needsJit),
        isFalse,
      );
    });

    test('keeps established console systems mapped', () {
      const expected = {
        'nes': 'fceumm',
        'snes': 'snes9x',
        'gb': 'gambatte',
        'gba': 'mgba',
        'segaMD': 'genesis_plus_gx',
        'segaMS': 'genesis_plus_gx',
        'segaGG': 'genesis_plus_gx',
        'atari2600': 'stella',
        'atari7800': 'prosystem',
        'lynx': 'handy',
        'ws': 'mednafen_wswan',
        'ngp': 'mednafen_ngp',
        'pce': 'mednafen_pce_fast',
        'vb': 'mednafen_vb',
        'psx': 'pcsx_rearmed',
        'n64': 'mupen64plus_next',
        'psp': 'ppsspp',
        'nds': 'melonds',
        'arcade': 'fbneo',
      };

      for (final entry in expected.entries) {
        expect(libretroCoreId(entry.key), entry.value, reason: entry.key);
      }
    });

    test('leaves MAME on EmulatorJS', () {
      expect(libretroCoreId('mame'), isNull);
    });

    test('isArcadeFamilyCore recognizes both arcade core names', () {
      expect(isArcadeFamilyCore('arcade'), isTrue);
      expect(isArcadeFamilyCore('mame'), isTrue);
      expect(isArcadeFamilyCore('nes'), isFalse);
    });

    // FBNeo's license asks that frontends not redistribute the core, and the
    // Apple builds can only run what ships inside the bundle, so they leave it
    // out. Android and desktop are unaffected because the user downloads the
    // core there themselves.
    test('FBNeo is not bundled on Apple', () {
      expect(appleBundledCores.contains('fbneo'), isFalse);
      expect(
        _defaultFetchCores('ios/game_host/fetch_cores.sh').contains('fbneo'),
        isFalse,
      );
      expect(
        _defaultFetchCores(
          'tvos/scripts/cores/fetch_cores.sh',
        ).contains('fbneo'),
        isFalse,
      );
    });

    test('Apple fetch scripts match the catalog bundle membership', () {
      expect(
        _defaultFetchCores('ios/game_host/fetch_cores.sh'),
        appleBundledCores,
      );
      expect(
        _defaultFetchCores('tvos/scripts/cores/fetch_cores.sh'),
        appleBundledCores,
      );
    });

    test('macOS fetch script matches the catalog bundle membership', () {
      expect(
        _defaultFetchCores('macos/game_host/fetch_cores.sh'),
        macosBundledCores,
      );
    });
  });

  group('Android routing', () {
    setUp(() async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      SharedPreferences.setMockInitialValues({
        'pref_use_native_emulator': true,
      });
      final store = PreferenceStore();
      await store.init();
      GetIt.instance.registerSingleton<PreferenceStore>(store);
      GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    });

    tearDown(() async {
      debugDefaultTargetPlatformOverride = null;
      await GetIt.instance.reset();
    });

    test('falls back for Atari 2600 when Stella is not installed', () {
      expect(usesNativeGameBackendFor('atari2600'), isFalse);
    });

    test('uses the native Atari 2600 core after installation', () async {
      await GetIt.instance<PreferenceStore>().setStringList(
        installedCoresPreferenceKey,
        ['stella'],
      );

      expect(usesNativeGameBackendFor('atari2600'), isTrue);
    });

    test('keeps MAME on EmulatorJS even when native is selected', () {
      expect(usesNativeGameBackendFor('mame'), isFalse);
    });

    test('nativeCoreReachable ignores the native/EmulatorJS preference, unlike '
        'usesNativeGameBackendFor', () async {
      await GetIt.instance<PreferenceStore>().setStringList(
        installedCoresPreferenceKey,
        ['stella'],
      );
      // Even with EmulatorJS preferred, nativeCoreReachable must still say
      // the native row is a real, selectable option.
      await GetIt.instance<PreferenceStore>().set(
        UserPreferences.useNativeEmulator,
        false,
      );

      expect(usesNativeGameBackendFor('atari2600'), isFalse);
      expect(nativeCoreReachable('atari2600'), isTrue);
    });

    test('nativeCoreReachable is false for an uninstalled core', () {
      expect(nativeCoreReachable('atari2600'), isFalse);
    });

    test('namespaces EmulatorJS save states by core', () {
      expect(gameStateKey('opaque-token', 'arcade'), 'ejs-arcade-opaque-token');
      expect(gameStateKey('opaque-token', 'mame'), 'ejs-mame-opaque-token');
    });

    test('forced EmulatorJS never shares a native save namespace', () {
      expect(
        gameStateKey('opaque-token', 'atari2600', forceEmulatorJs: true),
        'ejs-atari2600-opaque-token',
      );
    });

    test('recovers the old lr-gameId scheme for the native backend', () async {
      await GetIt.instance<PreferenceStore>().setStringList(
        installedCoresPreferenceKey,
        ['stella'],
      );

      expect(
        legacyGameStateKey('opaque-token', 'atari2600'),
        'lr-opaque-token',
      );
    });
  });

  group('macOS routing', () {
    setUp(() {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    });

    tearDown(() async {
      debugDefaultTargetPlatformOverride = null;
      await GetIt.instance.reset();
    });

    test('macOS does not claim an unbundled core is available', () {
      expect(macosBundledCores.contains('fbneo'), isFalse);
      expect(usesNativeGameBackendFor('arcade'), isFalse);
    });

    test('macOS still plays a core it actually bundles', () {
      expect(macosBundledCores.contains('fceumm'), isTrue);
      expect(usesNativeGameBackendFor('nes'), isTrue);
    });
  });

  group('legacyGameStateKey', () {
    test('is the bare gameId for EmulatorJS-only cores', () {
      // 'mame' has no libretro mapping, so it never routes through the
      // native backend regardless of platform/preferences.
      expect(legacyGameStateKey('opaque-token', 'mame'), 'opaque-token');
    });
  });

  group('loadGameStateWithMigration', () {
    late _MockGamesApi games;

    setUpAll(() {
      registerFallbackValue(<int>[]);
    });

    setUp(() {
      games = _MockGamesApi();
    });

    test('returns the new-key save and never touches the legacy key', () async {
      when(
        () => games.getSave('ejs-arcade-game1'),
      ).thenAnswer((_) async => [1, 2, 3]);

      final result = await loadGameStateWithMigration(games, 'game1', 'arcade');

      expect(result, [1, 2, 3]);
      verifyNever(() => games.getSave('game1'));
      verifyNever(() => games.putSave(any(), any()));
    });

    test(
      'falls back to the legacy key on a miss and migrates it to the new key',
      () async {
        when(
          () => games.getSave('ejs-arcade-game1'),
        ).thenAnswer((_) async => null);
        when(() => games.getSave('game1')).thenAnswer((_) async => [4, 5, 6]);
        when(
          () => games.putSave('ejs-arcade-game1', any()),
        ).thenAnswer((_) async {});

        final result = await loadGameStateWithMigration(
          games,
          'game1',
          'arcade',
        );

        expect(result, [4, 5, 6]);
        verify(() => games.putSave('ejs-arcade-game1', [4, 5, 6])).called(1);
      },
    );

    test(
      'returns null when neither the new nor the legacy key has a save',
      () async {
        when(
          () => games.getSave('ejs-arcade-game1'),
        ).thenAnswer((_) async => null);
        when(() => games.getSave('game1')).thenAnswer((_) async => null);

        final result = await loadGameStateWithMigration(
          games,
          'game1',
          'arcade',
        );

        expect(result, isNull);
        verifyNever(() => games.putSave(any(), any()));
      },
    );
  });

  group('core settings round trip', () {
    late _MockGamesApi games;

    setUpAll(() => registerFallbackValue(<int>[]));

    setUp(() => games = _MockGamesApi());

    // Reads back the exact bytes the write produced, so the encode and the
    // decode cant drift apart.
    Future<Map<String, String>> roundTrip(Map<String, String> values) async {
      List<int>? written;
      when(
        () => games.putSave(any(), any(), kind: any(named: 'kind')),
      ).thenAnswer((invocation) async {
        written = invocation.positionalArguments[1] as List<int>;
      });
      await writeCoreSettings(games, 'mupen64plus_next', values);

      when(
        () => games.getSave(any(), kind: any(named: 'kind')),
      ).thenAnswer((_) async => written);
      return readCoreSettings(games, 'mupen64plus_next');
    }

    test('every written option comes back', () async {
      const values = {
        'mupen64plus-rdp-plugin': 'angrylion',
        'mupen64plus-43screensize': '640x480',
      };

      expect(await roundTrip(values), values);
    });

    test('a value that is not plain ascii survives', () async {
      expect(
        await roundTrip(const {'core-label': 'Nintendo 64 \u00e9\u00fc'}),
        const {'core-label': 'Nintendo 64 \u00e9\u00fc'},
      );
    });

    test('a value containing = keeps everything after the first one', () async {
      expect(
        await roundTrip(const {'opt': 'a=b=c'}),
        const {'opt': 'a=b=c'},
      );
    });

    test('no values writes the blob reset uses', () async {
      final written = <List<int>>[];
      when(
        () => games.putSave(any(), any(), kind: any(named: 'kind')),
      ).thenAnswer((invocation) async {
        written.add(invocation.positionalArguments[1] as List<int>);
      });

      await writeCoreSettings(games, 'mupen64plus_next', const {});

      expect(written.single, const [10]);
    });

    test('nothing saved reads as no options', () async {
      when(
        () => games.getSave(any(), kind: any(named: 'kind')),
      ).thenAnswer((_) async => null);

      expect(await readCoreSettings(games, 'mupen64plus_next'), isEmpty);
    });
  });
}

Set<String> _defaultFetchCores(String relativePath) {
  final script = File(relativePath).readAsStringSync();
  final declarations = RegExp(
    r'(?:CORES|cores)=\(([^)]*)\)',
    dotAll: true,
  ).allMatches(script);
  for (final declaration in declarations) {
    final cores = RegExp(
      r'[a-z0-9_]+',
    ).allMatches(declaration.group(1)!).map((match) => match.group(0)!).toSet();
    if (cores.isNotEmpty) return cores;
  }

  throw StateError('No default core declaration found in $relativePath.');
}

void _coreOptionDefaultsTests() {
  group('withCoreOptionDefaults', () {
    const n64 = 'mupen64plus_next';
    const cacheKey = 'mupen64plus-MaxTxCacheSize';

    test('applies the app default when the user has no settings', () {
      // This is the reset case: clearing the stored document must land on our
      // value, not the core's 8000, which OOM-kills the app on TV hardware.
      final merged = withCoreOptionDefaults(n64, null);
      expect(merged, isNotNull);
      expect(merged![cacheKey], '1500');
    });

    test('a user value always wins over the app default', () {
      final merged = withCoreOptionDefaults(n64, {cacheKey: '8000'});
      expect(merged![cacheKey], '8000');
    });

    test('fills gaps without disturbing unrelated user settings', () {
      final merged = withCoreOptionDefaults(n64, {'some-other-option': 'x'});
      expect(merged!['some-other-option'], 'x');
      expect(merged[cacheKey], '1500');
    });

    test('passes settings through untouched for a core with no defaults', () {
      final settings = {'a': 'b'};
      expect(withCoreOptionDefaults('snes9x', settings), settings);
      expect(withCoreOptionDefaults('snes9x', null), isNull);
    });

    test('every defaulted core is actually in the catalog', () {
      // A typo in a core id would silently never apply.
      final ids = gameCoreCatalog.map((c) => c.coreId).toSet();
      for (final coreId in coreOptionDefaults.keys) {
        expect(ids, contains(coreId), reason: '$coreId is not a known core');
      }
    });
  });
}
