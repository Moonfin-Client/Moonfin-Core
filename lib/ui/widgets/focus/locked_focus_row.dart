import 'dart:async';

import 'package:flutter/foundation.dart';
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

/// What identifies an item across rebuilds. See [LockedFocusRow.itemKey].
typedef LockedFocusItemKey<T> = Object Function(T item, int index);

class LockedFocusRow<T> extends StatefulWidget {
  final List<T> items;
  final String hubKey;

  /// An identity for each item that survives the list being replaced.
  ///
  /// Paging appends to a row by handing it a longer list. Without an
  /// identity every card is keyed by position in a fresh list, so every
  /// element is thrown away and inflated again, and each image resolves
  /// again from the memory cache. On a low-memory box whose cache holds
  /// less than a row, the posters go back to placeholders. With an identity
  /// the cards that were there keep their elements and their images. Left
  /// null, position is the identity, which is right for a row whose items
  /// are only ever replaced wholesale.
  final LockedFocusItemKey<T>? itemKey;
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
    this.itemKey,
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
  Map<Object, GlobalKey> _keyByIdentity = const {};
  Map<Key, int> _indexByKey = const {};

  // Focus is broadcast rather than set with setState. A D-pad step used to
  // rebuild the whole row, every visible card through the caller's builder,
  // for a change that only two cards can see. Each card listens and rebuilds
  // itself when its own focused flag flips.
  final ValueNotifier<int> _focusedIndexNotifier = ValueNotifier<int>(0);
  final ValueNotifier<bool> _hasRowFocusNotifier = ValueNotifier<bool>(false);
  int get _focusedIndex => _focusedIndexNotifier.value;
  set _focusedIndex(int value) => _focusedIndexNotifier.value = value;
  bool get _hasRowFocus => _hasRowFocusNotifier.value;
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
    }
    // Identities can move on a same-length refresh, so the keys follow the
    // list rather than its length.
    if (!identical(widget.items, oldWidget.items) ||
        widget.itemKey != oldWidget.itemKey) {
      _syncItemKeys();
    }
    if (_hasRowFocus && widget.items.isNotEmpty && _focusedIndex < widget.items.length) {
      final oldItem = (oldWidget.items.length > _focusedIndex)
          ? oldWidget.items[_focusedIndex]
          : null;
      final newItem = widget.items[_focusedIndex];
      if (oldItem != newItem) {
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
    _focusedIndexNotifier.dispose();
    _hasRowFocusNotifier.dispose();
    super.dispose();
  }

  bool get hasFocusedItem => _hasRowFocus;
  int get focusedIndex => _focusedIndex;

  /// Keeps the key of every item still present and allocates only for new
  /// ones, so appending a page leaves the existing elements alone.
  void _syncItemKeys() {
    final identityOf = widget.itemKey;
    final next = <Object, GlobalKey>{};
    final indexByKey = <Key, int>{};
    _itemKeys = List<GlobalKey>.generate(widget.items.length, (index) {
      var identity = identityOf?.call(widget.items[index], index) ?? index;
      // A hub can list one item twice and a GlobalKey may appear once, so
      // the second copy falls back to its position.
      if (next.containsKey(identity)) identity = (position: index);
      final key = _keyByIdentity[identity] ?? GlobalKey();
      next[identity] = key;
      indexByKey[key] = index;
      return key;
    });
    _keyByIdentity = next;
    _indexByKey = indexByKey;
  }

  /// Lets the list find a moved child by key instead of rebuilding it, which
  /// is what makes a prepend as cheap as an append.
  int? _itemIndexForKey(Key key) => _indexByKey[key];

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
      _hasRowFocusNotifier.value = has;
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
    _focusedIndex = index;
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
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          clipBehavior: widget.clipBehavior,
          padding: widget.padding,
          itemCount: widget.items.length,
          findItemIndexCallback: _itemIndexForKey,
          separatorBuilder: (_, _) => SizedBox(width: widget.itemSpacing),
          itemBuilder: (context, index) => _RowItem<T>(
            key: _itemKeys[index],
            index: index,
            item: widget.items[index],
            focusedIndex: _focusedIndexNotifier,
            rowHasFocus: _hasRowFocusNotifier,
            builder: widget.itemBuilder,
          ),
        ),
      ),
    );
  }
}

/// One card of the row. Rebuilds when its own focused flag flips, and when
/// the row itself rebuilds, which hands it a fresh builder.
class _RowItem<T> extends StatefulWidget {
  const _RowItem({
    super.key,
    required this.index,
    required this.item,
    required this.focusedIndex,
    required this.rowHasFocus,
    required this.builder,
  });

  final int index;
  final T item;
  final ValueListenable<int> focusedIndex;
  final ValueListenable<bool> rowHasFocus;
  final LockedFocusItemBuilder<T> builder;

  @override
  State<_RowItem<T>> createState() => _RowItemState<T>();
}

class _RowItemState<T> extends State<_RowItem<T>> {
  late bool _isFocused = _computeFocused();

  bool _computeFocused() =>
      widget.rowHasFocus.value && widget.focusedIndex.value == widget.index;

  @override
  void initState() {
    super.initState();
    widget.focusedIndex.addListener(_onFocusChanged);
    widget.rowHasFocus.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant _RowItem<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.focusedIndex, widget.focusedIndex) ||
        !identical(oldWidget.rowHasFocus, widget.rowHasFocus)) {
      oldWidget.focusedIndex.removeListener(_onFocusChanged);
      oldWidget.rowHasFocus.removeListener(_onFocusChanged);
      widget.focusedIndex.addListener(_onFocusChanged);
      widget.rowHasFocus.addListener(_onFocusChanged);
    }
    _isFocused = _computeFocused();
  }

  @override
  void dispose() {
    widget.focusedIndex.removeListener(_onFocusChanged);
    widget.rowHasFocus.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _onFocusChanged() {
    final focused = _computeFocused();
    if (focused == _isFocused) return;
    setState(() => _isFocused = focused);
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, widget.item, widget.index, _isFocused);
}
