import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/focus/dpad_keys.dart';
import '../../../../mixins/focus_state_mixin.dart';
import '../../../../widgets/adaptive/sf_symbol.dart';
import '../../../../widgets/focus/focus_theme.dart';
import '../../../../widgets/focus/focusable_wrapper.dart';
import '../../../../widgets/media_card.dart';
import '../../../../widgets/offline_aware_image.dart';
import '../../../../widgets/seerr/seerr_status_dot.dart';
import '../../../../widgets/seerr_icons.dart';
import '../../modern/modern_detail_content.dart'
    show StudioLogoIndex, studioLogoUrlFor;
import '../spotlight_images.dart';

/// Column count and cell size for a responsive modal grid.
typedef SpotlightGridMetrics = ({
  int columns,
  double cellWidth,
  double spacing,
  double runSpacing,
});

/// Lays out a modal grid at [maxWidth]: cells aim for [desiredWidth], the
/// column count is clamped to [minColumns]..[maxColumns], and a cell never
/// exceeds [maxCellWidth]. With [focusExpansion] the gaps grow to
/// [MediaCard.focusGap] so a focused card's scale clears its neighbours.
SpotlightGridMetrics spotlightGridMetrics({
  required double maxWidth,
  required double desiredWidth,
  required int minColumns,
  required int maxColumns,
  double minSpacing = 12,
  double minRunSpacing = 16,
  double aspectRatio = 2 / 3,
  bool focusExpansion = false,
  double maxCellWidth = double.infinity,
}) {
  final columns = ((maxWidth + minSpacing) / (desiredWidth + minSpacing))
      .floor()
      .clamp(minColumns, maxColumns);
  double cellWidthWith(double gap) =>
      ((maxWidth - gap * (columns - 1)) / columns)
          .floorToDouble()
          .clamp(0.0, maxCellWidth);
  final spacing = focusExpansion
      ? MediaCard.focusGap(cellWidthWith(minSpacing), minimum: minSpacing)
      : minSpacing;
  final cellWidth = cellWidthWith(spacing);
  final runSpacing = focusExpansion
      ? MediaCard.focusGap(cellWidth / aspectRatio, minimum: minRunSpacing)
      : minRunSpacing;
  return (
    columns: columns,
    cellWidth: cellWidth,
    spacing: spacing,
    runSpacing: runSpacing,
  );
}

/// Keys that stay put across rebuilds even when a list repeats an id, so a
/// grid never trips Flutter's duplicate-key assertion.
List<String> spotlightCellKeys(Iterable<String> ids) {
  final seen = <String, int>{};
  return [
    for (final id in ids)
      switch (seen.update(id, (count) => count + 1, ifAbsent: () => 0)) {
        0 => id,
        final repeat => '$id#$repeat',
      },
  ];
}

/// De-duplicates the people a server lists more than once, keeping the first
/// appearance and folding any extra roles into it. A cast list can name the
/// same person as both an actor and a guest star.
List<Map<String, dynamic>> spotlightDedupePeople(
  List<Map<String, dynamic>> people,
) {
  final byKey = <String, Map<String, dynamic>>{};
  for (final person in people) {
    final key = person['Id']?.toString() ?? person['Name']?.toString() ?? '';
    if (key.isEmpty) continue;
    final existing = byKey[key];
    if (existing == null) {
      byKey[key] = person;
      continue;
    }
    final roles = <String>{
      ...?(existing['Roles'] as Set<String>?),
      ...?(person['Roles'] as Set<String>?),
    };
    for (final source in [existing, person]) {
      final role = source['Role']?.toString();
      if (role != null && role.isNotEmpty) roles.add(role);
    }
    byKey[key] = {
      ...existing,
      if (roles.isNotEmpty) ...{'Roles': roles, 'Role': roles.join(' · ')},
    };
  }
  return byKey.values.toList();
}

