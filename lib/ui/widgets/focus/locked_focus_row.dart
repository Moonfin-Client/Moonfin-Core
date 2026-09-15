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

  /// The current card width, excluding [itemSpacing], for exact list geometry.
  /// [itemExtent] remains the resting stride used by locked focus scrolling.
  final double Function(int index)? itemExtentBuilder;

  /// Relayouts exact item extents without rebuilding the existing card widgets.
  final Listenable? itemExtentListenable;
  final double leadingPadding;
  final double itemSpacing;
  final ScrollController? controller;
  final FocusNode? focusNode;
  final LockedFocusItemBuilder<T> itemBuilder;

  /// A stable, unique identity for each item, preserving its state on reorder.
  /// Without a builder, state stays associated with each item index.
  final Object Function(T item)? itemKeyBuilder;
  final Duration? scrollDuration;
  final Curve scrollCurve;
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
    this.itemExtentBuilder,
    this.itemExtentListenable,
    this.itemKeyBuilder,
    this.scrollDuration,
    this.scrollCurve = Curves.easeOut,
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
  List<LocalKey> _itemKeys = const [];
  Map<Key, int> _itemIndices = const {};
  int _focusedIndex = 0;
  bool _hasRowFocus = false;
  Timer? _selectHoldTimer;
  bool _selectLongPressFired = false;
  bool _selectDownSeen = false;

  @override
  void initState() {
    super.initState();
    _focusNode =
        widget.focusNode ??
        FocusNode(debugLabel: 'LockedFocusRow:${widget.hubKey}');
    _ownsFocusNode = widget.focusNode == null;
    _scrollController = widget.controller ?? ScrollController();
    _ownsScrollController = widget.controller == null;
    _focusedIndex = HubFocusMemory.getForHub(
      widget.hubKey,
      widget.items.length,
    );
    _syncItemKeys();
    _focusNode.addListener(_onRowFocusChange);
  }

  @override
  void didUpdateWidget(covariant LockedFocusRow<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldIndex = _focusedIndex;
    final oldItem = oldIndex < oldWidget.items.length
        ? oldWidget.items[oldIndex]
        : null;
    final oldFocusedKey = oldIndex < _itemKeys.length
        ? _itemKeys[oldIndex]
        : null;
    if (oldWidget.focusNode != widget.focusNode) {
      _focusNode.removeListener(_onRowFocusChange);
      if (_ownsFocusNode) {
        _focusNode.dispose();
      }
      _focusNode =
          widget.focusNode ??
          FocusNode(debugLabel: 'LockedFocusRow:${widget.hubKey}');
      _ownsFocusNode = widget.focusNode == null;
      _focusNode.addListener(_onRowFocusChange);
    }
    _syncItemKeys();
    _focusedIndex =
        (widget.itemKeyBuilder != null ? _itemIndices[oldFocusedKey] : null) ??
        _focusedIndex.clamp(
          0,
          widget.items.isEmpty ? 0 : widget.items.length - 1,
        );
    if (oldIndex != _focusedIndex) {
      HubFocusMemory.set(widget.hubKey, _focusedIndex);
      if (_hasRowFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _scrollToIndex(_focusedIndex);
        });
      }
    }
    if (_hasRowFocus &&
        widget.items.isNotEmpty &&
        _focusedIndex < widget.items.length) {
      final newItem = widget.items[_focusedIndex];
      if (oldIndex != _focusedIndex || oldItem != newItem) {
        widget.onIndexChanged?.call(_focusedIndex, newItem);
      }
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
    final keyBuilder = widget.itemKeyBuilder;
    _itemKeys = List<LocalKey>.generate(widget.items.length, (index) {
      if (keyBuilder != null) {
        return ValueKey<Object>(keyBuilder(widget.items[index]));
      }
      return index < _itemKeys.length && _itemKeys[index] is UniqueKey
          ? _itemKeys[index]
          : UniqueKey();
    });
    _itemIndices = {
      for (var index = 0; index < _itemKeys.length; index++)
        _itemKeys[index]: index,
    };
    assert(
      _itemIndices.length == _itemKeys.length,
      'LockedFocusRow.itemKeyBuilder must return a unique identity per item.',
    );
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
      duration: widget.scrollDuration,
      curve: widget.scrollCurve,
      animate: widget.scrollDuration != Duration.zero,
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
    if (key.isLeftKey || key.isRightKey) {
      final isRtl = Directionality.of(context) == TextDirection.rtl;
      final movesToNextIndex = key.isRightKey != isRtl;
      if (movesToNextIndex) {
        if (_focusedIndex < widget.items.length - 1) {
          _setFocusedIndex(_focusedIndex + 1);
          _scrollToIndex(_focusedIndex);
          return KeyEventResult.handled;
        }
        final edge = isRtl ? widget.onLeftEdge : widget.onRightEdge;
        if (edge != null) {
          edge();
          return KeyEventResult.handled;
        }
        return KeyEventResult.handled;
      } else {
        if (_focusedIndex > 0) {
          _setFocusedIndex(_focusedIndex - 1);
          _scrollToIndex(_focusedIndex);
          return KeyEventResult.handled;
        }
        final edge = isRtl ? widget.onRightEdge : widget.onLeftEdge;
        if (edge != null) {
          edge();
          return KeyEventResult.handled;
        }
        return KeyEventResult.handled;
      }
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
        child: widget.itemExtentBuilder != null
            ? _buildExactExtentList()
            : ListView.separated(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                clipBehavior: widget.clipBehavior,
                padding: widget.padding,
                itemCount: widget.items.length,
                findItemIndexCallback: (key) => _itemIndices[key],
                separatorBuilder: (_, _) => SizedBox(width: widget.itemSpacing),
                itemBuilder: _buildCard,
              ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    return KeyedSubtree(
      key: _itemKeys[index],
      child: widget.itemBuilder(
        context,
        widget.items[index],
        index,
        _hasRowFocus && index == _focusedIndex,
      ),
    );
  }

  Widget _buildExactExtentList() {
    final childCount = widget.items.isEmpty ? 0 : widget.items.length * 2 - 1;
    final delegate = SliverChildBuilderDelegate(
      (context, childIndex) => childIndex.isEven
          ? _buildCard(context, childIndex ~/ 2)
          : SizedBox(width: widget.itemSpacing),
      childCount: childCount,
      findChildIndexCallback: (key) {
        final itemIndex = _itemIndices[key];
        return itemIndex == null ? null : itemIndex * 2;
      },
      semanticIndexCallback: (_, childIndex) =>
          childIndex.isEven ? childIndex ~/ 2 : null,
    );
    return AnimatedBuilder(
      animation:
          widget.itemExtentListenable ??
          const AlwaysStoppedAnimation<double>(0),
      builder: (context, child) => ListView.custom(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: widget.clipBehavior,
        padding: widget.padding,
        semanticChildCount: widget.items.length,
        // Keep the delegate identical on geometry ticks, so the sliver only
        // lays out existing cards. A fresh extent callback invalidates layout
        // and reads live widths, including cards outside the visible cache.
        childrenDelegate: delegate,
        itemExtentBuilder: (childIndex, _) {
          if (childIndex >= childCount) return null;
          return childIndex.isEven
              ? widget.itemExtentBuilder!(childIndex ~/ 2)
              : widget.itemSpacing;
        },
      ),
    );
  }
}
