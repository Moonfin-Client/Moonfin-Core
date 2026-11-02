import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/app_localizations.dart';
import '../util/error_message.dart';
import '../../preference/user_preferences.dart';
import '../../util/focus/dpad_keys.dart';
import '../../util/home_refresh_helper.dart';
import '../../util/platform_detection.dart';
import 'adaptive/adaptive_dialog.dart';
import 'focus/focusable_button.dart';
import 'overlay_sheet.dart';

/// A provider id's label, "{name} {type} Id", from the name and item type
/// the server lists for it.
String externalIdLabel(AppLocalizations l10n, String name, String? type) {
  final typeLabel = switch (type) {
    null || '' => null,
    'Movie' => l10n.movie,
    'Series' => l10n.series,
    'BoxSet' => l10n.collection,
    'Season' => l10n.season,
    'Episode' => l10n.episode,
    'Album' => l10n.album,
    'Track' => l10n.track,
    'Person' => l10n.adminExternalIdTypePerson,
    'Artist' => l10n.adminExternalIdTypeArtist,
    'AlbumArtist' => l10n.adminExternalIdTypeAlbumArtist,
    'OtherArtist' => l10n.adminExternalIdTypeOtherArtist,
    'ReleaseGroup' => l10n.adminExternalIdTypeReleaseGroup,
    'Book' => l10n.adminExternalIdTypeBook,
    _ => type,
  };
  return l10n.adminExternalIdLabel([name, ?typeLabel].join(' '));
}

class IdentifyDialog extends StatefulWidget {
  final String itemId;
  final String? itemType;
  final String? itemName;
  final int? itemYear;
  final String? itemPath;
  final Map<String, dynamic>? providerIds;

  const IdentifyDialog({
    super.key,
    required this.itemId,
    this.itemType,
    this.itemName,
    this.itemYear,
    this.itemPath,
    this.providerIds,
  });

  /// Answers the id [itemId] has after a match was applied, which can be a new
  /// one, or null when nothing was applied.
  static Future<String?> show(
    BuildContext context, {
    required String itemId,
    String? itemType,
    String? itemName,
    int? itemYear,
    String? itemPath,
    Map<String, dynamic>? providerIds,
  }) {
    return showFocusRestoringDialog<String>(
      context: context,
      builder: (ctx) => IdentifyDialog(
        itemId: itemId,
        itemType: itemType,
        itemName: itemName,
        itemYear: itemYear,
        itemPath: itemPath,
        providerIds: providerIds,
      ),
    );
  }

  @override
  State<IdentifyDialog> createState() => _IdentifyDialogState();
}

class _IdentifyDialogState extends State<IdentifyDialog> {
  /// Name and year, then one row per provider id the server knows for the
  /// item. Every focus node list and the d-pad wrap-around follow this.
  static const int _fixedFieldCount = 2;
  int get _fieldCount => _fixedFieldCount + _idFields.length;
  int get _lastFieldIndex => _fieldCount - 1;

  late final AdminItemsApi _adminApi;
  late final ItemsApi _itemsApi;
  late final UserPreferences _prefs;

  bool _loadingItem = false;
  String? _loadError;
  bool _searching = false;
  bool _applying = false;

  late String _targetItemId;
  String? _path;
  String _searchType = 'Movie';

  List<Map<String, dynamic>>? _searchResults;

  // What the item currently has, shown next to each search field.
  String? _refName;
  String? _refYear;
  Map<String, dynamic> _providerRefs = const {};

  // The search fields start blank so a search only uses what the admin types.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  /// One row per GET /Items/{id}/ExternalIdInfos entry, plugin providers
  /// included.
  List<_IdField> _idFields = const [];

  final ScrollController _scrollController = ScrollController();

  final FocusNode _closeButtonFocusNode = FocusNode(debugLabel: 'identify-close-btn');
  final FocusNode _cancelButtonFocusNode = FocusNode(debugLabel: 'identify-cancel-btn');
  final FocusNode _searchButtonFocusNode = FocusNode(debugLabel: 'identify-search-btn');

