import 'dart:async';
import 'dart:ui';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ScrollCacheExtent;
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/viewmodels/game_system_browse_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/game_library.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/grid_focus_node_mixin.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/focus/focusable_toolbar_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/game/game_alpha_picker_bar.dart';
import '../../widgets/game/game_poster_card.dart';

/// Browses one retro-game platform using the same vertical grid and alphabet
/// filtering interaction as Moonfin's regular media libraries.
class GameSystemScreen extends StatefulWidget {
  const GameSystemScreen({
    super.key,
    required this.libraryId,
    required this.systemId,
    this.systemName,
  });

  final String libraryId;
  final String systemId;
  final String? systemName;

  @override
  State<GameSystemScreen> createState() => _GameSystemScreenState();
}

class _GameSystemScreenState extends State<GameSystemScreen>
    with GridFocusNodeMixin<GameSystemScreen> {
  final UserPreferences _prefs = GetIt.instance<UserPreferences>();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  final GlobalKey<CustomTVTextFieldState> _searchTvFieldKey = GlobalKey();
  final FocusNode _allLetterFocus = FocusNode(
    debugLabel: 'game_alpha_all_letter',
  );
  final ScrollController _gridScrollController = ScrollController();
  late final GameSystemBrowseViewModel _browse;
  List<GameSummary>? _observedVisibleGames;
  Timer? _hoverScrollSettle;
  GameSummary? _hoveredGame;
  bool _suppressHoverEnrichment = false;
  Timer? _backdropPreloadTimer;
  int _backdropPreloadGeneration = 0;
  String? _backdropPreloadTargetId;

  @override
  void initState() {
    super.initState();
    _browse = GameSystemBrowseViewModel(
      gamesApi: GetIt.instance<MediaServerClient>().gamesApi,
      libraryId: widget.libraryId,
      systemId: widget.systemId,
      systemName: widget.systemName,
    )..addListener(_onBrowseChanged);
    _searchController.addListener(_onSearchChanged);
    _searchFocus.addListener(_onSearchFocusChanged);
    _browse.load();
  }

  @override
  void dispose() {
    _browse.removeListener(_onBrowseChanged);
    _browse.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchFocus.removeListener(_onSearchFocusChanged);
    _searchController.dispose();
    _searchFocus.dispose();
    _allLetterFocus.dispose();
    _gridScrollController.dispose();
    _hoverScrollSettle?.cancel();
    _cancelBackdropPreload();
    disposeGridFocusNodes();
    super.dispose();
  }

  void _onSearchChanged() {
    _browse.updateSearch(_searchController.text);
  }

  void _onBrowseChanged() {
    if (!mounted) return;
    if (_browse.activeGame?.id != _backdropPreloadTargetId) {
      _cancelBackdropPreload();
    }
    final visibleGames = _browse.visibleGames;
    if (!identical(_observedVisibleGames, visibleGames)) {
      _observedVisibleGames = visibleGames;
      gridContentVersion++;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) cleanupGridFocusNodes(visibleGames.length);
      });
    }
    setState(() {});
  }

  void _onSearchFocusChanged() {
    if (mounted) setState(() {});
  }

  KeyEventResult _onTvSearchKey(FocusNode node, KeyEvent event) {
    if (!event.logicalKey.isSelectKey) return KeyEventResult.ignored;
    if (event is KeyDownEvent) {
      if (!_searchFocus.hasFocus) _searchFocus.requestFocus();
      _searchTvFieldKey.currentState?.openKeyboard();
    }
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    final compact =
        PlatformDetection.useMobileUi || MediaQuery.sizeOf(context).width < 600;
    final screenSize = MediaQuery.sizeOf(context);
    final textScale = MediaQuery.textScalerOf(context).scale(1);
    final hideBackdrops = _prefs.get(UserPreferences.hideBackdropsInLibraries);
    final showBackdrop = !compact && !hideBackdrops;
    final showDetails =
        !compact &&
        screenSize.height >= 480 * textScale.clamp(1, 2) &&
        _prefs.get(UserPreferences.showMediaDetailsOnLibraryPage);
    final backdropGame = showBackdrop ? _browse.backdropGame : null;
    final hasBackdrop = backdropGame != null;
    final scaffold = Scaffold(
      backgroundColor: AppColorScheme.background,
      body: Stack(
        children: [
          if (backdropGame != null)
            Positioned.fill(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _GameBrowseBackdrop(
                  key: ValueKey(backdropGame.id),
                  libraryId: widget.libraryId,
                  game: backdropGame,
                  blur: _prefs
                      .get(UserPreferences.browsingBackgroundBlurAmount)
                      .toDouble(),
                ),
              ),
            ),
          Positioned.fill(
            child: ColoredBox(
              color: AppColorScheme.background.withValues(
                alpha: hasBackdrop ? 0.54 : 0.86,
              ),
            ),
          ),
          _buildBody(
            compact,
            showDetails: showDetails,
            showBackdrop: showBackdrop,
          ),
        ],
      ),
    );
    if (PlatformDetection.useMobileUi) return scaffold;
    final targetNode = PlatformDetection.isTV && _browse.visibleGames.isNotEmpty
        ? getGridItemFocusNode(0, prefix: 'game_grid')
        : _allLetterFocus;
    return RequestInitialFocus(targetNode: targetNode, child: scaffold);
  }

  Widget _buildBody(
    bool compact, {
    required bool showDetails,
    required bool showBackdrop,
  }) {
    if (_browse.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_browse.error != null) {
      final l10n = AppLocalizations.of(context);
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.failedToLoadLibrary, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(onPressed: _browse.load, child: Text(l10n.retry)),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        _buildHeader(compact, showDetails: showDetails),
        Expanded(
          child: _browse.visibleGames.isEmpty
              ? Center(child: Text(AppLocalizations.of(context).noItemsFound))
              : _buildGrid(
                  _browse.visibleGames,
                  showDetails: showDetails,
                  showBackdrop: showBackdrop,
                ),
        ),
      ],
    );
  }

  Widget _buildHeader(bool compact, {required bool showDetails}) {
    final systemName = _browse.displaySystemName;
    final desktopScale = _prefs.get(UserPreferences.desktopUiScale).scaleFactor;
    final horizontalPadding = compact ? 16.0 : 60.0 * desktopScale;
    final topPadding = compact ? MediaQuery.paddingOf(context).top + 8 : 8.0;
    final availableWidth =
        MediaQuery.sizeOf(context).width - horizontalPadding * 2;
    final inlineSearch = !compact && availableWidth >= 700 * desktopScale;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (inlineSearch)
            _buildInlineTitleAndSearch(systemName, desktopScale)
          else ...[
            Center(child: _buildSystemTitle(systemName, desktopScale)),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: _buildSearchField(),
              ),
            ),
          ],
          if (showDetails) ...[
            const SizedBox(height: 2),
            _FocusedGameHud(
              desktopScale: desktopScale,
              game: _browse.hudGame,
              detail: _browse.hudGame == null
                  ? null
                  : _browse.gameDetails[_browse.hudGame!.id],
              displayTitle: _browse.hudGame == null
                  ? null
                  : _browse.displayTitles[_browse.hudGame!.id],
            ),
          ],
          SizedBox(height: showDetails ? 2 : 8),
          Row(
            children: [
              FocusableToolbarButton(
                icon: Icons.arrow_back,
                tooltip: AppLocalizations.of(context).back,
                size: 30 * desktopScale,
                iconSize: 20 * desktopScale,
                unfocusedIconAlpha: 128,
                onTap: () => context.popOrHome(),
              ),
              SizedBox(width: 10 * desktopScale),
              Expanded(
                child: GameAlphaPickerBar(
                  selected: _browse.selectedLetter,
                  allFocusNode: _allLetterFocus,
                  onChanged: _browse.selectLetter,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInlineTitleAndSearch(String systemName, double desktopScale) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final desiredSearchWidth = 400 * desktopScale;
        final maxSearchWidth = (constraints.maxWidth - 220 * desktopScale) / 2;
        final searchWidth = desiredSearchWidth < maxSearchWidth
            ? desiredSearchWidth
            : maxSearchWidth;
        return Row(
          children: [
            SizedBox(width: searchWidth),
            Expanded(
              child: Center(child: _buildSystemTitle(systemName, desktopScale)),
            ),
            SizedBox(width: searchWidth, child: _buildSearchField()),
          ],
        );
      },
    );
  }

  Widget _buildSystemTitle(String systemName, double desktopScale) {
    return Text(
      systemName,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColorScheme.onSurface,
        fontSize: 26 * desktopScale,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _buildSearchField() {
    final l10n = AppLocalizations.of(context);
    final hasFocus = _searchFocus.hasFocus;
    final fillColor = hasFocus
        ? AppColorScheme.buttonFocused
        : AppColorScheme.surface.withValues(alpha: 0.72);
    final foreground = hasFocus
        ? AppColorScheme.onButtonFocused
        : AppColorScheme.onSurface;

    if (PlatformDetection.isTV) {
      return Focus(
        focusNode: _searchFocus,
        onKeyEvent: _onTvSearchKey,
        child: CustomTVTextField(
          key: _searchTvFieldKey,
          controller: _searchController,
          isFocused: hasFocus,
          inputPurpose: InputPurpose.search,
          preferSystemIme: _prefs.get(UserPreferences.preferSystemImeKeyboard),
          popParentOnKeyboardClose: false,
          hint: l10n.searchThisLibrary,
          prefixIcon: Icon(Icons.search, color: foreground),
          textStyle: TextStyle(color: foreground, fontSize: 17),
          hintStyle: TextStyle(
            color: foreground.withValues(alpha: 0.62),
            fontSize: 17,
          ),
          filled: true,
          fillColor: fillColor,
          borderRadius: 24,
          borderColor: Colors.transparent,
          focusedBorderColor: Colors.transparent,
          borderWidth: 0,
          focusedBorderWidth: 0,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 11,
          ),
        ),
      );
    }

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _searchController,
      builder: (context, value, _) => TextField(
        controller: _searchController,
        focusNode: _searchFocus,
        style: TextStyle(color: foreground, fontSize: 17),
        decoration: InputDecoration(
          hintText: l10n.searchThisLibrary,
          hintStyle: TextStyle(color: foreground.withValues(alpha: 0.62)),
          prefixIcon: Icon(Icons.search, color: foreground),
          suffixIcon: value.text.isEmpty
              ? null
              : IconButton(
                  tooltip: l10n.clear,
                  onPressed: _searchController.clear,
                  icon: Icon(Icons.close, color: foreground),
                ),
          filled: true,
          fillColor: fillColor,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  void _scrollToGridRow({
    required int index,
    required int crossAxisCount,
    required double cellHeight,
    required double mainAxisSpacing,
  }) {
    if (!_gridScrollController.hasClients) return;
    final row = index ~/ crossAxisCount;
    final rowTop = 8 + row * (cellHeight + mainAxisSpacing);
    final rowBottom = rowTop + cellHeight;
    final position = _gridScrollController.position;
    final current = position.pixels;
    final viewportHeight = position.viewportDimension;
    var target = current;
    if (rowTop - 8 < current) {
      target = rowTop - 8;
    } else if (rowBottom + 52 > current + viewportHeight) {
      target = rowBottom + 52 - viewportHeight;
    }
    target = target.clamp(position.minScrollExtent, position.maxScrollExtent);
    if ((target - current).abs() < 1) return;
    unawaited(
      _gridScrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutCubic,
      ),
    );
  }

  void _activateHoveredGame(
    GameSummary game, {
    required bool showBackdrop,
    required bool showDetails,
  }) {
    _hoveredGame = game;
    if (_suppressHoverEnrichment) return;
    _activateBrowseGame(
      game,
      showBackdrop: showBackdrop,
      showDetails: showDetails,
    );
  }

  void _activateBrowseGame(
    GameSummary game, {
    required bool showBackdrop,
    required bool showDetails,
  }) {
    _browse.activateGame(
      game,
      showBackdrop: showBackdrop,
      loadDetails: showDetails,
    );
    _scheduleBackdropPreload(game, enabled: showBackdrop);
  }

  void _deactivateHoveredGame(GameSummary game) {
    if (_hoveredGame?.id == game.id) _hoveredGame = null;
    _browse.deactivateGame(game);
  }

  void _onGridPointerSignal(
    PointerSignalEvent event, {
    required bool showBackdrop,
    required bool showDetails,
  }) {
    if (event is! PointerScrollEvent) return;

    // A stationary pointer crosses many cards while the wheel moves the grid.
    // Do not let those transient hover targets compete with poster requests by
    // fetching their backdrop and details. Once wheel input stops, reactivate
    // the card still under the pointer; the view model then applies its normal
    // 250 ms library-style selection debounce.
    _suppressHoverEnrichment = true;
    _hoverScrollSettle?.cancel();
    final hovered = _hoveredGame;
    if (hovered != null) _browse.deactivateGame(hovered);

    _hoverScrollSettle = Timer(const Duration(milliseconds: 100), () {
      if (!mounted) return;
      _suppressHoverEnrichment = false;
      final settledGame = _hoveredGame;
      if (settledGame == null) return;
      _activateBrowseGame(
        settledGame,
        showBackdrop: showBackdrop,
        showDetails: showDetails,
      );
    });
  }

  void _scheduleBackdropPreload(GameSummary game, {required bool enabled}) {
    if (!enabled) {
      _cancelBackdropPreload();
      return;
    }
    if (_backdropPreloadTargetId == game.id) return;

    _cancelBackdropPreload();
    _backdropPreloadTargetId = game.id;
    final generation = _backdropPreloadGeneration;
    _backdropPreloadTimer = Timer(const Duration(milliseconds: 200), () {
      unawaited(_preloadBackdrop(game, generation));
    });
  }

  void _cancelBackdropPreload() {
    _backdropPreloadTimer?.cancel();
    _backdropPreloadTimer = null;
    _backdropPreloadTargetId = null;
    _backdropPreloadGeneration++;
  }

  Future<void> _preloadBackdrop(GameSummary game, int generation) async {
    if (!mounted || generation != _backdropPreloadGeneration) return;
    final blur = _prefs
        .get(UserPreferences.browsingBackgroundBlurAmount)
        .toDouble();
    final urls = <String?>[
      gameThumbUrl(widget.libraryId, game.id, kind: 'snap'),
      gameThumbUrl(widget.libraryId, game.id, kind: 'title'),
      gameThumbUrl(widget.libraryId, game.id),
    ].nonNulls;

    for (final url in urls) {
      if (!mounted || generation != _backdropPreloadGeneration) return;
      try {
        await BoundedNetworkImage.precache(
          context,
          url,
          layoutWidth: MediaQuery.sizeOf(context).width,
          scale: blur > 0 ? 0.6 : 1,
          maxWidth: blur > 0 ? 640 : 1920,
        );
        return;
      } catch (_) {
        // Try the same snap -> title -> box-art fallback order used by the
        // visible backdrop, unless focus has already moved to another game.
      }
    }
  }

  Widget _buildGrid(
    List<GameSummary> games, {
    required bool showDetails,
    required bool showBackdrop,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 600;
        final horizontalPadding = compact ? 16.0 : 60.0;
        const spacing = 12.0;
        const imageHeightRatio = 1.34;
        const captionGap = 6.0;
        const captionHeight = 42.0;

        final availableWidth = constraints.maxWidth - horizontalPadding * 2;
        final desktopScale = _prefs
            .get(UserPreferences.desktopUiScale)
            .scaleFactor;
        final preferredCardWidth =
            _prefs.resolveLibraryPosterSize().portraitHeight *
            (2 / 3) *
            desktopScale;
        final columnCount =
            ((availableWidth + spacing) / (preferredCardWidth + spacing))
                .floor()
                .clamp(2, 20);
        final cardWidth =
            (availableWidth - spacing * (columnCount - 1)) / columnCount;
        final textScale = MediaQuery.textScalerOf(context).scale(1.0);
        final cardHeight =
            cardWidth * imageHeightRatio +
            captionGap +
            captionHeight * textScale;
        final childAspectRatio = cardWidth / cardHeight;
        final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
        final focusColor = isNeon
            ? ThemeRegistry.active.borders.focusBorder.color
            : Color(_prefs.get(UserPreferences.focusColor).colorValue);
        final cardFocusExpansion = _prefs.get(
          UserPreferences.cardFocusExpansion,
        );
        return Listener(
          onPointerSignal: (event) => _onGridPointerSignal(
            event,
            showBackdrop: showBackdrop,
            showDetails: showDetails,
          ),
          child: GridView.builder(
            controller: _gridScrollController,
            // Build roughly one viewport ahead so browser artwork requests are
            // already in flight before the next rows become visible.
            scrollCacheExtent: const ScrollCacheExtent.viewport(1),
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              8,
              horizontalPadding,
              32,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columnCount,
              mainAxisSpacing: 14,
              crossAxisSpacing: spacing,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return LayoutBuilder(
                builder: (context, cardConstraints) => GamePosterCard(
                  imageUrl: gameThumbUrl(widget.libraryId, game.id),
                  title: game.title,
                  fileName: game.fileName,
                  seed: game.id,
                  width: cardConstraints.maxWidth,
                  focusNode: getGridItemFocusNode(index, prefix: 'game_grid'),
                  focusColor: focusColor,
                  cardFocusExpansion: cardFocusExpansion,
                  suppressFocusGlow: isNeon,
                  autoScroll: false,
                  onFocus: () {
                    _activateBrowseGame(
                      game,
                      showBackdrop: showBackdrop,
                      showDetails: showDetails,
                    );
                    _scrollToGridRow(
                      index: index,
                      crossAxisCount: columnCount,
                      cellHeight: cardHeight,
                      mainAxisSpacing: 14,
                    );
                  },
                  onFocusLost: () => _browse.deactivateGame(game),
                  onHoverStart: () => _activateHoveredGame(
                    game,
                    showBackdrop: showBackdrop,
                    showDetails: showDetails,
                  ),
                  onHoverEnd: () => _deactivateHoveredGame(game),
                  onKeyEvent: (_, event) {
                    if (PlatformDetection.isTV &&
                        event.isActionable &&
                        event.logicalKey.isBackKey &&
                        _allLetterFocus.context != null) {
                      _allLetterFocus.requestFocus();
                      return KeyEventResult.handled;
                    }
                    if (event.isActionable && event.logicalKey.isRightKey) {
                      final isLastColumn =
                          (index % columnCount) == columnCount - 1;
                      final isLastItem = index == games.length - 1;
                      if (isLastColumn || isLastItem) {
                        return KeyEventResult.handled;
                      }
                    }
                    return KeyEventResult.ignored;
                  },
                  onTap: () => context.push(
                    Destinations.gameDetailOf(widget.libraryId, game.id),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _FocusedGameHud extends StatelessWidget {
  const _FocusedGameHud({
    required this.desktopScale,
    required this.game,
    required this.detail,
    required this.displayTitle,
  });

  final double desktopScale;
  final GameSummary? game;
  final GameDetail? detail;
  final String? displayTitle;

  @override
  Widget build(BuildContext context) {
    final activeGame = game;
    final textScale = MediaQuery.textScalerOf(
      context,
    ).scale(1).clamp(1.0, 2.0).toDouble();
    final responsiveScale = desktopScale > textScale ? desktopScale : textScale;
    return SizedBox(
      // Match the regular library HUD's reserved-height approach so changing
      // focus content never relays out the alphabet bar or game grid.
      height: 105 * responsiveScale,
      child: ClipRect(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: activeGame == null
              ? const SizedBox.shrink(key: ValueKey('empty'))
              : Column(
                  key: ValueKey(activeGame.id),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayTitle ??
                          gameDisplayTitle(
                            activeGame.title,
                            activeGame.fileName,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColorScheme.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    _GameMetadataRow(detail: detail),
                    if (detail?.overview?.trim() case final overview?
                        when overview.isNotEmpty) ...[
                      const SizedBox(height: 5),
                      Text(
                        overview,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColorScheme.onSurface.withAlpha(166),
                          fontSize: 13,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}

class _GameMetadataRow extends StatelessWidget {
  const _GameMetadataRow({required this.detail});

  final GameDetail? detail;

  @override
  Widget build(BuildContext context) {
    final game = detail;
    if (game == null) return const SizedBox.shrink();

    final values = <Widget>[
      if (game.year != null) _metadataText('${game.year}'),
      if (game.genre?.trim() case final genre? when genre.isNotEmpty)
        _metadataText(genre),
      if (game.region?.trim() case final region? when region.isNotEmpty)
        _metadataText(region),
      if (game.players != null)
        _iconMetadata(Icons.group_outlined, '${game.players}'),
      if (game.rating != null)
        _iconMetadata(Icons.star, game.rating!.toStringAsFixed(1)),
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: values,
    );
  }

  Widget _metadataText(String value) {
    return Text(
      value,
      style: TextStyle(
        color: AppColorScheme.onSurface.withAlpha(179),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _iconMetadata(IconData icon, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColorScheme.onSurface.withAlpha(179)),
        const SizedBox(width: 3),
        _metadataText(value),
      ],
    );
  }
}

class _GameBrowseBackdrop extends StatelessWidget {
  const _GameBrowseBackdrop({
    super.key,
    required this.libraryId,
    required this.game,
    required this.blur,
  });

  final String libraryId;
  final GameSummary game;
  final double blur;

  @override
  Widget build(BuildContext context) {
    final fallback = gameFallbackColor(game.id);
    final urls = <String?>[
      gameThumbUrl(libraryId, game.id, kind: 'snap'),
      gameThumbUrl(libraryId, game.id, kind: 'title'),
      gameThumbUrl(libraryId, game.id),
    ].nonNulls.toList(growable: false);

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                fallback,
                Color.lerp(fallback, AppColorScheme.background, 0.7)!,
              ],
            ),
          ),
        ),
        _GameBrowseBackdropImage(urls: urls, blur: blur),
      ],
    );
  }
}

class _GameBrowseBackdropImage extends StatelessWidget {
  const _GameBrowseBackdropImage({
    required this.urls,
    required this.blur,
    this.index = 0,
  });

  final List<String> urls;
  final double blur;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (index >= urls.length) return const SizedBox.shrink();

    Widget image = BoundedNetworkImage(
      imageUrl: urls[index],
      fit: BoxFit.cover,
      maxWidth: blur > 0 ? 640 : 1920,
      scale: blur > 0 ? 0.6 : 1,
      fadeInDuration: const Duration(milliseconds: 200),
      errorBuilder: (_, _, _) =>
          _GameBrowseBackdropImage(urls: urls, blur: blur, index: index + 1),
    );
    if (blur <= 0) return image;

    final sigma = GlassSettings.decorativeSigma(blur);
    image = RepaintBoundary(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
          tileMode: TileMode.decal,
        ),
        child: image,
      ),
    );
    return image;
  }
}
