enum SyncPlayGroupState {
  idle,
  waiting,
  paused,
  playing;

  static SyncPlayGroupState? fromString(String? raw) {
    switch (raw) {
      case 'Idle':
        return SyncPlayGroupState.idle;
      case 'Waiting':
        return SyncPlayGroupState.waiting;
      case 'Paused':
        return SyncPlayGroupState.paused;
      case 'Playing':
        return SyncPlayGroupState.playing;
      default:
        return null;
    }
  }

  String get serverValue => switch (this) {
        SyncPlayGroupState.idle => 'Idle',
        SyncPlayGroupState.waiting => 'Waiting',
        SyncPlayGroupState.paused => 'Paused',
        SyncPlayGroupState.playing => 'Playing',
      };
}

enum SyncPlayCommandType {
  unpause,
  pause,
  seek,
  stop;

  static SyncPlayCommandType? fromString(String? raw) {
    switch (raw) {
      case 'Unpause':
        return SyncPlayCommandType.unpause;
      case 'Pause':
        return SyncPlayCommandType.pause;
      case 'Seek':
        return SyncPlayCommandType.seek;
      case 'Stop':
        return SyncPlayCommandType.stop;
      default:
        return null;
    }
  }
}

enum SyncPlayQueueMode {
  queue,
  queueNext;

  static SyncPlayQueueMode fromString(String? raw) =>
      raw == 'QueueNext' ? SyncPlayQueueMode.queueNext : SyncPlayQueueMode.queue;

  String get serverValue =>
      this == SyncPlayQueueMode.queueNext ? 'QueueNext' : 'Queue';
}

enum SyncPlayShuffleMode {
  sorted,
  shuffle;

  static SyncPlayShuffleMode fromString(String? raw) =>
      raw == 'Shuffle' ? SyncPlayShuffleMode.shuffle : SyncPlayShuffleMode.sorted;

  String get serverValue =>
      this == SyncPlayShuffleMode.shuffle ? 'Shuffle' : 'Sorted';
}

enum SyncPlayRepeatMode {
  repeatNone,
  repeatOne,
  repeatAll;

  static SyncPlayRepeatMode fromString(String? raw) {
    switch (raw) {
      case 'RepeatOne':
        return SyncPlayRepeatMode.repeatOne;
      case 'RepeatAll':
        return SyncPlayRepeatMode.repeatAll;
      default:
        return SyncPlayRepeatMode.repeatNone;
    }
  }

  String get serverValue => switch (this) {
        SyncPlayRepeatMode.repeatNone => 'RepeatNone',
        SyncPlayRepeatMode.repeatOne => 'RepeatOne',
        SyncPlayRepeatMode.repeatAll => 'RepeatAll',
      };
}

enum SyncPlayQueueUpdateReason {
  newPlaylist,
  setCurrentItem,
  removeItems,
  moveItem,
  queue,
  queueNext,
  nextItem,
  previousItem,
  repeatMode,
  shuffleMode;

  static SyncPlayQueueUpdateReason fromString(String? raw) {
    switch (raw) {
      case 'NewPlaylist':
        return SyncPlayQueueUpdateReason.newPlaylist;
      case 'SetCurrentItem':
        return SyncPlayQueueUpdateReason.setCurrentItem;
      case 'RemoveItems':
        return SyncPlayQueueUpdateReason.removeItems;
      case 'MoveItem':
        return SyncPlayQueueUpdateReason.moveItem;
      case 'Queue':
        return SyncPlayQueueUpdateReason.queue;
      case 'QueueNext':
        return SyncPlayQueueUpdateReason.queueNext;
      case 'NextItem':
        return SyncPlayQueueUpdateReason.nextItem;
      case 'PreviousItem':
        return SyncPlayQueueUpdateReason.previousItem;
      case 'RepeatMode':
        return SyncPlayQueueUpdateReason.repeatMode;
      case 'ShuffleMode':
        return SyncPlayQueueUpdateReason.shuffleMode;
      default:
        return SyncPlayQueueUpdateReason.newPlaylist;
    }
  }
}

enum SyncPlayGroupUpdateType {
  groupJoined,
  groupLeft,
  stateUpdate,
  userJoined,
  userLeft,
  playQueue,
  notInGroup,
  groupDoesNotExist,
  libraryAccessDenied;

  static SyncPlayGroupUpdateType? fromString(String? raw) {
    switch (raw) {
      case 'GroupJoined':
        return SyncPlayGroupUpdateType.groupJoined;
      case 'GroupLeft':
        return SyncPlayGroupUpdateType.groupLeft;
      case 'StateUpdate':
        return SyncPlayGroupUpdateType.stateUpdate;
      case 'UserJoined':
        return SyncPlayGroupUpdateType.userJoined;
      case 'UserLeft':
        return SyncPlayGroupUpdateType.userLeft;
      case 'PlayQueue':
        return SyncPlayGroupUpdateType.playQueue;
      case 'NotInGroup':
        return SyncPlayGroupUpdateType.notInGroup;
      case 'GroupDoesNotExist':
        return SyncPlayGroupUpdateType.groupDoesNotExist;
      case 'LibraryAccessDenied':
        return SyncPlayGroupUpdateType.libraryAccessDenied;
      default:
        return null;
    }
  }
}

