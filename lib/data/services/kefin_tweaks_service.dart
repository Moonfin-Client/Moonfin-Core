import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/current_app_localizations.dart';
import '../../preference/home_section_config.dart';
import '../repositories/multi_server_repository.dart';

/// Snapshot of the third-party "KefinTweaks" front-end plugin capability for
/// a single server.
@immutable
class KefinTweaksCapability {
  final String serverId;
  final bool installed;
  final bool enabled;
  final String? version;
  final List<KefinDiscoveredSection> sections;
  final Object? lastError;
  final DateTime? probedAt;

  const KefinTweaksCapability({
    required this.serverId,
    required this.installed,
    required this.enabled,
    this.version,
    this.sections = const [],
    this.lastError,
    this.probedAt,
  });

  bool get isAvailable => installed && enabled;

  const KefinTweaksCapability.unavailable({
    required this.serverId,
    this.lastError,
    this.probedAt,
  })  : installed = false,
        enabled = false,
        version = null,
        sections = const [];
}

/// A single home row discovered from KefinTweaks configuration. The [id] is
/// stable across refreshes for the same logical section so user preferences
/// (enabled/disabled, ordering) survive config edits.
@immutable
class KefinDiscoveredSection {
  final String id;
  final String displayText;
  final int order;

  /// JSON-encoded spec consumed by `RowDataSource` at load time. Persisted
  /// in `HomeSectionConfig.pluginAdditionalData` so rows render even when
  /// the live config probe is offline.
  final String specJson;

  const KefinDiscoveredSection({
    required this.id,
    required this.displayText,
    required this.order,
    required this.specJson,
  });
}

/// Probes each Jellyfin server for KefinTweaks configuration and exposes the
/// derived list of home rows.
class KefinTweaksService extends ChangeNotifier {
  KefinTweaksService(this._multiServer);

  final MultiServerRepository _multiServer;
  final _logger = Logger();

  final Map<String, KefinTweaksCapability> _byServer = {};
  bool _disposed = false;

  Iterable<KefinTweaksCapability> get availableServers =>
      _byServer.values.where((c) => c.isAvailable);

  Iterable<KefinTweaksCapability> get allCapabilities => _byServer.values;

  Future<void> refreshAll() async {
    final sessions = await _multiServer.getLoggedInServers();
    await Future.wait(sessions.map((s) async {
      final key = s.client.baseUrl;
      if (s.client.kefinTweaksApi == null) {
        _byServer[key] = KefinTweaksCapability.unavailable(
          serverId: key,
          probedAt: DateTime.now(),
        );
        return;
      }
      await _probe(key, s.client);
    }));
    if (!_disposed) notifyListeners();
  }

  Future<void> _probe(String serverId, MediaServerClient client) async {
    final api = client.kefinTweaksApi;
    if (api == null) {
      _byServer[serverId] = KefinTweaksCapability.unavailable(
        serverId: serverId,
        probedAt: DateTime.now(),
      );
      return;
    }
    try {
      final config = await api.fetchConfig();
      if (config == null) {
        _byServer[serverId] = KefinTweaksCapability.unavailable(
          serverId: serverId,
          probedAt: DateTime.now(),
        );
        return;
      }
      final enabled = config.homeScreen.enabled;
      final sections = enabled ? _buildSections(config) : const <KefinDiscoveredSection>[];
      _byServer[serverId] = KefinTweaksCapability(
        serverId: serverId,
        installed: true,
        enabled: enabled,
        version: config.version,
        sections: sections,
        probedAt: DateTime.now(),
      );
    } catch (e) {
      _logger.w('KefinTweaks: probe failed for $serverId: $e');
      _byServer[serverId] = KefinTweaksCapability.unavailable(
        serverId: serverId,
        lastError: e,
        probedAt: DateTime.now(),
      );
    }
  }

