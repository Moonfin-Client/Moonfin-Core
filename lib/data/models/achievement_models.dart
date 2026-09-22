/// Models for the Achievement Badges plugin.
///
/// The plugin writes PascalCase names and leaves a null property out of the
/// payload instead of writing it, so anything the server can omit is nullable
/// here. Admins can author badges with any category, rarity or icon string,
/// which is why none of those are enums.
library;

int _asInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.round();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

double _asDouble(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0;
  return 0;
}

String _asString(dynamic value) => value is String ? value : '';

/// A string field the server leaves blank when it means nothing is set.
String? _nonEmpty(dynamic value) {
  final text = _asString(value);
  return text.isEmpty ? null : text;
}

/// Every array the plugin sends is a list of objects, and a missing one comes
/// through as null rather than an empty array.
List<T> _mapList<T>(dynamic value, T Function(Map<String, dynamic>) from) {
  if (value is! List) return <T>[];
  return value.whereType<Map<String, dynamic>>().map(from).toList();
}

bool _asBool(dynamic value) => value is bool ? value : false;

DateTime? _asDate(dynamic value) {
  if (value is! String || value.isEmpty) return null;
  return DateTime.tryParse(value)?.toLocal();
}

/// Points a badge is worth. The plugin works this out from rarity instead of
/// storing it per badge, so the table has to be repeated here.
int _scoreForRarity(String rarity) {
  switch (rarity.trim().toLowerCase()) {
    case 'uncommon':
      return 20;
    case 'rare':
      return 35;
    case 'epic':
      return 60;
    case 'legendary':
      return 100;
    case 'mythic':
      return 150;
    default:
      return 10;
  }
}

class AchievementSummary {
  const AchievementSummary({
    required this.unlocked,
    required this.total,
    required this.percentage,
    required this.score,
    required this.currentWatchStreak,
    required this.bestWatchStreak,
  });

  final int unlocked;
  final int total;
  final double percentage;
  final int score;
  final int currentWatchStreak;
  final int bestWatchStreak;

  factory AchievementSummary.fromJson(Map<String, dynamic> json) {
    return AchievementSummary(
      unlocked: _asInt(json['Unlocked']),
      total: _asInt(json['Total']),
      percentage: _asDouble(json['Percentage']),
      score: _asInt(json['Score']),
      currentWatchStreak: _asInt(json['CurrentWatchStreak']),
      bestWatchStreak: _asInt(json['BestWatchStreak']),
    );
  }
}

class RankTier {
  const RankTier({
    required this.name,
    required this.minScore,
    required this.color,
    required this.icon,
  });

  final String name;
  final int minScore;

  /// Hex string as the plugin writes it, such as `#ffd700`.
  final String color;
  final String icon;

  factory RankTier.fromJson(Map<String, dynamic> json) {
    return RankTier(
      name: _asString(json['Name']),
      minScore: _asInt(json['MinScore']),
      color: _asString(json['Color']),
      icon: _asString(json['Icon']),
    );
  }
}

class AchievementRank {
  const AchievementRank({
    required this.score,
    required this.tier,
    required this.nextTier,
    required this.progressToNext,
  });

  final int score;
  final RankTier tier;

  /// Left out of the payload once the user reaches the top tier.
  final RankTier? nextTier;

  /// 0 to 100, and 100 at the top tier.
  final int progressToNext;

  bool get isTopTier => nextTier == null;

  factory AchievementRank.fromJson(Map<String, dynamic> json) {
    final tier = json['Tier'];
    final next = json['NextTier'];

    return AchievementRank(
      score: _asInt(json['Score']),
      tier: tier is Map<String, dynamic>
          ? RankTier.fromJson(tier)
          : const RankTier(name: '', minScore: 0, color: '', icon: ''),
      nextTier: next is Map<String, dynamic> ? RankTier.fromJson(next) : null,
      progressToNext: _asInt(json['ProgressToNext']),
    );
  }
}

