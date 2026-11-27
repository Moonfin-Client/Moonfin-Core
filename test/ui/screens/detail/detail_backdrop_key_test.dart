import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:server_core/server_core.dart';

class _Client extends Mock implements MediaServerClient {}

class _Factory extends Mock implements MediaServerClientFactory {}

class _ImageApi extends Fake implements ImageApi {
  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) => 'backdrop/$itemId/$index?tag=$tag';
}

void main() {
  late BackgroundService backgrounds;

  setUp(() async {
    await GetIt.instance.reset();
    final client = _Client();
    when(() => client.imageApi).thenReturn(_ImageApi());
    final factory = _Factory();
    when(() => factory.clientForServerOrActive(any())).thenReturn(client);
    GetIt.instance.registerSingleton<MediaServerClientFactory>(factory);
    backgrounds = BackgroundService();
  });

  tearDown(() {
    backgrounds.dispose();
    return GetIt.instance.reset();
  });

  String key(String id, Map<String, dynamic> rawData) => detailBackdropKey(
    backgrounds,
    AggregatedItem(id: id, serverId: 'server', rawData: {'Id': id, ...rawData}),
  );

  test('new backdrop tags give a new key', () {
    expect(
      key('m1', {
        'BackdropImageTags': ['new'],
      }),
      isNot(
        key('m1', {
          'BackdropImageTags': ['old'],
        }),
      ),
    );
  });

  test('a user data change keeps the key', () {
    expect(
      key('m1', {
        'BackdropImageTags': ['old'],
        'UserData': {'IsFavorite': true},
      }),
      key('m1', {
        'BackdropImageTags': ['old'],
        'UserData': {'IsFavorite': false},
      }),
    );
  });

  test('another item with the same backdrop gives a new key', () {
    final parent = {
      'Type': 'Episode',
      'ParentBackdropItemId': 's1',
      'ParentBackdropImageTags': ['tag'],
    };
    expect(key('e1', parent), isNot(key('e2', parent)));
  });
}
