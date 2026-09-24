import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:server_core/server_core.dart';

/// A stand-in for a Jellyfin server running the Achievement Badges plugin,
/// shared by the service and panel tests.

class MockMediaServerClient extends Mock implements MediaServerClient {}

/// Answers the plugin's routes the way it does, with PascalCase properties and
/// null fields left out of the payload rather than written as null. Records
/// every request so tests can assert which ones ran.
class AchievementPluginAdapter implements HttpClientAdapter {
  final List<String> requests = [];

  /// Set when no plugin is installed, which answers 404 for every route.
  bool pluginMissing = false;

  /// The body of the last write, for asserting what was bought.
  String? lastBody;

  /// The plugin's admin switches.
  bool leaderboardEnabled = true;
  bool questsEnabled = true;
  bool activityFeedEnabled = true;

  /// Hides the server wide figures from everyone when an admin sets it.
  bool forcePrivacyMode = false;

  /// One reroll a day and one a week, the same budget the plugin grants.
  int dailyRerollsLeft = 1;
  int weeklyRerollsLeft = 1;

  /// Score left to spend, and one of each consumable except the empty slot
  /// that proves the disabled state.
  int scoreBank = 1240;
  final Map<String, int> powerUps = {
    'XpBoost': 2,
    'DoubleCredit': 0,
    'StreakFreeze': 1,
  };
  final Set<String> activePowerUps = {};

  /// A single and a discounted pack, so the pack wording has something to
  /// render, plus one item of another type.
  final List<Map<String, dynamic>> catalog = [
    {
      'Id': 'pu-xp-boost-1',
      'Type': 'XpBoost',
      'BundleSize': 1,
      'PriceScore': 50,
    },
    {
      'Id': 'pu-xp-boost-3',
      'Type': 'XpBoost',
      'BundleSize': 3,
      'PriceScore': 130,
    },
    {
      'Id': 'pu-streak-freeze-1',
      'Type': 'StreakFreeze',
      'BundleSize': 1,
      'PriceScore': 100,
    },
  ];

  /// A free one, one to buy, one the bank is short of, one that has to be
  /// earned, one whose catalogue icon is reused elsewhere, and a theme to
  /// prove the kinds this panel can't draw are dropped rather than listed.
  final List<Map<String, dynamic>> cosmetics = [
    {
      'Id': 'avatar-medal',
      'Kind': 'Avatar',
      'DisplayName': 'Medal',
      'PriceScore': 0,
      'MilestoneScore': 0,
      'PreviewIcon': 'military_tech',
    },
    {
      'Id': 'avatar-owl',
      'Kind': 'Avatar',
      'DisplayName': 'Night Owl',
      'PriceScore': 250,
      'MilestoneScore': 0,
      'PreviewIcon': 'nights_stay',
    },
    {
      'Id': 'avatar-diamond',
      'Kind': 'Avatar',
      'DisplayName': 'Diamond',
      'PriceScore': 4000,
      'MilestoneScore': 0,
      'PreviewIcon': 'diamond',
    },
    {
      'Id': 'avatar-clapper',
      'Kind': 'Avatar',
      'DisplayName': 'Clapperboard',
      'PriceScore': 250,
      'MilestoneScore': 0,
      'PreviewIcon': 'local_movies',
    },
    {
      'Id': 'title-cinephile',
      'Kind': 'RankTitle',
      'DisplayName': 'Cinephile',
      'PriceScore': 0,
      'MilestoneScore': 1000,
      'PreviewIcon': 'movie_filter',
    },
    {
      'Id': 'theme-sunset',
      'Kind': 'ProfileTheme',
      'DisplayName': 'Sunset',
      'PriceScore': 250,
      'MilestoneScore': 0,
      'PreviewIcon': 'wb_twilight',
    },
  ];

  /// How many badges the user has pinned to their profile.
  int equippedCount = 1;

  final Set<String> ownedCosmetics = {'avatar-medal'};
  String equippedAvatarId = '';
  String equippedTitleId = '';

  /// Short of the one milestone above, so it reads as still to be earned.
  int lifetimeScore = 600;

  List<Map<String, dynamic>> get _inventory => [
    for (final entry in powerUps.entries)
      {
        'Type': entry.key,
        'DisplayName': entry.key,
        'Description': 'Does a thing.',
        'Icon': 'bolt',
        'Count': entry.value,
        'Active': activePowerUps.contains(entry.key),
        'ActiveUntil': null,
      },
  ];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final path = options.uri.path;
    requests.add('${options.method} $path');

