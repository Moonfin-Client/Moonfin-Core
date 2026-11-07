import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/web_youtube_trailer.dart';
import 'package:moonfin/util/platform_detection.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class _FakeController extends PlatformWebViewController {
  _FakeController(super.params) : super.implementation();

  final loadedPages = <({String html, String? baseUrl})>[];
  final backgroundColors = <Color>[];
  bool failLoad = false;
  JavaScriptChannelParams? channel;

  @override
  Future<void> setBackgroundColor(Color color) {
    if (defaultTargetPlatform == TargetPlatform.macOS) {
      throw UnimplementedError('opaque is not implemented on macOS');
    }
    backgroundColors.add(color);
    return Future<void>.value();
  }

  @override
  Future<void> setJavaScriptMode(JavaScriptMode javaScriptMode) async {}

  @override
  Future<void> addJavaScriptChannel(
    JavaScriptChannelParams javaScriptChannelParams,
  ) async {
    channel = javaScriptChannelParams;
  }

  @override
  Future<void> loadHtmlString(String html, {String? baseUrl}) async {
    if (failLoad) throw StateError('the page could not load');
    loadedPages.add((html: html, baseUrl: baseUrl));
  }

  @override
  Future<void> loadRequest(LoadRequestParams params) async {}

  @override
  Future<void> runJavaScript(String javaScript) async {}
}

class _FakeWebViewWidget extends PlatformWebViewWidget {
  _FakeWebViewWidget(super.params) : super.implementation();

  @override
  Widget build(BuildContext context) =>
      const SizedBox.expand(key: ValueKey('fake-webview'));
}

class _FakeWebViewPlatform extends WebViewPlatform {
  bool failLoad = false;
  _FakeController? controller;

  @override
  PlatformWebViewController createPlatformWebViewController(
    PlatformWebViewControllerCreationParams params,
  ) {
    return controller = _FakeController(params)..failLoad = failLoad;
  }

  @override
  PlatformWebViewWidget createPlatformWebViewWidget(
    PlatformWebViewWidgetCreationParams params,
  ) {
    return _FakeWebViewWidget(params);
  }
}

void main() {
  late _FakeWebViewPlatform platform;
  late int unavailableReports;

  setUp(() {
    platform = _FakeWebViewPlatform();
    WebViewPlatform.instance = platform;
    unavailableReports = 0;
  });

  Future<void> pumpTrailer(WidgetTester tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: WebYouTubeTrailer(
          videoId: 'Way9Dexny3w',
          muted: false,
          loop: false,
          onEmbeddedUnavailable: () => unavailableReports++,
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  double maskOpacity(WidgetTester tester) =>
      tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity)).opacity;

  testWidgets('loads the player page on macOS', (tester) async {
    await pumpTrailer(tester);

    final pages = platform.controller!.loadedPages;
    expect(pages, hasLength(1));
    expect(pages.single.baseUrl, 'https://www.youtube-nocookie.com');
    expect(pages.single.html, contains('"Way9Dexny3w"'));
    expect(unavailableReports, 0);
  }, variant: TargetPlatformVariant.only(TargetPlatform.macOS));

  testWidgets('masks the WebView on macOS until playback starts', (
    tester,
  ) async {
    await pumpTrailer(tester);
    expect(maskOpacity(tester), 1);

    platform.controller!.channel!.onMessageReceived(
      const JavaScriptMessage(
        message: '{"event":"StateChange","data":1,"videoId":"Way9Dexny3w"}',
      ),
    );
    await tester.pump(const Duration(milliseconds: 700));

    expect(maskOpacity(tester), 0);
  }, variant: TargetPlatformVariant.only(TargetPlatform.macOS));

  testWidgets('clears the background before loading on iOS and Android', (
    tester,
  ) async {
    await pumpTrailer(tester);

    expect(platform.controller!.backgroundColors, [const Color(0x00000000)]);
    expect(platform.controller!.loadedPages, hasLength(1));
    expect(unavailableReports, 0);
    expect(maskOpacity(tester), 0);
  }, variant: TargetPlatformVariant(
    <TargetPlatform>{TargetPlatform.iOS, TargetPlatform.android},
  ));

  testWidgets('sizes the stage to the box only on Android TV', (tester) async {
    addTearDown(() => PlatformDetection.setTvMode(false));
    Future<bool> layoutSizedStage({required bool tv}) async {
      PlatformDetection.setTvMode(tv);
      await tester.pumpWidget(const SizedBox());
      await pumpTrailer(tester);
      return platform.controller!.loadedPages.single.html.contains(
        'const layoutSizedStage = true;',
      );
    }

    final android = defaultTargetPlatform == TargetPlatform.android;
    expect(await layoutSizedStage(tv: true), android);
    expect(await layoutSizedStage(tv: false), isFalse);
  }, variant: TargetPlatformVariant(
    <TargetPlatform>{TargetPlatform.android, TargetPlatform.iOS},
  ));

  testWidgets('lays the WebView out in the view\'s own points under a '
      'scaled host', (tester) async {
    // TvUiScale lays a 1080p density-two TV out on a 1150 wide canvas, so the
    // density it reports is scaled by 960 / 1150.
    const scale = 960 / 1150;
    final viewDpr = tester.view.devicePixelRatio;
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: MediaQueryData(devicePixelRatio: viewDpr * scale),
          child: const Center(
            child: SizedBox(
              width: 400,
              height: 225,
              child: WebYouTubeTrailer(videoId: 'Way9Dexny3w'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final size = tester.getSize(find.byKey(const ValueKey('fake-webview')));
    expect(size.width, moreOrLessEquals(400 * scale));
    expect(size.height, moreOrLessEquals(225 * scale));
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));

  testWidgets('still reports the embed unavailable when the page cannot load', (
    tester,
  ) async {
    platform.failLoad = true;

    await pumpTrailer(tester);
    tester.binding.scheduleFrame();
    await tester.pump();

    expect(platform.controller!.loadedPages, isEmpty);
    expect(unavailableReports, 1);
  }, variant: TargetPlatformVariant.only(TargetPlatform.macOS));
}