class AchievementBadge {
  const AchievementBadge({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.category,
    required this.rarity,
    required this.unlocked,
    required this.unlockedAt,
    required this.currentValue,
    required this.targetValue,
  });

  final String id;
  final String title;
  final String description;

  /// A Material Icons name, not an emoji or a URL.
  final String icon;
  final String category;
  final String rarity;
  final bool unlocked;
  final DateTime? unlockedAt;
  final int currentValue;
  final int targetValue;

  /// The plugin never sends the secret flag. It masks a locked secret badge's
  /// title instead, and that mask is all a client gets to go on.
  bool get isSecret => !unlocked && title.trim() == '???';

  /// Whether the server blanked the description under spoiler mode.
  bool get descriptionHidden => !unlocked && description.trim() == '???';

  int get score => _scoreForRarity(rarity);

  /// 0 to 1. Target is 0 on badges that are just a flag.
  double get progress {
    if (unlocked) return 1;
    if (targetValue <= 0) return 0;
    return (currentValue / targetValue).clamp(0.0, 1.0);
  }

  factory AchievementBadge.fromJson(Map<String, dynamic> json) {
    return AchievementBadge(
      id: _asString(json['Id']),
      title: _asString(json['Title']),
      description: _asString(json['Description']),
      icon: _asString(json['Icon']),
      category: _asString(json['Category']),
      rarity: _asString(json['Rarity']),
      unlocked: _asBool(json['Unlocked']),
      unlockedAt: _asDate(json['UnlockedAt']),
      currentValue: _asInt(json['CurrentValue']),
      targetValue: _asInt(json['TargetValue']),
    );
  }
}

class AchievementQuest {
  const AchievementQuest({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.reward,
    required this.target,
    required this.current,
    required this.completed,
  });

  final String id;
  final String title;
  final String description;
  final String icon;

  /// Score points the quest pays out.
  final int reward;
  final int target;
  final int current;
  final bool completed;

  double get progress {
    if (completed) return 1;
    if (target <= 0) return 0;
    return (current / target).clamp(0.0, 1.0);
  }

  factory AchievementQuest.fromJson(Map<String, dynamic> json) {
    return AchievementQuest(
      id: _asString(json['Id']),
      title: _asString(json['Title']),
      description: _asString(json['Description']),
      icon: _asString(json['Icon']),
      reward: _asInt(json['Reward']),
      target: _asInt(json['Target']),
      current: _asInt(json['Current']),
      completed: _asBool(json['Completed']),
    );
  }
}

class AchievementQuests {
  const AchievementQuests({
    required this.daily,
    required this.weekly,
    this.dailyRerollsLeft = 0,
    this.weeklyRerollsLeft = 0,
  });

  final List<AchievementQuest> daily;
  final List<AchievementQuest> weekly;

  /// The plugin grants one reroll per UTC day and one per ISO week, so these
  /// are only ever 1 or 0.
  final int dailyRerollsLeft;
  final int weeklyRerollsLeft;

  bool get isEmpty => daily.isEmpty && weekly.isEmpty;

  AchievementQuests copyWith({
    List<AchievementQuest>? daily,
    List<AchievementQuest>? weekly,
    int? dailyRerollsLeft,
    int? weeklyRerollsLeft,
  }) => AchievementQuests(
    daily: daily ?? this.daily,
    weekly: weekly ?? this.weekly,
    dailyRerollsLeft: dailyRerollsLeft ?? this.dailyRerollsLeft,
    weeklyRerollsLeft: weeklyRerollsLeft ?? this.weeklyRerollsLeft,
  );

  /// Reads either the quest arrays on the overview or the replacement list a
  /// reroll answers with, which carry the same shape.
  static List<AchievementQuest> parseList(dynamic value) =>
      _mapList(value, AchievementQuest.fromJson);

  factory AchievementQuests.fromJson(Map<String, dynamic> json) {
    return AchievementQuests(
      daily: parseList(json['Daily']),
      weekly: parseList(json['Weekly']),
      dailyRerollsLeft: (json['DailyRerollsRemaining'] as num?)?.toInt() ?? 0,
      weeklyRerollsLeft: (json['WeeklyRerollsRemaining'] as num?)?.toInt() ?? 0,
    );
  }
}

