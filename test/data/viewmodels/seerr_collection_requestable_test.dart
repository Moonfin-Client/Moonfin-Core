// A collection part Seerr has deleted is gone from the library, so it has to
// be requestable again, the same way a deleted season is.
// https://github.com/Moonfin-Client/Moonfin-Core/issues/1573
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/seerr_collection_view_model.dart';

SeerrDiscoverItem _part(int id, {int? status, int? status4k}) =>
    SeerrDiscoverItem(
      id: id,
      title: 'Part $id',
      mediaInfo: status == null && status4k == null
          ? null
          : SeerrMediaInfo(status: status, status4k: status4k),
    );

SeerrCollectionState _state(List<SeerrDiscoverItem> parts) =>
    SeerrCollectionState(
      collection: SeerrCollection(id: 1, name: 'Set', parts: parts),
    );

void main() {
  group('requestableParts', () {
    test('offers a deleted part again and leaves the held ones alone', () {
      final state = _state([
        _part(1, status: SeerrMediaStatus.deleted),
        _part(2, status: SeerrMediaStatus.available),
        _part(3, status: SeerrMediaStatus.partiallyAvailable),
        _part(4, status: SeerrMediaStatus.unknown),
        _part(5),
      ]);

      expect(
        state.requestableParts(is4k: false).map((p) => p.id),
        [1, 4, 5],
      );
    });

    test('a part already on its way is not offered twice', () {
      final state = _state([
        _part(1, status: SeerrMediaStatus.pending),
        _part(2, status: SeerrMediaStatus.processing),
      ]);

      expect(state.requestableParts(is4k: false), isEmpty);
    });

    test('a blocklisted part stays off the table', () {
      final state = _state([_part(1, status: SeerrMediaStatus.blocklisted)]);

      expect(state.requestableParts(is4k: false), isEmpty);
    });

    test('each quality track reads its own status', () {
      final state = _state([
        _part(
          1,
          status: SeerrMediaStatus.available,
          status4k: SeerrMediaStatus.deleted,
        ),
      ]);

      expect(state.requestableParts(is4k: false), isEmpty);
      expect(state.requestableParts(is4k: true).map((p) => p.id), [1]);
    });
  });
}
