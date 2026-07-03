import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../data/services/media_server_client_factory.dart';
import '../../l10n/app_localizations.dart';
import 'focusable_dialog_row.dart';
import 'overlay_sheet.dart';

class AddToPlaylistDialog extends StatefulWidget {
  final List<String> itemIds;
  final String? serverId;

  const AddToPlaylistDialog({super.key, required this.itemIds, this.serverId});

  static Future<bool?> show(
    BuildContext context, {
    required List<String> itemIds,
    String? serverId,
  }) {
    return showFocusRestoringDialog<bool>(
      context: context,
      builder: (_) => AddToPlaylistDialog(itemIds: itemIds, serverId: serverId),
    );
  }

  @override
  State<AddToPlaylistDialog> createState() => _AddToPlaylistDialogState();
}

class _AddToPlaylistDialogState extends State<AddToPlaylistDialog> {
  late final MediaServerClient _client;
  List<_PlaylistEntry>? _playlists;
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final factory = GetIt.instance<MediaServerClientFactory>();
    _client = widget.serverId != null
        ? (factory.getClientIfExists(widget.serverId!) ??
              GetIt.instance<MediaServerClient>())
        : GetIt.instance<MediaServerClient>();
    _loadPlaylists();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _loadPlaylists() async {
    try {
      final data = await _client.itemsApi.getPlaylists();
      final items = (data['Items'] as List?) ?? [];
      if (mounted) {
        setState(() {
          _playlists = items.cast<Map<String, dynamic>>().map((raw) {
            return _PlaylistEntry(
              id: raw['Id']?.toString() ?? '',
              name: raw['Name'] as String? ?? '',
            );
          }).toList();
        });
      }
    } catch (_) {
      if (mounted) setState(() => _playlists = []);
    }
  }

  Future<void> _addToPlaylist(String playlistId) async {
    try {
      await _client.itemsApi.addToPlaylist(playlistId, widget.itemIds);
      if (mounted) Navigator.pop(context, true);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).playlistAddFailed),
          ),
        );
      }
    }
  }

  Future<void> _createAndAdd() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;
    try {
      final result = await _client.itemsApi.createPlaylist(
        name: name,
        itemIds: widget.itemIds,
      );
      if (mounted) Navigator.pop(context, result.isNotEmpty);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).playlistCreateFailed),
          ),
        );
      }
    }
  }

  void _showCreateNew() {
    _nameController.clear();
    showFocusRestoringDialog(
      context: context,
      useRootNavigator: false,
      builder: (ctx) {
        final insets = MediaQuery.of(ctx).viewInsets;
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.only(bottom: insets.bottom),
            child: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(minWidth: 320, maxWidth: 440),
                decoration: BoxDecoration(
                  color: AppColorScheme.surface.withValues(alpha: 0.9),
                  borderRadius: AppRadius.circular(20),
                  border: Border.fromBorderSide(
                    ThemeRegistry.active.borders.chipBorder,
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(ctx).playlistNew,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _nameController,
                      autofocus: true,
                      style: TextStyle(color: AppColorScheme.onSurface),
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(ctx).playlistName,
                        hintStyle: TextStyle(
                          color: AppColorScheme.onSurface.withValues(
                            alpha: 0.4,
                          ),
                        ),
                        filled: true,
                        fillColor: AppColorScheme.onSurface.withValues(
                          alpha: 0.08,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: AppRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSubmitted: (_) {
                        Navigator.pop(ctx);
                        _createAndAdd();
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: Text(
                            AppLocalizations.of(ctx).cancel,
                            style: TextStyle(
                              color: AppColorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        FilledButton(
                          onPressed: () {
                            Navigator.pop(ctx);
                            _createAndAdd();
                          },
                          child: Text(AppLocalizations.of(ctx).playlistCreate),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
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
                  l10n.addToPlaylist,
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
            FocusableDialogRow(
              icon: Icons.add,
              label: l10n.playlistCreateNew,
              onTap: _showCreateNew,
              autofocus: true,
            ),
            if (_playlists == null)
              Padding(
                padding: EdgeInsets.all(24),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColorScheme.accent,
                    strokeWidth: 2,
                  ),
                ),
              )
            else if (_playlists!.isEmpty)
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  l10n.playlistNoneFound,
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
                  itemCount: _playlists!.length,
                  itemBuilder: (_, i) {
                    final pl = _playlists![i];
                    return FocusableDialogRow(
                      icon: Icons.queue_music,
                      label: pl.name,
                      onTap: () => _addToPlaylist(pl.id),
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
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaylistEntry {
  final String id;
  final String name;
  const _PlaylistEntry({required this.id, required this.name});
}