class SyncPlayGroupInfo {
  final String groupId;
  final String? groupName;
  final SyncPlayGroupState? state;
  final List<String> participants;
  final String? lastUpdatedAt;

  const SyncPlayGroupInfo({
    required this.groupId,
    this.groupName,
    this.state,
    this.participants = const [],
    this.lastUpdatedAt,
  });

  factory SyncPlayGroupInfo.fromJson(Map<String, dynamic> json) {
    return SyncPlayGroupInfo(
      groupId: (json['GroupId'] as String?) ?? '',
      groupName: json['GroupName'] as String?,
      state: SyncPlayGroupState.fromString(json['State'] as String?),
      participants: (json['Participants'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      lastUpdatedAt: json['LastUpdatedAt'] as String?,
    );
  }
}

class SyncPlayQueueItem {
  final String itemId;
  final String playlistItemId;

  const SyncPlayQueueItem({required this.itemId, required this.playlistItemId});

  factory SyncPlayQueueItem.fromJson(Map<String, dynamic> json) =>
      SyncPlayQueueItem(
        itemId: (json['ItemId'] as String?) ?? '',
        playlistItemId: (json['PlaylistItemId'] as String?) ?? '',
      );
}

class SyncPlayCommand {
  final String groupId;
  final SyncPlayCommandType command;
  final int positionTicks;
  final int whenUtcMs;
  final int emittedAtUtcMs;
  final String? playlistItemId;

  const SyncPlayCommand({
    required this.groupId,
    required this.command,
    required this.positionTicks,
    required this.whenUtcMs,
    required this.emittedAtUtcMs,
    this.playlistItemId,
  });

  static SyncPlayCommand? fromJson(Map<String, dynamic> json) {
    final type = SyncPlayCommandType.fromString(json['Command'] as String?);
    if (type == null) return null;
    final whenStr = json['When'] as String?;
    final whenMs = SyncPlayUtils.parseISOToMs(whenStr);
    final emittedStr = json['EmittedAt'] as String?;
    final emittedMs = emittedStr != null
        ? SyncPlayUtils.parseISOToMs(emittedStr)
        : whenMs;
    return SyncPlayCommand(
      groupId: (json['GroupId'] as String?) ?? '',
      command: type,
      positionTicks: (json['PositionTicks'] as num?)?.toInt() ?? 0,
      whenUtcMs: whenMs,
      emittedAtUtcMs: emittedMs,
      playlistItemId: json['PlaylistItemId'] as String?,
    );
  }

  String get dedupeKey =>
      '$groupId|${command.name}|$whenUtcMs|${playlistItemId ?? '-'}|$emittedAtUtcMs';
}

class SyncPlayStateUpdate {
  final SyncPlayGroupState state;
  final String? reason;

  const SyncPlayStateUpdate({required this.state, this.reason});

  factory SyncPlayStateUpdate.fromJson(Map<String, dynamic> json) =>
      SyncPlayStateUpdate(
        state: SyncPlayGroupState.fromString(json['State'] as String?) ??
            SyncPlayGroupState.idle,
        reason: json['Reason'] as String?,
      );
}

class SyncPlayPlayQueueUpdate {
  final SyncPlayQueueUpdateReason reason;
  final String lastUpdate;
  final List<SyncPlayQueueItem> playlist;
  final int playingItemIndex;
  final int startPositionTicks;
  final bool isPlaying;
  final SyncPlayShuffleMode shuffleMode;
  final SyncPlayRepeatMode repeatMode;

  const SyncPlayPlayQueueUpdate({
    required this.reason,
    required this.lastUpdate,
    required this.playlist,
    required this.playingItemIndex,
    required this.startPositionTicks,
    required this.isPlaying,
    required this.shuffleMode,
    required this.repeatMode,
  });

  factory SyncPlayPlayQueueUpdate.fromJson(Map<String, dynamic> json) =>
      SyncPlayPlayQueueUpdate(
        reason: SyncPlayQueueUpdateReason.fromString(json['Reason'] as String?),
        lastUpdate: (json['LastUpdate'] as String?) ?? '',
        playlist: (json['Playlist'] as List<dynamic>?)
                ?.whereType<Map<String, dynamic>>()
                .map(SyncPlayQueueItem.fromJson)
                .toList() ??
            const [],
        playingItemIndex: (json['PlayingItemIndex'] as num?)?.toInt() ?? -1,
        startPositionTicks:
            (json['StartPositionTicks'] as num?)?.toInt() ?? 0,
        isPlaying: json['IsPlaying'] as bool? ?? false,
        shuffleMode:
            SyncPlayShuffleMode.fromString(json['ShuffleMode'] as String?),
        repeatMode:
            SyncPlayRepeatMode.fromString(json['RepeatMode'] as String?),
      );
}

sealed class SyncPlayGroupUpdatePayload {
  const SyncPlayGroupUpdatePayload();
}

class SyncPlayGroupJoinedPayload extends SyncPlayGroupUpdatePayload {
  final SyncPlayGroupInfo info;
  const SyncPlayGroupJoinedPayload(this.info);
}

class SyncPlayGroupLeftPayload extends SyncPlayGroupUpdatePayload {
  final String? data;
  const SyncPlayGroupLeftPayload(this.data);
}

class SyncPlayStateUpdatePayload extends SyncPlayGroupUpdatePayload {
  final SyncPlayStateUpdate update;
  const SyncPlayStateUpdatePayload(this.update);
}

class SyncPlayUserJoinedPayload extends SyncPlayGroupUpdatePayload {
  final String userName;
  const SyncPlayUserJoinedPayload(this.userName);
}

class SyncPlayUserLeftPayload extends SyncPlayGroupUpdatePayload {
  final String userName;
  const SyncPlayUserLeftPayload(this.userName);
}

class SyncPlayPlayQueuePayload extends SyncPlayGroupUpdatePayload {
  final SyncPlayPlayQueueUpdate update;
  const SyncPlayPlayQueuePayload(this.update);
}

class SyncPlayNotInGroupPayload extends SyncPlayGroupUpdatePayload {
  const SyncPlayNotInGroupPayload();
}

class SyncPlayGroupDoesNotExistPayload extends SyncPlayGroupUpdatePayload {
  const SyncPlayGroupDoesNotExistPayload();
}

class SyncPlayLibraryAccessDeniedPayload extends SyncPlayGroupUpdatePayload {
  const SyncPlayLibraryAccessDeniedPayload();
}

class SyncPlayGroupUpdate {
  final String groupId;
  final SyncPlayGroupUpdateType type;
  final SyncPlayGroupUpdatePayload payload;

  const SyncPlayGroupUpdate({
    required this.groupId,
    required this.type,
    required this.payload,
  });

  static SyncPlayGroupUpdate? fromJson(Map<String, dynamic> json) {
    final type = SyncPlayGroupUpdateType.fromString(json['Type'] as String?);
    if (type == null) return null;
    final groupId = (json['GroupId'] as String?) ?? '';
    final data = json['Data'];
    final SyncPlayGroupUpdatePayload payload;
    switch (type) {
      case SyncPlayGroupUpdateType.groupJoined:
        if (data is! Map<String, dynamic>) return null;
        payload = SyncPlayGroupJoinedPayload(SyncPlayGroupInfo.fromJson(data));
        break;
      case SyncPlayGroupUpdateType.groupLeft:
        payload = SyncPlayGroupLeftPayload(data?.toString());
        break;
      case SyncPlayGroupUpdateType.stateUpdate:
        if (data is! Map<String, dynamic>) return null;
        payload = SyncPlayStateUpdatePayload(SyncPlayStateUpdate.fromJson(data));
        break;
      case SyncPlayGroupUpdateType.userJoined:
        payload = SyncPlayUserJoinedPayload(data?.toString() ?? '');
        break;
      case SyncPlayGroupUpdateType.userLeft:
        payload = SyncPlayUserLeftPayload(data?.toString() ?? '');
        break;
      case SyncPlayGroupUpdateType.playQueue:
        if (data is! Map<String, dynamic>) return null;
        payload =
            SyncPlayPlayQueuePayload(SyncPlayPlayQueueUpdate.fromJson(data));
        break;
      case SyncPlayGroupUpdateType.notInGroup:
        payload = const SyncPlayNotInGroupPayload();
        break;
      case SyncPlayGroupUpdateType.groupDoesNotExist:
        payload = const SyncPlayGroupDoesNotExistPayload();
        break;
      case SyncPlayGroupUpdateType.libraryAccessDenied:
        payload = const SyncPlayLibraryAccessDeniedPayload();
        break;
    }
    return SyncPlayGroupUpdate(groupId: groupId, type: type, payload: payload);
  }
}

class SyncPlayUtils {
  static const int ticksPerMs = 10000;

  static int ticksToMs(int ticks) => ticks ~/ ticksPerMs;

  static int msToTicks(int ms) => ms * ticksPerMs;

  static int? tryParseISOToMs(String? iso) {
    if (iso == null || iso.isEmpty) return null;
    try {
      return DateTime.parse(iso).toUtc().millisecondsSinceEpoch;
    } catch (_) {
      return null;
    }
  }

  /// Falls back to local now, which makes a command with a garbage timestamp
  /// execute immediately. Callers that must distinguish a bad timestamp from
  /// "now" should use [tryParseISOToMs].
  static int parseISOToMs(String? iso) =>
      tryParseISOToMs(iso) ?? DateTime.now().toUtc().millisecondsSinceEpoch;

  static String nowIsoUtc() => DateTime.now().toUtc().toIso8601String();
}
