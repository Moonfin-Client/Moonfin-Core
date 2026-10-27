import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/models/server.dart';
import '../../../auth/repositories/server_repository.dart';
import '../../../data/services/plex_tv_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/allow_self_signed_dialog.dart';
import '../../widgets/client_certificate_dialog.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/server_type_icon.dart';

/// Where the server screen goes once [AddServerDialog] closes.
sealed class AddServerOutcome {
  const AddServerOutcome();
}

class AddServerSaved extends AddServerOutcome {
  const AddServerSaved(this.serverId);

  final String serverId;
}

/// The Plex sign-in, with [address] when the one typed in was a Plex server.
class AddServerPlexSignIn extends AddServerOutcome {
  const AddServerPlexSignIn([this.address]);

  final String? address;
}

class AddServerEmbyConnect extends AddServerOutcome {
  const AddServerEmbyConnect();
}

/// Opens [AddServerDialog] centered on every platform. An address already in
/// [controller] opens it on the address step.
Future<AddServerOutcome?> showAddServerDialog({
  required BuildContext context,
  required TextEditingController controller,
  required ServerRepository serverRepo,
}) {
  return showFocusRestoringDialog<AddServerOutcome>(
    context: context,
    barrierColor: const Color(0x99050710),
    builder: (ctx) => AddServerDialog(
      l10n: AppLocalizations.of(ctx),
      controller: controller,
      serverRepo: serverRepo,
    ),
  );
}

bool get _isMoonfin => ThemeRegistry.active.id == ThemeRegistry.moonfinId;

Color _fg(double alpha) =>
    (_isMoonfin ? Colors.white : AppColorScheme.onSurface).withValues(
      alpha: alpha,
    );

/// Moonfin's cyan is too light for white text, so labels on it go dark.
Color get _onAccent =>
    _isMoonfin ? const Color(0xFF04151C) : AppColorScheme.onAccent;

const _errorText = Color(0xFFFFB4B4);
const _warningText = Color(0xFFFFD27A);

({Color tile, Color glyph}) _serverTint(ServerType type) => switch (type) {
  ServerType.jellyfin => (
    tile: const Color(0x29AA5CC3),
    glyph: const Color(0xFFC88BE0),
  ),
  ServerType.emby => (
    tile: const Color(0x2452B54B),
    glyph: const Color(0xFF7BD175),
  ),
  ServerType.plex => (
    tile: const Color(0x24E5A00D),
    glyph: const Color(0xFFF2BC45),
  ),
};

String _brand(ServerType type) => switch (type) {
  ServerType.jellyfin => 'Jellyfin',
  ServerType.emby => 'Emby',
  ServerType.plex => 'Plex',
};

ButtonStyle _primaryStyle({bool compact = false}) {
  final accent = AppColorScheme.accent;
  return FilledButton.styleFrom(
    backgroundColor: accent,
    foregroundColor: _onAccent,
    disabledBackgroundColor: accent.withValues(alpha: 0.55),
    disabledForegroundColor: _onAccent,
    minimumSize: Size(96, compact ? 40 : 48),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(compact ? 12 : 14),
    ),
    textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
  ).copyWith(
    side: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.focused)
          ? BorderSide(color: _fg(1), width: 2)
          : BorderSide.none,
    ),
  );
}

ButtonStyle _ghostStyle() {
  return TextButton.styleFrom(
    backgroundColor: _fg(0.06),
    foregroundColor: _fg(0.9),
    minimumSize: const Size(0, 48),
    padding: const EdgeInsets.symmetric(horizontal: 18),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
  ).copyWith(
    side: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.focused)
          ? BorderSide(color: AppColorScheme.accent, width: 2)
          : BorderSide.none,
    ),
  );
}

ButtonStyle _noticeButtonStyle() {
  return TextButton.styleFrom(
    foregroundColor: _warningText,
    backgroundColor: _warningText.withValues(alpha: 0.12),
    minimumSize: const Size(0, 40),
    padding: const EdgeInsets.symmetric(horizontal: 14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
  ).copyWith(
    side: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.focused)
          ? BorderSide(color: _fg(1), width: 2)
          : BorderSide(color: _warningText.withValues(alpha: 0.45)),
    ),
  );
}

