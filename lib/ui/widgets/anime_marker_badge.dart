import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/repositories/anime_marker_repository.dart';
import '../../l10n/app_localizations.dart';

/// A badge for an episode card, shown only when there is something worth flagging:
/// filler, mixed canon and filler, or a recap. Anything else draws nothing at all, so a
/// mixed library of anime and ordinary shows is untouched outside the anime that matched.
class AnimeMarkerBadge extends StatefulWidget {
  final String? seriesId;
  final String episodeId;

  /// Scales with the surrounding card so the pills do not dominate on TV.
  final double scale;

  /// Applied only when a pill actually draws, so a card with no marker keeps the
  /// spacing it had before.
  final EdgeInsetsGeometry padding;

  /// The placement this badge stands in. A badge whose slot the server did not pick
  /// draws nothing, which lets one card offer several slots and let the server choose.
  final AnimeMarkerPlacement? slot;

  /// Solid pills with white text, for when the badge sits over artwork.
  final bool filled;

  /// Drawn whether or not a pill resolves, so a card can keep something in the corner
  /// while the marker is still on its way.
  final Widget? leading;

  const AnimeMarkerBadge({
    super.key,
    required this.seriesId,
    required this.episodeId,
    this.scale = 1.0,
    this.padding = EdgeInsets.zero,
    this.slot,
    this.filled = false,
    this.leading,
  });

  @override
  State<AnimeMarkerBadge> createState() => _AnimeMarkerBadgeState();
}

class _AnimeMarkerBadgeState extends State<AnimeMarkerBadge> {
  AnimeEpisodeMarker? _marker;
  bool _pending = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(AnimeMarkerBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Episode cards are recycled while scrolling, so a new episode in the same widget
    // slot has to drop the previous episode's pill.
    if (oldWidget.episodeId != widget.episodeId ||
        oldWidget.seriesId != widget.seriesId) {
      _marker = null;
      _pending = false;
      _load();
    }
  }

  Future<void> _load() async {
    final seriesId = widget.seriesId;
    if (seriesId == null || seriesId.isEmpty) return;
    if (!GetIt.instance.isRegistered<AnimeMarkerRepository>()) return;

    final repository = GetIt.instance<AnimeMarkerRepository>();

    final cached = repository.peek(
      seriesId: seriesId,
      episodeId: widget.episodeId,
    );
    if (cached != null) {
      _marker = cached;
      return;
    }

    // Already looked up and this episode carries no marker, or the plugin isnt there.
    if (repository.isResolved(seriesId)) {
      _pending = repository.isPending(seriesId);
      return;
    }

    await repository.getForSeries(seriesId);
    if (!mounted) return;

    // Read back through peek so id normalisation stays in the repository.
    final resolved = repository.peek(
      seriesId: seriesId,
      episodeId: widget.episodeId,
    );
    if (resolved == null) {
      if (repository.isPending(seriesId)) {
        setState(() => _pending = true);
      }
      return;
    }

    setState(() => _marker = resolved);
  }

  @override
  Widget build(BuildContext context) {
    // Standing in a slot the server did not choose. Any leading widget still belongs on
    // screen, only the pills move elsewhere.
    if (widget.slot != null &&
        GetIt.instance.isRegistered<AnimeMarkerRepository>() &&
        GetIt.instance<AnimeMarkerRepository>().placement != widget.slot) {
      return widget.leading ?? const SizedBox.shrink();
    }

    final l10n = AppLocalizations.of(context);
    final scale = widget.scale;
    final marker = _marker;

    if (marker == null || !marker.isNoteworthy) {
      // The server knows this show but hasnt fetched its table yet, so the markers really
      // are coming. A series that matched nothing isnt pending and stays quiet.
      if (_pending) {
        return Padding(
          padding: widget.padding,
          child: _Pill(
            label: l10n.animeMarkerPending,
            color: const Color(0xFF8B949E),
            scale: scale,
          ),
        );
      }

      return widget.leading ?? const SizedBox.shrink();
    }

    final pills = <Widget>[
      if (marker.kind case final kind?)
        switch (kind) {
          AnimeEpisodeKind.filler => _Pill(
            label: l10n.animeMarkerFiller,
            color: const Color(0xFFE53935),
            scale: scale,
            filled: widget.filled,
          ),
          AnimeEpisodeKind.mixed => _Pill(
            label: l10n.animeMarkerMixed,
            color: const Color(0xFFD29922),
            scale: scale,
            filled: widget.filled,
          ),
          AnimeEpisodeKind.animeCanon => _Pill(
            label: l10n.animeMarkerAnimeCanon,
            color: const Color(0xFF3FB950),
            scale: scale,
            filled: widget.filled,
          ),
          AnimeEpisodeKind.mangaCanon => _Pill(
            label: l10n.animeMarkerMangaCanon,
            color: const Color(0xFF58A6FF),
            scale: scale,
            filled: widget.filled,
          ),
        },
      if (marker.recap)
        _Pill(
          label: l10n.animeMarkerRecap,
          color: const Color(0xFFFFA726),
          scale: scale,
          filled: widget.filled,
        ),
      if (marker.audio case final audio?)
        animeAudioPill(l10n, audio, scale, filled: widget.filled),
    ];

    return Padding(
      padding: widget.padding,
      child: Wrap(
        spacing: 4 * scale,
        runSpacing: 2 * scale,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [?widget.leading, ...pills],
      ),
    );
  }
}

