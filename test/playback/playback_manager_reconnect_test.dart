import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

/// A backend whose errors the test emits, and which records the credentials
/// it is handed.
class _TestBackend extends Fake implements PlayerBackend {
  final positions = StreamController<Duration>.broadcast(sync: true);
  final errors = StreamController<Map<String, dynamic>>.broadcast(sync: true);
  final playingChanges = StreamController<bool>.broadcast(sync: true);
  final List<Duration> playStarts = <Duration>[];
  final List<Duration> seeks = <Duration>[];
  final List<StreamCredentials> credentialUpdates = <StreamCredentials>[];

  /// Emitted while the next stream opens, before it is ready.
  Map<String, dynamic>? errorWhileOpening;

  /// Whether the engine can change an open stream's credentials.
  bool takesCredentialsLive = true;
  bool playing = false;
  Duration currentPosition = Duration.zero;

  /// Reports the player actually playing, or not, as an engine does.
  void emitPlaying(bool value) {
    playing = value;
    playingChanges.add(value);
  }

  void emitPosition(Duration position) {
    currentPosition = position;
    positions.add(position);
  }

  @override
  Future<bool> updateStreamCredentials(StreamCredentials credentials) async {
    credentialUpdates.add(credentials);
    return takesCredentialsLive;
  }

  @override
  Duration get position => currentPosition;

  @override
  Duration get duration => const Duration(hours: 2);

  @override
  Duration get buffer => Duration.zero;

  @override
  bool get isPlaying => playing;

  @override
  bool get playWhenReady => playing;

  @override
  double get playbackSpeed => 1.0;

  @override
  bool get isBuffering => false;

  @override
  Stream<Duration> get positionStream => positions.stream;

  @override
  Stream<Duration> get durationStream => const Stream<Duration>.empty();

  @override
  Stream<Duration> get bufferStream => const Stream<Duration>.empty();

  @override
  Stream<bool> get playingStream => playingChanges.stream;

  @override
  Stream<bool> get bufferingStream => const Stream<bool>.empty();

  @override
  Stream<bool> get completedStream => const Stream<bool>.empty();

  @override
  Stream<Map<String, dynamic>>? get errorStream => errors.stream;

  @override
  bool get supportsRuntimeTrackSelection => false;

  @override
  bool get supportsDirectPlayAudioSwitch => false;

  @override
  bool get canRenderBitmapSubtitles => false;

  @override
  bool get requiresStartupMediaReadyCheck => false;

  @override
  bool get nativelyHandlesStartPosition => true;

  @override
  Map<String, dynamic> getDeviceProfile({
    bool useProgressiveTranscode = false,
  }) => <String, dynamic>{};

  @override
  Future<void> play(
    dynamic mediaItem, {
    Duration startPosition = Duration.zero,
  }) async {
    playStarts.add(startPosition);
    currentPosition = startPosition;
    playing = true;
    final error = errorWhileOpening;
    errorWhileOpening = null;
    if (error != null) errors.add(error);
  }

  @override
  Future<void> seekTo(Duration position) async {
    seeks.add(position);
    currentPosition = position;
  }

  @override
  Future<void> pause() async => playing = false;

  @override
  Future<void> resume() async => playing = true;

  @override
  Future<void> stop() async => playing = false;

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}

  @override
  Future<void> waitForTracksReady() async {}

  @override
  void dispose() {}
}

/// Resolves and replans streams that authenticate with [token], in their
/// headers and their URL.
class _Resolver extends MediaStreamResolver implements StreamReplanner {
  String token = 't1';

  /// The stream's container: `hls` for a playlist, else a file.
  String container = 'hls';

  /// Whether the server is unreachable: every replan and resolve throws.
  bool unreachable = false;

  /// Holds the next replan until completed, to keep an attempt in flight.
  Completer<void>? replanGate;
  int resolves = 0;
  final List<ReplanRequest> requests = <ReplanRequest>[];

  StreamResolutionResult _stream(String session, int plan) =>
      StreamResolutionResult(
        streamUrl: 'https://example.test/$session/plan-$plan?token=$token',
        mediaSourceId: 'source',
        playSessionId: session,
        playMethod: StreamPlayMethod.directStream,
        container: container,
        requestHeaders: {'Authorization': 'Bearer $token'},
      );

