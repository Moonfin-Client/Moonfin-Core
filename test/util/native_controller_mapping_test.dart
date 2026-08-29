import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:server_core/server_core.dart';
import 'package:gamepads/gamepads.dart';
import 'package:moonfin/util/native_controller_mapping.dart';

void main() {
  _dataLossGuardTests();
  _perGameBindingTests();
  test('round-trips through JSON', () {
    const mapping = NativeControllerMapping({
      96: RetroPadButton.a,
      97: RetroPadButton.b,
    });

    final restored = NativeControllerMapping.fromJson(mapping.toJson());

    expect(restored.keycodeToButton, mapping.keycodeToButton);
  });

  test('withBinding replaces any existing binding of the same button', () {
    const mapping = NativeControllerMapping({96: RetroPadButton.a});

    final rebound = mapping.withBinding(97, RetroPadButton.a);

    expect(rebound.keycodeToButton[96], isNull);
    expect(rebound.keycodeToButton[97], RetroPadButton.a);
  });

  test('withBinding replaces any existing binding of the same key', () {
    const mapping = NativeControllerMapping({96: RetroPadButton.a});

    final rebound = mapping.withBinding(96, RetroPadButton.b);

    expect(rebound.keycodeToButton[96], RetroPadButton.b);
  });

  test('copy creates an independent immutable snapshot', () {
    final source = NativeControllerMapping({
      96: RetroPadButton.a,
      97: RetroPadButton.b,
    });

    final copy = source.copy();

    expect(copy.keycodeToButton, source.keycodeToButton);
    expect(identical(copy.keycodeToButton, source.keycodeToButton), isFalse);
    expect(
      () => (copy.keycodeToButton as Map)[98] = RetroPadButton.x,
      throwsA(isA<UnsupportedError>()),
    );
  });

  test('ignores malformed persisted bindings', () {
    final restored = NativeControllerMapping.fromJson('{"96": 99, "bad": 0}');

    expect(restored.keycodeToButton, isEmpty);
  });

  test('persists alternate controller types per canonical core', () {
    const mapping = NativeControllerMapping(
      {96: RetroPadButton.a},
      controllerTypesByCore: {'fbneo': 517},
    );

    final restored = NativeControllerMapping.fromJson(mapping.toJson());
    final encoded = jsonDecode(mapping.toJson()) as Map<String, dynamic>;

    expect(restored.keycodeToButton, mapping.keycodeToButton);
    expect(encoded['96'], RetroPadButton.a.retroPadIndex);
    expect(encoded, isNot(contains('bindings')));
    expect(restored.controllerTypeForCore('fbneo'), 517);
    expect(restored.controllerTypeForCore('snes9x'), retroDeviceJoypad);
    expect(
      restored
          .withControllerType('fbneo', retroDeviceJoypad)
          .controllerTypesByCore,
      isNot(contains('fbneo')),
      reason: 'Auto is an unset default, not a persisted advertised choice',
    );
  });

  test('only exposes the implemented FBNeo controller layouts', () {
    const modern = CoreControllerType(port: 0, id: 517, label: 'Modern');
    const foreignSubclass = CoreControllerType(
      port: 0,
      id: 517,
      label: 'Not an FBNeo layout',
    );
    const mouse = CoreControllerType(port: 0, id: 2, label: 'Mouse');
    const auto = CoreControllerType(
      port: 0,
      id: retroDeviceJoypad,
      label: 'Joypad',
    );

    expect(modern.isSupportedForCore('fbneo'), isTrue);
    expect(foreignSubclass.isSupportedForCore('snes9x'), isFalse);
    expect(mouse.isSupportedForCore('fbneo'), isFalse);
    expect(auto.isSupportedForCore('snes9x'), isTrue);
  });

  // These codes are persisted in users' saved desktop mappings, so the table
  // has to stay both complete and stable across gamepads-package upgrades. A
  // new button arriving upstream is silently unmappable without the first
  // check; a duplicated code would make two physical buttons share one
  // binding. Neither shows up as a compile error.
  test('every normalized gamepad button has a unique persisted code', () {
    expect(
      desktopGamepadButtonCodes.keys.toSet(),
      GamepadButton.values.toSet(),
      reason: 'gamepads upgrade changed GamepadButton; update the code table',
    );
    expect(
      desktopGamepadButtonCodes.values.toSet().length,
      GamepadButton.values.length,
      reason: 'two buttons share a persisted code',
    );
    expect(desktopGamepadButtonsByCode.length, GamepadButton.values.length);
  });

  test('desktop device ids are namespaced away from Android hashes', () {
    expect(desktopControllerDeviceId('0'), 'pad:0');
  });
}

