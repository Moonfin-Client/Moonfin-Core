import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../data/repositories/item_mutation_repository.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../l10n/app_localizations.dart';
import '../../util/focus/dpad_keys.dart';
import '../../util/platform_detection.dart';
import 'focusable_dialog_row.dart';
import 'overlay_sheet.dart';

class AddToCollectionDialog extends StatefulWidget {
  final List<String> itemIds;
  final String? serverId;

  const AddToCollectionDialog({
    super.key,
    required this.itemIds,
    this.serverId,
  });

  static Future<bool?> show(
    BuildContext context, {
    required List<String> itemIds,
    String? serverId,
  }) {
    return showFocusRestoringDialog<bool>(
      context: context,
      builder: (_) =>
          AddToCollectionDialog(itemIds: itemIds, serverId: serverId),
    );
  }

  @override
  State<AddToCollectionDialog> createState() => _AddToCollectionDialogState();
}

class _AddToCollectionDialogState extends State<AddToCollectionDialog> {
  String _errorMessage(Object error) {
    if (error is DioException) {
      final status = error.response?.statusCode;
      final data = error.response?.data;
      final serverMessage = data is String
          ? data
          : (data is Map<String, dynamic>
                ? (data['message'] ?? data['Message'])?.toString()
                : null);
      if (serverMessage != null && serverMessage.trim().isNotEmpty) {
        return serverMessage;
      }
      if (status == 403) {
        return 'Collection management not allowed for this account.';
      }
      if (status != null) {
        return 'HTTP $status';
      }
    }
    return AppLocalizations.of(context).failedToLoad;
  }

  late final MediaServerClient _client;
  late final ItemMutationRepository _mutations;
  final _nameController = TextEditingController();
  final _createNameFocus = FocusNode(debugLabel: 'createCollectionName');
  final _createCreateFocus = FocusNode(debugLabel: 'createCollectionConfirm');
  final _createCancelFocus = FocusNode(debugLabel: 'createCollectionCancel');
  final _tvFieldKey = GlobalKey<CustomTVTextFieldState>();
  List<_CollectionEntry>? _collections;

  @override
  void initState() {
    super.initState();
    final factory = GetIt.instance<MediaServerClientFactory>();
    _client = widget.serverId != null
        ? (factory.getClientIfExists(widget.serverId!) ??
              GetIt.instance<MediaServerClient>())
        : GetIt.instance<MediaServerClient>();
    _mutations = ItemMutationRepository(_client);
    _loadCollections();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _createNameFocus.dispose();
    _createCreateFocus.dispose();
    _createCancelFocus.dispose();
    super.dispose();
  }

  Future<void> _loadCollections() async {
    try {
      final data = await _client.itemsApi.getItems(
        includeItemTypes: const ['BoxSet'],
        recursive: true,
        sortBy: 'SortName',
        sortOrder: 'Ascending',
      );
      final items = (data['Items'] as List?) ?? [];
      if (!mounted) return;
      setState(() {
        _collections = items.cast<Map<String, dynamic>>().map((raw) {
          return _CollectionEntry(
            id: raw['Id']?.toString() ?? '',
            name: raw['Name'] as String? ?? '',
          );
        }).toList();
      });
    } catch (_) {
      if (mounted) {
        setState(() => _collections = []);
      }
    }
  }

  String? _collectionIdFromCreateResponse(Map<String, dynamic> created) {
    final candidates = <String?>[
      created['Id']?.toString(),
      created['id']?.toString(),
      created['CollectionId']?.toString(),
      created['collectionId']?.toString(),
      created['ItemId']?.toString(),
      created['itemId']?.toString(),
    ];
    for (final candidate in candidates) {
      if (candidate != null && candidate.isNotEmpty) {
        return candidate;
      }
    }
    return null;
  }

  Future<String?> _findCreatedCollectionId(String name) async {
    final normalizedName = name.trim().toLowerCase();
    for (var attempt = 0; attempt < 3; attempt++) {
      final data = await _client.itemsApi.getItems(
        includeItemTypes: const ['BoxSet'],
        recursive: true,
        searchTerm: name,
        sortBy: 'DateCreated',
        sortOrder: 'Descending',
        limit: 25,
      );
      final items = (data['Items'] as List?) ?? const [];

      String? firstFoundId;
      for (final raw in items.whereType<Map>()) {
        final entry = raw.cast<String, dynamic>();
        final id = entry['Id']?.toString();
        final entryName = (entry['Name'] as String?)?.trim().toLowerCase();
        if (id == null || id.isEmpty) {
          continue;
        }
        firstFoundId ??= id;
        if (entryName == normalizedName) {
          return id;
        }
      }

      if (firstFoundId != null) {
        return firstFoundId;
      }

      if (attempt < 2) {
        await Future<void>.delayed(const Duration(milliseconds: 150));
      }
    }

    return null;
  }

