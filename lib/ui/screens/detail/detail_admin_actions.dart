import 'package:server_core/server_core.dart';

import '../../widgets/focus/context_action.dart' show canIdentifyItemType;

enum DetailAdminAction { identify, editMetadata, changeArtwork, delete }

/// The admin controls a detail page can offer for one item.
///
/// Delete follows the server's own verdict on the item, which already weighs
/// the user's deletion rights, so it needs no administrator check here. The
/// metadata actions go through the admin items API, which the Emby client
/// leaves unsupported, so they stay on Jellyfin.
Set<DetailAdminAction> detailAdminActions({
  required ServerType serverType,
  required bool isAdministrator,
  required bool isTV,
  required String? itemType,
  required bool canDelete,
}) {
  return {
    if (canDelete) DetailAdminAction.delete,
    if (isAdministrator && serverType == ServerType.jellyfin) ...{
      if (canIdentifyItemType(itemType)) DetailAdminAction.identify,
      if (!isTV) DetailAdminAction.editMetadata,
      DetailAdminAction.changeArtwork,
    },
  };
}
