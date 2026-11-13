import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/repositories/user_repository.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/services/unified_catalog_query.dart';
import '../../../data/models/aggregated_item.dart';
import '../../../data/offline/connectivity_aware_media_server_client.dart';
import '../../../data/offline/offline_catalog.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../util/signed_in_server_features.dart';
import '../../../util/server_url.dart';
import '../../../l10n/app_localizations.dart';
import '../../util/error_message.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/home_refresh_helper.dart';
import '../../../util/item_watch_state.dart';
import '../../../data/services/item_membership_service.dart';
import '../../navigation/destinations.dart';
import '../add_to_collection_dialog.dart';
import '../add_to_playlist_dialog.dart';
import '../remove_from_collection_dialog.dart';
import '../remove_from_playlist_dialog.dart';
import '../adaptive/adaptive_dialog.dart';
import '../change_artwork_dialog.dart';
import '../identify_dialog.dart';
import '../overlay_sheet.dart';
import '../unified_server_picker.dart';

final _log = Logger();

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

/// The collection a context menu was opened from, when there is one.
class CollectionRemovalContext {
  final String collectionName;
  final Future<void> Function(AggregatedItem item) remove;

  const CollectionRemovalContext({
    required this.collectionName,
    required this.remove,
  });
}

/// Item types the server exposes a `/Items/RemoteSearch/{type}` endpoint for.
/// Episodes and Seasons qualify because Identify redirects them to their
/// parent series. Anything else would just 404 with a raw error toast.
const _identifiableTypes = <String>{
  'Movie',
  'Series',
  'Season',
  'Episode',
  'BoxSet',
  'Person',
  'MusicAlbum',
  'MusicArtist',
  'Book',
  'Trailer',
  'MusicVideo',
};

bool canIdentifyItemType(String? type) => _identifiableTypes.contains(type);

/// Whether [item] is a downloaded video the server can stream instead.
bool canPlayFromServer(AggregatedItem item) =>
    const {'Movie', 'Episode', 'Video', 'MusicVideo'}.contains(item.type) &&
    GetIt.instance.isRegistered<OfflineCatalog>() &&
    GetIt.instance<OfflineCatalog>().byId(item.id) != null &&
    !shouldUseOfflineCatalog();

/// Takes [item] off the server's resume list and keeps its progress where the
/// server can do that (Emby), or clears the progress that keeps it there where
/// it can't. Audio always resets, because an audiobook library's Continue row
/// falls back to an IsResumable query that ignores Emby's flag. A failed
/// server call resets nothing.
Future<void> _hideFromResumeOrReset(
  ItemMutationRepository mutations,
  AggregatedItem item,
) async {
  if (!item.isAudioLike) {
    try {
      if (await mutations.hideFromResume(item.id)) return;
    } catch (_) {
      return;
    }
  }
  try {
    await mutations.setPlayed(item.id, isPlayed: false);
  } catch (_) {}
}

/// Applies [change] to every server's copy of [item]. Returns how many copies
/// changed and the names of the servers it failed on. For an item with a
/// single copy the error is rethrown rather than returned.
///
/// Every copy is changed because a merged card shows as watched or favorite
/// when any copy is; changing one copy alone would leave the card as it was.
Future<({int changed, List<String> failedServers})> _applyToEveryCopy(
  AggregatedItem item,
  ItemMutationRepository shownCopyMutations,
  Future<void> Function(ItemMutationRepository mutations, String itemId) change,
) async {
  final copies = unifiedCopiesOf(item.rawData);
  if (copies.length < 2 ||
      !GetIt.instance.isRegistered<MediaServerClientFactory>()) {
    await change(shownCopyMutations, item.id);
    return (changed: 1, failedServers: const <String>[]);
  }
  final clients = GetIt.instance<MediaServerClientFactory>();
  final seen = <String>{};
  final failedServers = <String>{};
  var changed = 0;
  await Future.wait([
    for (final copy in copies)
      if (seen.add(copy.key))
        () async {
          final isShown =
              copy.serverId == item.serverId && copy.itemId == item.id;
          final client = clients.getClientIfExists(copy.serverId);
          if (client == null && !isShown) {
            _log.w(
              'Context action: no client for server ${copy.serverId}, '
              'its copy is left as it was',
            );
            failedServers.add(copy.serverName);
            return;
          }
          try {
            await change(
              isShown || client == null
                  ? shownCopyMutations
                  : ItemMutationRepository(client),
              copy.itemId,
            );
            changed++;
          } catch (error) {
            _log.w(
              'Context action: copy on server ${copy.serverId} not '
              'changed: $error',
            );
            failedServers.add(copy.serverName);
          }
        }(),
  ]);
  return (changed: changed, failedServers: failedServers.toList());
}

