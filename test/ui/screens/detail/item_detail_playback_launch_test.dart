import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';

void main() {
  test('video playback pushes early on iOS and Apple TV only', () {
    expect(
      shouldPushVideoPlayerRouteEarly(
        destination: Destinations.videoPlayer,
        isIOS: true,
        isAppleTV: false,
      ),
      isTrue,
    );
    expect(
      shouldPushVideoPlayerRouteEarly(
        destination: Destinations.videoPlayer,
        isIOS: false,
        isAppleTV: true,
      ),
      isTrue,
    );
    expect(
      shouldPushVideoPlayerRouteEarly(
        destination: Destinations.videoPlayer,
        isIOS: false,
        isAppleTV: false,
      ),
      isFalse,
    );
    expect(
      shouldPushVideoPlayerRouteEarly(
        destination: Destinations.externalPlayer,
        isIOS: true,
        isAppleTV: true,
      ),
      isFalse,
    );
  });
}
