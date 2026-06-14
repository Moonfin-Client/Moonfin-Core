import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/services/background_service.dart';
import '../../../data/services/row_data_source.dart';
import '../../../data/viewmodels/library_view_view_model.dart';
import '../../../preference/user_preferences.dart';
import '../../navigation/destinations.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../widgets/library_row.dart';
import '../../widgets/media_card.dart';
import '../../../l10n/app_localizations.dart';
import '../../util/home_row_title_localizer.dart';
import '../../widgets/focus/context_menu_sheet.dart';

Color get _navyBackground => AppColorScheme.background;
const _horizontalPadding = 60.0;

class LibraryViewScreen extends StatefulWidget {
  final String libraryId;

  const LibraryViewScreen({super.key, required this.libraryId});

  @override
  State<LibraryViewScreen> createState() => _LibraryViewScreenState();
}

class _LibraryViewScreenState extends State<LibraryViewScreen> {
  late final LibraryViewViewModel _vm;
  final _backgroundService = GetIt.instance<BackgroundService>();
  final _prefs = GetIt.instance<UserPreferences>();
  StreamSubscription<String?>? _backgroundSub;
  String? _backdropUrl;

  @override
  void initState() {
    super.initState();
    _vm = LibraryViewViewModel(
      libraryId: widget.libraryId,
      dataSource: GetIt.instance<RowDataSource>(),
      client: GetIt.instance<MediaServerClient>(),
    );
    _vm.addListener(_onChanged);
    _vm.load();
    _backgroundSub = _backgroundService.backgroundStream.listen((url) {
      if (mounted) setState(() => _backdropUrl = url);
    });
    _backdropUrl = _backgroundService.currentUrl;
    _prefs.addListener(_onChanged);
  }

