import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../../di/providers.dart';

final adminUsersListProvider = FutureProvider<List<ServerUser>>((ref) async {
  final client = GetIt.instance<MediaServerClient>();
  return client.adminUsersApi.getUsers();
});

final adminUserProvider =
    FutureProvider.family<ServerUser, String>((ref, userId) async {
  final client = GetIt.instance<MediaServerClient>();
  return client.adminUsersApi.getUserById(userId);
});

final adminLibrariesProvider =
    FutureProvider<List<VirtualFolderInfo>>((ref) async {
  final client = GetIt.instance<MediaServerClient>();
  return client.adminLibraryApi.getVirtualFolders();
});

/// The visible tasks (`isHidden=false`), kept current by the server's
/// ScheduledTasksInfo feed for as long as anything watches it.
final adminTasksProvider = StreamProvider.autoDispose<List<TaskInfo>>((ref) {
  return _liveFeed<TaskInfo>(
    ref,
    feed: 'ScheduledTasksInfo',
    load: () async {
      final data = await GetIt.instance<MediaServerClient>().adminTasksApi
          .getTasks(isHidden: false);
      return data.map(TaskInfo.fromJson).toList();
    },
    onPush: (event, _) => event is ScheduledTasksInfoMessage
        ? event.tasks.map(TaskInfo.fromJson).toList()
        : null,
  );
});

/// One task out of the live list, so its progress moves without polling.
final adminTaskProvider =
    Provider.autoDispose.family<AsyncValue<TaskInfo>, String>((ref, taskId) {
  final list = ref.watch(adminTasksProvider);
  final task = list.valueOrNull?.where((t) => t.id == taskId).firstOrNull;
  if (task != null) return AsyncData(task);
  if (!list.hasValue) {
    return list.hasError
        ? AsyncError(list.error!, list.stackTrace ?? StackTrace.current)
        : const AsyncLoading();
  }
  // Hidden tasks aren't in the feed, so ask for this one alone.
  return ref.watch(adminTaskByIdProvider(taskId));
});

final adminTaskByIdProvider =
    FutureProvider.autoDispose.family<TaskInfo, String>((ref, taskId) async {
  final client = GetIt.instance<MediaServerClient>();
  return TaskInfo.fromJson(await client.adminTasksApi.getTask(taskId));
});

/// The first load asks for every session active in the last 960 s, and the
/// Sessions feed then updates or adds entries by device without ever dropping
/// one.
final adminSessionsProvider =
    StreamProvider.autoDispose<List<Map<String, dynamic>>>((ref) {
  return _liveFeed<Map<String, dynamic>>(
    ref,
    feed: 'Sessions',
    load: () => GetIt.instance<MediaServerClient>().sessionApi.getSessions(
      activeWithinSeconds: 960,
    ),
    onPush: (event, current) => event is SessionsMessage
        ? mergeLiveSessions(current, event.sessions, DateTime.now())
        : null,
    merge: (loaded, pushed) => mergeLiveSessions(loaded, pushed, null),
  );
});

/// Folds a Sessions push into [current], matched by `DeviceId`. Only sessions
/// active in the last 95 s that play something or belong to a user count. A
/// null [now] skips that filter, for entries that were already filtered.
List<Map<String, dynamic>> mergeLiveSessions(
  List<Map<String, dynamic>> current,
  List<Map<String, dynamic>> pushed,
  DateTime? now,
) {
  final merged = [...current];
  for (final session in pushed) {
    if (now != null) {
      final last = parseServerDate(session['LastActivityDate']);
      final active =
          last != null && !last.isBefore(now.subtract(const Duration(seconds: 95)));
      if (!active ||
          (session['NowPlayingItem'] == null && session['UserId'] == null)) {
        continue;
      }
    }
    final index = merged.indexWhere((s) => s['DeviceId'] == session['DeviceId']);
    if (index == -1) {
      merged.add(session);
    } else {
      merged[index] = session;
    }
  }
  return merged;
}

/// A first load plus a server feed. A push that lands before the load answers
/// is kept: [merge] lays it over the loaded list (by default the push wins).
Stream<List<T>> _liveFeed<T>(
  Ref ref, {
  required String feed,
  required Future<List<T>> Function() load,
  required List<T>? Function(ServerWebSocketMessage event, List<T> current)
  onPush,
  List<T> Function(List<T> loaded, List<T> pushed)? merge,
}) {
  final socket = ref.watch(socketHandlerProvider);
  final controller = StreamController<List<T>>();
  var current = <T>[];
  var loaded = false;
  var pushed = false;

  final sub = socket.events.listen((event) {
    final next = onPush(event, current);
    if (next == null) return;
    current = next;
    pushed = true;
    if (loaded) controller.add(current);
  });
  socket.subscribe(feed);

  load().then(
    (items) {
      if (controller.isClosed) return;
      current = pushed ? (merge?.call(items, current) ?? current) : items;
      loaded = true;
      controller.add(current);
    },
    onError: (Object error, StackTrace stack) {
      if (controller.isClosed) return;
      // A push carries the whole list, so the next one replaces the error.
      loaded = true;
      if (pushed) {
        controller.add(current);
      } else {
        controller.addError(error, stack);
      }
    },
  );

  ref.onDispose(() {
    sub.cancel();
    socket.unsubscribe(feed);
    controller.close();
  });
  return controller.stream;
}

final adminInstalledPluginsProvider =
    FutureProvider<List<PluginInfo>>((ref) async {
  final client = GetIt.instance<MediaServerClient>();
  return client.adminPluginsApi.getInstalledPlugins();
});

final adminAvailablePackagesProvider =
    FutureProvider<List<PackageInfo>>((ref) async {
  final client = GetIt.instance<MediaServerClient>();
  return client.adminPluginsApi.getAvailablePackages();
});

final adminRepositoriesProvider =
    FutureProvider<List<RepositoryInfo>>((ref) async {
  final client = GetIt.instance<MediaServerClient>();
  return client.adminPluginsApi.getRepositories();
});

final adminDevicesProvider = FutureProvider<List<DeviceInfoDto>>((ref) async {
  final client = GetIt.instance<MediaServerClient>();
  return client.adminDevicesApi.getDevices();
});