/// One thing to watch that would move a badge along.
class ChaseItem {
  const ChaseItem({
    required this.id,
    required this.name,
    required this.type,
    required this.year,
    required this.runtimeMinutes,
  });

  final String id;
  final String name;

  /// Jellyfin's own type name, such as `Movie` or `Episode`.
  final String type;

  /// Zero when the server holds no year or runtime for the item.
  final int year;
  final int runtimeMinutes;

  factory ChaseItem.fromJson(Map<String, dynamic> json) {
    return ChaseItem(
      id: _asString(json['Id']),
      name: _asString(json['Name']),
      type: _asString(json['Type']),
      year: _asInt(json['Year']),
      runtimeMinutes: _asInt(json['RunTimeMinutes']),
    );
  }
}

/// What the plugin suggests watching for one badge.
///
/// An empty [items] is a normal answer. The plugin only recommends against
/// metrics it can turn into a library query, and says so for the rest.
class BadgeChase {
  const BadgeChase({
    required this.current,
    required this.target,
    required this.items,
  });

  final int current;
  final int target;
  final List<ChaseItem> items;

  factory BadgeChase.fromJson(Map<String, dynamic> json) {
    final raw = json['Progress'];
    final progress = raw is Map<String, dynamic>
        ? raw
        : const <String, dynamic>{};
    return BadgeChase(
      current: _asInt(progress['Current']),
      target: _asInt(progress['Target']),
      items: _mapList(json['Items'], ChaseItem.fromJson),
    );
  }
}

/// How a reroll attempt ended.
///
/// A spent reroll is a refusal the panel reports plainly, not a fault.
enum QuestRerollOutcome { rerolled, alreadyUsed, failed }

class QuestReroll {
  const QuestReroll(
    this.outcome, {
    this.quests = const <AchievementQuest>[],
    this.rerollsLeft = 0,
  });

  final QuestRerollOutcome outcome;

  /// The replacement set, so a reroll needs no second fetch.
  final List<AchievementQuest> quests;
  final int rerollsLeft;
}

/// One consumable the user holds.
///
/// The server also sends a name and a description, both English only, so the
/// panel names the three types itself and takes just the icon.
class PowerUpSlot {
  const PowerUpSlot({
    required this.type,
    required this.icon,
    required this.count,
    required this.active,
    required this.activeUntil,
  });

  /// `XpBoost`, `DoubleCredit` or `StreakFreeze`, which is also what the use
  /// route takes.
  final String type;
  final String icon;
  final int count;

  /// Running, pending or banked, depending on which consumable this is.
  final bool active;

  /// Set only on the boost, which is the only one that expires.
  final DateTime? activeUntil;

  factory PowerUpSlot.fromJson(Map<String, dynamic> json) {
    return PowerUpSlot(
      type: _asString(json['Type']),
      icon: _asString(json['Icon']),
      count: _asInt(json['Count']),
      active: _asBool(json['Active']),
      activeUntil: _asDate(json['ActiveUntil']),
    );
  }
}

/// The score bank and what it has already bought.
class PowerUpState {
  const PowerUpState({required this.bank, required this.slots});

  /// Score left to spend, which isn't the same as the score a rank is
  /// measured on.
  final int bank;
  final List<PowerUpSlot> slots;

  /// The inventory array, which both the read and the spend answer with.
  static List<PowerUpSlot> parseSlots(dynamic value) =>
      _mapList(value, PowerUpSlot.fromJson);

  factory PowerUpState.fromJson(Map<String, dynamic> json) {
    return PowerUpState(
      bank: _asInt(json['ScoreBank']),
      slots: parseSlots(json['Inventory']),
    );
  }
}

/// How spending a power-up ended.
///
/// The plugin refuses with 400 when there is none left or the boost is already
/// running, which is an answer rather than a fault.
enum PowerUpUseOutcome { used, refused, failed }

