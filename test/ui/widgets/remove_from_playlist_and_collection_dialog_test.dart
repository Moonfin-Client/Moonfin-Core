import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:server_core/server_core.dart';

import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/item_membership_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/remove_from_collection_dialog.dart';
import 'package:moonfin/ui/widgets/remove_from_playlist_dialog.dart';

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockClient extends Mock implements MediaServerClient {}

AggregatedItem _testMovie() => const AggregatedItem(
      id: 'movie-100',
      serverId: 'server-1',
      rawData: {
        'Id': 'movie-100',
        'Type': 'Movie',
        'Name': 'Fireball 500',
      },
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockClient client;
  late _MockItemsApi itemsApi;

  setUp(() {
    client = _MockClient();
    itemsApi = _MockItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() {
    GetIt.instance.reset();
    ItemMembershipService.instance.clearCache();
  });

  group('RemoveFromPlaylistDialog', () {
    testWidgets('renders only the playlists it belongs to and confirms removal',
        (tester) async {
      when(() => itemsApi.removeFromPlaylist('pl-1', ['entry-100']))
          .thenAnswer((_) async {});

      final playlists = [
        const ItemPlaylistMembership(
          playlistId: 'pl-1',
          playlistName: 'The Hux List',
          entryId: 'entry-100',
        ),
      ];

      bool? dialogResult;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  dialogResult = await RemoveFromPlaylistDialog.show(
                    context,
                    item: _testMovie(),
                    playlists: playlists,
                    serverId: 'server-1',
                  );
                },
                child: const Text('Open Dialog'),
              ),
            ),
          ),
        ),
      );

      // Open the dialog
      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      // Verify title and playlist row are displayed
      expect(find.text('Remove from Playlist'), findsOneWidget);
      expect(find.text('The Hux List'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);

      // Tap on the playlist
      await tester.tap(find.text('The Hux List'));
      await tester.pumpAndSettle();

      // Confirm dialog should appear
      expect(find.textContaining('Remove Fireball 500 from The Hux List?'),
          findsOneWidget);

      // Tap Remove button in confirm dialog
      await tester.tap(find.widgetWithText(TextButton, 'Remove'));
      await tester.pumpAndSettle();

      // Verify server API was called
      verify(() => itemsApi.removeFromPlaylist('pl-1', ['entry-100']))
          .called(1);
      expect(dialogResult, isTrue);
    });
  });

  group('RemoveFromCollectionDialog', () {
    testWidgets(
        'renders only the collections it belongs to and confirms removal',
        (tester) async {
      when(() => itemsApi.removeFromCollection('col-1', ['movie-100']))
          .thenAnswer((_) async {});

      final collections = [
        const ItemCollectionMembership(
          collectionId: 'col-1',
          collectionName: 'Alien Collection',
        ),
      ];

      bool? dialogResult;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  dialogResult = await RemoveFromCollectionDialog.show(
                    context,
                    item: _testMovie(),
                    collections: collections,
                    serverId: 'server-1',
                  );
                },
                child: const Text('Open Dialog'),
              ),
            ),
          ),
        ),
      );

      // Open the dialog
      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      // Verify title and collection row are displayed
      expect(find.text('Remove from Collection'), findsOneWidget);
      expect(find.text('Alien Collection'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);

      // Tap on the collection
      await tester.tap(find.text('Alien Collection'));
      await tester.pumpAndSettle();

      // Confirm dialog should appear
      expect(find.textContaining('Remove Fireball 500 from Alien Collection?'),
          findsOneWidget);

      // Tap Remove button in confirm dialog
      await tester.tap(find.widgetWithText(TextButton, 'Remove'));
      await tester.pumpAndSettle();

      // Verify server API was called
      verify(() => itemsApi.removeFromCollection('col-1', ['movie-100']))
          .called(1);
      expect(dialogResult, isTrue);
    });
  });
}
