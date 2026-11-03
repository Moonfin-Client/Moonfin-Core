import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/models/aggregated_item.dart';
import '../../util/tv_ui_scale.dart';

final _textShadows = [
  Shadow(blurRadius: 4, color: AppColors.black.withValues(alpha: 0.54)),
];

/// The one line under the classic home info area's title.
class SimpleInfoRow extends StatelessWidget {
  final AggregatedItem item;
  final String? metadataSummary;

  const SimpleInfoRow({super.key, required this.item, this.metadataSummary});

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    final summary = metadataSummary;
    if (summary != null && summary.isNotEmpty) {
      final parts = summary
          .split(' • ')
          .map((part) => part.trim())
          .where((part) => part.isNotEmpty);
      for (final part in parts) {
        children.add(_text(part));
      }
    } else {
      // The season and episode lead the line, since the title band shows the
      // series rather than the episode.
      if (item.type == 'Episode') {
        final lead = episodeLead(item);
        if (lead.isNotEmpty) children.add(_text(lead, lead: true));
      }

      if (item.productionYear != null) {
        children.add(_text(item.productionYear.toString()));
      }

      if (item.officialRating != null) {
        children.add(_pill(item.officialRating!));
      }

      final runtime = item.runtime;
      if (runtime != null && runtime.inMinutes > 0 && item.type != 'Series') {
        final hours = runtime.inHours;
        final minutes = runtime.inMinutes.remainder(60);
        children.add(_text(hours > 0 ? '${hours}h ${minutes}m' : '${minutes}m'));
      }

      final resolution = item.videoResolution;
      if (resolution != null) {
        children.add(_pill(resolution));
      }

      final genres = item.genres;
      if (genres.isNotEmpty) {
        children.add(_text(genres.take(3).join(', ')));
      }
    }

    if (children.isEmpty) return const SizedBox.shrink();

    final separated = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) separated.add(_dot());
      separated.add(children[i]);
    }

    // One line, cut off at the edge rather than wrapped.
    return UnconstrainedBox(
      alignment: AlignmentDirectional.centerStart,
      constrainedAxis: Axis.vertical,
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: separated,
      ),
    );
  }

  /// "S2:E5 - Episode Name", or whichever half the item has.
  static String episodeLead(AggregatedItem item) {
    final s = item.parentIndexNumber;
    final e = item.indexNumber;
    final number = (s != null && e != null) ? 'S$s:E$e' : null;
    final name = item.name.trim();
    return [?number, if (name.isNotEmpty) name].join(' - ');
  }

  Widget _text(String value, {bool lead = false}) {
    return Text(
      value,
      maxLines: 1,
      softWrap: false,
      style: TextStyle(
        fontSize: tvPx(24),
        height: 1.2,
        fontWeight: lead ? FontWeight.w600 : FontWeight.w500,
        color: lead
            ? AppColorScheme.onSurface
            : AppColorScheme.onSurface.withValues(alpha: 0.8),
        shadows: _textShadows,
      ),
    );
  }

  Widget _dot() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: tvPx(12)),
      child: Text(
        '•',
        style: TextStyle(
          fontSize: tvPx(24),
          height: 1.2,
          color: AppColorScheme.onSurface.withValues(alpha: 0.5),
          shadows: _textShadows,
        ),
      ),
    );
  }

  Widget _pill(String label) {
    final borders = ThemeRegistry.active.borders;
    return Container(
      height: tvPx(28),
      padding: EdgeInsets.symmetric(horizontal: tvPx(10)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: borders.chipBackground,
        border: Border.fromBorderSide(borders.chipBorder),
        borderRadius: borders.chipRadius,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: tvPx(20),
          height: 1.2,
          fontWeight: FontWeight.w500,
          color: AppColorScheme.onSurface.withValues(alpha: 0.85),
          shadows: _textShadows,
        ),
      ),
    );
  }
}
