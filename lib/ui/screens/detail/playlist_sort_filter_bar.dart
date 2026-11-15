import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../mixins/focus_state_mixin.dart';
import '../../widgets/focus/focus_theme.dart';
import '../../widgets/overlay_sheet.dart';

/// Available sort options for playlist tracks.
const List<LibrarySortBy> playlistTrackSortOptions = [
  LibrarySortBy.playlistOrder,
  LibrarySortBy.name,
  LibrarySortBy.dateAdded,
  LibrarySortBy.premiereDate,
  LibrarySortBy.communityRating,
  LibrarySortBy.criticRating,
  LibrarySortBy.runtime,
  LibrarySortBy.datePlayed,
  LibrarySortBy.playCount,
  LibrarySortBy.random,
];

/// Returns a localized display label for a library or playlist sort option.
String librarySortLabel(LibrarySortBy sortBy, AppLocalizations l10n) {
  return switch (sortBy) {
    LibrarySortBy.playlistOrder => l10n.librarySortPlaylistOrder,
    LibrarySortBy.name => l10n.sortByName,
    LibrarySortBy.dateAdded => l10n.librarySortDateAdded,
    LibrarySortBy.dateEpisodeAdded => l10n.librarySortDateEpisodeAdded,
    LibrarySortBy.premiereDate => l10n.playlistSortReleaseDate,
    LibrarySortBy.rating => l10n.librarySortParentalRating,
    LibrarySortBy.runtime => l10n.playlistSortRuntime,
    LibrarySortBy.random => l10n.playlistSortRandom,
    LibrarySortBy.criticRating => l10n.playlistSortCriticRating,
    LibrarySortBy.communityRating => l10n.communityRating,
    LibrarySortBy.myRating => l10n.librarySortMyRating,
    LibrarySortBy.datePlayed => l10n.playlistSortLastPlayed,
    LibrarySortBy.playCount => l10n.playlistSortPlayCount,
    LibrarySortBy.albumArtist => l10n.librarySortAlbumArtist,
    LibrarySortBy.album => l10n.librarySortAlbum,
    LibrarySortBy.artist => l10n.librarySortArtist,
    LibrarySortBy.trackNumber => l10n.librarySortTrackNumber,
    LibrarySortBy.genre => l10n.librarySortGenre,
    LibrarySortBy.foldersFirst => l10n.librarySortFoldersFirst,
  };
}

/// Returns a localized display label for an external row sort option.
String externalRowSortLabel(ExternalRowSortBy sortBy, AppLocalizations l10n) {
  return switch (sortBy) {
    ExternalRowSortBy.none => l10n.externalRowSortDefault,
    ExternalRowSortBy.name => l10n.externalRowSortName,
    ExternalRowSortBy.releaseDate => l10n.externalRowSortReleaseDate,
    ExternalRowSortBy.rating => l10n.externalRowSortRating,
    ExternalRowSortBy.popularity => l10n.externalRowSortPopularity,
    ExternalRowSortBy.shuffle => l10n.externalRowSortShuffle,
  };
}

/// Returns a localized display label for a played status filter.
String playlistPlayedStatusLabel(
  PlayedStatusFilter status,
  AppLocalizations l10n,
) {
  return switch (status) {
    PlayedStatusFilter.all => l10n.all,
    PlayedStatusFilter.watched => l10n.watched,
    PlayedStatusFilter.unwatched => l10n.unwatched,
    PlayedStatusFilter.inProgress => l10n.filterInProgress,
  };
}

