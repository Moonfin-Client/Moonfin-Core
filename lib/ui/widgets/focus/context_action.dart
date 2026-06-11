import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/repositories/user_repository.dart';
import '../../../data/models/aggregated_item.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../l10n/app_localizations.dart';
import '../../navigation/destinations.dart';
import '../add_to_collection_dialog.dart';
import '../add_to_playlist_dialog.dart';

class ItemContextAction {
  final IconData icon;
  final String label;
  final Future<void> Function() onSelect;

  const ItemContextAction({
    required this.icon,
    required this.label,
    required this.onSelect,
  });
}

List<ItemContextAction> contextActionsFor(
  BuildContext context,
  AggregatedItem item, {
  VoidCallback? onChanged,
}) {
  final l10n = AppLocalizations.of(context);
  final mutations = GetIt.instance<ItemMutationRepository>();
  final client = GetIt.instance<MediaServerClient>();
  final currentUser = GetIt.instance<UserRepository>().currentUser;
  final isAdminUser = currentUser?.isAdministrator ?? false;
  final isSameServerItem = currentUser?.serverId == item.serverId;
  final requiresCollectionPermission =
      client.serverType == ServerType.jellyfin && isSameServerItem;
  final canManageCollections =
      !requiresCollectionPermission ||
      currentUser?.canManageCollections == true ||
      isAdminUser;
  final canRefreshMetadata =
      client.serverType == ServerType.jellyfin && isAdminUser;
  final actions = <ItemContextAction>[];
  final type = item.type;

  final isMediaType =
      type == 'Movie' ||
      type == 'Episode' ||
      type == 'Series' ||
      type == 'Season' ||
      type == 'Audio' ||
      type == 'MusicAlbum' ||
      type == 'BoxSet';

  if (isMediaType) {
    actions.add(ItemContextAction(
      icon: item.isPlayed
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined,
      label: item.isPlayed
          ? l10n.contextMenuMarkUnwatched
          : l10n.contextMenuMarkWatched,
      onSelect: () async {
        await mutations.setPlayed(item.id, isPlayed: !item.isPlayed);
        onChanged?.call();
      },
    ));
    actions.add(ItemContextAction(
      icon: item.isFavorite ? Icons.favorite : Icons.favorite_border,
      label: item.isFavorite
          ? l10n.contextMenuRemoveFromFavorites
          : l10n.contextMenuAddToFavorites,
      onSelect: () async {
        await mutations.setFavorite(item.id, isFavorite: !item.isFavorite);
        onChanged?.call();
      },
    ));

    if (canManageCollections) {
      actions.add(ItemContextAction(
        icon: Icons.collections_bookmark,
        label: '${l10n.add} ${l10n.collections}',
        onSelect: () async {
          if (!context.mounted) return;
          final added = await AddToCollectionDialog.show(
            context,
            itemIds: [item.id],
            serverId: item.serverId,
          );
          if (added == true) {
            onChanged?.call();
          }
        },
      ));
    }

    actions.add(ItemContextAction(
      icon: Icons.playlist_add,
      label: l10n.addToPlaylist,
      onSelect: () async {
        if (!context.mounted) return;
        final added = await AddToPlaylistDialog.show(
          context,
          itemIds: [item.id],
          serverId: item.serverId,
        );
        if (added == true) {
          onChanged?.call();
        }
      },
    ));

    if (canRefreshMetadata) {
      actions.add(ItemContextAction(
        icon: Icons.refresh,
        label: l10n.adminRefreshMetadata,
        onSelect: () async {
          try {
            await mutations.refreshMetadata(item.id);
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.adminMetadataRefreshRequested)),
            );
            onChanged?.call();
          } on DioException catch (e) {
            final status = e.response?.statusCode;
            final data = e.response?.data;
            final serverMessage = data is String
                ? data
                : (data is Map<String, dynamic>
                      ? (data['message'] ?? data['Message'])?.toString()
                      : null);
            final fallback = switch (status) {
              401 => 'Unauthorized',
              403 => 'Forbidden',
              404 => 'Not found',
              _ => 'HTTP ${status ?? 'error'}',
            };
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  l10n.adminMetadataRefreshFailed(
                    (serverMessage != null && serverMessage.isNotEmpty)
                        ? serverMessage
                        : fallback,
                  ),
                ),
              ),
            );
          } catch (e) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.adminMetadataRefreshFailed('$e'))),
            );
          }
        },
      ));
    }
  }

  if (type == 'Episode' && (item.seriesId?.isNotEmpty ?? false)) {
    actions.add(ItemContextAction(
      icon: Icons.tv_outlined,
      label: l10n.contextMenuGoToSeries,
      onSelect: () async {
        if (!context.mounted) return;
        context.go(Destinations.item(item.seriesId!, serverId: item.serverId));
      },
    ));
  }

  return actions;
}
