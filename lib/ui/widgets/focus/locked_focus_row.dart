import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/key_event_utils.dart';
import '../../../util/focus/scroll_utils.dart';
import 'hub_focus_memory.dart';

const _kSelectLongPressDuration = Duration(milliseconds: 500);

typedef LockedFocusItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  int index,
  bool isFocused,
);

typedef LockedFocusVerticalNav = bool Function(bool isUp);

class LockedFocusRow<T> extends StatefulWidget {
  final List<T> items;
  final String hubKey;
  final double itemExtent;
  final double leadingPadding;
  final double itemSpacing;
  final ScrollController? controller;
  final FocusNode? focusNode;
  final LockedFocusItemBuilder<T> itemBuilder;
  final void Function(int index, T item)? onTap;
  final void Function(int index, T item)? onLongPress;
  final void Function(int index, T item)? onIndexChanged;
  final ValueChanged<bool>? onFocusChange;
  final LockedFocusVerticalNav? onVerticalNavigation;
  final VoidCallback? onBack;
  final VoidCallback? onLeftEdge;
  final VoidCallback? onRightEdge;
  final EdgeInsets padding;
  final double height;
  final bool autofocus;
  final Clip clipBehavior;

  const LockedFocusRow({
    super.key,
    required this.items,
    required this.hubKey,
    required this.itemExtent,
    required this.itemBuilder,
    required this.height,
    this.leadingPadding = 0,
    this.itemSpacing = 0,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onLongPress,
    this.onIndexChanged,
    this.onFocusChange,
    this.onVerticalNavigation,
    this.onBack,
    this.onLeftEdge,
    this.onRightEdge,
    this.padding = EdgeInsets.zero,
    this.autofocus = false,
    this.clipBehavior = Clip.hardEdge,
  });

  @override
  State<LockedFocusRow<T>> createState() => LockedFocusRowState<T>();
}

