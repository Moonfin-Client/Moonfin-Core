import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin_mobile_ui/moonfin_mobile_ui.dart';

const movie = MobileMedia(
  id: 'server/movie',
  title: 'A film',
  kind: MobileMediaKind.movie,
  metadata: '2024 · Adventure',
  overview: 'A story worth discovering.',
);
const series = MobileMedia(
  id: 'server/series',
  title: 'A series',
  kind: MobileMediaKind.series,
  saved: true,
);
const otherMovie = MobileMedia(
  id: 'server/other',
  title: 'Unsaved movie',
  kind: MobileMediaKind.movie,
);
const rails = [
  MobileMediaRail(
    id: 'library',
    title: 'Your collection',
    items: [movie, series, otherMovie],
  ),
];

Finder control(String label) => find.byWidgetPredicate(
  (widget) => widget is CinemaPressable && widget.label == label,
);

Widget home({
  MobileCinemaMode mode = MobileCinemaMode.appleTv,
  ValueChanged<MobileCinemaMode>? onMode,
  ValueChanged<MobileMedia>? onOpen,
  ValueChanged<MobileMedia>? onPlay,
  Future<void> Function(MobileMedia, bool)? onSave,
  List<MobileMediaRail> rows = rails,
  bool loading = false,
  double textScale = 1,
}) => CupertinoApp(
  home: CupertinoPageScaffold(
    child: Builder(
      builder: (context) => MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.linear(textScale)),
        child: MobileCinemaHome(
          mode: mode,
          rails: rows,
          onModeChanged: onMode ?? (_) {},
          onOpen: onOpen ?? (_) {},
          onPlay: onPlay ?? (_) {},
          onSave: onSave,
          onSearch: () {},
          onProfile: () {},
          onRefresh: () async {},
          artworkBuilder: (_, _, _) =>
              const ColoredBox(color: Color(0xFF303034)),
          loading: loading,
        ),
      ),
    ),
  ),
);

Future<void> mount(
  WidgetTester tester,
  Widget widget, {
  double width = 430,
}) async {
  tester.view.physicalSize = Size(width, 932);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(widget);
  await tester.pump();
}

void main() {
  test('unknown modes use Apple TV', () {
    expect(MobileCinemaMode.fromPreference('future'), MobileCinemaMode.appleTv);
    expect(
      MobileCinemaMode.fromPreference('netflix'),
      MobileCinemaMode.netflix,
    );
  });

  testWidgets('the new home has no Material controls or Material surfaces', (
    tester,
  ) async {
    await mount(tester, home());
    expect(find.byType(material.Material), findsNothing);
    expect(find.byType(material.InkWell), findsNothing);
    expect(find.byType(material.IconButton), findsNothing);
    expect(find.byType(material.NavigationBar), findsNothing);
    await tester.tap(control('Appearance').first);
    await tester.pumpAndSettle();
    expect(find.byType(material.Material), findsNothing);
    expect(control('Netflix mode'), findsOneWidget);
  });

  testWidgets('changes mode through the appearance sheet', (tester) async {
    MobileCinemaMode? selected;
    await mount(tester, home(onMode: (value) => selected = value));
    await tester.tap(control('Appearance').first);
    await tester.pumpAndSettle();
    await tester.tap(control('Netflix mode'));
    await tester.pumpAndSettle();
    expect(selected, MobileCinemaMode.netflix);
  });

  testWidgets('Apple and Netflix have distinct layouts and actions', (
    tester,
  ) async {
    MobileMedia? played;
    await mount(tester, home(onPlay: (value) => played = value));
    expect(find.text('Home'), findsOneWidget);
    await tester.tap(control('Watch Now').first);
    expect(played?.id, movie.id);
    await tester.pumpWidget(
      home(mode: MobileCinemaMode.netflix, onSave: (_, _) async {}),
    );
    await tester.pumpAndSettle();
    expect(find.text('MOONFIN'), findsOneWidget);
    expect(control('Play'), findsWidgets);
    expect(control('My List'), findsWidgets);
    expect(find.text('Home'), findsNothing);
  });

  testWidgets('filters both the featured content and the rails', (
    tester,
  ) async {
    await mount(tester, home());
    await tester.tap(control('Series').first);
    await tester.pumpAndSettle();
    expect(find.text('A series'), findsWidgets);
    expect(find.text('A film'), findsNothing);
    await tester.tap(control('Movies').first);
    await tester.pumpAndSettle();
    expect(find.text('A film'), findsWidgets);
    expect(find.text('A series'), findsNothing);
  });

  testWidgets('persists a favorite and filters out unsaved titles', (
    tester,
  ) async {
    String? saved;
    await mount(
      tester,
      home(
        onSave: (item, value) async {
          if (value) saved = item.id;
        },
      ),
    );
    await tester.tap(control('Add to favorites').first);
    await tester.pumpAndSettle();
    expect(saved, movie.id);
    await tester.drag(
      find.byKey(const ValueKey('cinema-categories')),
      const Offset(-300, 0),
    );
    await tester.pumpAndSettle();
    await tester.tap(control('Favorites').first);
    await tester.pumpAndSettle();
    expect(find.text('A film'), findsWidgets);
    expect(find.text('Unsaved movie'), findsNothing);
  });

  testWidgets('rolls back failed saves and shows an accessible inline notice', (
    tester,
  ) async {
    await mount(
      tester,
      home(onSave: (_, _) async => throw StateError('offline')),
    );
    await tester.tap(control('Add to favorites').first);
    await tester.pumpAndSettle();
    expect(
      find.text('Could not update favorites. Please try again.'),
      findsOneWidget,
    );
    await tester.drag(
      find.byKey(const ValueKey('cinema-categories')),
      const Offset(-300, 0),
    );
    await tester.pumpAndSettle();
    await tester.tap(control('Favorites').first);
    await tester.pumpAndSettle();
    expect(find.text('A film'), findsNothing);
    expect(find.text('A series'), findsWidgets);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('supports empty and Cupertino loading states', (tester) async {
    await mount(tester, home(rows: []));
    expect(control('Refresh library'), findsOneWidget);
    await tester.pumpWidget(home(rows: [], loading: true));
    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
  });

  testWidgets('custom controls support keyboard activation', (tester) async {
    var activated = false;
    await mount(
      tester,
      CupertinoApp(
        home: Center(
          child: CinemaButton(
            mode: MobileCinemaMode.netflix,
            label: 'Play',
            onPressed: () => activated = true,
          ),
        ),
      ),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    expect(activated, isTrue);
  });

  for (final mode in MobileCinemaMode.values) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('${mode.label} fits 320px at ${scale}x text', (tester) async {
        await mount(
          tester,
          home(mode: mode, textScale: scale, onSave: (_, _) async {}),
          width: 320,
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        await tester.drag(find.byType(CustomScrollView), const Offset(0, -650));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets(
    'both custom navigation bars are accessible and activate destinations',
    (tester) async {
      CinemaDestination? selected;
      for (final mode in MobileCinemaMode.values) {
        await mount(
          tester,
          CupertinoApp(
            home: Center(
              child: CinemaNavigationBar(
                mode: mode,
                selected: CinemaDestination.home,
                onSelected: (value) => selected = value,
              ),
            ),
          ),
        );
        await tester.tap(control('Downloads'));
        expect(selected, CinemaDestination.downloads);
        expect(find.byType(material.NavigationBar), findsNothing);
      }
    },
  );
}
