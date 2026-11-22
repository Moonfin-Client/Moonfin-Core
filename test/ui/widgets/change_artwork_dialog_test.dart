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

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async => Map<String, dynamic>.from(item);
}

class _FakeAdminItemsApi extends Fake implements AdminItemsApi {
  _FakeAdminItemsApi(this.items);

  final _FakeItemsApi items;
  final uploads = <ImageType>[];

  /// While set, an upload waits on it, the way a large file keeps saving.
  Completer<void>? saving;

  @override
  Future<Map<String, dynamic>> getRemoteImages(
    String itemId, {
    required ImageType imageType,
    int? startIndex,
    int? limit,
    String? providerName,
    bool? includeAllLanguages,
  }) async => {'Images': const []};

  @override
  Future<void> uploadItemImage(
    String itemId, {
    required ImageType imageType,
    required List<int> bytes,
    required String contentType,
  }) async {
    uploads.add(imageType);
    await saving?.future;
    items.item = {
      ...items.item,
      'BackdropImageTags': ['uploaded'],
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

  /// Opens the dialog for the album. Returns what it resolves to once closed.
  Future<Future<bool?>> open(WidgetTester tester) async {
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
                  id: 'a1',
                  serverId: 'server',
                  rawData: items.item,
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
