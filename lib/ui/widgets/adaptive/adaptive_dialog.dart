import 'package:flutter/cupertino.dart' show CupertinoDialogAction;
import 'package:flutter/material.dart';

import '../../../util/idiom/app_ui_idiom.dart';

/// Dialog action button that keeps its native look on Apple idioms.
///
/// Pass [focusRingColor] to draw an explicit focus ring, which D-pad users on
/// TV need to see which action they are on, and [backgroundColor] to get a
/// filled button instead of a text one. Callers that pass neither keep the
/// plain [TextButton], so existing dialogs look the same as before.
///
/// [focusNode] lets a caller reach the button's focus after the dialog is up.
/// The Apple idiom has no equivalent and ignores it.
///
/// Pass [solidFocusOn] (the dialog surface colour) for actions laid out by
/// [SlidingFocusActions]: the focused label then switches to a colour that
/// reads on the shared pill sliding behind it.
Widget adaptiveDialogAction({
  required VoidCallback? onPressed,
  required Widget child,
  bool isDefault = false,
  bool isDestructive = false,
  bool autofocus = false,
  FocusNode? focusNode,
  Color? focusRingColor,
  Color? backgroundColor,
  Color? focusedBackgroundColor,
  Color? solidFocusOn,
}) {
  if (AppUiIdiomResolver.isApple) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      isDefaultAction: isDefault,
      isDestructiveAction: isDestructive,
      child: child,
    );
  }

  // Inside [SlidingFocusActions] the focused label switches colour while the
  // shared pill slides behind it, so D-pad users see it at a glance.
  if (solidFocusOn != null) {
    return _SolidFocusAction(
      onPressed: onPressed,
      autofocus: autofocus,
      focusNode: focusNode,
      surface: solidFocusOn,
      child: child,
    );
  }

  if (focusRingColor == null && backgroundColor == null) {
    return TextButton(
      onPressed: onPressed,
      autofocus: autofocus,
      focusNode: focusNode,
      child: child,
    );
  }

  final ring = focusRingColor ?? Colors.white;
  bool focused(Set<WidgetState> states) => states.contains(WidgetState.focused);

  final style = ButtonStyle(
    foregroundColor: const WidgetStatePropertyAll(Colors.white),
    overlayColor: WidgetStateProperty.resolveWith(
      (states) => focused(states) ? ring.withValues(alpha: 0.15) : null,
    ),
    side: WidgetStateProperty.resolveWith(
      (states) => focused(states)
          ? BorderSide(color: ring, width: 2.5)
          : BorderSide.none,
    ),
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );

  if (backgroundColor == null) {
    return TextButton(
      onPressed: onPressed,
      autofocus: autofocus,
      focusNode: focusNode,
      style: style,
      child: child,
    );
  }

  return FilledButton(
    onPressed: onPressed,
    autofocus: autofocus,
    focusNode: focusNode,
    style: style.copyWith(
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => focused(states)
            ? (focusedBackgroundColor ?? backgroundColor)
            : backgroundColor,
      ),
    ),
    child: child,
  );
}

const _slideDuration = Duration(milliseconds: 180);
const _slideCurve = Curves.easeOutCubic;

Color _pillFill(Color surface) =>
    surface.computeLuminance() < 0.5 ? Colors.white : Colors.black;

/// Lays out dialog actions and draws one filled pill behind the focused one.
/// When focus moves the pill slides to the next action instead of each
/// button fading its own background in and out.
class SlidingFocusActions extends StatefulWidget {
  const SlidingFocusActions({
    super.key,
    required this.surface,
    required this.children,
  });

  final Color surface;
  final List<Widget> children;

  @override
  State<SlidingFocusActions> createState() => _SlidingFocusActionsState();
}

