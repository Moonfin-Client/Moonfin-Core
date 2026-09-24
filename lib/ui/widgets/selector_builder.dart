import 'package:flutter/widgets.dart';

/// Rebuilds only when the value [select] derives from [listenable] changes.
///
/// A ValueListenableBuilder rebuilds on every notification. Where a screen
/// holds one notifier and hundreds of cards each care about one bit of it,
/// that is hundreds of rebuilds per change. This lets each card compute its
/// own bit and rebuild only when that bit flips.
class SelectorBuilder<T> extends StatefulWidget {
  const SelectorBuilder({
    super.key,
    required this.listenable,
    required this.select,
    required this.builder,
  });

  final Listenable listenable;
  final T Function() select;
  final Widget Function(BuildContext context, T value) builder;

  @override
  State<SelectorBuilder<T>> createState() => _SelectorBuilderState<T>();
}

class _SelectorBuilderState<T> extends State<SelectorBuilder<T>> {
  late T _value = widget.select();

  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(_onChanged);
  }

  @override
  void didUpdateWidget(covariant SelectorBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.listenable, widget.listenable)) {
      oldWidget.listenable.removeListener(_onChanged);
      widget.listenable.addListener(_onChanged);
    }
    // The parent rebuilt, so the selector may read differently now.
    _value = widget.select();
  }

  @override
  void dispose() {
    widget.listenable.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    final next = widget.select();
    if (next == _value) return;
    setState(() => _value = next);
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _value);
}