class PowerUpUse {
  const PowerUpUse(
    this.outcome, {
    this.message,
    this.slots = const <PowerUpSlot>[],
  });

  final PowerUpUseOutcome outcome;

  /// The plugin's own wording for a refusal.
  final String? message;

  /// The inventory as it stands after the spend.
  final List<PowerUpSlot> slots;
}

/// Everything the stats screen shows.
class AchievementStats {
  const AchievementStats({
    required this.records,
    required this.watchClock,
    required this.server,
  });

  /// Counters keyed the way the plugin names them, such as `BestWatchStreak`.
  /// Keeping the map rather than naming all twenty-seven means a counter the
  /// plugin adds later needs a label here and nothing else.
  final Map<String, int> records;

  /// Hour of the day, 0 to 23, against how much was watched in it.
  final Map<int, int> watchClock;

  /// Null when an admin has the server figures switched off.
  final ServerStats? server;

  bool get isEmpty => records.isEmpty && watchClock.isEmpty && server == null;

  /// Reads a flat object of counters, dropping anything that isn't a number.
  static Map<String, int> parseCounters(Map<String, dynamic>? json) {
    if (json == null) return const <String, int>{};
    final out = <String, int>{};
    json.forEach((key, value) {
      if (value is num) out[key] = value.round();
    });
    return out;
  }

  /// Reads the clock, whose keys arrive as strings even though they are hours.
  static Map<int, int> parseWatchClock(Map<String, dynamic>? json) {
    if (json == null) return const <int, int>{};
    final out = <int, int>{};
    json.forEach((key, value) {
      final hour = int.tryParse(key);
      if (hour != null && value is num) out[hour] = value.round();
    });
    return out;
  }
}

/// How the whole server is doing, which an admin can hide.
class ServerStats {
  const ServerStats({
    required this.users,
    required this.badgesUnlocked,
    required this.itemsWatched,
    required this.moviesWatched,
    required this.seriesCompleted,
    required this.score,
    required this.mostCommonBadge,
  });

  final int users;
  final int badgesUnlocked;
  final int itemsWatched;
  final int moviesWatched;
  final int seriesCompleted;
  final int score;
  final String mostCommonBadge;

  factory ServerStats.fromJson(Map<String, dynamic> json) {
    return ServerStats(
      users: _asInt(json['TotalUsers']),
      badgesUnlocked: _asInt(json['TotalBadgesUnlocked']),
      itemsWatched: _asInt(json['TotalItemsWatched']),
      moviesWatched: _asInt(json['TotalMoviesWatched']),
      seriesCompleted: _asInt(json['TotalSeriesCompleted']),
      score: _asInt(json['TotalAchievementScore']),
      mostCommonBadge: _asString(json['MostCommonBadge']),
    );
  }
}

/// One badge someone on this server unlocked.
class ActivityEntry {
  const ActivityEntry({
    required this.at,
    required this.userName,
    required this.badgeTitle,
    required this.rarity,
    required this.icon,
  });

  final DateTime? at;
  final String userName;
  final String badgeTitle;
  final String rarity;
  final String icon;

  factory ActivityEntry.fromJson(Map<String, dynamic> json) {
    return ActivityEntry(
      at: _asDate(json['At']),
      userName: _asString(json['UserName']),
      badgeTitle: _asString(json['Title']),
      rarity: _asString(json['Rarity']),
      icon: _asString(json['Icon']),
    );
  }

  static List<ActivityEntry> parseFeed(Map<String, dynamic> json) =>
      _mapList(json['Entries'], ActivityEntry.fromJson);
}

/// One thing the shop sells.
///
/// The name and description the catalogue carries are English only, so only
/// the type, the pack size and the price are read.
class ShopPowerUp {
  const ShopPowerUp({
    required this.id,
    required this.type,
    required this.bundleSize,
    required this.priceScore,
  });

  final String id;

  /// Matches [PowerUpSlot.type], which is how a row finds its own wording.
  final String type;