  /// Translates a server's KefinTweaks configuration into a deterministic
  /// list of home rows.
  static List<KefinDiscoveredSection> _buildSections(KefinTweaksConfig config) {
    final l10n = currentAppLocalizations();
    final hs = config.homeScreen;
    final defaultLimit = hs.defaultItemLimit;
    final result = <KefinDiscoveredSection>[];

    // Recently Released Movies
    final rrMovies = hs.recentlyReleased?.movies;
    if (hs.recentlyReleased?.enabled != false && rrMovies?.enabled != false) {
      result.add(_buildBuiltin(
        id: 'recentlyReleasedMovies',
        title: rrMovies?.name ?? 'Recently Released Movies',
        order: rrMovies?.order ?? 21,
        spec: {
          'kind': 'recentlyReleasedMovies',
          'limit': rrMovies?.itemLimit ?? defaultLimit,
        },
      ));
    }

    // Recently Released Episodes
    final rrEpisodes = hs.recentlyReleased?.episodes;
    if (hs.recentlyReleased?.enabled != false && rrEpisodes?.enabled != false) {
      result.add(_buildBuiltin(
        id: 'recentlyReleasedEpisodes',
        title: rrEpisodes?.name ?? l10n.recentlyReleasedEpisodes,
        order: rrEpisodes?.order ?? 22,
        spec: {
          'kind': 'recentlyReleasedEpisodes',
          'limit': rrEpisodes?.itemLimit ?? defaultLimit,
        },
      ));
    }

    // Watch Again
    final watchAgain = hs.watchAgain;
    if (watchAgain?.enabled != false) {
      result.add(_buildBuiltin(
        id: 'watchAgain',
        title: watchAgain?.name ?? l10n.watchAgain,
        order: watchAgain?.order ?? 50,
        spec: {
          'kind': 'watchAgain',
          'limit': watchAgain?.itemLimit ?? defaultLimit,
        },
      ));
    }

    // Recently Added in Library
    final railMap = hs.recentlyAddedInLibrary;
    if (railMap != null) {
      final libraryIds = <String>[];
      for (final entry in railMap.entries) {
        final value = entry.value;
        final isEnabled = value is Map<String, dynamic>
            ? value['enabled'] as bool? ?? true
            : true;
        if (isEnabled) libraryIds.add(entry.key);
      }
      if (libraryIds.isNotEmpty) {
        result.add(_buildBuiltin(
          id: 'recentlyAddedInLibrary',
          title: l10n.recentlyAdded,
          order: 90,
          spec: {
            'kind': 'recentlyAddedInLibrary',
            'libraryIds': libraryIds,
            'limit': defaultLimit,
          },
        ));
      }
    }

    // Seasonal sections (only the ones whose date window contains today).
    final seasonal = hs.seasonal;
    if (seasonal != null) {
      final now = DateTime.now();
      seasonal.forEach((key, value) {
        if (value is! Map<String, dynamic>) return;
        if (value['enabled'] == false) return;
        final start = value['startDate']?.toString();
        final end = value['endDate']?.toString();
        if (start == null || end == null) return;
        if (!_seasonalActive(now, start, end)) return;
        final spec = <String, dynamic>{
          'kind': 'custom',
          'type': value['type']?.toString() ?? 'genre',
          'source': value['source']?.toString() ?? '',
          'sortBy': value['sortOrder']?.toString() ?? 'Random',
          'sortOrderDirection':
              value['sortOrderDirection']?.toString() ?? 'Ascending',
          'includeItemTypes': _stringList(value['includeItemTypes']) ??
              const ['Movie'],
          'limit': (value['itemLimit'] as num?)?.toInt() ?? defaultLimit,
        };
        result.add(_buildBuiltin(
          id: 'seasonal:$key',
          title: value['name']?.toString() ?? key,
          order: (value['order'] as num?)?.toInt() ?? 60,
          spec: spec,
        ));
      });
    }

    // Custom sections (admin-defined arbitrary rows).
    final custom = hs.customSections;
    if (custom != null) {
      for (var i = 0; i < custom.length; i++) {
        final entry = custom[i];
        if (entry is! Map<String, dynamic>) continue;
        if (entry['enabled'] == false) continue;
        final type = entry['type']?.toString() ?? 'genre';
        final source = entry['source']?.toString() ?? '';
        final spec = <String, dynamic>{
          'kind': 'custom',
          'type': type,
          'source': source,
          'sortBy': entry['sortOrder']?.toString() ?? 'Random',
          'sortOrderDirection':
              entry['sortOrderDirection']?.toString() ?? 'Ascending',
          'includeItemTypes': _stringList(entry['includeItemTypes']) ??
              const ['Movie', 'Series'],
          'limit': (entry['limit'] as num?)?.toInt() ?? defaultLimit,
        };
        final id = 'custom:${entry['id'] ?? '$type:$source:$i'}';
        result.add(_buildBuiltin(
          id: id,
          title: entry['name']?.toString() ?? 'Custom',
          order: (entry['order'] as num?)?.toInt() ?? (100 + i),
          spec: spec,
        ));
      }
    }

    result.sort((a, b) => a.order.compareTo(b.order));
    return result;
  }

  static KefinDiscoveredSection _buildBuiltin({
    required String id,
    required String title,
    required int order,
    required Map<String, dynamic> spec,
  }) =>
      KefinDiscoveredSection(
        id: 'kefin:$id',
        displayText: title,
        order: order,
        specJson: jsonEncode(spec),
      );

  static List<String>? _stringList(dynamic value) {
    if (value is List) {
      return value
          .map((e) => e?.toString())
          .whereType<String>()
          .toList(growable: false);
    }
    return null;
  }

  /// Inclusive `MM-DD` date-window membership with year-wrap support
  /// (e.g. `12-15` -> `01-05` is treated as Dec 15 through Jan 5).
  static bool _seasonalActive(DateTime now, String startMmDd, String endMmDd) {
    final start = _parseMmDd(startMmDd);
    final end = _parseMmDd(endMmDd);
    if (start == null || end == null) return false;
    final today = (now.month, now.day);
    int cmp((int, int) a, (int, int) b) {
      if (a.$1 != b.$1) return a.$1.compareTo(b.$1);
      return a.$2.compareTo(b.$2);
    }
    if (cmp(start, end) <= 0) {
      return cmp(today, start) >= 0 && cmp(today, end) <= 0;
    }
    // Year wrap.
    return cmp(today, start) >= 0 || cmp(today, end) <= 0;
  }

  static (int, int)? _parseMmDd(String value) {
    final parts = value.split('-');
    if (parts.length < 2) return null;
    final m = int.tryParse(parts[0]);
    final d = int.tryParse(parts[1]);
    if (m == null || d == null) return null;
    return (m, d);
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}

/// Convert a [KefinDiscoveredSection] into a [HomeSectionConfig] suitable for
/// merging into the user's home sections preference list.
HomeSectionConfig kefinSectionToConfig(
  KefinDiscoveredSection section,
  String serverId, {
  bool enabled = false,
  int order = 0,
}) =>
    HomeSectionConfig.pluginDynamic(
      serverId: serverId,
      pluginSection: section.id,
      pluginAdditionalData: section.specJson,
      pluginDisplayText: section.displayText,
      pluginSource: HomeSectionPluginSource.kefinTweaks,
      enabled: enabled,
      order: order,
    );
