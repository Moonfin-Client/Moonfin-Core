import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../auth/repositories/plex_repository.dart';
import '../../../data/services/plex_tv_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../util/error_message.dart';
import '../../widgets/credential_field.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/login_scaffold.dart';
import '../../widgets/server_type_icon.dart';
import '../../widgets/sign_in_qr_code.dart';

class PlexSignInScreen extends StatefulWidget {
  /// A server address typed in by hand, tried before the ones plex.tv knows.
  final String? address;

  const PlexSignInScreen({super.key, this.address});

  @override
  State<PlexSignInScreen> createState() => _PlexSignInScreenState();
}

class _PlexSignInScreenState extends State<PlexSignInScreen> {
  final _plexTv = GetIt.instance<PlexTvService>();
  final _plexRepository = GetIt.instance<PlexRepository>();

  PlexPin? _pin;
  String? _token;
  List<PlexServer>? _servers;
  PlexServer? _connecting;
  String? _errorMessage;
  Timer? _pollTimer;
  bool _polling = false;
  bool _usePassword = false;
  bool _tvKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _requestPin();
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  void _goBack() {
    if (_usePassword && _token == null) {
      setState(() => _usePassword = false);
    } else {
      context.go(Destinations.serverSelect);
    }
  }

  Future<void> _requestPin() async {
    _pollTimer?.cancel();
    try {
      final pin = await _plexTv.createPin();
      if (!mounted) return;
      setState(() => _pin = pin);
      // plex.tv asks native apps to poll once a second.
      _pollTimer = Timer.periodic(const Duration(seconds: 1), (_) => _poll());
    } catch (e) {
      _showError(e);
    }
  }

  Future<void> _poll() async {
    final pin = _pin;
    if (_polling || pin == null) return;
    if (DateTime.now().isAfter(pin.expiresAt)) {
      await _requestPin();
      return;
    }

    _polling = true;
    String? token;
    try {
      token = await _plexTv.checkPin(pin.id);
    } on DioException catch (e) {
      // Dropped connections, 429 and 5xx usually clear up, so the next tick
      // retries those. Any other answer won't fix itself.
      final status = e.response?.statusCode;
      if (status != null && status < 500 && status != 429) _showError(e);
      return;
    } finally {
      _polling = false;
    }
    if (token == null || !mounted) return;
    await _signedIn(token);
  }

  Future<void> _signedIn(String token) async {
    _pollTimer?.cancel();
    setState(() => _token = token);
    await _loadServers(token);
  }

  Future<void> _loadServers(String token) async {
    try {
      final servers = await _plexRepository.loadServers(
        token,
        address: widget.address,
      );
      if (!mounted) return;
      setState(() => _servers = servers);
      if (servers.length == 1) await _connect(servers.first);
    } catch (e) {
      _showError(e);
    }
  }

  Future<void> _connect(PlexServer server) async {
    final token = _token;
    if (token == null || _connecting != null) return;
    setState(() {
      _connecting = server;
      _errorMessage = null;
    });
    try {
      final connected = await _plexRepository.connect(server, token);
      if (!mounted) return;
      if (connected) {
        context.go(Destinations.home);
        return;
      }
      setState(() {
        _connecting = null;
        _errorMessage = AppLocalizations.of(context)
            .unableToConnectTo(server.name);
      });
    } catch (e) {
      _connecting = null;
      _showError(e);
    }
  }

  void _showError(Object e) {
    if (!mounted) return;
    _pollTimer?.cancel();
    setState(
      () => _errorMessage = describeError(e, AppLocalizations.of(context)),
    );
  }

  /// An approved code stays approved, so only a failure before approval
  /// needs a new one.
  void _retry() {
    final token = _token;
    setState(() {
      _errorMessage = null;
      if (token == null) _pin = null;
    });
    if (token == null) {
      _requestPin();
    } else if (_servers == null) {
      _loadServers(token);
    }
  }