  @override
  Future<StreamResolutionResult> resolve(
    dynamic mediaItem, {
    Map<String, dynamic>? deviceProfile,
    int? maxStreamingBitrate,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? startTimeTicks,
    String? mediaSourceId,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
  }) async {
    if (unreachable) throw StateError('server unreachable');
    resolves++;
    return _stream('session-$resolves', 1);
  }

  @override
  bool canReplan(StreamResolutionResult current) => true;

  @override
  Future<StreamResolutionResult> replan(
    dynamic mediaItem,
    StreamResolutionResult current,
    ReplanRequest request,
  ) async {
    requests.add(request);
    final gate = replanGate;
    replanGate = null;
    if (gate != null) await gate.future;
    if (unreachable) throw StateError('server unreachable');
    return _stream(current.playSessionId!, requests.length + 1);
  }
}

/// A [_Resolver] whose streams' credentials expire (Silo's).
class _ExpiringResolver extends _Resolver implements StreamCredentialRefresher {
  final List<bool> refreshes = <bool>[];

  /// The token a forced renewal gets.
  String? renewedToken;

  @override
  Future<StreamCredentials?> currentCredentials(
    StreamResolutionResult current, {
    bool refresh = false,
  }) async {
    refreshes.add(refresh);
    if (refresh && renewedToken != null) token = renewedToken!;
    return StreamCredentials(
      streamUrl: current.streamUrl.replaceFirst(
        RegExp(r'token=[^&]*'),
        'token=$token',
      ),
      requestHeaders: {'Authorization': 'Bearer $token'},
    );
  }
}

class _TestService extends Fake implements PlayerService {
  final List<String?> stops = <String?>[];

  @override
  Future<void> onPlaybackStart(
    dynamic mediaItem,
    StreamResolutionResult resolution, {
    int? positionTicks,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {}

  @override
  Future<void> onPlaybackProgress(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool isPaused = false,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? volumeLevel,
    bool? isMuted,
  }) async {}

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) async => stops.add(resolution.playSessionId);

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {}

  @override
  void dispose() {}
}

const _movie = <String, dynamic>{'Id': 'movie', 'Type': 'Movie'};
const _channel = <String, dynamic>{'Id': 'channel', 'Type': 'TvChannel'};

/// Runs [body] in fake time against a manager playing [item] 20 minutes in.
void _withPlayback(
  _Resolver resolver,
  void Function(
    FakeAsync async,
    PlaybackManager manager,
    _TestBackend backend,
    _TestService service,
  )
  body, {
  Map<String, dynamic> item = _movie,
}) {
  fakeAsync((async) {
    final backend = _TestBackend();
    final service = _TestService();
    final clock = async.getClock(DateTime(2026, 10, 30, 20));
    final manager = PlaybackManager()
      ..setBackend(backend)
      ..setResolver(resolver)
      ..setPlayerService(service)
      ..clock = clock.now;
    unawaited(manager.playItems(<dynamic>[item]));
    async.flushMicrotasks();
    backend.emitPosition(const Duration(minutes: 20));
    try {
      body(async, manager, backend, service);
    } finally {
      manager.dispose();
      async.flushTimers();
    }
  });
}

