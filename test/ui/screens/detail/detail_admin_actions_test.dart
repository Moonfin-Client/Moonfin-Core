import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/detail_admin_actions.dart';

Set<DetailAdminAction> actions({
  bool isAdministrator = true,
  bool isTV = false,
  String? itemType = 'Movie',
  bool canDelete = true,
  bool adminPanel = true,
}) => detailAdminActions(
  isAdministrator: isAdministrator,
  isTV: isTV,
  itemType: itemType,
  canDelete: canDelete,
  adminPanel: adminPanel,
);

void main() {
  group('delete', () {
    test('follows the server verdict rather than the admin flag', () {
      expect(actions(isAdministrator: false), {DetailAdminAction.delete});
    });

    test('an item the server refuses to delete offers only the admin set', () {
      expect(
        actions(canDelete: false),
        DetailAdminAction.values.toSet()..remove(DetailAdminAction.delete),
      );
    });
  });

  group('for an admin', () {
    test('an admin gets the whole set on a phone', () {
      expect(actions(), DetailAdminAction.values.toSet());
    });

    test('metadata editing stays off the TV layout', () {
      final result = actions(isTV: true);
      expect(result, isNot(contains(DetailAdminAction.editMetadata)));
      expect(result, contains(DetailAdminAction.changeArtwork));
    });

    test("metadata editing is left out where the admin panel can't open", () {
      final result = actions(adminPanel: false);
      expect(result, isNot(contains(DetailAdminAction.editMetadata)));
      expect(result, contains(DetailAdminAction.identify));
    });

    test('identify is only offered for types it knows how to look up', () {
      expect(
        actions(itemType: 'Audio'),
        isNot(contains(DetailAdminAction.identify)),
      );
    });

    test('a non admin without delete rights sees nothing', () {
      expect(actions(isAdministrator: false, canDelete: false), isEmpty);
    });
  });
}
