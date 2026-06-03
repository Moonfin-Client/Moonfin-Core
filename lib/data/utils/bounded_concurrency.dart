/// Runs [task] over [items] with at most [concurrency] futures in flight,
/// keeping the slots full as each completes (no fixed-batch barriers), and
/// returns the results in input order.
Future<List<R?>> mapBounded<T, R>(
  List<T> items,
  int concurrency,
  Future<R?> Function(T item) task,
) async {
  final results = List<R?>.filled(items.length, null);
  var nextIndex = 0;

  Future<void> worker() async {
    while (true) {
      final i = nextIndex;
      if (i >= items.length) break;
      nextIndex++;
      results[i] = await task(items[i]);
    }
  }

  final workerCount = items.length < concurrency ? items.length : concurrency;
  await Future.wait(List.generate(workerCount, (_) => worker()));
  return results;
}
