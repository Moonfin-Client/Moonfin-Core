import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/util/game_sram_sync.dart';
import 'package:server_core/server_core.dart';

class _MockGamesApi extends Mock implements GamesApi {}

void main() {
  late Directory dir;
  late _MockGamesApi games;
  late GameSramSync sram;
  final uploads = <List<int>>[];

  setUpAll(() => registerFallbackValue(<int>[]));

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('sram_sync_test');
    games = _MockGamesApi();
    uploads.clear();
    when(
      () => games.putSave('romm-12', any(), kind: 'sram'),
    ).thenAnswer((call) async => uploads.add(call.positionalArguments[1]));
    sram = GameSramSync(games, 'romm-12', dir);
  });

  tearDown(() => dir.delete(recursive: true));

  test('a first launch writes the server copy for the core to read', () async {
    when(
      () => games.getSave('romm-12', kind: 'sram'),
    ).thenAnswer((_) async => [1, 2, 3]);

    expect(await sram.prepare(), isFalse);
    expect(await sram.file.readAsBytes(), [1, 2, 3]);

    // Nothing changed in the session, so there is nothing to send back.
    await sram.finishFromFile();
    expect(uploads, isEmpty);
  });

  test('a failed upload is sent on the next launch instead of downloading',
      () async {
    when(
      () => games.putSave('romm-12', any(), kind: 'sram'),
    ).thenThrow(Exception('offline'));
    await sram.finish([4, 5]);
    expect(await sram.file.readAsBytes(), [4, 5]);

    when(
      () => games.putSave('romm-12', any(), kind: 'sram'),
    ).thenAnswer((call) async => uploads.add(call.positionalArguments[1]));
    expect(await sram.prepare(), isTrue);
    expect(uploads, [
      [4, 5],
    ]);
    verifyNever(() => games.getSave(any(), kind: any(named: 'kind')));

    // Once it went through, the next launch takes the server copy again.
    when(
      () => games.getSave('romm-12', kind: 'sram'),
    ).thenAnswer((_) async => [6]);
    expect(await sram.prepare(), isFalse);
    expect(await sram.file.readAsBytes(), [6]);
  });

  test('progress from a session that never exited is kept and uploaded',
      () async {
    when(
      () => games.getSave('romm-12', kind: 'sram'),
    ).thenAnswer((_) async => [1]);
    await sram.prepare();
    // The native host flushed newer bytes, then the app was killed.
    await sram.file.writeAsBytes([1, 9]);

    expect(await sram.prepare(), isTrue);
    expect(uploads, [
      [1, 9],
    ]);
    expect(await sram.file.readAsBytes(), [1, 9]);
  });

  test('a page that keeps its own copy only flushes what is waiting',
      () async {
    expect(await sram.prepare(download: false), isFalse);
    verifyNever(() => games.getSave(any(), kind: any(named: 'kind')));
  });
}
