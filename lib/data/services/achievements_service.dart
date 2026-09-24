import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../models/achievement_models.dart';

/// Bounds for these requests, so a server that swallows connection attempts
/// can't hold the settings panel open on a spinner.
@visibleForTesting
BaseOptions achievementRequestOptions() => BaseOptions(
  connectTimeout: const Duration(seconds: 8),
  receiveTimeout: const Duration(seconds: 15),
);

/// Reads the Achievement Badges plugin.
///
/// The plugin earns badges from Jellyfin's own playback events, so what people
/// watch in Moonfin already counts towards them. It just can't show them here,
/// because its own UI only reaches people by injecting scripts into
/// jellyfin-web. Everything it knows is on a plain HTTP API, which is what this
/// reads so the panel can be drawn natively on every platform.
///
/// Almost all of it is reading. The login ping, the quest reroll, spending a
/// power-up, buying one and changing what the profile wears are the only
/// things written, because they are the only parts the plugin expects a
/// client to drive.
class AchievementsService extends ChangeNotifier {
  static const String _root = 'Plugins/AchievementBadges';

  /// The plugin gives each user 60 requests a minute across all of its routes,
  /// so a panel load costs roughly a sixth of that. Nothing here polls.
  final Dio _dio;

  AchievementsService({@visibleForTesting Dio? dio})
    : _dio = dio ?? Dio(achievementRequestOptions()) {
    // An injected Dio brings its own adapter, so only the one built here needs
    // the server interceptors.
    if (dio == null) {
      configureServerDio(_dio);
      _dio.interceptors.add(redirectInterceptor(_dio));
    }
  }

  bool _available = false;

  /// Whether the plugin answered on this server. False until a probe succeeds,
  /// so the entry stays hidden on every server that doesn't run it.
  bool get available => _available;

  bool _leaderboardEnabled = true;
  bool _questsEnabled = true;
  bool _activityEnabled = true;
  bool _privacyMode = false;

  /// The catalogue lives in the plugin's own code, so it only changes when
  /// the server takes a new release, which ends this session with it.
  Map<String, dynamic>? _catalog;

  String _base(MediaServerClient client) =>
      client.baseUrl.replaceAll(RegExp(r'/+$'), '');

  Map<String, String>? _authHeaders(MediaServerClient client) {
    final token = client.accessToken;
    if (token == null || token.isEmpty) return null;

    return {
      'Authorization': buildServerAuthorizationHeader(
        scheme: 'MediaBrowser',
        deviceInfo: client.deviceInfo,
        accessToken: token,
      ),
    };
  }

  /// Clears the flag when a session ends, so the entry can't survive into a
  /// server that has no plugin.
  void reset() {
    _leaderboardEnabled = true;
    _questsEnabled = true;
    _activityEnabled = true;
    _privacyMode = false;
    _catalog = null;
    if (!_available) return;
    debugPrint('[AchievementsService] cleared, the entry is hidden again');
    _available = false;
    notifyListeners();
  }

  /// Probes the server and records whether the plugin is there.
  ///
  /// Also sends the login ping, which is the one part of the plugin a client
  /// has to drive. The daily login streak only moves when a client reports the
  /// visit.
  Future<bool> refreshAvailability(MediaServerClient client) async {
    final probed = await _probe(client);
    if (probed != _available) {
      _available = probed;
      notifyListeners();
    }
    if (probed) {
      unawaited(sendLoginPing(client));
    }
    return probed;
  }

