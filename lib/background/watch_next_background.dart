import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../data/models/home_row.dart';
import '../data/services/media_server_client_factory.dart';
import '../data/services/row_data_source.dart';
import '../data/services/watch_next_service.dart';
import '../di/injection.dart';
import '../playback/car_artwork.dart';
import '../playback/headless_session_bootstrap.dart';

Future<void> watchNextBackgroundMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('org.moonfin.androidtv/watch_next');

  var ok = false;
  try {
    await configureBackgroundDependencies();

    final client = await HeadlessSessionBootstrap().restoreClient();
    if (client != null) {
      final factory = GetIt.instance<MediaServerClientFactory>();
      var serverId = client.baseUrl;
      for (final entry in factory.clients.entries) {
        if (identical(entry.value, client)) {
          serverId = entry.key;
          break;
        }
      }

      final dataSource = RowDataSource(client);
      final rows = <HomeRow>[];
      try {
        rows.add(await dataSource.loadResume(serverId));
      } catch (_) {}
      try {
        rows.add(await dataSource.loadNextUp(serverId));
      } catch (_) {}

      await CarArtwork.instance.ensureReady();
      final items = WatchNextService.buildItems(rows, client.imageApi);
      await CarArtwork.instance.persistHosts();

      if (items.isEmpty) {
        await channel.invokeMethod('clear');
      } else {
        await channel.invokeMethod('publish', {'items': items});
      }
      ok = true;
    }
  } catch (_) {}

  try {
    await channel.invokeMethod('backgroundComplete', {'ok': ok});
  } catch (_) {}
}
