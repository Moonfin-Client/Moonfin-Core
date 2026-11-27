import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/recording_owners_service.dart';
import 'package:server_core/server_core.dart';

class _Client extends Mock implements MediaServerClient {}

class _Factory extends Mock implements MediaServerClientFactory {}

void main() {
  late _Client active;
  late _Client other;
  late _Factory factory;

  setUp(() {
    active = _Client();
    other = _Client();
    when(() => active.baseUrl).thenReturn('http://home.test');
    when(() => other.baseUrl).thenReturn('http://friend.test');
    factory = _Factory();
    when(() => factory.getClientIfExists('home')).thenReturn(active);
    when(() => factory.getClientIfExists('friend')).thenReturn(other);
    when(() => factory.getClientIfExists('gone')).thenReturn(null);
    GetIt.instance
      ..registerSingleton<MediaServerClient>(active)
      ..registerSingleton<MediaServerClientFactory>(factory);
  });

  tearDown(() => GetIt.instance.reset());

  test('an item from the active server, or with no server, has its owners '
      'there', () {
    expect(ownersCoverServer(null), isTrue);
    expect(ownersCoverServer(''), isTrue);
    expect(ownersCoverServer('home'), isTrue);
  });

  test('an item from another signed-in server keeps its owners there, so '
      'owner features are off for it', () {
    expect(ownersCoverServer('friend'), isFalse);
  });

  test('a server the app has no client for falls back to the active one, as '
      'the item page does', () {
    expect(ownersCoverServer('gone'), isTrue);
  });
}