class _UnreachableGamesApi extends Mock implements GamesApi {}

void _dataLossGuardTests() {
  group('loadControllerMappingChecked', () {
    test('an unreachable server is reported, not reported as empty', () async {
      final api = _UnreachableGamesApi();
      when(
        () => api.getSave(any(), kind: any(named: 'kind')),
      ).thenThrow(Exception('offline'));

      final result = await loadControllerMappingChecked(api, 'pad-1');

      // The distinction that prevents data loss: a failed read must not look
      // like "this pad has no mapping", or the next edit persists blank
      // bindings over the real ones.
      expect(result.reachable, isFalse);
      expect(result.mapping, NativeControllerMapping.empty);
    });

    test('a genuinely absent mapping is reachable and empty', () async {
      final api = _UnreachableGamesApi();
      when(
        () => api.getSave(any(), kind: any(named: 'kind')),
      ).thenAnswer((_) async => null);

      final result = await loadControllerMappingChecked(api, 'pad-1');

      expect(result.reachable, isTrue);
      expect(result.mapping, NativeControllerMapping.empty);
    });
  });

  group('saveControllerMapping', () {
    test('retries a dropped connection instead of losing the edit', () async {
      final api = _UnreachableGamesApi();
      var calls = 0;
      when(
        () => api.putSave(any(), any(), kind: any(named: 'kind')),
      ).thenAnswer((_) async {
        calls++;
        if (calls < 2) {
          throw DioException(
            requestOptions: RequestOptions(path: '/'),
            type: DioExceptionType.connectionError,
          );
        }
      });

      await saveControllerMapping(
        api,
        'pad-1',
        NativeControllerMapping.empty,
        retryDelay: (_) async {},
      );

      expect(calls, 2);
    });

    test(
      'rethrows once retries are exhausted, so callers can say so',
      () async {
        final api = _UnreachableGamesApi();
        when(
          () => api.putSave(any(), any(), kind: any(named: 'kind')),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/'),
            type: DioExceptionType.connectionError,
          ),
        );

        await expectLater(
          saveControllerMapping(
            api,
            'pad-1',
            NativeControllerMapping.empty,
            retryDelay: (_) async {},
          ),
          throwsA(isA<DioException>()),
        );
      },
    );
  });

  group('stick snap', () {
    test('round-trips through JSON per game', () {
      final mapping = NativeControllerMapping.empty
          .withSnap('burgertime', StickSnapMode.fourWay)
          .withSnap('gauntlet', StickSnapMode.eightWay);
      final restored = NativeControllerMapping.fromJson(mapping.toJson());

      expect(restored.snapForGame('burgertime'), StickSnapMode.fourWay);
      expect(restored.snapForGame('gauntlet'), StickSnapMode.eightWay);
      expect(restored.snapForGame('unset'), StickSnapMode.off);
    });

    test('off is stored as absence, not a value', () {
      final mapping = NativeControllerMapping.empty
          .withSnap('burgertime', StickSnapMode.fourWay)
          .withSnap('burgertime', StickSnapMode.off);

      expect(mapping.snapByGame, isEmpty);
      expect(mapping.toJson().contains('snapByGame'), isFalse);
    });

    test('survives a binding or controller-type edit', () {
      final mapping = NativeControllerMapping.empty
          .withSnap('burgertime', StickSnapMode.fourWay)
          .withBinding(97, RetroPadButton.a)
          .withControllerType('fbneo', 5);

      expect(mapping.snapForGame('burgertime'), StickSnapMode.fourWay);
    });

    test('an unknown wire name falls back to off', () {
      final restored = NativeControllerMapping.fromJson(
        '{"snapByGame":{"g":"sideways"}}',
      );
      expect(restored.snapForGame('g'), StickSnapMode.off);
    });
  });
}