/// Scrolls [cellContext] to the middle of the enclosing scroll view, so a
/// d-pad walk down a grid keeps the focused row clear of the modal's edges.
void spotlightScrollCellIntoView(BuildContext cellContext) {
  Scrollable.ensureVisible(
    cellContext,
    alignment: 0.5,
    duration: const Duration(milliseconds: 200),
    curve: Curves.easeOut,
  );
}

/// Responsive item grid for the Spotlight section modal: a Wrap of
/// [MediaCard]s whose columns scale to width. D-pad uses geometric traversal
/// and cards scroll into view on focus, so rows below the fold stay reachable
/// inside the modal's scroll view.
class SpotlightMediaGridSection extends StatelessWidget {
  final List<AggregatedItem> items;
  final ImageApi imageApi;
  final UserPreferences prefs;
  final double aspectRatio;
  final bool landscapeCells;
  final FocusNode? firstFocusNode;
  final ValueChanged<AggregatedItem> onItemTap;
  final Map<int, int>? seerrSeasonStatus;

  const SpotlightMediaGridSection({
    super.key,
    required this.items,
    required this.imageApi,
    required this.prefs,
    required this.onItemTap,
    this.aspectRatio = 2 / 3,
    this.landscapeCells = false,
    this.firstFocusNode,
    this.seerrSeasonStatus,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final cardExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final focusColor = isNeon
        ? AppColorScheme.accent
        : Color(prefs.get(UserPreferences.focusColor).colorValue);
    final titleColor = isNeon ? AppColorScheme.accent : null;
    final watchedBehavior = prefs.get(UserPreferences.watchedIndicatorBehavior);
    final showAvailabilityBadges =
        prefs.get(UserPreferences.showSeerrAvailabilityBadges);

    return LayoutBuilder(
      builder: (context, constraints) {
        final metrics = spotlightGridMetrics(
          maxWidth: constraints.maxWidth,
          desiredWidth: landscapeCells ? 220 : 150,
          minColumns: 2,
          maxColumns: landscapeCells ? 5 : 7,
          aspectRatio: aspectRatio,
          focusExpansion: cardExpansion,
          maxCellWidth: 300,
        );
        final cellKeys = spotlightCellKeys(items.map((i) => i.id));
        return Padding(
          padding: cardExpansion
              ? EdgeInsets.symmetric(vertical: metrics.runSpacing)
              : EdgeInsets.zero,
          child: Wrap(
            spacing: metrics.spacing,
            runSpacing: metrics.runSpacing,
            children: [
              for (var i = 0; i < items.length; i++)
                Builder(
                  key: ValueKey(cellKeys[i]),
                  builder: (cellContext) {
                    final entry = items[i];
                    // A title the library lacks, standing in from Seerr. It
                    // has no play state, so the watched slot goes to
                    // MediaCard's own request-status dot and the Seerr mark
                    // takes the corner a favourite would otherwise use.
                    final isSeerrItem =
                        entry.serverId == 'seerr' ||
                        entry.id.startsWith('tmdb:');
                    final isSeason = entry.type == 'Season';
                    final seasonSeerrStatus =
                        isSeason && entry.indexNumber != null
                            ? (seerrSeasonStatus?[entry.indexNumber])
                            : null;
                    final hasSeasonSeerrDot =
                        showAvailabilityBadges &&
                        SeerrMediaStatus.hasDot(seasonSeerrStatus);

                    return MediaCard(
                      key: ValueKey(cellKeys[i]),
                      title: entry.name,
                      titleColor: titleColor,
                      imageUrl: spotlightItemImageUrl(imageApi, entry),
                      width: metrics.cellWidth,
                      aspectRatio: aspectRatio,
                      isPlayed: entry.isPlayed,
                      isFavorite: entry.isFavorite,
                      itemType: entry.type,
                      focusNode: i == 0 ? firstFocusNode : null,
                      focusColor: focusColor,
                      cardFocusExpansion: cardExpansion,
                      suppressFocusGlow: isNeon,
                      watchedBehavior: isSeerrItem
                          ? WatchedIndicatorBehavior.never
                          : watchedBehavior,
                      seerrStatus: isSeerrItem ? entry.seerrStatus : null,
                      overlayOccupiesTopLeft: isSeerrItem || hasSeasonSeerrDot,
                      imageOverlays: [
                        if (isSeerrItem)
                          const Positioned(
                            top: 6,
                            left: 6,
                            child: SeerrBadge(size: 18),
                          ),
                        if (hasSeasonSeerrDot)
                          Positioned(
                            top: 6,
                            left: 6,
                            child: SeerrStatusDot(
                              status: seasonSeerrStatus,
                              size: 18,
                            ),
                          ),
                      ],
                      onFocus: () => spotlightScrollCellIntoView(cellContext),
                      onTap: () => onItemTap(entry),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

/// Seerr discover grid for the Spotlight section modal: TMDB poster cells for
/// recommendations, similar titles, and a person's Seerr credits. Cells carry
/// the media-type corner badge and request status the Seerr rows show.
class SpotlightSeerrGridSection extends StatelessWidget {
  final List<SeerrDiscoverItem> items;
  final UserPreferences prefs;
  final FocusNode? firstFocusNode;
  final ValueChanged<SeerrDiscoverItem> onItemTap;

  /// Show the character or job under the title (a person's credits).
  final bool showCredit;

  const SpotlightSeerrGridSection({
    super.key,
    required this.items,
    required this.prefs,
    required this.onItemTap,
    this.firstFocusNode,
    this.showCredit = false,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final cardExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final focusColor = isNeon
        ? AppColorScheme.accent
        : Color(prefs.get(UserPreferences.focusColor).colorValue);

    return LayoutBuilder(
      builder: (context, constraints) {
        final metrics = spotlightGridMetrics(
          maxWidth: constraints.maxWidth,
          desiredWidth: 150,
          minColumns: 2,
          maxColumns: 7,
          focusExpansion: cardExpansion,
          maxCellWidth: 300,
        );
        final cellKeys = spotlightCellKeys(items.map((i) => '${i.id}'));
        return Padding(
          padding: cardExpansion
              ? EdgeInsets.symmetric(vertical: metrics.runSpacing)
              : EdgeInsets.zero,
          child: Wrap(
            spacing: metrics.spacing,
            runSpacing: metrics.runSpacing,
            children: [
              for (var i = 0; i < items.length; i++)
                Builder(
                  key: ValueKey(cellKeys[i]),
                  builder: (cellContext) {
                    final entry = items[i];
                    return MediaCard(
                      key: ValueKey(cellKeys[i]),
                      title: entry.displayTitle,
                      subtitle: showCredit
                          ? (entry.character ?? entry.job)
                          : null,
                      imageUrl: spotlightSeerrPosterUrl(entry.posterPath),
                      width: metrics.cellWidth,
                      aspectRatio: 2 / 3,
                      focusNode: i == 0 ? firstFocusNode : null,
                      focusColor: focusColor,
                      cardFocusExpansion: cardExpansion,
                      suppressFocusGlow: isNeon,
                      seerrMediaType: entry.mediaType,
                      seerrStatus: entry.mediaInfo?.status,
                      onFocus: () => spotlightScrollCellIntoView(cellContext),
                      onTap: () => onItemTap(entry),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

/// People grid for the Spotlight section modal: circular avatar cells with
/// name and role, matching the detail cast row's look.
class SpotlightPeopleGridSection extends StatelessWidget {
  final List<Map<String, dynamic>> people;
  final ImageApi imageApi;
  final FocusNode? firstFocusNode;
  final void Function(String personId) onPersonTap;

  const SpotlightPeopleGridSection({
    super.key,
    required this.people,
    required this.imageApi,
    required this.onPersonTap,
    this.firstFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    if (people.isEmpty) return const SizedBox.shrink();
    final entries = spotlightDedupePeople(people);
    if (entries.isEmpty) return const SizedBox.shrink();
    return LayoutBuilder(
      builder: (context, constraints) {
        final metrics = spotlightGridMetrics(
          maxWidth: constraints.maxWidth,
          desiredWidth: 110,
          minColumns: 3,
          maxColumns: 9,
          minSpacing: 16,
          minRunSpacing: 16,
        );
        final cellKeys = spotlightCellKeys([
          for (var i = 0; i < entries.length; i++)
            entries[i]['Id']?.toString() ??
                entries[i]['Name']?.toString() ??
                '$i',
        ]);
        return Wrap(
          spacing: metrics.spacing,
          runSpacing: metrics.runSpacing,
          children: [
            for (var i = 0; i < entries.length; i++)
              Builder(
                key: ValueKey(cellKeys[i]),
                builder: (cellContext) {
                  final person = entries[i];
                  final personId = person['Id']?.toString();
                  final name = person['Name']?.toString() ?? '';
                  final role = (person['Roles'] as Set<String>?)?.join(' · ') ??
                      person['Role']?.toString();
                  final imageUrl = spotlightPersonImageUrl(
                    imageApi,
                    id: personId,
                    tag: person['PrimaryImageTag'] as String?,
                    profilePath: person['ProfilePath'] as String?,
                    maxHeight: 200,
                  );
                  return _SpotlightPersonCell(
                    key: ValueKey(cellKeys[i]),
                    width: metrics.cellWidth,
                    name: name,
                    role: role,
                    imageUrl: imageUrl,
                    focusNode: i == 0 ? firstFocusNode : null,
                    onFocus: () => spotlightScrollCellIntoView(cellContext),
                    onTap:
                        personId == null ? null : () => onPersonTap(personId),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}

class _SpotlightPersonCell extends StatefulWidget {
  final double width;
  final String name;
  final String? role;
  final String? imageUrl;
  final FocusNode? focusNode;
  final VoidCallback? onFocus;
  final VoidCallback? onTap;

  const _SpotlightPersonCell({
    super.key,
    required this.width,
    required this.name,
    required this.role,
    required this.imageUrl,
    this.focusNode,
    this.onFocus,
    this.onTap,
  });

  @override
  State<_SpotlightPersonCell> createState() => _SpotlightPersonCellState();
}

class _SpotlightPersonCellState extends State<_SpotlightPersonCell>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    // The detail screens paint neon focus in the accent rather than the
    // theme's focus border colour the mixin returns.
    final accent = isNeon ? AppColorScheme.accent : focusColor;
    final avatarRadius = (widget.width / 2 - 10).clamp(28.0, 45.0);

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (focused) {
          setFocused(focused);
          if (focused) widget.onFocus?.call();
        },
        onKeyEvent: (_, event) {
          if (widget.onTap != null && isActivateKey(event)) {
            widget.onTap!();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: cardFocusExpansion && showFocusBorder ? 1.05 : 1.0,
            duration: FocusTheme.animationDuration,
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: widget.width,
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: FocusTheme.animationDuration,
                    curve: Curves.easeOutCubic,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        ThemeRegistry.active.borders.focusBorder.copyWith(
                          color: showFocusBorder ? accent : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      radius: avatarRadius,
                      backgroundColor: Colors.white.withValues(alpha: 0.1),
                      backgroundImage: widget.imageUrl != null
                          ? offlineAwareImageProvider(widget.imageUrl!)
                          : null,
                      child: widget.imageUrl == null
                          ? const AdaptiveIcon(
                              Icons.person,
                              color: Colors.white54,
                              size: 28,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isNeon
                          ? AppColorScheme.accent
                          : AppColorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.role != null)
                    Text(
                      widget.role!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isNeon
                            ? AppColorScheme.onSurface
                            : AppColorScheme.onSurface.withValues(alpha: 0.6),
                        fontSize: 11,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Studio logo grid for the Spotlight section modal. Logos always come from
/// TMDB; a studio without one falls back to its name on a bordered tile.
class SpotlightStudiosGridSection extends StatelessWidget {
  final List<Map<String, dynamic>> studios;
  final StudioLogoIndex logoIndex;
  final FocusNode? firstFocusNode;
  final void Function(String studioName) onStudioTap;

  const SpotlightStudiosGridSection({
    super.key,
    required this.studios,
    required this.logoIndex,
    required this.onStudioTap,
    this.firstFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    final entries = <({String name, String? logoUrl})>[];
    for (final s in studios) {
      final name = s['Name']?.toString() ?? '';
      if (name.isEmpty) continue;
      entries.add((name: name, logoUrl: studioLogoUrlFor(name, logoIndex)));
    }
    if (entries.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        for (var i = 0; i < entries.length; i++)
          FocusableWrapper(
            focusNode: i == 0 ? firstFocusNode : null,
            onSelect: () => onStudioTap(entries[i].name),
            borderRadius: 12,
            suppressFocusGlow: true,
            autoScroll: true,
            scrollAlignment: 0.5,
            child: Container(
              width: 160,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: AppRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.15),
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: AppRadius.circular(12),
                child: entries[i].logoUrl != null
                    ? OfflineAwareImage(
                        imageUrl: entries[i].logoUrl!,
                        fit: BoxFit.contain,
                        imageBuilder: (context, imageProvider) => Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Image(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                        placeholder: (context, url) =>
                            _StudioNameFallback(name: entries[i].name),
                        errorWidget: (context, url, error) =>
                            _StudioNameFallback(name: entries[i].name),
                      )
                    : _StudioNameFallback(name: entries[i].name),
              ),
            ),
          ),
      ],
    );
  }
}

class _StudioNameFallback extends StatelessWidget {
  final String name;
  const _StudioNameFallback({required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// Chapter grid for the Spotlight section modal: 16:9 thumbnails with the
/// chapter name and timestamp. Selecting a chapter plays from its position.
class SpotlightChaptersGridSection extends StatelessWidget {
  final AggregatedItem item;
  final ImageApi imageApi;
  final FocusNode? firstFocusNode;
  final void Function(Duration position) onChapterTap;

  const SpotlightChaptersGridSection({
    super.key,
    required this.item,
    required this.imageApi,
    required this.onChapterTap,
    this.firstFocusNode,
  });

  String _formatTimestamp(Duration d) {
    final h = d.inHours;
    final m = (d.inMinutes % 60).toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return h > 0 ? '$h:$m:$s' : '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final chapters = item.chapters;
    if (chapters.isEmpty) return const SizedBox.shrink();
    final dpr = MediaQuery.devicePixelRatioOf(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final metrics = spotlightGridMetrics(
          maxWidth: constraints.maxWidth,
          desiredWidth: 220,
          minColumns: 2,
          maxColumns: 5,
          minRunSpacing: 12,
        );
        return Wrap(
          spacing: metrics.spacing,
          runSpacing: metrics.runSpacing,
          children: [
            for (var i = 0; i < chapters.length; i++)
              _cell(context, i, metrics.cellWidth, dpr),
          ],
        );
      },
    );
  }

  Widget _cell(BuildContext context, int index, double cellWidth, double dpr) {
    final chapter = item.chapters[index];
    final name = chapter['Name'] as String? ?? '';
    final ticks = chapter['StartPositionTicks'] as num? ?? 0;
    final position = Duration(microseconds: ticks.toInt() ~/ 10);
    final tag = chapter['ImageTag'] as String?;
    final imageUrl = tag != null
        ? imageApi.getChapterImageUrl(
            item.id,
            index: index,
            maxWidth: (cellWidth * dpr).round(),
            tag: tag,
          )
        : null;
    return SizedBox(
      width: cellWidth,
      child: FocusableWrapper(
        focusNode: index == 0 ? firstFocusNode : null,
        onSelect: () => onChapterTap(position),
        borderRadius: 10,
        autoScroll: true,
        scrollAlignment: 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: AppRadius.circular(10),
                child: imageUrl != null
                    ? OfflineAwareImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const _ChapterImageFallback(),
                      )
                    : const _ChapterImageFallback(),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              _formatTimestamp(position),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChapterImageFallback extends StatelessWidget {
  const _ChapterImageFallback();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withValues(alpha: 0.06),
      child: const Center(
        child: AdaptiveIcon(Icons.bookmark_outline, color: Colors.white38),
      ),
    );
  }
}
