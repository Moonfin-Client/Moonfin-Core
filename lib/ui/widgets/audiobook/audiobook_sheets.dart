import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:moonfin_design/moonfin_design.dart';
import '../../../preference/user_preferences.dart';

import '../../../l10n/app_localizations.dart';
import '../../../playback/sleep_timer_controller.dart';
import '../../../util/platform_detection.dart';
import '../overlay_sheet.dart';
import 'audiobook_time.dart';

Future<void> showAudiobookSpeedSheet({
  required BuildContext context,
  required double current,
  required ValueChanged<double> onChanged,
}) {
  return _showAdaptiveSheet<void>(
    context,
    (ctx) => _SpeedSheet(current: current, onChanged: onChanged),
    floating: true,
  );
}

Future<void> showAudiobookSleepSheet({
  required BuildContext context,
  required SleepTimerController controller,
  required ValueChanged<int> onPickPreset,
  required VoidCallback onPickEndOfChapter,
  required VoidCallback onCancel,
}) {
  return _showAdaptiveSheet<void>(
    context,
    (ctx) => _SleepSheet(
      controller: controller,
      onPickPreset: onPickPreset,
      onPickEndOfChapter: onPickEndOfChapter,
      onCancel: onCancel,
    ),
    floating: true,
  );
}


Future<T?> _showAdaptiveSheet<T>(
  BuildContext context,
  WidgetBuilder builder, {
  bool scrollControlled = false,
  bool floating = false,
}) {
  if (PlatformDetection.isApple) {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: (ctx) {
        final child = builder(ctx);
        if (floating) {
          return _FloatingSheetShell(child: child);
        }
        return _CupertinoSheetShell(child: child);
      },
    );
  }
  return showFocusRestoringModalBottomSheet<T>(
    context: context,
    isScrollControlled: scrollControlled,
    useSafeArea: scrollControlled,
    backgroundColor: floating ? Colors.transparent : AppColorScheme.surface,
    elevation: floating ? 0 : null,
    shape: floating
        ? null
        : const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
    builder: (ctx) {
      final child = builder(ctx);
      if (floating) {
        return _FloatingSheetShell(child: child);
      }
      return child;
    },
  );
}

class _FloatingSheetShell extends StatelessWidget {
  const _FloatingSheetShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          0,
          16,
          16 + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Material(
            type: MaterialType.transparency,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _CupertinoSheetShell extends StatelessWidget {
  const _CupertinoSheetShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          color: AppColorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Material(type: MaterialType.transparency, child: child),
      ),
    );
  }
}

class _SheetTitle extends StatelessWidget {
  const _SheetTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    );
  }
}

