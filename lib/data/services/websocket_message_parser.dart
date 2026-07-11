import 'dart:convert';
import 'package:server_core/server_core.dart';

class WebSocketMessageParser {
  static ServerWebSocketMessage? parse(String raw) {
    final Map<String, dynamic> json;
    try {
      json = jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
    return parseJson(json);
  }

  static ServerWebSocketMessage? parseJson(Map<String, dynamic> json) {
    final type = json['MessageType'] as String?;
    final data = json['Data'];

    if (type == null) {
      return null;
    }

    return switch (type) {
      'LibraryChanged' => _parseLibraryChanged(data),
      'UserDataChanged' => _parseUserDataChanged(data),
      'Play' => _parsePlay(data),
      'Playstate' => _parsePlaystate(data),
      'GeneralCommand' => _parseGeneralCommand(data),
      'SyncPlayCommand' => _parseSyncPlayCommand(data),
      'SyncPlayGroupUpdate' => _parseSyncPlayGroupUpdate(data),
      'ServerRestarting' => const ServerRestartingMessage(),
      'ServerShuttingDown' => const ServerShuttingDownMessage(),
      'SessionEnded' => _parseSessionEnded(data),
      'ScheduledTaskEnded' => _parseScheduledTaskEnded(data),
      'MoonfinEvent' ||
      'SessionsStart' ||
      'SessionsStop' ||
      'ScheduledTasksInfoStart' ||
      'ScheduledTasksInfoStop' ||
      'PackageInstallationCompleted' ||
      'PackageInstallationFailed' ||
      'PluginInstalled' ||
      'PluginUninstalled' ||
      'UserCreated' ||
      'UserDeleted' ||
      'UserUpdated' ||
      'ActivityLogEntry' => ServerEventMessage(
        type: type,
        data: data is Map<String, dynamic> ? data : const {},
      ),
      _ => null,
    };
  }

  static LibraryChangedMessage? _parseLibraryChanged(dynamic data) {
    if (data is! Map<String, dynamic>) return null;
    return LibraryChangedMessage(
      itemsAdded: _stringList(data, 'ItemsAdded'),
      itemsUpdated: _stringList(data, 'ItemsUpdated'),
      itemsRemoved: _stringList(data, 'ItemsRemoved'),
    );
  }

  static UserDataChangedMessage? _parseUserDataChanged(dynamic data) {
    if (data is! Map<String, dynamic>) return null;
    final userId = data['UserId']?.toString();
    if (userId == null) return null;
    final itemIds =
        (data['UserDataList'] as List<dynamic>?)
            ?.map((e) => (e as Map<String, dynamic>)['ItemId']?.toString())
            .whereType<String>()
            .toList() ??
        const [];
    return UserDataChangedMessage(userId: userId, itemIds: itemIds);
  }

  static PlayMessage? _parsePlay(dynamic data) {
    if (data is! Map<String, dynamic>) return null;
    final itemIds = _stringList(data, 'ItemIds');
    if (itemIds.isEmpty) return null;
    return PlayMessage(
      itemIds: itemIds,
      startPositionTicks: _intValue(data['StartPositionTicks']),
      playCommand: data['PlayCommand'] as String? ?? 'PlayNow',
      startIndex: _intValue(data['StartIndex']) ?? 0,
      audioStreamIndex: _intValue(data['AudioStreamIndex']),
      subtitleStreamIndex: _intValue(data['SubtitleStreamIndex']),
      mediaSourceId: data['MediaSourceId']?.toString(),
    );
  }

  static PlaystateMessage? _parsePlaystate(dynamic data) {
    if (data is! Map<String, dynamic>) return null;
    final command = data['Command'] as String?;
    if (command == null) return null;
    return PlaystateMessage(
      command: command,
      seekPositionTicks: data['SeekPositionTicks'] as int?,
    );
  }

  static GeneralCommandMessage? _parseGeneralCommand(dynamic data) {
    if (data is! Map<String, dynamic>) return null;
    final name = data['Name'] as String?;
    if (name == null) return null;
    final arguments =
        (data['Arguments'] as Map<String, dynamic>?)?.map(
          (k, v) => MapEntry(k, v.toString()),
        ) ??
        const {};
    return GeneralCommandMessage(name: name, arguments: arguments);
  }

  static SessionEndedMessage? _parseSessionEnded(dynamic data) {
    if (data is! Map<String, dynamic>) return null;
    final sessionId = data['Id']?.toString() ?? data['SessionId']?.toString();
    if (sessionId == null) return null;
    return SessionEndedMessage(sessionId: sessionId);
  }

  static ScheduledTaskEndedMessage? _parseScheduledTaskEnded(dynamic data) {
    if (data is! Map<String, dynamic>) return null;
    final taskId = data['Id']?.toString();
    final taskName = data['Name'] as String?;
    final status = data['Status'] as String?;
    if (taskId == null || taskName == null || status == null) return null;
    return ScheduledTaskEndedMessage(
      taskId: taskId,
      taskName: taskName,
      status: status,
    );
  }

  static List<String> _stringList(Map<String, dynamic> data, String key) =>
      (data[key] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
      const [];

  static int? _intValue(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  static SyncPlayCommandMessage? _parseSyncPlayCommand(dynamic data) {
    if (data is! Map<String, dynamic>) return null;
    final command = SyncPlayCommand.fromJson(data);
    if (command == null) return null;
    return SyncPlayCommandMessage(command);
  }

  static SyncPlayGroupUpdateMessage? _parseSyncPlayGroupUpdate(dynamic data) {
    if (data is! Map<String, dynamic>) return null;
    final update = SyncPlayGroupUpdate.fromJson(data);
    if (update == null) return null;
    return SyncPlayGroupUpdateMessage(update);
  }
}
