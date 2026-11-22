import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/change_artwork_dialog.dart';
import 'package:moonfin/ui/widgets/offline_aware_image.dart';
import 'package:server_core/server_core.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

/// An album with a cover and no backdrop until one is uploaded.
class _FakeItemsApi extends Fake implements ItemsApi {
  Map<String, dynamic> item = {
    'Id': 'a1',
    'Type': 'MusicAlbum',
    'Name': 'AlbumRed',
    'ImageTags': {'Primary': 'cover'},
    'BackdropImageTags': <String>[],
  };

  /// Other items the dialog can move to, by id.
  final others = <String, Map<String, dynamic>>{};

  /// While set, the next fetch of [heldId] waits on it, the way a slow server
  /// answers. It answers with the item as it was when it was asked for.
  String? heldId;
  Completer<void>? held;

  /// While true, fetches fail, the way a dropped connection does.
  bool failing = false;

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async {
    final answer = Map<String, dynamic>.from(
      itemId == item['Id'] ? item : others[itemId]!,
    );
    if (itemId == heldId) {
      heldId = null;
      await held?.future;
    }
    if (failing) throw Exception('connection lost');
    return answer;
  }
}

class _FakeAdminItemsApi extends Fake implements AdminItemsApi {
  _FakeAdminItemsApi(this.items);

  final _FakeItemsApi items;
  final uploads = <ImageType>[];
  final deletes = <ImageType>[];
  final downloads = <ImageType>[];

  /// Backdrops the providers offer.
  List<Map<String, dynamic>> remoteBackdrops = const [];

  /// While set, an upload waits on it, the way a large file keeps saving.
  Completer<void>? saving;

  /// While set, a delete waits on it.
  Completer<void>? deleting;

  @override
  Future<Map<String, dynamic>> getRemoteImages(
    String itemId, {
    required ImageType imageType,
    int? startIndex,
    int? limit,
    String? providerName,
    bool? includeAllLanguages,
  }) async => {
    'Images': imageType == ImageType.backdrop ? remoteBackdrops : const [],
  };

  @override
  Future<void> deleteItemImage(
    String itemId, {
    required ImageType imageType,
    int? imageIndex,
  }) async {
    deletes.add(imageType);
    await deleting?.future;
  }

  @override
  Future<void> downloadRemoteImage(
    String itemId, {
    required ImageType imageType,
    required String imageUrl,
  }) async => downloads.add(imageType);

  @override
  Future<void> uploadItemImage(
    String itemId, {
    required ImageType imageType,
    required List<int> bytes,
    required String contentType,
  }) async {
    uploads.add(imageType);
    await saving?.future;
    items.item = imageType == ImageType.backdrop
        ? {
            ...items.item,
            'BackdropImageTags': ['uploaded'],
          }
        : {
            ...items.item,
            'ImageTags': {
              ...items.item['ImageTags'] as Map,
              imageType.toServerString(): 'uploaded',
            },
          };
  }
}

class _FakeImageApi extends Fake implements ImageApi {
  @override
  dynamic noSuchMethod(Invocation invocation) => '';
}

