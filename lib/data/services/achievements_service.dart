import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart'
    show AppLifecycleListener, AppLifecycleState;
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
/// Most of it is reading. The login ping, the quest reroll, power-ups, the
/// shop, what the profile wears, friends and chat are the parts written.
class AchievementsService extends ChangeNotifier {
  static const String _root = 'Plugins/AchievementBadges';

  /// The plugin gives each user 60 requests a minute across all of its routes,
  /// so a panel load costs roughly a sixth of that. Only the friends badge,
  /// unlock notifications and an open chat poll, and all of them stop while
  /// the app is in the background.
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
  bool _friendsEnabled = true;
  bool _friendsSimpleMode = false;
  bool _unlockToastsEnabled = false;

  /// Whether the friends list and chat are on for this server.
  bool get socialAvailable => _available && _friendsEnabled;

  /// Whether the admin left the plugin's unlock notifications on. Nothing
  /// about them is offered when they're off.
  bool get unlockToastsAvailable => _available && _unlockToastsEnabled;

  /// The admin made everyone a friend, so there are no requests to send.
  bool get friendsSimpleMode => _friendsSimpleMode;

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
    _friendsEnabled = true;
    _friendsSimpleMode = false;
    _unlockToastsEnabled = false;
    _catalog = null;
    _clearSocial();
    _clearUnlocks();
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
    if (!client.features.supportsAchievements) {
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
    _friendsEnabled = config['FriendsEnabled'] != false;
    _friendsSimpleMode = config['FriendsSimpleMode'] == true;

    // A plugin build without this route leaves the notifications off rather
    // than polling for unlocks it can't serve.
    final features = await _getMap(client, 'admin/ui-features');
    _unlockToastsEnabled =
        features != null && features['EnableUnlockToasts'] != false;
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
    Object? body,
    Map<String, dynamic>? query,
    String method = 'POST',
  }) async {
    final headers = _authHeaders(client);
    if (headers == null) return const _Written();

    try {
      final response = await _dio.request<dynamic>(
        '${_base(client)}/$_root/$path',
        data: body,
        queryParameters: query,
        options: Options(method: method, headers: headers),
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
    if (!client.features.supportsAchievements) return null;

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
    _pollTimer?.cancel();
    _lifecycle?.dispose();
    unawaited(_incoming.close());
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

  // ---------- Friends and chat ----------

  /// How often the friends badge and unlock notifications are refreshed. Each
  /// refresh is up to three small reads, well inside the plugin's 60 requests
  /// a minute.
  static const Duration pollInterval = Duration(seconds: 30);

  Timer? _pollTimer;
  FriendsList? _friends;
  List<ChatThread> _threads = const [];

  /// The chats as the last refresh saw them. Null until the first one, which
  /// only records what is there.
  Map<String, ChatThread>? _seenThreads;
  bool _messageNotifications = true;

  /// The client the refreshes run with, kept so a return from the background
  /// can pick them back up.
  MediaServerClient? _pollClient;
  AppLifecycleListener? _lifecycle;

  final _incoming = StreamController<ChatThread>.broadcast();

  /// The last friends list read, or null before the first one lands.
  FriendsList? get friends => _friends;

  /// Chats, newest first.
  List<ChatThread> get threads => _threads;

  int get incomingRequestCount => _friends?.incoming.length ?? 0;

  int get unreadMessageCount =>
      _threads.fold(0, (sum, thread) => sum + thread.unreadCount);

  /// What the friends button shows on its badge.
  int get socialBadgeCount => incomingRequestCount + unreadMessageCount;

  /// A chat that got a message from someone else since the last refresh.
  Stream<ChatThread> get incomingMessages => _incoming.stream;

  /// The chat on screen, so a message landing in it doesn't pop a banner.
  String? openConversationId;

  void _clearSocial() {
    _pollTimer?.cancel();
    _pollTimer = null;
    _lifecycle?.dispose();
    _lifecycle = null;
    _pollClient = null;
    _friends = null;
    _threads = const [];
    _seenThreads = null;
    _messageNotifications = true;
    openConversationId = null;
  }

  bool get _anythingToPoll => socialAvailable || unlockToastsAvailable;

  /// Keeps the friends badge and unlock notifications current until [reset]
  /// ends the session.
  ///
  /// The refreshes stop while the app is in the background and pick up again,
  /// with one straight away, when it comes back.
  void startPolling(MediaServerClient client) {
    if (!_anythingToPoll) return;
    _pollClient = client;
    _lifecycle ??= AppLifecycleListener(onStateChange: _onLifecycleChanged);
    if (socialAvailable) unawaited(_loadNotificationSetting(client));
    _resumePolling();
  }

  void _resumePolling() {
    final client = _pollClient;
    if (client == null || !_anythingToPoll) return;
    _pollTimer?.cancel();
    unawaited(_poll(client));
    _pollTimer = Timer.periodic(pollInterval, (_) => _poll(client));
  }

  Future<void> _poll(MediaServerClient client) =>
      Future.wait([refreshSocial(client), refreshUnlocks(client)]);

  /// Only a hidden or paused app stops. An inactive one is still on screen,
  /// like a desktop window without focus.
  void _onLifecycleChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (_pollTimer == null) _resumePolling();
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        _pollTimer?.cancel();
        _pollTimer = null;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        break;
    }
  }

  @visibleForTesting
  bool get polling => _pollTimer != null;

  Future<void> _loadNotificationSetting(MediaServerClient client) async {
    final privacy = await fetchSocialPrivacy(client);
    if (privacy != null) _messageNotifications = privacy.messageNotifications;
  }

  /// Reads the friends list and the chats again.
  ///
  /// The first read only records what is there, so messages that were already
  /// waiting when the app started don't all pop up at once.
  Future<void> refreshSocial(MediaServerClient client) async {
    if (!socialAvailable) return;

    final results = await Future.wait<Object?>([
      fetchFriends(client),
      _fetchThreads(client),
    ]);
    final friends = results[0] as FriendsList?;
    final threads = results[1] as List<ChatThread>?;

    if (friends != null) _friends = friends;
    if (threads != null) {
      final seen = _seenThreads;
      if (seen != null && _messageNotifications) {
        for (final thread in threads) {
          if (_isNewFromOthers(thread, seen[thread.conversationId])) {
            _incoming.add(thread);
          }
        }
      }
      _threads = threads;
      _seenThreads = {for (final t in threads) t.conversationId: t};
    }
    if (friends != null || threads != null) notifyListeners();
  }

  bool _isNewFromOthers(ChatThread thread, ChatThread? before) {
    if (thread.lastFromMe || thread.unreadCount == 0) return false;
    if (thread.conversationId == openConversationId) return false;
    if (before == null) return true;
    final at = thread.lastAt;
    final was = before.lastAt;
    return thread.unreadCount > before.unreadCount ||
        (at != null && was != null && at.isAfter(was));
  }

  // ---------- Unlock notifications ----------

  /// How long the plugin's notification settings are trusted before being
  /// read again, the same as jellyfin-web, so a change made there lands here.
  static const Duration _unlockSettingsMaxAge = Duration(minutes: 5);

  UnlockToastSettings? _unlockSettings;
  DateTime? _unlockSettingsReadAt;

  /// The server's clock from the last read, handed back as the next cutoff so
  /// a device clock that is off can't skip or repeat unlocks. Null until the
  /// first read, which only records it.
  String? _unlockCursor;

  /// Unlocks already passed on, by badge id and unlock time.
  final _shownUnlocks = <String>{};
  final _unlocks = StreamController<AchievementUnlocks>.broadcast();

  /// Badges unlocked since the last read that the user wants to hear about.
  Stream<AchievementUnlocks> get unlocks => _unlocks.stream;

  /// Whether the user has unlock notifications on, or null before the first
  /// read of their plugin settings.
  bool? get unlockToastsEnabled => _unlockSettings?.enabled;

  @visibleForTesting
  void expireUnlockSettings() => _unlockSettingsReadAt = null;

  void _clearUnlocks() {
    _unlockSettings = null;
    _unlockSettingsReadAt = null;
    _unlockCursor = null;
    _shownUnlocks.clear();
  }

  Future<UnlockToastSettings?> fetchUnlockToastSettings(
    MediaServerClient client,
  ) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;

    final json = await _getMap(client, 'users/$userId/preferences');
    if (json == null) return null;
    _unlockSettings = UnlockToastSettings.fromJson(json);
    _unlockSettingsReadAt = DateTime.now();
    return _unlockSettings;
  }

  /// Turns the plugin's unlock notifications on or off for this user, which
  /// jellyfin-web follows too. The plugin replaces its whole preferences
  /// object on save, so this writes over a fresh copy of it.
  Future<bool> saveUnlockToasts(MediaServerClient client, bool enabled) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return false;

    final current = await _getMap(client, 'users/$userId/preferences');
    if (current == null) return false;
    final next = {...current, 'EnableUnlockToasts': enabled};
    final written = await _post(
      client,
      'users/$userId/preferences',
      refusedWith: 400,
      body: next,
    );
    if (written.body == null) return false;
    _unlockSettings = UnlockToastSettings.fromJson(next);
    _unlockSettingsReadAt = DateTime.now();
    return true;
  }

  /// Reads the badges unlocked since the last read and passes on the ones the
  /// user's plugin settings want shown.
  ///
  /// The first read only records the server's clock, so badges earned before
  /// the app started don't all pop up at once.
  Future<void> refreshUnlocks(MediaServerClient client) async {
    if (!unlockToastsAvailable) return;
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return;

    var settings = _unlockSettings;
    final readAt = _unlockSettingsReadAt;
    if (readAt == null ||
        DateTime.now().difference(readAt) >= _unlockSettingsMaxAge) {
      // A failed read keeps the last settings rather than dropping the cursor
      // and every unlock earned before the next good read.
      settings = await fetchUnlockToastSettings(client) ?? settings;
    }
    if (settings == null) return;
    if (!settings.enabled) {
      // Turning them back on starts from then, not from before they were off.
      _unlockCursor = null;
      return;
    }

    final cursor = _unlockCursor;
    final json = await _getMap(
      client,
      'users/$userId/unlocks-since',
      query: {
        'since': cursor ?? DateTime.now().toUtc().toIso8601String(),
        // Lets the plugin hold back unlocks earned on another device when the
        // user only wants them where they happened.
        'deviceId': client.deviceInfo.id,
      },
    );
    if (json == null) return;
    final now = json['Now'];
    if (now is String && now.isNotEmpty) _unlockCursor = now;
    if (cursor == null) return;

    final badges = <AchievementBadge>[];
    final rows = json['Badges'];
    for (final row in rows is List ? rows : const <dynamic>[]) {
      if (row is! Map<String, dynamic>) continue;
      if (!_shownUnlocks.add('${row['Id']}|${row['UnlockedAt']}')) continue;
      final badge = AchievementBadge.fromJson(row);
      if (settings.allows(badge.rarity)) badges.add(badge);
    }
    while (_shownUnlocks.length > 400) {
      _shownUnlocks.remove(_shownUnlocks.first);
    }
    if (badges.isEmpty) return;
    _unlocks.add(
      AchievementUnlocks(
        badges: badges,
        grouped: settings.grouped,
        muteDuringPlayback: settings.muteDuringPlayback,
      ),
    );
  }

  /// A name for [userId] from whatever was read last, for group members the
  /// chat payloads only name by id.
  String? displayNameFor(String userId) {
    final friends = _friends;
    final people = <SocialUser>[
      if (friends != null)
        for (final friend in friends.friends)
          SocialUser(userId: friend.userId, userName: friend.userName),
      ...?friends?.incoming,
      ...?friends?.outgoing,
      for (final thread in _threads) ...thread.participants,
    ];
    for (final person in people) {
      if (sameUserId(person.userId, userId) && person.userName.isNotEmpty) {
        return person.userName;
      }
    }
    return null;
  }

  Future<FriendsList?> fetchFriends(MediaServerClient client) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;

    final json = await _getMap(client, 'users/$userId/friends');
    return json == null ? null : FriendsList.fromJson(json);
  }

  /// Accepts at once when [userId] already asked first.
  Future<SocialWrite<void>> sendFriendRequest(
    MediaServerClient client,
    String userId,
  ) => _social(client, 'POST', 'friends/$userId');

  Future<SocialWrite<void>> acceptFriendRequest(
    MediaServerClient client,
    String userId,
  ) => _social(client, 'POST', 'friends/$userId/accept');

  /// Also declines a request from [userId], or takes one back.
  Future<SocialWrite<void>> removeFriend(
    MediaServerClient client,
    String userId,
  ) => _social(client, 'DELETE', 'friends/$userId');

  /// Answers 404 for someone who hides from the leaderboard, which comes back
  /// null like any other miss.
  Future<PublicProfile?> fetchPublicProfile(
    MediaServerClient client,
    String userId,
  ) async {
    final json = await _getMap(client, 'profiles/$userId/summary');
    return json == null ? null : PublicProfile.fromJson(json);
  }

  /// The users this user can see. The plugin's directory leaves out accounts
  /// an admin hid from the login screen, which Jellyfin's /Users lists to
  /// anyone signed in. Plugin builds before 2.4.1 have no directory and fall
  /// back to /Users.
  Future<List<SocialUser>> fetchServerUsers(MediaServerClient client) async {
    final headers = _authHeaders(client);
    if (headers == null) return const <SocialUser>[];

    final userId = client.userId;
    if (userId != null && userId.isNotEmpty) {
      final directory = await _get(client, 'users/$userId/directory');
      if (directory is List) return _readUsers(directory);
    }

    try {
      final response = await _dio.get<dynamic>(
        '${_base(client)}/Users',
        options: Options(headers: headers),
      );
      final data = response.data;
      return data is List ? _readUsers(data) : const <SocialUser>[];
    } catch (e) {
      debugPrint('[AchievementsService] Users failed: $e');
      return const <SocialUser>[];
    }
  }

  List<SocialUser> _readUsers(List<dynamic> rows) => rows
      .whereType<Map<String, dynamic>>()
      .map(
        (user) => SocialUser(
          userId: user['Id'] is String ? user['Id'] as String : '',
          userName: user['Name'] is String ? user['Name'] as String : '',
        ),
      )
      .where((user) => user.userId.isNotEmpty)
      .toList();

  Future<List<ChatThread>?> _fetchThreads(MediaServerClient client) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;

    final json = await _getMap(client, 'users/$userId/messages/threads');
    if (json == null) return null;
    final list = json['Threads'];
    if (list is! List) return const <ChatThread>[];
    return list
        .whereType<Map<String, dynamic>>()
        .map(ChatThread.fromJson)
        .toList();
  }

  /// The direct chat with [otherUserId]. The plugin makes it on first use.
  Future<String?> openDirectChat(
    MediaServerClient client,
    String otherUserId,
  ) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;

    final json = await _getMap(
      client,
      'users/$userId/messages/$otherUserId',
      query: {'limit': 1},
    );
    final id = json?['ConversationId'];
    return id is String && id.isNotEmpty ? id : null;
  }

  Future<ChatConversation?> fetchConversation(
    MediaServerClient client,
    String conversationId,
  ) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;

    final json = await _getMap(
      client,
      'users/$userId/conversations/$conversationId',
    );
    final conversation = json?['Conversation'];
    if (json?['Success'] != true || conversation is! Map<String, dynamic>) {
      return null;
    }
    return ChatConversation.fromJson(conversation);
  }

  /// The latest messages, oldest first. Reading them marks them as read.
  Future<List<ChatMessage>?> fetchMessages(
    MediaServerClient client,
    String conversationId, {
    int limit = 200,
  }) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;

    final json = await _getMap(
      client,
      'users/$userId/conversations/$conversationId/messages',
      query: {'limit': limit},
    );
    if (json == null) return null;
    final list = json['Messages'];
    if (list is! List) return const <ChatMessage>[];
    return list
        .whereType<Map<String, dynamic>>()
        .map(ChatMessage.fromJson)
        .toList();
  }

  /// The plugin caps a message at 1000 characters and 20 a minute, and says so
  /// in the refusal.
  Future<SocialWrite<ChatMessage>> sendMessage(
    MediaServerClient client,
    String conversationId, {
    String text = '',
    String? attachmentId,
  }) => _social(
    client,
    'POST',
    'conversations/$conversationId/messages',
    body: {'Text': text, 'AttachmentId': ?attachmentId},
    read: (body) => _readMessage(body['Sent']),
  );

  Future<SocialWrite<ChatMessage>> editMessage(
    MediaServerClient client,
    String messageId,
    String text,
  ) => _social(
    client,
    'PATCH',
    'messages/$messageId',
    body: {'Text': text},
    read: (body) => _readMessage(body['Updated']),
  );

  Future<SocialWrite<void>> deleteMessage(
    MediaServerClient client,
    String messageId,
  ) => _social(client, 'DELETE', 'messages/by-id/$messageId');

  /// Empties the chat for everyone in it.
  Future<SocialWrite<void>> clearConversation(
    MediaServerClient client,
    String conversationId,
  ) => _social(client, 'DELETE', 'conversations/$conversationId/clear');

  /// A group needs at least two friends besides the signed-in user.
  Future<SocialWrite<ChatConversation>> createGroup(
    MediaServerClient client, {
    String? title,
    required List<String> memberIds,
  }) => _social(
    client,
    'POST',
    'conversations',
    body: {'Title': title, 'ParticipantIds': memberIds},
    read: (body) {
      final conversation = body['Conversation'];
      return conversation is Map<String, dynamic>
          ? ChatConversation.fromJson(conversation)
          : null;
    },
  );

  Future<SocialWrite<void>> renameGroup(
    MediaServerClient client,
    String conversationId,
    String title,
  ) => _social(
    client,
    'POST',
    'conversations/$conversationId/rename',
    body: {'Title': title},
  );

  Future<SocialWrite<void>> addGroupMember(
    MediaServerClient client,
    String conversationId,
    String userId,
  ) => _social(client, 'POST', 'conversations/$conversationId/members/$userId');

  /// Leaves the group when [userId] is the signed-in user.
  Future<SocialWrite<void>> removeGroupMember(
    MediaServerClient client,
    String conversationId,
    String userId,
  ) => _social(
    client,
    'DELETE',
    'conversations/$conversationId/members/$userId',
  );

  Future<SocialWrite<void>> setGroupAdmin(
    MediaServerClient client,
    String conversationId,
    String userId, {
    required bool admin,
  }) => _social(
    client,
    admin ? 'POST' : 'DELETE',
    'conversations/$conversationId/admins/$userId',
  );

  /// Blocking works both ways in a direct chat: neither side can message the
  /// other. The plugin doesn't check it in a group they share.
  Future<SocialWrite<void>> setBlocked(
    MediaServerClient client,
    String userId, {
    required bool blocked,
  }) => _social(client, blocked ? 'POST' : 'DELETE', 'block/$userId');

  Future<List<String>> fetchBlocked(MediaServerClient client) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return const <String>[];

    final json = await _getMap(client, 'users/$userId/blocked');
    final list = json?['Blocked'];
    return list is List ? list.whereType<String>().toList() : const <String>[];
  }

  /// Uploads an image to send. The plugin takes PNG, JPEG, GIF and WebP up to
  /// 8 MB, and checks the bytes match the type.
  Future<SocialWrite<String>> uploadAttachment(
    MediaServerClient client,
    Uint8List bytes, {
    required String fileName,
    required String mimeType,
  }) => _social(
    client,
    'POST',
    'attachments',
    body: FormData.fromMap({
      'file': MultipartFile.fromBytes(
        bytes,
        filename: fileName,
        contentType: DioMediaType.parse(mimeType),
      ),
    }),
    read: (body) {
      final attachment = body['Attachment'];
      final id = attachment is Map ? attachment['id'] : null;
      return id is String && id.isNotEmpty ? id : null;
    },
  );

  /// The image behind [attachmentId]. It needs the token, so it can't be a
  /// plain network image.
  Future<Uint8List?> fetchAttachment(
    MediaServerClient client,
    String attachmentId,
  ) async {
    final headers = _authHeaders(client);
    if (headers == null) return null;

    try {
      final response = await _dio.get<List<int>>(
        '${_base(client)}/$_root/attachments/$attachmentId',
        options: Options(headers: headers, responseType: ResponseType.bytes),
      );
      final data = response.data;
      return data == null ? null : Uint8List.fromList(data);
    } catch (e) {
      debugPrint('[AchievementsService] attachment failed: $e');
      return null;
    }
  }

  Future<SocialPrivacy?> fetchSocialPrivacy(MediaServerClient client) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;

    final json = await _getMap(client, 'users/$userId/preferences');
    return json == null ? null : SocialPrivacy.fromJson(json);
  }

  /// The plugin replaces its whole preferences object on save, so this reads a
  /// fresh copy first and only changes the friend settings in it.
  Future<bool> saveSocialPrivacy(
    MediaServerClient client,
    SocialPrivacy privacy,
  ) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return false;

    final current = await _getMap(client, 'users/$userId/preferences');
    if (current == null) return false;
    final written = await _post(
      client,
      'users/$userId/preferences',
      refusedWith: 400,
      body: privacy.applyTo(current),
    );
    if (written.body == null) return false;
    _messageNotifications = privacy.messageNotifications;
    return true;
  }

  ChatMessage? _readMessage(dynamic value) =>
      value is Map<String, dynamic> ? ChatMessage.fromJson(value) : null;

  /// One write on the signed-in user's friends or chat routes.
  ///
  /// A 429 means the plugin's rate limit, which is a refusal rather than a
  /// fault worth logging.
  Future<SocialWrite<T>> _social<T>(
    MediaServerClient client,
    String method,
    String path, {
    Object? body,
    T? Function(Map<String, dynamic> body)? read,
  }) async {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return SocialWrite<T>.failed();

    final written = await _post(
      client,
      'users/$userId/$path',
      refusedWith: 429,
      body: body,
      method: method,
    );
    final data = written.body;
    if (data == null) return SocialWrite<T>.failed(message: written.message);

    final ok = data['Success'] != false;
    final message = data['Message'];
    return SocialWrite<T>(
      ok,
      message: message is String && message.isNotEmpty ? message : null,
      value: ok ? read?.call(data) : null,
    );
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
