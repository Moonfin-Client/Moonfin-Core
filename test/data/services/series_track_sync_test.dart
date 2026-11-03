import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/series_track_preference.dart';
import 'package:moonfin/data/services/series_track_sync.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

import '../../util/media_segment_fakes.dart';

const _series = 'series-imdb-tt1641384';

/// Silo with [audio] and [subtitle] preference rows for the series (null:
/// none) and no series settings.
class _Silo implements HttpClientAdapter {
  _Silo({this.audio, this.subtitle});

  Map<String, dynamic>? audio;
  Map<String, dynamic>? subtitle;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final Object? body = switch (options.uri.path) {
      '/api/v2/audio-prefs/$_series' => audio,
      '/api/v2/subtitle-prefs/$_series' => subtitle,
      '/api/v2/settings/values/effective' => {'items': <Object>[]},
      _ => null,
    };
    return ResponseBody.fromString(
      body == null ? '{"status":404}' : jsonEncode(body),
      body == null ? 404 : 200,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

SiloMediaServerClient _client(_Silo server) =>
    SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: const DeviceInfo(
          id: 'device-1',
          name: 'Test Mac',
          appName: 'Moonfin',
          appVersion: '1.9.0',
        ),
        httpClientAdapter: server,
      )
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access-1',
          refreshToken: 'refresh-1',
          expiresAt: DateTime.now().add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      )
      ..profileId = 'p1';

Map<String, dynamic> _audioRow(String language, String title) => {
  'profile_id': 'p1',
  'series_id': _series,
  'audio_language': language,
  'audio_track_index': 1,
  'track_signature': {'language': language, 'embedded_title': title},
  'updated_at': '2026-10-17T12:00:00.000Z',
};

void main() {
  late UserPreferences prefs;

  setUp(() async => prefs = await testPrefs());

  test('Silo\'s choices fill in a device that has none', () async {
    final server = _Silo(
      audio: _audioRow('ja', 'Japanese'),
      subtitle: {
        'profile_id': 'p1',
        'series_id': _series,
        'subtitle_language': '',
        'subtitle_mode': 'off',
        'subtitle_track_index': -1,
        'updated_at': '2026-10-17T12:00:00.000Z',
      },
    );
    expect(await syncSeriesTrackChoices(_client(server), _series, prefs), true);
    final audio = prefs.getSeriesAudioPreference(_series);
    expect(audio.language, 'ja');
    expect(audio.title, 'Japanese');
    expect(prefs.getSeriesSubtitlePreference(_series).isNone, isTrue);
  });

  test('another language from Silo replaces the device\'s', () async {
    await prefs.setSeriesAudioPreference(
      _series,
      const SeriesTrackPreference(language: 'en', title: 'Commentary'),
    );
    final server = _Silo(audio: _audioRow('jpn', 'Japanese'));
    expect(await syncSeriesTrackChoices(_client(server), _series, prefs), true);
    expect(prefs.getSeriesAudioPreference(_series).language, 'jpn');
  });

  test('the same language keeps the device\'s track', () async {
    const local = SeriesTrackPreference(
      language: 'eng',
      title: 'Commentary',
      relativeIndex: 1,
    );
    await prefs.setSeriesAudioPreference(_series, local);
    final server = _Silo(audio: _audioRow('en', 'English'));
    expect(
      await syncSeriesTrackChoices(_client(server), _series, prefs),
      false,
    );
    final kept = prefs.getSeriesAudioPreference(_series);
    expect(kept.title, 'Commentary');
    expect(kept.relativeIndex, 1);
  });

  test('nothing on Silo, nothing changes', () async {
    expect(
      await syncSeriesTrackChoices(_client(_Silo()), _series, prefs),
      false,
    );
    expect(prefs.getSeriesAudioPreference(_series).isEmpty, isTrue);
    expect(prefs.getSeriesSubtitlePreference(_series).isEmpty, isTrue);
  });
}
