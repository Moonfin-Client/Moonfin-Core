import 'package:flutter/material.dart';

/// Phone and tablet: the artwork runs edge to edge and the content is anchored
/// to the bottom over it, the way a modern detail screen reads.
class MinimalistPortraitLayout extends StatelessWidget {
  final Widget branding;
  final Widget actions;

  final Widget? ratings;
  final Widget? episodes;

  /// Phone rather than tablet. Tablets have the height for more breathing
  /// room, so only the narrow case tightens up.
  final bool compact;

  const MinimalistPortraitLayout({
    super.key,
    required this.branding,
    required this.actions,
    this.ratings,
    this.episodes,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final gap = compact ? 20.0 : 28.0;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          compact ? 20 : 36,
          24,
          compact ? 20 : 36,
          compact ? 24 : 36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            branding,
            if (ratings != null) ...[
              SizedBox(height: compact ? 10 : 14),
              ratings!,
            ],
            SizedBox(height: gap),
            actions,
            if (episodes != null) ...[
              SizedBox(height: gap),
              episodes!,
            ],
          ],
        ),
      ),
    );
  }
}