void main() {
  group('renewed credentials', () {
    test('reach a player that takes them live, without a reopen', () {
      final resolver = _ExpiringResolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        async.elapse(const Duration(seconds: 5));
        expect(backend.credentialUpdates, isEmpty);

        resolver.token = 't2';
        async.elapse(const Duration(seconds: 5));

        expect(
          backend.credentialUpdates.single.requestHeaders['Authorization'],
          'Bearer t2',
        );
        expect(
          backend.credentialUpdates.single.streamUrl,
          'https://example.test/session-1/plan-1?token=t2',
        );
        expect(resolver.requests, isEmpty);
        expect(backend.playStarts, hasLength(1));

        // Handed over once, not on every tick after.
        async.elapse(const Duration(seconds: 15));
        expect(backend.credentialUpdates, hasLength(1));
      });
    });

    test('reopen an HLS stream at its position on a player that can\'t take '
        'them, in the same session', () {
      final resolver = _ExpiringResolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        backend.takesCredentialsLive = false;
        resolver.token = 't2';
        async.elapse(const Duration(seconds: 5));

        final request = resolver.requests.single;
        expect(request.reason, ReplanReason.trackChange);
        expect(request.position, const Duration(minutes: 20));
        expect(service.stops, isEmpty);
        expect(backend.playStarts.last, const Duration(minutes: 20));
        expect(manager.currentResolution?.streamUrl, contains('token=t2'));
      });
    });

    test('wait for the next seek on a file, which reopens it there', () {
      final resolver = _ExpiringResolver()..container = 'mp4';
      _withPlayback(resolver, (async, manager, backend, service) {
        backend.takesCredentialsLive = false;
        resolver.token = 't2';
        async.elapse(const Duration(seconds: 5));
        expect(resolver.requests, isEmpty);

        unawaited(manager.seekTo(const Duration(minutes: 45)));
        async.flushMicrotasks();

        expect(backend.seeks, isEmpty);
        expect(resolver.requests.single.position, const Duration(minutes: 45));
        expect(backend.playStarts.last, const Duration(minutes: 45));

        // The reopened stream carries current ones: seeks are seeks again.
        unawaited(manager.seekTo(const Duration(minutes: 50)));
        async.flushMicrotasks();
        expect(backend.seeks, [const Duration(minutes: 50)]);
      });
    });

    test('keep a seek made while the reopen is opening', () {
      final resolver = _ExpiringResolver()..container = 'mp4';
      _withPlayback(resolver, (async, manager, backend, service) {
        backend.takesCredentialsLive = false;
        resolver.token = 't2';
        async.elapse(const Duration(seconds: 5));

        unawaited(manager.seekTo(const Duration(minutes: 45)));
        unawaited(manager.seekTo(const Duration(minutes: 50)));
        async.flushMicrotasks();

        expect(resolver.requests.single.position, const Duration(minutes: 45));
        expect(backend.seeks, [const Duration(minutes: 50)]);
      });
    });

    test('are renewed at once when the server refuses them', () {
      final resolver = _ExpiringResolver()..renewedToken = 't9';
      _withPlayback(resolver, (async, manager, backend, service) {
        backend.errors.add({'event': 'credentialsRefused', 'status': 401});
        async.flushMicrotasks();

        expect(resolver.refreshes.last, isTrue);
        expect(
          backend.credentialUpdates.single.requestHeaders['Authorization'],
          'Bearer t9',
        );
        expect(manager.isReconnecting, isFalse);
      });
    });
  });

  group('a lost connection', () {
    test('reconnects at the position as an unchanged track change', () {
      final resolver = _Resolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        final states = <bool>[];
        manager.reconnectingStream.listen(states.add);
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        backend.errors.add({'event': 'error', 'error': 'Playback error'});
        async.flushMicrotasks();
        expect(manager.isReconnecting, isTrue);
        expect(resolver.requests, isEmpty);

        async.elapse(const Duration(seconds: 1));

        final request = resolver.requests.single;
        expect(request.reason, ReplanReason.trackChange);
        expect(request.position, const Duration(minutes: 20));
        expect(service.stops, isEmpty);
        expect(manager.isReconnecting, isFalse);
        expect(states, [true, false]);
        expect(manager.bringupState.phase, PlaybackBringupPhase.ready);
      });
    });

    test('backs off, then gives the stream up once the budget is spent', () {
      final resolver = _Resolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        resolver.unreachable = true;
        backend.errors.add({
          'event': 'playerError',
          'kind': 'source_refused',
          'recoverable': true,
        });
        async.flushMicrotasks();

        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(1));
        async.elapse(const Duration(seconds: 2));
        expect(resolver.requests, hasLength(2));
        async.elapse(const Duration(seconds: 4));
        expect(resolver.requests, hasLength(3));
        expect(manager.isReconnecting, isTrue);
        expect(
          manager.bringupState.phase,
          isNot(PlaybackBringupPhase.failed),
        );

        async.elapse(const Duration(minutes: 3));
        expect(manager.isReconnecting, isFalse);
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
        expect(manager.bringupState.error, streamStarvedError);
        final attempts = resolver.requests.length;
        async.elapse(const Duration(minutes: 1));
        expect(resolver.requests, hasLength(attempts));
      });
    });

    test('stops reconnecting when the viewer stops', () {
      final resolver = _Resolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.flushMicrotasks();
        unawaited(manager.stop());
        async.flushMicrotasks();

        async.elapse(const Duration(seconds: 30));
        expect(resolver.requests, isEmpty);
        expect(manager.isReconnecting, isFalse);
      });
    });

    test('ends when the queue moves on, so the next item\'s errors are '
        'its own', () {
      final resolver = _Resolver();
      fakeAsync((async) {
        final backend = _TestBackend();
        final manager = PlaybackManager()
          ..setBackend(backend)
          ..setResolver(resolver)
          ..setPlayerService(_TestService())
          ..clock = async.getClock(DateTime(2026, 10, 31, 20)).now;
        unawaited(
          manager.playItems(<dynamic>[
            _movie,
            const <String, dynamic>{'Id': 'movie-2', 'Type': 'Movie'},
          ]),
        );
        async.flushMicrotasks();
        backend.emitPosition(const Duration(minutes: 20));

        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.flushMicrotasks();
        expect(manager.isReconnecting, isTrue);

        // The next item fails while it opens: its own startup recovery
        // (a transcode) must run, not be taken for the first item's
        // reconnect.
        backend.errorWhileOpening = {
          'event': 'playerError',
          'kind': 'unsupported_container',
          'recoverable': true,
        };
        unawaited(manager.next());
        async.flushMicrotasks();

        expect(manager.isReconnecting, isFalse);
        expect(resolver.requests.single.reason, ReplanReason.failure);
        expect(resolver.requests.single.enableDirectStream, isFalse);

        // The first item's pending retry reopens nothing.
        async.elapse(const Duration(seconds: 30));
        expect(resolver.requests, hasLength(1));
        manager.dispose();
        async.flushTimers();
      });
    });

    test('gives the next item its own reconnect while the old one is still '
        'reopening', () {
      final resolver = _Resolver();
      fakeAsync((async) {
        final backend = _TestBackend();
        final manager = PlaybackManager()
          ..setBackend(backend)
          ..setResolver(resolver)
          ..setPlayerService(_TestService())
          ..clock = async.getClock(DateTime(2026, 10, 31, 20)).now;
        unawaited(
          manager.playItems(<dynamic>[
            _movie,
            const <String, dynamic>{'Id': 'movie-2', 'Type': 'Movie'},
          ]),
        );
        async.flushMicrotasks();
        backend.emitPosition(const Duration(minutes: 20));

        // The first item's retry starts and is held mid-replan.
        final gate = Completer<void>();
        resolver.replanGate = gate;
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(1));

        // The viewer moves on while it is still reopening, and it finishes
        // stale.
        unawaited(manager.next());
        async.flushMicrotasks();
        async.elapse(const Duration(seconds: 5));
        gate.complete();
        async.flushMicrotasks();

        // The next item loses its connection. Its reconnect starts from the
        // first attempt, a second after, not from where the first item's
        // left off.
        backend.emitPosition(const Duration(minutes: 1));
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.flushMicrotasks();
        expect(manager.isReconnecting, isTrue);
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(2));
        expect(resolver.requests.last.position, const Duration(minutes: 1));
        expect(manager.isReconnecting, isFalse);
        manager.dispose();
        async.flushTimers();
      });
    });

    test('a paused stream doesn\'t earn the budget back', () {
      final resolver = _Resolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        unawaited(manager.pause());
        async.flushMicrotasks();
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(1));
        expect(manager.isReconnecting, isFalse);

        // Half a minute reopened but never played: the next failure carries
        // on from the second attempt, two seconds out, not from the first.
        async.elapse(const Duration(seconds: 31));
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(1));
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(2));
      });
    });

    test('a stream that keeps playing earns the budget back', () {
      final resolver = _Resolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(1));

        backend.emitPlaying(true);
        async.elapse(const Duration(seconds: 31));

        // Proven: the next failure starts again from the first attempt.
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(2));
      });
    });

    test('playback broken by a stall doesn\'t earn the budget back', () {
      final resolver = _Resolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(1));

        // Two seconds of play, a long stall, then play again just before
        // the 30 s would be up: three seconds played in all.
        backend.emitPlaying(true);
        async.elapse(const Duration(seconds: 2));
        backend.emitPlaying(false);
        async.elapse(const Duration(seconds: 26));
        backend.emitPlaying(true);
        async.elapse(const Duration(seconds: 3));

        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(1));
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(2));
      });
    });

    test('the next item\'s failure shows while the old reconnect is still '
        'reopening', () {
      final resolver = _Resolver();
      fakeAsync((async) {
        final backend = _TestBackend();
        final manager = PlaybackManager()
          ..setBackend(backend)
          ..setResolver(resolver)
          ..setPlayerService(_TestService())
          ..clock = async.getClock(DateTime(2026, 10, 31, 20)).now;
        unawaited(
          manager.playItems(<dynamic>[
            _movie,
            const <String, dynamic>{'Id': 'movie-2', 'Type': 'Movie'},
          ]),
        );
        async.flushMicrotasks();
        backend.emitPosition(const Duration(minutes: 20));

        final gate = Completer<void>();
        resolver.replanGate = gate;
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests, hasLength(1));

        // The next item can't be resolved while the old attempt still holds.
        resolver.unreachable = true;
        unawaited(manager.next().catchError((Object _) {}));
        async.flushMicrotasks();
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);

        gate.complete();
        async.flushMicrotasks();
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
        manager.dispose();
        async.flushTimers();
      });
    });

    test('a reopen the app stops for the background while checking the item '
        'stays stopped', () {
      final resolver = _Resolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        Completer<bool>? lookup;
        manager.setContentRefusal(
          playRefusal: (_) => (lookup = Completer<bool>()).future,
        );
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.elapse(const Duration(seconds: 1));
        expect(lookup, isNotNull, reason: 'the reopen is checking the item');

        unawaited(manager.stopForBackground(manager.queueService.currentItem));
        async.flushMicrotasks();
        lookup!.complete(false);
        async.elapse(const Duration(seconds: 30));

        expect(resolver.requests, isEmpty);
        expect(backend.playStarts, hasLength(1));
      });
    });

    test('ends when the app stops playback for the background', () {
      final resolver = _Resolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.flushMicrotasks();
        expect(manager.isReconnecting, isTrue);

        unawaited(manager.stopForBackground(manager.queueService.currentItem));
        async.flushMicrotasks();
        async.elapse(const Duration(seconds: 30));

        expect(manager.isReconnecting, isFalse);
        expect(resolver.requests, isEmpty);
        expect(resolver.resolves, 1);
      });
    });

    test('leaves a live channel to its own recovery', () {
      final resolver = _Resolver();
      _withPlayback(item: _channel, resolver, (
        async,
        manager,
        backend,
        service,
      ) {
        backend.errors.add({
          'event': 'playerError',
          'kind': 'network',
          'recoverable': true,
        });
        async.flushMicrotasks();
        expect(manager.isReconnecting, isFalse);
      });
    });
  });

  group('a plain player error', () {
    test('reconnects a stream whose credentials expire', () {
      final resolver = _ExpiringResolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        backend.errors.add({'event': 'error', 'message': 'HTTP 401'});
        async.flushMicrotasks();
        expect(manager.isReconnecting, isTrue);
        async.elapse(const Duration(seconds: 1));
        expect(resolver.requests.single.reason, ReplanReason.trackChange);
      });
    });

    test('after a fault the player named is not a lost connection', () {
      final resolver = _ExpiringResolver()..container = 'mp4';
      _withPlayback(resolver, (async, manager, backend, service) {
        backend.errors.add({
          'event': 'playerError',
          'kind': 'unsupported_video',
          'recoverable': false,
        });
        backend.errors.add({'event': 'error', 'error': 'Playback error'});
        async.flushMicrotasks();
        expect(manager.isReconnecting, isFalse);
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
      });
    });

    test('still fails a stream whose credentials never expire', () {
      final resolver = _Resolver();
      _withPlayback(resolver, (async, manager, backend, service) {
        backend.errors.add({'event': 'error', 'message': 'decoder died'});
        async.flushMicrotasks();
        expect(manager.isReconnecting, isFalse);
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
        expect(resolver.requests, isEmpty);
      });
    });
  });
}
