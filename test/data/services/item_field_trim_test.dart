import 'package:flutter_test/flutter_test.dart';
import 'package:server_core/server_core.dart';

import 'package:moonfin/data/services/row_data_source.dart';

void main() {
  group('the detail field set', () {
    test('leaves trickplay out', () {
      expect(kDetailItemFields, isNot(contains('Trickplay')));
    });

    test('still carries what a detail screen renders', () {
      for (final field in const [
        'Chapters',
        'MediaSources',
        'MediaStreams',
        'People',
        'Overview',
        'Genres',
        'UserData',
      ]) {
        expect(
          kDetailItemFields,
          contains(field),
          reason: 'detail screens read $field',
        );
      }
    });

    test('the offline set adds trickplay on top', () {
      expect(kOfflineItemFields, contains('Trickplay'));
      expect(kOfflineItemFields, contains(kDetailItemFields));
    });
  });

  // A token built from String.hashCode would still look like this, so it only
  // catches the shape. The cross platform promise rests on the FNV-1a code.
  test('the home row field shape token is plain hex', () {
    expect(RowDataSource.fieldShapeToken, matches(RegExp(r'^[0-9a-f]+$')));
  });
}