class _SheetChoice extends StatefulWidget {
  const _SheetChoice({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<_SheetChoice> createState() => _SheetChoiceState();
}

class _SheetChoiceState extends State<_SheetChoice> {
  bool _isFocused = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final focused = _isFocused || _isHovered;
    final selected = widget.selected;
    final prefs = GetIt.instance<UserPreferences>();
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);

    final Color borderColor;
    final double borderWidth;
    if (focused) {
      borderColor = focusColor;
      borderWidth = 2.0;
    } else if (selected) {
      borderColor = AppColorScheme.onSurface.withValues(alpha: 0.8);
      borderWidth = 1.5;
    } else {
      borderColor = AppColorScheme.onSurface.withValues(alpha: 0.15);
      borderWidth = 1.0;
    }

    return InkWell(
      onTap: widget.onTap,
      onFocusChange: (f) => setState(() => _isFocused = f),
      onHover: (h) => setState(() => _isHovered = h),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 38,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                  color: AppColorScheme.onSurface,
                ),
              ),
            ),
            if (selected) ...[
              const SizedBox(height: 2),
              Container(
                width: 16,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColorScheme.accent,
                  borderRadius: BorderRadius.circular(1.5),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SpeedSheet extends StatefulWidget {
  const _SpeedSheet({required this.current, required this.onChanged});

  final double current;
  final ValueChanged<double> onChanged;

  @override
  State<_SpeedSheet> createState() => _SpeedSheetState();
}

class _SpeedSheetState extends State<_SpeedSheet> {
  late double _value = widget.current;
  late final FocusNode _sliderFocusNode = FocusNode();
  bool _sliderEditing = false;

  @override
  void initState() {
    super.initState();
    _sliderFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _sliderFocusNode.removeListener(_onFocusChange);
    _sliderFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    String statusText = '';
    if (_sliderFocusNode.hasFocus) {
      statusText = _sliderEditing ? ' (Adjusting)' : ' (Press OK to Adjust)';
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.spaceLg,
        AppSpacing.spaceLg,
        AppSpacing.spaceLg,
        AppSpacing.spaceLg + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SheetTitle(l10n.audiobookPlaybackSpeed),
          const SizedBox(height: AppSpacing.spaceSm),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _SheetChoice(
                      label: '0.5x',
                      selected: (_value - 0.5).abs() < 0.01,
                      onTap: () {
                        setState(() => _value = 0.5);
                        widget.onChanged(0.5);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SheetChoice(
                      label: '0.65x',
                      selected: (_value - 0.65).abs() < 0.01,
                      onTap: () {
                        setState(() => _value = 0.65);
                        widget.onChanged(0.65);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SheetChoice(
                      label: '0.8x',
                      selected: (_value - 0.8).abs() < 0.01,
                      onTap: () {
                        setState(() => _value = 0.8);
                        widget.onChanged(0.8);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SheetChoice(
                      label: '1.0x',
                      selected: (_value - 1.0).abs() < 0.01,
                      onTap: () {
                        setState(() => _value = 1.0);
                        widget.onChanged(1.0);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _SheetChoice(
                      label: '1.25x',
                      selected: (_value - 1.25).abs() < 0.01,
                      onTap: () {
                        setState(() => _value = 1.25);
                        widget.onChanged(1.25);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SheetChoice(
                      label: '1.5x',
                      selected: (_value - 1.5).abs() < 0.01,
                      onTap: () {
                        setState(() => _value = 1.5);
                        widget.onChanged(1.5);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SheetChoice(
                      label: '1.75x',
                      selected: (_value - 1.75).abs() < 0.01,
                      onTap: () {
                        setState(() => _value = 1.75);
                        widget.onChanged(1.75);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SheetChoice(
                      label: '2.0x',
                      selected: (_value - 2.0).abs() < 0.01,
                      onTap: () {
                        setState(() => _value = 2.0);
                        widget.onChanged(2.0);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              Row(
                children: [
                  Text(
                    'Fine Tune$statusText',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${_value.toStringAsFixed(2)}x',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColorScheme.accent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.spaceXs),
              Focus(
                focusNode: _sliderFocusNode,
                onKeyEvent: (node, event) {
                  if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
                    return KeyEventResult.ignored;
                  }
                  final key = event.logicalKey;

                  if (key == LogicalKeyboardKey.select ||
                      key == LogicalKeyboardKey.enter ||
                      key == LogicalKeyboardKey.gameButtonA) {
                    setState(() {
                      _sliderEditing = !_sliderEditing;
                    });
                    return KeyEventResult.handled;
                  }

                  if (_sliderEditing) {
                    if (key == LogicalKeyboardKey.arrowLeft) {
                      final newValue = (_value - 0.05).clamp(0.25, 3.0);
                      final rounded = (newValue * 20).round() / 20.0;
                      setState(() => _value = rounded);
                      widget.onChanged(rounded);
                      return KeyEventResult.handled;
                    }
                    if (key == LogicalKeyboardKey.arrowRight) {
                      final newValue = (_value + 0.05).clamp(0.25, 3.0);
                      final rounded = (newValue * 20).round() / 20.0;
                      setState(() => _value = rounded);
                      widget.onChanged(rounded);
                      return KeyEventResult.handled;
                    }
                    if (key == LogicalKeyboardKey.arrowUp ||
                        key == LogicalKeyboardKey.arrowDown ||
                        key == LogicalKeyboardKey.escape ||
                        key == LogicalKeyboardKey.goBack) {
                      setState(() {
                        _sliderEditing = false;
                      });
                      return KeyEventResult.handled;
                    }
                  } else {
                    if (key == LogicalKeyboardKey.arrowLeft ||
                        key == LogicalKeyboardKey.arrowRight) {
                      return KeyEventResult.handled;
                    }
                  }
                  return KeyEventResult.ignored;
                },
                child: ExcludeFocus(
                  child: Slider(
                    value: _value.clamp(0.25, 3.0),
                    min: 0.25,
                    max: 3.0,
                    divisions: 55,
                    activeColor: _sliderEditing ? AppColorScheme.accent : AppColorScheme.accent.withValues(alpha: 0.4),
                    inactiveColor: AppColorScheme.onSurface.withValues(alpha: 0.1),
                    onChanged: (v) {
                      final rounded = (v * 20).round() / 20.0;
                      setState(() => _value = rounded);
                      widget.onChanged(rounded);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SleepSheet extends StatelessWidget {
  const _SleepSheet({
    required this.controller,
    required this.onPickPreset,
    required this.onPickEndOfChapter,
    required this.onCancel,
  });

  final SleepTimerController controller;
  final ValueChanged<int> onPickPreset;
  final VoidCallback onPickEndOfChapter;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final titleText = controller.isActive
            ? (controller.isPaused
                ? 'Sleep Timer Paused — Time Remaining: ${formatAudiobookCountdown(controller.remaining)}'
                : 'Sleep Mode Activated — Time Remaining: ${formatAudiobookCountdown(controller.remaining)}')
            : l10n.audiobookSleepTimer;

        return Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.spaceLg,
            AppSpacing.spaceLg,
            AppSpacing.spaceLg,
            AppSpacing.spaceLg + MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SheetTitle(titleText),
              const SizedBox(height: AppSpacing.spaceMd),
              if (controller.isActive) ...[
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (controller.isPaused) {
                            controller.resumeTimer();
                          } else {
                            controller.pauseTimer();
                          }
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColorScheme.accent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                controller.isPaused ? Icons.play_arrow : Icons.pause,
                                size: 16,
                                color: AppColorScheme.accent,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                controller.isPaused ? 'Resume Timer' : 'Pause Timer',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorScheme.accent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          onCancel();
                          Navigator.of(context).maybePop();
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.stop,
                                size: 16,
                                color: Colors.red.withValues(alpha: 0.85),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'Stop Timer',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.spaceMd),
              ],
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _SheetChoice(
                          label: l10n.audiobookSleepEndOfChapter,
                          selected: controller.mode == SleepTimerMode.endOfChapter,
                          onTap: () {
                            onPickEndOfChapter();
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _SheetChoice(
                          label: l10n.audiobookSleepMinutes(5),
                          selected: controller.mode == SleepTimerMode.duration &&
                              (controller.totalRequested.inMinutes - 5).abs() < 1,
                          onTap: () {
                            onPickPreset(5);
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _SheetChoice(
                          label: l10n.audiobookSleepMinutes(15),
                          selected: controller.mode == SleepTimerMode.duration &&
                              (controller.totalRequested.inMinutes - 15).abs() < 1,
                          onTap: () {
                            onPickPreset(15);
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _SheetChoice(
                          label: l10n.audiobookSleepMinutes(30),
                          selected: controller.mode == SleepTimerMode.duration &&
                              (controller.totalRequested.inMinutes - 30).abs() < 1,
                          onTap: () {
                            onPickPreset(30);
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _SheetChoice(
                          label: l10n.audiobookSleepMinutes(45),
                          selected: controller.mode == SleepTimerMode.duration &&
                              (controller.totalRequested.inMinutes - 45).abs() < 1,
                          onTap: () {
                            onPickPreset(45);
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _SheetChoice(
                          label: l10n.audiobookSleepMinutes(60),
                          selected: controller.mode == SleepTimerMode.duration &&
                              (controller.totalRequested.inMinutes - 60).abs() < 1,
                          onTap: () {
                            onPickPreset(60);
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _SheetChoice(
                          label: l10n.audiobookSleepMinutes(90),
                          selected: controller.mode == SleepTimerMode.duration &&
                              (controller.totalRequested.inMinutes - 90).abs() < 1,
                          onTap: () {
                            onPickPreset(90);
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _SheetChoice(
                          label: l10n.audiobookSleepMinutes(120),
                          selected: controller.mode == SleepTimerMode.duration &&
                              (controller.totalRequested.inMinutes - 120).abs() < 1,
                          onTap: () {
                            onPickPreset(120);
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<dynamic> showAudiobookNoteEditor({
  required BuildContext context,
  required String initialText,
  required String positionLabel,
}) {
  if (PlatformDetection.isTV) {
    return showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Dialog(
        alignment: const Alignment(0.0, -0.6),
        backgroundColor: AppColorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          width: 500,
          child: _NoteEditorSheet(
            initialText: initialText,
            positionLabel: positionLabel,
            dialogContext: ctx,
          ),
        ),
      ),
    );
  }
  return _showAdaptiveSheet<dynamic>(
    context,
    (ctx) => _NoteEditorSheet(
      initialText: initialText,
      positionLabel: positionLabel,
      dialogContext: ctx,
    ),
    floating: true,
  );
}

class _NoteEditorSheet extends StatefulWidget {
  const _NoteEditorSheet({
    required this.initialText,
    required this.positionLabel,
    this.dialogContext,
  });

  final String initialText;
  final String positionLabel;
  final BuildContext? dialogContext;

  @override
  State<_NoteEditorSheet> createState() => _NoteEditorSheetState();
}

class _NoteEditorSheetState extends State<_NoteEditorSheet> {
  late final _controller = TextEditingController(text: widget.initialText);
  final _tvFocusNode = FocusNode();
  final _tvFieldKey = GlobalKey<CustomTVTextFieldState>();
  final _focusScopeNode = FocusScopeNode();
  bool _isSubmitting = false;
  // Set true briefly after the keyboard closes so that the hardware KeyUp event
  // from the physical remote that closed the keyboard can't immediately activate
  // a button (which would cause an unintended auto-submit and focus lockup).
  bool _keyboardJustClosed = false;

  @override
  void initState() {
    super.initState();
    _tvFocusNode.addListener(_onTvFocusChange);
    CustomTVTextField.isKeyboardVisibleNotifier.addListener(_onKeyboardVisibilityChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tvFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _tvFocusNode.removeListener(_onTvFocusChange);
    CustomTVTextField.isKeyboardVisibleNotifier.removeListener(_onKeyboardVisibilityChange);
    _tvFocusNode.dispose();
    _focusScopeNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTvFocusChange() {
    if (mounted) setState(() {});
  }

  void _onKeyboardVisibilityChange() {
    if (!mounted || _isSubmitting) return;
    final visible = CustomTVTextField.isKeyboardVisibleNotifier.value;
    if (!visible) {
      // Keep focus on the text field rather than moving to Save, so the trailing
      // hardware KeyUp from the remote keypress that closed the keyboard cannot
      // auto-activate a button. Block buttons briefly to absorb that KeyUp.
      _tvFocusNode.requestFocus();
      _keyboardJustClosed = true;
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted) {
          setState(() => _keyboardJustClosed = false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final apple = PlatformDetection.isApple;
    final isTV = PlatformDetection.isTV;
    final prefs = GetIt.instance<UserPreferences>();
    final preferSystemIme = prefs.get(UserPreferences.preferSystemImeKeyboard);
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final bottomPadding = isTV ? AppSpacing.spaceLg : (AppSpacing.spaceLg + MediaQuery.viewInsetsOf(context).bottom);

    return FocusScope(
      node: _focusScopeNode,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.spaceLg,
          AppSpacing.spaceLg,
          AppSpacing.spaceLg,
          bottomPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                apple ? CupertinoIcons.pencil : Icons.edit_note,
                color: AppColorScheme.accent,
              ),
              const SizedBox(width: 8),
              _SheetTitle(l10n.audiobookEditNote),
              const Spacer(),
              Text(
                widget.positionLabel,
                style: TextStyle(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.spaceMd),
          if (isTV)
            Focus(
              focusNode: _tvFocusNode,
              autofocus: true,
              onKeyEvent: (node, event) {
                if (_isSubmitting) return KeyEventResult.handled;
                final key = event.logicalKey;
                final isDown = event is KeyDownEvent;
                if (isDown &&
                    (key == LogicalKeyboardKey.select ||
                        key == LogicalKeyboardKey.enter ||
                        key == LogicalKeyboardKey.numpadEnter)) {
                  _tvFieldKey.currentState?.openKeyboard();
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              child: CustomTVTextField(
                key: _tvFieldKey,
                controller: _controller,
                isFocused: _tvFocusNode.hasFocus,
                hint: l10n.audiobookNoteHint,
                maxLines: 1,
                preferSystemIme: preferSystemIme,
                keyboardType: KeyboardType.alphabetic,
                popParentOnKeyboardClose: false,
                borderColor: AppColorScheme.onSurface.withValues(alpha: 0.15),
                focusedBorderColor: focusColor,
                onFieldSubmitted: (_) {
                  // Do nothing — focus stays on text field (_tvFocusNode).
                  // _onKeyboardVisibilityChange handles focus restoration.
                },
              ),
            )
          else if (apple)
            CupertinoTextField(
              controller: _controller,
              autofocus: true,
              maxLines: 5,
              placeholder: l10n.audiobookNoteHint,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColorScheme.onSurface.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.15),
                ),
              ),
            )
          else
            TextField(
              controller: _controller,
              autofocus: true,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: l10n.audiobookNoteHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          const SizedBox(height: AppSpacing.spaceMd),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _SheetActionButton(
                label: l10n.audiobookCancel,
                onPressed: () {
                  if (_isSubmitting || _keyboardJustClosed) return;
                  _isSubmitting = true;
                  try {
                    Navigator.pop(widget.dialogContext ?? context, null);
                  } catch (_) {}
                },
              ),
              const SizedBox(width: 8),
              _SheetActionButton(
                label: l10n.audiobookSave,
                onPressed: () {
                  if (_isSubmitting || _keyboardJustClosed) return;
                  _isSubmitting = true;
                  final text = _controller.text.trim();
                  try {
                    Navigator.pop(widget.dialogContext ?? context, text);
                  } catch (_) {}
                },
                isFilled: true,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}

class _SheetActionButton extends StatefulWidget {
  const _SheetActionButton({
    required this.label,
    required this.onPressed,
    this.isFilled = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isFilled;

  @override
  State<_SheetActionButton> createState() => _SheetActionButtonState();
}

class _SheetActionButtonState extends State<_SheetActionButton> {
  bool _isFocused = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final focused = _isFocused || _isHovered;
    final prefs = GetIt.instance<UserPreferences>();
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);

    final Color backgroundColor;
    final Color foregroundColor;
    final Color borderColor;

    if (widget.isFilled) {
      backgroundColor = focused ? focusColor : AppColorScheme.accent;
      foregroundColor = AppColorScheme.onAccent;
      borderColor = focused ? Colors.white : Colors.transparent;
    } else {
      backgroundColor = focused ? AppColorScheme.onSurface.withValues(alpha: 0.08) : Colors.transparent;
      foregroundColor = focused ? focusColor : AppColorScheme.onSurface.withValues(alpha: 0.8);
      borderColor = focused ? focusColor : AppColorScheme.onSurface.withValues(alpha: 0.15);
    }

    return InkWell(
      onTap: widget.onPressed,
      onFocusChange: (f) => setState(() => _isFocused = f),
      onHover: (h) => setState(() => _isHovered = h),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: focused ? 2.0 : 1.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}


