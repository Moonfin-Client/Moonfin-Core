// Entry redirect (portnook fork): tests for playback_manager_server_rebase.dart.
part of 'playback_manager_reconnect_test.dart';

/// A [_TestBackend] that can follow a moved server, answering each
/// [rebaseServer] once [rebaseGate] completes.
class _RebaseBackend extends _TestBackend implements ServerRebaseBackend {
  final stalls = StreamController<void>.broadcast(sync: true);
  final List<String> rebases = <String>[];
  Completer<bool> rebaseGate = Completer<bool>();

  @override
  Stream<void> get serverStallStream => stalls.stream;

  @override
  Future<bool> rebaseServer(String from, String to) {
    rebases.add('$from -> $to');
    return rebaseGate.future;
  }
}

void _entryRedirectTests() {
  group('a moved server', () {
    const from = 'http://h:1000';
    const to = 'http://h:2000';
    const movie2 = <String, dynamic>{'Id': 'movie-2', 'Type': 'Movie'};

    test('reopens the stream when the backend follows nothing', () {
      final resolver = _Resolver();
      final backend = _RebaseBackend();
      _withPlayback(resolver, player: backend, (async, manager, _, service) {
        // Made in fake time, so its answer arrives there.
        backend.rebaseGate = Completer<bool>();
        unawaited(manager.onServerMoved(from: from, to: to));
        async.flushMicrotasks();
        expect(backend.rebases, ['$from -> $to']);
        backend.rebaseGate.complete(false);
        async.flushMicrotasks();
        expect(manager.isReconnecting, isTrue);

        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests.single.position, const Duration(minutes: 20));
      });
    });

    test('a seek back after a move doesn\'t read as a stall', () {
      final resolver = _Resolver();
      final backend = _RebaseBackend();
      _withPlayback(resolver, player: backend, (async, manager, _, service) {
        backend.rebaseGate = Completer<bool>();
        unawaited(manager.onServerMoved(from: from, to: to));
        async.flushMicrotasks();
        backend.rebaseGate.complete(true);
        async.flushMicrotasks();

        unawaited(manager.seekTo(const Duration(minutes: 10)));
        async.flushMicrotasks();
        backend.emitPlaying(true);
        backend.emitPosition(const Duration(minutes: 10, seconds: 5));
        async.elapse(const Duration(seconds: 9));

        expect(manager.isReconnecting, isFalse);
      });
    });

    test('a refused move reopens nothing once the queue moved on', () {
      final resolver = _Resolver();
      fakeAsync((async) {
        final backend = _RebaseBackend();
        final manager = PlaybackManager()
          ..setBackend(backend)
          ..setResolver(resolver)
          ..setPlayerService(_TestService())
          ..clock = async.getClock(DateTime(2026, 11, 20, 20)).now;
        unawaited(manager.playItems(<dynamic>[_movie, movie2]));
        async.flushMicrotasks();
        backend.emitPosition(const Duration(minutes: 20));

        unawaited(manager.onServerMoved(from: from, to: to));
        async.flushMicrotasks();
        unawaited(manager.next());
        async.flushMicrotasks();
        expect(manager.queueService.currentItem, movie2);
        final requests = resolver.requests.length;
        final starts = backend.playStarts.length;

        backend.rebaseGate.complete(false);
        async.flushMicrotasks();
        async.elapse(const Duration(seconds: 30));
        expect(manager.isReconnecting, isFalse);
        expect(resolver.requests, hasLength(requests));
        expect(backend.playStarts, hasLength(starts));
        manager.dispose();
        async.flushTimers();
      });
    });

    test('a player that can\'t watch its requests asks while it buffers', () {
      final resolver = _Resolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        manager.canServerMove = () => true;
        var stalls = 0;
        manager.serverStalledStream.listen((_) => stalls++);
        backend.emitBuffering(true);
        async.elapse(const Duration(seconds: 4));
        expect(stalls, 0);
        async.elapse(const Duration(seconds: 1));
        expect(stalls, 1);
        async.elapse(const Duration(seconds: 5));
        expect(stalls, 2);

        backend.emitBuffering(false);
        async.elapse(const Duration(seconds: 30));
        expect(stalls, 2);
      });
    });

    test('buffering on a server that can\'t move asks nothing', () {
      final resolver = _Resolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        var stalls = 0;
        manager.serverStalledStream.listen((_) => stalls++);
        backend.emitBuffering(true);
        async.elapse(const Duration(seconds: 30));
        expect(stalls, 0);

        // Nor once the host says, unless the server can move.
        manager.canServerMove = () => false;
        backend.emitBuffering(false);
        backend.emitBuffering(true);
        async.elapse(const Duration(seconds: 30));
        expect(stalls, 0);
      });
    });

    test('a player that watches its own requests isn\'t asked for by '
        'buffering', () {
      final resolver = _Resolver();
      final backend = _RebaseBackend();
      _withPlayback(resolver, player: backend, (async, manager, _, service) {
        manager.canServerMove = () => true;
        var stalls = 0;
        manager.serverStalledStream.listen((_) => stalls++);
        backend.emitBuffering(true);
        async.elapse(const Duration(seconds: 30));
        expect(stalls, 0);
        backend.stalls.add(null);
        async.flushMicrotasks();
        expect(stalls, 1);
      });
    });

    test('a stalled request on a server that can\'t move asks nothing', () {
      final resolver = _Resolver();
      final backend = _RebaseBackend();
      _withPlayback(resolver, player: backend, (async, manager, _, service) {
        var stalls = 0;
        manager.serverStalledStream.listen((_) => stalls++);
        backend.stalls.add(null);
        async.flushMicrotasks();
        expect(stalls, 0);

        manager.canServerMove = () => false;
        backend.stalls.add(null);
        async.flushMicrotasks();
        expect(stalls, 0);

        manager.canServerMove = () => true;
        backend.stalls.add(null);
        async.flushMicrotasks();
        expect(stalls, 1);
      });
    });
  });
}
