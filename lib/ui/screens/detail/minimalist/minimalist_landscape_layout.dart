import 'package:flutter/material.dart';

/// TV and desktop: the title and buttons sit low on the left over the artwork,
/// with the episodes along the bottom. Nothing competes with them for the
/// upper half, which is where the picture is.
class MinimalistLandscapeLayout extends StatelessWidget {
  /// The share of the column the episodes may take.
  ///
  /// The title and the buttons are the fixed part and the rail is what gives,
  /// so the rail gets a ceiling rather than what it likes. Without one it
  /// grows past the room below and the title block, which sits in an [Align]
  /// that doesn't clip, paints straight over the season tabs.
  static const double _kEpisodesShare = 0.46;

  /// Below this the designed gaps are a real share of the screen, so they
  /// tighten along with everything else.
  static const double _kShortCanvas = 640;

  final Widget branding;
  final Widget actions;

  final Widget? ratings;

  /// Built against the height it's allowed, which the layout only knows once
  /// it has its own constraints.
  final Widget Function(double maxHeight)? episodes;

  /// Sits opposite the title, in the space the artwork was using. An episode
  /// puts its own still here, since the backdrop behind is the whole show and
  /// says nothing about which part of it you're on.
  final Widget? aside;

  const MinimalistLandscapeLayout({
    super.key,
    required this.branding,
    required this.actions,
    this.ratings,
    this.episodes,
    this.aside,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final short =
              constraints.hasBoundedHeight &&
              constraints.maxHeight < _kShortCanvas;
          final brandingToActions = short ? 16.0 : 26.0;
          final contentToEpisodes = short ? 20.0 : 34.0;
          final padding = EdgeInsets.fromLTRB(56, short ? 24 : 40, 56, 44);

          // An unbounded column carries its infinity through, which the rail
          // reads as no ceiling at all.
          final column = constraints.hasBoundedHeight
              ? constraints.maxHeight - padding.vertical
              : double.infinity;
          final episodesBox = episodes?.call(
            (column - contentToEpisodes) * _kEpisodesShare,
          );

          const measure = BoxConstraints(maxWidth: 760);
          final content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(constraints: measure, child: branding),
              if (ratings != null) ...[
                SizedBox(height: short ? 10 : 14),
                ratings!,
              ],
              SizedBox(height: brandingToActions),
              ConstrainedBox(constraints: measure, child: actions),
            ],
          );

          return Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: content,
                        ),
                      ),
                      if (aside != null) ...[
                        const SizedBox(width: 48),
                        Align(alignment: Alignment.bottomRight, child: aside!),
                      ],
                    ],
                  ),
                ),
                if (episodesBox != null) ...[
                  SizedBox(height: contentToEpisodes),
                  episodesBox,
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
