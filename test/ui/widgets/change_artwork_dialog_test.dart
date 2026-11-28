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
  /// The server's items by id.
  final library = <String, Map<String, dynamic>>{
    'a1': {
      'Id': 'a1',
      'Type': 'MusicAlbum',
      'Name': 'AlbumRed',
      'ImageTags': {'Primary': 'cover'},
      'BackdropImageTags': <String>[],
    },
  };

  /// The item the dialog opens on.
  Map<String, dynamic> get item => library['a1']!;
  set item(Map<String, dynamic> value) => library['a1'] = value;

  bool failing = false;

  /// Holds back the next fetch until it completes.
  Completer<void>? hold;

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async {
    final held = hold;
    hold = null;
    if (held != null) await held.future;
    if (failing) throw Exception('connection lost');
    return Map<String, dynamic>.from(library[itemId]!);
  }
}

class _FakeAdminItemsApi extends Fake implements AdminItemsApi {
  _FakeAdminItemsApi(this.items);

  final _FakeItemsApi items;
  final uploads = <ImageType>[];
  final downloads = <ImageType>[];
  List<Map<String, dynamic>> remoteBackdrops = const [];

  /// Every delete sent, as "itemId Type index".
  final deletes = <String>[];

  /// Holds back the next delete until it completes.
  Completer<void>? deleteHold;

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
    items.library[itemId] = {
      ...items.library[itemId]!,
      'BackdropImageTags': ['uploaded'],
    };
  }

  @override
  Future<void> deleteItemImage(
    String itemId, {
    required ImageType imageType,
    int? imageIndex,
  }) async {
    deletes.add('$itemId ${imageType.toServerString()} $imageIndex');
    final held = deleteHold;
    deleteHold = null;
    if (held != null) await held.future;
    final item = items.library[itemId]!;
    if (imageType == ImageType.backdrop) {
      final backdrops = List<String>.from(item['BackdropImageTags'] as List);
      backdrops.removeAt(imageIndex!);
      items.library[itemId] = {...item, 'BackdropImageTags': backdrops};
    } else {
      final tags = Map<String, dynamic>.from(item['ImageTags'] as Map);
      tags.remove(imageType.toServerString());
      items.library[itemId] = {...item, 'ImageTags': tags};
    }
  }
}

class _FakeImageApi extends Fake implements ImageApi {
  @override
  dynamic noSuchMethod(Invocation invocation) => '';
}

