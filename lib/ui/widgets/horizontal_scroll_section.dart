import 'package:flutter/material.dart';

import '../../util/platform_detection.dart';

class HorizontalScrollSection extends StatefulWidget {
  final String title;
  final Widget Function(BuildContext context, ScrollController controller)
  builder;
  final ScrollController? scrollController;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry headerPadding;
  final double contentSpacing;
  final Widget? trailing;
  final bool showControls;
  final VoidCallback? onScrollPastStart;
  final VoidCallback? onScrollPastEnd;

  const HorizontalScrollSection({
    super.key,
    required this.title,
    required this.builder,
    this.scrollController,
    this.titleStyle,
    this.headerPadding = EdgeInsets.zero,
    this.contentSpacing = 12,
    this.trailing,
    this.showControls = true,
    this.onScrollPastStart,
    this.onScrollPastEnd,
  });

  @override
  State<HorizontalScrollSection> createState() =>
      _HorizontalScrollSectionState();
}

class HorizontalScrollControls extends StatelessWidget {
  final ScrollController controller;
  final VoidCallback? onScrollPastStart;
  final VoidCallback? onScrollPastEnd;

  static const _scrollStep = 480.0;
  static const _scrollDuration = Duration(milliseconds: 380);
  static const _scrollCurve = Curves.easeInOut;

  const HorizontalScrollControls({
    super.key,
    required this.controller,
    this.onScrollPastStart,
    this.onScrollPastEnd,
  });

  void _scrollBy(double delta) {
    final target = controller.hasClients
        ? (controller.offset + delta).clamp(
            0.0,
            controller.position.maxScrollExtent,
          )
        : null;
    if (target == null || (target - controller.offset).abs() < 0.5) {
      (delta < 0 ? onScrollPastStart : onScrollPastEnd)?.call();
      return;
    }
    controller.animateTo(
      target,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pointer only, so D-pad and keyboard traversal never stops on them.
    Widget button(IconData icon, double delta) => Focus(
      canRequestFocus: false,
      skipTraversal: true,
      descendantsAreFocusable: false,
      child: IconButton(
        icon: Icon(icon),
        onPressed: () => _scrollBy(delta),
        visualDensity: VisualDensity.compact,
      ),
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        button(Icons.chevron_left, -_scrollStep),
        button(Icons.chevron_right, _scrollStep),
      ],
    );
  }
}

class _HorizontalScrollSectionState extends State<HorizontalScrollSection> {
  late ScrollController _controller;
  late bool _ownsController;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.scrollController == null;
    _controller = widget.scrollController ?? ScrollController();
  }

  @override
  void didUpdateWidget(covariant HorizontalScrollSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController == widget.scrollController) {
      return;
    }

    if (_ownsController) {
      _controller.dispose();
    }
    _ownsController = widget.scrollController == null;
    _controller = widget.scrollController ?? ScrollController();
  }

  @override
  void dispose() {
    if (_ownsController) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasControls =
        widget.showControls && PlatformDetection.useDesktopUi;
    final hasHeader =
        widget.title.isNotEmpty || widget.trailing != null || hasControls;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasHeader)
          Padding(
            padding: widget.headerPadding,
            child: Row(
              children: [
                if (widget.title.isEmpty)
                  const Spacer()
                else
                  Expanded(
                    child: Text(
                      widget.title,
                      style: widget.titleStyle ??
                          Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                if (widget.trailing != null) widget.trailing!,
                // Hidden rather than left out, so a section without them keeps
                // the same header height and its row starts as far under the
                // title as every other section's.
                if (PlatformDetection.useDesktopUi)
                  Visibility(
                    visible: hasControls,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: HorizontalScrollControls(
                      controller: _controller,
                      onScrollPastStart: widget.onScrollPastStart,
                      onScrollPastEnd: widget.onScrollPastEnd,
                    ),
                  ),
              ],
            ),
          ),
        if (hasHeader && widget.contentSpacing > 0)
          SizedBox(height: widget.contentSpacing),
        widget.builder(context, _controller),
      ],
    );
  }
}