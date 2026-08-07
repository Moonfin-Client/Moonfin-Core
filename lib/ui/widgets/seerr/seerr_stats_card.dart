import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';

/// "1h 47m", or just the minutes for anything under an hour.
String seerrFormatRuntime(int minutes) {
  if (minutes < 60) return '${minutes}m';
  final h = minutes ~/ 60;
  final m = minutes % 60;
  return m > 0 ? '${h}h ${m}m' : '${h}h';
}

/// The facts Seerr knows about a title that the library does not: its TMDB
/// score, where production stands, and the money behind it.
class SeerrStatsCard extends StatelessWidget {
  final SeerrMediaDetailState state;

  const SeerrStatsCard({super.key, required this.state});

  /// Whether the card would draw anything, so a caller can drop the spacing
  /// around it too.
  static bool hasContent(SeerrMediaDetailState state, AppLocalizations l10n) =>
      _facts(state, l10n).isNotEmpty;

  static List<_StatRow> _facts(
    SeerrMediaDetailState s,
    AppLocalizations l10n,
  ) {
    final rows = <_StatRow>[];
    if (s.voteAverage != null && s.voteAverage! > 0) {
      rows.add(_StatRow(l10n.tmdbScore, '${(s.voteAverage! * 10).round()}%'));
    }
    final statusText = s.isMovie ? s.movie?.status : s.tv?.status;
    if (statusText != null) {
      rows.add(_StatRow(l10n.status, statusText));
    }
    if (s.isMovie) {
      final dateLabel = _formatDate(s.releaseDate);
      if (dateLabel != null) {
        rows.add(_StatRow(l10n.releaseDateLabel, dateLabel));
      }
    } else {
      final dateLabel = _formatDate(s.firstAirDate);
      if (dateLabel != null) {
        rows.add(_StatRow(l10n.firstAirDateLabel, dateLabel));
      }
    }

    if (s.budget != null && s.budget! > 0) {
      rows.add(_StatRow(l10n.budgetLabel, _formatMoneyFull(s.budget!)));
    }
    if (s.revenue != null && s.revenue! > 0) {
      rows.add(_StatRow(l10n.revenueLabel, _formatMoneyFull(s.revenue!)));
    }
    if (s.runtime != null && s.runtime! > 0) {
      rows.add(_StatRow(l10n.runtimeLabel, seerrFormatRuntime(s.runtime!)));
    }

    if (s.isTv) {
      if (s.numberOfSeasons != null && s.numberOfSeasons! > 0) {
        rows.add(_StatRow(l10n.seasonsLabel, s.numberOfSeasons.toString()));
      }
      if (s.numberOfEpisodes != null && s.numberOfEpisodes! > 0) {
        rows.add(_StatRow(l10n.episodesLabel, s.numberOfEpisodes.toString()));
      }
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final rows = _facts(state, AppLocalizations.of(context));
    if (rows.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 540;

        if (isWide) {
          final gridRows = <List<_StatRow>>[];
          for (var i = 0; i < rows.length; i += 3) {
            gridRows.add(rows.sublist(i, (i + 3).clamp(0, rows.length)));
          }

          return Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: AppRadius.circular(10),
              border: Border.fromBorderSide(
                ThemeRegistry.active.borders.cardBorder,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Column(
              children: [
                for (var r = 0; r < gridRows.length; r++) ...[
                  if (r > 0)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.white10,
                      ),
                    ),
                  Row(
                    children: [
                      for (var c = 0; c < 3; c++) ...[
                        if (c > 0)
                          Container(
                            height: 32,
                            width: 1,
                            color: Colors.white10,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                        Expanded(
                          child: c < gridRows[r].length
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      gridRows[r][c].label,
                                      style: const TextStyle(
                                        color: Colors.white60,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      gridRows[r][c].value,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          );
        }

        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.06),
            borderRadius: AppRadius.circular(10),
            border: Border.fromBorderSide(
              ThemeRegistry.active.borders.cardBorder,
            ),
          ),
          child: Column(
            children: [
              for (var i = 0; i < rows.length; i++) ...[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          rows[i].label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        rows[i].value,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                if (i < rows.length - 1)
                  const Divider(height: 1, thickness: 1, color: Colors.white10),
              ],
            ],
          ),
        );
      },
    );
  }

  static String? _formatDate(String? iso) {
    if (iso == null || iso.length < 10) return null;
    try {
      final d = DateTime.parse(iso);
      const months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ];
      return '${months[d.month - 1]} ${d.day}, ${d.year}';
    } catch (_) {
      return iso;
    }
  }

  static String _formatMoneyFull(int amount) {
    final s = amount.toString();
    final buf = StringBuffer(r'$');
    final start = s.length % 3;
    for (var i = 0; i < s.length; i++) {
      if (i != 0 && (i - start) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    buf.write('.00');
    return buf.toString();
  }
}

class _StatRow {
  final String label;
  final String value;
  const _StatRow(this.label, this.value);
}
