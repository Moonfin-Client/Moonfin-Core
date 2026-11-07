import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/services/item_membership_service.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../l10n/app_localizations.dart';
import '../util/error_message.dart';
import 'adaptive/adaptive_dialog.dart';
import 'focusable_dialog_row.dart';
import 'overlay_sheet.dart';

class RemoveFromCollectionDialog extends StatefulWidget {
  final AggregatedItem item;
  final List<ItemCollectionMembership>? collections;
  final String? serverId;

  const RemoveFromCollectionDialog({
    super.key,
    required this.item,
    this.collections,
    this.serverId,
  });

  static Future<bool?> show(
    BuildContext context, {
    required AggregatedItem item,
    List<ItemCollectionMembership>? collections,
    String? serverId,
  }) {
    return showFocusRestoringDialog<bool>(
      context: context,
      builder: (_) => RemoveFromCollectionDialog(
        item: item,
        collections: collections,
        serverId: serverId,
      ),
    );
  }

  @override
  State<RemoveFromCollectionDialog> createState() =>
      _RemoveFromCollectionDialogState();
}

class _RemoveFromCollectionDialogState
    extends State<RemoveFromCollectionDialog> {
  late final MediaServerClient _client;
  List<ItemCollectionMembership>? _collections;
  bool _isRemoving = false;

  @override
  void initState() {
    super.initState();
    final factory = GetIt.instance.isRegistered<MediaServerClientFactory>()
        ? GetIt.instance<MediaServerClientFactory>()
        : null;
    _client = factory != null
        ? factory.clientForServerOrActive(widget.serverId)
        : GetIt.instance<MediaServerClient>();

    if (widget.collections != null) {
      _collections = List.of(widget.collections!);
    } else {
      _loadCollections();
    }
  }

  Future<void> _loadCollections() async {
    try {
      final memberships = await ItemMembershipService.instance
          .getCollectionsContaining(widget.item);
      if (mounted) {
        setState(() {
          _collections = memberships;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _collections = const []);
    }
  }

  Future<void> _removeFromCollection(ItemCollectionMembership col) async {
    if (_isRemoving) return;
    final l10n = AppLocalizations.of(context);

    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        backgroundColor: const Color(0xFF171717),
        title: Text(
          l10n.contextMenuRemoveFromCollection,
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(
          l10n.removeFromCollectionConfirm(
            widget.item.name,
            col.collectionName,
          ),
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            focusRingColor: AppColorScheme.accent,
            child: Text(l10n.cancel),
          ),
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, true),
            focusRingColor: AppColorScheme.accent,
            child: Text(
              l10n.remove,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    setState(() => _isRemoving = true);
    try {
      await _client.itemsApi.removeFromCollection(
        col.collectionId,
        [widget.item.id],
      );
      ItemMembershipService.instance.notifyItemRemovedFromCollection(
        widget.serverId ?? '',
        col.collectionId,
        widget.item.id,
      );
      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isRemoving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${l10n.removeFromCollectionFailed}: ${describeError(e, l10n)}',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        clipBehavior: Clip.antiAlias,
        constraints: const BoxConstraints(minWidth: 340, maxWidth: 440),
        decoration: BoxDecoration(
          color: AppColorScheme.surface.withValues(alpha: 0.9),
          borderRadius: AppRadius.circular(20),
          border: Border.fromBorderSide(
            ThemeRegistry.active.borders.chipBorder,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.contextMenuRemoveFromCollection,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColorScheme.onSurface,
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              color: AppColorScheme.onSurface.withValues(alpha: 0.08),
            ),
            const SizedBox(height: 8),
            if (_collections == null || _isRemoving)
              Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColorScheme.accent,
                    strokeWidth: 2,
                  ),
                ),
              )
            else if (_collections!.isEmpty)
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  l10n.noneFound,
                  style: TextStyle(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              )
            else
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 400),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _collections!.length,
                  itemBuilder: (_, i) {
                    final col = _collections![i];
                    return FocusableDialogRow(
                      icon: Icons.collections_bookmark,
                      label: col.collectionName,
                      autofocus: i == 0,
                      onTap: () => _removeFromCollection(col),
                    );
                  },
                ),
              ),
            const SizedBox(height: 4),
            Container(
              height: 1,
              color: AppColorScheme.onSurface.withValues(alpha: 0.08),
            ),
            const SizedBox(height: 4),
            FocusableDialogRow(
              label: l10n.cancel,
              onTap: () => Navigator.pop(context),
              dimmed: true,
              autofocus: _collections?.isEmpty ?? false,
            ),
          ],
        ),
      ),
    );
  }
}

