import 'package:audio_service/audio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/playback/audio_handler.dart';
import 'package:moonfin/playback/last_playback_session_store.dart';
import 'package:moonfin/playback/media_browse_service.dart';
import 'package:playback_core/playback_core.dart';

// Android Auto shows a non-playable item as a folder, so a sign-in or server
// message used to open onto itself forever. At the root the message now stays
// a folder, so its title heads the car screen, and opens onto one playable
// copy of itself. Anywhere else it's a playable row. The root also sets the
// error state for hosts that show it.

const _signInTitle = 'Sign in to Moonfin on your phone';
const _offlineTitle = "Can't reach your server";

class _FakeBrowse implements MediaBrowseService {
  List<MediaItem> children = const [];

  @override
  Future<PlayRequest?> resolvePlayRequest(String mediaId) async =>
      const PlayRequest(items: []);

  @override
  Future<List<MediaItem>> getChildren(
    String parentMediaId, [
    Map<String, dynamic>? options,
  ]) async => children;

  @override
  MediaItem messageItem(String mediaId) => mediaId ==
          MediaBrowseService.offlineMessageId
      ? const MediaItem(
          id: MediaBrowseService.offlineMessageId,
          title: _offlineTitle,
          playable: false,
        )
      : const MediaItem(
          id: MediaBrowseService.signInMessageId,
          title: _signInTitle,
          playable: false,
        );

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

class _FailingManager extends PlaybackManager {
  _FailingManager(this.error);

  final Object error;

  @override
  Future<void> playItems(
    List<dynamic> items, {
    int startIndex = 0,
    Duration startPosition = Duration.zero,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    String? mediaSourceId,
    bool audioSelectionExplicit = false,
    bool subtitleSelectionExplicit = false,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
    bool autoPlay = true,
  }) async =>
      throw error;
}

class _FakeClientFactory implements MediaServerClientFactory {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

class _FakeSessionStore implements LastPlaybackSessionStore {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

void main() {
  late _FakeBrowse browse;
  late PlaybackManager manager;
  late MoonfinAudioHandler handler;

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    browse = _FakeBrowse();
    manager = PlaybackManager();
    handler = MoonfinAudioHandler(
      manager,
      _FakeClientFactory(),
      browse,
      _FakeSessionStore(),
    );
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  PlaybackState state() => handler.playbackState.value;

  test('a sign-in message at the root is the car error screen', () async {
    browse.children = [browse.messageItem(MediaBrowseService.signInMessageId)];

    final items = await handler.getChildren(AudioService.browsableRootId);

    expect(items.single.id, MediaBrowseService.signInMessageId);
    expect(items.single.playable, isFalse);
    expect(state().processingState, AudioProcessingState.error);
    expect(state().errorCode, 3);
    expect(state().errorMessage, _signInTitle);
  });

  test('a server message at the root is an app error', () async {
    browse.children = [browse.messageItem(MediaBrowseService.offlineMessageId)];

    await handler.getChildren(AudioService.browsableRootId);

    expect(state().processingState, AudioProcessingState.error);
    expect(state().errorCode, 1);
    expect(state().errorMessage, _offlineTitle);
  });

  test('opening the root message shows it once, never itself again', () async {
    final items =
        await handler.getChildren(MediaBrowseService.signInMessageId);

    expect(items.single.id, MediaBrowseService.signInMessageId);
    expect(items.single.title, _signInTitle);
    expect(items.single.playable, isTrue);
  });

  test('a message deeper down is playable and leaves the state alone', () async {
    browse.children = [browse.messageItem(MediaBrowseService.offlineMessageId)];

    final items = await handler.getChildren('tab|music');

    expect(items.single.playable, isTrue);
    expect(state().processingState, isNot(AudioProcessingState.error));
  });

  test('the next real root clears the error', () async {
    browse.children = [browse.messageItem(MediaBrowseService.signInMessageId)];
    await handler.getChildren(AudioService.browsableRootId);
    expect(state().processingState, AudioProcessingState.error);

    browse.children = const [
      MediaItem(id: 'tab|home', title: 'Home', playable: false),
      MediaItem(id: 'tab|music', title: 'Music', playable: false),
    ];
    final items = await handler.getChildren(AudioService.browsableRootId);

    expect(items, hasLength(2));
    expect(items.every((i) => i.playable == false), isTrue);
    expect(state().processingState, AudioProcessingState.idle);
    expect(state().errorMessage, isNull);
  });

  test("a message never covers something that's loaded", () async {
    manager.queueService.setQueue(['/downloads/song.mp3']);
    await pumpEventQueue();
    browse.children = [browse.messageItem(MediaBrowseService.signInMessageId)];

    await handler.getChildren(AudioService.browsableRootId);

    expect(state().processingState, isNot(AudioProcessingState.error));
  });

  test('tapping a message shows it as the error', () async {
    await handler.playFromMediaId(MediaBrowseService.offlineMessageId);

    expect(state().processingState, AudioProcessingState.error);
    expect(state().errorCode, 1);
    expect(state().errorMessage, _offlineTitle);
  });

  test('tapping a message with something loaded keeps its controls', () async {
    manager.queueService.setQueue(['/downloads/song.mp3']);
    await pumpEventQueue();
    final before = state();

    await handler.playFromMediaId(MediaBrowseService.signInMessageId);

    expect(state().processingState, before.processingState);
    expect(state().controls, before.controls);
    expect(state().errorCode, 3);
    expect(state().errorMessage, _signInTitle);
  });

  test('the next state push drops a tapped message', () async {
    manager.queueService.setQueue(['/downloads/song.mp3']);
    await pumpEventQueue();
    await handler.playFromMediaId(MediaBrowseService.signInMessageId);

    manager.toggleRepeat();
    await pumpEventQueue();

    expect(state().errorCode, isNull);
    expect(state().errorMessage, isNull);
  });

  group('a play that fails', () {
    Future<String?> messageFor(Object error) async {
      final failing = MoonfinAudioHandler(
        _FailingManager(error),
        _FakeClientFactory(),
        browse,
        _FakeSessionStore(),
      );
      await failing.playFromMediaId('track|srv|1|album|2');
      return failing.playbackState.value.errorMessage;
    }

    final request = RequestOptions(path: '/Items');

    test('with no answer blames the server', () async {
      expect(
        await messageFor(DioException.connectionError(
          requestOptions: request,
          reason: 'refused',
        )),
        _offlineTitle,
      );
    });

    test("with an answer from the server doesn't blame it", () async {
      expect(
        await messageFor(DioException.badResponse(
          statusCode: 500,
          requestOptions: request,
          response: Response(requestOptions: request, statusCode: 500),
        )),
        isNot(_offlineTitle),
      );
    });

    test("for any other reason doesn't blame the server", () async {
      expect(await messageFor(StateError('no resolver')), isNot(_offlineTitle));
    });
  });
}
