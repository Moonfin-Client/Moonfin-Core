import 'dart:async';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../l10n/app_localizations.dart';
import '../../../auth/models/login_state.dart';
import '../../../auth/models/server.dart';
import '../../../auth/repositories/auth_repository.dart';
import '../../../auth/repositories/server_repository.dart';
import '../../../auth/repositories/session_repository.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/pin_code_util.dart';
import '../../../util/platform_detection.dart';
import '../../../util/web_diagnostics_failure.dart';
import '../../navigation/destinations.dart';
import '../../widgets/login_scaffold.dart';
import '../../widgets/pin_entry_dialog.dart';

final _kAccent = AppColorScheme.accent;

class LoginScreen extends StatefulWidget {
  final String serverId;
  final String? prefillUsername;
  final bool hasPassword;

  const LoginScreen({
    super.key,
    required this.serverId,
    this.prefillUsername,
    this.hasPassword = true,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _serverRepo = GetIt.instance<ServerRepository>();
  final _authRepo = GetIt.instance<AuthRepository>();
  final _sessionRepo = GetIt.instance<SessionRepository>();
  final _clientFactory = GetIt.instance<MediaServerClientFactory>();
  final _userPreferences = GetIt.instance<UserPreferences>();

  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _usernameTvFieldKey = GlobalKey<CustomTVTextFieldState>();
  final _passwordTvFieldKey = GlobalKey<CustomTVTextFieldState>();
  final _signInFocus = FocusNode();
  final _backFocus = FocusNode();
  final _qcBtnFocus = FocusNode();
  final _pwBtnFocus = FocusNode();

  Server? _server;
  MediaServerClient? _client;
  bool _isLoading = false;
  String? _errorMessage;

  bool _supportsQuickConnect = false;
  bool _showQuickConnect = true;
  bool _tvKeyboardVisible = false;

  Timer? _quickConnectTimer;
  String? _quickConnectCode;
  String? _quickConnectSecret;

  bool get _hasUsername => widget.prefillUsername != null;
  bool get _hasPassword => widget.hasPassword;
  bool get _isMoonfin => ThemeRegistry.active.id == ThemeRegistry.moonfinId;

  Color _loginForeground(double alpha) {
    return (_isMoonfin ? Colors.white : AppColorScheme.onSurface).withValues(
      alpha: alpha,
    );
  }

  Color get _loginForegroundSolid {
    return _isMoonfin ? Colors.white : AppColorScheme.onSurface;
  }

  Color get _loginErrorColor {
    return _isMoonfin
        ? const Color(0xFFef4444)
        : AppColorScheme.statusRequested;
  }

  @override
  void initState() {
    super.initState();
    if (widget.prefillUsername != null) {
      _usernameController.text = widget.prefillUsername!;
    }
    _setupFocusHandlers();
    _initServer();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _signInFocus.dispose();
    _backFocus.dispose();
    _qcBtnFocus.dispose();
    _pwBtnFocus.dispose();
    _quickConnectTimer?.cancel();
    super.dispose();
  }

  void _setupFocusHandlers() {
    _usernameFocus.onKeyEvent = (node, event) {
      if (_handleTvFieldOpen(event, _usernameFocus)) {
        return KeyEventResult.handled;
      }
      return _verticalNav(
        event,
        up: _supportsQuickConnect ? _pwBtnFocus : null,
        down: _hasPassword ? _passwordFocus : _signInFocus,
      );
    };
    _passwordFocus.onKeyEvent = (node, event) {
      if (_handleTvFieldOpen(event, _passwordFocus)) {
        return KeyEventResult.handled;
      }
      return _verticalNav(
        event,
        up: _hasUsername
            ? (_supportsQuickConnect ? _pwBtnFocus : null)
            : _usernameFocus,
        down: _signInFocus,
      );
    };
  }

  bool _handleTvFieldOpen(KeyEvent event, FocusNode focusNode) {
    if (!PlatformDetection.isTV || _isLoading) return false;
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) return false;
    if (event.logicalKey.isBackKey) {
      final tvFieldKey = focusNode == _usernameFocus
          ? _usernameTvFieldKey
          : _passwordTvFieldKey;
      if (event is KeyDownEvent &&
          (tvFieldKey.currentState?.isKeyboardVisible ?? false)) {
        tvFieldKey.currentState?.closeKeyboard();
        focusNode.requestFocus();
        return true;
      }
      return false;
    }
    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.select) {
      if (!focusNode.hasFocus) focusNode.requestFocus();
      if (focusNode == _usernameFocus) {
        _usernameTvFieldKey.currentState?.openKeyboard();
      } else if (focusNode == _passwordFocus) {
        _passwordTvFieldKey.currentState?.openKeyboard();
      }
      return true;
    }
    return false;
  }

