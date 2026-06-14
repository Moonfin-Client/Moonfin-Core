import 'package:flutter/services.dart';

import '../util/platform_detection.dart';

class ExternalPlayerApp {
  final String component;
  final String packageName;
  final String activityName;
  final String label;
  final Uint8List? iconPngBytes;

  const ExternalPlayerApp({
    required this.component,
    required this.packageName,
    required this.activityName,
    required this.label,
    this.iconPngBytes,
  });

  factory ExternalPlayerApp.fromMap(Map<String, dynamic> map) {
    final rawIcon = map['iconPngBytes'];
    Uint8List? iconPngBytes;
    if (rawIcon is Uint8List) {
      iconPngBytes = rawIcon;
    } else if (rawIcon is List) {
      iconPngBytes = Uint8List.fromList(rawIcon.whereType<int>().toList());
    }

    return ExternalPlayerApp(
      component: (map['component'] as String? ?? '').trim(),
      packageName: (map['packageName'] as String? ?? '').trim(),
      activityName: (map['activityName'] as String? ?? '').trim(),
      label: (map['label'] as String? ?? '').trim(),
      iconPngBytes: iconPngBytes,
    );
  }
}

class ExternalPlayerSubtitle {
  final String url;
  final String? name;
  final String? language;
  final String codec;

  const ExternalPlayerSubtitle({
    required this.url,
    this.name,
    this.language,
    this.codec = '',
  });

  Map<String, dynamic> toMap() => {
    'url': url,
    if (name != null && name!.isNotEmpty) 'name': name,
    if (language != null && language!.isNotEmpty) 'language': language,
    if (codec.isNotEmpty) 'codec': codec,
  };
}

class ExternalPlayerLaunchRequest {
  final String url;
  final String mimeType;
  final String component;
  final String title;
  final String? filename;
  final Duration startPosition;
  final Duration? runtime;
  final Map<String, String> headers;
  final List<ExternalPlayerSubtitle> subtitles;

  const ExternalPlayerLaunchRequest({
    required this.url,
    this.mimeType = 'video/*',
    this.component = '',
    required this.title,
    this.filename,
    this.startPosition = Duration.zero,
    this.runtime,
    this.headers = const {},
    this.subtitles = const [],
  });

  Map<String, dynamic> toMap() => {
    'url': url,
    'mimeType': mimeType,
    if (component.isNotEmpty) 'component': component,
    'title': title,
    if (filename != null && filename!.isNotEmpty) 'filename': filename,
    'positionMs': startPosition.inMilliseconds,
    if (runtime != null) 'runtimeMs': runtime!.inMilliseconds,
    if (headers.isNotEmpty) 'headers': headers,
    if (subtitles.isNotEmpty)
      'subtitles': subtitles.map((subtitle) => subtitle.toMap()).toList(),
  };
}

class ExternalPlayerLaunchResult {
  final bool completed;
  final Duration? endPosition;
  final bool hasError;
  final String? errorCode;
  final String? errorMessage;
  final String? playerAction;

  const ExternalPlayerLaunchResult({
    required this.completed,
    this.endPosition,
    this.hasError = false,
    this.errorCode,
    this.errorMessage,
    this.playerAction,
  });

  static int? _asInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  factory ExternalPlayerLaunchResult.fromMap(Map<String, dynamic> map) {
    final endPositionMs = _asInt(map['endPositionMs']);
    return ExternalPlayerLaunchResult(
      completed: map['completed'] == true,
      endPosition: endPositionMs == null
          ? null
          : Duration(milliseconds: endPositionMs),
      hasError: map['hasError'] == true,
      errorCode: map['errorCode'] as String?,
      errorMessage: map['errorMessage'] as String?,
      playerAction: map['playerAction'] as String?,
    );
  }
}

class ExternalPlayerService {
  static const MethodChannel _channel = MethodChannel('moonfin/external_player');

  const ExternalPlayerService();

  bool get _isSupported => PlatformDetection.isAndroid;

  Future<List<ExternalPlayerApp>> listPlayers() async {
    if (!_isSupported) return const [];

    final raw = await _channel.invokeMethod<List<dynamic>>('listPlayers');
    if (raw == null) return const [];

    return raw
        .whereType<Map>()
        .map((entry) => ExternalPlayerApp.fromMap(entry.cast<String, dynamic>()))
        .where((entry) {
          final pkg = entry.packageName.toLowerCase();
          return entry.component.isNotEmpty &&
                 pkg != 'com.nvidia.lightbox' &&
                 pkg != 'com.nvidia.lightbox.beta' &&
                 pkg != 'com.nvidia.gallery3d' &&
                 pkg != 'com.android.gallery3d' &&
                 pkg != 'com.android.videoplayer' &&
                 pkg != 'com.google.android.videos' &&
                 pkg != 'com.google.android.youtube' &&
                 pkg != 'com.google.android.youtube.tv' &&
                 pkg != 'com.google.android.tv.frameworkpackagestubs' &&
                 !pkg.startsWith('org.moonfin.androidtv');
        })
        .toList(growable: false);
  }

  Future<ExternalPlayerApp?> findByComponent(String component) async {
    final normalized = component.trim();
    if (normalized.isEmpty) return null;
    final players = await listPlayers();
    for (final player in players) {
      if (player.component == normalized) {
        return player;
      }
    }
    return null;
  }

  Future<ExternalPlayerLaunchResult> launch(
    ExternalPlayerLaunchRequest request,
  ) async {
    return _launchViaMethod('launch', request, includeComponent: true);
  }

  Future<ExternalPlayerLaunchResult> chooseAndLaunch(
    ExternalPlayerLaunchRequest request,
  ) async {
    return _launchViaMethod('chooseAndLaunch', request, includeComponent: false);
  }

  Future<ExternalPlayerLaunchResult> _launchViaMethod(
    String method,
    ExternalPlayerLaunchRequest request, {
    required bool includeComponent,
  }) async {
    if (!_isSupported) {
      return const ExternalPlayerLaunchResult(
        completed: false,
        hasError: true,
        errorCode: 'UNSUPPORTED',
        errorMessage: 'External player is only available on Android.',
      );
    }

    try {
      final payload = request.toMap();
      if (!includeComponent) {
        payload.remove('component');
      }

      final raw = await _channel.invokeMethod<Map<dynamic, dynamic>>(
        method,
        payload,
      );

      if (raw == null) {
        return const ExternalPlayerLaunchResult(
          completed: false,
          hasError: true,
          errorCode: 'EMPTY_RESULT',
          errorMessage: 'External player returned no result.',
        );
      }

      return ExternalPlayerLaunchResult.fromMap(
        raw.map((key, value) => MapEntry(key.toString(), value)),
      );
    } on PlatformException catch (error) {
      return ExternalPlayerLaunchResult(
        completed: false,
        hasError: true,
        errorCode: error.code,
        errorMessage: error.message,
      );
    }
  }
}
