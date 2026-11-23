import 'package:server_core/server_core.dart';

import '../ids.dart';
import '../iptv_backend.dart';
import '../mapping/item_mapper.dart';
import '../repositories/watch_state_repository.dart'
    show IptvContentType, IptvItemKind;
import 'iptv_items_api.dart';

class IptvAuthApi implements AuthApi {
  @override
  Future<Map<String, dynamic>> authenticateByName(
    String username,
    String password,
  ) => throw UnsupportedError(
    "IPTV profiles are local, so there's no server login",
  );

  @override
  Future<Map<String, dynamic>> initiateQuickConnect() =>
      throw UnsupportedError('Quick Connect is not supported on IPTV');

  @override
  Future<Map<String, dynamic>> checkQuickConnect(String secret) =>
      throw UnsupportedError('Quick Connect is not supported on IPTV');

  @override
  Future<bool> authorizeQuickConnect(String code, {String? userId}) =>
      throw UnsupportedError('Quick Connect is not supported on IPTV');

  @override
  Future<Map<String, dynamic>> authenticateWithQuickConnect(String secret) =>
      throw UnsupportedError('Quick Connect is not supported on IPTV');

  @override
  Future<void> logout() async {}
}

class IptvUserLibraryApi implements UserLibraryApi {
  final IptvBackend _backend;
  final IptvItemsApi _itemsApi;

  IptvUserLibraryApi(this._backend, this._itemsApi);

  @override
  bool get supportsNumericUserRatings => false;

  ({String kind, int refId})? _favoriteTarget(String itemId) {
    return switch (IptvId.tryParse(itemId)) {
      IptvChannelId(:final channelRowId) => (
        kind: IptvItemKind.channel,
        refId: channelRowId,
      ),
      IptvVodId(:final vodRowId) => (kind: IptvItemKind.vod, refId: vodRowId),
      IptvSeriesId(:final vodRowId) => (
        kind: IptvItemKind.vod,
        refId: vodRowId,
      ),
      _ => null,
    };
  }

  Future<void> _setFavorite(String itemId, bool favorite) async {
    final profileId = _backend.activeProfileId;
    final target = _favoriteTarget(itemId);
    if (profileId == null || target == null) return;
    final current = await _backend.watchState.isFavorite(
      profileId: profileId,
      itemKind: target.kind,
      refId: target.refId,
    );
    if (current != favorite) {
      await _backend.watchState.toggleFavorite(
        profileId: profileId,
        itemKind: target.kind,
        refId: target.refId,
      );
    }
  }

  @override
  Future<void> markFavorite(String itemId) => _setFavorite(itemId, true);

  @override
  Future<void> unmarkFavorite(String itemId) => _setFavorite(itemId, false);

  @override
  Future<void> markPlayed(String itemId) => _setPlayed(itemId, true);

  @override
  Future<void> unmarkPlayed(String itemId) => _setPlayed(itemId, false);

  Future<void> _setPlayed(String itemId, bool played) async {
    final profileId = _backend.activeProfileId;
    if (profileId == null) return;
    switch (IptvId.tryParse(itemId)) {
      case IptvVodId(:final vodRowId):
        await _backend.watchState.markPlayed(
          profileId: profileId,
          contentType: IptvContentType.movie,
          vodItemId: vodRowId,
          played: played,
        );
      case IptvEpisodeId(:final episodeRowId):
        await _backend.watchState.markPlayed(
          profileId: profileId,
          contentType: IptvContentType.episode,
          episodeId: episodeRowId,
          played: played,
        );
      default:
        return;
    }
  }

  @override
  Future<void> updatePlayedPosition(
    String itemId, {
    required int positionTicks,
  }) async {}

  @override
  Future<void> updateUserRating(String itemId, {required bool likes}) async {}

  @override
  Future<void> updateNumericUserRating(
    String itemId, {
    required double rating,
  }) async {}

  @override
  Future<void> deleteUserRating(String itemId) async {}

  @override
  Future<Map<String, dynamic>> getItem(String itemId) =>
      _itemsApi.getItem(itemId);
}

class IptvUserViewsApi implements UserViewsApi {
  final IptvBackend _backend;

  IptvUserViewsApi(this._backend);

