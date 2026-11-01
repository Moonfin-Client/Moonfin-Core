import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'mobile_models.dart';

abstract final class CinemaStyle {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const secondary = Color(0xFF98989F);
  static const red = Color(0xFFE50914);
  static const blue = Color(0xFF0A84FF);

  static TextStyle text(
    MobileCinemaMode mode,
    double size, {
    FontWeight weight = FontWeight.w400,
    Color color = white,
    double? spacing,
    double? height,
  }) => TextStyle(
    fontFamily: mode == MobileCinemaMode.appleTv
        ? '.SF UI Text'
        : 'packages/moonfin_mobile_ui/Barlow',
    fontFamilyFallback: const ['packages/moonfin_mobile_ui/Inter'],
    fontSize: size,
    fontWeight: weight,
    color: color,
    letterSpacing: spacing,
    height: height,
    decoration: TextDecoration.none,
  );
}

enum CinemaGlyph {
  home,
  play,
  plus,
  check,
  search,
  library,
  person,
  download,
  info,
  chevron,
  cast,
  close,
  more,
  back,
  grid,
}

/// Small, purpose-drawn symbols instead of Material's icon font.
class CinemaIcon extends StatelessWidget {
  const CinemaIcon(
    this.glyph, {
    super.key,
    this.size = 24,
    this.color = CinemaStyle.white,
    this.filled = false,
    this.stroke = 1.65,
  });
  final CinemaGlyph glyph;
  final double size, stroke;
  final Color color;
  final bool filled;

  @override
  Widget build(BuildContext context) => ExcludeSemantics(
    child: SizedBox.square(
      dimension: size,
      child: CustomPaint(painter: _SymbolPainter(glyph, color, filled, stroke)),
    ),
  );
}

