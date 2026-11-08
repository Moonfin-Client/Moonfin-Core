import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../l10n/app_localizations.dart';
import 'after_hours_canvas.dart';
import 'after_hours_scores.dart';

TextStyle ahDisplay(double size, {Color color = K.ink}) => TextStyle(
  fontFamily: arcadeDisplayFont,
  fontSize: size,
  height: .9,
  color: color,
);

TextStyle ahMono(
  double size, {
  Color color = K.ink,
  FontWeight weight = FontWeight.w700,
  double spacing = 0,
}) => TextStyle(
  fontFamily: arcadeMonoFont,
  fontSize: size,
  fontWeight: weight,
  color: color,
  letterSpacing: spacing,
);

class AhKicker extends StatelessWidget {
  const AhKicker(this.text, {super.key, this.color = K.muted, this.size = 12});

  final String text;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Text(
    text.toUpperCase(),
    style: ahMono(size, color: color, spacing: size * .14),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

String formatScore(BuildContext context, int score) =>
    NumberFormat.decimalPattern(Localizations.localeOf(context).toLanguageTag())
        .format(score);

class AhKey extends StatelessWidget {
  const AhKey(this.label, {super.key, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(7, 2, 7, 2),
    decoration: const BoxDecoration(
      color: K.panel2,
      borderRadius: BorderRadius.all(Radius.circular(6)),
      border: Border(
        top: BorderSide(color: K.line),
        left: BorderSide(color: K.line),
        right: BorderSide(color: K.line),
        bottom: BorderSide(color: K.line, width: 3),
      ),
    ),
    child: icon == null
        ? Text(label, style: ahMono(12))
        : Icon(icon, size: 15, color: K.ink),
  );
}

class AhKeyHint extends StatelessWidget {
  const AhKeyHint(this.keyLabel, this.action, {super.key, this.icon});

  final String keyLabel;
  final String action;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      AhKey(keyLabel, icon: icon),
      const SizedBox(width: 6),
      Text(
        action,
        style: const TextStyle(fontSize: 15, color: K.muted),
      ),
    ],
  );
}

class _Tag extends StatelessWidget {
  const _Tag(this.text, this.color);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 7),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(text, style: ahMono(9, color: K.night)),
  );
}

class AhBoard extends StatelessWidget {
  const AhBoard({
    super.key,
    required this.rows,
    required this.scores,
    this.fresh,
    this.fontSize = 16,
  });

  final List<ArcadeScore> rows;
  final AfterHoursScores scores;

  /// The place, from 1, of the run that just made the board.
  final int? fresh;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (rows.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          l10n.afterHoursNoScores,
          style: TextStyle(fontSize: fontSize - 2, color: K.muted),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < rows.length; i++) _row(context, l10n, i, rows[i]),
      ],
    );
  }

  Widget _row(
    BuildContext context,
    AppLocalizations l10n,
    int i,
    ArcadeScore row,
  ) {
    final me = scores.isViewer(row.userName);
    return Container(
      padding: EdgeInsets.symmetric(vertical: fontSize * .35, horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: me
            ? const LinearGradient(
                colors: [
                  Color.fromRGBO(255, 201, 74, .18),
                  Color.fromRGBO(255, 201, 74, 0),
                ],
              )
            : null,
        border: i == 0 ? null : const Border(top: BorderSide(color: K.line)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: fontSize * 1.5,
            child: Text(
              '${i + 1}',
              style: ahDisplay(fontSize * 1.5, color: K.gold),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    row.userName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w700,
                      color: K.ink,
                    ),
                  ),
                ),
                if (me) _Tag(l10n.chatYou.toUpperCase(), K.gold),
                if (fresh == i + 1) _Tag(l10n.afterHoursNewTag, K.mint),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(formatScore(context, row.score), style: ahMono(fontSize - 1)),
        ],
      ),
    );
  }
}

class AhPanel extends StatelessWidget {
  const AhPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 12, 16, 6),
    this.radius = 14,
    this.opacity = .88,
  });

  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final double opacity;

  @override
  Widget build(BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      color: Color.fromRGBO(21, 18, 49, opacity),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: K.line),
    ),
    child: child,
  );
}

/// A button that is gold while focused, for menus driven by an index.
class AhButton extends StatelessWidget {
  const AhButton({
    super.key,
    required this.label,
    required this.focused,
    required this.onTap,
    this.onHover,
    this.fontSize = 17,
    this.expand = false,
  });

  final String label;
  final bool focused;
  final VoidCallback onTap;
  final VoidCallback? onHover;
  final double fontSize;
  final bool expand;

  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: onHover == null ? null : (_) => onHover!(),
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: EdgeInsets.symmetric(
          horizontal: fontSize * 1.18,
          vertical: fontSize * .7,
        ),
        decoration: BoxDecoration(
          color: focused ? K.gold : K.panel2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: focused ? K.gold : K.line),
        ),
        child: Text(
          label,
          textAlign: expand ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: focused ? K.night : K.ink,
          ),
        ),
      ),
    ),
  );
}

/// Lays [child] out at a fixed design size and scales it to fit.
class AhDesignBox extends StatelessWidget {
  const AhDesignBox({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  final double width;
  final double height;
  final Widget child;

  // Expanding first gives the FittedBox tight constraints, without which it
  // never scales up past the design size on a bigger desktop window.
  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: FittedBox(
      child: SizedBox(width: width, height: height, child: child),
    ),
  );
}

/// A game sprite on a panel tile, drawn in a 44 px box at [scale] and nudged
/// by [dx] and [dy].
class AhCastIcon extends StatelessWidget {
  const AhCastIcon({
    super.key,
    required this.sprite,
    required this.scale,
    this.dx = 0,
    this.dy = 0,
    this.size = 44,
  });

  final String sprite;
  final double scale, dx, dy, size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: K.panel,
      borderRadius: BorderRadius.circular(size * .23),
    ),
    child: CustomPaint(painter: _CastPainter(this)),
  );
}

class _CastPainter extends CustomPainter {
  _CastPainter(this.icon);

  final AhCastIcon icon;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Ctx(canvas);
    c.save();
    c.scale(size.width / 44, size.height / 44);
    c.translate(22 + icon.dx, 22 + icon.dy);
    c.scale(icon.scale, icon.scale);
    sprites[icon.sprite]!(c, .35);
    c.restore();
  }

  @override
  bool shouldRepaint(_CastPainter old) => old.icon.sprite != icon.sprite;
}