/// Runs [_applyToEveryCopy], shows a snackbar naming the servers that
/// failed, and calls [onChanged] if at least one copy changed.
Future<void> _applyToEveryCopyAndReport(
  BuildContext context,
  AppLocalizations l10n,
  AggregatedItem item,
  ItemMutationRepository shownCopyMutations,
  Future<void> Function(ItemMutationRepository mutations, String itemId)
  change, {
  required VoidCallback? onChanged,
}) async {
  final outcome = await _applyToEveryCopy(item, shownCopyMutations, change);
  if (outcome.failedServers.isNotEmpty && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          l10n.unifiedCopiesNotChanged(outcome.failedServers.join(', ')),
        ),
      ),
    );
  }
  if (outcome.changed > 0) onChanged?.call();
}

/// The types that get the play, watched, playlist and collection actions.
bool isContextMediaType(String? type) =>
    type == 'Movie' ||
    type == 'Episode' ||
    type == 'Series' ||
    type == 'Season' ||
    type == 'Audio' ||
    type == 'MusicAlbum' ||
    type == 'BoxSet';

List<ItemContextAction> contextActionsFor(
  BuildContext context,
  AggregatedItem item, {
  VoidCallback? onChanged,
  CollectionRemovalContext? collectionRemoval,
  bool isContinueWatchingOrNextUp = false,
  List<ItemPlaylistMembership>? playlistMemberships,
  List<ItemCollectionMembership>? collectionMemberships,
}) {
  final l10n = AppLocalizations.of(context);
  final client = GetIt.instance<MediaServerClient>();
  final itemClient = GetIt.instance.isRegistered<MediaServerClientFactory>()
      ? GetIt.instance<MediaServerClientFactory>().getClientIfExists(
          item.serverId,
        )
      : null;
  final currentUser = GetIt.instance<UserRepository>().currentUser;
  // An item's serverId may be a base URL, the app's server id, or empty
  // (meaning the active server). Clients are compared by their underlying
  // online client, because the active client and the factory's client are
  // separate wrappers around it.
  final isActiveServerItem =
      item.serverId.isEmpty ||
      item.serverId == currentUser?.serverId ||
      (itemClient != null &&
          identical(onlineClientOf(itemClient), onlineClientOf(client))) ||
      (item.serverId.contains('://') &&
          isStoredServer(
            item.serverId,
            serverId: currentUser?.serverId ?? '',
            baseUrl: client.baseUrl,
          ));
  // Another server's item must be changed through that server's client; the
  // active server doesn't know its id.
  final mutations = isActiveServerItem || itemClient == null
      ? GetIt.instance<ItemMutationRepository>()
      : ItemMutationRepository(itemClient);
  // Admin rights and the admin dialogs apply to the active server only. Used
  // on another server's item they would fail, or act on an unrelated item
  // that happens to share the id.
  final isAdminUser =
      (currentUser?.isAdministrator ?? false) && isActiveServerItem;
  // Deliberately the plain id comparison, not [isActiveServerItem]: an item
  // whose serverId is a base URL needs no collection permission, and one
  // with an empty serverId never reaches the server's own hide.
  final isSameServerItem = currentUser?.serverId == item.serverId;
  final requiresCollectionPermission =
      client.features.collectionsNeedPermission && isSameServerItem;
  final canManageCollections =
      !requiresCollectionPermission ||
      currentUser?.canManageCollections == true ||
      isAdminUser;
  // A server that hides Home cards itself (Silo) does it for this item's
  // server only. Read when a hide is picked, not for every menu.
  // Cards name their server by its address (Home rows, grids, detail pages)
  // or by the app's server id, so either counts. Home cards never match the
  // user's server id.
  HomeDismissalsApi? dismissals() {
    final ofThisServer = isStoredServer(
      item.serverId,
      serverId: currentUser?.serverId ?? '',
      baseUrl: client.baseUrl,
    );
    if (!ofThisServer) return null;
    final api = client.itemsApi;
    return api is HomeDismissalsApi ? api as HomeDismissalsApi : null;
  }
  final actions = <ItemContextAction>[];
  final type = item.type;

  final isMediaType = isContextMediaType(type);

  if (isMediaType) {
    final prefs = GetIt.instance<UserPreferences>();
    final defaultAction =
        prefs.get(UserPreferences.continueWatchingDefaultAction);
    final flipTopAction =
        isContinueWatchingOrNextUp &&
        defaultAction == ContinueWatchingDefaultAction.play;

    if (flipTopAction) {
      actions.add(ItemContextAction(
        icon: Icons.info_outline,
        label: l10n.goToDetailsScreen,
        onSelect: () async {
          if (!context.mounted) return;
          await openOnPickedServer(
            context,
            item,
            open: (itemId, serverId) => context.push(
              Destinations.itemOrPhoto(
                itemId,
                serverId: serverId,
                type: item.type,
                channelId: item.channelId,
              ),
            ),
          );
        },
      ));
    } else {
      // First so a remote lands on it with no extra presses. The detail screen
      // does the playing, which keeps the next episode lookup for a series and
      // the external player preference working the way the Play button does.
      // For a title on several servers, show the server picker first: the
      // progress on the card may come from a different copy than the one the
      // card links to.
      actions.add(ItemContextAction(
        icon: Icons.play_arrow,
        label: watchStateOf(item).hasProgress ? l10n.resume : l10n.play,
        onSelect: () async {
          if (!context.mounted) return;
          await openOnPickedServer(
            context,
            item,
            open: (itemId, serverId) => context.push(
              Destinations.item(itemId, serverId: serverId, autoPlay: true),
            ),
          );
        },
      ));
    }

    if (canPlayFromServer(item)) {
      actions.add(ItemContextAction(
        icon: Icons.cloud_outlined,
        label: l10n.playFromServer,
        onSelect: () async {
          if (!context.mounted) return;
          GetIt.instance<PlaybackManager>().streamFromServerOnce(item.id);
          context.push(
            Destinations.item(item.id, serverId: item.serverId, autoPlay: true),
          );
        },
      ));
    }

    actions.add(ItemContextAction(
      icon: item.isPlayed
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined,
      label: item.isPlayed
          ? l10n.contextMenuMarkUnwatched
          : l10n.contextMenuMarkWatched,
      onSelect: () async {
        final isPlayed = !item.isPlayed;
        await _applyToEveryCopyAndReport(
          context,
          l10n,
          item,
          mutations,
          (mutations, itemId) =>
              mutations.setPlayed(itemId, isPlayed: isPlayed),
          onChanged: onChanged,
        );
      },
    ));

    final hasProgress = item.playbackPositionTicks != null &&
        item.playbackPositionTicks! > 0 &&
        !item.isPlayed;
    if (hasProgress) {
      actions.add(ItemContextAction(
        icon: Icons.visibility_off_outlined,
        label: l10n.contextMenuHideFromContinueWatching,
        onSelect: () async {
          // The server's own hide holds on every device and keeps the
          // resume point. This device's list is the fallback.
          final server = dismissals();
          if (await _hiddenByServer(
            () => server?.hideFromContinueWatching(item.rawData),
          )) {
            onChanged?.call();
            return;
          }
          final prefs = GetIt.instance<UserPreferences>();
          if (item.seriesId != null && item.seriesId!.isNotEmpty) {
            await prefs.hideFromContinueWatching(item.seriesId!);
          } else {
            await prefs.hideFromContinueWatching(item.id);
          }
          if (server == null) await _hideFromResumeOrReset(mutations, item);
          onChanged?.call();
        },
      ));
    }

    final isEpisode = type == 'Episode';
    final hasSeries = item.seriesId != null && item.seriesId!.isNotEmpty;
    if (isEpisode && hasSeries) {
      actions.add(ItemContextAction(
        icon: Icons.visibility_off_outlined,
        label: l10n.contextMenuHideFromNextUp,
        onSelect: () async {
          final server = dismissals();
          if (await _hiddenByServer(
            () => server?.hideFromNextUp(item.rawData),
          )) {
            onChanged?.call();
            return;
          }
          final prefs = GetIt.instance<UserPreferences>();
          await prefs.hideFromNextUp(item.seriesId!);
          await prefs.hideFromContinueWatching(item.seriesId!);
          if (server == null) await _hideFromResumeOrReset(mutations, item);
          onChanged?.call();
        },
      ));
    }

    actions.add(ItemContextAction(
      icon: item.isFavorite ? Icons.favorite : Icons.favorite_border,
      label: item.isFavorite
          ? l10n.contextMenuRemoveFromFavorites
          : l10n.contextMenuAddToFavorites,
      onSelect: () async {
        final isFavorite = !item.isFavorite;
        await _applyToEveryCopyAndReport(
          context,
          l10n,
          item,
          mutations,
          (mutations, itemId) =>
              mutations.setFavorite(itemId, isFavorite: isFavorite),
          onChanged: onChanged,
        );
      },
    ));

    if (canManageCollections) {
      actions.add(ItemContextAction(
        icon: Icons.collections_bookmark,
        label: l10n.contextMenuAddToCollection,
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

      // Only for the collection whose page this menu was opened from. An item
      // can belong to several, and pulling it out of one the user isn't
      // looking at would be a surprise.
      if (collectionRemoval != null) {
        actions.add(ItemContextAction(
          icon: Icons.playlist_remove,
          label: l10n.contextMenuRemoveFromCollection,
          onSelect: () => _confirmAndRemoveFromCollection(
            context,
            item,
            collectionRemoval,
            onChanged: onChanged,
          ),
        ));
      } else if (collectionMemberships != null &&
          collectionMemberships.isNotEmpty) {
        actions.add(ItemContextAction(
          icon: Icons.playlist_remove,
          label: l10n.contextMenuRemoveFromCollection,
          onSelect: () async {
            if (!context.mounted) return;
            final removed = await RemoveFromCollectionDialog.show(
              context,
              item: item,
              collections: collectionMemberships,
              serverId: item.serverId,
            );
            if (removed == true) {
              onChanged?.call();
            }
          },
        ));
      }
    }

    // Not for an item from a server without playlists (Silo).
    if (itemServerSupports(item.serverId, (f) => f.supportsPlaylists)) {
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

      if (playlistMemberships != null && playlistMemberships.isNotEmpty) {
        actions.add(ItemContextAction(
          icon: Icons.playlist_remove,
          label: l10n.removeFromPlaylist,
          onSelect: () async {
            if (!context.mounted) return;
            final removed = await RemoveFromPlaylistDialog.show(
              context,
              item: item,
              playlists: playlistMemberships,
              serverId: item.serverId,
            );
            if (removed == true) {
              onChanged?.call();
            }
          },
        ));
      }
    }

    if (isAdminUser) {
      actions.add(ItemContextAction(
        icon: Icons.refresh,
        label: l10n.adminRefreshMetadata,
        onSelect: () async {
          try {
            await mutations.refreshMetadata(item.id);
            refreshHomeRows(followUp: true);
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
              SnackBar(
                content: Text(
                  l10n.adminMetadataRefreshFailed(describeError(e, l10n)),
                ),
              ),
            );
          }
        },
      ));

      if (canIdentifyItemType(type)) {
        actions.add(ItemContextAction(
          icon: Icons.search_outlined,
          label: l10n.adminMetadataIdentify,
          onSelect: () async {
            if (!context.mounted) return;
            final isTVChild = item.type == 'Episode' || item.type == 'Season';
            final hasSeriesId =
                item.seriesId != null && item.seriesId!.isNotEmpty;
            final targetItemId =
                (isTVChild && hasSeriesId) ? item.seriesId! : item.id;
            final targetItemType =
                (isTVChild && hasSeriesId) ? 'Series' : item.type;
            final targetItemName = (isTVChild && hasSeriesId)
                ? (item.seriesName ?? item.name)
                : item.name;

            final identified = await IdentifyDialog.show(
              context,
              itemId: targetItemId,
              itemType: targetItemType,
              itemName: targetItemName,
              itemYear: isTVChild ? null : item.productionYear,
            );
            if (identified != null) {
              onChanged?.call();
            }
          },
        ));
      }
    }

  }

  final canChangeArtwork = (isMediaType ||
          type == 'Folder' ||
          type == 'CollectionFolder' ||
          type == 'UserView' ||
          type == 'Genre' ||
          type == 'MusicGenre' ||
          type == 'Studio' ||
          type == 'Network') &&
      isAdminUser;

  if (canChangeArtwork) {
    actions.add(ItemContextAction(
      icon: Icons.image_outlined,
      label: l10n.changeArtwork,
      onSelect: () async {
        if (!context.mounted) return;
        final changed = await ChangeArtworkDialog.show(
          context,
          item: item,
        );
        if (changed == true) {
          onChanged?.call();
        }
      },
    ));
  }

  if (type == 'Episode' && (item.seriesId?.isNotEmpty ?? false)) {
    actions.add(ItemContextAction(
      icon: Icons.tv_outlined,
      label: l10n.contextMenuGoToSeries,
      onSelect: () async {
        if (!context.mounted) return;
        context.push(Destinations.item(item.seriesId!, serverId: item.serverId));
      },
    ));
  }

  return actions;
}

/// Asks first, then pulls [item] out of the collection the menu was opened
/// from. The item stays in the library, so the confirm stays plain rather
/// than destructive.
Future<void> _confirmAndRemoveFromCollection(
  BuildContext context,
  AggregatedItem item,
  CollectionRemovalContext removal, {
  required VoidCallback? onChanged,
}) async {
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
        l10n.removeFromCollectionConfirm(item.name, removal.collectionName),
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
  if (confirmed != true || !context.mounted) return;

  try {
    await removal.remove(item);
    onChanged?.call();
  } catch (e) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${l10n.removeFromCollectionFailed}: ${describeError(e, l10n)}',
        ),
      ),
    );
  }
}

/// Runs a server's own hide of a Home card ([HomeDismissalsApi]) and
/// reloads Home, whose rows the server now answers without the card.
/// False when the server has none ([hide] answers null) or it failed, so the
/// caller falls back to this device's list. On that fallback the item isn't
/// marked unwatched as it is on Jellyfin, because on a server with
/// dismissals that would also erase its watch history.
Future<bool> _hiddenByServer(Future<void>? Function() hide) async {
  try {
    final hiding = hide();
    if (hiding == null) return false;
    await hiding;
  } catch (_) {
    return false;
  }
  refreshHomeRows();
  return true;
}