/// Bindings are a global default per controller, overridable per game.
///
/// They used to be global ONLY, so remapping a button while playing
/// one game silently rewrote every other game's bindings -- and withBinding's
/// 1:1 rule DELETED the key the other game had on that button.
void _perGameBindingTests() {
  group('per-game bindings', () {
    const global = NativeControllerMapping({
      96: RetroPadButton.a,
      97: RetroPadButton.b,
    });

    test('a game with no override of its own uses the global default', () {
      expect(global.bindingsForGame('hydro-thunder'), global.keycodeToButton);
      expect(global.hasGameOverride('hydro-thunder'), isFalse);
    });

    test('editing one game leaves another game untouched', () {
      final edited = global.withBindingForGame(
        'burgertime',
        190,
        RetroPadButton.a,
      );

      expect(edited.bindingsForGame('burgertime')[190], RetroPadButton.a);
      expect(edited.bindingsForGame('burgertime')[96], isNull);
      // The whole point: Hydro Thunder still has its own A on keycode 96.
      expect(edited.bindingsForGame('hydro-thunder')[96], RetroPadButton.a);
      expect(edited.bindingsForGame('hydro-thunder')[190], isNull);
    });

    test('the first edit inherits the global default, then diverges', () {
      final edited = global.withBindingForGame(
        'burgertime',
        190,
        RetroPadButton.x,
      );

      // B was never touched for this game, so it came across from the default.
      expect(edited.bindingsForGame('burgertime')[97], RetroPadButton.b);
      expect(edited.bindingsForGame('burgertime')[190], RetroPadButton.x);
    });

    test('a per-game edit never rewrites the global default', () {
      final edited = global.withBindingForGame(
        'burgertime',
        190,
        RetroPadButton.a,
      );

      expect(edited.keycodeToButton, global.keycodeToButton);
      // A game added later still inherits the untouched default.
      expect(edited.bindingsForGame('spy-hunter')[96], RetroPadButton.a);
    });

    test('1:1 replacement applies within the game, not across games', () {
      final edited = global
          .withBindingForGame('burgertime', 190, RetroPadButton.a)
          .withBindingForGame('burgertime', 191, RetroPadButton.a);

      expect(edited.bindingsForGame('burgertime')[190], isNull);
      expect(edited.bindingsForGame('burgertime')[191], RetroPadButton.a);
      expect(edited.bindingsForGame('hydro-thunder')[96], RetroPadButton.a);
    });

    test('an empty game id edits the global default', () {
      final edited = global.withBindingForGame('', 190, RetroPadButton.a);

      expect(edited.keycodeToButton[190], RetroPadButton.a);
      expect(edited.bindingsByGame, isEmpty);
    });

    test('dropping an override returns the game to the default', () {
      final edited = global.withBindingForGame(
        'burgertime',
        190,
        RetroPadButton.a,
      );

      final reset = edited.withoutGameOverride('burgertime');

      expect(reset.hasGameOverride('burgertime'), isFalse);
      expect(reset.bindingsForGame('burgertime'), global.keycodeToButton);
    });

    test('round-trips overrides through JSON', () {
      final mapping = global
          .withBindingForGame('burgertime', 190, RetroPadButton.a)
          .withSnap('burgertime', StickSnapMode.fourWay)
          .withControllerType('fbneo', 5);

      final restored = NativeControllerMapping.fromJson(mapping.toJson());

      expect(restored.keycodeToButton, global.keycodeToButton);
      expect(restored.bindingsForGame('burgertime')[190], RetroPadButton.a);
      expect(restored.bindingsForGame('hydro-thunder')[96], RetroPadButton.a);
      expect(restored.snapForGame('burgertime'), StickSnapMode.fourWay);
      expect(restored.controllerTypeForCore('fbneo'), 5);
    });

    test('a document written before overrides existed still loads', () {
      final restored = NativeControllerMapping.fromJson(
        '{"96":0,"97":1,"controllerTypes":{"fbneo":5}}',
      );

      // Every game inherits what the user had, so nobody loses a mapping on
      // the upgrade; the first per-game edit is what starts the divergence.
      expect(restored.bindingsForGame('hydro-thunder')[96], RetroPadButton.a);
      expect(restored.bindingsByGame, isEmpty);
    });

    test('no overrides means no bindingsByGame key on the wire', () {
      expect(global.toJson().contains('bindingsByGame'), isFalse);
    });

    test('a malformed override is dropped, not fatal', () {
      final restored = NativeControllerMapping.fromJson(
        '{"96":0,"bindingsByGame":{"g":"nonsense","h":{"190":0}}}',
      );

      expect(restored.hasGameOverride('g'), isFalse);
      expect(restored.bindingsForGame('h')[190], RetroPadButton.a);
    });

    test('withBindingsForGame replaces only that game, not the default', () {
      final copied = global.withBindingsForGame('burgertime', {
        190: RetroPadButton.a,
      });

      expect(copied.bindingsForGame('burgertime'), {190: RetroPadButton.a});
      expect(copied.keycodeToButton, global.keycodeToButton);
      expect(copied.bindingsForGame('hydro-thunder')[96], RetroPadButton.a);
    });

    test('the reported Hydro Thunder sequence, through the save layer', () async {
      // The owner's report, step for step: map a pad while playing one game,
      // play others and remap there, come back. Runs against the real save
      // and load helpers so the wire format is what carries the guarantee,
      // not just the in-memory model.
      final api = _InMemoryGamesApi();
      const pad = 'android-abc';
      const hydroThunder = 'hydro-thunder';
      const burgerTime = 'burgertime';

      await saveControllerMapping(
        api,
        pad,
        NativeControllerMapping.empty.withBindingForGame(
          hydroThunder,
          96,
          RetroPadButton.a,
        ),
      );

      // A different game, a different session: load, remap, save.
      final inBurgerTime = await loadControllerMapping(api, pad);
      await saveControllerMapping(
        api,
        pad,
        inBurgerTime.withBindingForGame(burgerTime, 190, RetroPadButton.a),
      );

      // Back in Hydro Thunder via Continue.
      final back = await loadControllerMapping(api, pad);

      expect(
        back.bindingsForGame(hydroThunder)[96],
        RetroPadButton.a,
        reason: 'remapping in another game must not clear this one',
      );
      expect(back.bindingsForGame(burgerTime)[190], RetroPadButton.a);
      expect(back.bindingsForGame(burgerTime)[96], isNull);
    });

    test('every controller keeps its own mapping for the same game', () async {
      // A game is set up with more than one pad. Each controller's mapping for
      // that game must survive on its own: P2's edit must not disturb P1, and
      // neither may reach the other games either pad plays.
      final api = _InMemoryGamesApi();
      const gameId = 'hydro-thunder';

      for (final pad in ['android-p1', 'android-p2']) {
        await saveControllerMapping(
          api,
          pad,
          NativeControllerMapping.empty.withBindingForGame(
            'burgertime',
            190,
            RetroPadButton.y,
          ),
        );
      }

      // Both pads get mapped for this game, in the order the user does it.
      for (final entry in {'android-p1': 96, 'android-p2': 97}.entries) {
        final current = await loadControllerMapping(api, entry.key);
        await saveControllerMapping(
          api,
          entry.key,
          current.withBindingForGame(gameId, entry.value, RetroPadButton.a),
        );
      }

      final p1 = await loadControllerMapping(api, 'android-p1');
      final p2 = await loadControllerMapping(api, 'android-p2');

      expect(p1.bindingsForGame(gameId), {96: RetroPadButton.a});
      expect(p2.bindingsForGame(gameId), {97: RetroPadButton.a});
      // Neither pad's other game was touched by setting this one up.
      expect(p1.bindingsForGame('burgertime')[190], RetroPadButton.y);
      expect(p2.bindingsForGame('burgertime')[190], RetroPadButton.y);
      // And the two pads are separate documents, not one shared one.
      expect(api.saves.keys, hasLength(2));
    });

    test('copy keeps overrides independent of the source', () {
      final source = global.withBindingForGame(
        'burgertime',
        190,
        RetroPadButton.a,
      );

      final copy = source.copy();

      expect(copy.bindingsForGame('burgertime')[190], RetroPadButton.a);
      expect(
        () => (copy.bindingsByGame as Map)['x'] = <int, RetroPadButton>{},
        throwsUnsupportedError,
      );
    });
  });
}

/// A GamesApi that really stores what it is given, so a test can assert on the
/// document that survives a save/load round trip.
class _InMemoryGamesApi extends Mock implements GamesApi {
  final Map<String, List<int>> saves = {};

  @override
  Future<List<int>?> getSave(String id, {String? kind}) async => saves[id];

  @override
  Future<void> putSave(String id, List<int> bytes, {String? kind}) async {
    saves[id] = bytes;
  }
}
