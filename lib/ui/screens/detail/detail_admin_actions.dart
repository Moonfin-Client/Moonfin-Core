import '../../widgets/focus/context_action.dart' show canIdentifyItemType;

enum DetailAdminAction { identify, editMetadata, changeArtwork, delete }

/// The admin controls a detail page can offer for one item.
///
/// Delete follows the server's own verdict on the item, which already weighs
/// the user's deletion rights, so it needs no administrator check here.
/// [adminPanel] is whether the server's admin panel opens, which is where
/// metadata editing lives.
Set<DetailAdminAction> detailAdminActions({
  required bool isAdministrator,
  required bool isTV,
  required String? itemType,
  required bool canDelete,
  required bool adminPanel,
}) {
  return {
    if (canDelete) DetailAdminAction.delete,
    if (isAdministrator) ...{
      if (canIdentifyItemType(itemType)) DetailAdminAction.identify,
      if (!isTV && adminPanel) DetailAdminAction.editMetadata,
      DetailAdminAction.changeArtwork,
    },
  };
}
