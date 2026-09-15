import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/modern_card_artwork.dart';
import 'package:moonfin/ui/widgets/media_card.dart';

class _ControlledImage extends ImageProvider<_ControlledImage> {
  final List<Completer<ImageInfo>> _frames = [];
  Completer<ImageInfo> get frame => _frames.last;
  int loads = 0;

  @override
  Future<_ControlledImage> obtainKey(ImageConfiguration configuration) =>
      SynchronousFuture(this);

  @override
  ImageStreamCompleter loadImage(
    _ControlledImage key,
    ImageDecoderCallback decode,
  ) {
    loads++;
    _frames.add(Completer<ImageInfo>.sync());
    return OneFrameImageStreamCompleter(frame.future);
  }

  Future<void> complete(Color color) async {
    final recorder = ui.PictureRecorder();
    Canvas(recorder).drawColor(color, BlendMode.src);
    frame.complete(
      ImageInfo(image: await recorder.endRecording().toImage(2, 2)),
    );
  }
}

void main() {
  const transitionDuration = Duration(milliseconds: 200);
  late _ControlledImage poster;
  late _ControlledImage landscape;
  late List<(String, int)> requests;
  late ImageProvider Function(String, int) providerBuilder;

  setUp(() {
    poster = _ControlledImage();
    landscape = _ControlledImage();
    requests = [];
    providerBuilder = (url, width) {
      requests.add((url, width));
      return url == 'poster' ? poster : landscape;
    };
  });

  Widget artwork(
    double progress, {
    String? posterUrl = 'poster',
    String? landscapeUrl = 'landscape',
  }) {
    return MediaQuery(
      data: const MediaQueryData(devicePixelRatio: 2),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SizedBox(
            width: 200 + 333 * progress,
            height: 300,
            child: ModernCardArtwork(
              posterImageUrl: posterUrl,
              expandedImageUrl: landscapeUrl,
              collapsedWidth: 200,
              expandedWidth: 533,
              imageHeight: 300,
              expansionProgress: progress,
              duration: transitionDuration,
              placeholder: const Text('Artwork unavailable'),
              imageProviderBuilder: providerBuilder,
            ),
          ),
        ),
      ),
    );
  }

  double landscapeOpacity(WidgetTester tester) =>
      tester.widget<Opacity>(find.byType(Opacity)).opacity;

  RenderImage posterRender(WidgetTester tester) =>
      tester.renderObject<RenderImage>(find.byType(RawImage).first);

  testWidgets('placeholder leaves layout once a poster frame is available', (
    tester,
  ) async {
    await tester.pumpWidget(artwork(0));
    expect(find.text('Artwork unavailable'), findsOneWidget);
    await tester.runAsync(() => poster.complete(Colors.red));
    await tester.pump();
    expect(find.text('Artwork unavailable'), findsNothing);
    await tester.pumpWidget(artwork(0.5));
    expect(find.text('Artwork unavailable'), findsNothing);
    expect(poster.loads, 1);
  });

  testWidgets('missing or failed poster retains the fallback', (tester) async {
    await tester.pumpWidget(artwork(0));
    poster.frame.completeError(StateError('Unavailable poster'));
    await tester.pump();
    expect(find.text('Artwork unavailable'), findsOneWidget);
    await tester.pumpWidget(artwork(0, posterUrl: null, landscapeUrl: null));
    expect(find.text('Artwork unavailable'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'card title and actions stay accessible without artwork duplicates',
    (tester) async {
      final semantics = tester.ensureSemantics();
      var opened = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: MediaCard(
              title: 'A test movie',
              subtitle: '1999',
              externalIsFocused: false,
              cardFocusExpansion: false,
              onTap: () => opened = true,
              artworkBuilder: (placeholder) => ModernCardArtwork(
                posterImageUrl: 'poster',
                expandedImageUrl: 'landscape',
                collapsedWidth: 150,
                expandedWidth: 400,
                imageHeight: 225,
                expansionProgress: 0,
                duration: transitionDuration,
                placeholder: placeholder,
                imageProviderBuilder: providerBuilder,
              ),
            ),
          ),
        ),
      );
      final gesture = find.descendant(
        of: find.byType(MediaCard),
        matching: find.byType(GestureDetector),
      );
      void checkLabelAndAction() {
        final data = tester.getSemantics(gesture).getSemanticsData();
        expect('A test movie'.allMatches(data.label).length, 1);
        expect(data.label, contains('1999'));
        expect(data.hasAction(ui.SemanticsAction.tap), isTrue);
      }

      checkLabelAndAction();
      await tester.runAsync(() => poster.complete(Colors.red));
      await tester.pump();
      checkLabelAndAction();
      final node = tester.getSemantics(gesture);
      tester.binding.renderViews.first.owner!.semanticsOwner!.performAction(
        node.id,
        ui.SemanticsAction.tap,
      );
      expect(opened, isTrue);
      semantics.dispose();
    },
  );

  testWidgets(
    'retains poster while loading and reverses the same decoded images',
    (tester) async {
      await tester.pumpWidget(artwork(0));
      await tester.runAsync(() => poster.complete(Colors.red));
      await tester.pump();
      final originalPoster = posterRender(tester).image;
      expect(originalPoster, isNotNull);
      expect(landscape.loads, 0);

      await tester.pumpWidget(artwork(0.6));
      expect(landscape.loads, 1);
      expect(landscapeOpacity(tester), 0);
      expect(posterRender(tester).image, same(originalPoster));

      await tester.runAsync(() => landscape.complete(Colors.blue));
      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      expect(landscapeOpacity(tester), greaterThan(0));
      expect(landscapeOpacity(tester), lessThan(0.6));
      await tester.pump(transitionDuration);
      expect(landscapeOpacity(tester), closeTo(0.6, 0.001));

      await tester.pumpWidget(artwork(0.25));
      expect(landscapeOpacity(tester), closeTo(0.25, 0.001));
      await tester.pumpWidget(artwork(0));
      expect(landscapeOpacity(tester), 0);
      expect(posterRender(tester).image, same(originalPoster));
      await tester.pumpWidget(artwork(1));
      expect(landscapeOpacity(tester), 1);
      expect(poster.loads, 1);
      expect(landscape.loads, 1);
      // Endpoint decode keys do not change with the painted width.
      expect(requests, [('poster', 400), ('landscape', 960)]);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('failed landscape keeps the poster and does not throw', (
    tester,
  ) async {
    await tester.pumpWidget(artwork(1));
    await tester.runAsync(() => poster.complete(Colors.red));
    await tester.pump();
    final originalPoster = posterRender(tester).image;
    landscape.frame.completeError(StateError('Unavailable landscape'));
    await tester.pump();
    await tester.pump(transitionDuration);
    expect(find.byType(Opacity), findsNothing);
    expect(posterRender(tester).image, same(originalPoster));
    expect(tester.takeException(), isNull);
  });

  testWidgets('a late frame stays hidden after focus has moved away', (
    tester,
  ) async {
    await tester.pumpWidget(artwork(0.7));
    await tester.pumpWidget(artwork(0));
    await tester.runAsync(() => landscape.complete(Colors.blue));
    await tester.pump();
    await tester.pump();
    await tester.pump(transitionDuration);
    expect(landscapeOpacity(tester), 0);
    await tester.pumpWidget(artwork(0.4));
    expect(landscapeOpacity(tester), closeTo(0.4, 0.001));
    expect(landscape.loads, 1);
  });

  testWidgets('failed landscape retries once on the next full expansion', (
    tester,
  ) async {
    await tester.pumpWidget(artwork(1));
    await tester.runAsync(() => poster.complete(Colors.red));
    await tester.pump();
    final originalPoster = posterRender(tester).image;
    landscape.frame.completeError(StateError('Temporary failure'));
    await tester.pump();
    expect(landscape.loads, 1);

    await tester.pumpWidget(artwork(0.6));
    await tester.pumpWidget(artwork(0.8));
    expect(landscape.loads, 1);
    await tester.pumpWidget(artwork(0));
    await tester.pumpWidget(artwork(0.2));
    await tester.pump();
    expect(landscape.loads, 2);
    expect(posterRender(tester).image, same(originalPoster));
    expect(landscapeOpacity(tester), 0);

    await tester.runAsync(() => landscape.complete(Colors.blue));
    await tester.pump();
    await tester.pump();
    await tester.pump(transitionDuration);
    expect(landscapeOpacity(tester), closeTo(0.2, 0.001));
    await tester.pumpWidget(artwork(0));
    await tester.pumpWidget(artwork(1));
    expect(landscape.loads, 2);
    expect(landscapeOpacity(tester), 1);
    expect(poster.loads, 1);
    expect(tester.takeException(), isNull);
  });

  testWidgets('one URL is retained at a fixed decode size across expansion', (
    tester,
  ) async {
    await tester.pumpWidget(artwork(0, landscapeUrl: 'poster'));
    await tester.runAsync(() => poster.complete(Colors.red));
    await tester.pump();
    final originalPoster = posterRender(tester).image;
    await tester.pumpWidget(artwork(1, landscapeUrl: 'poster'));
    expect(find.byType(Image), findsOneWidget);
    expect(posterRender(tester).image, same(originalPoster));
    expect(requests, [('poster', 960)]);
    expect(poster.loads, 1);
  });

  testWidgets('discovered landscape retains the existing poster decode', (
    tester,
  ) async {
    final smallerPoster = _ControlledImage();
    providerBuilder = (url, width) {
      if (url == 'poster') return width == 400 ? smallerPoster : poster;
      return landscape;
    };
    await tester.pumpWidget(artwork(0, landscapeUrl: null));
    await tester.runAsync(() => poster.complete(Colors.red));
    await tester.pump();
    final originalPoster = posterRender(tester).image;
    expect(originalPoster, isNotNull);

    // Resolving the landscape changes the poster's decode endpoint, but the
    // original poster must remain while that smaller frame is unavailable.
    await tester.pumpWidget(artwork(0.5));
    expect(smallerPoster.loads, 1);
    expect(posterRender(tester).image, same(originalPoster));
    expect(landscapeOpacity(tester), 0);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'missing poster uses landscape immediately, and no URLs is empty',
    (tester) async {
      await tester.pumpWidget(artwork(0, posterUrl: null));
      await tester.runAsync(() => landscape.complete(Colors.blue));
      await tester.pump();
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Opacity), findsNothing);
      expect(posterRender(tester).image, isNotNull);
      expect(requests, [('landscape', 960)]);

      await tester.pumpWidget(artwork(1, posterUrl: null, landscapeUrl: null));
      expect(find.byType(Image), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );
}