class _SymbolPainter extends CustomPainter {
  _SymbolPainter(this.glyph, this.color, this.filled, this.stroke);
  final CinemaGlyph glyph;
  final Color color;
  final bool filled;
  final double stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 24, size.height / 24);
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final solid = Paint()..color = color;
    final path = Path();
    switch (glyph) {
      case CinemaGlyph.home:
        path.moveTo(3, 10);
        path.lineTo(12, 2.7);
        path.lineTo(21, 10);
        path.lineTo(21, 21);
        path.lineTo(15, 21);
        path.lineTo(15, 14);
        path.lineTo(9, 14);
        path.lineTo(9, 21);
        path.lineTo(3, 21);
        path.close();
        canvas.drawPath(path, filled ? solid : p);
      case CinemaGlyph.play:
        path.moveTo(7, 3.5);
        path.lineTo(21, 12);
        path.lineTo(7, 20.5);
        path.close();
        canvas.drawPath(path, solid);
      case CinemaGlyph.plus:
        canvas.drawLine(const Offset(12, 4), const Offset(12, 20), p);
        canvas.drawLine(const Offset(4, 12), const Offset(20, 12), p);
      case CinemaGlyph.check:
        path.moveTo(4, 12);
        path.lineTo(9.5, 17.5);
        path.lineTo(20, 6);
        canvas.drawPath(path, p);
      case CinemaGlyph.search:
        canvas.drawCircle(const Offset(10.2, 10.2), 6.8, p);
        canvas.drawLine(const Offset(15.2, 15.2), const Offset(21, 21), p);
      case CinemaGlyph.library:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            const Rect.fromLTWH(3, 7, 18, 14),
            const Radius.circular(2),
          ),
          p,
        );
        canvas.drawLine(const Offset(5, 4), const Offset(19, 4), p);
        canvas.drawLine(const Offset(8, 1.5), const Offset(16, 1.5), p);
        path.moveTo(10, 11);
        path.lineTo(16, 14.5);
        path.lineTo(10, 18);
        path.close();
        canvas.drawPath(path, solid);
      case CinemaGlyph.person:
        canvas.drawCircle(const Offset(12, 7), 4, filled ? solid : p);
        path.moveTo(4, 22);
        path.cubicTo(4, 12, 20, 12, 20, 22);
        path.close();
        canvas.drawPath(path, filled ? solid : p);
      case CinemaGlyph.download:
        path.moveTo(12, 2);
        path.lineTo(12, 16);
        path.moveTo(6, 10);
        path.lineTo(12, 16);
        path.lineTo(18, 10);
        path.moveTo(4, 18);
        path.lineTo(4, 22);
        path.lineTo(20, 22);
        path.lineTo(20, 18);
        canvas.drawPath(path, p);
      case CinemaGlyph.info:
        canvas.drawCircle(const Offset(12, 12), 9.5, p);
        canvas.drawCircle(const Offset(12, 7), 1, solid);
        canvas.drawLine(const Offset(12, 11), const Offset(12, 17), p);
      case CinemaGlyph.chevron:
        path.moveTo(9, 5);
        path.lineTo(16, 12);
        path.lineTo(9, 19);
        canvas.drawPath(path, p);
      case CinemaGlyph.back:
        path.moveTo(15, 4);
        path.lineTo(7, 12);
        path.lineTo(15, 20);
        canvas.drawPath(path, p);
      case CinemaGlyph.close:
        canvas.drawLine(const Offset(6, 6), const Offset(18, 18), p);
        canvas.drawLine(const Offset(18, 6), const Offset(6, 18), p);
      case CinemaGlyph.cast:
        path.moveTo(3, 8);
        path.lineTo(3, 4);
        path.lineTo(22, 4);
        path.lineTo(22, 19);
        path.lineTo(16, 19);
        canvas.drawPath(path, p);
        canvas.drawArc(
          Rect.fromCircle(center: const Offset(2, 22), radius: 11),
          -1.57,
          1.57,
          false,
          p,
        );
        canvas.drawArc(
          Rect.fromCircle(center: const Offset(2, 22), radius: 6.5),
          -1.57,
          1.57,
          false,
          p,
        );
        canvas.drawCircle(const Offset(2, 22), 1.7, solid);
      case CinemaGlyph.more:
        for (final x in [5.0, 12.0, 19.0])
          canvas.drawCircle(Offset(x, 12), 1.5, solid);
      case CinemaGlyph.grid:
        for (final x in [3.0, 14.0]) {
          for (final y in [3.0, 14.0]) {
            canvas.drawRRect(
              RRect.fromRectAndRadius(
                Rect.fromLTWH(x, y, 7, 7),
                const Radius.circular(1),
              ),
              p,
            );
          }
        }
    }
  }

  @override
  bool shouldRepaint(_SymbolPainter old) =>
      old.glyph != glyph ||
      old.color != color ||
      old.filled != filled ||
      old.stroke != stroke;
}

/// Press feedback, focus, keyboard activation and semantics without ink effects.
class CinemaPressable extends StatefulWidget {
  const CinemaPressable({
    super.key,
    required this.child,
    required this.label,
    required this.onPressed,
    this.onLongPress,
    this.selected,
    this.radius = 0,
    this.scale = .98,
    this.preserveChildSemantics = false,
  });
  final Widget child;
  final String label;
  final VoidCallback? onPressed, onLongPress;
  final bool? selected;
  final double radius, scale;
  final bool preserveChildSemantics;
  @override
  State<CinemaPressable> createState() => _CinemaPressableState();
}

class _CinemaPressableState extends State<CinemaPressable> {
  bool _pressed = false, _focused = false;
  void _press(bool value) {
    if (mounted) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: widget.label,
    selected: widget.selected,
    enabled: widget.onPressed != null,
    excludeSemantics: !widget.preserveChildSemantics,
    onTap: widget.onPressed,
    onLongPress: widget.onLongPress,
    child: FocusableActionDetector(
      enabled: widget.onPressed != null,
      mouseCursor: widget.onPressed == null
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      onShowFocusHighlight: (value) => setState(() => _focused = value),
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
      },
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onPressed?.call();
            return null;
          },
        ),
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: widget.onPressed == null ? null : (_) => _press(true),
        onTapCancel: () => _press(false),
        onTapUp: (_) => _press(false),
        onTap: widget.onPressed,
        onLongPress: widget.onLongPress,
        child: AnimatedScale(
          scale: _pressed ? widget.scale : 1,
          duration: MediaQuery.disableAnimationsOf(context)
              ? Duration.zero
              : const Duration(milliseconds: 100),
          child: Opacity(
            opacity: widget.onPressed == null
                ? .45
                : _pressed
                ? .7
                : 1,
            child: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius),
                border: _focused
                    ? Border.all(color: CinemaStyle.white, width: 2)
                    : null,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    ),
  );
}