  Future<bool> _probe(MediaServerClient client) async {
    // It's a Jellyfin plugin, so an Emby server never carries it.
    if (client.serverType != ServerType.jellyfin) {
      debugPrint('[AchievementsService] not probing a ${client.serverType} server');
      return false;
    }

    // public-config needs no token, so this also answers for a user who isn't
    // an administrator. A server without the plugin has no such route and
    // answers 404.
    final config = await _getMap(client, 'public-config');
    debugPrint('[AchievementsService] probed ${_base(client)}, plugin '
        '${config == null ? "did not answer" : "is there"}');
    if (config == null) return false;

    _leaderboardEnabled = config['LeaderboardEnabled'] != false;
    _questsEnabled = config['QuestsEnabled'] != false;
    _activityEnabled = config['ActivityFeedEnabled'] != false;
    _privacyMode = config['ForcePrivacyMode'] == true;
    return true;
  }

  /// Credits the daily login streak. Failure stays silent because the streak is
  /// a nicety and an older plugin build has no such route.
  Future<void> sendLoginPing(MediaServerClient client) async {
    final userId = client.userId;
    final headers = _authHeaders(client);
    if (userId == null || userId.isEmpty || headers == null) return;

    try {
      await _dio.post<dynamic>(
        '${_base(client)}/$_root/users/$userId/login-ping',
        options: Options(headers: headers),
      );
    } catch (_) {}
  }

  Future<dynamic> _get(
    MediaServerClient client,
    String path, {
    Map<String, dynamic>? query,
  }) async {
    final headers = _authHeaders(client);
    if (headers == null) return null;

    try {
      final response = await _dio.get<dynamic>(
        '${_base(client)}/$_root/$path',
        queryParameters: query,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) return response.data;
      debugPrint('[AchievementsService] $path answered ${response.statusCode}');
      return null;
    } catch (e) {
      // A 404 is how an older plugin build says it has no such route, which
      // loadOverview already treats as normal, so only real faults are worth
      // a line.
      final status = e is DioException ? e.response?.statusCode : null;
      if (status != 404) {
        debugPrint('[AchievementsService] $path failed: $e');
      }
      return null;
    }
  }

