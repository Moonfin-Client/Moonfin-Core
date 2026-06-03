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
import '../../widgets/library_row.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';

class SearchScreen extends StatefulWidget {
  final String? initialQuery;
  final String? scopedLibraryId;

  const SearchScreen({super.key, this.initialQuery, this.scopedLibraryId});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  final _voiceFocus = FocusNode();
  final _searchFocus = FocusNode();
  final _searchInputFocus = FocusNode();
  final _searchTvFieldKey = GlobalKey<CustomTVTextFieldState>();
  final _resultsScrollController = ScrollController();
  final Map<String, FocusNode> _resultFocusNodes = <String, FocusNode>{};
  final Map<int, ScrollController> _resultRowControllers =
      <int, ScrollController>{};
  final Set<FocusNode> _pendingResultFocusRetries = <FocusNode>{};
  final _voiceController = VoiceSearchController();
  late final SearchViewModel _vm;
  late final SearchRepository _searchRepository;
  late final RecentSearchesStore _recentSearchesStore;
  late final UserPreferences _userPreferences;
  List<String> _recentSearches = const [];
  static const _tmdbPosterBase = 'https://image.tmdb.org/t/p/w342';
  bool _isFirstRowFocused = false;

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
    _syncResultFocusCache();
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

  String _resultNodeKey(int rowIndex, int itemIndex) =>
      '$rowIndex:$itemIndex';

  FocusNode _resultFocusNode(int rowIndex, int itemIndex) {
    final key = _resultNodeKey(rowIndex, itemIndex);
    return _resultFocusNodes.putIfAbsent(
      key,
      () => FocusNode(debugLabel: 'search_result_${rowIndex}_$itemIndex'),
    );
  }

  int get _resultRowCount =>
      _vm.results.length + (_vm.seerrResults.isNotEmpty ? 1 : 0);

  int _rowItemCount(int rowIndex) {
    if (rowIndex < 0) {
      return 0;
    }
    if (rowIndex < _vm.results.length) {
      return _vm.results[rowIndex].items.length;
    }
    if (rowIndex == _vm.results.length && _vm.seerrResults.isNotEmpty) {
      return _vm.seerrResults.length;
    }
    return 0;
  }

  int? _firstFocusableRowIndex() {
    for (var rowIndex = 0; rowIndex < _resultRowCount; rowIndex++) {
      if (_rowItemCount(rowIndex) > 0) {
        return rowIndex;
      }
    }
    return null;
  }

  int? _adjacentFocusableRow(int fromRowIndex, int direction) {
    var rowIndex = fromRowIndex + direction;
    while (rowIndex >= 0 && rowIndex < _resultRowCount) {
      if (_rowItemCount(rowIndex) > 0) {
        return rowIndex;
      }
      rowIndex += direction;
    }
    return null;
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

  void _focusSearchField() {
    if (_searchFocus.canRequestFocus) {
      _searchFocus.requestFocus();
    }
  }

  ScrollController _rowScrollController(int rowIndex) {
    return _resultRowControllers.putIfAbsent(rowIndex, ScrollController.new);
  }

  void _resetRowHorizontalOffset(int rowIndex) {
    final controller = _resultRowControllers[rowIndex];
    if (controller == null || !controller.hasClients) {
      return;
    }
    final minOffset = controller.position.minScrollExtent;
    if ((controller.offset - minOffset).abs() > 0.5) {
      controller.jumpTo(minOffset);
    }
  }

  bool _isLaidOutFocusNode(FocusNode node) {
    if (!node.canRequestFocus) {
      return false;
    }
    final context = node.context;
    if (context == null) {
      return false;
    }
    final renderObject = context.findRenderObject();
    return renderObject is RenderBox &&
        renderObject.attached &&
        renderObject.hasSize;
  }

  BuildContext? _rowContainerContext(int rowIndex) {
    final controller = _resultRowControllers[rowIndex];
    if (controller == null || !controller.hasClients) {
      return null;
    }
    return controller.position.context.storageContext;
  }

  Future<void> _ensureVisible(BuildContext context) {
    return Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      alignment: 0.2,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
    );
  }

  void _focusResultNode(FocusNode node) {
    node.requestFocus();
    final context = node.context;
    if (context != null) {
      unawaited(_ensureVisible(context));
    }
  }