class CinemaButton extends StatelessWidget {
  const CinemaButton({
    super.key,
    required this.mode,
    required this.label,
    required this.onPressed,
    this.icon,
    this.primary = true,
    this.dark = false,
    this.selected,
  });
  final MobileCinemaMode mode;
  final String label;
  final VoidCallback? onPressed;
  final CinemaGlyph? icon;
  final bool primary, dark;
  final bool? selected;
  @override
  Widget build(BuildContext context) {
    final apple = mode == MobileCinemaMode.appleTv;
    final radius = apple ? 15.0 : 4.0;
    final foreground = primary && !dark ? CinemaStyle.black : CinemaStyle.white;
    return CinemaPressable(
      label: label,
      selected: selected,
      onPressed: onPressed,
      radius: radius,
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
        decoration: BoxDecoration(
          color: primary
              ? dark
                    ? const Color(0xFF262628)
                    : CinemaStyle.white
              : const Color(0xFF343434),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              CinemaIcon(icon!, size: 21, color: foreground),
              const SizedBox(width: 9),
            ],
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: CinemaStyle.text(
                  mode,
                  apple ? 16 : 17,
                  weight: FontWeight.w600,
                  color: foreground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CinemaIconButton extends StatelessWidget {
  const CinemaIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.size = 23,
    this.background,
    this.color = CinemaStyle.white,
  });
  final CinemaGlyph icon;
  final String label;
  final VoidCallback? onPressed;
  final double size;
  final Color? background;
  final Color color;
  @override
  Widget build(BuildContext context) => CinemaPressable(
    label: label,
    onPressed: onPressed,
    radius: 24,
    child: Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(color: background, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: CinemaIcon(icon, size: size, color: color),
    ),
  );
}

Future<T?> showCinemaSheet<T>(
  BuildContext context, {
  required MobileCinemaMode mode,
  required WidgetBuilder builder,
  String label = 'Close',
}) => showGeneralDialog<T>(
  context: context,
  barrierDismissible: true,
  barrierLabel: label,
  barrierColor: const Color(0xAA000000),
  transitionDuration: MediaQuery.disableAnimationsOf(context)
      ? Duration.zero
      : const Duration(milliseconds: 320),
  transitionBuilder: (context, animation, _, child) => SlideTransition(
    position: Tween(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
    child: child,
  ),
  pageBuilder: (context, _, _) => Align(
    alignment: Alignment.bottomCenter,
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 560,
        maxHeight: MediaQuery.sizeOf(context).height * .92,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(mode == MobileCinemaMode.appleTv ? 24 : 12),
        ),
        child: ColoredBox(
          color: mode == MobileCinemaMode.appleTv
              ? const Color(0xFF1C1C1E)
              : const Color(0xFF181818),
          child: DefaultTextStyle(
            style: CinemaStyle.text(mode, 15),
            child: SafeArea(top: false, child: builder(context)),
          ),
        ),
      ),
    ),
  ),
);

Future<void> showCinemaModePicker(
  BuildContext context,
  MobileCinemaMode mode,
  ValueChanged<MobileCinemaMode> onChanged,
) => showCinemaSheet<void>(
  context,
  mode: mode,
  builder: (context) => Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Appearance',
                style: CinemaStyle.text(mode, 27, weight: FontWeight.w700),
              ),
            ),
            CinemaIconButton(
              icon: CinemaGlyph.close,
              label: 'Close',
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        const SizedBox(height: 18),
        for (final value in MobileCinemaMode.values)
          CinemaPressable(
            label: '${value.label} mode',
            selected: value == mode,
            onPressed: () {
              onChanged(value);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 19),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value.label,
                          style: CinemaStyle.text(
                            mode,
                            20,
                            weight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          value == MobileCinemaMode.appleTv
                              ? 'Editorial. Immersive. Unmistakably Apple.'
                              : 'Bold. Personal. Straight into the story.',
                          style: CinemaStyle.text(
                            mode,
                            13,
                            color: CinemaStyle.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (value == mode)
                    CinemaIcon(
                      CinemaGlyph.check,
                      color: mode == MobileCinemaMode.appleTv
                          ? CinemaStyle.blue
                          : CinemaStyle.red,
                    ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 8),
      ],
    ),
  ),
);