class AddServerButton extends StatefulWidget {
  const AddServerButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  State<AddServerButton> createState() => _AddServerButtonState();
}

class _AddServerButtonState extends State<AddServerButton> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final accent = AppColorScheme.accent;
    final enabled = widget.onPressed != null;
    final lit = enabled && (_hovered || _focused);
    final button = AnimatedOpacity(
      duration: const Duration(milliseconds: 150),
      opacity: enabled ? 1 : 0.5,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        decoration: BoxDecoration(
          color: accent.withValues(alpha: lit ? 0.18 : 0.10),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: accent.withValues(alpha: lit ? 0.85 : 0.45),
          ),
        ),
        // A ring drawn as a shadow sits under the see-through fill and lights
        // up the whole card, so it goes on top instead
        foregroundDecoration: _focused
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _fg(0.9), width: 2),
              )
            : null,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: widget.onPressed,
            onHover: (hovered) => setState(() => _hovered = hovered),
            onFocusChange: (focused) => setState(() => _focused = focused),
            borderRadius: BorderRadius.circular(16),
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
              child: LayoutBuilder(
                builder: (context, constraints) => Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: accent,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: accent.withValues(alpha: 0.35),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Icon(Icons.add_rounded, color: _onAccent),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.addServer,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: _fg(0.95),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            l10n.addServerButtonSubtitle,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.3,
                              color: _fg(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (constraints.maxWidth >= 360)
                      for (final type in ServerType.values)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 10),
                          child: ServerTypeIcon(
                            serverType: type,
                            size: 16,
                            color: _fg(0.5),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return Semantics(button: true, enabled: enabled, child: button);
  }
}

enum _Step { choose, address, found }

enum _Failure { none, unreachable, untrusted, clientCert }

class AddServerDialog extends StatefulWidget {
  final AppLocalizations l10n;
  final TextEditingController controller;
  final ServerRepository serverRepo;

  const AddServerDialog({
    super.key,
    required this.l10n,
    required this.controller,
    required this.serverRepo,
  });

  @override
  State<AddServerDialog> createState() => _AddServerDialogState();
}

class _AddServerDialogState extends State<AddServerDialog> {
  final _userPreferences = GetIt.instance<UserPreferences>();
  final _firstChoiceFocus = FocusNode(debugLabel: 'addServerAddressChoice');
  final _addressFocus = FocusNode(debugLabel: 'addServerAddress');
  final _connectFocus = FocusNode(debugLabel: 'addServerConnect');
  final _allowFocus = FocusNode(debugLabel: 'addServerAllowSelfSigned');
  final _certFocus = FocusNode(debugLabel: 'addServerClientCert');
  final _continueFocus = FocusNode(debugLabel: 'addServerContinue');
  final _tvFieldKey = GlobalKey<CustomTVTextFieldState>();

  late final bool _startedOnAddress;
  late _Step _step;
  bool _isConnecting = false;
  _Failure _failure = _Failure.none;
  String? _untrustedAddress;
  String? _clientCertAddress;
  Server? _found;
  bool _foundIsNew = false;
  bool _dismissed = false;

  /// Known server addresses, freshest first, offered as keyboard chips so
  /// re-adding a server is one press instead of a typed URL.
  List<String> get _recentServerAddresses {
    final servers = [...widget.serverRepo.servers]
      ..sort((a, b) => b.dateLastAccessed.compareTo(a.dateLastAccessed));
    return [
      for (final server in servers) server.displayAddress ?? server.address,
    ];
  }

  @override
  void initState() {
    super.initState();
    _startedOnAddress = widget.controller.text.trim().isNotEmpty;
    _step = _startedOnAddress ? _Step.address : _Step.choose;
    _addressFocus.addListener(_onAddressFocusChanged);
    _focusLater(_startedOnAddress ? _addressFocus : _firstChoiceFocus);
  }