  /// More than one on the discounted packs.
  final int bundleSize;
  final int priceScore;

  factory ShopPowerUp.fromJson(Map<String, dynamic> json) {
    return ShopPowerUp(
      id: _asString(json['Id']),
      type: _asString(json['Type']),
      bundleSize: _asInt(json['BundleSize']),
      priceScore: _asInt(json['PriceScore']),
    );
  }

  /// The catalogue carries cosmetics too, which [Cosmetic.parseCatalog]
  /// reads from the same payload.
  static List<ShopPowerUp> parseCatalog(Map<String, dynamic> json) =>
      _mapList(json['PowerUps'], ShopPowerUp.fromJson);
}

/// How a purchase ended.
enum PurchaseOutcome { bought, refused, failed }

class Purchase {
  const Purchase(this.outcome, {this.message, this.bankAfter});

  final PurchaseOutcome outcome;

  /// The plugin's own wording for a refusal.
  final String? message;

  /// What the bank holds now, so nothing has to be fetched again.
  final int? bankAfter;
}

/// Which part of the profile a cosmetic dresses.
///
/// The plugin sells six kinds. These two are the ones whose id carries data,
/// an icon name and a title, so they are the two that can be drawn natively.
/// The other four name CSS rules only the plugin's own page ships, and
/// selling those here would equip something nobody could see.
enum CosmeticKind {
  avatar('Avatar'),
  rankTitle('RankTitle');

  const CosmeticKind(this.wireName);

  /// What the plugin calls it, which is also what unequip asks for back.
  final String wireName;

  static CosmeticKind? parse(String value) {
    for (final kind in CosmeticKind.values) {
      if (kind.wireName == value) return kind;
    }
    return null;
  }
}

/// Closer icons than the ones the catalogue carries.
///
/// The plugin picks its icons for its own page and gives several cosmetics
/// the same one, so a crown, a unicorn and a tastemaker all arrive as plain
/// sparkles. These name a nearer match where Material has one. An id absent
/// from here keeps whatever the server sent, which is what anything added in
/// a later release will do.
const Map<String, String> _closerIcons = <String, String>{
  'avatar-clapper': 'movie_creation',
  'avatar-crown': 'crown',
  'avatar-dragon': 'whatshot',
  'avatar-owl': 'owl',
  'avatar-popcorn': 'fastfood',
  'avatar-unicorn': 'auto_fix_high',
  'title-archivist': 'archive',
  'title-tastemaker': 'trending_up',
};

/// One avatar or rank title a profile can wear.
class Cosmetic {
  const Cosmetic({
    required this.id,
    required this.kind,
    required this.name,
    required this.icon,
    required this.priceScore,
    required this.milestoneScore,
  });

  final String id;
  final CosmeticKind kind;

  /// English, the way the catalogue writes it. A release can add more, so
  /// there is nothing fixed here to translate against.
  final String name;

  /// A Material Icons name, which every one of them carries. This is the
  /// catalogue's own unless [_closerIcons] names a better one.
  final String icon;
  final int priceScore;

  /// Lifetime score that earns it rather than buying it, and zero on
  /// everything that is only ever bought.
  final int milestoneScore;

  bool get isEarned => milestoneScore > 0;

  /// Free to everyone, so it is the slot's starting look and not stock.
  bool get isDefault => priceScore == 0 && milestoneScore == 0;

  factory Cosmetic.fromJson(Map<String, dynamic> json, CosmeticKind kind) {
    final id = _asString(json['Id']);
    return Cosmetic(
      id: id,
      kind: kind,
      name: _asString(json['DisplayName']),
      icon: _closerIcons[id] ?? _asString(json['PreviewIcon']),
      priceScore: _asInt(json['PriceScore']),
      milestoneScore: _asInt(json['MilestoneScore']),
    );
  }