  final List<FocusNode> _fieldFocusNodes = [];
  final List<FocusNode> _arrowFocusNodes = [];
  final List<GlobalKey<CustomTVTextFieldState>> _tvFieldKeys = [];

  List<FocusNode>? _resultFocusNodes;

  bool get _isTV => PlatformDetection.isTV;

  @override
  void initState() {
    super.initState();
    final client = GetIt.instance<MediaServerClient>();
    _adminApi = client.adminItemsApi;
    _itemsApi = client.itemsApi;
    _prefs = GetIt.instance<UserPreferences>();

    _targetItemId = widget.itemId;
    final itemType = widget.itemType?.trim();
    final isTVChild = itemType == 'Episode' || itemType == 'Season';
    _searchType = isTVChild
        ? 'Series'
        : (itemType == null || itemType.isEmpty ? 'Movie' : itemType);
    _path = widget.itemPath;

    if (!isTVChild) {
      _refName = widget.itemName;
      _refYear = widget.itemYear?.toString();
      _providerRefs = widget.providerIds ?? const {};
    }

    _ensureFieldNodes(_fieldCount);
    _loadItemDetails();
  }

  /// Grows the per-row focus nodes to [count], each keeping its row on screen
  /// while the d-pad walks down the form.
  void _ensureFieldNodes(int count) {
    for (var i = _fieldFocusNodes.length; i < count; i++) {
      final field = FocusNode(debugLabel: 'identify-field-$i');
      final arrow = FocusNode(debugLabel: 'identify-arrow-$i');
      field.addListener(() {
        if (field.hasFocus) _scrollToIndex(i);
      });
      arrow.addListener(() {
        if (arrow.hasFocus) _scrollToIndex(i);
      });
      _fieldFocusNodes.add(field);
      _arrowFocusNodes.add(arrow);
      _tvFieldKeys.add(GlobalKey<CustomTVTextFieldState>());
    }
  }

  void _closeDialog([String? result]) {
    if (!mounted) return;
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop(result);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _yearController.dispose();
    for (final field in _idFields) {
      field.controller.dispose();
    }

    _scrollController.dispose();

    _closeButtonFocusNode.unfocus();
    _closeButtonFocusNode.dispose();

    _cancelButtonFocusNode.unfocus();
    _cancelButtonFocusNode.dispose();

    _searchButtonFocusNode.unfocus();
    _searchButtonFocusNode.dispose();

    for (final fn in _fieldFocusNodes) {
      fn.unfocus();
      fn.dispose();
    }
    for (final fn in _arrowFocusNodes) {
      fn.unfocus();
      fn.dispose();
    }
    _disposeNodes(_resultFocusNodes);
    _resultFocusNodes = null;
    super.dispose();
  }

  static void _disposeNodes(List<FocusNode>? nodes) {
    if (nodes == null) return;
    for (final fn in nodes) {
      fn.unfocus();
      fn.dispose();
    }
  }