  @override
  void dispose() {
    _addressFocus.removeListener(_onAddressFocusChanged);
    _firstChoiceFocus.dispose();
    _addressFocus.dispose();
    _connectFocus.dispose();
    _allowFocus.dispose();
    _certFocus.dispose();
    _continueFocus.dispose();
    super.dispose();
  }

  void _onAddressFocusChanged() {
    if (mounted) setState(() {});
  }

  void _focusLater(FocusNode node) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) node.requestFocus();
    });
  }

  void _close(AddServerOutcome? outcome, {bool fromBackKey = false}) {
    if (_dismissed || !mounted) return;
    _dismissed = true;
    if (fromBackKey) DialogBackSuppressor.markDismissed();
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop(outcome);
      return;
    }
    final rootNavigator = Navigator.of(context, rootNavigator: true);
    if (rootNavigator.canPop()) rootNavigator.pop(outcome);
  }

  void _goTo(_Step step) {
    setState(() {
      _step = step;
      _failure = _Failure.none;
      _untrustedAddress = null;
      _clientCertAddress = null;
      if (step != _Step.found) _found = null;
    });
    _focusLater(switch (step) {
      _Step.choose => _firstChoiceFocus,
      _Step.address => _addressFocus,
      _Step.found => _continueFocus,
    });
  }

  void _back({bool fromBackKey = false}) {
    switch (_step) {
      case _Step.found:
        _useDifferentAddress();
      case _Step.address when !_startedOnAddress:
        _goTo(_Step.choose);
      default:
        _close(null, fromBackKey: fromBackKey);
    }
  }

  /// Takes back a server this dialog just saved, so trying another address
  /// doesn't leave the first one behind. One that was saved before stays.
  Future<void> _useDifferentAddress() async {
    final found = _found;
    if (found != null && _foundIsNew) {
      await widget.serverRepo.deleteServer(found.id);
    }
    if (mounted) _goTo(_Step.address);
  }

  Future<void> _submit() => _connect(widget.controller.text.trim());

  Future<void> _connect(String address) async {
    if (address.isEmpty || _isConnecting) return;
    final known = {for (final server in widget.serverRepo.servers) server.id};

    setState(() {
      _isConnecting = true;
      _failure = _Failure.none;
      _untrustedAddress = null;
      _clientCertAddress = null;
    });

    try {
      final server = await widget.serverRepo.addServer(address);
      if (!mounted) return;
      if (server != null) {
        setState(() {
          _isConnecting = false;
          _found = server;
          _foundIsNew = !known.contains(server.id);
          _step = _Step.found;
        });
        _focusLater(_continueFocus);
        return;
      }
      // Only Jellyfin and Emby answer that probe, so a Plex server goes to its
      // plex.tv sign-in.
      final plexUri = GetIt.instance.isRegistered<PlexTvService>()
          ? await GetIt.instance<PlexTvService>().findServerAt(address)
          : null;
      if (!mounted) return;
      if (plexUri != null) {
        _close(AddServerPlexSignIn(plexUri));
        return;
      }
      final failure = widget.serverRepo.lastFailure;
      final clientCert = failure?.clientCertCandidate;
      if (clientCert != null) {
        _clientCertAddress = clientCert;
        _fail(_Failure.clientCert, focus: _certFocus);
        return;
      }
      // A proxy that turns a missing certificate away with a plain error page
      // looks like any other failure, so the import is offered anyway, for
      // the https address that failed that way rather than the last one tried,
      // which is usually plain http.
      final possible = failure?.possibleClientCertCandidate;
      if (!PlatformDetection.isWeb && possible != null) {
        _clientCertAddress = possible;
      }
      final untrusted = failure?.untrustedCandidate;
      if (untrusted == null) {
        _fail(_Failure.unreachable);
        return;
      }
      _untrustedAddress = untrusted;
      _fail(_Failure.untrusted, focus: _allowFocus);
    } catch (_) {
      if (!mounted) return;
      _fail(_Failure.unreachable);
    }
  }

  void _fail(_Failure failure, {FocusNode? focus}) {
    setState(() {
      _isConnecting = false;
      _failure = failure;
    });
    _focusLater(
      focus ?? (PlatformDetection.isTV ? _connectFocus : _addressFocus),
    );
  }

  Future<void> _importClientCertAndRetry() async {
    final address = _clientCertAddress;
    if (address == null) return;
    final saved = await showClientCertificateDialog(
      context: context,
      host: Uri.tryParse(address)?.host ?? address,
    );
    if (saved != null && mounted) await _connect(address);
  }

  Future<void> _allowSelfSignedAndRetry() async {
    final address = _untrustedAddress;
    if (address == null || !await confirmAllowSelfSignedCertificates(context)) {
      return;
    }
    if (mounted) await _connect(address);
  }

  KeyEventResult _onDialogKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;

    if (key.isBackKey) {
      if (event is! KeyDownEvent) return KeyEventResult.ignored;
      if (PlatformDetection.isTV &&
          (_tvFieldKey.currentState?.isKeyboardVisible ?? false)) {
        _tvFieldKey.currentState?.closeKeyboard();
        _addressFocus.requestFocus();
        return KeyEventResult.handled;
      }
      // A focused text field owns backspace (editing the URL), so back only
      // counts when no editable text has primary focus.
      final focusContext = FocusManager.instance.primaryFocus?.context;
      if (focusContext != null &&
          focusContext.findAncestorWidgetOfExactType<EditableText>() != null) {
        return KeyEventResult.ignored;
      }
      if (!_isConnecting) _back(fromBackKey: true);
      return KeyEventResult.handled;
    }

    if (!PlatformDetection.isTV) return KeyEventResult.ignored;
    if (_connectFocus.hasFocus && key == LogicalKeyboardKey.arrowUp) {
      _addressFocus.requestFocus();
      return KeyEventResult.handled;
    }
    if (!_addressFocus.hasFocus) return KeyEventResult.ignored;
    if (key.isSelectKey || key == LogicalKeyboardKey.enter) {
      _tvFieldKey.currentState?.openKeyboard();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowDown) {
      _connectFocus.requestFocus();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    final content = switch (_step) {
      _Step.choose => _chooseStep(l10n),
      _Step.address => _addressStep(l10n),
      _Step.found => _foundStep(l10n),
    };
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: _onDialogKey,
      child: ValueListenableBuilder<bool>(
        valueListenable: CustomTVTextField.isKeyboardVisibleNotifier,
        builder: (context, keyboardVisible, child) => AnimatedPadding(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(
            bottom: PlatformDetection.isTV && keyboardVisible ? 360 : 0,
          ),
          child: child,
        ),
        child: Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: _panel(
              AnimatedSize(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: _StepEntrance(key: ValueKey(_step), child: content),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _panel(Widget child) {
    final tier = GlassSettings.tier;
    final solid = tier == GlassTier.solid;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x8C000000),
            blurRadius: 60,
            offset: Offset(0, 24),
          ),
        ],
      ),
      foregroundDecoration: solid
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: _fg(0.10)),
            )
          : null,
      child: glassPane(
        tier: tier,
        fallbackColor: _isMoonfin
            ? const Color(0xF0121626)
            : AppColorScheme.surface.withValues(alpha: 0.94),
        tint: solid
            ? null
            : (_isMoonfin
                  ? const Color(0xB3121626)
                  : AppColorScheme.surface.withValues(alpha: 0.7)),
        cornerRadius: 24,
        sigma: 24,
        context: context,
        child: child,
      ),
    );
  }

  Widget _header({
    required String title,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (leading != null) ...[leading, const SizedBox(width: 12)],
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                    color: _fg(0.96),
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: _fg(0.62),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (trailing != null) ...[const SizedBox(width: 12), trailing],
      ],
    );
  }

  Widget _closeButton() => _RoundIconButton(
    icon: Icons.close_rounded,
    tooltip: widget.l10n.close,
    onPressed: _isConnecting ? null : () => _close(null),
  );

  Widget _chooseStep(AppLocalizations l10n) {
    final accent = AppColorScheme.accent;
    final plex = _serverTint(ServerType.plex);
    final emby = _serverTint(ServerType.emby);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _header(
          title: l10n.addServer,
          subtitle: l10n.addServerChooseHow,
          trailing: _closeButton(),
        ),
        const SizedBox(height: 20),
        _ChoiceCard(
          focusNode: _firstChoiceFocus,
          tileColor: accent.withValues(alpha: 0.14),
          icon: Icon(Icons.language_rounded, color: accent, size: 24),
          title: l10n.serverAddress,
          subtitle: l10n.addServerAddressChoice,
          onTap: () => _goTo(_Step.address),
        ),
        const SizedBox(height: 10),
        _ChoiceCard(
          tileColor: plex.tile,
          icon: ServerTypeIcon(
            serverType: ServerType.plex,
            size: 22,
            color: plex.glyph,
          ),
          title: l10n.signInWithPlex,
          subtitle: l10n.addServerPlexChoice,
          onTap: () => _close(const AddServerPlexSignIn()),
        ),
        const SizedBox(height: 10),
        _ChoiceCard(
          tileColor: emby.tile,
          icon: ServerTypeIcon(
            serverType: ServerType.emby,
            size: 24,
            color: emby.glyph,
          ),
          title: l10n.embyConnect,
          subtitle: l10n.embyConnectSignInSubtitle,
          onTap: () => _close(const AddServerEmbyConnect()),
        ),
      ],
    );
  }

  Widget _addressStep(AppLocalizations l10n) {
    final isTV = PlatformDetection.isTV;
    final entered = widget.controller.text.trim();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _header(
          title: l10n.connectToServer,
          subtitle: l10n.addServerAddressHelp,
          leading: _startedOnAddress
              ? null
              : _RoundIconButton(
                  icon: Icons.arrow_back_rounded,
                  tooltip: l10n.back,
                  onPressed: _isConnecting ? null : () => _goTo(_Step.choose),
                ),
          trailing: _closeButton(),
        ),
        const SizedBox(height: 18),
        Text(
          l10n.serverAddress,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
            color: _fg(0.6),
          ),
        ),
        const SizedBox(height: 8),
        if (isTV) ...[
          _tvField(l10n),
          const SizedBox(height: 12),
          FilledButton(
            focusNode: _connectFocus,
            onPressed: _isConnecting ? null : _submit,
            style: _primaryStyle(),
            child: _isConnecting ? const _Spinner() : Text(l10n.connect),
          ),
        ] else
          _field(l10n),
        const SizedBox(height: 10),
        Text(
          _isConnecting
              ? l10n.addServerChecking(entered)
              : l10n.addServerDetectNote,
          style: TextStyle(fontSize: 12, height: 1.4, color: _fg(0.5)),
        ),
        if (_failure == _Failure.unreachable) ...[
          const SizedBox(height: 14),
          _Notice(
            warning: false,
            title: l10n.unableToConnectToServer,
            body: l10n.addServerUnreachableDetail,
            actions: [if (_clientCertAddress != null) _clientCertButton(l10n)],
          ),
        ],
        if (_failure == _Failure.untrusted) ...[
          const SizedBox(height: 14),
          _Notice(
            warning: true,
            body: l10n.untrustedServerCertificate,
            actions: [
              TextButton(
                focusNode: _allowFocus,
                onPressed: _isConnecting ? null : _allowSelfSignedAndRetry,
                style: _noticeButtonStyle(),
                child: Text(l10n.settingsAllowSelfSignedCerts),
              ),
              if (_clientCertAddress != null) _clientCertButton(l10n),
            ],
          ),
        ],
        if (_failure == _Failure.clientCert) ...[
          const SizedBox(height: 14),
          _Notice(
            warning: true,
            body: l10n.clientCertRequired,
            actions: [_clientCertButton(l10n)],
          ),
        ],
      ],
    );
  }

  Widget _clientCertButton(AppLocalizations l10n) => TextButton(
    focusNode: _certFocus,
    onPressed: _isConnecting ? null : _importClientCertAndRetry,
    style: _noticeButtonStyle(),
    child: Text(l10n.clientCertAddButton),
  );

  Widget _field(AppLocalizations l10n) {
    final accent = AppColorScheme.accent;
    final focused = _addressFocus.hasFocus;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        color: _fg(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: focused ? accent : _fg(0.10)),
        boxShadow: focused
            ? [
                BoxShadow(
                  color: accent.withValues(alpha: 0.18),
                  spreadRadius: 4,
                ),
              ]
            : const [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Row(
              children: [
                const SizedBox(width: 14),
                Icon(Icons.language_rounded, size: 20, color: _fg(0.5)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    focusNode: _addressFocus,
                    readOnly: _isConnecting,
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.go,
                    autocorrect: false,
                    cursorColor: accent,
                    style: TextStyle(fontSize: 16, color: _fg(0.95)),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      filled: false,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: l10n.serverAddressHint,
                      hintStyle: TextStyle(color: _fg(0.38)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    onSubmitted: (_) => _submit(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: FilledButton(
                    focusNode: _connectFocus,
                    onPressed: _isConnecting ? null : _submit,
                    style: _primaryStyle(compact: true),
                    child: _isConnecting
                        ? const _Spinner()
                        : Text(l10n.connect),
                  ),
                ),
              ],
            ),
            if (_isConnecting)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: LinearProgressIndicator(
                  minHeight: 2,
                  color: accent,
                  backgroundColor: accent.withValues(alpha: 0.15),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _tvField(AppLocalizations l10n) {
    return Focus(
      focusNode: _addressFocus,
      child: ListenableBuilder(
        listenable: _addressFocus,
        builder: (_, _) {
          final focused = _addressFocus.hasFocus;
          return CustomTVTextField(
            key: _tvFieldKey,
            controller: widget.controller,
            isFocused: focused,
            inputPurpose: InputPurpose.url,
            recentSuggestions: _recentServerAddresses,
            keyboardStyle: _userPreferences.get(
              UserPreferences.keyboardStyle,
            ),
            hint: l10n.serverAddressHint,
            textFieldType: TextFieldType.url,
            keyboardType: KeyboardType.alphabetic,
            filled: true,
            fillColor: focused ? _fg(1) : _fg(0.08),
            borderRadius: 16,
            borderColor: _fg(0.12),
            focusedBorderColor: AppColorScheme.accent,
            hintStyle: TextStyle(
              color: focused
                  ? AppColors.black.withValues(alpha: 0.5)
                  : _fg(0.5),
            ),
            textStyle: TextStyle(color: focused ? AppColors.black : _fg(1)),
            prefixIcon: Icon(
              Icons.language_rounded,
              color: focused ? AppColors.black : _fg(1),
            ),
            popParentOnKeyboardClose: false,
            onFieldSubmitted: (_) => _submit(),
          );
        },
      ),
    );
  }

  Widget _foundStep(AppLocalizations l10n) {
    final server = _found!;
    final tint = _serverTint(server.serverType);
    final continueButton = FilledButton(
      focusNode: _continueFocus,
      onPressed: () => _close(AddServerSaved(server.id)),
      style: _primaryStyle(),
      child: Text(l10n.continueAction),
    );
    final otherButton = TextButton(
      onPressed: _useDifferentAddress,
      style: _ghostStyle(),
      child: Text(l10n.addServerUseDifferentAddress),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: Color(0x2934D399),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                size: 18,
                color: Color(0xFF5EE0AE),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                l10n.addServerFound,
                style: TextStyle(
                  fontSize: 22,
                  height: 1.3,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                  color: _fg(0.96),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _fg(0.04),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: _fg(0.09)),
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: tint.tile,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: ServerTypeIcon(
                  serverType: server.serverType,
                  size: 30,
                  color: tint.glyph,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      server.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: _fg(0.96),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        _Chip(_brand(server.serverType)),
                        if (server.version.isNotEmpty)
                          _Chip('${l10n.version} ${server.version}'),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      server.displayAddress ?? server.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 13,
                        color: _fg(0.55),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          l10n.addServerFoundNote,
          style: TextStyle(fontSize: 14, height: 1.4, color: _fg(0.62)),
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) => constraints.maxWidth < 360
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    continueButton,
                    const SizedBox(height: 10),
                    otherButton,
                  ],
                )
              : OverflowBar(
                  alignment: MainAxisAlignment.end,
                  spacing: 10,
                  overflowSpacing: 10,
                  overflowAlignment: OverflowBarAlignment.end,
                  overflowDirection: VerticalDirection.up,
                  children: [otherButton, continueButton],
                ),
        ),
      ],
    );
  }
}