enum CinemaDestination { home, library, downloads, search, profile }

class CinemaNavigationBar extends StatelessWidget {
  const CinemaNavigationBar({
    super.key,
    required this.mode,
    required this.selected,
    required this.onSelected,
  });
  final MobileCinemaMode mode;
  final CinemaDestination selected;
  final ValueChanged<CinemaDestination> onSelected;

  Widget _item(CinemaDestination value, CinemaGlyph icon, String label) {
    final active = selected == value;
    final apple = mode == MobileCinemaMode.appleTv;
    final color = active
        ? apple
              ? CinemaStyle.blue
              : CinemaStyle.white
        : const Color(0xFF929296);
    return Expanded(
      child: CinemaPressable(
        label: label,
        selected: active,
        onPressed: () => onSelected(value),
        radius: apple ? 25 : 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!apple && value == CinemaDestination.profile)
                const CinemaAvatar(size: 24)
              else
                CinemaIcon(
                  icon,
                  size: apple ? 23 : 24,
                  filled: active,
                  color: color,
                ),
              const SizedBox(height: 5),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CinemaStyle.text(
                  mode,
                  apple ? 10 : 11,
                  weight: active ? FontWeight.w600 : FontWeight.w400,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (mode == MobileCinemaMode.netflix) {
      return ColoredBox(
        color: const Color(0xFF121212),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              _item(CinemaDestination.home, CinemaGlyph.home, 'Home'),
              _item(CinemaDestination.search, CinemaGlyph.search, 'Search'),
              _item(
                CinemaDestination.downloads,
                CinemaGlyph.download,
                'Downloads',
              ),
              _item(
                CinemaDestination.profile,
                CinemaGlyph.person,
                'My Moonfin',
              ),
            ],
          ),
        ),
      );
    }
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.fromLTRB(16, 6, 16, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(34),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                child: ColoredBox(
                  color: const Color(0xE52B2B2F),
                  child: Row(
                    children: [
                      _item(CinemaDestination.home, CinemaGlyph.home, 'Home'),
                      _item(
                        CinemaDestination.library,
                        CinemaGlyph.library,
                        'Library',
                      ),
                      _item(
                        CinemaDestination.downloads,
                        CinemaGlyph.download,
                        'Downloads',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CinemaIconButton(
            icon: CinemaGlyph.search,
            label: 'Search',
            size: 23,
            color: selected == CinemaDestination.search
                ? CinemaStyle.blue
                : CinemaStyle.white,
            background: const Color(0xE52B2B2F),
            onPressed: () => onSelected(CinemaDestination.search),
          ),
        ],
      ),
    );
  }
}

class CinemaAvatar extends StatelessWidget {
  const CinemaAvatar({super.key, this.size = 32, this.apple = false});
  final double size;
  final bool apple;
  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: apple ? const Color(0xFF3C3C43) : const Color(0xFF326E95),
      borderRadius: BorderRadius.circular(apple ? size / 2 : 4),
    ),
    child: apple
        ? const CinemaIcon(
            CinemaGlyph.person,
            size: 19,
            color: Color(0xFFDDDEE5),
          )
        : CustomPaint(painter: _AvatarPainter()),
  );
}

class _AvatarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 32, size.height / 32);
    final p = Paint()
      ..color = CinemaStyle.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.7
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(const Offset(9, 10), const Offset(9, 13), p);
    canvas.drawLine(const Offset(22, 10), const Offset(22, 13), p);
    canvas.drawArc(const Rect.fromLTWH(7, 12, 18, 10), .2, 2.7, false, p);
  }

  @override
  bool shouldRepaint(_AvatarPainter old) => false;
}
