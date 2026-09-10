import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/detail_admin_actions.dart';
import 'package:server_core/server_core.dart';

Set<DetailAdminAction> actions({
  ServerType serverType = ServerType.jellyfin,
  bool isAdministrator = true,
  bool isTV = false,
  String? itemType = 'Movie',
  bool canDelete = true,
}) => detailAdminActions(
  serverType: serverType,
  isAdministrator: isAdministrator,
  isTV: isTV,
  itemType: itemType,
  canDelete: canDelete,
);

void main() {
  group('on Emby', () {
    test('an admin gets delete and nothing that needs the admin items api', () {
      expect(actions(serverType: ServerType.emby), {DetailAdminAction.delete});
    });

    test('an item the server refuses to delete offers nothing', () {
      expect(
        actions(serverType: ServerType.emby, canDelete: false),
        isEmpty,
      );
    });
  });

  group('delete', () {
    test('follows the server verdict rather than the admin flag', () {
      for (final server in ServerType.values) {
        expect(
          actions(serverType: server, isAdministrator: false),
          {DetailAdminAction.delete},
          reason: server.name,
        );
      }
    });
  });

  group('on Jellyfin', () {
    test('an admin gets the whole set on a phone', () {
      expect(actions(), DetailAdminAction.values.toSet());
    });

    test('metadata editing stays off the TV layout', () {
      final result = actions(isTV: true);
      expect(result, isNot(contains(DetailAdminAction.editMetadata)));
      expect(result, contains(DetailAdminAction.changeArtwork));
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