/// Filters and sorts a playlist's tracks client-side without altering the
/// underlying server playlist ordering.
List<AggregatedItem> sortAndFilterPlaylistTracks({
  required List<AggregatedItem> tracks,
  required LibrarySortBy sortBy,
  required SortDirection sortDirection,
  required PlayedStatusFilter playedFilter,
  required bool favoriteOnly,
  String? mediaTypeFilter,
  int? randomSeed,
}) {
  // 1. Filter tracks
  var filtered = tracks.where((item) {
    if (favoriteOnly && !item.isFavorite) {
      return false;
    }

    switch (playedFilter) {
      case PlayedStatusFilter.all:
        break;
      case PlayedStatusFilter.watched:
        if (!item.isPlayed) return false;
        break;
      case PlayedStatusFilter.unwatched:
        final pos = item.playbackPositionTicks ?? 0;
        if (item.isPlayed || pos > 0) return false;
        break;
      case PlayedStatusFilter.inProgress:
        final pos = item.playbackPositionTicks ?? 0;
        if (item.isPlayed || pos <= 0) return false;
        break;
    }

    if (mediaTypeFilter != null &&
        mediaTypeFilter.isNotEmpty &&
        mediaTypeFilter != 'all') {
      if (item.type != mediaTypeFilter) return false;
    }

    return true;
  }).toList();

  // 2. Sort tracks
  if (sortBy == LibrarySortBy.playlistOrder) {
    if (sortDirection == SortDirection.descending) {
      return filtered.reversed.toList();
    }
    return filtered;
  }

  if (sortBy == LibrarySortBy.random) {
    final shuffled = List<AggregatedItem>.from(filtered);
    final rng = randomSeed != null ? Random(randomSeed) : Random(42);
    shuffled.shuffle(rng);
    return shuffled;
  }

  filtered.sort((a, b) {
    int cmp = 0;
    switch (sortBy) {
      case LibrarySortBy.name:
        final aName = a.sortName?.isNotEmpty == true ? a.sortName! : a.name;
        final bName = b.sortName?.isNotEmpty == true ? b.sortName! : b.name;
        cmp = aName.toLowerCase().compareTo(bName.toLowerCase());
        break;
      case LibrarySortBy.dateAdded:
        final aDate = a.dateCreated ?? DateTime.fromMillisecondsSinceEpoch(0);
        final bDate = b.dateCreated ?? DateTime.fromMillisecondsSinceEpoch(0);
        cmp = aDate.compareTo(bDate);
        break;
      case LibrarySortBy.premiereDate:
        final aDate = a.premiereDate ?? DateTime.fromMillisecondsSinceEpoch(0);
        final bDate = b.premiereDate ?? DateTime.fromMillisecondsSinceEpoch(0);
        cmp = aDate.compareTo(bDate);
        break;
      case LibrarySortBy.communityRating:
        final aRating = a.communityRating ?? 0.0;
        final bRating = b.communityRating ?? 0.0;
        cmp = aRating.compareTo(bRating);
        break;
      case LibrarySortBy.criticRating:
        final aRating = a.criticRating ?? 0;
        final bRating = b.criticRating ?? 0;
        cmp = aRating.compareTo(bRating);
        break;
      case LibrarySortBy.runtime:
        final aTicks = a.runTimeTicks ?? 0;
        final bTicks = b.runTimeTicks ?? 0;
        cmp = aTicks.compareTo(bTicks);
        break;
      case LibrarySortBy.datePlayed:
        final aDate = a.lastPlayedDate ?? DateTime.fromMillisecondsSinceEpoch(0);
        final bDate = b.lastPlayedDate ?? DateTime.fromMillisecondsSinceEpoch(0);
        cmp = aDate.compareTo(bDate);
        break;
      case LibrarySortBy.playCount:
        final aCount =
            (a.rawData['UserData'] as Map?)?['PlayCount'] as int? ?? 0;
        final bCount =
            (b.rawData['UserData'] as Map?)?['PlayCount'] as int? ?? 0;
        cmp = aCount.compareTo(bCount);
        break;
      case LibrarySortBy.myRating:
        final aRating = a.personalRating ?? 0.0;
        final bRating = b.personalRating ?? 0.0;
        cmp = aRating.compareTo(bRating);
        break;
      default:
        break;
    }

    if (cmp == 0) {
      cmp = a.name.toLowerCase().compareTo(b.name.toLowerCase());
    }

    return sortDirection == SortDirection.ascending ? cmp : -cmp;
  });

  return filtered;
}

/// A compact toolbar featuring small Sort and Filter pill buttons positioned
/// above playlist items.
class PlaylistSortFilterBar extends StatelessWidget {
  final LibrarySortBy sortBy;
  final SortDirection sortDirection;
  final ValueChanged<(LibrarySortBy, SortDirection)> onSortChanged;

  final PlayedStatusFilter playedFilter;
  final bool favoriteOnly;
  final String? mediaTypeFilter;
  final List<String> availableMediaTypes;
  final void Function(PlayedStatusFilter, bool, String?) onFilterChanged;