  /// Disposes the result focus nodes only after the frame that takes the result
  /// cards off screen. Disposing them inline would leave the still mounted
  /// [Focus] widgets holding dead nodes, which throws on the next detach.
  void _releaseResultFocusNodes() {
    final stale = _resultFocusNodes;
    _resultFocusNodes = null;
    if (stale == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) => _disposeNodes(stale));
  }

  void _backToSearchForm() {
    setState(() => _searchResults = null);
    _releaseResultFocusNodes();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _isTV) {
        _fieldFocusNodes.first.requestFocus();
      }
    });
  }

  void _setupResultFocusNodes(int count) {
    _releaseResultFocusNodes();
    _resultFocusNodes =
        List.generate(count, (i) => FocusNode(debugLabel: 'identify-result-$i'));
    for (int i = 0; i < count; i++) {
      final idx = i;
      _resultFocusNodes![idx].addListener(() {
        if (_resultFocusNodes != null &&
            idx < _resultFocusNodes!.length &&
            _resultFocusNodes![idx].hasFocus) {
          _scrollToResultIndex(idx);
        }
      });
    }
  }

  void _scrollToIndex(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final fn = _fieldFocusNodes[index];
      final fnCtx = fn.context ?? _arrowFocusNodes[index].context;
      if (fnCtx != null && fnCtx.mounted) {
        Scrollable.ensureVisible(
          fnCtx,
          alignment: 0.35,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  void _scrollToResultIndex(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _resultFocusNodes == null || index >= _resultFocusNodes!.length) return;
      final fnCtx = _resultFocusNodes![index].context;
      if (fnCtx != null && fnCtx.mounted) {
        Scrollable.ensureVisible(
          fnCtx,
          alignment: 0.35,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  Future<void> _loadItemDetails() async {
    setState(() {
      _loadingItem = true;
      _loadError = null;
    });
    try {
      var raw = await _itemsApi.getItem(widget.itemId);

      if ((raw['Type'] == 'Episode' || raw['Type'] == 'Season') &&
          raw['SeriesId'] != null &&
          raw['SeriesId'].toString().isNotEmpty) {
        final seriesId = raw['SeriesId'].toString();
        // Episodes and seasons are identified through their series, but only
        // switch targets once that series has actually loaded, otherwise the
        // series id would end up paired with episode metadata.
        final series = await _itemsApi.getItem(seriesId);
        _targetItemId = seriesId;
        raw = series;
      }

      if (!mounted) return;
      if (raw['LockData'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(AppLocalizations.of(context).adminMetadataItemLocked)));
        _closeDialog();
        return;
      }
      setState(() {
        _refName = raw['Name']?.toString();
        _refYear = raw['ProductionYear']?.toString();
        if (raw['Path'] != null && raw['Path'].toString().isNotEmpty) {
          _path = raw['Path'].toString();
        }
        if (raw['Type'] != null && raw['Type'].toString().isNotEmpty) {
          _searchType = raw['Type'].toString();
        }
        final pIds = raw['ProviderIds'];
        if (pIds is Map) _providerRefs = Map<String, dynamic>.from(pIds);
      });
    } catch (e) {
      // Searching by hand still works without reference values, so say what
      // went wrong instead of leaving the current metadata column blank.
      if (mounted) {
        setState(() => _loadError = describeError(e, AppLocalizations.of(context)));
      }
    }
    // Without the id rows the name and year still search.
    final infos = await _adminApi
        .getExternalIdInfos(_targetItemId)
        .catchError((_) => <Map<String, dynamic>>[]);
    if (!mounted) return;
    setState(() {
      _idFields = [
        for (final info in infos)
          if ('${info['Key'] ?? ''}'.isNotEmpty)
            _IdField(
              '${info['Key']}',
              '${info['Name'] ?? info['Key']}',
              info['Type']?.toString(),
            ),
      ];
      _ensureFieldNodes(_fieldCount);
      _loadingItem = false;
    });
  }

  Future<List<Map<String, dynamic>>> _searchRemote(
    Map<String, dynamic> searchInfo, {
    String? providerName,
  }) {
    return _adminApi.searchRemote(_searchType, <String, dynamic>{
      'SearchInfo': searchInfo,
      'ItemId': _targetItemId,
      // A new Emby library has no providers turned on, so a search of only
      // the enabled ones finds nothing.
      'IncludeDisabledProviders':
          GetIt.instance<MediaServerClient>().serverType == ServerType.emby,
      'SearchProviderName': ?providerName,
    });
  }

  Future<void> _performSearch() async {
    final l10n = AppLocalizations.of(context);
    final nameVal = _nameController.text.trim();
    final yearVal = int.tryParse(_yearController.text.trim());

    // Provider ids are matched case insensitively, so one casing each is enough.
    final providerIds = <String, String>{};

    for (final field in _idFields) {
      var value = field.controller.text.trim();
      if (value.isEmpty) continue;
      // IMDb ids carry a tt prefix that a pasted number often lacks.
      if (field.key == 'Imdb' && RegExp(r'^\d+$').hasMatch(value)) {
        value = 'tt$value';
      }
      providerIds[field.key] = value;
    }

    if (nameVal.isEmpty && providerIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminMetadataNameOrIdRequired)),
      );
      return;
    }
    setState(() {
      _searching = true;
      _searchResults = null;
    });

    final searchInfo = <String, dynamic>{
      'Name': nameVal,
      'Year': ?yearVal,
      if (providerIds.isNotEmpty) 'ProviderIds': providerIds,
    };

    try {
      List<Map<String, dynamic>> results = await _searchRemote(searchInfo);

      // Pin the search to TheMovieDb when a TMDB or IMDb id was given. Note
      // that SearchProviderName belongs on the query, not inside SearchInfo.
      if (results.isEmpty &&
          (providerIds.containsKey('Tmdb') || providerIds.containsKey('Imdb'))) {
        results = await _searchRemote(searchInfo, providerName: 'TheMovieDb');
      }

      // Retry on the ids alone, in case the typed name blocked the match.
      if (results.isEmpty && providerIds.isNotEmpty && nameVal.isNotEmpty) {
        results = await _searchRemote(<String, dynamic>{
          'Name': '',
          'Year': ?yearVal,
          'ProviderIds': providerIds,
        });
      }

      // Last resort, drop the ids and search on name and year only.
      if (results.isEmpty && nameVal.isNotEmpty) {
        results = await _searchRemote(<String, dynamic>{
          'Name': nameVal,
          'Year': ?yearVal,
        });
      }

      if (!mounted) return;

      if (results.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminNoRemoteMatches)),
        );
        setState(() {
          _searching = false;
        });
      } else {
        _setupResultFocusNodes(results.length);
        setState(() {
          _searchResults = results;
          _searching = false;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && _resultFocusNodes != null && _resultFocusNodes!.isNotEmpty) {
            _resultFocusNodes![0].requestFocus();
          }
        });
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminRemoteSearchFailed(describeError(e, l10n)))),
      );
      setState(() => _searching = false);
    }
  }

  Future<void> _applyResult(Map<String, dynamic> result) async {
    if (_applying) return;
    final l10n = AppLocalizations.of(context);
    bool replaceAllImages = true;

    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (dialogCtx, setDialogState) => AlertDialog.adaptive(
          title: Text(l10n.adminRemoteResults),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (result['Name'] ?? l10n.unknown).toString(),
                style: Theme.of(ctx).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              FocusableButton(
                onPressed: () {
                  setDialogState(() {
                    replaceAllImages = !replaceAllImages;
                  });
                },
                borderRadius: 8,
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                child: Row(
                  children: [
                    Checkbox(
                      value: replaceAllImages,
                      onChanged: (val) {
                        setDialogState(() {
                          replaceAllImages = val ?? true;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.adminReplaceImages,
                        style: Theme.of(ctx).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            adaptiveDialogAction(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l10n.adminApply),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true || !mounted || _applying) return;

    setState(() => _applying = true);
    try {
      final movedTo = await _adminApi.applyRemoteSearchResult(
        _targetItemId,
        result,
        replaceAllImages: replaceAllImages,
      );
      refreshHomeRows(followUp: true);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminRemoteMetadataApplied)),
      );
      // A new id is only followed when the match was for this item itself,
      // not for the series of an episode or season.
      _closeDialog(
        (_targetItemId == widget.itemId ? movedTo : null) ?? widget.itemId,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminRemoteSearchFailed(describeError(e, l10n)))),
      );
    } finally {
      if (mounted) {
        setState(() => _applying = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final width = (MediaQuery.sizeOf(context).width - 32).clamp(340.0, 780.0);
    final height = (MediaQuery.sizeOf(context).height * 0.92).clamp(420.0, 840.0);

    return Dialog(
      backgroundColor: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular(16),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  if (_searchResults != null)
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: _backToSearchForm,
                      tooltip: l10n.adminBackToSearch,
                    ),
                  Expanded(
                    child: Text(
                      _searchResults == null
                          ? l10n.adminMetadataIdentify
                          : l10n.adminRemoteResults,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Focus(
                    focusNode: _closeButtonFocusNode,
                    onKeyEvent: (_, event) {
                      if (!event.isActionable) return KeyEventResult.ignored;
                      final key = event.logicalKey;
                      if (key.isSelectKey) {
                        _closeDialog();
                        return KeyEventResult.handled;
                      }
                      if (_isTV && key.isDownKey) {
                        if (_searchResults != null &&
                            _resultFocusNodes != null &&
                            _resultFocusNodes!.isNotEmpty) {
                          _resultFocusNodes![0].requestFocus();
                        } else {
                          _fieldFocusNodes[0].requestFocus();
                        }
                        return KeyEventResult.handled;
                      }
                      return KeyEventResult.ignored;
                    },
                    child: Builder(
                      builder: (btnCtx) {
                        final hasFocus = Focus.of(btnCtx).hasFocus;
                        return InkWell(
                          onTap: () => _closeDialog(),
                          borderRadius: AppRadius.circular(20),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: hasFocus
                                  ? theme.colorScheme.primary.withValues(alpha: 0.25)
                                  : Colors.transparent,
                              border: Border.all(
                                color: hasFocus
                                    ? theme.colorScheme.primary
                                    : Colors.transparent,
                                width: 2.5,
                              ),
                              boxShadow: hasFocus
                                  ? [
                                      BoxShadow(
                                        color: theme.colorScheme.primary
                                            .withValues(alpha: 0.6),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      )
                                    ]
                                  : null,
                            ),
                            child: Icon(
                              Icons.close,
                              color: hasFocus
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSurface,
                              size: 20,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Divider(height: 12),

              Expanded(
                child: _loadingItem || _applying
                    ? const Center(child: CircularProgressIndicator())
                    : _searchResults != null
                        ? _buildResultsList(context)
                        : _buildSearchForm(context),
              ),

              if (_searchResults == null) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Focus(
                        focusNode: _cancelButtonFocusNode,
                        onKeyEvent: (_, event) {
                          if (!event.isActionable) {
                            return KeyEventResult.ignored;
                          }
                          final key = event.logicalKey;
                          if (key.isSelectKey) {
                            _closeDialog();
                            return KeyEventResult.handled;
                          }
                          if (!_isTV) return KeyEventResult.ignored;
                          if (key.isUpKey) {
                            _fieldFocusNodes[_lastFieldIndex].requestFocus();
                            return KeyEventResult.handled;
                          }
                          if (key.isRightKey) {
                            _searchButtonFocusNode.requestFocus();
                            return KeyEventResult.handled;
                          }
                          return KeyEventResult.ignored;
                        },
                        child: Builder(
                          builder: (btnCtx) {
                            final hasFocus = Focus.of(btnCtx).hasFocus;
                            return TextButton(
                              onPressed: () => _closeDialog(),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                                minimumSize: const Size(60, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                backgroundColor: hasFocus
                                    ? theme.colorScheme.primary.withValues(alpha: 0.15)
                                    : null,
                                side: hasFocus
                                    ? BorderSide(color: theme.colorScheme.primary, width: 1.5)
                                    : null,
                              ),
                              child: Text(l10n.cancel),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Focus(
                        focusNode: _searchButtonFocusNode,
                        onKeyEvent: (_, event) {
                          if (!event.isActionable) {
                            return KeyEventResult.ignored;
                          }
                          final key = event.logicalKey;
                          if (key.isSelectKey) {
                            if (!_searching) _performSearch();
                            return KeyEventResult.handled;
                          }
                          if (!_isTV) return KeyEventResult.ignored;
                          if (key.isUpKey) {
                            _arrowFocusNodes[_lastFieldIndex].requestFocus();
                            return KeyEventResult.handled;
                          }
                          if (key.isLeftKey) {
                            _cancelButtonFocusNode.requestFocus();
                            return KeyEventResult.handled;
                          }
                          return KeyEventResult.ignored;
                        },
                        child: Builder(
                          builder: (btnCtx) {
                            final hasFocus = Focus.of(btnCtx).hasFocus;
                            return FilledButton.icon(
                              onPressed: _searching ? null : _performSearch,
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                                minimumSize: const Size(70, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                side: hasFocus
                                    ? const BorderSide(color: Colors.white, width: 2.0)
                                    : null,
                              ),
                              icon: _searching
                                  ? const SizedBox(
                                      width: 14,
                                      height: 14,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Icon(Icons.search, size: 16),
                              label: Text(l10n.search),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// The form rows in d-pad order. Position matters because the focus nodes are
  /// keyed off it.
  List<_IdentifyField> _searchFields(AppLocalizations l10n) => [
        _IdentifyField(l10n.name, _nameController, _refName),
        _IdentifyField(l10n.adminLabelYear, _yearController, _refYear,
            keyboardType: TextInputType.number),
        for (final field in _idFields)
          _IdentifyField(
            externalIdLabel(l10n, field.name, field.type),
            field.controller,
            _providerRef(field.key),
          ),
      ];

  /// ProviderIds keys are case insensitive on the server.
  String? _providerRef(String key) {
    for (final entry in _providerRefs.entries) {
      if (entry.key.toLowerCase() == key.toLowerCase()) {
        return entry.value?.toString();
      }
    }
    return null;
  }

  Widget _buildSearchForm(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final fields = _searchFields(l10n);
    assert(fields.length == _fieldCount);
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_loadError != null) ...[
            Row(
              children: [
                Icon(Icons.warning_amber_rounded,
                    size: 18, color: theme.colorScheme.error),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n.adminMetadataLoadFailed(_loadError!),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
          if (_path != null && _path!.isNotEmpty) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                borderRadius: AppRadius.circular(8),
              ),
              child: SelectableText(
                '${l10n.path}: $_path',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontFamily: 'monospace',
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],

          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    l10n.adminSearchParameters,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Matches the arrow column: 6px gap + 30px button + 6px gap.
                const SizedBox(width: 42),
                Expanded(
                  flex: 2,
                  child: Text(
                    l10n.adminCurrentMetadata,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          for (var i = 0; i < fields.length; i++) _buildFieldRow(i, fields[i]),
        ],
      ),
    );
  }

  Widget _buildFieldRow(int index, _IdentifyField field) {
    final theme = Theme.of(context);
    final label = field.label;
    final controller = field.controller;
    final keyboardType = field.keyboardType;
    final reference = field.reference?.trim();
    final hasReference = reference != null && reference.isNotEmpty;
    final fieldFocusNode = _fieldFocusNodes[index];
    final arrowFocusNode = _arrowFocusNodes[index];
    final tvFieldKey = _tvFieldKeys[index];
    void pullReference() {
      if (hasReference) setState(() => controller.text = reference);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Only TV gets the d-pad wrapper. Anywhere else a handler that
          // swallows space and the arrows would stop them reaching the text
          // input, so the field would refuse spaces and the caret couldn't move.
          Expanded(
            flex: 3,
            child: _isTV
                ? Focus(
                    focusNode: fieldFocusNode,
                    onKeyEvent: (_, event) {
                      if (!event.isActionable) return KeyEventResult.ignored;
                      final key = event.logicalKey;
                      if (key.isSelectKey) {
                        if (!fieldFocusNode.hasFocus) {
                          fieldFocusNode.requestFocus();
                        }
                        tvFieldKey.currentState?.openKeyboard();
                        return KeyEventResult.handled;
                      }
                      if (key.isRightKey) {
                        arrowFocusNode.requestFocus();
                        return KeyEventResult.handled;
                      }
                      if (key.isDownKey) {
                        if (index < _lastFieldIndex) {
                          _fieldFocusNodes[index + 1].requestFocus();
                        } else {
                          _cancelButtonFocusNode.requestFocus();
                        }
                        return KeyEventResult.handled;
                      }
                      if (key.isUpKey) {
                        if (index > 0) {
                          _fieldFocusNodes[index - 1].requestFocus();
                        } else {
                          _closeButtonFocusNode.requestFocus();
                        }
                        return KeyEventResult.handled;
                      }
                      return KeyEventResult.ignored;
                    },
                    child: ListenableBuilder(
                      listenable: fieldFocusNode,
                      builder: (ctx, _) {
                        final keyboardStyle =
                            _prefs.get(UserPreferences.keyboardStyle);
                        return GestureDetector(
                          onTap: () {
                            if (!fieldFocusNode.hasFocus) {
                              fieldFocusNode.requestFocus();
                            }
                            tvFieldKey.currentState?.openKeyboard();
                          },
                          child: CustomTVTextField(
                            key: tvFieldKey,
                            controller: controller,
                            isFocused: fieldFocusNode.hasFocus,
                            inputPurpose: InputPurpose.text,
                            keyboardType: keyboardType == TextInputType.number
                                ? KeyboardType.numeric
                                : KeyboardType.alphabetic,
                            keyboardStyle: keyboardStyle,
                            hint: label,
                            filled: true,
                            fillColor: theme.colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.4),
                            borderColor: theme.colorScheme.outlineVariant
                                .withValues(alpha: 0.4),
                            focusedBorderColor: theme.colorScheme.primary,
                            hintStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.6),
                            ),
                            textStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                            popParentOnKeyboardClose: false,
                          ),
                        );
                      },
                    ),
                  )
                : TextField(
                    controller: controller,
                    focusNode: fieldFocusNode,
                    keyboardType: keyboardType,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (_) {
                      if (!_searching) _performSearch();
                    },
                    style: theme.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      labelText: label,
                      border: const OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
          ),
          const SizedBox(width: 6),

          // Copies the current value on the right into the field on the left.
          Focus(
            focusNode: arrowFocusNode,
            onKeyEvent: (_, event) {
              if (!event.isActionable) return KeyEventResult.ignored;
              final key = event.logicalKey;
              if (key.isSelectKey) {
                pullReference();
                return KeyEventResult.handled;
              }
              // Normal traversal already reaches this button off TV, so the
              // arrow keys are left alone there.
              if (!_isTV) return KeyEventResult.ignored;
              if (key.isUpKey) {
                if (index == 0) {
                  _closeButtonFocusNode.requestFocus();
                } else {
                  _arrowFocusNodes[index - 1].requestFocus();
                }
                return KeyEventResult.handled;
              }
              if (key.isDownKey) {
                if (index < _lastFieldIndex) {
                  _arrowFocusNodes[index + 1].requestFocus();
                } else {
                  _searchButtonFocusNode.requestFocus();
                }
                return KeyEventResult.handled;
              }
              if (key.isRightKey) {
                _searchButtonFocusNode.requestFocus();
                return KeyEventResult.handled;
              }
              if (key.isLeftKey) {
                fieldFocusNode.requestFocus();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },
            child: Builder(
              builder: (btnCtx) {
                final hasFocus = Focus.of(btnCtx).hasFocus;
                return InkWell(
                  onTap: hasReference ? pullReference : null,
                  borderRadius: AppRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: hasFocus
                          ? theme.colorScheme.primary.withValues(alpha: 0.25)
                          : Colors.transparent,
                      border: Border.all(
                        color: hasFocus
                            ? theme.colorScheme.primary
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.west,
                      size: 18,
                      color: hasFocus
                          ? theme.colorScheme.primary
                          : (hasReference
                              ? theme.colorScheme.primary.withValues(alpha: 0.8)
                              : theme.colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.3)),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 6),

          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.18),
                borderRadius: AppRadius.circular(6),
                border: Border(
                  left: BorderSide(
                    color: hasReference
                        ? theme.colorScheme.primary.withValues(alpha: 0.4)
                        : Colors.transparent,
                    width: 2.5,
                  ),
                ),
              ),
              child: Text(
                hasReference ? reference : '-',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: hasReference
                      ? theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.85)
                      : theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                  fontStyle: hasReference ? FontStyle.normal : FontStyle.italic,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList(BuildContext context) {
    final theme = Theme.of(context);
    final results = _searchResults!;

    return ListView.builder(
      controller: _scrollController,
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        final name = (item['Name'] ?? '').toString();
        final year = item['ProductionYear']?.toString();
        final overview = (item['Overview'] ?? '').toString();
        final provider =
            (item['SearchProviderName'] ?? item['ProviderName'] ?? '').toString();
        final imageUrl = item['ImageUrl']?.toString();
        final resultFocusNode = _resultFocusNodes != null && index < _resultFocusNodes!.length
            ? _resultFocusNodes![index]
            : null;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Focus(
            focusNode: resultFocusNode,
            onKeyEvent: (_, event) {
              if (!event.isActionable) return KeyEventResult.ignored;
              final key = event.logicalKey;
              if (key.isSelectKey) {
                _applyResult(item);
                return KeyEventResult.handled;
              }
              if (!_isTV) return KeyEventResult.ignored;
              if (key.isUpKey) {
                if (index == 0) {
                  _closeButtonFocusNode.requestFocus();
                } else if (_resultFocusNodes != null && index > 0) {
                  _resultFocusNodes![index - 1].requestFocus();
                }
                return KeyEventResult.handled;
              }
              if (key.isDownKey) {
                if (_resultFocusNodes != null &&
                    index < _resultFocusNodes!.length - 1) {
                  _resultFocusNodes![index + 1].requestFocus();
                }
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },
            child: Builder(
              builder: (cardCtx) {
                final hasFocus = Focus.of(cardCtx).hasFocus;
                return Card(
                  margin: EdgeInsets.zero,
                  color: hasFocus
                      ? theme.colorScheme.primaryContainer.withValues(alpha: 0.4)
                      : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.circular(10),
                    side: BorderSide(
                      color: hasFocus
                          ? theme.colorScheme.primary
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    onTap: () => _applyResult(item),
                    borderRadius: AppRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: AppRadius.circular(6),
                            child: imageUrl != null && imageUrl.isNotEmpty
                                ? Image.network(
                                    imageUrl,
                                    headers: serverImageHeaders,
                                    width: 50,
                                    height: 75,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, _, _) => Container(
                                      width: 50,
                                      height: 75,
                                      color: theme.colorScheme.surfaceContainerHighest,
                                      child: const Icon(Icons.movie_outlined),
                                    ),
                                  )
                                : Container(
                                    width: 50,
                                    height: 75,
                                    color: theme.colorScheme.surfaceContainerHighest,
                                    child: const Icon(Icons.movie_outlined),
                                  ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  year != null && year.isNotEmpty ? '$name ($year)' : name,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: hasFocus
                                        ? theme.colorScheme.primary
                                        : theme.colorScheme.onSurface,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (provider.isNotEmpty) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    provider,
                                    style: theme.textTheme.labelMedium?.copyWith(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ],
                                if (overview.isNotEmpty) ...[
                                  const SizedBox(height: 6),
                                  Text(
                                    overview,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: hasFocus
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

/// One row of the search form, pairing an editable field with the value the
/// item already carries.
class _IdentifyField {
  final String label;
  final TextEditingController controller;
  final String? reference;
  final TextInputType? keyboardType;

  const _IdentifyField(
    this.label,
    this.controller,
    this.reference, {
    this.keyboardType,
  });
}

/// A provider id row from GET /Items/{id}/ExternalIdInfos: the ProviderIds
/// key, the provider's name and the item type the id belongs to.
class _IdField {
  _IdField(this.key, this.name, this.type);

  final String key;
  final String name;
  final String? type;
  final controller = TextEditingController();
}
