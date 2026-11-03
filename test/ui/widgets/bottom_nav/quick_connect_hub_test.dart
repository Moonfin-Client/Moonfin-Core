import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:server_core/server_core.dart';

import 'bottom_nav_fakes.dart';

class _Client extends Fake implements MediaServerClient {
  _Client(this.serverType);

  @override
  final ServerType serverType;
}

class _Factory extends Fake implements MediaServerClientFactory {
  _Factory(this.client);

  final MediaServerClient client;

  @override
  MediaServerClient clientForServerOrActive(String? serverId) => client;
}

void main() {
  setUp(setUpBottomNav);
  tearDown(tearDownBottomNav);

  Future<void> openHubOn(WidgetTester tester, ServerType type) async {
    final client = _Client(type);
    final getIt = GetIt.instance;
    getIt.registerSingleton<MediaServerClient>(client);
    await getIt.unregister<MediaServerClientFactory>();
    getIt.registerSingleton<MediaServerClientFactory>(_Factory(client));
    usePhoneView(tester);
    await tester.pumpWidget(bottomNavApp());
    await tester.pump();
    await tester.tap(find.text('You'));
    await tester.pumpAndSettle();
  }

  testWidgets('on Silo the hub offers "Approve a sign-in"', (tester) async {
    await openHubOn(tester, ServerType.silo);

    expect(find.text('Approve a sign-in'), findsOneWidget);
    expect(find.text('Quick Connect'), findsNothing);
  });

  testWidgets('on Jellyfin it is still "Quick Connect"', (tester) async {
    await openHubOn(tester, ServerType.jellyfin);

    expect(find.text('Quick Connect'), findsOneWidget);
    expect(find.text('Approve a sign-in'), findsNothing);
  });

  testWidgets('Emby has neither', (tester) async {
    await openHubOn(tester, ServerType.emby);

    expect(find.text('Quick Connect'), findsNothing);
    expect(find.text('Approve a sign-in'), findsNothing);
  });
}