  /// Reads the catalogue, keeping the kinds this can draw.
  static List<Cosmetic> parseCatalog(Map<String, dynamic> json) {
    final entries = json['Cosmetics'];
    if (entries is! List) return const <Cosmetic>[];

    final result = <Cosmetic>[];
    for (final entry in entries) {
      if (entry is! Map<String, dynamic>) continue;
      final kind = CosmeticKind.parse(_asString(entry['Kind']));
      if (kind != null) result.add(Cosmetic.fromJson(entry, kind));
    }
    return result;
  }
}

/// What a profile wears, against the catalogue that names it.
class CosmeticLoadout {
  const CosmeticLoadout({
    required this.avatars,
    required this.titles,
    required this.owned,
    required this.avatarId,
    required this.titleId,
    required this.lifetimeScore,
    required this.bank,
  });

  final List<Cosmetic> avatars;
  final List<Cosmetic> titles;

  /// Ids the profile holds. The plugin fills in the free ones and any
  /// milestone the score has already passed, so this is the whole answer.
  final Set<String> owned;

  final String? avatarId;
  final String? titleId;

  /// Score earned over the life of the profile, which is what a milestone
  /// measures against. Not [bank], which is only what is left unspent.
  final int lifetimeScore;
  final int bank;

  bool get isEmpty => avatars.isEmpty && titles.isEmpty;

  bool has(Cosmetic item) => item.isDefault || owned.contains(item.id);

  List<Cosmetic> items(CosmeticKind kind) =>
      kind == CosmeticKind.avatar ? avatars : titles;

  String? equipped(CosmeticKind kind) =>
      kind == CosmeticKind.avatar ? avatarId : titleId;

  /// The icon the rank header draws, or null to keep the tier's own.
  String? get avatarIcon => _look(avatars, avatarId)?.icon;

  /// The name that stands in for the tier's, or null to keep it.
  String? get customTitle => _look(titles, titleId)?.name;

  static Cosmetic? _look(List<Cosmetic> items, String? id) {
    if (id == null) return null;
    for (final item in items) {
      if (item.id == id) return item;
    }
    return null;
  }

  /// The same loadout with [kind]'s slot filled by [id], or emptied by null.
  CosmeticLoadout wearing(CosmeticKind kind, String? id) => CosmeticLoadout(
    avatars: avatars,
    titles: titles,
    owned: owned,
    avatarId: kind == CosmeticKind.avatar ? id : avatarId,
    titleId: kind == CosmeticKind.rankTitle ? id : titleId,
    lifetimeScore: lifetimeScore,
    bank: bank,
  );

  /// The same loadout holding [id], with what the bank has left after it.
  CosmeticLoadout bought(String id, int bankAfter) => CosmeticLoadout(
    avatars: avatars,
    titles: titles,
    owned: {...owned, id},
    avatarId: avatarId,
    titleId: titleId,
    lifetimeScore: lifetimeScore,
    bank: bankAfter,
  );

  /// Joins the catalogue to a profile's state, which is missing entirely
  /// until the plugin has a profile to hold it.
  factory CosmeticLoadout.from(
    List<Cosmetic> catalog,
    Map<String, dynamic>? state,
  ) {
    final ids = state?['Owned'];
    return CosmeticLoadout(
      avatars: catalog
          .where((item) => item.kind == CosmeticKind.avatar)
          .toList(),
      titles: catalog
          .where((item) => item.kind == CosmeticKind.rankTitle)
          .toList(),
      owned: ids is List ? ids.whereType<String>().toSet() : <String>{},
      avatarId: _nonEmpty(state?['EquippedAvatarId']),
      titleId: _nonEmpty(state?['EquippedCustomTitleId']),
      lifetimeScore: _asInt(state?['LifetimeScore']),
      bank: _asInt(state?['ScoreBank']),
    );
  }
}

enum CosmeticChangeOutcome { changed, refused, failed }

class CosmeticChange {
  const CosmeticChange(this.outcome, {this.message});

  final CosmeticChangeOutcome outcome;

  /// The plugin's own wording for a refusal.
  final String? message;
}