void main() {
  late _FakeItemsApi items;
  late _FakeAdminItemsApi admin;
  late AppLocalizations l10n;

  setUp(() async {
    await GetIt.instance.reset();
    GetIt.instance.registerSingleton<UserRepository>(UserRepository());
    items = _FakeItemsApi();
    admin = _FakeAdminItemsApi(items);
    final client = _MockMediaServerClient();
    when(() => client.itemsApi).thenReturn(items);
    when(() => client.adminItemsApi).thenReturn(admin);
    when(() => client.imageApi).thenReturn(_FakeImageApi());
    when(() => client.baseUrl).thenReturn('http://server');
    GetIt.instance.registerSingleton<MediaServerClient>(client);
    l10n = await AppLocalizations.delegate.load(const Locale('en'));

    // The file picker hands back one image, as it does once a file is chosen.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('miguelruivo.flutter.plugins.filepicker'),
          (call) async => [
            {
              'name': 'backdrop.jpg',
              'path': null,
              'bytes': Uint8List.fromList([0xFF, 0xD8, 0xFF]),
              'size': 3,
            },
          ],
        );
  });

  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('miguelruivo.flutter.plugins.filepicker'),
          null,
        );
    await GetIt.instance.reset();
  });

  // Artwork that never loads keeps a spinner going, so this pumps a fixed
  // number of frames rather than waiting for the screen to settle.
  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  /// Opens the dialog for the album, or for [shown] when the page holds a
  /// slimmer copy of it. Returns what it resolves to once closed.
  Future<Future<bool?>> open(
    WidgetTester tester, {
    Map<String, dynamic>? shown,
  }) async {
    tester.view.physicalSize = const Size(1400, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    late Future<bool?> result;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => result = ChangeArtworkDialog.show(
                context,
                item: AggregatedItem(
                  id: items.item['Id'] as String,
                  serverId: 'server',
                  rawData: shown ?? items.item,
                ),
              ),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await settle(tester);
    return result;
  }

  /// Uploads a backdrop through the open dialog's Backdrop row.
  Future<void> uploadBackdrop(WidgetTester tester) async {
    // The rows run Primary, Backdrop, Disc, each with its own upload button.
    final backdropUpload = find.text(l10n.uploadButton).at(1);
    await tester.ensureVisible(backdropUpload);
    await tester.tap(backdropUpload);
    await settle(tester);

    expect(admin.uploads, [ImageType.backdrop]);
  }

  testWidgets('the Backdrop row stops saying Missing after an upload', (
    tester,
  ) async {
    await open(tester);
    // Backdrop and Disc have nothing yet.
    expect(find.text(l10n.missing), findsNWidgets(2));

    await uploadBackdrop(tester);

    expect(find.text(l10n.missing), findsOneWidget);
  });

  testWidgets('a change is reported when the close button shuts it', (
    tester,
  ) async {
    final result = await open(tester);
    await uploadBackdrop(tester);

    await tester.tap(find.byIcon(Icons.close));
    await settle(tester);

    expect(find.byType(ChangeArtworkDialog), findsNothing);
    expect(await result, isTrue);
  });

  testWidgets('a change is reported when Escape shuts it', (tester) async {
    final result = await open(tester);
    await uploadBackdrop(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await settle(tester);

    expect(find.byType(ChangeArtworkDialog), findsNothing);
    expect(await result, isTrue);
  });

  testWidgets('a change is reported when a tap outside shuts it', (
    tester,
  ) async {
    final result = await open(tester);
    await uploadBackdrop(tester);

    await tester.tapAt(const Offset(2, 2));
    await settle(tester);

    expect(find.byType(ChangeArtworkDialog), findsNothing);
    expect(await result, isTrue);
  });

  // The colour the close button's X is drawn in.
  Color? closeIconColor(WidgetTester tester) => tester
      .widget<RichText>(
        find.descendant(
          of: find.byIcon(Icons.close),
          matching: find.byType(RichText),
        ),
      )
      .text
      .style
      ?.color;

  testWidgets(
    'it cannot be shut while a save runs, and reports the change after',
    (tester) async {
      admin.saving = Completer<void>();
      final result = await open(tester);
      await uploadBackdrop(tester);

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await settle(tester);
      await tester.tapAt(const Offset(2, 2));
      await settle(tester);
      await tester.tap(find.byIcon(Icons.close));
      await settle(tester);
      expect(find.byType(ChangeArtworkDialog), findsOneWidget);
      final disabled = Theme.of(
        tester.element(find.byType(ChangeArtworkDialog)),
      ).disabledColor;
      expect(closeIconColor(tester), disabled);

      admin.saving!.complete();
      await settle(tester);
      expect(closeIconColor(tester), isNot(disabled));
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await settle(tester);

      expect(find.byType(ChangeArtworkDialog), findsNothing);
      expect(await result, isTrue);
    },
  );

  testWidgets(
    'a second upload into a row that is still saving is turned away',
    (tester) async {
      admin.saving = Completer<void>();
      final result = await open(tester);
      await uploadBackdrop(tester);

      await tester.tap(find.text(l10n.uploadButton).at(1));
      await settle(tester);
      expect(admin.uploads, [ImageType.backdrop]);

      // Still held open by the first save, and free once it lands.
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await settle(tester);
      expect(find.byType(ChangeArtworkDialog), findsOneWidget);
      admin.saving!.complete();
      await settle(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await settle(tester);

      expect(find.byType(ChangeArtworkDialog), findsNothing);
      expect(await result, isTrue);
    },
  );

  testWidgets('Clear All does nothing while another save runs', (tester) async {
    admin.saving = Completer<void>();
    final result = await open(tester);
    await uploadBackdrop(tester);

    final clearAll = find.text(l10n.clearAllArtworkButton);
    await tester.ensureVisible(clearAll);
    await tester.tap(clearAll);
    await settle(tester);
    expect(find.text(l10n.confirmClearAll), findsNothing);

    // The upload still holds the dialog open until it lands.
    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await settle(tester);
    expect(find.byType(ChangeArtworkDialog), findsOneWidget);
    admin.saving!.complete();
    await settle(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await settle(tester);

    expect(find.byType(ChangeArtworkDialog), findsNothing);
    expect(await result, isTrue);
  });

  testWidgets("an upload's late refresh does not land on the item moved to", (
    tester,
  ) async {
    items.item = {
      'Id': 'e1',
      'Type': 'Episode',
      'Name': 'Pilot',
      'SeriesName': 'Show',
      'SeriesId': 's1',
      'SeasonName': 'Season 1',
      'SeasonId': 'se1',
      'ImageTags': {'Primary': 'still'},
    };
    items.others['se1'] = {
      'Id': 'se1',
      'Type': 'Season',
      'Name': 'Season 1',
      'SeriesName': 'Show',
      'SeriesId': 's1',
      'ImageTags': {'Primary': 'poster', 'Banner': 'banner'},
      'BackdropImageTags': ['backdrop'],
    };
    await open(tester);

    // The episode's refresh after the upload is slow to come back.
    items.heldId = 'e1';
    items.held = Completer<void>();
    await tester.tap(find.text(l10n.uploadButton).first);
    await settle(tester);
    expect(admin.uploads, [ImageType.primary]);

    // Meanwhile the season link moves the dialog to the season.
    await tester.tap(find.text('Season 1'));
    await settle(tester);
    expect(find.text('Pilot'), findsNothing);

    items.held!.complete();
    await settle(tester);

    // Still the season: the episode's answer was dropped.
    expect(find.text('Pilot'), findsNothing);
    expect(find.text('Season 1'), findsOneWidget);
  });

  testWidgets(
    'an upload finishing after a move refreshes the item it was for',
    (tester) async {
      items.item = {
        'Id': 'e1',
        'Type': 'Episode',
        'Name': 'Pilot',
        'SeriesName': 'Show',
        'SeriesId': 's1',
        'SeasonName': 'Season 1',
        'SeasonId': 'se1',
        'ImageTags': <String, String>{},
      };
      items.others['se1'] = {
        'Id': 'se1',
        'Type': 'Season',
        'Name': 'Season 1',
        'SeriesName': 'Show',
        'SeriesId': 's1',
        'ImageTags': {'Primary': 'poster', 'Banner': 'banner'},
        'BackdropImageTags': ['backdrop'],
      };
      await open(tester);
      expect(find.text(l10n.missing), findsOneWidget);

      // The episode's upload is still saving when the season link is used.
      admin.saving = Completer<void>();
      await tester.tap(find.text(l10n.uploadButton).first);
      await settle(tester);
      expect(admin.uploads, [ImageType.primary]);
      await tester.tap(find.text('Season 1'));
      await settle(tester);
      expect(find.text('Pilot'), findsNothing);

      admin.saving!.complete();
      await settle(tester);
      expect(find.text('Pilot'), findsNothing);

      // Back on the episode, its Primary row shows the upload.
      await tester.tap(find.byIcon(Icons.chevron_left));
      await settle(tester);
      expect(find.text('Pilot'), findsWidgets);
      expect(find.text(l10n.missing), findsNothing);
    },
  );

  group('a saved change is reported even when the refetch after it fails', () {
    testWidgets('download', (tester) async {
      admin.remoteBackdrops = [
        {
          'Url': 'http://provider/backdrop.jpg',
          'ProviderName': 'TheMovieDb',
          'Width': 1920,
          'Height': 1080,
        },
      ];
      final result = await open(tester);
      items.failing = true;

      final remoteCard = find.byType(OfflineAwareImage).last;
      await tester.ensureVisible(remoteCard);
      await tester.tap(remoteCard);
      await settle(tester);
      await tester.tap(find.text(l10n.download));
      await settle(tester);
      expect(admin.downloads, [ImageType.backdrop]);

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await settle(tester);
      expect(find.byType(ChangeArtworkDialog), findsNothing);
      expect(await result, isTrue);
    });

    testWidgets('delete', (tester) async {
      final result = await open(tester);
      items.failing = true;

      // The album's cover is its only current image.
      await tester.tap(find.byType(OfflineAwareImage));
      await settle(tester);
      await tester.tap(find.text(l10n.yes));
      await settle(tester);
      expect(admin.deletes, [ImageType.primary]);

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await settle(tester);
      expect(find.byType(ChangeArtworkDialog), findsNothing);
      expect(await result, isTrue);
    });

    testWidgets('Clear All', (tester) async {
      final result = await open(tester);
      items.failing = true;

      final clearAll = find.text(l10n.clearAllArtworkButton);
      await tester.ensureVisible(clearAll);
      await tester.tap(clearAll);
      await settle(tester);
      await tester.tap(find.text(l10n.yes));
      await settle(tester);
      expect(admin.deletes, [ImageType.primary]);

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await settle(tester);
      expect(find.byType(ChangeArtworkDialog), findsNothing);
      expect(await result, isTrue);
    });
  });

  testWidgets('an older refresh coming back last does not bring back Missing', (
    tester,
  ) async {
    // The opening fetch is slow and answers with the album before the upload.
    items.heldId = 'a1';
    items.held = Completer<void>();
    await open(tester);
    await uploadBackdrop(tester);
    expect(find.text(l10n.missing), findsOneWidget);

    items.held!.complete();
    await settle(tester);

    expect(find.text(l10n.missing), findsOneWidget);
  });

  testWidgets('Clear All removes what the opening fetch found', (tester) async {
    // The page's copy only knows the cover; the server also has disc art.
    items.item = {
      ...items.item,
      'ImageTags': {'Primary': 'cover', 'Disc': 'disc'},
    };
    items.heldId = 'a1';
    items.held = Completer<void>();
    await open(
      tester,
      shown: {
        ...items.item,
        'ImageTags': {'Primary': 'cover'},
      },
    );

    final clearAll = find.text(l10n.clearAllArtworkButton);
    await tester.ensureVisible(clearAll);
    await tester.tap(clearAll);
    await settle(tester);
    // The opening fetch lands while the confirmation is up.
    items.held!.complete();
    await settle(tester);
    await tester.tap(find.text(l10n.yes));
    await settle(tester);

    expect(admin.deletes, [ImageType.primary, ImageType.disc]);
  });

  testWidgets('Clear All removes what the opening fetch found mid-way', (
    tester,
  ) async {
    items.item = {
      ...items.item,
      'ImageTags': {'Primary': 'cover', 'Disc': 'disc'},
    };
    items.heldId = 'a1';
    items.held = Completer<void>();
    await open(
      tester,
      shown: {
        ...items.item,
        'ImageTags': {'Primary': 'cover'},
      },
    );

    final clearAll = find.text(l10n.clearAllArtworkButton);
    await tester.ensureVisible(clearAll);
    await tester.tap(clearAll);
    await settle(tester);
    admin.deleting = Completer<void>();
    await tester.tap(find.text(l10n.yes));
    await settle(tester);
    // The opening fetch lands while the first delete is still running.
    items.held!.complete();
    await settle(tester);
    admin.deleting!.complete();
    await settle(tester);

    expect(admin.deletes, [ImageType.primary, ImageType.disc]);
  });

  testWidgets('Clear All removes what the opening fetch found in a row it '
      'had already passed', (tester) async {
    // The page's copy only knows the backdrop; the server also has a cover.
    items.item = {
      ...items.item,
      'ImageTags': {'Primary': 'cover'},
      'BackdropImageTags': ['backdrop'],
    };
    items.heldId = 'a1';
    items.held = Completer<void>();
    await open(
      tester,
      shown: {...items.item, 'ImageTags': <String, dynamic>{}},
    );

    final clearAll = find.text(l10n.clearAllArtworkButton);
    await tester.ensureVisible(clearAll);
    await tester.tap(clearAll);
    await settle(tester);
    admin.deleting = Completer<void>();
    await tester.tap(find.text(l10n.yes));
    await settle(tester);
    // The opening fetch lands after Clear All has started.
    items.held!.complete();
    await settle(tester);
    admin.deleting!.complete();
    await settle(tester);

    expect(admin.deletes, [ImageType.primary, ImageType.backdrop]);
  });

  testWidgets(
    "Clear All finishing leaves another item's save holding it open",
    (tester) async {
      items.item = {
        'Id': 'e1',
        'Type': 'Episode',
        'Name': 'Pilot',
        'SeriesName': 'Show',
        'SeriesId': 's1',
        'SeasonName': 'Season 1',
        'SeasonId': 'se1',
        'ImageTags': {'Primary': 'still'},
      };
      items.others['se1'] = {
        'Id': 'se1',
        'Type': 'Season',
        'Name': 'Season 1',
        'SeriesName': 'Show',
        'SeriesId': 's1',
        'ImageTags': {'Primary': 'poster', 'Banner': 'banner'},
        'BackdropImageTags': <String>[],
      };
      final result = await open(tester);

      // Clear All on the episode is still deleting...
      admin.deleting = Completer<void>();
      final clearAll = find.text(l10n.clearAllArtworkButton);
      await tester.ensureVisible(clearAll);
      await tester.tap(clearAll);
      await settle(tester);
      await tester.tap(find.text(l10n.yes));
      await settle(tester);

      // ...while a backdrop upload starts on the season.
      await tester.tap(find.text('Season 1'));
      await settle(tester);
      admin.saving = Completer<void>();
      final backdropUpload = find.text(l10n.uploadButton).at(1);
      await tester.ensureVisible(backdropUpload);
      await tester.tap(backdropUpload);
      await settle(tester);
      expect(admin.uploads, [ImageType.backdrop]);

      admin.deleting!.complete();
      await settle(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await settle(tester);
      expect(find.byType(ChangeArtworkDialog), findsOneWidget);

      admin.saving!.complete();
      await settle(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await settle(tester);
      expect(find.byType(ChangeArtworkDialog), findsNothing);
      expect(await result, isTrue);
    },
  );

  testWidgets('closing without a change reports none', (tester) async {
    final result = await open(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await settle(tester);

    expect(find.byType(ChangeArtworkDialog), findsNothing);
    expect(await result, isNot(isTrue));
  });
}
