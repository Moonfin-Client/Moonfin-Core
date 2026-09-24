import 'package:flutter/widgets.dart';

/// Focus nodes handed out by position and thrown away together.
///
/// A list that rebuilds under the viewer still wants the node at a position to
/// be the same node, so focus stays where it was. Keeping them in one bag means
/// the owner disposes a single thing rather than remembering every map.
class IndexedFocusNodes {
  IndexedFocusNodes(this.debugLabel);

  final String debugLabel;
  final _nodes = <int, FocusNode>{};

  FocusNode operator [](int index) => _nodes.putIfAbsent(
    index,
    () => FocusNode(debugLabel: '$debugLabel:$index'),
  );

  void dispose() {
    for (final node in _nodes.values) {
      node.dispose();
    }
    _nodes.clear();
  }
}