const _filePicker = MethodChannel('miguelruivo.flutter.plugins.filepicker');

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

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          _filePicker,
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
        .setMockMethodCallHandler(_filePicker, null);
    await GetIt.instance.reset();
  });

  // Artwork that never loads keeps a spinner going, so this pumps a fixed
  // number of frames rather than waiting for the screen to settle.
  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  Future<Future<bool>> open(
    WidgetTester tester, {
    Map<String, dynamic>? card,
  }) async {
    tester.view.physicalSize = const Size(1400, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    late Future<bool> result;
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
                  id: 'a1',
                  serverId: 'server',
                  rawData: card ?? items.item,
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

  final closeRoutes = <String, Future<void> Function(WidgetTester)>{
    'the close button': (tester) => tester.tap(find.byIcon(Icons.close)),
    'Escape': (tester) => tester.sendKeyEvent(LogicalKeyboardKey.escape),
    'a tap outside': (tester) => tester.tapAt(const Offset(2, 2)),
  };
  for (final MapEntry(key: route, value: close) in closeRoutes.entries) {
    testWidgets('a change is reported when $route shuts it', (tester) async {
      final result = await open(tester);
      await uploadBackdrop(tester);

      await close(tester);
      await settle(tester);

      expect(find.byType(ChangeArtworkDialog), findsNothing);
      expect(await result, isTrue);
    });
  }

  testWidgets('a download is reported even when the refetch after it fails', (
    tester,
  ) async {
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
    expect(await result, isTrue);
  });

  // A library card carries one backdrop tag and leaves out images such as the
  // disc, so Clear All has to work from the dialog's own fetch of the item.
  final fetchLandings = [
    'before Clear All',
    'while it asks',
    'after confirming',
  ];
  for (final landing in fetchLandings) {
    testWidgets('Clear All removes every image when the fetch lands $landing', (
      tester,
    ) async {
      items.item = {
        ...items.item,
        'ImageTags': {'Primary': 'cover', 'Disc': 'disc'},
        'BackdropImageTags': ['blue', 'green', 'yellow'],
      };
      final fetch = Completer<void>();
      items.hold = fetch;
      await open(
        tester,
        card: {
          ...items.item,
          'ImageTags': {'Primary': 'cover'},
          'BackdropImageTags': ['blue'],
        },
      );

      if (landing == 'before Clear All') fetch.complete();
      await settle(tester);
      await tester.tap(find.text(l10n.clearAllArtworkButton));
      await settle(tester);
      if (landing == 'while it asks') fetch.complete();
      await settle(tester);
      await tester.tap(find.text(l10n.yes));
      await settle(tester);
      if (landing == 'after confirming') {
        expect(admin.deletes, isEmpty);
        fetch.complete();
      }
      await settle(tester);

      expect(items.item['ImageTags'], isEmpty);
      expect(items.item['BackdropImageTags'], isEmpty);
    });
  }

  testWidgets(
    'Clear All after following the series link clears only the series',
    (tester) async {
      items.item = {
        'Id': 'a1',
        'Type': 'Episode',
        'Name': 'Pilot',
        'SeriesName': 'ShowBlue',
        'SeriesId': 's1',
        'ImageTags': {'Primary': 'still'},
        'BackdropImageTags': <String>[],
      };
      items.library['s1'] = {
        'Id': 's1',
        'Type': 'Series',
        'Name': 'ShowBlue',
        'ImageTags': {'Primary': 'poster', 'Logo': 'logo'},
        'BackdropImageTags': ['blue', 'green'],
      };
      final fetch = Completer<void>();
      items.hold = fetch;
      await open(tester);

      await tester.tap(find.text('ShowBlue'));
      await settle(tester);
      await tester.tap(find.text(l10n.clearAllArtworkButton));
      await settle(tester);
      await tester.tap(find.text(l10n.yes));
      await settle(tester);
      expect(items.library['s1']!['ImageTags'], isEmpty);
      expect(items.library['s1']!['BackdropImageTags'], isEmpty);
      fetch.complete();
      await settle(tester);

      expect(items.item['ImageTags'], {'Primary': 'still'});
    },
  );

  testWidgets(
    'Clear All deletes nothing when the series link is followed while it waits',
    (tester) async {
      items.item = {
        'Id': 'a1',
        'Type': 'Episode',
        'Name': 'Pilot',
        'SeriesName': 'ShowBlue',
        'SeriesId': 's1',
        'ImageTags': {'Primary': 'still'},
        'BackdropImageTags': <String>[],
      };
      items.library['s1'] = {
        'Id': 's1',
        'Type': 'Series',
        'Name': 'ShowBlue',
        'ImageTags': {'Primary': 'poster', 'Logo': 'logo'},
        'BackdropImageTags': ['blue', 'green'],
      };
      final fetch = Completer<void>();
      items.hold = fetch;
      await open(tester);

      await tester.tap(find.text(l10n.clearAllArtworkButton));
      await settle(tester);
      await tester.tap(find.text(l10n.yes));
      await settle(tester);
      await tester.tap(find.text('ShowBlue'));
      await settle(tester);
      fetch.complete();
      await settle(tester);

      expect(items.item['ImageTags'], {'Primary': 'still'});
      expect(items.library['s1']!['ImageTags'], {
        'Primary': 'poster',
        'Logo': 'logo',
      });
      expect(items.library['s1']!['BackdropImageTags'], ['blue', 'green']);
    },
  );

  testWidgets(
    'Clear All after going back to the episode removes every episode image',
    (tester) async {
      items.item = {
        'Id': 'a1',
        'Type': 'Episode',
        'Name': 'Pilot',
        'SeriesName': 'ShowBlue',
        'SeriesId': 's1',
        'ImageTags': {'Primary': 'still'},
        'BackdropImageTags': <String>[],
      };
      items.library['s1'] = {
        'Id': 's1',
        'Type': 'Series',
        'Name': 'ShowBlue',
        'ImageTags': {'Primary': 'poster', 'Logo': 'logo'},
        'BackdropImageTags': ['blue', 'green'],
      };
      final fetch = Completer<void>();
      items.hold = fetch;
      await open(
        tester,
        card: {...items.item, 'ImageTags': <String, dynamic>{}},
      );

      await tester.tap(find.text('ShowBlue'));
      await settle(tester);
      fetch.complete();
      await settle(tester);
      await tester.tap(find.byIcon(Icons.chevron_left).first);
      await settle(tester);
      await tester.tap(find.text(l10n.clearAllArtworkButton));
      await settle(tester);
      await tester.tap(find.text(l10n.yes));
      await settle(tester);

      expect(items.item['ImageTags'], isEmpty);
      expect(items.library['s1']!['ImageTags'], {
        'Primary': 'poster',
        'Logo': 'logo',
      });
      expect(items.library['s1']!['BackdropImageTags'], ['blue', 'green']);
    },
  );

  testWidgets(
    'Clear All finishes the season when the series link is followed between '
    'deletes',
    (tester) async {
      items.item = {
        'Id': 'a1',
        'Type': 'Season',
        'Name': 'Season 1',
        'SeriesName': 'ShowBlue',
        'SeriesId': 's1',
        'ImageTags': {'Primary': 'cover'},
        'BackdropImageTags': ['red'],
      };
      items.library['s1'] = {
        'Id': 's1',
        'Type': 'Series',
        'Name': 'ShowBlue',
        'ImageTags': {'Primary': 'poster'},
        'BackdropImageTags': ['blue', 'green', 'yellow'],
      };
      await open(tester);

      final primaryDelete = Completer<void>();
      admin.deleteHold = primaryDelete;
      await tester.tap(find.text(l10n.clearAllArtworkButton));
      await settle(tester);
      await tester.tap(find.text(l10n.yes));
      await settle(tester);
      await tester.tap(find.text('ShowBlue'));
      await settle(tester);
      primaryDelete.complete();
      await settle(tester);

      expect(admin.deletes, ['a1 Primary null', 'a1 Backdrop 0']);
      expect(items.item['ImageTags'], isEmpty);
      expect(items.item['BackdropImageTags'], isEmpty);
      expect(items.library['s1']!['ImageTags'], {'Primary': 'poster'});
      expect(items.library['s1']!['BackdropImageTags'], [
        'blue',
        'green',
        'yellow',
      ]);

      await tester.tap(find.byIcon(Icons.chevron_left).first);
      await settle(tester);

      expect(find.text('Season 1'), findsOneWidget);
      // Primary, Backdrop and Banner are all cleared on the season.
      expect(find.text(l10n.missing), findsNWidgets(3));
    },
  );

  testWidgets(
    'Clear All refetch stays on the season when the series link was followed',
    (tester) async {
      items.item = {
        'Id': 'a1',
        'Type': 'Season',
        'Name': 'Season 1',
        'SeriesName': 'ShowBlue',
        'SeriesId': 's1',
        'ImageTags': {'Primary': 'cover'},
        'BackdropImageTags': ['red'],
      };
      items.library['s1'] = {
        'Id': 's1',
        'Type': 'Series',
        'Name': 'ShowBlue',
        'ImageTags': {'Primary': 'poster', 'Logo': 'logo', 'Thumb': 'thumb'},
        'BackdropImageTags': ['blue'],
      };
      await open(tester);

      final refetch = Completer<void>();
      items.hold = refetch;
      await tester.tap(find.text(l10n.clearAllArtworkButton));
      await settle(tester);
      await tester.tap(find.text(l10n.yes));
      await settle(tester);
      expect(items.item['ImageTags'], isEmpty);
      expect(items.item['BackdropImageTags'], isEmpty);
      await tester.tap(find.text('ShowBlue'));
      await settle(tester);
      refetch.complete();
      await settle(tester);

      expect(find.text('Season 1'), findsNothing);
      expect(find.text('ShowBlue'), findsOneWidget);
      // Banner and Art are the series' only empty rows.
      expect(find.text(l10n.missing), findsNWidgets(2));

      await tester.tap(find.byIcon(Icons.chevron_left).first);
      await settle(tester);

      expect(find.text('Season 1'), findsOneWidget);
      // Primary, Backdrop and Banner are all cleared on the season.
      expect(find.text(l10n.missing), findsNWidgets(3));
    },
  );

  testWidgets(
    'Clear All refreshes every history entry for the item it cleared',
    (tester) async {
      items.item = {
        'Id': 'a1',
        'Type': 'Episode',
        'Name': 'Pilot',
        'SeriesName': 'ShowBlue',
        'SeriesId': 's1',
        'ImageTags': {'Primary': 'still'},
        'BackdropImageTags': <String>[],
      };
      items.library['s1'] = {
        'Id': 's1',
        'Type': 'Series',
        'Name': 'ShowBlue',
        'ImageTags': {'Primary': 'poster', 'Logo': 'logo'},
        'BackdropImageTags': ['blue'],
      };
      await open(tester);

      // Two taps on the series link before the first one loads.
      final firstTap = Completer<void>();
      items.hold = firstTap;
      await tester.tap(find.text('ShowBlue'));
      await tester.pump();
      await tester.tap(find.text('ShowBlue'));
      await settle(tester);
      firstTap.complete();
      await settle(tester);

      await tester.tap(find.text(l10n.clearAllArtworkButton));
      await settle(tester);
      await tester.tap(find.text(l10n.yes));
      await settle(tester);
      await tester.tap(find.byIcon(Icons.chevron_left).first);
      await settle(tester);

      expect(find.text('ShowBlue'), findsOneWidget);
      expect(find.text('Pilot'), findsNothing);
      // Every series row: Primary, Backdrop, Banner, Logo, Thumb and Art.
      expect(find.text(l10n.missing), findsNWidgets(6));
    },
  );

  testWidgets(
    'Clear All deletes nothing once the dialog closes while it waits',
    (tester) async {
      items.item = {
        ...items.item,
        'ImageTags': {'Primary': 'cover', 'Disc': 'disc'},
        'BackdropImageTags': ['blue', 'green'],
      };
      final fetch = Completer<void>();
      items.hold = fetch;
      final result = await open(
        tester,
        card: {
          ...items.item,
          'ImageTags': {'Primary': 'cover'},
          'BackdropImageTags': ['blue'],
        },
      );

      await tester.tap(find.text(l10n.clearAllArtworkButton));
      await settle(tester);
      await tester.tap(find.text(l10n.yes));
      await settle(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await settle(tester);
      expect(find.byType(ChangeArtworkDialog), findsNothing);
      fetch.complete();
      await settle(tester);

      expect(await result, isFalse);
      expect(items.item['ImageTags'], {'Primary': 'cover', 'Disc': 'disc'});
      expect(items.item['BackdropImageTags'], ['blue', 'green']);
    },
  );

  testWidgets('closing without a change reports none', (tester) async {
    final result = await open(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await settle(tester);

    expect(find.byType(ChangeArtworkDialog), findsNothing);
    expect(await result, isFalse);
  });
}
