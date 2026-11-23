import 'dart:convert';

import 'package:server_iptv/server_iptv.dart';

import '../../../l10n/current_app_localizations.dart';
import 'iptv_playlist_error_message.dart';
import 'iptv_profiles_service.dart';

/// What a restore managed to bring back, plus anything it had to skip.
class IptvRestoreSummary {
  int playlistsRestored = 0;
  int profilesRestored = 0;
  int favoritesRestored = 0;
  int progressRestored = 0;
  final List<String> warnings = [];
}

/// Exports the IPTV setup to a JSON document and restores it on another
/// install: playlist configs with their Xtream credentials, profiles, per
/// profile group selections, favorites, and movie watch progress.
///
/// Row ids change across installs and reimports, so references are stored by
/// stable keys instead: playlists by their exported id remapped on restore,
/// channels by stream URL, VOD by provider stream id. Episode positions live
/// in the on demand series cache, which is empty right after a restore, so
/// they aren't carried over.
class IptvBackupService {
  static const _kind = 'iptv_backup';
  static const _version = 1;

  final IptvDatabase _db;
  final PlaylistService _playlistService;
  final IptvProfilesService _profilesService;
  final IptvCredentialStore _credentials;

  late final PlaylistRepository _playlists = PlaylistRepository(_db);
  late final ChannelRepository _channels = ChannelRepository(_db);
  late final VodRepository _vod = VodRepository(_db);
  late final WatchStateRepository _watch = WatchStateRepository(_db);
  late final PersonalizationRepository _personalization =
      PersonalizationRepository(_db);

  IptvBackupService({
    required this._db,
    required this._playlistService,
    required this._profilesService,
    required this._credentials,
  });

  Future<String> exportBackup() async {
    final playlists = await _playlists.getAllPlaylists();
    final playlistMaps = <Map<String, dynamic>>[];
    for (final playlist in playlists) {
      final map = <String, dynamic>{
        'id': playlist.id,
        'name': playlist.name,
        'sourceType': playlist.sourceType,
        'url': playlist.url,
        'filePath': playlist.filePath,
        'epgUrl': playlist.epgUrl,
        'refreshIntervalMs': playlist.refreshIntervalMs,
      };
      if (playlist.sourceType == PlaylistSourceType.xtreamCodes.name) {
        final creds = await _credentials.getXtreamCredentials(playlist.id);
        if (creds != null) {
          map['xtream'] = {
            'serverUrl': creds.serverUrl,
            'username': creds.username,
            'password': creds.password,
          };
        }
      }
      playlistMaps.add(map);
    }

    final groupNames = <int, ({int playlistId, String name})>{};
    for (final playlist in playlists) {
      for (final group in await _channels.getGroupsForPlaylist(playlist.id)) {
        groupNames[group.id] = (
          playlistId: playlist.id,
          name: group.providerName,
        );
      }
    }

    final profileMaps = <Map<String, dynamic>>[];
    for (final profile in _profilesService.getProfiles()) {
      profileMaps.add({
        'name': profile.name,
        'avatarIndex':
            IptvProfilesService.avatarIndexFromTag(profile.imageTag) ?? 0,
        'enabledGroups': await _exportEnabledGroups(profile.id, groupNames),
        'favorites': await _exportFavorites(profile.id),
        'movieProgress': await _exportMovieProgress(profile.id),
      });
    }

    return const JsonEncoder.withIndent('  ').convert({
      'kind': _kind,
      'version': _version,
      'exportedAt': DateTime.now().toUtc().toIso8601String(),
      'playlists': playlistMaps,
      'profiles': profileMaps,
    });
  }

  Future<List<Map<String, dynamic>>?> _exportEnabledGroups(
    String profileId,
    Map<int, ({int playlistId, String name})> groupNames,
  ) async {
    final enabled = await _personalization.getEnabledGroupIds(profileId);
    if (enabled == null) return null;
    return [
      for (final id in enabled)
        if (groupNames[id] != null)
          {
            'playlistId': groupNames[id]!.playlistId,
            'group': groupNames[id]!.name,
          },
    ];
  }

