import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_library.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../util/game_library.dart';
import '../../navigation/destinations.dart';
import '../adaptive/sf_symbol.dart';
import 'bottom_nav_controller.dart';
import 'bottom_nav_sheet.dart';
import 'bottom_nav_theme.dart';

/// The Libraries tab. Libraries have no screen of their own, so the tab asks
/// which one to open.
Future<void> showBottomNavLibrariesSheet({
  required BuildContext context,
  required BottomNavController controller,
  required BottomNavTheme theme,
  required BottomNavbarStyle style,
  required double barHeight,
}) {
  return showBottomNavSheet(
    context: context,
    theme: theme,
    style: style,
    barHeight: barHeight,
    builder: (sheetContext) => _LibrariesSheet(
      libraries: controller.navLibraries,
      theme: theme,
      onOpen: (lib) {
        Navigator.of(sheetContext).pop();
        if (!context.mounted) return;
        context.navigateTopLevel(
          libraryRoute(
            lib.id,
            lib.collectionType,
            lib.name,
            serverId: lib.serverId,
          ),
        );
      },
    ),
  );
}

IconData _libraryIcon(String? collectionType) =>
    switch ((collectionType ?? '').toLowerCase()) {
      'movies' => Icons.movie_rounded,
      'tvshows' => Icons.tv_rounded,
      'music' => Icons.music_note_rounded,
      'books' || 'audiobooks' => Icons.menu_book_rounded,
      'livetv' => Icons.live_tv_rounded,
      'homevideos' || 'photos' => Icons.photo_library_rounded,
      'boxsets' => Icons.collections_bookmark_rounded,
      _ => Icons.video_library_rounded,
    };

class _LibrariesSheet extends StatelessWidget {
  final List<AggregatedLibrary> libraries;
  final BottomNavTheme theme;
  final ValueChanged<AggregatedLibrary> onOpen;

  const _LibrariesSheet({
    required this.libraries,
    required this.theme,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final onBar = theme.onBar;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BottomNavSheetGrabber(color: onBar),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 20, 10),
          child: Text(
            l10n.libraries,
            style: theme.labelStyle.copyWith(
              color: onBar,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Flexible(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
            children: [
              for (final lib in libraries)
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.circular(16),
                  ),
                  leading: Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: theme.accent.withValues(alpha: 0.16),
                      borderRadius: AppRadius.circular(12),
                    ),
                    child: AdaptiveIcon(
                      _libraryIcon(lib.collectionType),
                      size: 20,
                      color: theme.activeColor(0),
                    ),
                  ),
                  title: Text(
                    lib.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: onBar,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () => onOpen(lib),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
