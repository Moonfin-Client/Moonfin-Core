import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/achievement_models.dart';
import 'package:moonfin/data/services/achievements_service.dart';
import 'package:server_core/server_core.dart';

import '../../support/achievement_plugin_fake.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AchievementPluginAdapter adapter;
  late AchievementsService service;
  late MockMediaServerClient client;

  setUp(() {
    adapter = AchievementPluginAdapter();
    final dio = Dio();
    dio.httpClientAdapter = adapter;
    service = AchievementsService(dio: dio);
    client = buildAchievementClient();
  });

  group('stats', () {
    test('records, the clock and the server come back together', () async {
      await service.refreshAvailability(client);

      final stats = await service.fetchStats(client);
      expect(stats.records['BestWatchStreak'], 21);
      expect(stats.records['LongestItemMinutes'], 201);
      expect(stats.watchClock[21], 40);
      expect(stats.server?.users, 6);
      expect(stats.server?.mostCommonBadge, 'First Contact');
    });

    test('privacy mode leaves the server figures unasked', () async {
      adapter.forcePrivacyMode = true;
      await service.refreshAvailability(client);

      final stats = await service.fetchStats(client);
      expect(stats.server, isNull);
      expect(stats.records, isNotEmpty);
      expect(
        adapter.requests.any((r) => r.contains('server/stats')),
        isFalse,
      );
    });
  });

  group('activity', () {
    test('the feed comes back newest first', () async {
      await service.refreshAvailability(client);

      final entries = await service.fetchActivity(client);
      expect(entries, hasLength(2));
      expect(entries.first.userName, 'Ada');
      expect(entries.first.badgeTitle, 'First Contact');
      expect(entries.first.rarity, 'Common');
    });

    test('an admin who turned the feed off is not asked for it', () async {
      adapter.activityFeedEnabled = false;
      await service.refreshAvailability(client);

      expect(await service.fetchActivity(client), isEmpty);
      expect(
        adapter.requests.any((r) => r.contains('activity-feed')),
        isFalse,
      );
    });
  });

  group('shop', () {
    test('only the power-ups are read from the catalogue', () async {
      final items = await service.fetchShopPowerUps(client);

      expect(items, hasLength(3));
      expect(items.first.id, 'pu-xp-boost-1');
      expect(items.first.priceScore, 50);
      expect(items[1].bundleSize, 3);
    });

    test('buying deducts from the bank and names the item', () async {
      final result = await service.buy(client, 'pu-xp-boost-3');

      expect(result.outcome, PurchaseOutcome.bought);
      expect(result.bankAfter, 1240 - 130);
      expect(adapter.lastBody, contains('pu-xp-boost-3'));
    });

    test('a bank too short is refused, not broken', () async {
      adapter.scoreBank = 10;

      final result = await service.buy(client, 'pu-streak-freeze-1');
      expect(result.outcome, PurchaseOutcome.refused);
      expect(result.message, 'Not enough score.');
    });

    test('what was bought lands in the inventory', () async {
      await service.buy(client, 'pu-xp-boost-3');

      final state = await service.fetchPowerUps(client);
      expect(state?.slots.firstWhere((s) => s.type == 'XpBoost').count, 5);
    });
  });

  group('loadout', () {
    test('the bank and the inventory come back together', () async {
      final state = await service.fetchPowerUps(client);

      expect(state?.bank, 1240);
      expect(state?.slots, hasLength(3));
      expect(
        state?.slots.firstWhere((s) => s.type == 'XpBoost').count,
        2,
      );
      expect(
        state?.slots.firstWhere((s) => s.type == 'DoubleCredit').count,
        0,
      );
    });

    test('spending one hands back the inventory it left', () async {
      final result = await service.usePowerUp(client, 'XpBoost');

      expect(result.outcome, PowerUpUseOutcome.used);
      expect(
        result.slots.firstWhere((s) => s.type == 'XpBoost').count,
        1,
      );
      expect(
        result.slots.firstWhere((s) => s.type == 'XpBoost').active,
        isTrue,
      );
    });

    test("an empty slot is refused in the plugin's own words", () async {
      final result = await service.usePowerUp(client, 'DoubleCredit');

      expect(result.outcome, PowerUpUseOutcome.refused);
      expect(result.message, 'None left.');
    });
  });

  group('badge suggestions', () {
    test('a badge carries its progress and what to watch', () async {
      final chase = await service.fetchBadgeChase(client, 'binge-titan');

      expect(chase?.current, 4);
      expect(chase?.target, 10);
      expect(chase?.items, hasLength(2));
      expect(chase?.items.first.name, 'Trolls Band Together');
      expect(chase?.items.first.runtimeMinutes, 91);
      expect(chase?.items.first.id, 'item-1');
    });

    test('a badge the plugin cannot recommend for comes back empty', () async {
      adapter.pluginMissing = true;

      expect(await service.fetchBadgeChase(client, 'binge-titan'), isNull);
    });
  });

  group('quest reroll', () {
    test('a reroll swaps the set and spends the allowance', () async {
      final result = await service.rerollQuests(client, weekly: false);

      expect(result.outcome, QuestRerollOutcome.rerolled);
      expect(result.quests.single.title, 'A fresh day');
      expect(result.rerollsLeft, 0);
      expect(
        adapter.requests,
        contains(
          'POST /Plugins/AchievementBadges/users/user1/quests/daily/reroll',
        ),
      );
    });

    test('daily and weekly spend separately', () async {
      await service.rerollQuests(client, weekly: false);

      final weekly = await service.rerollQuests(client, weekly: true);
      expect(weekly.outcome, QuestRerollOutcome.rerolled);
      expect(weekly.quests.single.title, 'A fresh week');
    });

    test('a spent reroll reads as refused rather than broken', () async {
      await service.rerollQuests(client, weekly: false);

      final again = await service.rerollQuests(client, weekly: false);
      expect(again.outcome, QuestRerollOutcome.alreadyUsed);
      expect(again.quests, isEmpty);
    });

    test('the overview carries what is left to spend', () async {
      adapter.weeklyRerollsLeft = 0;

      final overview = await service.loadOverview(client);
      expect(overview?.quests?.dailyRerollsLeft, 1);
      expect(overview?.quests?.weeklyRerollsLeft, 0);
    });
  });

  group('availability', () {
    test(
      'a server running the plugin is available and gets the login ping',
      () async {
        expect(await service.refreshAvailability(client), isTrue);
        expect(service.available, isTrue);

        // The ping is fired without being awaited, so let it land.
        await Future<void>.delayed(const Duration(milliseconds: 50));
        expect(
          adapter.requests,
          containsAllInOrder([
            'GET /Plugins/AchievementBadges/public-config',
            'POST /Plugins/AchievementBadges/users/user1/login-ping',
          ]),
        );
      },
    );

    test('a server without the plugin stays unavailable', () async {
      adapter.pluginMissing = true;

      expect(await service.refreshAvailability(client), isFalse);
      expect(service.available, isFalse);
      expect(adapter.requests, [
        'GET /Plugins/AchievementBadges/public-config',
      ]);
    });

    test('an Emby server is never probed', () async {
      final emby = buildAchievementClient(serverType: ServerType.emby);

      expect(await service.refreshAvailability(emby), isFalse);
      expect(adapter.requests, isEmpty);
    });

    test(
      'reset clears availability, so it can\'t survive a sign-out',
      () async {
        expect(await service.refreshAvailability(client), isTrue);

        service.reset();

        expect(service.available, isFalse);
      },
    );
  });

  group('overview', () {
    test('reads the plugin\'s PascalCase payloads', () async {
      await service.refreshAvailability(client);
      final overview = await service.loadOverview(client);

      expect(overview, isNotNull);
      expect(overview!.summary?.unlocked, 12);
      expect(overview.summary?.total, 200);
      expect(overview.summary?.bestWatchStreak, 9);
      expect(overview.rank?.tier.name, 'Viewer');
      expect(overview.rank?.nextTier?.name, 'Regular');
      expect(overview.rank?.isTopTier, isFalse);
      expect(overview.badges, hasLength(3));
      expect(overview.equipped, hasLength(1));
      expect(overview.quests?.daily, hasLength(1));
      expect(overview.quests?.weekly, isEmpty);
      expect(overview.leaderboard.single.userName, 'Ada');
      expect(overview.recap?.moviesWatched, 4);
      expect(overview.recap?.topGenres.single.name, 'Drama');
      expect(overview.libraryCompletion, {'Movies': 63, 'Shows': 12});
    });

    test(
      'a locked badge keeps its progress and an unlocked one its date',
      () async {
        await service.refreshAvailability(client);
        final overview = await service.loadOverview(client);

        final unlocked = overview!.badges.firstWhere(
          (b) => b.id == 'first-contact',
        );
        expect(unlocked.unlocked, isTrue);
        expect(unlocked.unlockedAt, isNotNull);
        expect(unlocked.progress, 1);
        expect(unlocked.score, 10);

        final locked = overview.badges.firstWhere((b) => b.id == 'binge-titan');
        expect(locked.unlocked, isFalse);
        // UnlockedAt is absent from the payload, not null.
        expect(locked.unlockedAt, isNull);
        expect(locked.progress, closeTo(0.4, 0.001));
        expect(locked.score, 60);
      },
    );

    test('a masked secret badge is recognized as one', () async {
      await service.refreshAvailability(client);
      final overview = await service.loadOverview(client);

      final secret = overview!.badges.firstWhere((b) => b.id == 'deep-cut');
      expect(secret.isSecret, isTrue);

      // An ordinary locked badge must not read as secret.
      expect(
        overview.badges.firstWhere((b) => b.id == 'binge-titan').isSecret,
        isFalse,
      );
    });

    test('sections the admin switched off are not even requested', () async {
      adapter
        ..leaderboardEnabled = false
        ..questsEnabled = false;
      await service.refreshAvailability(client);
      adapter.requests.clear();

      final overview = await service.loadOverview(client);

      expect(overview!.leaderboardEnabled, isFalse);
      expect(overview.questsEnabled, isFalse);
      expect(overview.quests, isNull);
      expect(overview.leaderboard, isEmpty);
      expect(adapter.requests.where((r) => r.contains('quests')), isEmpty);
      expect(adapter.requests.where((r) => r.contains('leaderboard')), isEmpty);
    });

    test('the catalogue is read once and kept', () async {
      await service.refreshAvailability(client);
      adapter.requests.clear();

      await service.loadOverview(client);
      await service.fetchCosmetics(client);

      expect(
        adapter.requests.where((r) => r.contains('shop/catalog')),
        hasLength(1),
      );
    });

    test('a plugin that answers nothing loads as nothing', () async {
      await service.refreshAvailability(client);
      adapter.pluginMissing = true;

      expect(await service.loadOverview(client), isNull);
    });

    test('a session without a user has nothing to load', () async {
      expect(
        await service.loadOverview(buildAchievementClient(userId: null)),
        isNull,
      );
      expect(adapter.requests, isEmpty);
    });

    test('a trailing slash on the server address doesn\'t double up', () async {
      final slashed = buildAchievementClient(baseUrl: 'http://badges.test/');
      await service.refreshAvailability(slashed);

      expect(
        adapter.requests.first,
        'GET /Plugins/AchievementBadges/public-config',
      );
    });
  });

  group('pickers', () {
    test('a category board carries a value instead of a score', () async {
      await service.refreshAvailability(client);

      final entries = await service.fetchLeaderboard(
        client,
        category: 'movies',
      );

      expect(entries.single.value, 42);
      expect(entries.single.score, isNull);
    });

    test('an empty category asks for the overall board', () async {
      await service.refreshAvailability(client);
      adapter.requests.clear();

      final entries = await service.fetchLeaderboard(client);

      expect(entries.single.score, 430);
      // The login ping can still be in flight, so look at the leaderboard
      // calls rather than at every request made.
      expect(adapter.requests.where((r) => r.contains('leaderboard')), [
        'GET /Plugins/AchievementBadges/leaderboard',
      ]);
    });

    test(
      'the leaderboard isn\'t fetched when the admin turned it off',
      () async {
        adapter.leaderboardEnabled = false;
        await service.refreshAvailability(client);
        adapter.requests.clear();

        expect(await service.fetchLeaderboard(client), isEmpty);
        expect(adapter.requests, isEmpty);
      },
    );

    test('the recap is refetched for the chosen period', () async {
      await service.refreshAvailability(client);

      final recap = await service.fetchRecap(client, 'year');

      expect(recap?.period, 'year');
      expect(recap?.daysWatched, 11);
    });
  });
}
