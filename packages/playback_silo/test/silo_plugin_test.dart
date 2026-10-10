import 'package:playback_silo/playback_silo.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

class _StubClient implements MediaServerClient {
  @override
  ServerType get serverType => ServerType.silo;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

void main() {
  test('resolving a Silo item refuses with a readable message for now', () async {
    final resolver = SiloPlugin(_StubClient()).createStreamResolver();
    await expectLater(
      resolver.resolve({'Id': 'movie-imdb-tt0295701'}),
      throwsA(isA<UnsupportedError>()),
    );
  });
}