  final VoidCallback onReset;
  final int totalCount;
  final int filteredCount;

  final FocusNode? sortFocusNode;
  final FocusNode? filterFocusNode;
  final FocusNode? resetFocusNode;
  final VoidCallback? onSortArrowUp;
  final VoidCallback? onSortArrowDown;
  final VoidCallback? onSortArrowLeft;
  final VoidCallback? onSortArrowRight;
  final VoidCallback? onFilterArrowUp;
  final VoidCallback? onFilterArrowDown;

  const PlaylistSortFilterBar({
    super.key,
    required this.sortBy,
    required this.sortDirection,
    required this.onSortChanged,
    required this.playedFilter,
    required this.favoriteOnly,
    this.mediaTypeFilter,
    this.availableMediaTypes = const [],
    required this.onFilterChanged,
    required this.onReset,
    required this.totalCount,
    required this.filteredCount,
    this.sortFocusNode,
    this.filterFocusNode,
    this.resetFocusNode,
    this.onSortArrowUp,
    this.onSortArrowDown,
    this.onSortArrowLeft,
    this.onSortArrowRight,
    this.onFilterArrowUp,
    this.onFilterArrowDown,
  });

  bool get isSortActive =>
      sortBy != LibrarySortBy.playlistOrder ||
      sortDirection != SortDirection.ascending;

  bool get isFilterActive =>
      playedFilter != PlayedStatusFilter.all ||
      favoriteOnly ||
      (mediaTypeFilter != null &&
          mediaTypeFilter!.isNotEmpty &&
          mediaTypeFilter != 'all');

  String _filterSummary(AppLocalizations l10n) {
    final parts = <String>[];
    if (playedFilter != PlayedStatusFilter.all) {
      parts.add(playlistPlayedStatusLabel(playedFilter, l10n));
    }
    if (favoriteOnly) {
      parts.add(l10n.favorites);
    }
    if (mediaTypeFilter != null &&
        mediaTypeFilter!.isNotEmpty &&
        mediaTypeFilter != 'all') {
      parts.add(mediaTypeFilter!);
    }
    if (parts.isEmpty) {
      return l10n.all;
    }
    if (parts.length == 1) {
      return parts.first;
    }
    return l10n.playlistFilterActiveCount(parts.length);
  }

  void _openSortDialog(BuildContext context) {
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => PlaylistSortDialog(
        currentSort: sortBy,
        currentDirection: sortDirection,
        onSortSelected: (newSort, newDirection) {
          onSortChanged((newSort, newDirection));
        },
      ),
    );
  }

  void _openFilterDialog(BuildContext context) {
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => PlaylistFilterDialog(
        playedFilter: playedFilter,
        favoriteOnly: favoriteOnly,
        mediaTypeFilter: mediaTypeFilter,
        availableMediaTypes: availableMediaTypes,
        onFilterChanged: onFilterChanged,
        onClearFilters: () {
          onFilterChanged(PlayedStatusFilter.all, false, null);
        },
      ),
    );
  }

  void _handleReset() {
    sortFocusNode?.requestFocus();
    onReset();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sortFocusNode?.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAnyModified = isSortActive || isFilterActive;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          // Sort Pill
          _PlaylistPillButton(
            focusNode: sortFocusNode,
            icon: Icons.sort_rounded,
            label: 'Sort: ${librarySortLabel(sortBy, l10n)}',
            trailing: sortBy != LibrarySortBy.random &&
                    (sortBy != LibrarySortBy.playlistOrder ||
                        sortDirection == SortDirection.descending)
                ? Icon(
                    sortDirection == SortDirection.ascending
                        ? Icons.arrow_upward_rounded
                        : Icons.arrow_downward_rounded,
                    size: 14,
                  )
                : null,
            isActive: isSortActive,
            onTap: () => _openSortDialog(context),
            onArrowUp: onSortArrowUp,
            onArrowDown: onSortArrowDown,
            onArrowLeft: onSortArrowLeft,
            onArrowRight: onSortArrowRight,
          ),

          // Filter Pill
          _PlaylistPillButton(
            focusNode: filterFocusNode,
            icon: Icons.filter_list_rounded,
            label: 'Filter: ${_filterSummary(l10n)}',
            trailing: const Icon(
              Icons.arrow_drop_down_rounded,
              size: 16,
            ),
            isActive: isFilterActive,
            onTap: () => _openFilterDialog(context),
            onArrowUp: onFilterArrowUp,
            onArrowDown: onFilterArrowDown,
          ),

          // Reset pill if modified
          if (isAnyModified)
            _PlaylistPillButton(
              focusNode: resetFocusNode,
              icon: Icons.restart_alt_rounded,
              label: l10n.reset,
              isActive: false,
              onTap: _handleReset,
              onArrowUp: onSortArrowUp,
              onArrowDown: onSortArrowDown,
            ),

          // Track count summary when filtered
          if (isFilterActive)
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                '$filteredCount of $totalCount',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white54,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PlaylistPillButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Widget? trailing;
  final bool isActive;
  final VoidCallback onTap;
  final FocusNode? focusNode;
  final VoidCallback? onArrowUp;
  final VoidCallback? onArrowDown;
  final VoidCallback? onArrowLeft;
  final VoidCallback? onArrowRight;

  const _PlaylistPillButton({
    required this.icon,
    required this.label,
    this.trailing,
    this.isActive = false,
    required this.onTap,
    this.focusNode,
    this.onArrowUp,
    this.onArrowDown,
    this.onArrowLeft,
    this.onArrowRight,
  });

  @override
  State<_PlaylistPillButton> createState() => _PlaylistPillButtonState();
}