  @override
  void dispose() {
    _backgroundSub?.cancel();
    _vm.removeListener(_onChanged);
    _prefs.removeListener(_onChanged);
    _vm.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  void _onItemFocused(AggregatedItem item) {
    _vm.setFocusedItem(item);
    _backgroundService.setBackground(item, context: BlurContext.browsing);
  }

  double _desktopUiScaleFactor() {
    return _prefs.get(UserPreferences.desktopUiScale).scaleFactor;
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final hasBackdrop = _backdropUrl != null;
    final desktopScale = _desktopUiScaleFactor();
    return Scaffold(
      backgroundColor: _navyBackground,
      body: Stack(
        children: [
          if (hasBackdrop)
            Positioned.fill(
              child: FullscreenBackdropSwitcher(
                imageUrl: _backdropUrl!,
                duration: BackgroundService.transitionDuration,
              ),
            ),
          Positioned.fill(
            child: Container(
              color: _navyBackground.withAlpha(hasBackdrop ? 140 : 191),
            ),
          ),
          Column(
            children: [
              _LibraryViewHeader(
                libraryName: _vm.libraryName,
                desktopScale: desktopScale,
                onHome: () => context.go(Destinations.home),
                onBrowse: () =>
                    context.push(Destinations.library(widget.libraryId)),
                onGenres: () => context.push(
                  Destinations.libraryGenresOf(widget.libraryId),
                ),
              ),
              Expanded(child: _buildBody()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_vm.isLoading && _vm.rows.isEmpty) {
      return Center(
        child: CircularProgressIndicator(color: AppColorScheme.accent),
      );
    }

    if (_vm.rows.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).noItemsFound,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      );
    }

    final posterSize = _prefs.resolveLibraryPosterSize();
    final desktopScale = _desktopUiScaleFactor();
    final watchedBehavior = _prefs.get(
      UserPreferences.watchedIndicatorBehavior,
    );
    final suppressFocusGlow = ThemeRegistry.active.borders.focusGlow.isNotEmpty;
    final focusColor = Color(_prefs.get(UserPreferences.focusColor).colorValue);
    final cardExpansion = _prefs.get(UserPreferences.cardFocusExpansion);
    final l10n = AppLocalizations.of(context);

    final listView = ListView.builder(
      padding: const EdgeInsets.only(bottom: 32),
      itemCount: _vm.rows.length,
      itemBuilder: (context, index) {
        final row = _vm.rows[index];
        return LibraryRow(
          title: localizeHomeRowTitle(row: row, l10n: l10n),
          children: row.items.map((item) {
            final ar = MediaCard.aspectRatioForType(item.type);
            final baseHeight = ar > 1
                ? posterSize.landscapeHeight.toDouble()
                : posterSize.portraitHeight.toDouble();
            final height = baseHeight * desktopScale;
            final width = height * ar;
            final imageUrl = item.primaryImageTag != null
                ? _vm.imageApi.getPrimaryImageUrl(
                    item.id,
                    maxHeight: (height * 2).toInt(),
                    tag: item.primaryImageTag,
                  )
                : null;
            return MediaCard(
              title: item.name,
              subtitle: item.subtitle,
              imageUrl: imageUrl,
              width: width,
              aspectRatio: ar,
              isFavorite: item.isFavorite,
              isPlayed: item.isPlayed,
              unplayedCount: item.unplayedItemCount,
              playedPercentage: item.playedPercentage,
              watchedBehavior: watchedBehavior,
              itemType: item.type,
              focusColor: focusColor,
              cardFocusExpansion: cardExpansion,
              suppressFocusGlow: suppressFocusGlow,
              onFocus: () => _onItemFocused(item),
              onHoverStart: () => _onItemFocused(item),
              onHoverEnd: () => _vm.setFocusedItem(null),
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
                onChanged: _onChanged,
              ),
            );
          }).toList(),
        );
      },
    );

    if (!_vm.isLoading) {
      return listView;
    }

    return Stack(
      children: [
        Positioned.fill(child: listView),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: LinearProgressIndicator(
            minHeight: 2,
            color: AppColorScheme.accent,
            backgroundColor: AppColorScheme.onSurface.withValues(alpha: 0.15),
          ),
        ),
      ],
    );
  }
}

class _LibraryViewHeader extends StatelessWidget {
  final String libraryName;
  final double desktopScale;
  final VoidCallback onHome;
  final VoidCallback onBrowse;
  final VoidCallback onGenres;

  const _LibraryViewHeader({
    required this.libraryName,
    required this.desktopScale,
    required this.onHome,
    required this.onBrowse,
    required this.onGenres,
  });

  @override
  Widget build(BuildContext context) {
    final scale = desktopScale;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        _horizontalPadding * scale,
        20 * scale,
        _horizontalPadding * scale,
        8 * scale,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: AppColorScheme.onSurface.withValues(alpha: 0.7),
              size: 22 * scale,
            ),
            onPressed: onHome,
            tooltip: AppLocalizations.of(context).home,
          ),
          SizedBox(width: 12 * scale),
          Text(
            libraryName,
            style: TextStyle(
              fontSize: 26 * scale,
              fontWeight: FontWeight.w300,
              color: AppColorScheme.onSurface,
            ),
          ),
          const Spacer(),
          TextButton.icon(
            icon: Icon(Icons.grid_view, size: 18 * scale),
            label: Text(AppLocalizations.of(context).browseAll),
            style: TextButton.styleFrom(
              foregroundColor: AppColorScheme.onSurface.withValues(alpha: 0.7),
            ),
            onPressed: onBrowse,
          ),
          SizedBox(width: 8 * scale),
          TextButton.icon(
            icon: Icon(Icons.category, size: 18 * scale),
            label: Text(AppLocalizations.of(context).genres),
            style: TextButton.styleFrom(
              foregroundColor: AppColorScheme.onSurface.withValues(alpha: 0.7),
            ),
            onPressed: onGenres,
          ),
        ],
      ),
    );
  }
}