class _SlidingFocusActionsState extends State<SlidingFocusActions> {
  final _stackKey = GlobalKey();
  late List<GlobalKey> _keys;
  late List<FocusNode> _nodes;
  Rect? _rect;
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    _createSlots();
  }

  void _createSlots() {
    _keys = List.generate(widget.children.length, (_) => GlobalKey());
    _nodes = List.generate(
      widget.children.length,
      (_) => FocusNode(canRequestFocus: false, skipTraversal: true),
    );
  }

  @override
  void didUpdateWidget(covariant SlidingFocusActions oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.children.length != widget.children.length) {
      for (final n in _nodes) {
        n.dispose();
      }
      _createSlots();
      _rect = null;
      _animate = false;
    }
  }

  @override
  void dispose() {
    for (final n in _nodes) {
      n.dispose();
    }
    super.dispose();
  }

  void _onFocusChange(int index, bool hasFocus) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (!hasFocus) {
        if (_nodes.any((n) => n.hasFocus)) return;
        setState(() {
          _rect = null;
          _animate = false;
        });
        return;
      }
      final stackBox =
          _stackKey.currentContext?.findRenderObject() as RenderBox?;
      final box = _keys[index].currentContext?.findRenderObject() as RenderBox?;
      if (stackBox == null || box == null || !box.hasSize) return;
      final offset = box.localToGlobal(Offset.zero, ancestor: stackBox);
      setState(() {
        _animate = _rect != null;
        _rect = offset & box.size;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final rect = _rect;
    return Stack(
      key: _stackKey,
      clipBehavior: Clip.none,
      children: [
        if (rect != null)
          AnimatedPositioned(
            duration: _animate ? _slideDuration : Duration.zero,
            curve: _slideCurve,
            left: rect.left,
            top: rect.top,
            width: rect.width,
            height: rect.height,
            child: DecoratedBox(
              decoration: ShapeDecoration(
                color: _pillFill(widget.surface),
                shape: const StadiumBorder(),
              ),
            ),
          ),
        OverflowBar(
          alignment: MainAxisAlignment.end,
          overflowAlignment: OverflowBarAlignment.end,
          spacing: 8,
          children: [
            for (var i = 0; i < widget.children.length; i++)
              Focus(
                focusNode: _nodes[i],
                onFocusChange: (f) => _onFocusChange(i, f),
                child: KeyedSubtree(key: _keys[i], child: widget.children[i]),
              ),
          ],
        ),
      ],
    );
  }
}

class _SolidFocusAction extends StatefulWidget {
  const _SolidFocusAction({
    required this.onPressed,
    required this.child,
    required this.autofocus,
    required this.focusNode,
    required this.surface,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool autofocus;
  final FocusNode? focusNode;
  final Color surface;

  @override
  State<_SolidFocusAction> createState() => _SolidFocusActionState();
}

class _SolidFocusActionState extends State<_SolidFocusAction> {
  FocusNode? _ownNode;
  bool _focused = false;

  FocusNode get _node => widget.focusNode ?? (_ownNode ??= FocusNode());

  @override
  void initState() {
    super.initState();
    _node.addListener(_onFocus);
    _focused = _node.hasFocus;
  }

  @override
  void didUpdateWidget(covariant _SolidFocusAction oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      (oldWidget.focusNode ?? _ownNode)?.removeListener(_onFocus);
      _node.addListener(_onFocus);
      _focused = _node.hasFocus;
    }
  }

  @override
  void dispose() {
    _node.removeListener(_onFocus);
    _ownNode?.dispose();
    super.dispose();
  }

  void _onFocus() {
    if (_focused != _node.hasFocus) {
      setState(() => _focused = _node.hasFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    final fill = _pillFill(widget.surface);
    final focusedLabel = fill == Colors.white ? Colors.black : Colors.white;
    final scheme = Theme.of(context).colorScheme;
    final idleLabel = widget.onPressed == null
        ? scheme.onSurface.withValues(alpha: 0.38)
        : scheme.primary;
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(end: _focused ? focusedLabel : idleLabel),
      duration: _slideDuration,
      curve: _slideCurve,
      builder: (context, color, _) => TextButton(
        onPressed: widget.onPressed,
        autofocus: widget.autofocus,
        focusNode: _node,
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(color),
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          side: const WidgetStatePropertyAll(BorderSide.none),
          animationDuration: Duration.zero,
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