  @override
  Widget build(BuildContext context) =>
      SignInBackScope(onBack: _goBack, child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final qrPin = PlatformDetection.isTV ? _shownPin : null;
    return RequestInitialFocus(
      child: LoginScaffold(
        maxWidth: qrPin == null ? 700 : 900,
        header: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Image.asset('assets/images/logo_and_text.png', height: 80),
        ),
        footer: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          height: PlatformDetection.isTV && _tvKeyboardVisible ? 280 : 0,
        ),
        child: _withQrBeside(
          qrPin,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ServerTypeIcon(serverType: ServerType.plex, size: 28),
                  const SizedBox(width: 10),
                  Text(
                    l10n.signInWithPlex,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildBody(l10n),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _goBack,
                      icon: const Icon(Icons.arrow_back, size: 18),
                      label: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(l10n.back),
                      ),
                      style: _focusableButtonStyle(),
                    ),
                  ),
                  if (_errorMessage != null) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _retry,
                        icon: const Icon(Icons.refresh, size: 18),
                        label: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(l10n.tryAgain),
                        ),
                        style: _focusableButtonStyle(),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// The code on screen, or null while something else shows.
  PlexPin? get _shownPin =>
      _errorMessage == null &&
          _connecting == null &&
          _servers == null &&
          !_usePassword &&
          _token == null
      ? _pin
      : null;

  /// A TV has no browser, so the code's QR sits beside everything else for a
  /// phone to scan. The row stays without it, so the buttons keep their focus
  /// as the code view comes and goes.
  Widget _withQrBeside(PlexPin? pin, Widget content) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(child: content),
      if (pin != null) ...[
        const SizedBox(width: 40),
        SignInQrCode(data: pin.linkUrl, size: 200),
      ],
    ],
  );

  Widget _buildBody(AppLocalizations l10n) {
    final secondary = AppColorScheme.onSurface.withValues(alpha: 0.7);
    if (_errorMessage != null) {
      return Text(
        _errorMessage!,
        style: TextStyle(color: AppColorScheme.statusRequested),
        textAlign: TextAlign.center,
      );
    }

    if (_connecting != null) {
      return _buildLoading(l10n.connectingToServerEllipsis);
    }

    final servers = _servers;
    if (servers != null) {
      if (servers.isEmpty) {
        return Text(l10n.plexNoServers, style: TextStyle(color: secondary));
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.selectAServer,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...servers.map(_buildServerTile),
        ],
      );
    }

    if (_usePassword && _token == null) {
      return _PasswordForm(
        onSignedIn: _signedIn,
        onKeyboardVisibilityChanged: (visible) {
          if (_tvKeyboardVisible != visible) {
            setState(() => _tvKeyboardVisible = visible);
          }
        },
      );
    }

    final pin = _shownPin;
    if (pin == null) return _buildLoading();

    return Column(
      children: [
        Text(
          l10n.plexLinkInstructions,
          style: TextStyle(color: secondary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          pin.code,
          style: const TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            letterSpacing: 8,
          ),
        ),
        if (!PlatformDetection.isTV) ...[
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () => launchUrl(
              Uri.parse(pin.linkUrl),
              mode: LaunchMode.externalApplication,
            ),
            icon: const Icon(Icons.open_in_new, size: 18),
            label: Text(l10n.plexOpenLink),
            style: _focusableButtonStyle(),
          ),
        ],
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 10),
            Text(
              l10n.plexWaitingForApproval,
              style: TextStyle(color: secondary),
            ),
          ],
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () => setState(() => _usePassword = true),
          icon: const Icon(Icons.password, size: 18),
          label: Text(l10n.plexSignInWithPassword),
          style: _focusableButtonStyle(),
        ),
      ],
    );
  }

  Widget _buildLoading([String? message]) {
    return Column(
      children: [
        const SizedBox(
          height: 28,
          width: 28,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        if (message != null) ...[
          const SizedBox(height: 12),
          Text(
            message,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildServerTile(PlexServer server) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: AppColorScheme.surface.withValues(alpha: 0.5),
        borderRadius: AppRadius.circular(12),
        child: InkWell(
          borderRadius: AppRadius.circular(12),
          onTap: () => _connect(server),
          focusColor: AppColorScheme.accent,
          hoverColor: AppColorScheme.onSurface.withValues(alpha: 0.08),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const ServerTypeIcon(serverType: ServerType.plex, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        server.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColorScheme.onSurface.withValues(
                            alpha: 0.9,
                          ),
                        ),
                      ),
                      Text(
                        server.address ??
                            AppLocalizations.of(context).noReachableAddress,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColorScheme.onSurface.withValues(
                            alpha: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

ButtonStyle _focusableButtonStyle() {
  return ButtonStyle(
    side: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused) ||
          states.contains(WidgetState.hovered)) {
        return BorderSide(color: AppColorScheme.accent, width: 2);
      }
      return BorderSide(color: AppColorScheme.onSurface.withValues(alpha: 0.2));
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused) ||
          states.contains(WidgetState.hovered)) {
        return AppColorScheme.accent;
      }
      return AppColorScheme.onSurface.withValues(alpha: 0.8);
    }),
  );
}

/// Signs in with the account's email or username and password, for anyone
/// who'd rather not approve a code.
class _PasswordForm extends StatefulWidget {
  final Future<void> Function(String token) onSignedIn;
  final ValueChanged<bool> onKeyboardVisibilityChanged;

  const _PasswordForm({
    required this.onSignedIn,
    required this.onKeyboardVisibilityChanged,
  });

  @override
  State<_PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<_PasswordForm> {
  final _plexTv = GetIt.instance<PlexTvService>();
  final _login = TextEditingController();
  final _password = TextEditingController();
  final _code = TextEditingController();
  final _loginFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _codeFocus = FocusNode();
  bool _busy = false;
  bool _needsCode = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _loginFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    _code.dispose();
    _loginFocus.dispose();
    _passwordFocus.dispose();
    _codeFocus.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final login = _login.text.trim();
    if (login.isEmpty || _busy) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final token = await _plexTv.signIn(
        login,
        _password.text,
        code: _needsCode ? _code.text.trim() : null,
      );
      if (mounted) await widget.onSignedIn(token);
    } catch (e) {
      if (!mounted) return;
      final askForCode = !_needsCode && plexNeedsVerificationCode(e);
      setState(() {
        _busy = false;
        _needsCode = _needsCode || askForCode;
        _error = describeError(e, AppLocalizations.of(context));
      });
      if (askForCode) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _codeFocus.requestFocus();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CredentialField(
          controller: _login,
          focusNode: _loginFocus,
          label: l10n.emailOrUsername,
          enabled: !_busy,
          down: _passwordFocus,
          onKeyboardVisibilityChanged: widget.onKeyboardVisibilityChanged,
        ),
        const SizedBox(height: 16),
        CredentialField(
          controller: _password,
          focusNode: _passwordFocus,
          label: l10n.password,
          enabled: !_busy,
          isPassword: true,
          up: _loginFocus,
          down: _needsCode ? _codeFocus : null,
          onSubmitted: _needsCode ? null : _signIn,
          onKeyboardVisibilityChanged: widget.onKeyboardVisibilityChanged,
        ),
        if (_needsCode) ...[
          const SizedBox(height: 16),
          CredentialField(
            controller: _code,
            focusNode: _codeFocus,
            label: l10n.plexVerificationCode,
            enabled: !_busy,
            up: _passwordFocus,
            onSubmitted: _signIn,
            onKeyboardVisibilityChanged: widget.onKeyboardVisibilityChanged,
          ),
        ],
        if (_error != null) ...[
          const SizedBox(height: 12),
          Text(
            _error!,
            style: TextStyle(color: AppColorScheme.statusRequested),
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: _busy ? null : _signIn,
          icon: _busy
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.login, size: 18),
          label: Text(l10n.signIn),
          style: _focusableButtonStyle(),
        ),
      ],
    );
  }
}
