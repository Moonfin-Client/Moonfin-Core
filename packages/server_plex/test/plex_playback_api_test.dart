import 'package:dio/dio.dart';
import 'package:server_plex/src/api/plex_playback_api.dart';
import 'package:test/test.dart';

class _FakeServer extends Interceptor {
  _FakeServer(this.answer);

  final Object? Function(RequestOptions options) answer;
  final requests = <RequestOptions>[];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    requests.add(options);
    handler.resolve(Response(requestOptions: options, data: answer(options)));
  }
}

const _item = {
  'ratingKey': '1715',
  'type': 'movie',
  'title': '10 Cloverfield Lane',
  'duration': 6213916,
  'Media': [
    {
      'id': 3720,
      'container': 'mkv',
      'Part': [
        {
          'id': 3720,
          'key': '/library/parts/3720/1786486459/file.mkv',
          'Stream': [
            {'id': 8880, 'streamType': 1, 'index': 0, 'codec': 'h264'},
            {'id': 8881, 'streamType': 2, 'index': 1, 'selected': true},
            {'id': 8882, 'streamType': 3, 'index': 2, 'codec': 'srt'},
            {'id': 8883, 'streamType': 3, 'index': 3, 'codec': 'none'},
            {
              'id': 9001,
              'streamType': 3,
              'codec': 'srt',
              'key': '/library/streams/9001',
            },
          ],
        },
      ],
    },
  ],
};

(PlexPlaybackApi, _FakeServer) _api(String decision, {String type = 'movie'}) {
  final server = _FakeServer(
    (options) => switch (options.uri.path) {
      '/library/metadata/1715' => {
        'MediaContainer': {
          'Metadata': [
            {..._item, 'type': type},
          ],
        },
      },
      final path when path.endsWith('/transcode/universal/decision') => {
        'MediaContainer': {
          'generalDecisionText':
              'Neither direct play nor conversion is available.',
          'directPlayDecisionText':
              options.uri.queryParameters.containsKey('session')
              ? 'Direct play is disabled.'
              : 'No direct play video profile exists.',
          'Metadata': [
            {
              'Media': [
                {
                  'Part': [
                    {'decision': decision},
                  ],
                },
              ],
            },
          ],
        },
      },
      _ => null,
    },
  );
  final dio = Dio()..interceptors.add(server);
  return (
    PlexPlaybackApi(dio, const {'X-Plex-Client-Identifier': 'device'}),
    server,
  );
}

RequestOptions _request(_FakeServer server, String path) =>
    server.requests.lastWhere((r) => r.uri.path == path);

