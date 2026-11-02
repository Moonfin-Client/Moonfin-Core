import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/user_avatar_image.dart';

const _fallback = Text('initial');

Widget _wrap(Widget child) => Directionality(
  textDirection: TextDirection.ltr,
  child: Center(child: child),
);

void main() {
  tearDown(() => CachedNetworkImageProvider.urlResolver = null);

  group('isSvgImageUrl', () {
    test('Silo presets and DiceBear are SVG', () {
      expect(
        isSvgImageUrl('https://silo.example/profile-avatars/fox.svg'),
        isTrue,
      );
      expect(
        isSvgImageUrl(
          'https://api.dicebear.com/9.x/thumbs/svg?seed=ab&size=128',
        ),
        isTrue,
      );
    });

    test('bitmaps are not', () {
      expect(isSvgImageUrl('https://silo.example/a/w256.webp?sig=1'), isFalse);
      expect(
        isSvgImageUrl('https://emby.example/Users/1/Images/Primary?tag=x'),
        isFalse,
      );
    });
  });

  testWidgets('no URL shows the fallback', (tester) async {
    await tester.pumpWidget(
      _wrap(const UserAvatarImage(url: null, size: 40, fallback: _fallback)),
    );
    expect(find.text('initial'), findsOneWidget);
  });

  testWidgets('a bitmap avatar is an Image', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const UserAvatarImage(
          url: 'https://emby.example/Users/1/Images/Primary',
          size: 40,
          fallback: _fallback,
        ),
      ),
    );
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('a placeholder URL is resolved first', (tester) async {
    CachedNetworkImageProvider.urlResolver = (url) =>
        url.contains('placeholder')
        ? Future.value('https://silo.example/a/w256.webp?sig=1')
        : null;
    await tester.pumpWidget(
      _wrap(
        const UserAvatarImage(
          url: 'https://silo.example/placeholder',
          size: 40,
          fallback: _fallback,
        ),
      ),
    );
    expect(find.text('initial'), findsOneWidget);
    await tester.pump();
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('a placeholder with nothing behind it stays the fallback', (
    tester,
  ) async {
    CachedNetworkImageProvider.urlResolver = (_) => Future.value();
    await tester.pumpWidget(
      _wrap(
        const UserAvatarImage(
          url: 'https://silo.example/placeholder',
          size: 40,
          fallback: _fallback,
        ),
      ),
    );
    await tester.pump();
    expect(find.text('initial'), findsOneWidget);
  });
}