  void _scheduleSingleResultFocusRetry(FocusNode target, int rowIndex) {
    if (!_pendingResultFocusRetries.add(target)) {
      return;
    }

    final rowContext = _rowContainerContext(rowIndex);
    if (rowContext != null) {
      unawaited(_ensureVisible(rowContext));
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pendingResultFocusRetries.remove(target);
      if (!mounted || !_isLaidOutFocusNode(target)) {
        return;
      }
      _focusResultNode(target);
    });
  }

  KeyEventResult _requestResultFocus(int rowIndex, int itemIndex) {
    final targetNode = _resultFocusNode(rowIndex, itemIndex);
    if (_isLaidOutFocusNode(targetNode)) {
      _focusResultNode(targetNode);
      return KeyEventResult.handled;
    }
    _scheduleSingleResultFocusRetry(targetNode, rowIndex);
    return KeyEventResult.ignored;
  }

  KeyEventResult _onResultCardKeyEvent({
    required int rowIndex,
    required int itemIndex,
    required int itemCount,
    required KeyEvent event,
  }) {
    if (!PlatformDetection.isTV || !event.isActionable) {
      return KeyEventResult.ignored;
    }

    final key = event.logicalKey;

    if (key.isLeftKey && itemIndex <= 0) {
      if (event is KeyDownEvent) {
        return _tryFocusSidebar()
            ? KeyEventResult.handled
            : KeyEventResult.ignored;
      }
      return KeyEventResult.ignored;
    }

    if (key.isRightKey && itemIndex >= itemCount - 1) {
      return KeyEventResult.handled;
    }

    if (key.isUpKey) {
      _resetRowHorizontalOffset(rowIndex);
      final targetRow = _adjacentFocusableRow(rowIndex, -1);
      if (targetRow == null) {
        _focusSearchField();
        return KeyEventResult.handled;
      }
      final targetItemCount = _rowItemCount(targetRow);
      if (targetItemCount <= 0) {
        return KeyEventResult.ignored;
      }
      final targetIndex = itemIndex.clamp(0, targetItemCount - 1);
      return _requestResultFocus(targetRow, targetIndex);
    }

    if (key.isDownKey) {
      _resetRowHorizontalOffset(rowIndex);
      final targetRow = _adjacentFocusableRow(rowIndex, 1);
      if (targetRow == null) {
        return KeyEventResult.handled;
      }
      final targetItemCount = _rowItemCount(targetRow);
      if (targetItemCount <= 0) {
        return KeyEventResult.ignored;
      }
      final targetIndex = itemIndex.clamp(0, targetItemCount - 1);
      return _requestResultFocus(targetRow, targetIndex);
    }

    return KeyEventResult.ignored;
  }

  void _syncResultFocusCache() {
    final validKeys = <String>{};
    final validRows = <int>{};

    for (var rowIndex = 0; rowIndex < _resultRowCount; rowIndex++) {
      final itemCount = _rowItemCount(rowIndex);
      if (itemCount <= 0) {
        continue;
      }
      validRows.add(rowIndex);
      for (var itemIndex = 0; itemIndex < itemCount; itemIndex++) {
        validKeys.add(_resultNodeKey(rowIndex, itemIndex));
      }
    }

    final staleNodeKeys = _resultFocusNodes.keys
        .where((key) => !validKeys.contains(key))
        .toList();
    for (final key in staleNodeKeys) {
      final node = _resultFocusNodes.remove(key);
      if (node != null) {
        _pendingResultFocusRetries.remove(node);
        node.dispose();
      }
    }

    final staleRows = _resultRowControllers.keys
        .where((rowIndex) => !validRows.contains(rowIndex))
        .toList();
    for (final rowIndex in staleRows) {
      _resultRowControllers.remove(rowIndex)?.dispose();
    }

    if (_firstFocusableRowIndex() == null) {
      _isFirstRowFocused = false;
    }
  }

  KeyEventResult _onContentKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    if (!event.logicalKey.isUpKey) return KeyEventResult.ignored;
    if (!_isFirstRowFocused) return KeyEventResult.ignored;

    if (PlatformDetection.isTV) {
      _searchFocus.requestFocus();
    } else {
      _searchInputFocus.requestFocus();
    }
    return KeyEventResult.handled;
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
    for (final node in _resultFocusNodes.values) {
      node.dispose();
    }
    _resultFocusNodes.clear();
    for (final controller in _resultRowControllers.values) {
      controller.dispose();
    }
    _resultRowControllers.clear();
    _pendingResultFocusRetries.clear();
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
      final firstRow = _firstFocusableRowIndex();
      if (firstRow == null) {
        return KeyEventResult.ignored;
      }
      return _requestResultFocus(firstRow, 0);
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
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
                    _buildVoiceActivation(),
                    const SizedBox(width: 14),
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
              Expanded(
                child: Focus(
                  canRequestFocus: false,
                  skipTraversal: true,
                  onKeyEvent: _onContentKeyEvent,
                  child: _buildBody(),
                ),
              ),
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

  Widget _buildResults() {
    final prefs = _userPreferences;
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final cardFocusExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final posterSize = prefs.get(UserPreferences.posterSize);
    final navbarIsLeft =
        prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    final rowLeftInset = (navbarIsLeft && !PlatformDetection.useMobileUi)
        ? 56.0
        : 0.0;
    final hasSeerr = _vm.seerrResults.isNotEmpty;
    final totalCount = _vm.results.length + (hasSeerr ? 1 : 0);
    return ListView.builder(
      controller: _resultsScrollController,
      padding: const EdgeInsets.only(bottom: 32),
      itemCount: totalCount,
      itemBuilder: (context, index) {
        if (index < _vm.results.length) {
          final group = _vm.results[index];
          final rowIndex = index;
          final rowItemCount = group.items.length;
          return Padding(
            padding: EdgeInsets.only(top: 8, left: rowLeftInset),
            child: LibraryRow(
              title: localizeSearchGroupTitle(
                group.title,
                AppLocalizations.of(context),
              ),
              rowHeight: _rowHeight(group, posterSize),
              scrollController: PlatformDetection.isTV
                  ? _rowScrollController(rowIndex)
                  : null,
              children: group.items.asMap().entries.map((entry) {
                final itemIndex = entry.key;
                final item = entry.value;
                final ar = MediaCard.aspectRatioForType(item.type);
                final height = _searchImageHeight(ar, posterSize);
                final width = height * ar;
                return MediaCard(
                  title: item.name,
                  subtitle: _subtitle(item),
                  imageUrl: _imageUrl(
                    item,
                    maxWidth: width.toInt(),
                    maxHeight: height.toInt(),
                  ),
                  width: width,
                  aspectRatio: ar,
                  isFavorite: item.isFavorite,
                  isPlayed: item.isPlayed,
                  unplayedCount: item.unplayedItemCount,
                  playedPercentage: item.playedPercentage,
                  itemType: item.type,
                  focusNode: PlatformDetection.isTV
                      ? _resultFocusNode(rowIndex, itemIndex)
                      : null,
                  onKeyEvent: PlatformDetection.isTV
                      ? (node, event) => _onResultCardKeyEvent(
                            rowIndex: rowIndex,
                            itemIndex: itemIndex,
                            itemCount: rowItemCount,
                            event: event,
                          )
                      : null,
                  focusColor: focusColor,
                  cardFocusExpansion: cardFocusExpansion,
                  onFocus: () {
                    if (PlatformDetection.isTV) {
                      final firstRow = _firstFocusableRowIndex();
                      _isFirstRowFocused =
                          firstRow != null && rowIndex == firstRow;
                      if (_isFirstRowFocused) {
                        _restoreNavbarToNormalPosition();
                      }
                    }
                  },
                  onFocusLost: () {
                    if (PlatformDetection.isTV) {
                      final firstRow = _firstFocusableRowIndex();
                      if (firstRow != null && rowIndex == firstRow) {
                        _isFirstRowFocused = false;
                      }
                    }
                  },
                  onTap: () => context.push(
                    Destinations.itemOrPhoto(
                      item.id,
                      serverId: item.serverId,
                      type: item.type,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.only(top: 8, left: rowLeftInset),
          child: _buildSeerrRow(
            rowIndex: index,
            focusColor: focusColor,
            cardFocusExpansion: cardFocusExpansion,
            posterSize: posterSize,
          ),
        );
      },
    );
  }

  Widget _buildSeerrRow({
    required int rowIndex,
    required Color focusColor,
    required bool cardFocusExpansion,
    required PosterSize posterSize,
  }) {
    final height = _searchImageHeight(2.0 / 3.0, posterSize);
    const ar = 2.0 / 3.0;
    final width = height * ar;
    final rowItemCount = _vm.seerrResults.length;
    return LibraryRow(
      title: AppLocalizations.of(context).seerr,
      rowHeight: height + 56,
      scrollController: PlatformDetection.isTV
          ? _rowScrollController(rowIndex)
          : null,
      children: _vm.seerrResults.asMap().entries.map((entry) {
        final itemIndex = entry.key;
        final item = entry.value;
        final year = (item.releaseDate ?? item.firstAirDate);
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
          aspectRatio: ar,
          focusColor: focusColor,
          cardFocusExpansion: cardFocusExpansion,
          itemType: item.mediaType == 'tv' ? 'Series' : 'Movie',
          focusNode: PlatformDetection.isTV
              ? _resultFocusNode(rowIndex, itemIndex)
              : null,
          onKeyEvent: PlatformDetection.isTV
              ? (node, event) => _onResultCardKeyEvent(
                    rowIndex: rowIndex,
                    itemIndex: itemIndex,
                    itemCount: rowItemCount,
                    event: event,
                  )
              : null,
          onFocus: () {
            if (PlatformDetection.isTV) {
              final firstRow = _firstFocusableRowIndex();
              _isFirstRowFocused = firstRow != null && rowIndex == firstRow;
              if (_isFirstRowFocused) {
                _restoreNavbarToNormalPosition();
              }
            }
          },
          onFocusLost: () {
            if (PlatformDetection.isTV) {
              final firstRow = _firstFocusableRowIndex();
              if (firstRow != null && rowIndex == firstRow) {
                _isFirstRowFocused = false;
              }
            }
          },
          onTap: () => context.push(
            Destinations.seerrMedia(item.id.toString()),
            extra: {'mediaType': item.mediaType ?? 'movie'},
          ),
        );
      }).toList(),
    );
  }

  double _searchImageHeight(double aspectRatio, PosterSize posterSize) {
    final tvScale = PlatformDetection.isTV ? 0.8 : 1.0;
    final baseHeight = aspectRatio >= 1
        ? posterSize.landscapeHeight.toDouble()
        : posterSize.portraitHeight.toDouble();
    return baseHeight * tvScale;
  }

  double _rowHeight(SearchResultGroup group, PosterSize posterSize) {
    final ar = MediaCard.aspectRatioForType(group.items.first.type);
    return _searchImageHeight(ar, posterSize) + 56;
  }
}
