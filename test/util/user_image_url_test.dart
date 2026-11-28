import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/util/user_image_url.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockImageApi extends Mock implements ImageApi {}

MediaServerClient _client(ServerType type, String url) {
  final images = _MockImageApi();
  when(() => images.getUserImageUrl('u1')).thenReturn(url);
  final client = _MockClient();
  when(() => client.imageApi).thenReturn(images);
  when(() => client.serverType).thenReturn(type);
  return client;
}

PrivateUser _user(String? tag) => PrivateUser(
  id: 'u1',
  name: 'Test',
  serverId: 's1',
  accessToken: 't',
  lastUsed: DateTime(2026),
  imageTag: tag,
);

void main() {
  test('Emby keeps its token and gains the tag', () {
    final url = taggedUserImageUrl(
      _client(ServerType.emby, 'http://e/Users/u1/Images/Primary?api_key=k'),
      _user('abc'),
    );
    expect(Uri.parse(url).queryParameters, {
      'quality': '90',
      'api_key': 'k',
      'tag': 'abc',
    });
  });

  test('no tag, the URL as it was', () {
    expect(
      taggedUserImageUrl(
        _client(ServerType.jellyfin, 'http://j/Users/u1/Images/Primary'),
        _user(null),
      ),
      'http://j/Users/u1/Images/Primary',
    );
  });

  test("Silo's URL is left alone, it may be signed", () {
    const signed = 'https://cdn/avatars/u1.png?X-Amz-Signature=s';
    expect(
      taggedUserImageUrl(_client(ServerType.silo, signed), _user('abc')),
      signed,
    );
  });
}