/// Slides each step in as it replaces the last, with no overlap, so a step's
/// focus nodes are never attached twice.
class _StepEntrance extends StatelessWidget {
  const _StepEntrance({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final direction = Directionality.of(context) == TextDirection.rtl ? -1 : 1;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: Transform.translate(
          offset: Offset((1 - t) * 12 * direction, 0),
          child: child,
        ),
      ),
      child: child,
    );
  }
}

class _ChoiceCard extends StatefulWidget {
  const _ChoiceCard({
    required this.icon,
    required this.tileColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.focusNode,
  });

  final Widget icon;
  final Color tileColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final FocusNode? focusNode;

  @override
  State<_ChoiceCard> createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<_ChoiceCard> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final accent = AppColorScheme.accent;
    final lit = _hovered || _focused;
    final card = AnimatedScale(
      scale: _focused && PlatformDetection.isTV ? 1.02 : 1,
      duration: const Duration(milliseconds: 160),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        decoration: BoxDecoration(
          color: _focused
              ? accent.withValues(alpha: 0.12)
              : _fg(lit ? 0.06 : 0.035),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: _focused ? accent : _fg(lit ? 0.14 : 0.07)),
          boxShadow: _focused
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.35),
                    spreadRadius: 3,
                  ),
                ]
              : const [],
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            focusNode: widget.focusNode,
            onTap: widget.onTap,
            onHover: (hovered) => setState(() => _hovered = hovered),
            onFocusChange: (focused) => setState(() => _focused = focused),
            borderRadius: BorderRadius.circular(18),
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: widget.tileColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: widget.icon,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: _fg(0.95),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          widget.subtitle,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.35,
                            color: _fg(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lit ? accent : _fg(0.06),
                    ),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: lit ? _onAccent : _fg(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    return Semantics(button: true, child: card);
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      icon: Icon(icon, size: 18),
      style:
          IconButton.styleFrom(
            fixedSize: const Size(40, 40),
            minimumSize: const Size(40, 40),
            backgroundColor: _fg(0.07),
            foregroundColor: _fg(0.9),
            disabledForegroundColor: _fg(0.35),
            hoverColor: _fg(0.12),
          ).copyWith(
            side: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.focused)
                  ? BorderSide(color: AppColorScheme.accent, width: 2)
                  : BorderSide.none,
            ),
          ),
    );
  }
}

class _Notice extends StatelessWidget {
  const _Notice({
    required this.warning,
    required this.body,
    this.title,
    this.actions = const [],
  });

  final bool warning;
  final String body;
  final String? title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final accent = warning ? _warningText : _errorText;
    final base = warning ? const Color(0xFFF5B43C) : const Color(0xFFEF4444);
    return Semantics(
      liveRegion: true,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 14, 12),
        decoration: BoxDecoration(
          color: base.withValues(alpha: warning ? 0.08 : 0.10),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: base.withValues(alpha: 0.3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              warning ? Icons.shield_outlined : Icons.error_outline_rounded,
              size: 20,
              color: accent,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) ...[
                    Text(
                      title!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: accent,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                  Text(
                    body,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.45,
                      color: accent.withValues(alpha: 0.85),
                    ),
                  ),
                  if (actions.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Wrap(spacing: 8, runSpacing: 8, children: actions),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _fg(0.07),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: _fg(0.85),
        ),
      ),
    );
  }
}

class _Spinner extends StatelessWidget {
  const _Spinner();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: CircularProgressIndicator(strokeWidth: 2.4, color: _onAccent),
    );
  }
}
