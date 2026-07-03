import 'dart:async';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/repositories/search_repository.dart';
import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/recent_searches_store.dart';
import '../../../data/services/voice_search_controller.dart';
import '../../../data/viewmodels/search_view_model.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../navigation/destinations.dart';
import '../../../util/platform_detection.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../l10n/app_localizations.dart';
import '../../util/search_group_title_localizer.dart';
import '../../../util/focus/grid_focus_node_mixin.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../detail/modern/widgets/details_tab_bar.dart';

class SearchScreen extends StatefulWidget {
  final String? initialQuery;
  final String? scopedLibraryId;

  const SearchScreen({super.key, this.initialQuery, this.scopedLibraryId});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with GridFocusNodeMixin {
  final _searchController = TextEditingController();
  final _voiceFocus = FocusNode();
  final _searchFocus = FocusNode();
  final _searchInputFocus = FocusNode();
  final _searchTvFieldKey = GlobalKey<CustomTVTextFieldState>();
  final _resultsScrollController = ScrollController();
  final Map<int, FocusNode> _tabFocusNodes = <int, FocusNode>{};
  final _voiceController = VoiceSearchController();
  late final SearchViewModel _vm;
  late final SearchRepository _searchRepository;
  late final RecentSearchesStore _recentSearchesStore;
  late final UserPreferences _userPreferences;
  List<String> _recentSearches = const [];
  static const _tmdbPosterBase = 'https://image.tmdb.org/t/p/w342';
  int _selectedTab = 0;

  /// D-pad/keyboard focus navigation applies on TV and desktop; mobile is touch.
  bool get _usesDpad =>
      PlatformDetection.isTV || PlatformDetection.useDesktopUi;

  @override
  void initState() {
    super.initState();
    final getIt = GetIt.instance;
    _searchRepository = getIt<SearchRepository>();
    _recentSearchesStore = getIt<RecentSearchesStore>();
    _userPreferences = getIt<UserPreferences>();
    _recentSearches = _recentSearchesStore.recent;
    _vm = SearchViewModel(
      _searchRepository,
      getIt<MediaServerClient>(),
      scopedParentId: widget.scopedLibraryId,
    );
    _vm.addListener(_onViewModelChanged);
    _initSeerr();

    if (widget.initialQuery != null && widget.initialQuery!.isNotEmpty) {
      _searchController.text = widget.initialQuery!;
      _vm.searchImmediate(widget.initialQuery!);
    }

    _searchController.addListener(_onSearchTextChanged);
    _voiceFocus.addListener(_onFocusChanged);
    _searchFocus.addListener(_onFocusChanged);
    _searchInputFocus.addListener(_onFocusChanged);
    _voiceController.addListener(_onVoiceControllerChanged);

    if (PlatformDetection.isTV) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _searchFocus.requestFocus();
      });
    }
  }

  Future<void> _initSeerr() async {
    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      await repo.ensureInitialized();
      if (repo.isAvailable && mounted) {
        _vm.setSeerrRepository(repo);
        if (_vm.query.isNotEmpty) {
          _vm.searchImmediate(_vm.query);
        }
      }
    } catch (_) {}
  }

  void _onViewModelChanged() {
    if (_selectedTab >= _tabCount) _selectedTab = 0;
    cleanupGridFocusNodes(_currentTabItemCount());
    if (mounted) setState(() {});
  }

  void _onSearchTextChanged() {
    _vm.searchDebounced(_searchController.text);
    if (mounted) setState(() {});
  }

  Future<List<String>> _fetchKeyboardSuggestions(String query) {
    return _searchRepository.suggest(
      query,
      parentId: widget.scopedLibraryId,
      limit: 5,
    );
  }

  Future<void> _saveRecentSearch(String query) async {
    await _recentSearchesStore.add(query);
    if (!mounted) return;
    setState(() {
      _recentSearches = _recentSearchesStore.recent;
    });
  }

  void _onSearchSubmitted(String query) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    _searchController.text = trimmed;
    _searchController.selection = TextSelection.collapsed(
      offset: trimmed.length,
    );
    _vm.searchImmediate(trimmed);
    unawaited(_saveRecentSearch(trimmed));

    if (PlatformDetection.isTV) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (_searchFocus.canRequestFocus) {
          _searchFocus.requestFocus();
        }
      });
    }
  }

  void _onVoiceControllerChanged() {
    if (mounted) setState(() {});
  }

  void _onFocusChanged() {
    if (_searchFocus.hasFocus || _searchInputFocus.hasFocus) {
      _restoreNavbarToNormalPosition();
    }
    if (mounted) setState(() {});
  }

  void _restoreNavbarToNormalPosition() {
    if (!_resultsScrollController.hasClients ||
        _resultsScrollController.offset <= 0) {
      return;
    }
    _resultsScrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 140),
      curve: Curves.easeOut,
    );
  }

  int get _tabCount =>
      _vm.results.length + (_vm.seerrResults.isNotEmpty ? 1 : 0);

  bool _tabIsSeerr(int index) =>
      _vm.seerrResults.isNotEmpty && index == _tabCount - 1;

  void _selectTab(int index) {
    if (index == _selectedTab) return;
    setState(() => _selectedTab = index);
    cleanupGridFocusNodes(_currentTabItemCount());
    if (_resultsScrollController.hasClients) {
      _resultsScrollController.jumpTo(0);
    }
  }

  FocusNode _tabNode(int index) {
    return _tabFocusNodes.putIfAbsent(index, () {
      final node = FocusNode(debugLabel: 'search_tab_$index');
      node.addListener(() {
        if (!mounted || !node.hasFocus) return;
        _selectTab(index);
        _ensureVisibleNode(node);
      });
      return node;
    });
  }

  void _ensureVisibleNode(FocusNode node) {
    final nodeContext = node.context;
    if (nodeContext == null) return;
    unawaited(
      Scrollable.ensureVisible(
        nodeContext,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        alignment: 0.2,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      ),
    );
  }

  void _focusGridCell(int index) {
    final node = getGridItemFocusNode(index);
    if (node.context != null) {
      node.requestFocus();
      _ensureVisibleNode(node);
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final target = getGridItemFocusNode(index);
      if (target.canRequestFocus) {
        target.requestFocus();
        _ensureVisibleNode(target);
      }
    });
  }

  bool _isPlayKey(LogicalKeyboardKey key) =>
      key == LogicalKeyboardKey.play ||
      key == LogicalKeyboardKey.mediaPlay ||
      key == LogicalKeyboardKey.mediaPlayPause;

  KeyEventResult _onGridKey({
    required int index,
    required int columns,
    required int count,
    required KeyEvent event,
  }) {
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    final column = index % columns;

    if (key.isLeftKey) {
      if (column == 0) {
        if (event is KeyDownEvent) {
          return _tryFocusSidebar()
              ? KeyEventResult.handled
              : KeyEventResult.ignored;
        }
        return KeyEventResult.ignored;
      }
      _focusGridCell(index - 1);
      return KeyEventResult.handled;
    }
    if (key.isRightKey) {
      if (column == columns - 1 || index >= count - 1) {
        return KeyEventResult.handled;
      }
      _focusGridCell(index + 1);
      return KeyEventResult.handled;
    }
    if (key.isUpKey) {
      if (index < columns) {
        _tabNode(_selectedTab).requestFocus();
        return KeyEventResult.handled;
      }
      _focusGridCell(index - columns);
      return KeyEventResult.handled;
    }
    if (key.isDownKey) {
      final target = index + columns;
      if (target >= count) return KeyEventResult.handled;
      _focusGridCell(target);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  bool _tryFocusSidebar() {
    if (_userPreferences.get(UserPreferences.navbarPosition) !=
        NavbarPosition.left) {
      return false;
    }
    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    if (focusNavbar != null) {
      focusNavbar();
      return true;
    }
    return FocusScope.of(context).previousFocus();
  }

  bool _tryFocusNavbar() {
    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    if (focusNavbar != null) {
      focusNavbar();
      return true;
    }
    return FocusScope.of(context).previousFocus();
  }

  void _applyVoiceSearchResult(String result, {required bool isFinal}) {
    final query = result.trim();
    _searchController.text = query;
    _searchController.selection = TextSelection.collapsed(offset: query.length);

    if (query.isEmpty) {
      _vm.searchDebounced('');
    } else if (isFinal) {
      _vm.searchImmediate(query);
    } else {
      _vm.searchDebounced(query);
    }

    if (!isFinal) return;

    if (query.isNotEmpty) {
      unawaited(_saveRecentSearch(query));
    }

    if (mounted) {
      if (PlatformDetection.isTV) {
        _searchFocus.requestFocus();
      } else {
        _searchInputFocus.requestFocus();
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  String _voiceLocaleCode(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode.trim();
    final countryCode = locale.countryCode?.trim();

    if (languageCode.isEmpty) {
      return 'en_US';
    }
    if (countryCode == null || countryCode.isEmpty) {
      return languageCode;
    }
    return '${languageCode}_$countryCode';
  }

  @override
  void dispose() {
    _vm.removeListener(_onViewModelChanged);
    _searchController.removeListener(_onSearchTextChanged);
    _voiceFocus.removeListener(_onFocusChanged);
    _searchFocus.removeListener(_onFocusChanged);
    _searchInputFocus.removeListener(_onFocusChanged);
    _voiceController.removeListener(_onVoiceControllerChanged);
    _voiceController.dispose();
    _voiceFocus.dispose();
    _searchFocus.dispose();
    _searchInputFocus.dispose();
    _resultsScrollController.dispose();
    for (final node in _tabFocusNodes.values) {
      node.dispose();
    }
    _tabFocusNodes.clear();
    disposeGridFocusNodes();
    _vm.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _toggleVoiceSearch() async {
    final l10n = AppLocalizations.of(context);

    if (_voiceController.isListening) {
      await _voiceController.stopListening();
      return;
    }

    FocusManager.instance.primaryFocus?.unfocus();

    final startResult = await _voiceController.startListening(
      localeCode: _voiceLocaleCode(context),
      onText: (text, {required isFinal}) {
        _applyVoiceSearchResult(text, isFinal: isFinal);
      },
    );

    if (!mounted) return;

    switch (startResult) {
      case VoiceSearchStartResult.listeningStarted:
        return;
      case VoiceSearchStartResult.permissionDeniedPermanently:
        _showVoiceSearchError(
          _voiceErrorMessage(l10n),
          showSettingsAction: true,
        );
        return;
      case VoiceSearchStartResult.permissionDenied:
      case VoiceSearchStartResult.unavailable:
      case VoiceSearchStartResult.failed:
        _showVoiceSearchError(_voiceErrorMessage(l10n));
        return;
    }
  }

  String _voiceErrorMessage(AppLocalizations l10n) {
    final code = (_voiceController.lastErrorCode ?? '').toLowerCase();
    if (_voiceController.permissionPermanentlyDenied ||
        code.contains('permission_permanently_denied')) {
      return l10n.voiceSearchPermissionPermanentlyDenied;
    }
    if (_voiceController.permissionDenied ||
        code.contains('permission_denied')) {
      return l10n.voiceSearchPermissionRequired;
    }
    if (code.contains('error_no_match')) {
      return l10n.voiceSearchNoMatch;
    }
    if (code.contains('error_speech_timeout')) {
      return l10n.voiceSearchNoSpeechDetected;
    }
    if (code.contains('error_audio')) {
      return l10n.voiceSearchMicrophoneError;
    }
    if (code.contains('error_network')) {
      return l10n.voiceSearchNeedsInternet;
    }
    if (code.contains('error_busy') || code.contains('error_client')) {
      return l10n.voiceSearchServiceBusy;
    }
    final message = _voiceController.lastErrorMessage?.trim();
    if (message != null && message.isNotEmpty) {
      return message;
    }
    return l10n.voiceSearchUnavailable;
  }

  void _showVoiceSearchError(
    String message, {
    bool showSettingsAction = false,
  }) {
    if (!mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        action: showSettingsAction
            ? SnackBarAction(
                label: AppLocalizations.of(context).settings,
                onPressed: () {
                  openAppSettings();
                },
              )
            : null,
      ),
    );
  }

  KeyEventResult _onVoiceKey(FocusNode node, KeyEvent event) {
    if (!PlatformDetection.isTV) return KeyEventResult.ignored;
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey.isUpKey) {
      if (_userPreferences.get(UserPreferences.navbarPosition) ==
          NavbarPosition.top) {
        return _tryFocusNavbar()
            ? KeyEventResult.handled
            : KeyEventResult.ignored;
      }
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      return _tryFocusSidebar()
          ? KeyEventResult.handled
          : KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      _searchFocus.requestFocus();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.select) {
      _toggleVoiceSearch();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  KeyEventResult _onSearchKey(FocusNode node, KeyEvent event) {
    if (!PlatformDetection.isTV) return KeyEventResult.ignored;
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey.isUpKey) {
      if (_userPreferences.get(UserPreferences.navbarPosition) ==
          NavbarPosition.top) {
        return _tryFocusNavbar()
            ? KeyEventResult.handled
            : KeyEventResult.ignored;
      }
      return KeyEventResult.handled;
    }
    if (event.logicalKey.isDownKey) {
      if (_tabCount == 0) {
        return KeyEventResult.ignored;
      }
      _tabNode(_selectedTab).requestFocus();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      if (PlatformDetection.isAppleTV) {
        return _tryFocusSidebar()
            ? KeyEventResult.handled
            : KeyEventResult.ignored;
      }
      _voiceFocus.requestFocus();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.select) {
      if (!_searchFocus.hasFocus) _searchFocus.requestFocus();
      _searchTvFieldKey.currentState?.openKeyboard();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  String? _imageUrl(
    AggregatedItem item, {
    int? maxWidth,
    int? maxHeight,
  }) {
    final api = _vm.imageApi;
    final type = item.type;
    if (type == 'Episode' || type == 'Program' || type == 'Recording') {
      if (item.backdropImageTags.isNotEmpty) {
        return api.getBackdropImageUrl(
          item.id,
          maxWidth: maxWidth,
          tag: item.backdropImageTags.first,
        );
      }
      final parentId = item.parentBackdropItemId;
      final parentTags = item.parentBackdropImageTags;
      if (parentId != null && parentTags.isNotEmpty) {
        return api.getBackdropImageUrl(
          parentId,
          maxWidth: maxWidth,
          tag: parentTags.first,
        );
      }
    }
    if (item.primaryImageTag != null) {
      return api.getPrimaryImageUrl(
        item.id,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        tag: item.primaryImageTag,
      );
    }
    return null;
  }

  String? _subtitle(AggregatedItem item) {
    if (item.type == 'Audio') return item.albumArtist ?? item.album;
    return item.subtitle;
  }

  Widget _buildVoiceActivation() {
    final hasFocus = PlatformDetection.isTV && _voiceFocus.hasFocus;
    final isListening = _voiceController.isListening;
    final isInitializing = _voiceController.isInitializing;
    final backgroundColor = isListening
        ? const Color(0xFF8B1A1A)
        : (hasFocus
              ? AppColorScheme.buttonFocused
              : AppColorScheme.surfaceVariant);
    final iconColor = isListening
        ? AppColorScheme.onAccent
        : (hasFocus
              ? AppColorScheme.onButtonFocused
              : AppColorScheme.onSurface);

    Widget button = GestureDetector(
      onTap: isInitializing ? null : _toggleVoiceSearch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.fromBorderSide(
            hasFocus
                ? ThemeRegistry.active.borders.focusBorder
                : ThemeRegistry.active.borders.chipBorder,
          ),
          boxShadow: isListening
              ? [
                  BoxShadow(
                    color: AppColorScheme.accent.withValues(alpha: 0.27),
                    blurRadius: 18,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: isInitializing
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                  ),
                )
              : Icon(
                  isListening ? Icons.mic : Icons.mic_none,
                  color: iconColor,
                  size: 24,
                ),
        ),
      ),
    );

    if (!PlatformDetection.isTV) {
      return button;
    }

    return Focus(
      focusNode: _voiceFocus,
      onKeyEvent: _onVoiceKey,
      child: button,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final searchHasFocus = PlatformDetection.isTV
        ? _searchFocus.hasFocus
        : _searchInputFocus.hasFocus;
    final searchBackgroundColor = searchHasFocus
        ? AppColorScheme.buttonFocused
        : AppColorScheme.surfaceVariant;
    final searchTextColor = searchHasFocus
        ? AppColorScheme.onButtonFocused
        : AppColorScheme.onSurface;
    final searchHintColor = searchHasFocus
        ? AppColorScheme.onButtonFocused.withAlpha(153)
        : AppColorScheme.onSurface.withAlpha(128);
    final searchIconColor = searchHasFocus
        ? AppColorScheme.onButtonFocused
        : AppColorScheme.onSurface.withValues(alpha: 0.7);
    const searchBorderRadius = 28.0;

    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        showBackButton: true,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Row(
                  children: [
                    if (!PlatformDetection.isAppleTV) ...[
                      _buildVoiceActivation(),
                      const SizedBox(width: 14),
                    ],
                    Expanded(
                      child: PlatformDetection.isTV
                          ? Focus(
                              focusNode: _searchFocus,
                              onKeyEvent: _onSearchKey,
                              child: CustomTVTextField(
                                key: _searchTvFieldKey,
                                controller: _searchController,
                                isFocused: _searchFocus.hasFocus,
                                inputPurpose: InputPurpose.search,
                                suggestionsBuilder: _fetchKeyboardSuggestions,
                                recentSuggestions: _recentSearches,
                                preferSystemIme: _userPreferences.get(
                                  UserPreferences.preferSystemImeKeyboard,
                                ),
                                hint:
                                    widget.scopedLibraryId != null &&
                                        widget.scopedLibraryId!.isNotEmpty
                                    ? l10n.searchThisLibrary
                                    : l10n.searchEllipsis,
                                textStyle: TextStyle(
                                  color: searchTextColor,
                                  fontSize: 20,
                                ),
                                hintStyle: TextStyle(
                                  color: searchHintColor,
                                  fontSize: 20,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: searchIconColor,
                                  size: 30,
                                ),
                                filled: true,
                                fillColor: searchBackgroundColor,
                                borderRadius: searchBorderRadius,
                                borderColor: AppColorScheme.scrim.withValues(
                                  alpha: 0,
                                ),
                                focusedBorderColor: AppColorScheme.scrim
                                    .withValues(alpha: 0),
                                borderWidth: 0,
                                focusedBorderWidth: 0,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 12,
                                ),
                                onFieldSubmitted: _onSearchSubmitted,
                              ),
                            )
                          : TextField(
                              controller: _searchController,
                              focusNode: _searchInputFocus,
                              autofocus: true,
                              onSubmitted: _onSearchSubmitted,
                              style: TextStyle(
                                color: searchTextColor,
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                hintText:
                                    widget.scopedLibraryId != null &&
                                        widget.scopedLibraryId!.isNotEmpty
                                    ? l10n.searchThisLibrary
                                    : l10n.searchEllipsis,
                                hintStyle: TextStyle(color: searchHintColor),
                                filled: true,
                                fillColor: searchBackgroundColor,
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(searchBorderRadius),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(searchBorderRadius),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(searchBorderRadius),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: searchIconColor,
                                  size: 30,
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                  minWidth: 54,
                                  minHeight: 54,
                                ),
                                suffixIcon: _searchController.text.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(
                                          Icons.clear,
                                          color: searchIconColor,
                                        ),
                                        onPressed: _searchController.clear,
                                      )
                                    : null,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: ThemeRegistry.active.borders.chipBorder.color,
                height: 1,
              ),
              Expanded(child: _buildBody()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_vm.state) {
      case SearchState.idle:
        return const SizedBox.shrink();
      case SearchState.loading:
        if (_vm.results.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return _buildResults();
      case SearchState.ready
          when _vm.results.isEmpty && _vm.seerrResults.isEmpty:
        return Center(
          child: Text(
            AppLocalizations.of(context).noResultsForQuery(_vm.query),
            style: TextStyle(
              color: AppColorScheme.onSurface.withAlpha(179),
              fontSize: 16,
            ),
          ),
        );
      case SearchState.ready:
        return _buildResults();
      case SearchState.error:
        return Center(
          child: Text(
            AppLocalizations.of(context).searchFailedError(_vm.errorMessage),
            style: const TextStyle(color: Colors.redAccent),
          ),
        );
    }
  }

  int _currentTabItemCount() {
    if (_tabIsSeerr(_selectedTab)) return _vm.seerrResults.length;
    if (_selectedTab < _vm.results.length) {
      return _vm.results[_selectedTab].items.length;
    }
    return 0;
  }

  Widget _buildResults() {
    final tabCount = _tabCount;
    if (tabCount == 0) return const SizedBox.shrink();
    if (_selectedTab >= tabCount) _selectedTab = tabCount - 1;

    final l10n = AppLocalizations.of(context);
    final labels = <String>[
      for (final group in _vm.results)
        '${localizeSearchGroupTitle(group.title, l10n)}  ${group.items.length}',
      if (_vm.seerrResults.isNotEmpty)
        '${l10n.seerr}  ${_vm.seerrResults.length}',
    ];

    final isMobile = PlatformDetection.useMobileUi;
    final horizontalPadding = isMobile ? 20.0 : 48.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            12,
            horizontalPadding,
            4,
          ),
          child: isMobile
              ? _buildMobileTabs(labels)
              : DetailsTabBar(
                  labels: labels,
                  selectedIndex: _selectedTab,
                  onSelect: _selectTab,
                  focusNodeFor: _tabNode,
                  onExitLeft: _tryFocusSidebar,
                  onExitUp: () {
                    if (PlatformDetection.isTV) {
                      _searchFocus.requestFocus();
                    } else {
                      _searchInputFocus.requestFocus();
                    }
                  },
                  onNavigateDown: (_) {
                    if (_usesDpad) _focusGridCell(0);
                  },
                ),
        ),
        Expanded(child: _buildGrid(horizontalPadding)),
      ],
    );
  }

  /// Mobile shows every category at once (wrapped chips) so it is obvious which
  /// tabs exist, rather than hiding them behind a horizontal scroll.
  Widget _buildMobileTabs(List<String> labels) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var i = 0; i < labels.length; i++)
          _MobileTabChip(
            label: labels[i],
            active: i == _selectedTab,
            onTap: () => _selectTab(i),
          ),
      ],
    );
  }

  Widget _buildGrid(double horizontalPadding) {
    final prefs = _userPreferences;
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final cardFocusExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final isMobile = PlatformDetection.useMobileUi;
    final isSeerr = _tabIsSeerr(_selectedTab);
    final count = _currentTabItemCount();
    if (count == 0) return const SizedBox.shrink();

    final imageAspect = isSeerr
        ? 2 / 3
        : MediaCard.aspectRatioForType(
            _vm.results[_selectedTab].items.first.type,
          );

    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = isMobile ? 12.0 : 20.0;
        final targetWidth = isMobile
            ? 108.0
            : (PlatformDetection.isTV ? 168.0 : 150.0);
        final available = constraints.maxWidth - horizontalPadding * 2;
        final columns = ((available + spacing) / (targetWidth + spacing))
            .floor()
            .clamp(isMobile ? 3 : 2, 8);
        final cellWidth = (available - (columns - 1) * spacing) / columns;
        final imageHeight = cellWidth / imageAspect;
        final childAspectRatio = cellWidth / (imageHeight + 48);

        return GridView.builder(
          controller: _resultsScrollController,
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            12,
            horizontalPadding,
            32,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: count,
          itemBuilder: (context, index) => isSeerr
              ? _buildSeerrCell(
                  index,
                  columns,
                  count,
                  cellWidth,
                  focusColor,
                  cardFocusExpansion,
                )
              : _buildItemCell(
                  index,
                  columns,
                  count,
                  cellWidth,
                  focusColor,
                  cardFocusExpansion,
                ),
        );
      },
    );
  }

  Widget _buildItemCell(
    int index,
    int columns,
    int count,
    double cellWidth,
    Color focusColor,
    bool cardFocusExpansion,
  ) {
    final item = _vm.results[_selectedTab].items[index];
    final ar = MediaCard.aspectRatioForType(item.type);
    return MediaCard(
      title: item.name,
      subtitle: _subtitle(item),
      imageUrl: _imageUrl(
        item,
        maxWidth: cellWidth.toInt(),
        maxHeight: (cellWidth / ar).toInt(),
      ),
      width: cellWidth,
      aspectRatio: ar,
      isFavorite: item.isFavorite,
      isPlayed: item.isPlayed,
      unplayedCount: item.unplayedItemCount,
      playedPercentage: item.playedPercentage,
      itemType: item.type,
      focusColor: focusColor,
      cardFocusExpansion: cardFocusExpansion,
      focusNode: _usesDpad ? getGridItemFocusNode(index) : null,
      onKeyEvent: _usesDpad
          ? (node, event) {
              if (event.isActionable && _isPlayKey(event.logicalKey)) {
                if (event is KeyDownEvent) {
                  context.push(
                    Destinations.item(
                      item.id,
                      serverId: item.serverId,
                      autoPlay: true,
                    ),
                  );
                }
                return KeyEventResult.handled;
              }
              return _onGridKey(
                index: index,
                columns: columns,
                count: count,
                event: event,
              );
            }
          : null,
      onTap: () => context.push(
        Destinations.itemOrPhoto(
          item.id,
          serverId: item.serverId,
          type: item.type,
        ),
      ),
      onLongPress: () => showContextMenu(
        context,
        item,
        onChanged: () {
          if (mounted) setState(() {});
        },
      ),
    );
  }

  Widget _buildSeerrCell(
    int index,
    int columns,
    int count,
    double cellWidth,
    Color focusColor,
    bool cardFocusExpansion,
  ) {
    final item = _vm.seerrResults[index];
    final year = item.releaseDate ?? item.firstAirDate;
    final yearStr = (year != null && year.length >= 4)
        ? year.substring(0, 4)
        : null;
    return MediaCard(
      title: item.displayTitle,
      subtitle: yearStr,
      imageUrl: item.posterPath != null
          ? '$_tmdbPosterBase${item.posterPath}'
          : null,
      width: cellWidth,
      aspectRatio: 2 / 3,
      focusColor: focusColor,
      cardFocusExpansion: cardFocusExpansion,
      itemType: item.mediaType == 'tv' ? 'Series' : 'Movie',
      focusNode: _usesDpad ? getGridItemFocusNode(index) : null,
      onKeyEvent: _usesDpad
          ? (node, event) => _onGridKey(
                index: index,
                columns: columns,
                count: count,
                event: event,
              )
          : null,
      onTap: () => item.mediaType == 'person'
          ? context.push(Destinations.seerrPerson(item.id.toString()))
          : context.push(
              Destinations.seerrMedia(item.id.toString()),
              extra: {'mediaType': item.mediaType ?? 'movie'},
            ),
    );
  }
}

class _MobileTabChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _MobileTabChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: active
              ? AppColorScheme.accent
              : AppColorScheme.onSurface.withAlpha(20),
          borderRadius: AppRadius.circular(20),
          border: Border.fromBorderSide(
            active
                ? BorderSide.none
                : ThemeRegistry.active.borders.chipBorder,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active
                ? AppColorScheme.onAccent
                : AppColorScheme.onSurface.withAlpha(220),
            fontWeight: FontWeight.w600,
            fontSize: 13.5,
          ),
        ),
      ),
    );
  }
}
