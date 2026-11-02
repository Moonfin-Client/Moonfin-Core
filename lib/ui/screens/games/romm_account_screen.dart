import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/sign_in_qr_code.dart';

/// Links the signed-in user's own RomM account through RomM's device code
/// flow, run by the server's plugin. Until then the server browses RomM with
/// its shared key and keeps the user's saves itself.
class RommAccountScreen extends StatefulWidget {
  const RommAccountScreen({super.key});

  @override
  State<RommAccountScreen> createState() => _RommAccountScreenState();
}

class _RommAccountScreenState extends State<RommAccountScreen> {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();
  final FocusNode _actionFocus = FocusNode(debugLabel: 'romm_account_action');

  RommAccount? _account;
  bool _loadFailed = false;
  bool _busy = false;
  Timer? _poll;

  @override
  void initState() {
    super.initState();
    _send((games) => games.getRommAccount());
  }

  @override
  void dispose() {
    _poll?.cancel();
    _actionFocus.dispose();
    super.dispose();
  }

  Future<void> _send(
    Future<RommAccount> Function(GamesApi games) call, {
    bool busy = false,
  }) async {
    _poll?.cancel();
    final games = _client.gamesApi;
    if (games == null) {
      setState(() => _account = RommAccount.unavailable);
      return;
    }
    if (busy) setState(() => _busy = true);
    final shown = _shownState;
    try {
      final account = await call(games);
      if (!mounted) return;
      setState(() {
        _account = account;
        _loadFailed = false;
        _busy = false;
      });
    } catch (e) {
      debugPrint('[RommAccountScreen] $e');
      if (!mounted) return;
      setState(() {
        _loadFailed = true;
        _busy = false;
      });
    }
    // On TV the back arrow takes focus when the screen opens, and the button
    // that started a request may be gone now, so focus moves to whichever one
    // the new state shows. A poll that changed nothing leaves focus alone.
    if (PlatformDetection.isTV && (busy || shown != _shownState)) {
      _actionFocus.requestFocus();
    }
    _schedulePoll();
  }

  String get _shownState {
    final account = _account;
    if (account == null) return _loadFailed ? 'failed' : 'loading';
    if (account.linked) return 'linked';
    return account.pending != null ? 'pending' : 'idle';
  }

  /// Each answer arms the next check, so a slow server never stacks polls.
  /// A failed check keeps the code on screen and tries again.
  void _schedulePoll() {
    final pending = _account?.pending;
    if (pending == null) return;
    _poll = Timer(
      Duration(seconds: math.max(2, pending.intervalSeconds)),
      () => _send((games) => games.getRommAccount()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      appBar: AppBar(title: Text(l10n.rommAccount)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: _buildBody(l10n),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(AppLocalizations l10n) {
    final account = _account;
    if (account == null) {
      if (!_loadFailed) return const CircularProgressIndicator();
      return _column([
        _message(l10n.rommAccountLoadFailed),
        _button(
          l10n.retry,
          Icons.refresh,
          () => _send((games) => games.getRommAccount(), busy: true),
        ),
      ]);
    }
    if (!account.available) return _message(l10n.rommNotAvailable);

    if (account.linked) {
      final name = account.username;
      return _column([
        Text(
          name == null || name.isEmpty
              ? l10n.rommLinked
              : l10n.rommLinkedAs(name),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        _message(l10n.rommUnlinkNote),
        _button(
          l10n.rommUnlink,
          Icons.link_off,
          () => _send((games) => games.unlinkRomm(), busy: true),
        ),
      ]);
    }

    final pending = account.pending;
    if (pending != null) return _buildPending(l10n, pending);

    final error = switch (account.error) {
      'expired' => l10n.rommLinkExpired,
      'denied' => l10n.rommLinkDenied,
      'unreachable' => l10n.rommUnreachable,
      _ => null,
    };
    return _column([
      if (error != null)
        Text(
          error,
          style: TextStyle(color: AppColorScheme.statusRequested),
          textAlign: TextAlign.center,
        ),
      _message(l10n.rommAccountIntro),
      _button(
        l10n.rommLinkAccount,
        Icons.link,
        () => _send((games) => games.startRommLink(), busy: true),
      ),
    ]);
  }

  Widget _buildPending(AppLocalizations l10n, RommLinkCode pending) {
    final isTV = PlatformDetection.isTV;
    final details = _column([
      _message(l10n.rommLinkInstructions),
      Text(
        pending.userCode,
        style: const TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.bold,
          letterSpacing: 8,
        ),
      ),
      if (isTV)
        _message(l10n.rommLinkScanOrVisit(pending.verificationUrl))
      else
        _button(
          l10n.rommOpen,
          Icons.open_in_new,
          () => launchUrl(
            Uri.parse(pending.verificationUrlComplete),
            mode: LaunchMode.externalApplication,
          ),
        ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: 10),
          Flexible(child: _message(l10n.rommWaitingForApproval)),
        ],
      ),
      if (isTV)
        _button(
          l10n.cancel,
          Icons.close,
          () => _send((games) => games.unlinkRomm(), busy: true),
        ),
    ]);
    if (!isTV) return details;
    // A TV has no browser, so the QR sits beside the code for a phone to scan.
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: details),
        const SizedBox(width: 40),
        SignInQrCode(data: pending.verificationUrlComplete, size: 220),
      ],
    );
  }

  Widget _column(List<Widget> children) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (var i = 0; i < children.length; i++) ...[
        if (i > 0) const SizedBox(height: 20),
        children[i],
      ],
    ],
  );

  Widget _message(String text) => Text(
    text,
    style: TextStyle(color: AppColorScheme.onSurface.withValues(alpha: 0.7)),
    textAlign: TextAlign.center,
  );

  /// Each state shows at most one button, so they share one focus node and
  /// the remote always lands on it.
  Widget _button(String label, IconData icon, VoidCallback onPressed) =>
      FilledButton.icon(
        focusNode: _actionFocus,
        autofocus: true,
        onPressed: _busy ? null : onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
      );
}
