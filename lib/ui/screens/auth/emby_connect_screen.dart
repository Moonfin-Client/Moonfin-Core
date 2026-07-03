import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/repositories/emby_connect_repository.dart';
import '../../../data/services/emby_connect_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../navigation/destinations.dart';
import '../../widgets/login_scaffold.dart';
import '../../widgets/server_type_icon.dart';
import '../../widgets/focus/request_initial_focus.dart';

enum _EmbyConnectPhase {
  credentials,
  authenticating,
  serverList,
  connectingToServer,
}

class EmbyConnectScreen extends StatefulWidget {
  const EmbyConnectScreen({super.key});

  @override
  State<EmbyConnectScreen> createState() => _EmbyConnectScreenState();
}

class _EmbyConnectScreenState extends State<EmbyConnectScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _usernameTvFieldKey = GlobalKey<CustomTVTextFieldState>();
  final _passwordTvFieldKey = GlobalKey<CustomTVTextFieldState>();
  final _connectRepository = GetIt.instance<EmbyConnectRepository>();
  final _userPreferences = GetIt.instance<UserPreferences>();

  _EmbyConnectPhase _phase = _EmbyConnectPhase.credentials;
  List<EmbyConnectServer> _servers = const [];
  String? _errorMessage;
  EmbyConnectAuthSession? _session;
  bool _tvKeyboardVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final username = _usernameController.text.trim();
    if (username.isEmpty) return;

    setState(() {
      _phase = _EmbyConnectPhase.authenticating;
      _errorMessage = null;
    });

    try {
      final result = await _connectRepository.authenticateAndLoadServers(
        username: username,
        password: _passwordController.text,
      );
      final session = result.session;

      if (!result.isSuccess || session == null) {
        if (!mounted) return;
        setState(() {
          _phase = _EmbyConnectPhase.credentials;
          _errorMessage = _messageForFailure(result.failure);
        });
        return;
      }

      _session = session;
      _servers = session.servers;

      if (!mounted) return;
      if (_servers.length == 1) {
        await _connectToServer(_servers.first);
      } else {
        setState(() => _phase = _EmbyConnectPhase.serverList);
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _phase = _EmbyConnectPhase.credentials;
        _errorMessage = e.toString();
      });
    }
  }

  Future<void> _connectToServer(EmbyConnectServer server) async {
    final session = _session;
    final username = _usernameController.text.trim();
    if (session == null || username.isEmpty) return;

    setState(() {
      _phase = _EmbyConnectPhase.connectingToServer;
      _errorMessage = null;
    });

    final result = await _connectRepository.connectToServer(
      session: session,
      server: server,
      fallbackUsername: username,
    );

    if (!mounted) return;

    if (result.isSuccess && result.success != null) {
      if (result.success!.switched) {
        context.go(Destinations.home);
      } else {
        context.go(
          '${Destinations.server}?serverId=${result.success!.serverId}',
        );
      }
      return;
    }

    setState(() {
      _phase = _EmbyConnectPhase.serverList;
      _errorMessage = _messageForFailure(
        result.failure,
        fallbackTarget: server.name,
      );
    });
  }

  String _messageForFailure(
    EmbyConnectFailure? failure, {
    String? fallbackTarget,
  }) {
    final l10n = AppLocalizations.of(context);
    if (failure == null) {
      return fallbackTarget == null
          ? l10n.embyConnectNetworkError
          : l10n.unableToConnectTo(fallbackTarget);
    }

    switch (failure.reason) {
      case EmbyConnectFailureReason.invalidCredentials:
        return l10n.invalidEmbyConnectLogin;
      case EmbyConnectFailureReason.invalidAuthResponse:
        return l10n.invalidEmbyConnectCredentials;
      case EmbyConnectFailureReason.noLinkedServers:
        return l10n.noLinkedServers;
      case EmbyConnectFailureReason.exchangeUnsupported:
        return l10n.embyConnectExchangeNotSupported;
      case EmbyConnectFailureReason.invalidExchangeResponse:
        return l10n.invalidServerExchangeResponse;
      case EmbyConnectFailureReason.noReachableAddress:
        return l10n.noReachableAddress;
      case EmbyConnectFailureReason.unableToConnectServer:
        return l10n.unableToConnectTo(failure.detail ?? fallbackTarget ?? '');
      case EmbyConnectFailureReason.network:
        if (failure.statusCode != null) {
          return '${l10n.embyConnectNetworkError} (HTTP ${failure.statusCode})';
        }
        return l10n.embyConnectNetworkError;
      case EmbyConnectFailureReason.unknown:
        return failure.detail ?? l10n.embyConnectNetworkError;
    }
  }

  void _resetAfterError() {
    setState(() {
      _errorMessage = null;
      _phase = _servers.isEmpty
          ? _EmbyConnectPhase.credentials
          : _EmbyConnectPhase.serverList;
    });
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

  @override
  Widget build(BuildContext context) {
    final showingCredentials =
        _phase == _EmbyConnectPhase.credentials ||
        _phase == _EmbyConnectPhase.authenticating;
    return RequestInitialFocus(
      targetNode: showingCredentials ? _usernameFocus : null,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return LoginScaffold(
      maxWidth: 700,
      header: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Image.asset('assets/images/logo_and_text.png', height: 80),
      ),
      footer: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: PlatformDetection.isTV && _tvKeyboardVisible ? 280 : 0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ServerTypeIcon(serverType: ServerType.emby, size: 28),
              const SizedBox(width: 10),
              Text(
                l10n.embyConnect,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            l10n.embyConnectSignInSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_phase) {
      case _EmbyConnectPhase.credentials:
      case _EmbyConnectPhase.authenticating:
        return _buildCredentialsView();
      case _EmbyConnectPhase.serverList:
        return _buildServerListView();
      case _EmbyConnectPhase.connectingToServer:
        return _buildLoadingView(
          AppLocalizations.of(context).connectingToServerEllipsis,
        );
    }
  }

  Widget _buildCredentialsView() {
    final l10n = AppLocalizations.of(context);
    final isBusy = _phase == _EmbyConnectPhase.authenticating;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildCredentialsInput(
          controller: _usernameController,
          focusNode: _usernameFocus,
          label: l10n.emailOrUsername,
          isBusy: isBusy,
          down: _passwordFocus,
        ),
        const SizedBox(height: 16),
        _buildCredentialsInput(
          controller: _passwordController,
          focusNode: _passwordFocus,
          label: l10n.password,
          isBusy: isBusy,
          isPassword: true,
          up: _usernameFocus,
        ),
        if (_errorMessage != null) ...[
          const SizedBox(height: 12),
          Text(
            _errorMessage!,
            style: TextStyle(color: AppColorScheme.statusRequested),
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: isBusy
                    ? null
                    : () => context.go(Destinations.serverSelect),
                icon: const Icon(Icons.arrow_back, size: 18),
                label: FittedBox(fit: BoxFit.scaleDown, child: Text(l10n.back)),
                style: _focusableButtonStyle(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: isBusy ? null : _signIn,
                icon: isBusy
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.login, size: 18),
                label: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(l10n.signIn),
                ),
                style: _focusableButtonStyle(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCredentialsInput({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required bool isBusy,
    bool isPassword = false,
    FocusNode? up,
    FocusNode? down,
  }) {
    final tvFieldKey = identical(controller, _usernameController)
        ? _usernameTvFieldKey
        : _passwordTvFieldKey;

    if (!PlatformDetection.isTV) {
      return TextField(
        controller: controller,
        focusNode: focusNode,
        enabled: !isBusy,
        obscureText: isPassword,
        textInputAction: isPassword
            ? TextInputAction.done
            : TextInputAction.next,
        onSubmitted: isPassword ? (_) => _signIn() : null,
        style: TextStyle(color: AppColorScheme.onSurface),
        decoration: _inputDecoration(label),
      );
    }

    return Focus(
      focusNode: focusNode,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey.isBackKey) {
          if (event is KeyDownEvent &&
              (tvFieldKey.currentState?.isKeyboardVisible ?? false)) {
            tvFieldKey.currentState?.closeKeyboard();
            return KeyEventResult.handled;
          }
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
        if (event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.select) {
          if (!focusNode.hasFocus) focusNode.requestFocus();
          tvFieldKey.currentState?.openKeyboard();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: ListenableBuilder(
        listenable: focusNode,
        builder: (_, _) {
          final focused = focusNode.hasFocus;
          return CustomTVTextField(
            key: tvFieldKey,
            controller: controller,
            isFocused: focused,
            inputPurpose: isPassword
                ? InputPurpose.password
                : InputPurpose.username,
            preferSystemIme: _userPreferences.get(
              UserPreferences.preferSystemImeKeyboard,
            ),
            hint: label,
            filled: true,
            fillColor: focused
                ? AppColorScheme.buttonFocused
                : AppColorScheme.surfaceVariant.withValues(alpha: 0.6),
            borderRadius: 12,
            borderColor: AppColorScheme.onSurface.withValues(alpha: 0.1),
            focusedBorderColor: AppColorScheme.buttonFocused,
            hintStyle: TextStyle(
              color: focused
                  ? AppColorScheme.onButtonFocused.withValues(alpha: 0.5)
                  : AppColorScheme.onSurface.withValues(alpha: 0.5),
            ),
            textStyle: TextStyle(
              color: focused
                  ? AppColorScheme.onButtonFocused
                  : AppColorScheme.onSurface,
            ),
            textFieldType: isPassword
                ? TextFieldType.password
                : TextFieldType.other,
            popParentOnKeyboardClose: false,
            onFieldSubmitted: isPassword ? (_) => _signIn() : null,
            onVisibilityChanged: (visible) =>
                _handleTvKeyboardVisibility(visible, tvFieldKey),
          );
        },
      ),
    );
  }

  Widget _buildServerListView() {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.selectAServer,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ..._servers.map(_buildServerTile),
        if (_errorMessage != null) ...[
          const SizedBox(height: 12),
          Text(
            _errorMessage!,
            style: TextStyle(color: AppColorScheme.statusRequested),
          ),
        ],
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => context.go(Destinations.serverSelect),
                icon: const Icon(Icons.arrow_back, size: 18),
                label: FittedBox(fit: BoxFit.scaleDown, child: Text(l10n.back)),
                style: _focusableButtonStyle(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _resetAfterError,
                icon: const Icon(Icons.refresh, size: 18),
                label: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(l10n.tryAgain),
                ),
                style: _focusableButtonStyle(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServerTile(EmbyConnectServer server) {
    final subtitle = server.candidateAddresses.isNotEmpty
        ? server.candidateAddresses.first
        : AppLocalizations.of(context).noReachableAddress;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: AppColorScheme.surface.withValues(alpha: 0.5),
        borderRadius: AppRadius.circular(12),
        child: InkWell(
          borderRadius: AppRadius.circular(12),
          onTap: () => _connectToServer(server),
          focusColor: AppColorScheme.accent,
          hoverColor: AppColorScheme.onSurface.withValues(alpha: 0.08),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const ServerTypeIcon(serverType: ServerType.emby, size: 22),
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
                        subtitle,
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

  Widget _buildLoadingView(String message) {
    return Column(
      children: [
        const SizedBox(
          height: 28,
          width: 28,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        const SizedBox(height: 12),
        Text(
          message,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: AppColorScheme.onSurface.withValues(alpha: 0.5),
      ),
      filled: true,
      fillColor: AppColorScheme.surfaceVariant.withValues(alpha: 0.6),
      border: OutlineInputBorder(
        borderRadius: AppRadius.circular(12),
        borderSide: BorderSide(
          color: AppColorScheme.onSurface.withValues(alpha: 0.1),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.circular(12),
        borderSide: BorderSide(
          color: AppColorScheme.onSurface.withValues(alpha: 0.1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.circular(12),
        borderSide: BorderSide(color: AppColorScheme.accent, width: 2),
      ),
    );
  }

  ButtonStyle _focusableButtonStyle() {
    return ButtonStyle(
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.hovered)) {
          return BorderSide(color: AppColorScheme.accent, width: 2);
        }
        return BorderSide(
          color: AppColorScheme.onSurface.withValues(alpha: 0.2),
        );
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
}
