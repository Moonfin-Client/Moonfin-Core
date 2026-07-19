import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/game_browse_filter.dart';
import '../../../util/game_library.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
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

class _GameSystemScreenState extends State<GameSystemScreen> {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();
  final UserPreferences _prefs = GetIt.instance<UserPreferences>();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  final GlobalKey<CustomTVTextFieldState> _searchTvFieldKey = GlobalKey();
  final FocusNode _allLetterFocus = FocusNode(
    debugLabel: 'game_alpha_all_letter',
  );

  bool _loading = true;
  String? _error;
  String _selectedLetter = '';
  List<GameSummary> _games = const [];
  Map<String, String> _displayTitles = const {};

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _searchFocus.addListener(_onSearchFocusChanged);
    _load();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchFocus.removeListener(_onSearchFocusChanged);
    _searchController.dispose();
    _searchFocus.dispose();
    _allLetterFocus.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (mounted) setState(() {});
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

  Future<void> _load() async {
    final gamesApi = _client.gamesApi;
    if (gamesApi == null) {
      setState(() {
        _loading = false;
        _error = 'This server does not support games.';
      });
      return;
    }

    try {
      final games = await gamesApi.getGames(
        widget.libraryId,
        system: widget.systemId,
      );
      final displayTitles = {
        for (final game in games)
          game.id: gameDisplayTitle(game.title, game.fileName),
      };
      games.sort(
        (a, b) => displayTitles[a.id]!.toLowerCase().compareTo(
          displayTitles[b.id]!.toLowerCase(),
        ),
      );
      if (!mounted) return;
      setState(() {
        _games = games;
        _displayTitles = displayTitles;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Failed to load games: $e';
      });
    }
  }

  List<GameSummary> get _visibleGames {
    return _games
        .where((game) {
          return gameTitleMatchesBrowseFilters(
            _displayTitles[game.id] ??
                gameDisplayTitle(game.title, game.fileName),
            alternateText: game.fileName,
            query: _searchController.text,
            letter: _selectedLetter,
          );
        })
        .toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.systemName?.trim();
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      appBar: AppBar(
        title: Text(title?.isNotEmpty == true ? title! : widget.systemId),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(_error!, textAlign: TextAlign.center),
        ),
      );
    }

    final visibleGames = _visibleGames;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: _buildSearchField(),
              ),
              const SizedBox(height: 10),
              GameAlphaPickerBar(
                selected: _selectedLetter,
                allFocusNode: _allLetterFocus,
                onChanged: (letter) => setState(() => _selectedLetter = letter),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${visibleGames.length} of ${_games.length}',
                  style: TextStyle(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: visibleGames.isEmpty
              ? Center(child: Text(AppLocalizations.of(context).noItemsFound))
              : _buildGrid(visibleGames),
        ),
      ],
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

    return TextField(
      controller: _searchController,
      focusNode: _searchFocus,
      style: TextStyle(color: foreground, fontSize: 17),
      decoration: InputDecoration(
        hintText: l10n.searchThisLibrary,
        hintStyle: TextStyle(color: foreground.withValues(alpha: 0.62)),
        prefixIcon: Icon(Icons.search, color: foreground),
        suffixIcon: _searchController.text.isEmpty
            ? null
            : IconButton(
                tooltip: 'Clear search',
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
    );
  }

  Widget _buildGrid(List<GameSummary> games) {
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
        return GridView.builder(
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
                autofocus: index == 0,
                onTap: () => context.push(
                  Destinations.gameDetailOf(widget.libraryId, game.id),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
