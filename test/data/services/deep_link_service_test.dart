import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/deep_link_service.dart';

void main() {
  group('routeForDeepLink', () {
    test('a party invite keeps its server id and address for the link '
        'screen', () {
      expect(
        DeepLinkService.routeForDeepLink(
          Uri.parse(
            'moonfin://party?server=s9&code=K7Q29M'
            '&address=https%3A%2F%2Fjf.example',
          ),
        ),
        '/watch-party?code=K7Q29M&serverId=s9'
        '&address=https%3A%2F%2Fjf.example',
      );
      expect(
        DeepLinkService.routeForDeepLink(Uri.parse('moonfin://party?code=AB')),
        '/watch-party?code=AB',
      );
      expect(
        DeepLinkService.routeForDeepLink(Uri.parse('moonfin://party?server=s1')),
        isNull,
      );
    });

    test('returns null for non-moonfin schemes', () {
      expect(
        DeepLinkService.routeForDeepLink(
          Uri.parse('https://example.com/?id=abc'),
        ),
        isNull,
      );
    });

    test('returns null without an id', () {
      expect(
        DeepLinkService.routeForDeepLink(Uri.parse('moonfin://play?serverId=s1')),
        isNull,
      );
    });

    test('routes item host without autoPlay', () {
      expect(
        DeepLinkService.routeForDeepLink(Uri.parse('moonfin://item?id=abc123')),
        '/item/abc123',
      );
    });

    test('routes the Live TV guide and recordings', () {
      expect(
        DeepLinkService.routeForDeepLink(Uri.parse('moonfin://live-tv/guide')),
        '/live-tv/guide',
      );
      expect(
        DeepLinkService.routeForDeepLink(
          Uri.parse('moonfin://live-tv/recordings'),
        ),
        '/live-tv/recordings',
      );
      expect(
        DeepLinkService.routeForDeepLink(Uri.parse('moonfin://live-tv/other')),
        isNull,
      );
    });

    test('routes play host with autoPlay', () {
      expect(
        DeepLinkService.routeForDeepLink(Uri.parse('moonfin://play?id=abc123')),
        '/item/abc123?autoPlay=true',
      );
    });

    test('forwards serverId', () {
      expect(
        DeepLinkService.routeForDeepLink(
          Uri.parse('moonfin://play?id=abc123&serverId=srv-1'),
        ),
        '/item/abc123?serverId=srv-1&autoPlay=true',
      );
    });

    test('forwards userId alongside serverId and autoPlay', () {
      expect(
        DeepLinkService.routeForDeepLink(
          Uri.parse('moonfin://play?id=abc123&serverId=srv-1&userId=user-1'),
        ),
        '/item/abc123?serverId=srv-1&userId=user-1&autoPlay=true',
      );
    });

    test('forwards userId alone on item host', () {
      expect(
        DeepLinkService.routeForDeepLink(
          Uri.parse('moonfin://item?id=abc123&userId=user-1'),
        ),
        '/item/abc123?userId=user-1',
      );
    });

    test('ignores empty serverId and userId', () {
      expect(
        DeepLinkService.routeForDeepLink(
          Uri.parse('moonfin://play?id=abc123&serverId=&userId='),
        ),
        '/item/abc123?autoPlay=true',
      );
    });

    test('routes search host with an encoded query', () {
      expect(
        DeepLinkService.routeForDeepLink(
          Uri.parse('moonfin://search?query=the%20matrix'),
        ),
        '/search?query=the%20matrix',
      );
    });

    test('routes home, forwarding serverId and userId', () {
      expect(
        DeepLinkService.routeForDeepLink(Uri.parse('moonfin://home')),
        '/home',
      );
      expect(
        DeepLinkService.routeForDeepLink(
          Uri.parse('moonfin://home?serverId=srv-1&userId=user-1'),
        ),
        '/home?serverId=srv-1&userId=user-1',
      );
      expect(
        DeepLinkService.routeForDeepLink(
          Uri.parse('moonfin://home?serverId=&userId='),
        ),
        '/home',
      );
      expect(
        DeepLinkService.routeForDeepLink(Uri.parse('moonfin://home?id=abc')),
        '/home',
      );
    });

    test('returns null for search without a query', () {
      expect(
        DeepLinkService.routeForDeepLink(Uri.parse('moonfin://search')),
        isNull,
      );
      expect(
        DeepLinkService.routeForDeepLink(Uri.parse('moonfin://search?query=')),
        isNull,
      );
    });
  });
}