  Future<List<Map<String, dynamic>>> _exportFavorites(String profileId) async {
    final entries = <Map<String, dynamic>>[];

    final channelIds = await _watch.getFavoriteRefIds(
      profileId,
      IptvItemKind.channel,
    );
    for (final channel in await _channels.getChannelsByIds(channelIds)) {
      entries.add({
        'kind': IptvItemKind.channel,
        'playlistId': channel.playlistId,
        'streamUrl': channel.streamUrl,
      });
    }

    final vodIds = await _watch.getFavoriteRefIds(profileId, IptvItemKind.vod);
    for (final id in vodIds) {
      final item = await _vod.getVodById(id);
      if (item == null) continue;
      entries.add({
        'kind': IptvItemKind.vod,
        'playlistId': item.playlistId,
        'streamId': item.streamId,
        'isSeries': item.isSeries,
      });
    }

    return entries;
  }

  Future<List<Map<String, dynamic>>> _exportMovieProgress(
    String profileId,
  ) async {
    final rows = await _watch.getAllHistory(
      profileId,
      contentType: IptvContentType.movie,
    );
    final entries = <Map<String, dynamic>>[];
    for (final row in rows) {
      final vodItemId = row.vodItemId;
      if (vodItemId == null) continue;
      final item = await _vod.getVodById(vodItemId);
      if (item == null) continue;
      entries.add({
        'playlistId': item.playlistId,
        'streamId': item.streamId,
        'positionMs': row.positionMs,
        'durationMs': row.durationMs,
        'played': row.played,
      });
    }
    return entries;
  }

  Future<IptvRestoreSummary> restoreBackup(String jsonData) async {
    final summary = IptvRestoreSummary();
    Object? decoded;
    try {
      decoded = jsonDecode(jsonData);
    } on FormatException {
      decoded = null;
    }
    if (decoded is! Map || decoded['kind'] != _kind) {
      throw FormatException(currentAppLocalizations().iptvUnrecognizedBackup);
    }
    final data = Map<String, dynamic>.from(decoded);

    final playlistIdMap = await _restorePlaylists(
      (data['playlists'] as List? ?? const []).whereType<Map>().toList(),
      summary,
    );

    for (final raw
        in (data['profiles'] as List? ?? const []).whereType<Map>()) {
      final profile = Map<String, dynamic>.from(raw);
      final restored = await _restoreProfile(profile, playlistIdMap, summary);
      if (restored) summary.profilesRestored++;
    }

    return summary;
  }

  /// Recreates each playlist and runs its import, reusing an existing
  /// playlist with the same name and type so restoring twice stays safe.
  /// Returns a map from each exported playlist id to its restored id.
  Future<Map<int, int>> _restorePlaylists(
    List<Map> rawPlaylists,
    IptvRestoreSummary summary,
  ) async {
    final existing = await _playlists.getAllPlaylists();
    final idMap = <int, int>{};
    final l10n = currentAppLocalizations();

    for (final raw in rawPlaylists) {
      final map = Map<String, dynamic>.from(raw);
      final oldId = map['id'] as int?;
      final name = switch (map['name']) {
        final String value when value.isNotEmpty => value,
        _ => l10n.playlist,
      };
      final sourceType = map['sourceType'] as String? ?? '';
      final epgUrl = map['epgUrl'] as String?;

      final match = existing
          .where((p) => p.name == name && p.sourceType == sourceType)
          .toList();
      if (match.isNotEmpty) {
        if (oldId != null) idMap[oldId] = match.first.id;
        continue;
      }

      int? newId;
      if (sourceType == PlaylistSourceType.xtreamCodes.name) {
        final xtream = map['xtream'] is Map
            ? Map<String, dynamic>.from(map['xtream'] as Map)
            : null;
        if (xtream == null) {
          summary.warnings.add(l10n.iptvRestoreNoCredentials(name));
          continue;
        }
        newId = await _playlistService.addXtreamPlaylist(
          name: name,
          serverUrl: xtream['serverUrl'] as String? ?? '',
          username: xtream['username'] as String? ?? '',
          password: xtream['password'] as String? ?? '',
          epgUrl: epgUrl,
        );
      } else if (sourceType == PlaylistSourceType.m3uUrl.name) {
        final url = map['url'] as String?;
        if (url == null || url.isEmpty) {
          summary.warnings.add(l10n.iptvRestoreNoUrl(name));
          continue;
        }
        newId = await _playlistService.addM3uUrlPlaylist(
          name: name,
          url: url,
          epgUrl: epgUrl,
        );
      } else if (sourceType == PlaylistSourceType.m3uFile.name) {
        final filePath = map['filePath'] as String?;
        if (filePath == null || filePath.isEmpty) {
          summary.warnings.add(l10n.iptvRestoreNoFilePath(name));
          continue;
        }
        newId = await _playlistService.addM3uFilePlaylist(
          name: name,
          filePath: filePath,
          epgUrl: epgUrl,
        );
      } else {
        summary.warnings.add(l10n.iptvRestoreUnknownType(name, sourceType));
        continue;
      }

      if (newId == null) {
        final error = _playlistService.error;
        summary.warnings.add(
          error == null
              ? l10n.iptvRestoreImportFailed(name)
              : l10n.iptvRestoreImportFailedWithError(
                  name,
                  iptvPlaylistErrorMessage(l10n, error),
                ),
        );
        continue;
      }
      summary.playlistsRestored++;
      if (oldId != null) idMap[oldId] = newId;
    }

    return idMap;
  }