class LockedFocusRowState<T> extends State<LockedFocusRow<T>> {
  late FocusNode _focusNode;
  bool _ownsFocusNode = false;
  late ScrollController _scrollController;
  bool _ownsScrollController = false;
  List<GlobalKey> _itemKeys = const [];
  int _focusedIndex = 0;
  bool _hasRowFocus = false;
  Timer? _selectHoldTimer;
  bool _selectLongPressFired = false;
  bool _selectDownSeen = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ??
        FocusNode(debugLabel: 'LockedFocusRow:${widget.hubKey}');
    _ownsFocusNode = widget.focusNode == null;
    _scrollController = widget.controller ?? ScrollController();
    _ownsScrollController = widget.controller == null;
    _focusedIndex = HubFocusMemory.getForHub(widget.hubKey, widget.items.length);
    _syncItemKeys();
    _focusNode.addListener(_onRowFocusChange);
  }

  @override
  void didUpdateWidget(covariant LockedFocusRow<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      _focusNode.removeListener(_onRowFocusChange);
      if (_ownsFocusNode) {
        _focusNode.dispose();
      }
      _focusNode = widget.focusNode ??
          FocusNode(debugLabel: 'LockedFocusRow:${widget.hubKey}');
      _ownsFocusNode = widget.focusNode == null;
      _focusNode.addListener(_onRowFocusChange);
    }
    if (widget.items.length != oldWidget.items.length) {
      _focusedIndex =
          _focusedIndex.clamp(0, widget.items.isEmpty ? 0 : widget.items.length - 1);
      _syncItemKeys();
    }
  }

  @override
  void dispose() {
    _selectHoldTimer?.cancel();
    _focusNode.removeListener(_onRowFocusChange);
    if (_ownsFocusNode) _focusNode.dispose();
    if (_ownsScrollController) _scrollController.dispose();
    super.dispose();
  }

  bool get hasFocusedItem => _hasRowFocus;
  int get focusedIndex => _focusedIndex;

  void _syncItemKeys() {
    _itemKeys = List<GlobalKey>.generate(widget.items.length, (_) => GlobalKey());
  }

  void requestFocusAt(int index) {
    if (widget.items.isEmpty) return;
    if (!_focusNode.canRequestFocus) return;
    final clamped = index.clamp(0, widget.items.length - 1);
    _setFocusedIndex(clamped);
    _focusNode.requestFocus();
    _scrollToIndex(clamped);
  }

  void requestFocusFromMemory() {
    final idx = HubFocusMemory.getForHub(widget.hubKey, widget.items.length);
    requestFocusAt(idx);
  }

  void _onRowFocusChange() {
    if (!mounted) return;
    final has = _focusNode.hasFocus;
    if (has != _hasRowFocus) {
      setState(() => _hasRowFocus = has);
      widget.onFocusChange?.call(has);
    }
    if (has) {
      _scrollToIndex(_focusedIndex);
      final idx = _focusedIndex;
      if (idx >= 0 && idx < widget.items.length) {
        widget.onIndexChanged?.call(idx, widget.items[idx]);
      }
    }
  }

  void _setFocusedIndex(int index) {
    if (widget.items.isEmpty) return;
    if (index == _focusedIndex) return;
    setState(() => _focusedIndex = index);
    HubFocusMemory.set(widget.hubKey, index);
    if (index >= 0 && index < widget.items.length) {
      widget.onIndexChanged?.call(index, widget.items[index]);
    }
  }

  void _scrollToIndex(int index) {
    if (!_scrollController.hasClients) return;
    scrollListToIndex(
      _scrollController,
      index,
      itemExtent: widget.itemExtent + widget.itemSpacing,
      leadingPadding: widget.leadingPadding,
    );
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (widget.items.isEmpty) return KeyEventResult.ignored;

    if (event.logicalKey.isSelectKey) {
      if (widget.onLongPress != null) {
        if (event is KeyDownEvent) {
          _selectDownSeen = true;
          _selectLongPressFired = false;
          _selectHoldTimer?.cancel();
          _selectHoldTimer = Timer(_kSelectLongPressDuration, () {
            if (!mounted || !_focusNode.hasFocus) return;
            final idx = _focusedIndex;
            if (idx < 0 || idx >= widget.items.length) return;
            _selectLongPressFired = true;
            widget.onLongPress!(idx, widget.items[idx]);
          });
          return KeyEventResult.handled;
        }
        if (event is KeyRepeatEvent) {
          return KeyEventResult.handled;
        }
        if (event is KeyUpEvent) {
          if (!_selectDownSeen) return KeyEventResult.ignored;
          _selectDownSeen = false;
          _selectHoldTimer?.cancel();
          _selectHoldTimer = null;
          final fired = _selectLongPressFired;
          _selectLongPressFired = false;
          if (!fired) {
            final idx = _focusedIndex;
            if (idx >= 0 && idx < widget.items.length) {
              widget.onTap?.call(idx, widget.items[idx]);
            }
          }
          return KeyEventResult.handled;
        }
      } else {
        final select = handleOneShotSelect(event, () {
          final idx = _focusedIndex;
          if (idx >= 0 && idx < widget.items.length) {
            widget.onTap?.call(idx, widget.items[idx]);
          }
        });
        if (select != KeyEventResult.ignored) return select;
      }
    }

    if (widget.onBack != null) {
      final back = handleBackKeyAction(event, widget.onBack!);
      if (back != KeyEventResult.ignored) return back;
    }

    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    if (key.isLeftKey) {
      if (_focusedIndex > 0) {
        _setFocusedIndex(_focusedIndex - 1);
        _scrollToIndex(_focusedIndex);
        return KeyEventResult.handled;
      }
      if (widget.onLeftEdge != null) {
        widget.onLeftEdge!();
        return KeyEventResult.handled;
      }
      return KeyEventResult.handled;
    }
    if (key.isRightKey) {
      if (_focusedIndex < widget.items.length - 1) {
        _setFocusedIndex(_focusedIndex + 1);
        _scrollToIndex(_focusedIndex);
        return KeyEventResult.handled;
      }
      if (widget.onRightEdge != null) {
        widget.onRightEdge!();
        return KeyEventResult.handled;
      }
      return KeyEventResult.handled;
    }
    if (key.isUpKey) {
      final handled = widget.onVerticalNavigation?.call(true) ?? false;
      return handled ? KeyEventResult.handled : KeyEventResult.ignored;
    }
    if (key.isDownKey) {
      final handled = widget.onVerticalNavigation?.call(false) ?? false;
      return handled ? KeyEventResult.handled : KeyEventResult.ignored;
    }
    if (key.isContextMenuKey && widget.onLongPress != null) {
      final idx = _focusedIndex;
      if (idx >= 0 && idx < widget.items.length) {
        widget.onLongPress!(idx, widget.items[idx]);
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      onKeyEvent: _onKeyEvent,
      child: SizedBox(
        height: widget.height,
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          clipBehavior: widget.clipBehavior,
          padding: widget.padding,
          itemCount: widget.items.length,
          separatorBuilder: (_, _) => SizedBox(width: widget.itemSpacing),
          itemBuilder: (context, index) {
            final isFocused = _hasRowFocus && index == _focusedIndex;
            return KeyedSubtree(
              key: _itemKeys[index],
              child: widget.itemBuilder(
                context,
                widget.items[index],
                index,
                isFocused,
              ),
            );
          },
        ),
      ),
    );
  }
}