  @override
  Future<Map<String, dynamic>> getUserViews({
    bool includeHidden = false,
  }) async {
    final playlistIds = await _backend.allPlaylistIds();
    if (playlistIds.isEmpty) {
      return IptvItemMapper.emptyItemsResult();
    }

    final labels = _backend.labels();
    // Each view only shows when the catalog has something for it.
    final views = <Map<String, dynamic>>[
      if (await _backend.channels.countChannels(vod: false) > 0)
        IptvItemMapper.libraryToMap(IptvLibraryIds.live, labels),
    ];

    var hasMovies = (await _backend.channels.countChannels(vod: true)) > 0;
    var hasSeries = false;
    for (final playlistId in playlistIds) {
      if (!hasMovies &&
          (await _backend.vod.countVod(playlistId, seriesOnly: false)) > 0) {
        hasMovies = true;
      }
      if (!hasSeries &&
          (await _backend.vod.countVod(playlistId, seriesOnly: true)) > 0) {
        hasSeries = true;
      }
      if (hasMovies && hasSeries) break;
    }
    if (hasMovies) {
      views.add(IptvItemMapper.libraryToMap(IptvLibraryIds.movies, labels));
    }
    if (hasSeries) {
      views.add(IptvItemMapper.libraryToMap(IptvLibraryIds.shows, labels));
    }

    return IptvItemMapper.itemsResult(views);
  }
}

class IptvUsersApi implements UsersApi {
  final IptvBackend _backend;

  IptvUsersApi(this._backend);

  @override
  Future<List<AccessSchedule>?> getAccessSchedules(String userId) async =>
      const [];

  @override
  Future<ServerUser> getCurrentUser() async {
    return ServerUser(
      id: _backend.requireProfileId,
      name: _backend.labels().profileName,
      serverId: 'iptv_local',
      hasPassword: false,
      policy: UserPolicy.fromJson(const {
        'IsAdministrator': false,
        'EnableContentDownloading': false,
        'EnableSubtitleManagement': false,
        'EnableCollectionManagement': false,
      }),
    );
  }

  @override
  Future<UserConfiguration> getUserConfiguration() async =>
      const UserConfiguration();

  @override
  Future<void> updateUserConfiguration(UserConfiguration config) async {}
}

class IptvSystemApi implements SystemApi {
  @override
  Future<Map<String, dynamic>> getPublicSystemInfo() async => const {
    'ServerName': 'IPTV',
    'Version': '1.0.0',
    'Id': 'iptv_local',
  };

  @override
  Future<Map<String, dynamic>> getSystemInfo() => getPublicSystemInfo();

  @override
  Future<bool> ping() async => true;
}

class IptvSessionApi implements SessionApi {
  @override
  Future<void> reportCapabilities(Map<String, dynamic> capabilities) async {}

  @override
  Future<List<Map<String, dynamic>>> getSessions({
    String? controllableByUserId,
    int? activeWithinSeconds,
  }) async => [];

  @override
  Future<void> sendPlayCommand(
    String sessionId, {
    required String playCommand,
    required List<String> itemIds,
    int? startPositionTicks,
    String? mediaSourceId,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? startIndex,
  }) async {}

  @override
  Future<void> sendPlayStateCommand(
    String sessionId,
    String command, {
    int? seekPositionTicks,
  }) async {}

  @override
  Future<void> sendMessage(
    String sessionId,
    String text, {
    String? header,
    int? timeoutMs,
  }) async {}

  @override
  Future<void> sendGeneralCommand(
    String sessionId,
    String commandName, {
    Map<String, String>? arguments,
  }) async {}
}

class IptvInstantMixApi implements InstantMixApi {
  @override
  Future<Map<String, dynamic>> getInstantMix(
    String itemId, {
    int? limit,
  }) async => IptvItemMapper.emptyItemsResult();
}

class IptvDisplayPreferencesApi implements DisplayPreferencesApi {
  @override
  Future<DisplayPreferences> getDisplayPreferences(
    String id, {
    String? client,
  }) async => DisplayPreferences(id: id);

  @override
  Future<void> saveDisplayPreferences(
    String id,
    DisplayPreferences prefs, {
    String? client,
  }) async {}
}