void main() {
  test('the app profile turns into Plex names, with codecs filled in', () {
    final profile = plexClientProfile({
      'DirectPlayProfiles': [
        {
          'Type': 'Video',
          'Container': 'mkv,ts,m4v',
          'VideoCodec': 'h264,mpeg',
          'AudioCodec': 'aac,dts',
        },
        {'Type': 'Video', 'Container': 'webm'},
        {'Type': 'Audio', 'Container': 'm4a,flac', 'AudioCodec': 'alac,flac'},
      ],
      'TranscodingProfiles': [
        {
          'Type': 'Video',
          'Container': 'mp4',
          'Protocol': 'hls',
          'VideoCodec': 'hevc',
        },
        {
          'Type': 'Video',
          'Container': 'ts',
          'Protocol': 'hls',
          'VideoCodec': 'h264',
          'AudioCodec': 'aac,ac3',
        },
        {
          'Type': 'Audio',
          'Container': 'ts',
          'Protocol': 'hls',
          'AudioCodec': 'mp3',
        },
      ],
      'CodecProfiles': [
        {
          'Type': 'Video',
          'Codec': 'hevc',
          'Conditions': [
            {
              'Condition': 'LessThanEqual',
              'Property': 'Width',
              'Value': '1920',
              'IsRequired': true,
            },
            {
              'Condition': 'EqualsAny',
              'Property': 'VideoProfile',
              'Value': 'main',
              'IsRequired': false,
            },
            {
              'Condition': 'NotEquals',
              'Property': 'VideoProfile',
              'Value': 'none',
            },
          ],
        },
        {
          'Type': 'Video',
          'Codec': 'vc1,mpeg',
          'Conditions': [
            {
              'Condition': 'Equals',
              'Property': 'VideoProfile',
              'Value': 'none',
            },
          ],
        },
        {
          'Type': 'Video',
          'Codec': 'h264',
          'Conditions': [
            {
              'Condition': 'LessThanEqual',
              'Property': 'VideoLevel',
              'Value': '41',
            },
          ],
          'ApplyConditions': [
            {
              'Condition': 'Equals',
              'Property': 'VideoProfile',
              'Value': 'high',
            },
          ],
        },
        {
          'Type': 'VideoAudio',
          'Codec': 'ac3',
          'Conditions': [
            {
              'Condition': 'LessThanEqual',
              'Property': 'AudioChannels',
              'Value': '6',
            },
          ],
        },
      ],
    });

    expect(profile.split('+'), [
      'add-settings(DirectPlayStreamSelection=true)',
      'add-direct-play-profile(type=videoProfile&container=mkv,mpegts,mp4'
          '&videoCodec=h264,mpeg1video&audioCodec=aac,dca)',
      'add-direct-play-profile(type=videoProfile&container=webm'
          '&videoCodec=h264,hevc,mpeg1video,mpeg2video,mpeg4,vc1,vp8,vp9,av1'
          '&audioCodec=aac,ac3,eac3,mp3,dca,truehd,flac,opus,vorbis,pcm)',
      'add-direct-play-profile(type=musicProfile&container=mp4,flac'
          '&audioCodec=alac,flac)',
      'add-limitation(scope=videoCodec&scopeName=hevc&type=upperBound'
          '&name=video.width&value=1920&isRequired=true)',
      'add-limitation(scope=videoCodec&scopeName=hevc&type=match'
          '&name=video.profile&list=main)',
      'add-limitation(scope=videoCodec&scopeName=vc1&type=match'
          '&name=video.profile&list=none)',
      'add-limitation(scope=videoCodec&scopeName=mpeg1video&type=match'
          '&name=video.profile&list=none)',
      'add-transcode-target(type=videoProfile&context=streaming&protocol=hls'
          '&container=mpegts&videoCodec=h264&audioCodec=aac,ac3)',
      'add-transcode-target(type=musicProfile&context=streaming&protocol=hls'
          '&container=mpegts&audioCodec=mp3)',
    ]);
  });

  test(
    'a direct play hands back the file part and keeps subtitles off',
    () async {
      final (api, server) = _api('directplay');

      final info = await api.getPlaybackInfo(
        '1715',
        requestBody: {'MaxStreamingBitrate': 120000000},
      );

      expect(server.requests.where((r) => r.method == 'PUT'), isEmpty);
      final decision = _request(
        server,
        '/video/:/transcode/universal/decision',
      );
      expect(decision.uri.queryParameters['maxVideoBitrate'], '120000');
      expect(decision.uri.queryParameters['directPlay'], '1');
      expect(decision.uri.queryParameters['subtitles'], 'none');
      expect(
        decision.uri.queryParameters['X-Plex-Client-Identifier'],
        'device',
      );
      expect(decision.uri.queryParameters.containsKey('session'), isFalse);
      expect(info['PlaySessionId'], matches(RegExp(r'^[0-9a-f]{32}$')));
      final source = (info['MediaSources'] as List).single as Map;
      expect(source['Id'], '1715-0');
      expect(source['Path'], '/library/parts/3720/1786486459/file.mkv');
      expect(source['SupportsDirectPlay'], isTrue);
      expect(source.containsKey('TranscodingUrl'), isFalse);
      expect(source['DefaultAudioStreamIndex'], 1);
      expect(source['DefaultSubtitleStreamIndex'], -1);
      final sidecar = (source['MediaStreams'] as List).last as Map;
      expect(sidecar['DeliveryUrl'], '/library/streams/9001');
    },
  );

  test(
    'an embedded subtitle on a transcode is selected and burned in',
    () async {
      final (api, server) = _api('transcode');

      final info = await api.getPlaybackInfo(
        '1715',
        requestBody: {
          'SubtitleStreamIndex': 2,
          'EnableDirectPlay': false,
          'EnableDirectStream': false,
        },
      );

      final put = _request(server, '/library/parts/3720');
      expect(put.method, 'PUT');
      expect(put.queryParameters, {'subtitleStreamID': 8882, 'allParts': 1});
      final decisions = server.requests
          .where((r) => r.uri.path == '/video/:/transcode/universal/decision')
          .toList();
      expect(decisions, hasLength(2));
      expect(decisions.first.uri.queryParameters['subtitles'], 'none');
      expect(decisions.first.uri.queryParameters['directPlay'], '0');
      expect(decisions.first.uri.queryParameters['directStream'], '0');
      expect(
        decisions.first.uri.queryParameters.containsKey('session'),
        isFalse,
      );
      final source = (info['MediaSources'] as List).single as Map;
      expect(source['SupportsDirectPlay'], isFalse);
      expect(source['TranscodeReasons'], [
        'No direct play video profile exists.',
      ]);
      final url = Uri.parse(source['TranscodingUrl'] as String);
      expect(url.path, '/video/:/transcode/universal/start.m3u8');
      expect(url.queryParameters['session'], info['PlaySessionId']);
      expect(url.queryParameters['subtitles'], 'burn');
      expect(decisions.last.uri.queryParameters, url.queryParameters);
      expect(source['DefaultSubtitleStreamIndex'], 2);
      final burned = (source['MediaStreams'] as List).firstWhere(
        (s) => s['Index'] == 2,
      );
      expect(burned['DeliveryMethod'], 'Encode');
    },
  );

  test('a space in the profile goes to Plex as %20, not +', () async {
    final (api, server) = _api('transcode');

    final info = await api.getPlaybackInfo(
      '1715',
      requestBody: {
        'DeviceProfile': {
          'CodecProfiles': [
            {
              'Type': 'Video',
              'Codec': 'h264',
              'Conditions': [
                {
                  'Condition': 'EqualsAny',
                  'Property': 'VideoProfile',
                  'Value': 'high|constrained baseline',
                },
              ],
            },
          ],
        },
      },
    );

    final source = (info['MediaSources'] as List).single as Map;
    for (final uri in [
      _request(server, '/video/:/transcode/universal/decision').uri,
      Uri.parse(source['TranscodingUrl'] as String),
    ]) {
      expect(uri.query, isNot(contains('+')));
      expect(
        uri.queryParameters['X-Plex-Client-Profile-Extra'],
        contains('list=high|constrained baseline)+'),
      );
    }
  });

  test('a codec none subtitle is never burned', () async {
    final (api, server) = _api('transcode');

    final info = await api.getPlaybackInfo(
      '1715',
      requestBody: {'SubtitleStreamIndex': 3, 'EnableDirectPlay': false},
    );

    final source = (info['MediaSources'] as List).single as Map;
    final url = Uri.parse(source['TranscodingUrl'] as String);
    expect(url.queryParameters['subtitles'], 'none');
    expect(
      _request(
        server,
        '/video/:/transcode/universal/decision',
      ).uri.queryParameters['subtitles'],
      'none',
    );
  });

  test('a track transcodes through the music transcoder', () async {
    final (api, server) = _api('transcode', type: 'track');

    final info = await api.getPlaybackInfo(
      '1715',
      requestBody: {'EnableDirectPlay': false},
    );

    final decision = _request(server, '/music/:/transcode/universal/decision');
    expect(decision.uri.queryParameters['directPlay'], '0');
    final source = (info['MediaSources'] as List).single as Map;
    expect(
      Uri.parse(source['TranscodingUrl'] as String).path,
      '/music/:/transcode/universal/start.m3u8',
    );
  });

  test('turning subtitles off clears the Plex selection', () async {
    final (api, server) = _api('directplay');

    final info = await api.getPlaybackInfo(
      '1715',
      requestBody: {'SubtitleStreamIndex': -1},
    );

    expect(_request(server, '/library/parts/3720').queryParameters, {
      'subtitleStreamID': 0,
      'allParts': 1,
    });
    final source = (info['MediaSources'] as List).single as Map;
    expect(source['DefaultSubtitleStreamIndex'], -1);
  });

  test('a decision with no way to play throws its reason', () async {
    final (api, _) = _api('');

    await expectLater(
      api.getPlaybackInfo('1715'),
      throwsA(
        isA<StateError>().having(
          (e) => e.message,
          'message',
          'Neither direct play nor conversion is available.',
        ),
      ),
    );
  });

  test('progress goes to the timeline in milliseconds', () async {
    final (api, server) = _api('directplay');

    await api.reportPlaybackProgress({
      'ItemId': '1715',
      'PositionTicks': 1200000000,
      'IsPaused': true,
      'RunTimeTicks': 62139160000,
      'PlaySessionId': 'abc',
    });

    expect(_request(server, '/:/timeline').queryParameters, {
      'ratingKey': '1715',
      'key': '/library/metadata/1715',
      'state': 'paused',
      'time': 120000,
      'duration': 6213916,
      'X-Plex-Session-Identifier': 'abc',
    });
  });

  test(
    'a later file of a split movie plays itself and reports into the whole',
    () async {
      final server = _FakeServer(
        (options) => switch (options.uri.path) {
          '/library/metadata/23070' => {
            'MediaContainer': {
              'Metadata': [
                {
                  'ratingKey': '23070',
                  'type': 'movie',
                  'duration': 180046,
                  'Media': [
                    {
                      'id': 31042,
                      'duration': 180046,
                      'Part': [
                        for (final id in [31042, 31043])
                          {
                            'id': id,
                            'duration': 90023,
                            'key': '/library/parts/$id/1/file.mkv',
                          },
                      ],
                    },
                  ],
                },
              ],
            },
          },
          final path when path.endsWith('/transcode/universal/decision') => {
            'MediaContainer': {
              'Metadata': [
                {
                  'Media': [
                    {
                      'Part': [
                        {'decision': 'directplay'},
                      ],
                    },
                  ],
                },
              ],
            },
          },
          _ => null,
        },
      );
      final api = PlexPlaybackApi(Dio()..interceptors.add(server), const {});

      final info = await api.getPlaybackInfo('part-23070-0-1');
      await api.reportPlaybackStopped({
        'ItemId': 'part-23070-0-1',
        'PositionTicks': 300000000,
        'RunTimeTicks': 900230000,
        'PlaySessionId': info['PlaySessionId'],
      });

      final source = (info['MediaSources'] as List).single as Map;
      expect(source['Path'], '/library/parts/31043/1/file.mkv');
      expect(source['RunTimeTicks'], 900230000);
      expect(
        _request(
          server,
          '/video/:/transcode/universal/decision',
        ).uri.queryParameters,
        allOf(
          containsPair('path', '/library/metadata/23070'),
          containsPair('partIndex', '1'),
        ),
      );
      expect(
        _request(server, '/:/timeline').queryParameters,
        allOf(
          containsPair('ratingKey', '23070'),
          containsPair('time', 120023),
          containsPair('duration', 180046),
        ),
      );
    },
  );

  test('a stop that runs past the end reports the end', () async {
    final (api, server) = _api('directplay');

    await api.reportPlaybackStopped({
      'ItemId': '5509',
      'PositionTicks': 303410000,
      'RunTimeTicks': 300000000,
      'PlaySessionId': 'abc',
    });

    expect(
      _request(server, '/:/timeline').queryParameters,
      allOf(containsPair('time', 30000), containsPair('duration', 30000)),
    );
  });

  test('progress saved offline is watched once it passes 90%', () async {
    final (api, server) = _api('directplay');

    await api.reportPlaybackStopped({
      'ItemId': '23071',
      'PositionTicks': 599580000,
      'RunTimeTicks': 600230000,
    });
    await api.reportPlaybackStopped({
      'ItemId': '786',
      'PositionTicks': 14998720000,
      'RunTimeTicks': 71337920000,
    });

    expect(
      _request(server, '/:/scrobble').queryParameters,
      containsPair('key', '23071'),
    );
    expect(
      _request(server, '/:/timeline').queryParameters,
      allOf(containsPair('ratingKey', '786'), containsPair('time', 1499872)),
    );
  });

  test('stopping a transcode ends its Plex session', () async {
    final (api, server) = _api('transcode');

    await api.stopActiveEncodings(deviceId: 'device', playSessionId: 'abc');

    expect(
      _request(server, '/video/:/transcode/universal/stop').queryParameters,
      {'session': 'abc'},
    );
  });
}
