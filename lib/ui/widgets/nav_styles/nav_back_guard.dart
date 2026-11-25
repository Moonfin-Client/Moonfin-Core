import 'package:flutter/widgets.dart';

import '../overlay_sheet.dart';

/// Lets an open nav overlay, like the Atlas panel or an open Reel or Mosaic,
/// take Back before the route does.
///
/// The interceptor asks its newest handler first, so this one only joins
/// while the overlay is open, which puts it ahead of anything the screen
/// registered earlier, like Home's return to the top.
class NavBackGuard extends StatefulWidget {
  const NavBackGuard({
    super.key,
    required this.open,
    required this.onClose,
    required this.child,
  });

  final bool open;
  final VoidCallback onClose;
  final Widget child;

  @override
  State<NavBackGuard> createState() => _NavBackGuardState();
}

class _NavBackGuardState extends State<NavBackGuard> {
  bool _registered = false;

  @override
  void initState() {
    super.initState();
    _sync();
  }

  @override
  void didUpdateWidget(NavBackGuard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _sync();
  }

  @override
  void dispose() {
    if (_registered) InlineBackInterceptor.remove(_onBack);
    super.dispose();
  }

  void _sync() {
    if (widget.open && !_registered) {
      InlineBackInterceptor.push(_onBack);
      _registered = true;
    } else if (!widget.open && _registered) {
      InlineBackInterceptor.remove(_onBack);
      _registered = false;
    }
  }

  bool _onBack() {
    if (!mounted || !widget.open) return false;
    widget.onClose();
    return true;
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