/// The subbed/dubbed pill, shared by the episode badge and the season badge.
Widget animeAudioPill(
  AppLocalizations l10n,
  AnimeAudioKind audio,
  double scale, {
  bool filled = false,
}) {
  return switch (audio) {
    AnimeAudioKind.subbed => _Pill(
      label: l10n.animeMarkerSubbed,
      color: const Color(0xFF1F6FEB),
      scale: scale,
      filled: filled,
    ),
    AnimeAudioKind.dubbed => _Pill(
      label: l10n.animeMarkerDubbed,
      color: const Color(0xFF238636),
      scale: scale,
      filled: filled,
    ),
    AnimeAudioKind.subbedAndDubbed => _Pill(
      label: l10n.animeMarkerSubbedAndDubbed,
      color: const Color(0xFF8957E5),
      scale: scale,
      filled: filled,
    ),
  };
}

/// A subbed/dubbed pill for a whole season, for the season list.
///
/// Shows nothing unless every episode in the season agreed, so a season holding both a
/// dub and a sub stays blank.
class AnimeSeasonAudioBadge extends StatefulWidget {
  final String? seriesId;
  final String seasonId;
  final double scale;

  const AnimeSeasonAudioBadge({
    super.key,
    required this.seriesId,
    required this.seasonId,
    this.scale = 1.0,
  });

  @override
  State<AnimeSeasonAudioBadge> createState() => _AnimeSeasonAudioBadgeState();
}

class _AnimeSeasonAudioBadgeState extends State<AnimeSeasonAudioBadge> {
  AnimeAudioKind? _audio;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(AnimeSeasonAudioBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.seasonId != widget.seasonId ||
        oldWidget.seriesId != widget.seriesId) {
      _audio = null;
      _load();
    }
  }

  Future<void> _load() async {
    final seriesId = widget.seriesId;
    if (seriesId == null || seriesId.isEmpty) return;
    if (!GetIt.instance.isRegistered<AnimeMarkerRepository>()) return;

    final repository = GetIt.instance<AnimeMarkerRepository>();

    final cached = repository.peekSeason(
      seriesId: seriesId,
      seasonId: widget.seasonId,
    );
    if (cached != null) {
      _audio = cached;
      return;
    }

    if (repository.isResolved(seriesId)) return;

    await repository.getForSeries(seriesId);
    if (!mounted) return;

    final resolved = repository.peekSeason(
      seriesId: seriesId,
      seasonId: widget.seasonId,
    );
    if (resolved == null) return;

    setState(() => _audio = resolved);
  }

  @override
  Widget build(BuildContext context) {
    final audio = _audio;
    if (audio == null) return const SizedBox.shrink();

    return animeAudioPill(
      AppLocalizations.of(context),
      audio,
      widget.scale,
      filled: true,
    );
  }
}

/// A subbed/dubbed pill for a standalone item, for movie cards and home screen rows.
class AnimeItemAudioBadge extends StatefulWidget {
  final String itemId;
  final double scale;

  /// Solid fill, for when the pill sits on top of artwork.
  final bool filled;

  const AnimeItemAudioBadge({
    super.key,
    required this.itemId,
    this.scale = 1.0,
    this.filled = true,
  });

  @override
  State<AnimeItemAudioBadge> createState() => _AnimeItemAudioBadgeState();
}

class _AnimeItemAudioBadgeState extends State<AnimeItemAudioBadge> {
  AnimeAudioKind? _audio;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(AnimeItemAudioBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.itemId != widget.itemId) {
      _audio = null;
      _load();
    }
  }

  Future<void> _load() async {
    if (widget.itemId.isEmpty) return;
    if (!GetIt.instance.isRegistered<AnimeMarkerRepository>()) return;

    final repository = GetIt.instance<AnimeMarkerRepository>();

    if (repository.isItemResolved(widget.itemId)) {
      _audio = repository.peekItem(widget.itemId);
      return;
    }

    final resolved = await repository.getForItem(widget.itemId);
    if (!mounted || resolved == null) return;

    setState(() => _audio = resolved);
  }

  @override
  Widget build(BuildContext context) {
    final audio = _audio;
    if (audio == null) return const SizedBox.shrink();

    return animeAudioPill(
      AppLocalizations.of(context),
      audio,
      widget.scale,
      filled: widget.filled,
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final Color color;
  final double scale;

  /// Outlined for a pill on a plain background, filled for one sitting over artwork.
  final bool filled;

  const _Pill({
    required this.label,
    required this.color,
    required this.scale,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6 * scale, vertical: 2 * scale),
      decoration: BoxDecoration(
        color: filled ? color : color.withValues(alpha: 0.18),
        borderRadius: AppRadius.circular(4 * scale),
        border: filled
            ? null
            : Border.all(color: color.withValues(alpha: 0.7), width: 1),
        boxShadow: filled
            ? [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.35),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: filled ? Colors.white : color,
          fontSize: 10 * scale,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
