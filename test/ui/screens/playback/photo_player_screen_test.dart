import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/playback/photo_player_screen.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockImageApi extends Mock implements ImageApi {}

Map<String, dynamic> _photo(int n) => {
  'Id': 'photo$n',
  'ServerId': 'server',
  'Name': 'Photo $n',
  'Type': 'Photo',
  'ParentId': 'album',
};

void main() {
  late _MockItemsApi items;

  setUp(() {
    items = _MockItemsApi();
    final images = _MockImageApi();
    final client = _MockClient();
    when(() => client.itemsApi).thenReturn(items);
    when(() => client.imageApi).thenReturn(images);
    when(
      () => images.getPrimaryImageUrl(
        any(),
        maxWidth: any(named: 'maxWidth'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('http://localhost/photo.jpg');
    when(() => items.getItem('photo2')).thenAnswer((_) async => _photo(2));
    when(
      () => items.getItems(
        parentId: any(named: 'parentId'),
        includeItemTypes: any(named: 'includeItemTypes'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        limit: any(named: 'limit'),
      ),
    ).thenAnswer(
      (_) async => {
        'Items': [_photo(1), _photo(2), _photo(3)],
      },
    );
    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  /// Opens the viewer on the album's second photo.
  Future<void> pumpViewer(WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const PhotoPlayerScreen(itemId: 'photo2'),
      ),
    );
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Photo 2'), findsOneWidget);
  }

  Future<void> swipe(WidgetTester tester, Offset by) async {
    await tester.dragFrom(const Offset(400, 600), by);
    await tester.pump(const Duration(milliseconds: 500));
  }

  testWidgets('swiping left shows the next photo', (tester) async {
    await pumpViewer(tester);
    await swipe(tester, const Offset(-200, 0));
    expect(find.text('Photo 3'), findsOneWidget);
  });

  testWidgets('swiping right shows the previous photo', (tester) async {
    await pumpViewer(tester);
    await swipe(tester, const Offset(200, 0));
    expect(find.text('Photo 1'), findsOneWidget);
  });

  testWidgets('a swipe wraps around the album', (tester) async {
    await pumpViewer(tester);
    await swipe(tester, const Offset(-200, 0));
    await swipe(tester, const Offset(-200, 0));
    expect(find.text('Photo 1'), findsOneWidget);
  });

  testWidgets('a swipe that begins on the overlay still navigates', (
    tester,
  ) async {
    await pumpViewer(tester);
    await tester.dragFrom(const Offset(400, 1150), const Offset(-200, 0));
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Photo 3'), findsOneWidget);
  });

  testWidgets('a short drag or a mostly vertical one does nothing', (
    tester,
  ) async {
    await pumpViewer(tester);
    await swipe(tester, const Offset(-20, 0));
    await swipe(tester, const Offset(-80, 200));
    expect(find.text('Photo 2'), findsOneWidget);
  });

  testWidgets('pinching does not change the photo', (tester) async {
    await pumpViewer(tester);
    const center = Offset(400, 600);
    final first = await tester.startGesture(center - const Offset(30, 0));
    final second = await tester.startGesture(center + const Offset(30, 0));
    await first.moveBy(const Offset(-120, 0));
    await second.moveBy(const Offset(120, 0));
    await first.up();
    await second.up();
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Photo 2'), findsOneWidget);
  });

  testWidgets('a pinch that ends on one finger does not change the photo', (
    tester,
  ) async {
    await pumpViewer(tester);
    const center = Offset(400, 600);
    final first = await tester.startGesture(center - const Offset(30, 0));
    final second = await tester.startGesture(center + const Offset(30, 0));
    await second.up();
    await first.moveBy(const Offset(-200, 0));
    await first.up();
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Photo 2'), findsOneWidget);
  });
}