class _PlaylistPillButtonState extends State<_PlaylistPillButton>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final accent = AppColorScheme.accent;
    final isFocused = showFocusBorder;
    final isHovered = hovered;
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

    Color effectiveFocusColor;
    try {
      effectiveFocusColor = focusColor;
    } catch (_) {
      effectiveFocusColor = accent;
    }

    final borderColor = isFocused
        ? effectiveFocusColor
        : widget.isActive
            ? accent.withValues(alpha: 0.9)
            : isHovered
                ? Colors.white60
                : Colors.white24;

    final bgColor = isFocused
        ? effectiveFocusColor.withValues(alpha: 0.22)
        : widget.isActive
            ? accent.withValues(alpha: 0.18)
            : isHovered
                ? Colors.white.withValues(alpha: 0.10)
                : Colors.white.withValues(alpha: 0.05);

    final foregroundColor = isFocused
        ? (isNeon ? accent : Colors.white)
        : widget.isActive
            ? accent
            : Colors.white.withValues(alpha: 0.88);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (f) => setFocused(f),
        onKeyEvent: (_, event) {
          if (event.isActionable) {
            if (event.logicalKey.isUpKey && widget.onArrowUp != null) {
              widget.onArrowUp!();
              return KeyEventResult.handled;
            }
            if (event.logicalKey.isDownKey && widget.onArrowDown != null) {
              widget.onArrowDown!();
              return KeyEventResult.handled;
            }
            if (event.logicalKey.isLeftKey && widget.onArrowLeft != null) {
              widget.onArrowLeft!();
              return KeyEventResult.handled;
            }
            if (event.logicalKey.isRightKey && widget.onArrowRight != null) {
              widget.onArrowRight!();
              return KeyEventResult.handled;
            }
          }
          if (isActivateKey(event)) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 140),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: FocusTheme.focusDecoration(
              isFocused: isFocused,
              radius: 18,
              color: borderColor,
              backgroundColor: bgColor,
              suppressFocusGlow: isNeon,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  size: 15,
                  color: foregroundColor,
                ),
                const SizedBox(width: 6),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: foregroundColor,
                  ),
                ),
                if (widget.trailing != null) ...[
                  const SizedBox(width: 4),
                  IconTheme(
                    data: IconThemeData(
                      size: 14,
                      color: foregroundColor,
                    ),
                    child: widget.trailing!,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Separate dialog for selecting playlist item sort options and direction.
class PlaylistSortDialog extends StatefulWidget {
  final LibrarySortBy currentSort;
  final SortDirection currentDirection;
  final void Function(LibrarySortBy, SortDirection) onSortSelected;

  const PlaylistSortDialog({
    super.key,
    required this.currentSort,
    required this.currentDirection,
    required this.onSortSelected,
  });

  @override
  State<PlaylistSortDialog> createState() => _PlaylistSortDialogState();
}

class _PlaylistSortDialogState extends State<PlaylistSortDialog> {
  late LibrarySortBy _selectedSort = widget.currentSort;
  late SortDirection _selectedDirection = widget.currentDirection;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final accent = AppColorScheme.accent;
    const dialogBg = Color(0xFF1E1E24);
    const onSurface = Colors.white;

    return AlertDialog(
      backgroundColor: dialogBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        l10n.sortBy,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      content: SizedBox(
        width: 380,
        child: ListView(
          shrinkWrap: true,
          children: [
            for (final option in playlistTrackSortOptions)
              _DialogRadioRow(
                label: librarySortLabel(option, l10n),
                selected: _selectedSort == option,
                autofocus: _selectedSort == option,
                accent: accent,
                onSurface: onSurface,
                trailing: _selectedSort == option &&
                        option != LibrarySortBy.random
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(
                          _selectedDirection == SortDirection.ascending
                              ? Icons.arrow_upward_rounded
                              : Icons.arrow_downward_rounded,
                          color: accent,
                          size: 18,
                        ),
                      )
                    : null,
                onTap: () {
                  if (_selectedSort == option &&
                      option != LibrarySortBy.random) {
                    setState(() {
                      _selectedDirection =
                          _selectedDirection == SortDirection.ascending
                              ? SortDirection.descending
                              : SortDirection.ascending;
                    });
                  } else {
                    setState(() {
                      _selectedSort = option;
                      _selectedDirection = SortDirection.ascending;
                    });
                  }
                  widget.onSortSelected(_selectedSort, _selectedDirection);
                  Navigator.of(context).pop();
                },
              ),
          ],
        ),
      ),
    );
  }
}