  void _handleTvKeyboardVisibility(
    bool visible,
    GlobalKey<CustomTVTextFieldState> fieldKey,
  ) {
    if (_tvKeyboardVisible != visible) {
      setState(() {
        _tvKeyboardVisible = visible;
      });
    }
    if (!visible) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final fieldContext = fieldKey.currentContext;
      if (fieldContext == null || !mounted) return;
      Scrollable.ensureVisible(
        fieldContext,
        alignment: 0.12,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }

  KeyEventResult _verticalNav(
    KeyEvent event, {
    FocusNode? up,
    FocusNode? down,
  }) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp && up != null) {
      up.requestFocus();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowDown && down != null) {
      down.requestFocus();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  Future<void> _initServer() async {
    await _serverRepo.loadStoredServers();
    final server = _serverRepo.getServer(widget.serverId);
    if (server == null) {
      if (mounted) context.go(Destinations.serverSelect);
      return;
    }

    final client = _clientFactory.getClient(
      serverId: server.id,
      serverType: server.serverType,
      baseUrl: server.address,
    );

    final features = FeatureDetector(
      serverType: server.serverType,
      serverVersion: server.version,
    );

    if (mounted) {
      final supportsQC = features.supportsQuickConnect;
      setState(() {
        _server = server;
        _client = client;
        _supportsQuickConnect = supportsQC;
        _showQuickConnect = supportsQC;
      });
      if (supportsQC) {
        _startQuickConnect(isInitial: true);
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _focusCredentialEntry();
          }
        });
      }
    }
  }

  void _focusCredentialEntry() {
    if (_hasUsername) {
      (_hasPassword ? _passwordFocus : _signInFocus).requestFocus();
      return;
    }
    _usernameFocus.requestFocus();
  }

  void _selectQuickConnect() {
    if (_showQuickConnect) return;
    setState(() {
      _showQuickConnect = true;
      _errorMessage = null;
    });
    if (_quickConnectTimer == null) _startQuickConnect();
  }

  void _selectPassword() {
    if (!_showQuickConnect) return;
    _stopQuickConnect();
    setState(() {
      _showQuickConnect = false;
      _errorMessage = null;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusCredentialEntry();
      }
    });
  }

  Future<void> _startQuickConnect({bool isInitial = false}) async {
    final client = _client;
    if (client == null) return;

    try {
      final result = await client.authApi.initiateQuickConnect();
      final code = result['Code'] as String?;
      final secret = result['Secret'] as String?;
      if (code == null || secret == null) return;

      if (mounted) {
        setState(() {
          _quickConnectCode = code;
          _quickConnectSecret = secret;
        });
      }

      _quickConnectTimer = Timer.periodic(
        const Duration(seconds: 5),
        (_) => _pollQuickConnect(),
      );
    } on DioException catch (e) {
      if (!mounted) return;
      final status = e.response?.statusCode;
      final detail =
          e.response?.data?.toString() ??
          e.error?.toString() ??
          e.message ??
          'unknown error';
      if (_maybeOpenWebDiagnosticsForFailure(
        targetUrl: _server?.address,
        errorType: e.type.name,
        statusCode: status,
        message: detail,
      )) {
        return;
      }
      final l10n = AppLocalizations.of(context);
      final isQcDisabled = status == 401 ||
          detail.toLowerCase().contains('disabled') ||
          detail.toLowerCase().contains('quickconnect is disabled') ||
          detail.toLowerCase().contains('quick connect is disabled');

      setState(() {
        _errorMessage = isQcDisabled
            ? 'QuickConnect is disabled'
            : (status == null
                ? l10n.quickConnectUnavailableWithStatus(e.type.name, detail)
                : l10n.quickConnectUnavailableWithStatus(
                    '$status, ${e.type.name}',
                    detail,
                  ));
      });

      if (isQcDisabled && isInitial) {
        _selectPassword();
      }
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      setState(() => _errorMessage = l10n.quickConnectUnavailable('$e'));
    }
  }

  Future<void> _pollQuickConnect() async {
    final client = _client;
    final secret = _quickConnectSecret;
    if (client == null || secret == null) return;

    try {
      final result = await client.authApi.checkQuickConnect(secret);
      final authenticated = result['Authenticated'] as bool? ?? false;
      if (authenticated) {
        _stopQuickConnect();
        final authResult = await _authRepo.authenticateWithQuickConnect(
          client: client,
          serverId: _server!.id,
          secret: secret,
        );
        if (authResult is Authenticated && mounted) {
          await _sessionRepo.switchCurrentSession(
            serverId: authResult.serverId,
            userId: authResult.userId,
          );
          if (mounted) {
            final store = GetIt.instance<PreferenceStore>();
            final pinUtil = PinCodeUtil(store, authResult.userId);

            if (pinUtil.isPinEnabled) {
              final verified = await PinEntryDialog.show(
                context,
                mode: PinEntryMode.verify,
                onVerify: pinUtil.verifyPin,
                onForgotPin: () {
                  if (mounted) context.go(Destinations.serverSelect);
                },
              );

              if (!verified) {
                // For quick connect, if PIN verification fails, go back to login screen
                // to allow user to try with different credentials or method
                if (mounted) context.go('${Destinations.login}?serverId=${_server!.id}');
                return;
              }
            }

            if (mounted) context.go(Destinations.home);
          }
        }
      }
    } catch (_) {}
  }

  void _stopQuickConnect() {
    _quickConnectTimer?.cancel();
    _quickConnectTimer = null;
    if (mounted) {
      setState(() {
        _quickConnectCode = null;
        _quickConnectSecret = null;
      });
    }
  }

  void _navigateBack() {
    final server = _server;
    if (server == null) {
      context.go(Destinations.serverSelect);
      return;
    }
    context.go('${Destinations.server}?serverId=${server.id}');
  }

  void _finishLoginWithError(String message) {
    setState(() {
      _isLoading = false;
      _errorMessage = message;
    });

    if (!PlatformDetection.isTV) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      (_hasPassword ? _passwordFocus : _signInFocus).requestFocus();
    });
  }

  bool _maybeOpenWebDiagnosticsForFailure({
    required String? targetUrl,
    String? errorType,
    int? statusCode,
    String? message,
  }) {
    if (!PlatformDetection.isWeb || !mounted) {
      return false;
    }

    final reason = inferWebDiagnosticsFailureReason(
      pageUri: Uri.base,
      targetUrl: targetUrl,
      errorType: errorType,
      statusCode: statusCode,
      message: message,
    );
    if (reason == null) {
      return false;
    }

    context.go(
      Destinations.webDiagnosticsRoute(
        reason: webDiagnosticsFailureReasonToQuery(reason),
        targetUrl: targetUrl,
        detail: message,
      ),
    );
    return true;
  }

  Future<void> _login() async {
    final username = _usernameController.text.trim();
    if (username.isEmpty || _client == null || _server == null) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await _authRepo.authenticate(
        client: _client!,
        serverId: _server!.id,
        username: username,
        password: _passwordController.text,
      );

      if (!mounted) return;

      final l10n = AppLocalizations.of(context);
      switch (result) {
        case Authenticated():
          final switched = await _sessionRepo.switchCurrentSession(
            serverId: result.serverId,
            userId: result.userId,
            username: username,
            password: _passwordController.text,
          );
          if (!mounted) return;
          if (switched) {
            final store = GetIt.instance<PreferenceStore>();
            final pinUtil = PinCodeUtil(store, result.userId);

            if (pinUtil.isPinEnabled) {
              final verified = await PinEntryDialog.show(
                context,
                mode: PinEntryMode.verify,
                onVerify: pinUtil.verifyPin,
                onForgotPin: () {
                  if (mounted) context.go(Destinations.serverSelect);
                },
              );

              if (!verified) {
                if (mounted) context.go('${Destinations.login}?serverId=${_server!.id}');
                return;
              }
            }

            if (mounted) context.go(Destinations.home);
            return;
          }
          _finishLoginWithError(l10n.loginFailed);
        case ApiClientError(:final error, :final errorType, :final statusCode):
          if (_maybeOpenWebDiagnosticsForFailure(
            targetUrl: _server?.address,
            errorType: errorType,
            statusCode: statusCode,
            message: error,
          )) {
            return;
          }
          _finishLoginWithError(error);
        case ServerUnavailable():
          _finishLoginWithError(l10n.serverUnavailable);
        default:
          _finishLoginWithError(l10n.loginFailed);
      }
    } catch (_) {
      if (!mounted) return;
      _finishLoginWithError(AppLocalizations.of(context).loginFailed);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_server == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final l10n = AppLocalizations.of(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _navigateBack();
      },
      child: LoginScaffold(
        maxWidth: 600,
        header: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Image.asset('assets/images/logo_and_text.png', height: 64),
        ),
        footer: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          height: PlatformDetection.isTV && _tvKeyboardVisible ? 280 : 0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.signIn,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.connectingToServer(_server!.name),
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: _loginForeground(0.5)),
            ),
            const SizedBox(height: 24),
            if (_supportsQuickConnect) ...[
              _buildToggleRow(),
              const SizedBox(height: 24),
              if (_showQuickConnect)
                _buildQuickConnectContent()
              else
                _buildCredentialsContent(),
            ] else
              _buildCredentialsContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleRow() {
    final l10n = AppLocalizations.of(context);
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 12,
      children: [
        _buildToggleButton(
          label: l10n.quickConnect,
          isSelected: _showQuickConnect,
          focusNode: _qcBtnFocus,
          onPressed: _selectQuickConnect,
        ),
        _buildToggleButton(
          label: l10n.password,
          isSelected: !_showQuickConnect,
          focusNode: _pwBtnFocus,
          onPressed: _selectPassword,
        ),
      ],
    );
  }

  Widget _buildToggleButton({
    required String label,
    required bool isSelected,
    required FocusNode focusNode,
    required VoidCallback onPressed,
  }) {
    if (isSelected) {
      return FilledButton(
        focusNode: focusNode,
        onPressed: onPressed,
        style:
            FilledButton.styleFrom(
              backgroundColor: _kAccent,
              foregroundColor: _loginForegroundSolid,
              minimumSize: const Size(120, 44),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: AppRadius.circular(24),
              ),
            ).copyWith(
              side: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.focused)) {
                  return BorderSide(color: _loginForegroundSolid, width: 2);
                }
                return null;
              }),
            ),
        child: Text(label),
      );
    }
    return OutlinedButton(
      focusNode: focusNode,
      onPressed: onPressed,
      style: _outlinedFocusStyle(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ).copyWith(minimumSize: const WidgetStatePropertyAll(Size(120, 44))),
      child: Text(label),
    );
  }

  ButtonStyle _outlinedFocusStyle({required EdgeInsetsGeometry padding}) {
    return OutlinedButton.styleFrom(
      foregroundColor: _loginForeground(0.8),
      padding: padding,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.circular(24)),
    ).copyWith(
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return BorderSide(color: _kAccent, width: 2);
        }
        return BorderSide(color: _loginForeground(0.2));
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused)) return _kAccent;
        return _loginForeground(0.8);
      }),
    );
  }

  Widget _buildQuickConnectContent() {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n.quickConnectInstruction,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: _loginForeground(0.7)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        if (_quickConnectCode != null) ...[
          Text(
            _formatCode(_quickConnectCode!),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              letterSpacing: 8,
              color: _kAccent,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: _kAccent.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.waitingForAuthorization,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: _loginForeground(0.5)),
          ),
        ] else ...[
          if (_errorMessage == null)
            const CircularProgressIndicator(),
        ],
        if (_errorMessage != null) ...[
          const SizedBox(height: 16),
          Text(_errorMessage!, style: TextStyle(color: _loginErrorColor)),
        ],
        const SizedBox(height: 24),
        _buildActionButton(
          label: l10n.back,
          focusNode: _backFocus,
          onPressed: _navigateBack,
        ),
      ],
    );
  }

  Widget _buildCredentialsContent() {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!_hasUsername) ...[
          _buildTextField(
            controller: _usernameController,
            focusNode: _usernameFocus,
            label: l10n.username,
            textInputAction: _hasPassword
                ? TextInputAction.next
                : TextInputAction.done,
            onSubmitted: (_) {
              (_hasPassword ? _passwordFocus : _signInFocus).requestFocus();
            },
          ),
          const SizedBox(height: 16),
        ],
        if (_hasPassword)
          _buildTextField(
            controller: _passwordController,
            focusNode: _passwordFocus,
            label: l10n.password,
            obscureText: true,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _login(),
          ),
        if (_errorMessage != null) ...[
          const SizedBox(height: 12),
          Text(_errorMessage!, style: TextStyle(color: _loginErrorColor)),
        ],
        const SizedBox(height: 24),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildActionButton(
              label: l10n.back,
              focusNode: _backFocus,
              onPressed: _navigateBack,
            ),
            _buildActionButton(
              label: l10n.signIn,
              focusNode: _signInFocus,
              onPressed: _isLoading ? null : _login,
              isLoading: _isLoading,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    bool obscureText = false,
    TextInputAction? textInputAction,
    ValueChanged<String>? onSubmitted,
  }) {
    if (PlatformDetection.isTV) {
      final tvFieldKey = identical(controller, _usernameController)
          ? _usernameTvFieldKey
          : _passwordTvFieldKey;
      return Focus(
        focusNode: focusNode,
        child: ListenableBuilder(
          listenable: focusNode,
          builder: (_, _) {
            final focused = focusNode.hasFocus;
            return CustomTVTextField(
              key: tvFieldKey,
              controller: controller,
              isFocused: focused,
              inputPurpose: obscureText
                  ? InputPurpose.password
                  : InputPurpose.username,
              preferSystemIme: _userPreferences.get(
                UserPreferences.preferSystemImeKeyboard,
              ),
              hint: label,
              filled: true,
              fillColor: focused
                  ? _loginForegroundSolid
                  : _loginForeground(0.08),
              borderRadius: 12,
              borderColor: _loginForeground(0.1),
              focusedBorderColor: _kAccent,
              hintStyle: TextStyle(
                color: focused
                    ? AppColors.black.withValues(alpha: 0.5)
                    : _loginForeground(0.5),
              ),
              textStyle: TextStyle(
                color: focused ? AppColors.black : _loginForegroundSolid,
              ),
              textFieldType: obscureText
                  ? TextFieldType.password
                  : TextFieldType.other,
              popParentOnKeyboardClose: false,
              onFieldSubmitted: onSubmitted,
              onVisibilityChanged: (visible) =>
                  _handleTvKeyboardVisibility(visible, tvFieldKey),
            );
          },
        ),
      );
    }

    return TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      textInputAction: textInputAction,
      enabled: !_isLoading,
      onSubmitted: onSubmitted,
      style: TextStyle(color: _loginForegroundSolid),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: _loginForeground(0.5)),
        filled: true,
        fillColor: _loginForeground(0.08),
        border: OutlineInputBorder(
          borderRadius: AppRadius.circular(12),
          borderSide: BorderSide(color: _loginForeground(0.1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular(12),
          borderSide: BorderSide(color: _loginForeground(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular(12),
          borderSide: BorderSide(color: _kAccent, width: 2),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required FocusNode focusNode,
    required VoidCallback? onPressed,
    bool isLoading = false,
  }) {
    return OutlinedButton(
      focusNode: focusNode,
      onPressed: onPressed,
      style: _outlinedFocusStyle(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: _loginForegroundSolid,
              ),
            )
          : Text(label),
    );
  }

  String _formatCode(String code) {
    if (code.length == 6) return '${code.substring(0, 3)} ${code.substring(3)}';
    return code;
  }
}
