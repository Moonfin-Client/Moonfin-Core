import 'package:flutter/services.dart';

extension KeyEventActionable on KeyEvent {
  bool get isActionable => this is KeyDownEvent || this is KeyRepeatEvent;
}

bool isActivateKey(KeyEvent event) =>
    event is KeyDownEvent && _selectKeys.contains(event.logicalKey);

final Set<LogicalKeyboardKey> _selectKeys = <LogicalKeyboardKey>{
  LogicalKeyboardKey.select,
  LogicalKeyboardKey.enter,
  LogicalKeyboardKey.numpadEnter,
  LogicalKeyboardKey.gameButtonA,
  LogicalKeyboardKey.accept,
  LogicalKeyboardKey.space,
};

final Set<LogicalKeyboardKey> _backKeys = <LogicalKeyboardKey>{
  LogicalKeyboardKey.escape,
  LogicalKeyboardKey.goBack,
  LogicalKeyboardKey.browserBack,
  LogicalKeyboardKey.gameButtonB,
  LogicalKeyboardKey.backspace,
};

final Set<LogicalKeyboardKey> _contextMenuKeys = <LogicalKeyboardKey>{
  LogicalKeyboardKey.contextMenu,
  LogicalKeyboardKey.gameButtonX,
};

/// The transport keys a TV remote offers for paging a list or grid.
final Set<LogicalKeyboardKey> _pageForwardKeys = <LogicalKeyboardKey>{
  LogicalKeyboardKey.mediaFastForward,
  LogicalKeyboardKey.mediaTrackNext,
  LogicalKeyboardKey.pageDown,
};

final Set<LogicalKeyboardKey> _pageBackKeys = <LogicalKeyboardKey>{
  LogicalKeyboardKey.mediaRewind,
  LogicalKeyboardKey.mediaTrackPrevious,
  LogicalKeyboardKey.pageUp,
};

extension DpadKeyExtension on LogicalKeyboardKey {
  bool get isUpKey => this == LogicalKeyboardKey.arrowUp;
  bool get isDownKey => this == LogicalKeyboardKey.arrowDown;
  bool get isLeftKey => this == LogicalKeyboardKey.arrowLeft;
  bool get isRightKey => this == LogicalKeyboardKey.arrowRight;
  bool get isSelectKey => _selectKeys.contains(this);
  bool get isBackKey => _backKeys.contains(this);
  bool get isContextMenuKey => _contextMenuKeys.contains(this);
  bool get isDirectional => isUpKey || isDownKey || isLeftKey || isRightKey;

  /// 1 pages a viewport forward, -1 back, 0 when the key doesn't page.
  int get pageDirection {
    if (_pageForwardKeys.contains(this)) return 1;
    if (_pageBackKeys.contains(this)) return -1;
    return 0;
  }
}