  Future<void> _addToCollection(String collectionId) async {
    try {
      await _mutations.addToCollection(collectionId, widget.itemIds);
      if (mounted) Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_errorMessage(error))));
    }
  }

  Future<void> _createAndAdd() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;
    try {
      final created = await _mutations.createCollection(name: name);
      if (!mounted) return;

      final collectionId =
          _collectionIdFromCreateResponse(created) ??
          await _findCreatedCollectionId(name);

      if (!mounted) return;

      if (collectionId != null && widget.itemIds.isNotEmpty) {
        await _mutations.addToCollection(collectionId, widget.itemIds);
      }

      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_errorMessage(error))));
    }
  }

  void _showCreateNew() {
    _nameController.clear();
    showFocusRestoringDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (ctx) {
        final isTV = PlatformDetection.isTV;
        final insets = MediaQuery.of(ctx).viewInsets;
        final l10n = AppLocalizations.of(ctx);

        if (isTV) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted || !ctx.mounted) return;
            if (!_createNameFocus.hasFocus) {
              _createNameFocus.requestFocus();
            }
          });
        }

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
              child: Focus(
                onKeyEvent: (_, event) {
                  if (!isTV || !event.isActionable) {
                    return KeyEventResult.ignored;
                  }
                  final key = event.logicalKey;

                  if (_createNameFocus.hasFocus) {
                    if (key.isDownKey) {
                      _createCreateFocus.requestFocus();
                      return KeyEventResult.handled;
                    }
                    if (key.isSelectKey) {
                      _tvFieldKey.currentState?.openKeyboard();
                      return KeyEventResult.handled;
                    }
                    return KeyEventResult.ignored;
                  }

                  if (_createCreateFocus.hasFocus ||
                      _createCancelFocus.hasFocus) {
                    if (key.isUpKey) {
                      _createNameFocus.requestFocus();
                      return KeyEventResult.handled;
                    }
                    if (key.isLeftKey && _createCreateFocus.hasFocus) {
                      _createCancelFocus.requestFocus();
                      return KeyEventResult.handled;
                    }
                    if (key.isRightKey && _createCancelFocus.hasFocus) {
                      _createCreateFocus.requestFocus();
                      return KeyEventResult.handled;
                    }
                    if (key.isSelectKey) {
                      if (_createCreateFocus.hasFocus) {
                        Navigator.pop(ctx);
                        _createAndAdd();
                      } else {
                        Navigator.pop(ctx);
                      }
                      return KeyEventResult.handled;
                    }
                  }

                  return KeyEventResult.ignored;
                },
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 320,
                    maxWidth: 440,
                  ),
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
                        '${l10n.create} ${l10n.collections}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                      isTV
                          ? Focus(
                              focusNode: _createNameFocus,
                              child: ListenableBuilder(
                                listenable: _createNameFocus,
                                builder: (_, _) {
                                  return CustomTVTextField(
                                    key: _tvFieldKey,
                                    controller: _nameController,
                                    isFocused: _createNameFocus.hasFocus,
                                    hint: l10n.collections,
                                    onFieldSubmitted: (_) {
                                      Navigator.pop(ctx);
                                      _createAndAdd();
                                    },
                                  );
                                },
                              ),
                            )
                          : TextField(
                              controller: _nameController,
                              autofocus: true,
                              style: TextStyle(color: AppColorScheme.onSurface),
                              decoration: InputDecoration(
                                hintText: l10n.collections,
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
                            focusNode: isTV ? _createCancelFocus : null,
                            onPressed: () => Navigator.pop(ctx),
                            child: Text(
                              l10n.cancel,
                              style: TextStyle(
                                color: AppColorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          FilledButton(
                            focusNode: isTV ? _createCreateFocus : null,
                            onPressed: () {
                              Navigator.pop(ctx);
                              _createAndAdd();
                            },
                            child: Text(l10n.create),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                  '${l10n.add} ${l10n.collections}',
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
              label: '${l10n.create} ${l10n.collections}',
              onTap: _showCreateNew,
              autofocus: true,
            ),
            if (_collections == null)
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
                    final collection = _collections![i];
                    return FocusableDialogRow(
                      icon: Icons.collections_bookmark,
                      label: collection.name,
                      onTap: () => _addToCollection(collection.id),
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

class _CollectionEntry {
  final String id;
  final String name;

  const _CollectionEntry({required this.id, required this.name});
}
