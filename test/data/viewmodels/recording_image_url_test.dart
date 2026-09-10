import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/viewmodels/recordings_view_model.dart';
import 'package:server_core/server_core.dart';

/// Echoes whatever tag it was handed so a test can say whether one arrived.
class _TagEchoImageApi implements ImageApi {
  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => 'http://fake/$itemId/Primary?tag=${tag ?? ''}';

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

RecordingItem recording({Map<String, dynamic>? imageTags}) => RecordingItem(
  id: 'rec-1',
  name: 'A Recording',
  imageTags: imageTags,
  rawData: const {},
);

void main() {
  final api = _TagEchoImageApi();

  test('a recording carries its primary tag into the url', () {
    // Without the tag the url never changes, so the cache goes on serving
    // whatever artwork it stored the first time.
    final url = recording(imageTags: {'Primary': 'abc123'}).imageUrl(api);

    expect(url, 'http://fake/rec-1/Primary?tag=abc123');
  });

  test('a recording with no tags asks for nothing', () {
    expect(recording().imageUrl(api), isNull);
  });
}
