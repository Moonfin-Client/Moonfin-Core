import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/app_localizations.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import 'adaptive/adaptive_dialog.dart';
import 'focus/focusable_button.dart';

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

  static Future<bool?> show(
    BuildContext context, {
    required String itemId,
    String? itemType,
    String? itemName,
    int? itemYear,
    String? itemPath,
    Map<String, dynamic>? providerIds,
  }) {
    return showDialog<bool>(
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
  late final AdminItemsApi _adminApi;
  late final ItemsApi _itemsApi;
  late final UserPreferences _prefs;

  bool _loadingItem = false;
  bool _searching = false;
  bool _applying = false;

  late String _targetItemId;
  String? _path;
  String _searchType = 'Movie';

  List<Map<String, dynamic>>? _searchResults;

  // Reference Metadata Values (Current Item)
  String? _refName;
  String? _refYear;
  String? _refImdb;
  String? _refTmdbMovie;
  String? _refTmdbBoxSet;
  String? _refTvdbBoxSet;
  String? _refTvdbId;
  String? _refTvdbSlug;

  // Editable Search Parameter Controllers (Blank by default)
  late final TextEditingController _nameController;
  late final TextEditingController _yearController;
  late final TextEditingController _imdbController;
  late final TextEditingController _tmdbMovieController;
  late final TextEditingController _tmdbBoxSetController;
  late final TextEditingController _tvdbBoxSetController;
  late final TextEditingController _tvdbIdController;
  late final TextEditingController _tvdbSlugController;

  // FocusNodes and ScrollController for TV Navigation
  final ScrollController _scrollController = ScrollController();

  final FocusNode _closeButtonFocusNode = FocusNode(debugLabel: 'identify-close-btn');
  final FocusNode _cancelButtonFocusNode = FocusNode(debugLabel: 'identify-cancel-btn');
  final FocusNode _searchButtonFocusNode = FocusNode(debugLabel: 'identify-search-btn');

  final List<FocusNode> _fieldFocusNodes =
      List.generate(8, (i) => FocusNode(debugLabel: 'identify-field-$i'));
  final List<FocusNode> _arrowFocusNodes =
      List.generate(8, (i) => FocusNode(debugLabel: 'identify-arrow-$i'));
  final List<GlobalKey<CustomTVTextFieldState>> _tvFieldKeys =
      List.generate(8, (_) => GlobalKey<CustomTVTextFieldState>());

  List<FocusNode>? _resultFocusNodes;

  @override
  void initState() {
    super.initState();
    final client = GetIt.instance<MediaServerClient>();
    _adminApi = client.adminItemsApi;
    _itemsApi = client.itemsApi;
    _prefs = GetIt.instance<UserPreferences>();

    _targetItemId = widget.itemId;
    final isTVChild = widget.itemType == 'Episode' || widget.itemType == 'Season';
    _searchType = isTVChild ? 'Series' : (widget.itemType ?? 'Movie');
    _path = widget.itemPath;

    final initialProviders = widget.providerIds ?? const {};

    if (!isTVChild) {
      _refName = widget.itemName;
      _refYear = widget.itemYear?.toString();
      _refImdb = initialProviders['Imdb']?.toString();
      _refTmdbMovie = initialProviders['Tmdb']?.toString();
      _refTmdbBoxSet = initialProviders['TmdbBoxSet']?.toString();
      _refTvdbBoxSet = initialProviders['TvdbBoxSet']?.toString();
      _refTvdbId = initialProviders['Tvdb']?.toString();
      _refTvdbSlug = initialProviders['TvdbSlug']?.toString();
    }

    // Search controllers start BLANK by default
    _nameController = TextEditingController(text: '');
    _yearController = TextEditingController(text: '');
    _imdbController = TextEditingController(text: '');
    _tmdbMovieController = TextEditingController(text: '');
    _tmdbBoxSetController = TextEditingController(text: '');
    _tvdbBoxSetController = TextEditingController(text: '');
    _tvdbIdController = TextEditingController(text: '');
    _tvdbSlugController = TextEditingController(text: '');

    // Add listeners to auto-scroll focused rows into the visible viewport on TV
    for (int i = 0; i < 8; i++) {
      final idx = i;
      _fieldFocusNodes[idx].addListener(() {
        if (_fieldFocusNodes[idx].hasFocus) {
          _scrollToIndex(idx);
        }
      });
      _arrowFocusNodes[idx].addListener(() {
        if (_arrowFocusNodes[idx].hasFocus) {
          _scrollToIndex(idx);
        }
      });
    }

    _fetchItemDetailsIfNeeded();
  }

  void _closeDialog([bool? result]) {
    FocusScope.of(context).unfocus();
    if (mounted) {
      Navigator.of(context).pop(result);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _yearController.dispose();
    _imdbController.dispose();
    _tmdbMovieController.dispose();
    _tmdbBoxSetController.dispose();
    _tvdbBoxSetController.dispose();
    _tvdbIdController.dispose();
    _tvdbSlugController.dispose();

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
    _clearResultFocusNodes();
    super.dispose();
  }

  void _clearResultFocusNodes() {
    if (_resultFocusNodes != null) {
      for (final fn in _resultFocusNodes!) {
        fn.unfocus();
        fn.dispose();
      }
      _resultFocusNodes = null;
    }
  }

  void _setupResultFocusNodes(int count) {
    _clearResultFocusNodes();
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

  Future<void> _fetchItemDetailsIfNeeded() async {
    setState(() => _loadingItem = true);
    try {
      var raw = await _itemsApi.getItem(widget.itemId);

      if ((raw['Type'] == 'Episode' || raw['Type'] == 'Season') &&
          raw['SeriesId'] != null &&
          raw['SeriesId'].toString().isNotEmpty) {
        _targetItemId = raw['SeriesId'].toString();
        _searchType = 'Series';
        try {
          raw = await _itemsApi.getItem(_targetItemId);
        } catch (_) {}
      }

      if (!mounted) return;
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
        if (pIds is Map) {
          _refImdb = pIds['Imdb']?.toString();
          _refTmdbMovie = pIds['Tmdb']?.toString();
          _refTmdbBoxSet = pIds['TmdbBoxSet']?.toString();
          _refTvdbBoxSet = pIds['TvdbBoxSet']?.toString();
          _refTvdbId = pIds['Tvdb']?.toString();
          _refTvdbSlug = pIds['TvdbSlug']?.toString();
        }
      });
    } catch (_) {
    } finally {
      if (mounted) {
        setState(() => _loadingItem = false);
      }
    }
  }

  Future<void> _performSearch() async {
    final l10n = AppLocalizations.of(context);
    setState(() {
      _searching = true;
      _searchResults = null;
    });

    final nameVal = _nameController.text.trim();
    final yearVal = int.tryParse(_yearController.text.trim());

    final providerIds = <String, String>{};

    var imdbVal = _imdbController.text.trim();
    if (imdbVal.isNotEmpty) {
      if (RegExp(r'^\d+$').hasMatch(imdbVal)) {
        imdbVal = 'tt$imdbVal';
      }
      providerIds['Imdb'] = imdbVal;
      providerIds['IMDb'] = imdbVal;
      providerIds['imdb'] = imdbVal;
    }

    final tmdbVal = _tmdbMovieController.text.trim();
    if (tmdbVal.isNotEmpty) {
      providerIds['Tmdb'] = tmdbVal;
      providerIds['TMDB'] = tmdbVal;
      providerIds['tmdb'] = tmdbVal;
    }

    final tmdbBoxSetVal = _tmdbBoxSetController.text.trim();
    if (tmdbBoxSetVal.isNotEmpty) {
      providerIds['TmdbBoxSet'] = tmdbBoxSetVal;
      providerIds['TMDBBoxSet'] = tmdbBoxSetVal;
    }

    final tvdbBoxSetVal = _tvdbBoxSetController.text.trim();
    if (tvdbBoxSetVal.isNotEmpty) {
      providerIds['TvdbBoxSet'] = tvdbBoxSetVal;
      providerIds['TVDBBoxSet'] = tvdbBoxSetVal;
    }

    final tvdbVal = _tvdbIdController.text.trim();
    if (tvdbVal.isNotEmpty) {
      providerIds['Tvdb'] = tvdbVal;
      providerIds['TVDB'] = tvdbVal;
      providerIds['tvdb'] = tvdbVal;
    }

    final tvdbSlugVal = _tvdbSlugController.text.trim();
    if (tvdbSlugVal.isNotEmpty) {
      providerIds['TvdbSlug'] = tvdbSlugVal;
      providerIds['TVDBSlug'] = tvdbSlugVal;
    }

    final searchInfo = <String, dynamic>{
      'Name': nameVal,
      'Year': ?yearVal,
      if (providerIds.isNotEmpty) 'ProviderIds': providerIds,
    };

    debugPrint('--> [IdentifyRemoteSearch] Executing search for $_searchType | ItemId: $_targetItemId');
    debugPrint('--> [IdentifyRemoteSearch] SearchInfo: $searchInfo');

    try {
      List<Map<String, dynamic>> results = await _adminApi.searchRemote(_searchType, {
        'SearchInfo': searchInfo,
        'ItemId': _targetItemId,
        'IncludeDisabledProviders': false,
      });

      // Fallback 1: If TMDB/IMDb is present, try setting explicit SearchProviderName
      if (results.isEmpty && (providerIds.containsKey('Tmdb') || providerIds.containsKey('Imdb'))) {
        final altInfoProvider = <String, dynamic>{
          ...searchInfo,
          'SearchProviderName': 'TheMovieDb',
        };
        debugPrint('--> [IdentifyRemoteSearch] Retry with SearchProviderName: TheMovieDb');
        results = await _adminApi.searchRemote(_searchType, {
          'SearchInfo': altInfoProvider,
          'ItemId': _targetItemId,
          'IncludeDisabledProviders': false,
        });
      }

      // Fallback 2: Try ProviderIds alone without Name
      if (results.isEmpty && providerIds.isNotEmpty && nameVal.isNotEmpty) {
        final altInfoA = <String, dynamic>{
          'Name': '',
          'Year': ?yearVal,
          'ProviderIds': providerIds,
        };
        debugPrint('--> [IdentifyRemoteSearch] Retry with ProviderIds alone (empty Name)');
        results = await _adminApi.searchRemote(_searchType, {
          'SearchInfo': altInfoA,
          'ItemId': _targetItemId,
          'IncludeDisabledProviders': false,
        });
      }

      // Fallback 3: Try Name (+ Year) alone
      if (results.isEmpty && nameVal.isNotEmpty) {
        final altInfoB = <String, dynamic>{
          'Name': nameVal,
          'Year': ?yearVal,
        };
        debugPrint('--> [IdentifyRemoteSearch] Retry with Name + Year alone');
        results = await _adminApi.searchRemote(_searchType, {
          'SearchInfo': altInfoB,
          'ItemId': _targetItemId,
          'IncludeDisabledProviders': false,
        });
      }

      debugPrint('<-- [IdentifyRemoteSearch] Results received: ${results.length}');
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
        SnackBar(content: Text(l10n.adminRemoteSearchFailed('$e'))),
      );
      setState(() => _searching = false);
    }
  }

  Future<void> _applyResult(Map<String, dynamic> result) async {
    final l10n = AppLocalizations.of(context);
    bool replaceAllImages = true;

    final confirmed = await showDialog<bool>(
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

    if (confirmed != true || !mounted) return;

    setState(() => _applying = true);
    try {
      await _adminApi.applyRemoteSearchResult(_targetItemId, result);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminRemoteMetadataApplied)),
      );
      _closeDialog(true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminRemoteSearchFailed('$e'))),
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
              // Dialog Header
              Row(
                children: [
                  if (_searchResults != null)
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        _clearResultFocusNodes();
                        setState(() => _searchResults = null);
                      },
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
                  // Requirement 1 & 2: Pronounced X focus & Down navigation & Select/Enter pop
                  Focus(
                    focusNode: _closeButtonFocusNode,
                    onKeyEvent: (_, event) {
                      if (event is KeyDownEvent) {
                        final key = event.logicalKey;
                        if (key == LogicalKeyboardKey.select ||
                            key == LogicalKeyboardKey.enter ||
                            key == LogicalKeyboardKey.gameButtonA ||
                            key == LogicalKeyboardKey.space) {
                          _closeDialog(false);
                          return KeyEventResult.handled;
                        }
                        if (key == LogicalKeyboardKey.arrowDown) {
                          if (_searchResults != null &&
                              _resultFocusNodes != null &&
                              _resultFocusNodes!.isNotEmpty) {
                            _resultFocusNodes![0].requestFocus();
                          } else {
                            _arrowFocusNodes[0].requestFocus();
                          }
                          return KeyEventResult.handled;
                        }
                      }
                      return KeyEventResult.ignored;
                    },
                    child: Builder(
                      builder: (btnCtx) {
                        final hasFocus = Focus.of(btnCtx).hasFocus;
                        return GestureDetector(
                          onTap: () => _closeDialog(false),
                          child: InkWell(
                            onTap: () => _closeDialog(false),
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
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Divider(height: 12),

              // Dialog Body
              Expanded(
                child: _loadingItem || _applying
                    ? const Center(child: CircularProgressIndicator())
                    : _searchResults != null
                        ? _buildResultsList(context)
                        : _buildSearchForm(context),
              ),

              // Requirement 5: Compact Button Bar
              if (_searchResults == null) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Focus(
                        focusNode: _cancelButtonFocusNode,
                        onKeyEvent: (_, event) {
                          if (event is KeyDownEvent) {
                            final key = event.logicalKey;
                            if (key == LogicalKeyboardKey.select ||
                                key == LogicalKeyboardKey.enter ||
                                key == LogicalKeyboardKey.gameButtonA ||
                                key == LogicalKeyboardKey.space) {
                              _closeDialog(false);
                              return KeyEventResult.handled;
                            }
                            if (key == LogicalKeyboardKey.arrowUp) {
                              _fieldFocusNodes[7].requestFocus();
                              return KeyEventResult.handled;
                            }
                            if (key == LogicalKeyboardKey.arrowRight) {
                              _searchButtonFocusNode.requestFocus();
                              return KeyEventResult.handled;
                            }
                          }
                          return KeyEventResult.ignored;
                        },
                        child: Builder(
                          builder: (btnCtx) {
                            final hasFocus = Focus.of(btnCtx).hasFocus;
                            return TextButton(
                              onPressed: () => _closeDialog(false),
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
                          if (event is KeyDownEvent) {
                            final key = event.logicalKey;
                            if (key == LogicalKeyboardKey.select ||
                                key == LogicalKeyboardKey.enter ||
                                key == LogicalKeyboardKey.gameButtonA ||
                                key == LogicalKeyboardKey.space) {
                              if (!_searching) _performSearch();
                              return KeyEventResult.handled;
                            }
                            if (key == LogicalKeyboardKey.arrowUp) {
                              _arrowFocusNodes[7].requestFocus();
                              return KeyEventResult.handled;
                            }
                            if (key == LogicalKeyboardKey.arrowLeft) {
                              _cancelButtonFocusNode.requestFocus();
                              return KeyEventResult.handled;
                            }
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

  Widget _buildSearchForm(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_path != null && _path!.isNotEmpty) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                borderRadius: AppRadius.circular(8),
              ),
              child: SelectableText(
                'Path: $_path',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontFamily: 'monospace',
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],

          // Column Headers
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
                const SizedBox(width: 48), // Arrow button spacing
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

          _buildFieldRow(
            index: 0,
            label: l10n.adminLabelName,
            controller: _nameController,
            referenceValue: _refName,
          ),
          _buildFieldRow(
            index: 1,
            label: l10n.adminLabelYear,
            controller: _yearController,
            referenceValue: _refYear,
            keyboardType: TextInputType.number,
          ),
          _buildFieldRow(
            index: 2,
            label: l10n.adminLabelImdbId,
            controller: _imdbController,
            referenceValue: _refImdb,
          ),
          _buildFieldRow(
            index: 3,
            label: l10n.adminLabelTmdbMovieId,
            controller: _tmdbMovieController,
            referenceValue: _refTmdbMovie,
          ),
          _buildFieldRow(
            index: 4,
            label: l10n.adminLabelTmdbBoxSetId,
            controller: _tmdbBoxSetController,
            referenceValue: _refTmdbBoxSet,
          ),
          _buildFieldRow(
            index: 5,
            label: l10n.adminLabelTvdbBoxSetId,
            controller: _tvdbBoxSetController,
            referenceValue: _refTvdbBoxSet,
          ),
          _buildFieldRow(
            index: 6,
            label: l10n.adminLabelTvdbId,
            controller: _tvdbIdController,
            referenceValue: _refTvdbId,
          ),
          _buildFieldRow(
            index: 7,
            label: l10n.adminLabelTvdbSlug,
            controller: _tvdbSlugController,
            referenceValue: _refTvdbSlug,
          ),
        ],
      ),
    );
  }

  Widget _buildFieldRow({
    required int index,
    required String label,
    required TextEditingController controller,
    required String? referenceValue,
    TextInputType? keyboardType,
  }) {
    final theme = Theme.of(context);
    final hasReference = referenceValue != null && referenceValue.trim().isNotEmpty;
    final fieldFocusNode = _fieldFocusNodes[index];
    final arrowFocusNode = _arrowFocusNodes[index];
    final tvFieldKey = _tvFieldKeys[index];

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Column: Search Input Field (Uses CustomTVTextField on TV)
          Expanded(
            flex: 3,
            child: Focus(
              focusNode: fieldFocusNode,
              onKeyEvent: (_, event) {
                if (event is KeyDownEvent) {
                  final key = event.logicalKey;
                  if (key == LogicalKeyboardKey.select ||
                      key == LogicalKeyboardKey.enter ||
                      key == LogicalKeyboardKey.gameButtonA ||
                      key == LogicalKeyboardKey.space) {
                    if (!fieldFocusNode.hasFocus) {
                      fieldFocusNode.requestFocus();
                    }
                    tvFieldKey.currentState?.openKeyboard();
                    return KeyEventResult.handled;
                  }
                  if (key == LogicalKeyboardKey.arrowRight) {
                    arrowFocusNode.requestFocus();
                    return KeyEventResult.handled;
                  }
                  if (key == LogicalKeyboardKey.arrowDown) {
                    if (index < 7) {
                      _fieldFocusNodes[index + 1].requestFocus();
                    } else {
                      _cancelButtonFocusNode.requestFocus();
                    }
                    return KeyEventResult.handled;
                  }
                  if (key == LogicalKeyboardKey.arrowUp) {
                    if (index > 0) {
                      _fieldFocusNodes[index - 1].requestFocus();
                    } else {
                      _closeButtonFocusNode.requestFocus();
                    }
                    return KeyEventResult.handled;
                  }
                }
                return KeyEventResult.ignored;
              },
              child: ListenableBuilder(
                listenable: fieldFocusNode,
                builder: (ctx, _) {
                  if (PlatformDetection.isTV) {
                    final preferSystemIme =
                        _prefs.get(UserPreferences.preferSystemImeKeyboard);
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
                        preferSystemIme: preferSystemIme,
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
                  }

                  return TextField(
                    controller: controller,
                    keyboardType: keyboardType,
                    style: theme.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      labelText: label,
                      border: const OutlineInputBorder(),
                      isDense: true,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 6),

          // Pull Action Button with explicit Up/Down/Left/Right TV D-pad linking & Select/Enter activation
          Focus(
            focusNode: arrowFocusNode,
            onKeyEvent: (_, event) {
              if (event is KeyDownEvent) {
                final key = event.logicalKey;
                if (key == LogicalKeyboardKey.select ||
                    key == LogicalKeyboardKey.enter ||
                    key == LogicalKeyboardKey.gameButtonA ||
                    key == LogicalKeyboardKey.space) {
                  if (hasReference) {
                    setState(() {
                      controller.text = referenceValue.trim();
                    });
                  }
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.arrowUp) {
                  if (index == 0) {
                    _closeButtonFocusNode.requestFocus();
                  } else {
                    _arrowFocusNodes[index - 1].requestFocus();
                  }
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.arrowDown) {
                  if (index < 7) {
                    _arrowFocusNodes[index + 1].requestFocus();
                  } else {
                    _searchButtonFocusNode.requestFocus();
                  }
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.arrowRight) {
                  _searchButtonFocusNode.requestFocus();
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.arrowLeft) {
                  fieldFocusNode.requestFocus();
                  return KeyEventResult.handled;
                }
              }
              return KeyEventResult.ignored;
            },
            child: Builder(
              builder: (btnCtx) {
                final hasFocus = Focus.of(btnCtx).hasFocus;
                return InkWell(
                  onTap: hasReference
                      ? () {
                          setState(() {
                            controller.text = referenceValue.trim();
                          });
                        }
                      : null,
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

          // Right Column: Non-editable reference text (Borderless reference badge)
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
                hasReference ? referenceValue.trim() : '—',
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
              if (event is KeyDownEvent) {
                final key = event.logicalKey;
                if (key == LogicalKeyboardKey.select ||
                    key == LogicalKeyboardKey.enter ||
                    key == LogicalKeyboardKey.gameButtonA ||
                    key == LogicalKeyboardKey.space) {
                  _applyResult(item);
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.arrowUp) {
                  if (index == 0) {
                    _closeButtonFocusNode.requestFocus();
                  } else if (_resultFocusNodes != null && index > 0) {
                    _resultFocusNodes![index - 1].requestFocus();
                  }
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.arrowDown) {
                  if (_resultFocusNodes != null && index < _resultFocusNodes!.length - 1) {
                    _resultFocusNodes![index + 1].requestFocus();
                  }
                  return KeyEventResult.handled;
                }
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