  /// Writes to [path] and tells a refusal apart from a fault.
  ///
  /// [refusedWith] is the status the plugin answers when it means no, so that
  /// one stays quiet while anything else is worth a line in the log.
  Future<_Written> _post(
    MediaServerClient client,
    String path, {
    required int refusedWith,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    final headers = _authHeaders(client);
    if (headers == null) return const _Written();

    try {
      final response = await _dio.post<dynamic>(
        '${_base(client)}/$_root/$path',
        data: body,
        queryParameters: query,
        options: Options(headers: headers),
      );
      final data = response.data;
      return _Written(body: data is Map<String, dynamic> ? data : null);
    } catch (e) {
      final status = e is DioException ? e.response?.statusCode : null;
      if (status != refusedWith) {
        debugPrint('[AchievementsService] $path failed: $e');
        return const _Written();
      }
      final data = (e as DioException).response?.data;
      return _Written(
        refused: true,
        message: data is Map<String, dynamic>
            ? data['Message'] as String?
            : null,
      );
    }
  }

  Future<Map<String, dynamic>?> _getMap(
    MediaServerClient client,
    String path, {
    Map<String, dynamic>? query,
  }) async {
    final data = await _get(client, path, query: query);
    return data is Map<String, dynamic> ? data : null;
  }

  Future<List<Map<String, dynamic>>> _getList(
    MediaServerClient client,
    String path, {
    Map<String, dynamic>? query,
  }) async {
    final data = await _get(client, path, query: query);
    if (data is! List) return const <Map<String, dynamic>>[];
    return data.whereType<Map<String, dynamic>>().toList();
  }

  /// Loads everything the panel shows in one pass.
  ///
  /// A part that fails comes back null or empty instead of failing the whole
  /// load, because an older plugin build is missing some of these routes and
  /// one missing section is no reason to show an error page instead of the
  /// rest.
  Future<AchievementsOverview?> loadOverview(
    MediaServerClient client, {
    String recapPeriod = 'month',
    int leaderboardLimit = 10,
  }) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;
    if (client.serverType != ServerType.jellyfin) return null;

    final results = await Future.wait<dynamic>([
      _getMap(client, 'users/$userId/summary'),
      _getMap(client, 'users/$userId/rank'),
      _getList(client, 'users/$userId'),
      _getList(client, 'users/$userId/equipped'),
      _questsEnabled
          ? _getMap(client, 'users/$userId/quests')
          : Future<Map<String, dynamic>?>.value(null),
      _leaderboardEnabled
          ? _getList(client, 'leaderboard', query: {'limit': leaderboardLimit})
          : Future<List<Map<String, dynamic>>>.value(
              const <Map<String, dynamic>>[],
            ),
      _getMap(client, 'users/$userId/recap', query: {'period': recapPeriod}),
      _getMap(client, 'users/$userId/library-completion'),
      _fetchCatalog(client),
      _getMap(client, 'users/$userId/cosmetics'),
    ]);

    final summary = results[0] as Map<String, dynamic>?;
    final rank = results[1] as Map<String, dynamic>?;
    final badges = results[2] as List<Map<String, dynamic>>;
    final equipped = results[3] as List<Map<String, dynamic>>;
    final quests = results[4] as Map<String, dynamic>?;
    final leaderboard = results[5] as List<Map<String, dynamic>>;
    final recap = results[6] as Map<String, dynamic>?;
    final completion = results[7] as Map<String, dynamic>?;
    final catalog = results[8] as Map<String, dynamic>?;
    final worn = results[9] as Map<String, dynamic>?;

    // A server that answered none of it has lost the plugin, rather than
    // holding an empty profile.
    if (summary == null && badges.isEmpty && rank == null) return null;

    return AchievementsOverview(
      summary: summary == null ? null : AchievementSummary.fromJson(summary),
      rank: rank == null ? null : AchievementRank.fromJson(rank),
      badges: badges.map(AchievementBadge.fromJson).toList(),
      equipped: equipped.map(AchievementBadge.fromJson).toList(),
      quests: quests == null ? null : AchievementQuests.fromJson(quests),
      leaderboard: leaderboard.map(LeaderboardEntry.fromJson).toList(),
      recap: recap == null ? null : AchievementRecap.fromJson(recap),
      libraryCompletion: _readCompletion(completion),
      leaderboardEnabled: _leaderboardEnabled,
      questsEnabled: _questsEnabled,
      activityEnabled: _activityEnabled,
      cosmetics: _readLoadout(catalog, worn),
    );
  }

  /// Without the catalogue an equipped id names nothing, so a server that
  /// answered neither leaves the profile with nothing to wear.
  CosmeticLoadout? _readLoadout(
    Map<String, dynamic>? catalog,
    Map<String, dynamic>? worn,
  ) {
    if (catalog == null) return null;
    final items = Cosmetic.parseCatalog(catalog);
    if (items.isEmpty) return null;
    return CosmeticLoadout.from(items, worn);
  }

  /// Reads what the profile owns and wears.
  ///
  /// The state route answers 404 until the plugin has a profile to hold, so
  /// a user who has watched nothing yet owns nothing rather than failing.
  Future<CosmeticLoadout?> fetchCosmetics(MediaServerClient client) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;