/// One row of either leaderboard.
///
/// The overall board carries score and completion. A category board carries a
/// single [value] that means whatever the category is, and leaves the rest
/// null.
class LeaderboardEntry {
  const LeaderboardEntry({
    required this.userId,
    required this.userName,
    required this.score,
    required this.unlocked,
    required this.total,
    required this.value,
    required this.customTitle,
  });

  final String userId;
  final String userName;
  final int? score;
  final int? unlocked;
  final int? total;

  /// Set only on a category board.
  final int? value;

  /// The shop title the user equipped. Most people have none.
  final String? customTitle;

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) {
    final customTitle = json['CustomTitle'];
    return LeaderboardEntry(
      userId: _asString(json['UserId']),
      userName: _asString(json['UserName']),
      score: json.containsKey('Score') ? _asInt(json['Score']) : null,
      unlocked: json.containsKey('Unlocked') ? _asInt(json['Unlocked']) : null,
      total: json.containsKey('Total') ? _asInt(json['Total']) : null,
      value: json.containsKey('Value') ? _asInt(json['Value']) : null,
      customTitle: customTitle is String && customTitle.isNotEmpty
          ? customTitle
          : null,
    );
  }
}

/// A name and how many items it covers, for the recap's top lists.
class RecapCount {
  const RecapCount({required this.name, required this.count});

  final String name;
  final int count;

  factory RecapCount.fromJson(Map<String, dynamic> json) {
    return RecapCount(
      name: _asString(json['Name']),
      count: _asInt(json['Count']),
    );
  }
}

class AchievementRecap {
  const AchievementRecap({
    required this.period,
    required this.moviesWatched,
    required this.episodesWatched,
    required this.daysWatched,
    required this.badgesUnlocked,
    required this.topGenres,
    required this.topDirectors,
    required this.topActors,
  });

  /// `week`, `month` or `year`, echoed back by the server.
  final String period;
  final int moviesWatched;
  final int episodesWatched;
  final int daysWatched;
  final int badgesUnlocked;
  final List<RecapCount> topGenres;
  final List<RecapCount> topDirectors;
  final List<RecapCount> topActors;

  static List<RecapCount> _counts(dynamic value) {
    if (value is! List) return const <RecapCount>[];
    return value
        .whereType<Map<String, dynamic>>()
        .map(RecapCount.fromJson)
        .toList();
  }

  factory AchievementRecap.fromJson(Map<String, dynamic> json) {
    return AchievementRecap(
      period: _asString(json['Period']),
      moviesWatched: _asInt(json['MoviesWatched']),
      episodesWatched: _asInt(json['EpisodesWatched']),
      daysWatched: _asInt(json['DaysWatched']),
      badgesUnlocked: _asInt(json['BadgesUnlocked']),
      topGenres: _counts(json['TopGenres']),
      topDirectors: _counts(json['TopDirectors']),
      topActors: _counts(json['TopActors']),
    );
  }
}

/// Everything the panel shows, fetched in one pass.
class AchievementsOverview {
  const AchievementsOverview({
    required this.summary,
    required this.rank,
    required this.badges,
    required this.equipped,
    required this.quests,
    required this.leaderboard,
    required this.recap,
    required this.libraryCompletion,
    required this.leaderboardEnabled,
    required this.questsEnabled,
    required this.activityEnabled,
    required this.cosmetics,
  });

  final AchievementSummary? summary;
  final AchievementRank? rank;
  final List<AchievementBadge> badges;
  final List<AchievementBadge> equipped;
  final AchievementQuests? quests;
  final List<LeaderboardEntry> leaderboard;
  final AchievementRecap? recap;

  /// Library name to percent complete.
  final Map<String, int> libraryCompletion;

  /// Null on a server whose plugin is too old to carry a catalogue.
  final CosmeticLoadout? cosmetics;

  /// Admin switches from the plugin's config. The panel hides a section the
  /// server turned off rather than drawing an empty one.
  final bool activityEnabled;
  final bool leaderboardEnabled;
  final bool questsEnabled;
}
