import 'dart:async';

import 'package:server_silo/src/silo_kept_reads.dart';
import 'package:test/test.dart';

void main() {
  var now = DateTime.utc(2026, 10, 20);
  late SiloKeptReads<String, int> kept;
  var reads = 0;
  Future<int> read() async => ++reads;

  setUp(() {
    now = DateTime.utc(2026, 10, 20);
    reads = 0;
    kept = SiloKeptReads(
      lifetime: const Duration(minutes: 1),
      clock: () => now,
    );
  });

  test('an answer is kept for its lifetime, per key', () async {
    expect(await kept.get('a', read), 1);
    expect(await kept.get('a', read), 1);
    expect(await kept.get('b', read), 2);
    now = now.add(const Duration(minutes: 1));
    expect(await kept.get('a', read), 3);
  });

  test('asks made while a read is on its way share it', () async {
    final gate = Completer<int>();
    final first = kept.get('a', () => gate.future);
    final second = kept.get('a', read);
    gate.complete(7);
    expect(await first, 7);
    expect(await second, 7);
    expect(reads, 0);
  });

  test('a failed read is not kept', () async {
    await expectLater(
      kept.get('a', () async => throw StateError('x')),
      throwsStateError,
    );
    expect(await kept.get('a', read), 1);
  });

  test('an answer keep turns down is not kept', () async {
    final picky = SiloKeptReads<String, int>(
      lifetime: const Duration(minutes: 1),
      keep: (v) => v > 1,
      clock: () => now,
    );
    expect(await picky.get('a', read), 1);
    expect(await picky.get('a', read), 2);
    expect(await picky.get('a', read), 2);
  });

  test('refresh and forget read anew', () async {
    expect(await kept.get('a', read), 1);
    expect(await kept.get('a', read, refresh: true), 2);
    kept.forget('a');
    expect(await kept.get('a', read), 3);
    kept.forget();
    expect(await kept.get('a', read), 4);
  });
}
