import 'dart:async';

import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import 'after_hours_canvas.dart';
import 'after_hours_game.dart';
import 'after_hours_screen.dart';
import 'after_hours_sound.dart';

/// Seven presses on Settings > About > Version open the arcade. From the third
/// a toast counts down, and three seconds without a press start over, so
/// scrolling past the row can't open it by accident.
abstract final class AfterHoursTrigger {
  static const presses = 7;
  static const _window = Duration(seconds: 3);

  static int _count = 0;
  static Timer? _timer;
  static OverlayEntry? _entry;
  static bool _holdingSound = false;
  static final _toast = ValueNotifier<({int count, bool touch})?>(null);

  @visibleForTesting
  static int get count => _count;

  static void press(BuildContext context) {
    // An extra press during the unlock beat would cancel the opening.
    if (_toast.value?.count == presses) return;
    _timer?.cancel();
    _count++;
    final sound = AfterHoursSound.instance;
    if (!_holdingSound) {
      sound.acquire();
      _holdingSound = true;
    }
    final touch =
        FocusManager.instance.highlightMode == FocusHighlightMode.touch;
    if (_count >= presses) {
      _count = 0;
      sound.play(ArcadeSound.fanfare);
      _show(context, (count: presses, touch: touch));
      // A beat on the unlocked toast before the arcade covers it.
      _timer = Timer(const Duration(milliseconds: 700), () {
        if (context.mounted) unawaited(AfterHoursScreen.open(context));
        _end();
      });
      return;
    }
    sound.play(ArcadeSound.tick);
    if (_count >= 3) _show(context, (count: _count, touch: touch));
    _timer = Timer(_window, _end);
  }

  static void _show(BuildContext context, ({int count, bool touch}) state) {
    _toast.value = state;
    if (_entry != null) return;
    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;
    _entry = OverlayEntry(builder: (_) => const _Toast());
    overlay.insert(_entry!);
  }

  static void _end() {
    _timer?.cancel();
    _count = 0;
    _toast.value = null;
    _entry?.remove();
    _entry = null;
    if (_holdingSound) {
      _holdingSound = false;
      AfterHoursSound.instance.release();
    }
  }

  @visibleForTesting
  static void reset() => _end();
}

class _Toast extends StatelessWidget {
  const _Toast();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final phone = PlatformDetection.useMobileUi;
    return ValueListenableBuilder(
      valueListenable: AfterHoursTrigger._toast,
      builder: (context, state, _) {
        if (state == null) {
          return const Positioned(left: 0, bottom: 0, child: SizedBox.shrink());
        }
        final done = state.count >= AfterHoursTrigger.presses;
        final left = AfterHoursTrigger.presses - state.count;
        final fontSize = phone ? 15.0 : 18.0;
        final dot = phone ? 7.0 : 9.0;
        return Positioned(
          left: 16,
          right: 16,
          bottom: phone ? 64 : 34,
          child: IgnorePointer(
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: phone ? 18 : 22,
                    vertical: phone ? 10 : 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(20, 17, 46, .97),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: done ? K.gold : K.line),
                  ),
                  child: done
                      ? Text(
                          l10n.afterHoursUnlocked,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w700,
                            color: K.gold,
                          ),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.touch
                                  ? l10n.afterHoursTapsLeft(left)
                                  : l10n.afterHoursPressesLeft(left),
                              style: TextStyle(
                                fontSize: fontSize,
                                color: K.ink,
                              ),
                            ),
                            const SizedBox(width: 9),
                            for (var i = 0; i < AfterHoursTrigger.presses; i++)
                              Container(
                                width: dot,
                                height: dot,
                                margin: EdgeInsets.only(left: dot * .55),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: i < state.count ? K.gold : K.line,
                                ),
                              ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
