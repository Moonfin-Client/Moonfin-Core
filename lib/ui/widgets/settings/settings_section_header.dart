import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Section header above a group of settings. Public so both the side-panel
/// part files and the standalone settings screens share one header.
class SettingsSectionHeader extends StatelessWidget {
  final String text;

  const SettingsSectionHeader(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

/// The text of the nearest [SettingsSectionHeader] above [context] in its
/// list, or null when nothing heads it.
String? settingsSectionAbove(BuildContext context) {
  Element? list;
  context.visitAncestorElements((element) {
    if (element.widget is! SliverMultiBoxAdaptorWidget) return true;
    list = element;
    return false;
  });
  final sliver = list;
  if (sliver == null) return null;

  // The sliver visits its children in list order, so the last header seen
  // before the tile is the one above it.
  String? header;
  var reached = false;
  void visit(Element element) {
    if (reached) return;
    if (identical(element, context)) {
      reached = true;
      return;
    }
    final widget = element.widget;
    if (widget is SettingsSectionHeader) header = widget.text;
    element.visitChildren(visit);
  }

  sliver.visitChildren(visit);
  if (header != null || !reached) return header;

  // A long section can scroll its header far enough up that the list has
  // dropped it, so look through the children it hasn't built.
  final delegate = (sliver.widget as SliverMultiBoxAdaptorWidget).delegate;
  final first = (sliver.renderObject as RenderSliverMultiBoxAdaptor).firstChild;
  if (delegate is! SliverChildListDelegate || first == null) return null;
  final firstBuilt = (first.parentData! as SliverMultiBoxAdaptorParentData)
      .index!;
  for (var i = firstBuilt - 1; i >= 0; i--) {
    final widget = delegate.children[i];
    if (widget is SettingsSectionHeader) return widget.text;
  }
  return null;
}
