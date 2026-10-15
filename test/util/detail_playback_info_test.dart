import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/util/detail_playback_info.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

const _placeholderId = '3';
const _probedId = '12:1:0:3507857533895181475';

Map<String, dynamic> _placeholder() => <String, dynamic>{
      'Id': _placeholderId,
      'SupportsDirectPlay': false,
      'SupportsDirectStream': false,
      'SupportsTranscoding': true,
      'MediaStreams': <Map<String, dynamic>>[],
    };

Map<String, dynamic> _probed() => <String, dynamic>{
      'Id': _probedId,
      'SupportsDirectPlay': true,
      'SupportsDirectStream': true,
      'SupportsTranscoding': true,
      'MediaStreams': <Map<String, dynamic>>[
        <String, dynamic>{'Type': 'Video', 'Codec': 'h264', 'Index': 0},
      ],
    };

/// Answers the way Emby does for a channel item: the placeholder alone when
/// it is asked for by id, the probed source ahead of it otherwise.
class _ChannelPlaybackApi extends Fake implements PlaybackApi {
  _ChannelPlaybackApi({this.probes = true});

  final bool probes;
  final List<String?> requestedSourceIds = [];

  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  }) async {
    final sourceId = requestBody?['MediaSourceId'] as String?;
    requestedSourceIds.add(sourceId);
    return <String, dynamic>{
      'PlaySessionId': 'ps1',
      'MediaSources': <Map<String, dynamic>>[
        if (sourceId == null && probes) _probed(),
        if (sourceId == null || sourceId == _placeholderId) _placeholder(),
        if (sourceId == _probedId) _probed(),
      ],
    };
  }
}

class _FakeClient extends Fake implements MediaServerClient {
  _FakeClient(this.playbackApi);

  @override
  final PlaybackApi playbackApi;
  @override
  String? get userId => 'u1';
}

class _FakePlaybackManager extends Fake implements PlaybackManager {
  @override
  PlayerBackend? get backend => null;
}

void main() {
  late _ChannelPlaybackApi api;

  void register({bool probes = true}) {
    api = _ChannelPlaybackApi(probes: probes);
    GetIt.instance.registerSingleton<MediaServerClient>(_FakeClient(api));
    GetIt.instance.registerSingleton<PlaybackManager>(_FakePlaybackManager());
  }

  setUp(() => GetIt.instance.reset());
  tearDown(() => GetIt.instance.reset());

  Future<PlaybackInfoResult> fetch(
    String? mediaSourceId, {
    bool hasOtherVersions = false,
  }) =>
      fetchDetailPlaybackInfo(
        itemId: '620157',
        mediaSourceId: mediaSourceId,
        audioStreamIndex: null,
        subtitleStreamIndex: null,
        hasOtherVersions: hasOtherVersions,
      );

  test('keeps the picked version when the item has other versions', () async {
    register();

    final result = await fetch(_placeholderId, hasOtherVersions: true);

    expect(api.requestedSourceIds, [_placeholderId]);
    expect(result.mediaSources.map((s) => s.id), [_placeholderId]);
  });

  test('reports on the probed source when the id names a placeholder',
      () async {
    register();

    final result = await fetch(_placeholderId);

    expect(api.requestedSourceIds, [_placeholderId, null]);
    expect(result.mediaSources.map((s) => s.id), [_probedId]);
    expect(result.mediaSources.single.supportsDirectPlay, isTrue);
  });

  test('keeps the placeholder when the server has nothing better', () async {
    register(probes: false);

    final result = await fetch(_placeholderId);

    expect(result.mediaSources.map((s) => s.id), [_placeholderId]);
  });

  test('asks once for a source that lists its streams', () async {
    register();

    final result = await fetch(_probedId);

    expect(api.requestedSourceIds, [_probedId]);
    expect(result.mediaSources.map((s) => s.id), [_probedId]);
  });

  test('asks once when no source is picked', () async {
    register();

    final result = await fetch(null);

    expect(api.requestedSourceIds, [null]);
    expect(result.mediaSources.map((s) => s.id), [_probedId, _placeholderId]);
  });
}