    final results = await Future.wait<Map<String, dynamic>?>([
      _fetchCatalog(client),
      _getMap(client, 'users/$userId/cosmetics'),
    ]);
    return _readLoadout(results[0], results[1]);
  }

  /// Wears [id], which the plugin refuses with 400 when it isn't owned.
  Future<CosmeticChange> equipCosmetic(MediaServerClient client, String id) =>
      _wear(client, 'cosmetics/equip', body: {'CosmeticId': id});

  /// Empties whatever [kind] fills.
  Future<CosmeticChange> unequipCosmetic(
    MediaServerClient client,
    CosmeticKind kind,
  ) => _wear(client, 'cosmetics/unequip', query: {'kind': kind.wireName});

  Future<CosmeticChange> _wear(
    MediaServerClient client,
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) {
      return const CosmeticChange(CosmeticChangeOutcome.failed);
    }

    final written = await _post(
      client,
      'users/$userId/$path',
      refusedWith: 400,
      body: body,
      query: query,
    );
    if (written.refused) {
      return CosmeticChange(
        CosmeticChangeOutcome.refused,
        message: written.message,
      );
    }
    // Both routes answer with an object, so nothing back is a fault rather
    // than a change that took.
    if (written.body == null) {
      return const CosmeticChange(CosmeticChangeOutcome.failed);
    }
    return const CosmeticChange(CosmeticChangeOutcome.changed);
  }

  Map<String, int> _readCompletion(Map<String, dynamic>? json) {
    final percents = json?['LibraryCompletionPercents'];
    if (percents is! Map) return const <String, int>{};

    final result = <String, int>{};
    percents.forEach((key, value) {
      if (key is String && value is num) {
        result[key] = value.round();
      }
    });
    return result;
  }

  /// What the plugin suggests watching to move [badgeId] along.
  ///
  /// The server picks unplayed items that match the badge's metric, so a badge
  /// measured on something it can't query comes back with nothing to show.
  Future<BadgeChase?> fetchBadgeChase(
    MediaServerClient client,
    String badgeId, {
    int limit = 10,
  }) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;

    final json = await _getMap(
      client,
      'users/$userId/chase/$badgeId',
      query: {'limit': limit},
    );
    return json == null ? null : BadgeChase.fromJson(json);
  }

  /// The score bank and the consumables it has already bought.
  Future<PowerUpState?> fetchPowerUps(MediaServerClient client) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;

    final json = await _getMap(client, 'users/$userId/powerups');
    return json == null ? null : PowerUpState.fromJson(json);
  }

  /// Spends one power-up.
  ///
  /// The plugin refuses with 400 when the slot is empty or the boost is already
  /// running, and its wording explains which better than a guess here would.
  Future<PowerUpUse> usePowerUp(MediaServerClient client, String type) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) {
      return const PowerUpUse(PowerUpUseOutcome.failed);
    }

    final written = await _post(
      client,
      'users/$userId/powerups/use/$type',
      refusedWith: 400,
    );
    if (written.refused) {
      return PowerUpUse(PowerUpUseOutcome.refused, message: written.message);
    }

    final body = written.body;
    if (body == null) return const PowerUpUse(PowerUpUseOutcome.failed);
    return PowerUpUse(
      PowerUpUseOutcome.used,
      message: body['Message'] as String?,
      slots: PowerUpState.parseSlots(body['Inventory']),
    );
  }

  /// The counters behind the stats screen, read in one pass.
  ///
  /// Privacy mode hides the server wide figures from everyone, so those are
  /// left unasked rather than fetched and dropped.
  Future<AchievementStats> fetchStats(MediaServerClient client) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) {
      return const AchievementStats(records: {}, watchClock: {}, server: null);
    }

    final results = await Future.wait<Map<String, dynamic>?>([
      _getMap(client, 'users/$userId/records'),
      _getMap(client, 'users/$userId/watch-clock'),
      _privacyMode
          ? Future<Map<String, dynamic>?>.value(null)
          : _getMap(client, 'server/stats'),
    ]);

    final server = results[2];
    return AchievementStats(
      records: AchievementStats.parseCounters(results[0]),
      watchClock: AchievementStats.parseWatchClock(results[1]),
      server: server == null ? null : ServerStats.fromJson(server),
    );
  }

  /// What the server has unlocked lately, newest first.
  ///
  /// An admin can switch the feed off, in which case this answers empty rather
  /// than asking. It can also come back empty because everyone on the server
  /// has opted out of appearing in it.
  Future<List<ActivityEntry>> fetchActivity(
    MediaServerClient client, {
    int limit = 30,
  }) async {
    if (!_activityEnabled) return const <ActivityEntry>[];

    final json = await _getMap(
      client,
      'activity-feed',
      query: {'page': 1, 'pageSize': limit},
    );
    return json == null
        ? const <ActivityEntry>[]
        : ActivityEntry.parseFeed(json);
  }

  Future<Map<String, dynamic>?> _fetchCatalog(MediaServerClient client) async =>
      _catalog ??= await _getMap(client, 'shop/catalog');

  /// What the shop sells, narrowed to the power-ups.
  ///
  /// The catalogue is the same for everyone, so this route carries no user.
  Future<List<ShopPowerUp>> fetchShopPowerUps(MediaServerClient client) async {
    final json = await _fetchCatalog(client);
    return json == null
        ? const <ShopPowerUp>[]
        : ShopPowerUp.parseCatalog(json);
  }

  /// Buys one thing from the shop.
  ///
  /// The plugin refuses with 400 when the bank is short or the slot is already
  /// full, and its wording says which.
  Future<Purchase> buy(MediaServerClient client, String itemId) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) {
      return const Purchase(PurchaseOutcome.failed);
    }

    final written = await _post(
      client,
      'users/$userId/shop/purchase',
      refusedWith: 400,
      body: {'ItemId': itemId},
    );
    if (written.refused) {
      return Purchase(PurchaseOutcome.refused, message: written.message);
    }

    final data = written.body;
    if (data == null) return const Purchase(PurchaseOutcome.failed);
    return Purchase(
      PurchaseOutcome.bought,
      message: data['Message'] as String?,
      bankAfter: (data['ScoreBalanceAfter'] as num?)?.toInt(),
    );
  }

  /// Swaps one quest set for a fresh one.
  ///
  /// The plugin grants a single daily and a single weekly reroll and answers
  /// 429 once one is spent, which is a refusal to report rather than a fault.
  Future<QuestReroll> rerollQuests(
    MediaServerClient client, {
    required bool weekly,
  }) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) {
      return const QuestReroll(QuestRerollOutcome.failed);
    }

    final questSet = weekly ? 'weekly' : 'daily';
    final written = await _post(
      client,
      'users/$userId/quests/$questSet/reroll',
      refusedWith: 429,
    );
    if (written.refused) {
      return const QuestReroll(QuestRerollOutcome.alreadyUsed);
    }

    final body = written.body;
    if (body == null) return const QuestReroll(QuestRerollOutcome.failed);
    return QuestReroll(
      QuestRerollOutcome.rerolled,
      quests: AchievementQuests.parseList(body['Quests']),
      rerollsLeft: (body['RerollsRemaining'] as num?)?.toInt() ?? 0,
    );
  }

  /// Reloads the recap alone, for the period picker.
  Future<AchievementRecap?> fetchRecap(
    MediaServerClient client,
    String period,
  ) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;

    final json = await _getMap(
      client,
      'users/$userId/recap',
      query: {'period': period},
    );
    return json == null ? null : AchievementRecap.fromJson(json);
  }

  @override
  void dispose() {
    _dio.close(force: true);
    super.dispose();
  }

  /// Reloads one leaderboard alone, for the category picker.
  ///
  /// An empty [category] asks for the overall score board. The plugin answers
  /// an unknown category with that board too, rather than a 404.
  Future<List<LeaderboardEntry>> fetchLeaderboard(
    MediaServerClient client, {
    String category = '',
    int limit = 10,
  }) async {
    if (!_leaderboardEnabled) return const <LeaderboardEntry>[];

    final path = category.isEmpty ? 'leaderboard' : 'leaderboard/$category';
    final rows = await _getList(client, path, query: {'limit': limit});
    return rows.map(LeaderboardEntry.fromJson).toList();
  }
}

/// What a write came back with: a body, a refusal the plugin worded itself, or
/// neither when it failed outright.
class _Written {
  const _Written({this.body, this.refused = false, this.message});

  final Map<String, dynamic>? body;
  final bool refused;
  final String? message;
}