  Future<bool> _restoreProfile(
    Map<String, dynamic> map,
    Map<int, int> playlistIdMap,
    IptvRestoreSummary summary,
  ) async {
    final name = map['name'] as String? ?? currentAppLocalizations().profile;

    // Reuse a same-named profile so a second restore doesn't duplicate it.
    final existing = _profilesService
        .getProfiles()
        .where((p) => p.name == name)
        .toList();
    final profileId = existing.isNotEmpty
        ? existing.first.id
        : (await _profilesService.createProfile(
            name,
            avatarIndex: map['avatarIndex'] as int? ?? 0,
          )).id;

    final enabledGroups = map['enabledGroups'];
    if (enabledGroups is List) {
      final groupIds = <int>{};
      for (final raw in enabledGroups.whereType<Map>()) {
        final playlistId = playlistIdMap[raw['playlistId']];
        final groupName = raw['group'] as String?;
        if (playlistId == null || groupName == null) continue;
        final groups = await _channels.getGroupsForPlaylist(playlistId);
        for (final group in groups) {
          if (group.providerName == groupName) groupIds.add(group.id);
        }
      }
      // An empty list was saved as no groups. A list where nothing matched
      // the restored playlists leaves the profile as it is.
      if (enabledGroups.isEmpty || groupIds.isNotEmpty) {
        await _personalization.setEnabledGroupIds(profileId, groupIds);
      }
    }

    for (final raw
        in (map['favorites'] as List? ?? const []).whereType<Map>()) {
      final refId = await _resolveRef(
        Map<String, dynamic>.from(raw),
        playlistIdMap,
      );
      if (refId == null) continue;
      final already = await _watch.isFavorite(
        profileId: profileId,
        itemKind: raw['kind'] as String? ?? '',
        refId: refId,
      );
      if (already) continue;
      await _watch.toggleFavorite(
        profileId: profileId,
        itemKind: raw['kind'] as String? ?? '',
        refId: refId,
      );
      summary.favoritesRestored++;
    }

    for (final raw
        in (map['movieProgress'] as List? ?? const []).whereType<Map>()) {
      final playlistId = playlistIdMap[raw['playlistId']];
      final streamId = raw['streamId'] as int?;
      if (playlistId == null || streamId == null) continue;
      final item = await _vod.getVodByStreamId(
        playlistId,
        streamId,
        isSeries: false,
      );
      if (item == null) continue;
      await _watch.upsertMovieProgress(
        profileId: profileId,
        vodItemId: item.id,
        positionMs: raw['positionMs'] as int? ?? 0,
        durationMs: raw['durationMs'] as int?,
      );
      if (raw['played'] == true) {
        await _watch.markPlayed(
          profileId: profileId,
          contentType: IptvContentType.movie,
          vodItemId: item.id,
        );
      }
      summary.progressRestored++;
    }

    return existing.isEmpty;
  }

  Future<int?> _resolveRef(
    Map<String, dynamic> raw,
    Map<int, int> playlistIdMap,
  ) async {
    final playlistId = playlistIdMap[raw['playlistId']];
    if (playlistId == null) return null;
    switch (raw['kind']) {
      case IptvItemKind.channel:
        final url = raw['streamUrl'] as String?;
        if (url == null) return null;
        final channel = await _channels.getChannelByStreamUrl(playlistId, url);
        return channel?.id;
      case IptvItemKind.vod:
        final streamId = raw['streamId'] as int?;
        if (streamId == null) return null;
        final item = await _vod.getVodByStreamId(
          playlistId,
          streamId,
          isSeries: raw['isSeries'] == true,
        );
        return item?.id;
      default:
        return null;
    }
  }
}
