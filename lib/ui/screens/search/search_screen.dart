import 'dart:async';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import '../../../preference/seerr_preferences.dart';
import '../../navigation/destinations.dart';
import '../../../util/platform_detection.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../l10n/app_localizations.dart';
import '../../util/search_group_title_localizer.dart';
import '../../../util/focus/grid_focus_node_mixin.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../widgets/library_row.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/sliding_pill_tabs.dart';

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
  // Per-card focus nodes for the All tab's row layout, keyed 'row:col'.
  final Map<String, FocusNode> _allRowNodes = <String, FocusNode>{};
  // Per-row keys so focusing a card can scroll its whole row (title included)
  // into view rather than just the card.
  final Map<int, GlobalKey> _allRowKeys = <int, GlobalKey>{};
  // The results tab pill is a single focus stop.
  final _tabsFocusNode = FocusNode(debugLabel: 'search_tabs');
  // Vertical focus model: search field, then the tabs pill. Rebuilt each build.
  final _coordinator = RowFocusCoordinator();
  final _voiceController = VoiceSearchController();
  late final SearchViewModel _vm;
  late final SearchRepository _searchRepository;
  late final RecentSearchesStore _recentSearchesStore;
  late final UserPreferences _userPreferences;
  List<String> _recentSearches = const [];
  static const _tmdbPosterBase = 'https://image.tmdb.org/t/p/w342';
  int _selectedTab = 0;

  // Tracks the current grid tab's content so async refreshes can restore focus
  // without stealing it from the search field.
  int _lastGridCount = -1;
  Object? _lastGridFirstId;

  /// D-pad/keyboard focus navigation applies on TV and desktop; mobile is touch.
  bool get _usesDpad =>
      PlatformDetection.isTV || PlatformDetection.useDesktopUi;

  /// The focus node that owns the search field on this platform.
  FocusNode get _fieldNode =>
      PlatformDetection.isTV ? _searchFocus : _searchInputFocus;

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

    // Desktop keyboard/d-pad: let arrow Down/Up leave the plain text field.
    if (PlatformDetection.useDesktopUi) {
      _searchInputFocus.onKeyEvent = _onSearchInputKey;
    }
    // Initial focus is granted by the RequestInitialFocus wrapper in build().
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
    _maybeBumpGridVersion();
    if (mounted) setState(() {});
  }

  // Detect when the current grid tab's content changed (async results arriving)
  // and restore focus into the grid, mirroring library_browse_screen. The guard
  // keeps a debounced refresh from yanking focus off the search field while the
  // user is still typing.
  void _maybeBumpGridVersion() {
    final count = _currentTabItemCount();
    final firstId = _currentGridFirstId();
    if (count == _lastGridCount && firstId == _lastGridFirstId) return;
    _lastGridCount = count;
    _lastGridFirstId = firstId;
    gridContentVersion++;
    cleanupGridFocusNodes(count);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final primary = FocusManager.instance.primaryFocus;
      final inGrid =
          primary != null &&
          gridItemFocusNodes.values.any((n) => identical(n, primary));
      if (primary == null || inGrid) {
        restoreGridFocusIfNeeded();
      }
    });
  }

  Object? _currentGridFirstId() {
    if (_tabIsAll(_selectedTab)) return null;
    if (_tabIsSeerr(_selectedTab)) {
      return _vm.seerrResults.isEmpty ? null : _vm.seerrResults.first.id;
    }
    final gi = _groupIndex(_selectedTab);
    if (gi >= 0 && gi < _vm.results.length) {
      final items = _vm.results[gi].items;
      return items.isEmpty ? null : items.first.id;
    }
    return null;
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

  // Tab 0 is the "All" tab (row layout); groups follow, then the Seerr tab.
  int get _tabCount {
    final content = _vm.results.length + (_vm.seerrResults.isNotEmpty ? 1 : 0);
    return content == 0 ? 0 : content + 1;
  }

  bool _tabIsAll(int index) => index == 0;

  bool _tabIsSeerr(int index) =>
      _vm.seerrResults.isNotEmpty && index == _tabCount - 1;

  // The _vm.results index for a group tab (tabs 1.._vm.results.length).
  int _groupIndex(int tab) => tab - 1;

  void _selectTab(int index) {
    if (index == _selectedTab) return;
    setState(() => _selectedTab = index);
    cleanupGridFocusNodes(_currentTabItemCount());
    _lastGridCount = -1;
    _lastGridFirstId = null;
    if (_resultsScrollController.hasClients) {
      _resultsScrollController.jumpTo(0);
    }
  }

  // Moves focus up/down between the search field and the tabs pill, falling
  // back to the navbar at the top edge. Mirrors book_browse_screen.
  bool _moveVertical(int fromIndex, bool isUp) {
    if (_coordinator.moveVertical(fromIndex: fromIndex, isUp: isUp)) {
      return true;
    }
    if (isUp) {
      final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
      if (focusNavbar != null) {
        focusNavbar();
        return true;
      }
    }
    return false;
  }

  void _focusFirstResult() {
    if (!_usesDpad) return;
    if (_tabIsAll(_selectedTab)) {
      _focusAllCard(0, 0);
    } else {
      _focusGridCell(0);
    }
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
        _tabsFocusNode.requestFocus();
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
    _tabsFocusNode.dispose();
    for (final node in _allRowNodes.values) {
      node.dispose();
    }
    _allRowNodes.clear();
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
      _tabsFocusNode.requestFocus();
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

  // Desktop key handling for the plain TextField, attached directly to
  // _searchInputFocus (the login-screen pattern) so it fires before the field
  // consumes the key. Only Up/Down leave the field; Left/Right stay caret moves.
  KeyEventResult _onSearchInputKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey.isDownKey) {
      if (_tabCount == 0) return KeyEventResult.ignored;
      _tabsFocusNode.requestFocus();
      return KeyEventResult.handled;
    }
    if (event.logicalKey.isUpKey) {
      if (_userPreferences.get(UserPreferences.navbarPosition) ==
          NavbarPosition.top) {
        return _tryFocusNavbar()
            ? KeyEventResult.handled
            : KeyEventResult.ignored;
      }
      return KeyEventResult.ignored;
    }
    return KeyEventResult.ignored;
  }

  String? _imageUrl(AggregatedItem item, {int? maxWidth, int? maxHeight}) {
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
    final hasFocus = _usesDpad && _voiceFocus.hasFocus;
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

    if (!_usesDpad) {
      return button;
    }

    // On TV, _onVoiceKey drives directional focus; on desktop the button just
    // joins the Tab traversal order (the handler no-ops off-TV).
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

    // Vertical focus order: search field, then the tabs pill when results exist.
    // Results themselves are a 2D grid handled by their own key handlers.
    _coordinator.entries = [
      RowFocusEntry.node(_fieldNode),
      if (_tabCount > 0) RowFocusEntry.node(_tabsFocusNode),
    ];

    final topbar =
        _userPreferences.get(UserPreferences.navbarPosition) ==
        NavbarPosition.top;

    final scaffold = Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        showBackButton: true,
        pinTopToolbar: true,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              if (topbar || !PlatformDetection.isTV)
                const SizedBox(height: 50),
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
                                popParentOnKeyboardClose: false,
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
              Expanded(child: _buildBody()),
            ],
          ),
        ),
      ),
    );

    return RequestInitialFocus(targetNode: _fieldNode, child: scaffold);
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
    if (_tabIsAll(_selectedTab)) return 0;
    if (_tabIsSeerr(_selectedTab)) return _vm.seerrResults.length;
    final gi = _groupIndex(_selectedTab);
    if (gi >= 0 && gi < _vm.results.length) {
      return _vm.results[gi].items.length;
    }
    return 0;
  }

  Widget _buildResults() {
    final tabCount = _tabCount;
    if (tabCount == 0) return const SizedBox.shrink();
    if (_selectedTab >= tabCount) _selectedTab = tabCount - 1;

    final l10n = AppLocalizations.of(context);
    final seerrLabel = GetIt.instance<SeerrPreferences>().labelOrDefault(
      l10n.seerr,
    );
    final totalCount =
        _vm.results.fold<int>(0, (s, g) => s + g.items.length) +
        _vm.seerrResults.length;
    final labels = <String>[
      '${l10n.all}: $totalCount',
      for (final group in _vm.results)
        '${localizeSearchGroupTitle(group.title, l10n)}: ${group.items.length}',
      if (_vm.seerrResults.isNotEmpty)
        '$seerrLabel: ${_vm.seerrResults.length}',
    ];

    final isMobile = PlatformDetection.useMobileUi;
    final horizontalPadding = isMobile ? 20.0 : 48.0;
    // Index of the tabs pill in the coordinator's entries (field is 0).
    const tabsIndex = 1;

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
          child: SlidingPillTabs(
            labels: labels,
            selectedIndex: _selectedTab,
            onChanged: _selectTab,
            focusNode: _tabsFocusNode,
            onExitLeft: _tryFocusSidebar,
            onVerticalNavigation: (isUp) {
              if (_moveVertical(tabsIndex, isUp)) return true;
              if (!isUp) {
                _focusFirstResult();
                return true;
              }
              return false;
            },
          ),
        ),
        Expanded(
          child: _tabIsAll(_selectedTab)
              ? _buildAllRows(horizontalPadding)
              : _buildGrid(horizontalPadding),
        ),
      ],
    );
  }

  FocusNode _allCardNode(int row, int col) => _allRowNodes.putIfAbsent(
    '$row:$col',
    () => FocusNode(debugLabel: 'search_all_$row:$col'),
  );

  GlobalKey _allRowKey(int row) =>
      _allRowKeys.putIfAbsent(row, () => GlobalKey());

  void _focusAllCard(int row, int col, {bool changedRow = true}) {
    final node = _allCardNode(row, col);
    if (node.context != null) {
      node.requestFocus();
      _ensureAllCardVisible(row, node, changedRow: changedRow);
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final target = _allCardNode(row, col);
      if (target.canRequestFocus) {
        target.requestFocus();
        _ensureAllCardVisible(row, target, changedRow: changedRow);
      }
    });
  }

  // Bring the focused card into view horizontally within its row. Only nudge the
  // outer list vertically when the row actually changed. Scrolling vertically on
  // every left/right press is what makes the page bounce up and down.
  void _ensureAllCardVisible(
    int row,
    FocusNode node, {
    required bool changedRow,
  }) {
    final cardContext = node.context;
    if (cardContext != null) {
      _revealInNearestScrollable(cardContext, alignment: 0.5);
    }
    if (!changedRow) return;
    final rowContext = _allRowKey(row).currentContext;
    if (rowContext != null) {
      unawaited(
        Scrollable.ensureVisible(
          rowContext,
          alignment: 0.05,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        ),
      );
    }
  }

  // Reveal a widget inside its nearest scrollable only, leaving any enclosing
  // scrollable on the other axis alone. Scrollable.ensureVisible walks up every
  // ancestor viewport, so on the horizontal row it would also tug the vertical
  // list.
  void _revealInNearestScrollable(
    BuildContext context, {
    required double alignment,
  }) {
    final scrollable = Scrollable.maybeOf(context);
    final renderObject = context.findRenderObject();
    if (scrollable == null || renderObject == null) return;
    final position = scrollable.position;
    final target = RenderAbstractViewport.of(renderObject)
        .getOffsetToReveal(renderObject, alignment)
        .offset
        .clamp(position.minScrollExtent, position.maxScrollExtent);
    unawaited(
      position.animateTo(
        target,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      ),
    );
  }

  KeyEventResult _onAllCardKey(
    int row,
    int col,
    List<int> rowLens,
    KeyEvent event,
  ) {
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    if (key.isLeftKey) {
      if (col == 0) {
        if (event is KeyDownEvent) {
          return _tryFocusSidebar()
              ? KeyEventResult.handled
              : KeyEventResult.ignored;
        }
        return KeyEventResult.ignored;
      }
      _focusAllCard(row, col - 1, changedRow: false);
      return KeyEventResult.handled;
    }
    if (key.isRightKey) {
      if (col < rowLens[row] - 1) {
        _focusAllCard(row, col + 1, changedRow: false);
      }
      return KeyEventResult.handled;
    }
    if (key.isUpKey) {
      if (row == 0) {
        _tabsFocusNode.requestFocus();
      } else {
        _focusAllCard(row - 1, col.clamp(0, rowLens[row - 1] - 1));
      }
      return KeyEventResult.handled;
    }
    if (key.isDownKey) {
      if (row < rowLens.length - 1) {
        _focusAllCard(row + 1, col.clamp(0, rowLens[row + 1] - 1));
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  Widget _buildAllRows(double horizontalPadding) {
    final prefs = _userPreferences;
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final cardFocusExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final l10n = AppLocalizations.of(context);

    final groups = _vm.results;

    final hasSeerr = _vm.seerrResults.isNotEmpty;
    final rowLens = <int>[
      for (final g in groups) g.items.length,
      if (hasSeerr) _vm.seerrResults.length,
    ];

    final rows = <Widget>[];
    for (var r = 0; r < groups.length; r++) {
      final group = groups[r];
      final ar = MediaCard.aspectRatioForType(group.items.first.type);
      final cardWidth = (ar == 2/3) ? 108.0 : 150.0;
      rows.add(
        LibraryRow(
          key: _allRowKey(r),
          title: localizeSearchGroupTitle(group.title, l10n),
          rowHeight: cardWidth / ar + 56,
          children: [
            for (var c = 0; c < group.items.length; c++)
              _buildAllItemCard(
                r,
                c,
                cardWidth,
                ar,
                rowLens,
                focusColor,
                cardFocusExpansion,
              ),
          ],
        ),
      );
    }
    if (hasSeerr) {
      final cardWidth = 108.0;
      final seerrLabel = GetIt.instance<SeerrPreferences>().labelOrDefault(
        l10n.seerr,
      );
      rows.add(
        LibraryRow(
          key: _allRowKey(groups.length),
          title: seerrLabel,
          rowHeight: cardWidth / (2 / 3) + 56,
          children: [
            for (var c = 0; c < _vm.seerrResults.length; c++)
              _buildAllSeerrCard(
                groups.length,
                c,
                cardWidth,
                rowLens,
                focusColor,
                cardFocusExpansion,
              ),
          ],
        ),
      );
    }

    return ListView(
      controller: _resultsScrollController,
      padding: EdgeInsets.fromLTRB(horizontalPadding, 8, 0, 32),
      children: rows,
    );
  }

  Widget _buildAllItemCard(
    int row,
    int col,
    double cardWidth,
    double ar,
    List<int> rowLens,
    Color focusColor,
    bool cardFocusExpansion,
  ) {
    return _resultItemCard(
      item: _vm.results[row].items[col],
      width: cardWidth,
      ar: ar,
      focusColor: focusColor,
      cardFocusExpansion: cardFocusExpansion,
      focusNode: _usesDpad ? _allCardNode(row, col) : null,
      onNavKey: _usesDpad
          ? (node, event) => _onAllCardKey(row, col, rowLens, event)
          : null,
    );
  }

  Widget _buildAllSeerrCard(
    int row,
    int col,
    double cardWidth,
    List<int> rowLens,
    Color focusColor,
    bool cardFocusExpansion,
  ) {
    return _seerrResultCard(
      index: col,
      width: cardWidth,
      focusColor: focusColor,
      cardFocusExpansion: cardFocusExpansion,
      focusNode: _usesDpad ? _allCardNode(row, col) : null,
      onNavKey: _usesDpad
          ? (node, event) => _onAllCardKey(row, col, rowLens, event)
          : null,
    );
  }

  // Shared card body for a library result, used by both the grid and the
  // All-tab rows; only the width, focus node, and directional handler differ.
  Widget _resultItemCard({
    required AggregatedItem item,
    required double width,
    required double ar,
    required Color focusColor,
    required bool cardFocusExpansion,
    required FocusNode? focusNode,
    required KeyEventResult Function(FocusNode, KeyEvent)? onNavKey,
  }) {
    return MediaCard(
      title: item.name,
      subtitle: _subtitle(item),
      imageUrl: _imageUrl(
        item,
        maxWidth: width.toInt(),
        maxHeight: (width / ar).toInt(),
      ),
      width: width,
      aspectRatio: ar,
      isFavorite: item.isFavorite,
      isPlayed: item.isPlayed,
      unplayedCount: item.unplayedItemCount,
      playedPercentage: item.playedPercentage,
      itemType: item.type,
      focusColor: focusColor,
      cardFocusExpansion: cardFocusExpansion,
      focusNode: focusNode,
      onKeyEvent: onNavKey == null
          ? null
          : (node, event) {
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
              return onNavKey(node, event);
            },
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

  // Shared Seerr card body, used by both the grid and the All-tab rows.
  Widget _seerrResultCard({
    required int index,
    required double width,
    required Color focusColor,
    required bool cardFocusExpansion,
    required FocusNode? focusNode,
    required KeyEventResult Function(FocusNode, KeyEvent)? onNavKey,
  }) {
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
      width: width,
      aspectRatio: 2 / 3,
      itemType: item.mediaType == 'tv' ? 'Series' : 'Movie',
      focusColor: focusColor,
      cardFocusExpansion: cardFocusExpansion,
      focusNode: focusNode,
      onKeyEvent: onNavKey,
      onTap: () => switch (item.mediaType) {
        'person' => context.push(Destinations.seerrPerson(item.id.toString())),
        'collection' =>
          context.push(Destinations.seerrCollection(item.id.toString())),
        _ => context.push(
          Destinations.seerrMedia(item.id.toString()),
          extra: {'mediaType': item.mediaType ?? 'movie'},
        ),
      },
    );
  }

  Widget _buildGrid(double horizontalPadding) {
    final prefs = _userPreferences;
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final cardFocusExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final isSeerr = _tabIsSeerr(_selectedTab);
    final count = _currentTabItemCount();
    if (count == 0) return const SizedBox.shrink();

    final imageAspect = isSeerr
        ? 2 / 3
        : MediaCard.aspectRatioForType(
            _vm.results[_groupIndex(_selectedTab)].items.first.type,
          );

    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 12.0;
        final targetWidth = (imageAspect == 2/3) ? 108.0 : 150.0;
        final available = constraints.maxWidth - horizontalPadding * 2;
        final columns = ((available + spacing) / (targetWidth + spacing))
            .floor()
            .clamp(3, 20);
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
    final item = _vm.results[_groupIndex(_selectedTab)].items[index];
    final ar = MediaCard.aspectRatioForType(item.type);
    return _resultItemCard(
      item: item,
      width: cellWidth,
      ar: ar,
      focusColor: focusColor,
      cardFocusExpansion: cardFocusExpansion,
      focusNode: _usesDpad ? getGridItemFocusNode(index) : null,
      onNavKey: _usesDpad
          ? (node, event) => _onGridKey(
              index: index,
              columns: columns,
              count: count,
              event: event,
            )
          : null,
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
    return _seerrResultCard(
      index: index,
      width: cellWidth,
      focusColor: focusColor,
      cardFocusExpansion: cardFocusExpansion,
      focusNode: _usesDpad ? getGridItemFocusNode(index) : null,
      onNavKey: _usesDpad
          ? (node, event) => _onGridKey(
              index: index,
              columns: columns,
              count: count,
              event: event,
            )
          : null,
    );
  }
}