/// Separate dialog for selecting filter criteria on playlist items.
class PlaylistFilterDialog extends StatefulWidget {
  final PlayedStatusFilter playedFilter;
  final bool favoriteOnly;
  final String? mediaTypeFilter;
  final List<String> availableMediaTypes;
  final void Function(PlayedStatusFilter, bool, String?) onFilterChanged;
  final VoidCallback onClearFilters;

  const PlaylistFilterDialog({
    super.key,
    required this.playedFilter,
    required this.favoriteOnly,
    this.mediaTypeFilter,
    this.availableMediaTypes = const [],
    required this.onFilterChanged,
    required this.onClearFilters,
  });

  @override
  State<PlaylistFilterDialog> createState() => _PlaylistFilterDialogState();
}

class _PlaylistFilterDialogState extends State<PlaylistFilterDialog> {
  late PlayedStatusFilter _playedFilter = widget.playedFilter;
  late bool _favoriteOnly = widget.favoriteOnly;
  late String? _mediaTypeFilter = widget.mediaTypeFilter;

  void _apply() {
    widget.onFilterChanged(_playedFilter, _favoriteOnly, _mediaTypeFilter);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final accent = AppColorScheme.accent;
    const dialogBg = Color(0xFF1E1E24);
    const onSurface = Colors.white;

    final hasActiveFilter = _playedFilter != PlayedStatusFilter.all ||
        _favoriteOnly ||
        (_mediaTypeFilter != null &&
            _mediaTypeFilter!.isNotEmpty &&
            _mediaTypeFilter != 'all');

    return AlertDialog(
      backgroundColor: dialogBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        l10n.filters,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      content: SizedBox(
        width: 380,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section: Played Status
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 6),
                child: Text(
                  l10n.playedStatus,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              for (final status in PlayedStatusFilter.values)
                _DialogRadioRow(
                  label: playlistPlayedStatusLabel(status, l10n),
                  selected: _playedFilter == status,
                  autofocus: _playedFilter == status,
                  accent: accent,
                  onSurface: onSurface,
                  onTap: () {
                    setState(() => _playedFilter = status);
                    _apply();
                  },
                ),

              const Divider(color: Colors.white12, height: 24),

              // Section: Favorites
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 6),
                child: Text(
                  l10n.favorites,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              _DialogCheckboxRow(
                label: l10n.favorites,
                checked: _favoriteOnly,
                accent: accent,
                onSurface: onSurface,
                onTap: () {
                  setState(() => _favoriteOnly = !_favoriteOnly);
                  _apply();
                },
              ),

              // Section: Media Type (if playlist has multiple types)
              if (widget.availableMediaTypes.length > 1) ...[
                const Divider(color: Colors.white12, height: 24),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 6),
                  child: Text(
                    l10n.type,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                _DialogRadioRow(
                  label: l10n.all,
                  selected: _mediaTypeFilter == null || _mediaTypeFilter == 'all',
                  accent: accent,
                  onSurface: onSurface,
                  onTap: () {
                    setState(() => _mediaTypeFilter = 'all');
                    _apply();
                  },
                ),
                for (final type in widget.availableMediaTypes)
                  _DialogRadioRow(
                    label: type,
                    selected: _mediaTypeFilter == type,
                    accent: accent,
                    onSurface: onSurface,
                    onTap: () {
                      setState(() => _mediaTypeFilter = type);
                      _apply();
                    },
                  ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        if (hasActiveFilter)
          TextButton(
            onPressed: () {
              setState(() {
                _playedFilter = PlayedStatusFilter.all;
                _favoriteOnly = false;
                _mediaTypeFilter = null;
              });
              widget.onClearFilters();
              Navigator.of(context).pop();
            },
            child: Text(
              l10n.clearFilters,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.done),
        ),
      ],
    );
  }
}

class _DialogRadioRow extends StatefulWidget {
  final String label;
  final bool selected;
  final bool autofocus;
  final VoidCallback onTap;
  final Widget? trailing;
  final Color? accent;
  final Color onSurface;

  const _DialogRadioRow({
    required this.label,
    required this.selected,
    this.autofocus = false,
    required this.onTap,
    this.trailing,
    this.accent,
    required this.onSurface,
  });

  @override
  State<_DialogRadioRow> createState() => _DialogRadioRowState();
}

class _DialogRadioRowState extends State<_DialogRadioRow> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final effectiveAccent = widget.accent ?? AppColorScheme.accent;
    final showActive = focused || hovered;
    final color = showActive ? focusColor : widget.onSurface;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        autofocus: widget.autofocus,
        onFocusChange: (f) => setFocused(f),
        onKeyEvent: (_, event) {
          if (isActivateKey(event)) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            color: showActive
                ? focusColor.withValues(alpha: 0.12)
                : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
            child: Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder.copyWith(
                        color: widget.selected
                            ? effectiveAccent
                            : color.withValues(alpha: 0.5),
                        width: 2,
                      ),
                    ),
                    color:
                        widget.selected ? effectiveAccent : Colors.transparent,
                  ),
                  child: widget.selected
                      ? Center(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.onSurface,
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: widget.selected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: widget.selected
                          ? color
                          : color.withValues(alpha: 0.8),
                    ),
                  ),
                ),
                if (widget.trailing != null) widget.trailing!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DialogCheckboxRow extends StatefulWidget {
  final String label;
  final bool checked;
  final VoidCallback onTap;
  final Color? accent;
  final Color onSurface;

  const _DialogCheckboxRow({
    required this.label,
    required this.checked,
    required this.onTap,
    this.accent,
    required this.onSurface,
  });

  @override
  State<_DialogCheckboxRow> createState() => _DialogCheckboxRowState();
}

class _DialogCheckboxRowState extends State<_DialogCheckboxRow>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final effectiveAccent = widget.accent ?? AppColorScheme.accent;
    final showActive = focused || hovered;
    final color = showActive ? focusColor : widget.onSurface;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        onFocusChange: (f) => setFocused(f),
        onKeyEvent: (_, event) {
          if (isActivateKey(event)) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            color: showActive
                ? focusColor.withValues(alpha: 0.12)
                : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
            child: Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder.copyWith(
                        color: widget.checked
                            ? effectiveAccent
                            : color.withValues(alpha: 0.5),
                        width: 2,
                      ),
                    ),
                    color: widget.checked ? effectiveAccent : Colors.transparent,
                  ),
                  child: widget.checked
                      ? const Center(
                          child: Icon(
                            Icons.check,
                            size: 13,
                            color: Colors.black,
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight:
                          widget.checked ? FontWeight.w600 : FontWeight.normal,
                      color: widget.checked
                          ? color
                          : color.withValues(alpha: 0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
