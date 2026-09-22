import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/focus/can_claim_initial_focus.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Stands in for the details page sitting behind the settings panel.
///
/// The shape that matters: it rebuilds on every preference write, and the
/// style picks which content widget it returns, so changing the style unmounts
/// one subtree and mounts another.
class _ScreenBehind extends StatefulWidget {
  const _ScreenBehind({required this.prefs, required this.playFocus});

  final UserPreferences prefs;
  final FocusNode playFocus;

  @override
  State<_ScreenBehind> createState() => _ScreenBehindState();
}

class _ScreenBehindState extends State<_ScreenBehind> {
  @override
  void initState() {
    super.initState();
    widget.prefs.addListener(_onPrefsChanged);
  }

  @override
  void dispose() {
    widget.prefs.removeListener(_onPrefsChanged);
    super.dispose();
  }

  void _onPrefsChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.prefs.get(UserPreferences.detailScreenStyle);
    return Scaffold(
      body: style == DetailScreenStyle.classic
          ? _ClassicContent(playFocus: widget.playFocus)
          : _ModernContent(playFocus: widget.playFocus),
    );
  }
}

/// Both contents grab focus on mount, the way the real ones do.
class _ClassicContent extends StatefulWidget {
  const _ClassicContent({required this.playFocus});
  final FocusNode playFocus;
  @override
  State<_ClassicContent> createState() => _ClassicContentState();
}

class _ClassicContentState extends State<_ClassicContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !canClaimInitialFocus(context)) return;
      widget.playFocus.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) =>
      Focus(focusNode: widget.playFocus, child: const Text('classic play'));
}

class _ModernContent extends StatefulWidget {
  const _ModernContent({required this.playFocus});
  final FocusNode playFocus;
  @override
  State<_ModernContent> createState() => _ModernContentState();
}

class _ModernContentState extends State<_ModernContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !canClaimInitialFocus(context)) return;
      widget.playFocus.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) =>
      Focus(focusNode: widget.playFocus, child: const Text('modern play'));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late FocusNode playFocus;
  late FocusNode panelFocus;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    PlatformDetection.setTvMode(true);
    playFocus = FocusNode(debugLabel: 'play');
    panelFocus = FocusNode(debugLabel: 'panel');
  });

  tearDown(() async {
    playFocus.dispose();
    panelFocus.dispose();
    PlatformDetection.setTvMode(false);
    await GetIt.instance.reset();
  });

  testWidgets('a style change behind an open panel leaves focus in the panel', (
    tester,
  ) async {
    await prefs.set(
      UserPreferences.detailScreenStyle,
      DetailScreenStyle.classic,
    );

    late BuildContext behindContext;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            behindContext = context;
            return _ScreenBehind(prefs: prefs, playFocus: playFocus);
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(playFocus.hasFocus, isTrue, reason: 'the page starts focused');

    // The panel opens over it and takes the focus with it.
    unawaited(
      showGeneralDialog<void>(
        context: behindContext,
        pageBuilder: (_, _, _) =>
            Focus(focusNode: panelFocus, child: const Text('panel')),
      ),
    );
    await tester.pumpAndSettle();
    panelFocus.requestFocus();
    await tester.pumpAndSettle();
    expect(panelFocus.hasFocus, isTrue);

    // Changing the style rebuilds the page underneath and swaps its content.
    await prefs.set(
      UserPreferences.detailScreenStyle,
      DetailScreenStyle.modern,
    );
    await tester.pumpAndSettle();

    expect(find.text('modern play'), findsOneWidget, reason: 'content swapped');
    expect(
      panelFocus.hasFocus,
      isTrue,
      reason: 'the page behind took the remote off the panel',
    );
    expect(playFocus.hasFocus, isFalse);
  });

  testWidgets('a style change with nothing on top still focuses the page', (
    tester,
  ) async {
    // The guard mustn't stop a page claiming focus when it's in front.
    await prefs.set(
      UserPreferences.detailScreenStyle,
      DetailScreenStyle.classic,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: _ScreenBehind(prefs: prefs, playFocus: playFocus),
      ),
    );
    await tester.pumpAndSettle();

    await prefs.set(
      UserPreferences.detailScreenStyle,
      DetailScreenStyle.modern,
    );
    await tester.pumpAndSettle();

    expect(find.text('modern play'), findsOneWidget);
    expect(playFocus.hasFocus, isTrue);
  });
}
