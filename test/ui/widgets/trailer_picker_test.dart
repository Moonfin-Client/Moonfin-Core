import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/trailer_picker.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';

AggregatedItem _local(String id, String name, {int? ticks}) => AggregatedItem(
  id: id,
  serverId: 's',
  rawData: {'Id': id, 'Name': name, 'RunTimeTicks': ?ticks},
);

// Links off YouTube, so the rows load no thumbnails and ask YouTube nothing.
final _choices = trailerChoicesFor(
  locals: const [],
  remoteTrailers: [
    {
      'Url': 'https://example.com/one.mp4',
      'Name': 'Official Trailer [Subtitled]',
    },
    {'Url': 'https://example.com/two.mp4', 'Name': 'Official Teaser'},
  ],
);

/// Pumps a page whose Open button shows the picker, and hands back what the
/// latest open picked.
Future<Future<TrailerChoice?>? Function()> _pumpPicker(
  WidgetTester tester,
) async {
  Future<TrailerChoice?>? picked;
  await tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.buildTheme(ThemeRegistry.active),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () => picked = TrailerPicker.show(
                context,
                itemName: 'Cyberpunk: Edgerunners',
                choices: _choices,
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    ),
  );
  return () => picked;
}

void main() {
  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));
  tearDown(
    () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
  );

  test('lists files on the server first, then each linked video once', () {
    final choices = trailerChoicesFor(
      locals: [_local('a', 'Trailer', ticks: 900000000)],
      remoteTrailers: [
        {
          'Url': 'https://www.youtube.com/watch?v=JtqIas3bYhg',
          'Name': 'Official NSFW Trailer [Subtitled]',
        },
        {'Url': 'https://youtu.be/JtqIas3bYhg', 'Name': 'The same video'},
        {'Url': '', 'Name': 'No link'},
        {'Url': 'https://www.youtube.com/watch?v=x4ztgjvfU60'},
      ],
    );

    expect(choices.map((c) => c.title), [
      'Trailer',
      'Official NSFW Trailer',
      '',
    ]);
    expect(choices[0].local?.id, 'a');
    expect(choices[0].length, const Duration(seconds: 90));
    expect(choices[1].subtitled, isTrue);
    expect(
      choices[1].thumbnailUrl,
      'https://i.ytimg.com/vi/JtqIas3bYhg/mqdefault.jpg',
    );
    expect(choices[2].subtitled, isFalse);
  });

  test('offers YouTube trailers from Seerr ahead of its teasers', () {
    final choices = seerrTrailerChoices(const [
      SeerrVideo(key: 't1', name: 'Teaser', type: 'Teaser', site: 'YouTube'),
      SeerrVideo(
        key: 'f1',
        name: 'Featurette',
        type: 'Featurette',
        site: 'YouTube',
      ),
      SeerrVideo(key: 'v1', name: 'Elsewhere', type: 'Trailer', site: 'Vimeo'),
      SeerrVideo(key: 'a1', name: 'Trailer', type: 'Trailer', site: 'YouTube'),
    ]);

    expect(choices.map((c) => c.title), ['Trailer', 'Teaser']);
    expect(choices.first.url, 'https://www.youtube.com/watch?v=a1');
  });

  testWidgets('a phone picks a trailer from a bottom sheet', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    final picked = await _pumpPicker(tester);

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.byType(BottomSheet), findsOneWidget);
    expect(find.text('2 trailers'), findsOneWidget);
    expect(find.text('Official Trailer'), findsOneWidget);
    expect(find.text('Subtitled'), findsOneWidget);

    await tester.tap(find.text('Official Teaser'));
    await tester.pumpAndSettle();
    expect((await picked())?.url, 'https://example.com/two.mp4');
  });

  testWidgets('d-pad focus never leaves the side panel at any edge', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    final picked = await _pumpPicker(tester);

    // The page behind lives in a Scaffold and the panel doesn't, so a focus
    // with a Scaffold above it has fallen out of the panel.
    Future<void> press(LogicalKeyboardKey key) async {
      await tester.sendKeyEvent(key);
      await tester.pumpAndSettle();
      final focused = FocusManager.instance.primaryFocus?.context;
      expect(focused, isNotNull, reason: '$key');
      expect(
        focused!.findAncestorWidgetOfExactType<Scaffold>(),
        isNull,
        reason: '$key',
      );
    }

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.byType(BottomSheet), findsNothing);
    await press(LogicalKeyboardKey.arrowUp);
    await press(LogicalKeyboardKey.arrowLeft);
    await press(LogicalKeyboardKey.arrowRight);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();
    expect((await picked())?.url, 'https://example.com/one.mp4');

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    for (var i = 0; i < 4; i++) {
      await press(LogicalKeyboardKey.arrowDown);
    }
    await press(LogicalKeyboardKey.arrowLeft);
    await press(LogicalKeyboardKey.arrowRight);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();
    expect((await picked())?.url, 'https://example.com/two.mp4');
  });
}