    // The purchase route is the only one that sends a body, and which item it
    // names is worth asserting on.
    if (requestStream != null) {
      final chunks = await requestStream.toList();
      if (chunks.isNotEmpty) {
        lastBody = utf8.decode(chunks.expand((c) => c).toList());
      }
    }

    if (pluginMissing) {
      return ResponseBody.fromString('', 404);
    }

    dynamic body;
    if (path.endsWith('/public-config')) {
      body = {
        'LeaderboardEnabled': leaderboardEnabled,
        'QuestsEnabled': questsEnabled,
        'ActivityFeedEnabled': activityFeedEnabled,
        'ForcePrivacyMode': forcePrivacyMode,
      };
    } else if (path.endsWith('/records')) {
      body = {
        'TotalItemsWatched': 412,
        'MoviesWatched': 88,
        'SeriesCompleted': 9,
        'TotalMinutesWatched': 25980,
        'TotalHoursWatched': 433,
        'DaysWatched': 120,
        'RewatchCount': 14,
        'BestWatchStreak': 21,
        'BestLoginStreak': 30,
        'MaxEpisodesInSingleDay': 12,
        'MaxMoviesInSingleDay': 4,
        'LongestItemMinutes': 201,
        'BestComboCount': 7,
        'LateNightSessions': 33,
        'EarlyMorningSessions': 8,
        'WeekendSessions': 96,
        'DaysLoggedIn': 140,
        'UniqueLibrariesVisited': 4,
        'UniqueGenresWatched': 19,
        'UniqueDecadesWatched': 6,
        'UniqueCountriesWatched': 11,
        'UniqueLanguagesWatched': 5,
      };
    } else if (path.endsWith('/watch-clock')) {
      // Keys arrive as strings even though they are hours.
      body = {for (var h = 0; h < 24; h++) '$h': h == 21 ? 40 : h};
    } else if (path.endsWith('/server/stats')) {
      body = {
        'TotalUsers': 6,
        'TotalBadgesUnlocked': 143,
        'TotalItemsWatched': 2100,
        'TotalMoviesWatched': 300,
        'TotalSeriesCompleted': 41,
        'MostCommonBadge': 'First Contact',
        'TotalAchievementScore': 5400,
      };
    } else if (path.endsWith('/activity-feed')) {
      // Timed off now so the relative labels the panel draws stay predictable.
      final now = DateTime.now();
      body = {
        'Page': 1,
        'PageSize': 30,
        'TotalPages': 1,
        'TotalEntries': 2,
        'Entries': [
          {
            'At': now
                .subtract(const Duration(hours: 2))
                .toUtc()
                .toIso8601String(),
            'UserId': 'user1',
            'UserName': 'Ada',
            'BadgeId': 'first-contact',
            'Title': 'First Contact',
            'Rarity': 'Common',
            'Icon': 'rocket_launch',
            'Category': 'Getting Started',
          },
          {
            'At': now
                .subtract(const Duration(days: 3))
                .toUtc()
                .toIso8601String(),
            'UserId': 'user2',
            'UserName': 'Grace',
            'BadgeId': 'binge-titan',
            'Title': 'Binge Titan',
            'Rarity': 'Epic',
            'Icon': 'bolt',
            'Category': 'Binge',
          },
        ],
      };
    } else if (path.endsWith('/shop/catalog')) {
      body = {'PowerUps': catalog, 'Cosmetics': cosmetics};
    } else if (path.endsWith('/shop/purchase')) {
      final itemId = (jsonDecode(lastBody ?? '{}') as Map)['ItemId'];
      final item = [...catalog, ...cosmetics].firstWhere(
        (i) => i['Id'] == itemId,
        orElse: () => <String, dynamic>{},
      );
      final price = (item['PriceScore'] as int?) ?? 0;
      if (item.isEmpty || price > scoreBank) {
        return ResponseBody.fromString(
          jsonEncode({'Message': 'Not enough score.'}),
          400,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
      }
      scoreBank -= price;
      final type = item['Type'] as String?;
      // Only a power-up carries a type. A cosmetic lands in the wardrobe.
      if (type == null) {
        ownedCosmetics.add(itemId as String);
        body = {
          'Success': true,
          'Message': 'Bought.',
          'ScoreBalanceAfter': scoreBank,
          'OwnedCosmeticId': itemId,
        };
      } else {
        powerUps[type] = (powerUps[type] ?? 0) + (item['BundleSize'] as int);
        body = {
          'Success': true,
          'Message': 'Bought.',
          'ScoreBalanceAfter': scoreBank,
          'PowerUpInventoryAfter': powerUps[type],
        };
      }
    } else if (path.endsWith('/cosmetics/equip')) {
      final id = (jsonDecode(lastBody ?? '{}') as Map)['CosmeticId'];
      if (!ownedCosmetics.contains(id)) {
        return ResponseBody.fromString(
          jsonEncode({'Message': 'Not owned.'}),
          400,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
      }
      final item = cosmetics.firstWhere((c) => c['Id'] == id);
      if (item['Kind'] == 'Avatar') {
        equippedAvatarId = id as String;
      } else {
        equippedTitleId = id as String;
      }
      body = {
        'Message': 'Equipped.',
        'EquippedAvatarId': equippedAvatarId,
        'EquippedCustomTitleId': equippedTitleId,
      };
    } else if (path.endsWith('/cosmetics/unequip')) {
      final kind = options.uri.queryParameters['kind'];
      if (kind == 'Avatar') {
        equippedAvatarId = '';
      } else if (kind == 'RankTitle') {
        equippedTitleId = '';
      } else {
        return ResponseBody.fromString(
          jsonEncode({'Message': 'Unknown kind.'}),
          400,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
      }
      body = {'Message': 'Removed.'};
    } else if (path.endsWith('/cosmetics')) {
      body = {
        'Owned': ownedCosmetics.toList(),
        'EquippedAvatarId': equippedAvatarId,
        'EquippedCustomTitleId': equippedTitleId,
        'LifetimeScore': lifetimeScore,
        'ScoreBank': scoreBank,
      };
    } else if (path.contains('/powerups/use/')) {
      final type = path.split('/').last;
      final held = powerUps[type] ?? 0;
      if (held <= 0) {
        return ResponseBody.fromString(
          jsonEncode({'Message': 'None left.'}),
          400,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
      }
      powerUps[type] = held - 1;
      activePowerUps.add(type);
      body = {'Message': 'Used.', 'Inventory': _inventory};
    } else if (path.endsWith('/powerups')) {
      body = {'ScoreBank': scoreBank, 'Inventory': _inventory};
    } else if (path.contains('/chase/')) {
      body = {
        'BadgeId': path.split('/').last,
        'Progress': {'Current': 4, 'Target': 10},
        'Items': [
          {
            'Id': 'item-1',
            'Name': 'Trolls Band Together',
            'Type': 'Movie',
            'Year': 2023,
            'RunTimeMinutes': 91,
          },
          {
            'Id': 'item-2',
            'Name': 'Beef',
            'Type': 'Episode',
            'Year': 2026,
            'RunTimeMinutes': 24,
          },
        ],
      };
    } else if (path.endsWith('/login-ping')) {
      body = {'Success': true};
    } else if (path.endsWith('/quests/daily/reroll') ||
        path.endsWith('/quests/weekly/reroll')) {
      final weekly = path.endsWith('/quests/weekly/reroll');
      final left = weekly ? weeklyRerollsLeft : dailyRerollsLeft;
      if (left <= 0) {
        return ResponseBody.fromString(
          jsonEncode({'Message': 'Already used.'}),
          429,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
      }
      if (weekly) {
        weeklyRerollsLeft = 0;
      } else {
        dailyRerollsLeft = 0;
      }
      body = {
        'Message': 'Rerolled.',
        'RerollsUsed': 1,
        'RerollsRemaining': 0,
        'Quests': [
          {
            'Kind': weekly ? 'weekly' : 'daily',
            'Id': weekly ? 'weekly-fresh' : 'daily-fresh',
            'Title': weekly ? 'A fresh week' : 'A fresh day',
            'Description': 'Rerolled quest.',
            'Icon': 'refresh',
            'Reward': 30,
            'Target': 2,
            'Current': 0,
            'Completed': false,
          },
        ],
      };
    } else if (path.endsWith('/summary')) {
      body = {
        'Unlocked': 12,
        'Total': 200,
        'Percentage': 6.0,
        'EquippedCount': 1,
        'Score': 430,
        'CurrentWatchStreak': 3,
        'BestWatchStreak': 9,
      };
    } else if (path.endsWith('/rank')) {
      body = {
        'Score': 430,
        'Tier': {
          'Name': 'Viewer',
          'MinScore': 300,
          'Color': '#2196f3',
          'Icon': 'visibility',
        },
        'NextTier': {
          'Name': 'Regular',
          'MinScore': 700,
          'Color': '#03a9f4',
          'Icon': 'person',
        },
        'ProgressToNext': 32,
        'Tiers': const <dynamic>[],
      };
    } else if (path.endsWith('/equipped')) {
      body = [
        for (var i = 0; i < equippedCount - 1; i++)
          {
            'Id': 'pinned-$i',
            'Title': 'Pinned badge $i',
            'Description': 'A badge the user pinned.',
            'Icon': 'rocket_launch',
            'Category': 'Getting Started',
            'Rarity': 'Common',
            'Unlocked': true,
            'UnlockedAt': '2026-09-01T10:00:00.0000000+00:00',
            'CurrentValue': 1,
            'TargetValue': 1,
          },
        if (equippedCount > 0)
          {
            'Id': 'first-contact',
          'Title': 'First Contact',
          'Description': 'Watch your first item.',
          'Icon': 'rocket_launch',
          'Category': 'Getting Started',
          'Rarity': 'Common',
          'Unlocked': true,
          'UnlockedAt': '2026-09-01T10:00:00.0000000+00:00',
          'CurrentValue': 1,
          'TargetValue': 1,
        },
      ];
    } else if (path.endsWith('/quests')) {
      body = {
        'Daily': [
          {
            'Kind': 'daily',
            'Id': 'daily-watch',
            'Title': 'Watch something',
            'Description': 'Finish one item today.',
            'Icon': 'play_circle',
            'Reward': 25,
            'Target': 1,
            'Current': 0,
            'Completed': false,
          },
        ],
        'Weekly': const <dynamic>[],
        'DailyRerollsRemaining': dailyRerollsLeft,
        'WeeklyRerollsRemaining': weeklyRerollsLeft,
      };
    } else if (path.endsWith('/leaderboard')) {
      body = [
        {
          'UserId': 'user1',
          'UserName': 'Ada',
          'Unlocked': 12,
          'Total': 200,
          'Percentage': 6.0,
          'Score': 430,
          'BestWatchStreak': 9,
          'Equipped': const <dynamic>[],
        },
      ];
    } else if (path.contains('/leaderboard/')) {
      body = [
        {
          'UserId': 'user1',
          'UserName': 'Ada',
          'Value': 42,
          'Equipped': const <dynamic>[],
        },
      ];
    } else if (path.endsWith('/recap')) {
      body = {
        'Period': options.uri.queryParameters['period'],
        'Days': 30,
        'MoviesWatched': 4,
        'EpisodesWatched': 18,
        'TotalItems': 22,
        'DaysWatched': 11,
        'BadgesUnlocked': 2,
        'TopGenres': [
          {'Name': 'Drama', 'Count': 9},
        ],
        'TopDirectors': const <dynamic>[],
        'TopActors': const <dynamic>[],
      };
    } else if (path.endsWith('/library-completion')) {
      body = {
        'LibraryCompletionPercents': {'Movies': 63, 'Shows': 12},
      };
    } else if (path.endsWith('/users/user1')) {
      body = [
        {
          'Id': 'first-contact',
          'Title': 'First Contact',
          'Description': 'Watch your first item.',
          'Icon': 'rocket_launch',
          'Category': 'Getting Started',
          'Rarity': 'Common',
          'Unlocked': true,
          'UnlockedAt': '2026-09-01T10:00:00.0000000+00:00',
          'CurrentValue': 1,
          'TargetValue': 1,
        },
        {
          'Id': 'binge-titan',
          'Title': 'Binge Titan',
          'Description': 'Watch 10 episodes in a day.',
          'Icon': 'bolt',
          'Category': 'Binge',
          'Rarity': 'Epic',
          'Unlocked': false,
          'CurrentValue': 4,
          'TargetValue': 10,
        },
        {
          // A locked secret badge. The server masks it and never sends
          // a flag saying so.
          'Id': 'deep-cut',
          'Title': '???',
          'Description': 'Hidden achievement, keep watching to discover it.',
          'Icon': 'help',
          'Category': 'Hidden',
          'Rarity': 'Mythic',
          'Unlocked': false,
          'CurrentValue': 0,
          'TargetValue': 1,
        },
      ];
    }

    if (body == null) {
      return ResponseBody.fromString('', 404);
    }
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

/// A signed-in client pointed at the fake server.
MockMediaServerClient buildAchievementClient({
  ServerType serverType = ServerType.jellyfin,
  String baseUrl = 'http://badges.test',
  String? token = 'token',
  String? userId = 'user1',
}) {
  final mock = MockMediaServerClient();
  when(() => mock.baseUrl).thenReturn(baseUrl);
  when(() => mock.accessToken).thenReturn(token);
  when(() => mock.userId).thenReturn(userId);
  when(() => mock.serverType).thenReturn(serverType);
  when(() => mock.deviceInfo).thenReturn(
    const DeviceInfo(
      id: 'dev1',
      name: 'test',
      appName: 'moonfin',
      appVersion: '0.0.0',
    ),
  );
  return mock;
}
