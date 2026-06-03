import 'dart:async';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/models/server.dart';
import '../../../auth/models/server_addition_state.dart';
import '../../../auth/models/user.dart';
import '../../../auth/repositories/server_repository.dart';
import '../../../auth/repositories/session_repository.dart';
import '../../../auth/services/jellyfin_credentials_bridge.dart';
import '../../../auth/store/authentication_preferences.dart';
import '../../../auth/store/authentication_store.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../auth/services/server_discovery_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../platform/web_runtime_config.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../../util/server_url.dart';
import '../../../util/web_diagnostics_failure.dart';
import '../../navigation/destinations.dart';
import '../../widgets/login_scaffold.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/server_type_icon.dart';

final _kAccent = AppColorScheme.accent;

class ServerSelectScreen extends StatefulWidget {
  const ServerSelectScreen({super.key});

  @override
  State<ServerSelectScreen> createState() => _ServerSelectScreenState();
}

class _ServerSelectScreenState extends State<ServerSelectScreen> {
  final _addressController = TextEditingController();
  final _serverRepo = GetIt.instance<ServerRepository>();
  final _sessionRepo = GetIt.instance<SessionRepository>();
  final _clientFactory = GetIt.instance<MediaServerClientFactory>();
  final _authStore = GetIt.instance<AuthenticationStore>();
  final _authPrefs = GetIt.instance<AuthenticationPreferences>();
  final _deviceInfo = GetIt.instance<DeviceInfo>();
  final _discoveryService = ServerDiscoveryService();
  StreamSubscription<ServerAdditionState>? _additionSub;
  StreamSubscription<DiscoveredServer>? _discoverySub;

  bool _isConnecting = false;
  String? _errorMessage;
  bool _attemptedAutoConnect = false;
  bool _suppressAutoNavigationOnServerConnected = false;

  final List<DiscoveredServer> _discoveredServers = [];
  bool _isDiscovering = false;
  bool get _isMoonfin => ThemeRegistry.active.id == ThemeRegistry.moonfinId;

  bool get _isWebPluginMode =>
      PlatformDetection.isWeb && webRuntimeConfig.pluginMode;

  String? get _webDefaultServerUrl {
    if (!PlatformDetection.isWeb) return null;
    final normalized = normalizeServerBaseUrl(
      webRuntimeConfig.defaultServerUrl?.trim() ?? '',
    );
    return normalized.isEmpty ? null : normalized;
  }

  String? get _webAutoConnectServerUrl {
    if (!PlatformDetection.isWeb) return null;

    final forced = normalizeServerBaseUrl(
      webRuntimeConfig.forcedServerUrl?.trim() ?? '',
    );
    if (forced.isNotEmpty) return forced;

    if (_isWebPluginMode) {
      final origin = normalizeServerBaseUrl(Uri.base.origin);
      if (origin.isNotEmpty) return origin;
    }

    return null;
  }

  Color _loginForeground(double alpha) {
    return (_isMoonfin ? Colors.white : AppColorScheme.onSurface).withValues(
      alpha: alpha,
    );
  }

  Color get _loginErrorColor {
    return _isMoonfin
        ? const Color(0xFFef4444)
        : AppColorScheme.statusRequested;
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

  @override
  void initState() {
    super.initState();
    _additionSub = _serverRepo.additionState.listen(_onAdditionState);
    _loadServers();
    _startDiscovery();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _additionSub?.cancel();
    _discoverySub?.cancel();
    super.dispose();
  }

  Future<void> _loadServers() async {
    await _serverRepo.loadStoredServers();
    if (mounted) {
      setState(() {});
    }
    await _autoConnectConfiguredServer();
  }

  Future<void> _autoConnectConfiguredServer() async {
    if (!mounted || _attemptedAutoConnect) return;

    final configuredAddress = _webAutoConnectServerUrl;
    if (configuredAddress == null) return;

    _attemptedAutoConnect = true;

    if (_isWebPluginMode) {
      final autoLoggedIn = await _tryAutoLoginFromJellyfinCredentials(
        preferredAddress: configuredAddress,
      );
      if (autoLoggedIn) {
        return;
      }
    }

    for (final server in _serverRepo.servers) {
      final normalized = normalizeServerBaseUrl(server.address).toLowerCase();
      if (normalized == configuredAddress.toLowerCase()) {
        if (mounted) {
          context.go('${Destinations.server}?serverId=${server.id}');
        }
        return;
      }
    }

    try {
      await _addServerWithoutAutoNavigation(configuredAddress);
    } catch (_) {
      if (!mounted) return;
      _maybeOpenWebDiagnosticsForFailure(targetUrl: configuredAddress);
      setState(() {
        _isConnecting = false;
        _errorMessage = AppLocalizations.of(context).unableToConnectToServer;
      });
    }
  }

  Future<bool> _tryAutoLoginFromJellyfinCredentials({
    required String preferredAddress,
  }) async {
    final credentials = await loadJellyfinBootstrapCredentials(
      preferredServerAddress: preferredAddress,
    );
    if (credentials == null) {
      return false;
    }

    final candidateAddress = normalizeServerBaseUrl(
      credentials.serverAddress.isNotEmpty
          ? credentials.serverAddress
          : preferredAddress,
    );
    if (candidateAddress.isEmpty) {
      return false;
    }

    final server = await _ensureServer(candidateAddress);
    if (server == null) {
      return false;
    }

    final client = _clientFactory.getClient(
      serverId: server.id,
      serverType: server.serverType,
      baseUrl: server.address,
    );
    client.accessToken = credentials.accessToken;
    client.userId = credentials.userId;

    try {
      final currentUser = await client.usersApi.getCurrentUser();
      final resolvedUserId =
          currentUser.id.trim().isNotEmpty ? currentUser.id : credentials.userId;
      if (resolvedUserId.trim().isEmpty) {
        return false;
      }

      final resolvedUserName = (currentUser.name ?? '').trim();
      final user = PrivateUser(
        id: resolvedUserId,
        name: resolvedUserName.isNotEmpty ? resolvedUserName : 'Moonfin User',
        serverId: server.id,
        accessToken: credentials.accessToken,
        lastUsed: DateTime.now(),
        imageTag: currentUser.primaryImageTag,
        isAdministrator: currentUser.policy?.isAdministrator ?? false,
        canDownload: currentUser.policy?.enableContentDownloading ?? false,
        canManageSubtitles: currentUser.policy?.enableSubtitleManagement ??
            false,
        canManageCollections:
          currentUser.policy?.enableCollectionManagement ?? false,
      );

      await _authStore.putUser(user);
      await _authPrefs.setLastServerId(server.id);
      await _authPrefs.setLastUserId(user.id);

      final switched = await _sessionRepo.switchCurrentSession(
        serverId: server.id,
        userId: user.id,
      );
      if (!switched) {
        return false;
      }

      if (mounted) {
        context.go(Destinations.home);
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<Server?> _ensureServer(String address) async {
    final existing = _findServerByAddress(address);
    if (existing != null) {
      return existing;
    }

    final added = await _addServerWithoutAutoNavigation(address);
    if (added != null) {
      return added;
    }

    return _findServerByAddress(address);
  }

  Server? _findServerByAddress(String address) {
    final normalizedAddress = normalizeServerBaseUrl(address).toLowerCase();
    if (normalizedAddress.isEmpty) {
      return null;
    }

    for (final server in _serverRepo.servers) {
      final normalized = normalizeServerBaseUrl(server.address).toLowerCase();
      if (normalized == normalizedAddress) {
        return server;
      }
    }

    return null;
  }

  Future<Server?> _addServerWithoutAutoNavigation(String address) async {
    _suppressAutoNavigationOnServerConnected = true;
    try {
      return await _serverRepo.addServer(address);
    } finally {
      _suppressAutoNavigationOnServerConnected = false;
    }
  }

  void _startDiscovery() {
    setState(() => _isDiscovering = true);
    _discoveredServers.clear();

    _discoverySub?.cancel();
    _discoverySub = _discoveryService.discoverLocalServers().listen(
      (server) {
        final savedAddresses = _serverRepo.servers
            .map((s) => s.address)
            .toSet();
        if (!savedAddresses.contains(server.address)) {
          if (mounted) {
            setState(() => _discoveredServers.add(server));
          }
        }
      },
      onDone: () {
        if (mounted) setState(() => _isDiscovering = false);
      },
      onError: (_) {
        if (mounted) setState(() => _isDiscovering = false);
      },
    );
  }

  void _onAdditionState(ServerAdditionState state) {
    if (!mounted) return;
    final shouldHandleAdditionState = _isConnecting || _isAddDialogOpen;
    switch (state) {
      case ServerConnecting():
        if (!shouldHandleAdditionState) return;
        setState(() {
          _isConnecting = true;
          _errorMessage = null;
        });
      case ServerConnected(:final id):
        if (!shouldHandleAdditionState) return;
        setState(() => _isConnecting = false);
        _addressController.clear();
        if (_suppressAutoNavigationOnServerConnected) {
          return;
        }
        context.go('${Destinations.server}?serverId=$id');
      case ServerUnableToConnect(
        :final candidatesTried,
        :final lastCandidate,
        :final lastErrorType,
        :final lastStatusCode,
        :final lastErrorMessage,
      ):
        if (!shouldHandleAdditionState) return;
        final targetUrl = (lastCandidate != null && lastCandidate.isNotEmpty)
            ? lastCandidate
            : (candidatesTried.isNotEmpty ? candidatesTried.first : null);
        setState(() {
          _isConnecting = false;
          _errorMessage = AppLocalizations.of(context).unableToConnectToServer;
        });
        _maybeOpenWebDiagnosticsForFailure(
          targetUrl: targetUrl,
          errorType: lastErrorType,
          statusCode: lastStatusCode,
          message: lastErrorMessage,
        );
    }
  }

  Future<void> _connectToDiscovered(DiscoveredServer discovered) async {
    if (_isConnecting) return;
    if (mounted) {
      setState(() {
        _isConnecting = true;
        _errorMessage = null;
      });
    }

    try {
      await _serverRepo.addServer(discovered.address);
    } catch (e) {
      if (!mounted) return;
      _maybeOpenWebDiagnosticsForFailure(
        targetUrl: discovered.address,
        message: e.toString(),
      );
      setState(() {
        _isConnecting = false;
        _errorMessage = AppLocalizations.of(context).unableToConnectToServer;
      });
    }
  }

  Future<void> _deleteServer(Server server) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.removeServer),
        content: Text(l10n.removeServerConfirmation(server.name)),
        actions: [
          TextButton(onPressed: () => ctx.pop(false), child: Text(l10n.cancel)),
          TextButton(onPressed: () => ctx.pop(true), child: Text(l10n.remove)),
        ],
      ),
    );
    if (confirmed == true) {
      await _serverRepo.deleteServer(server.id);
      if (mounted) setState(() {});
    }
  }

  Widget _buildFooterActionButton({
    required VoidCallback? onPressed,
    required Widget icon,
    required String label,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(
        label,
        style: const TextStyle(fontSize: 15),
        maxLines: 1,
        softWrap: false,
        overflow: TextOverflow.fade,
      ),
      style:
          OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          ).copyWith(
            side: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.focused) ||
                  states.contains(WidgetState.hovered)) {
                return BorderSide(color: _kAccent, width: 2);
              }
              return BorderSide(color: _loginForeground(0.2));
            }),
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.focused) ||
                  states.contains(WidgetState.hovered)) {
                return _kAccent;
              }
              return _loginForeground(0.8);
            }),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final servers = _serverRepo.servers;
    final l10n = AppLocalizations.of(context);

    return LoginScaffold(
      header: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Image.asset('assets/images/logo_and_text.png', height: 80),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          l10n.appVersionFooter(_deviceInfo.appVersion),
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: _loginForeground(0.4)),
          textAlign: TextAlign.center,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (servers.isNotEmpty) ...[
            Text(
              l10n.savedServers,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...servers.map((server) => _buildSavedServerTile(server)),
            const SizedBox(height: 20),
          ],
          Text(
            l10n.discoveredServers,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (_discoveredServers.isNotEmpty)
            ..._discoveredServers.map(
              (server) => _buildDiscoveredServerTile(server),
            )
          else if (_isDiscovering)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                l10n.noneFound,
                style: TextStyle(color: _loginForeground(0.4), fontSize: 14),
              ),
            ),
          if (_isDiscovering && _discoveredServers.isNotEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 4, bottom: 8),
              child: Center(
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                _errorMessage!,
                style: TextStyle(color: _loginErrorColor, fontSize: 14),
              ),
            ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final isVerySmall = constraints.maxWidth < 360;
              final actions = <Widget>[];

              if (!_isWebPluginMode) {
                actions.add(
                  _buildFooterActionButton(
                    onPressed: _isConnecting ? null : _showAddServerDialog,
                    icon: const Icon(Icons.add, size: 16),
                    label: l10n.addServer,
                  ),
                );

                actions.add(
                  _buildFooterActionButton(
                    onPressed: _isConnecting
                        ? null
                        : () => context.go(Destinations.embyConnect),
                    icon: const ServerTypeIcon(
                      serverType: ServerType.emby,
                      size: 16,
                    ),
                    label: l10n.embyConnect,
                  ),
                );
              }

              if (PlatformDetection.isWeb) {
                actions.add(
                  _buildFooterActionButton(
                    onPressed: () => context.go(Destinations.webDiagnostics),
                    icon: const Icon(Icons.bug_report, size: 16),
                    label: l10n.webDiagnostics,
                  ),
                );
              }

              if (actions.isEmpty) {
                return const SizedBox.shrink();
              }

              if (actions.length == 2 && !isVerySmall) {
                return Row(
                  children: [
                    Expanded(child: actions[0]),
                    const SizedBox(width: 8),
                    Expanded(child: actions[1]),
                  ],
                );
              }

              return Column(
                children: [
                  for (var i = 0; i < actions.length; i++) ...[
                    SizedBox(width: double.infinity, child: actions[i]),
                    if (i < actions.length - 1) const SizedBox(height: 8),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSavedServerTile(Server server) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: _FocusableTile(
        onTap: () => context.go('${Destinations.server}?serverId=${server.id}'),
        onLongPress: () => _deleteServer(server),
        child: Row(
          children: [
            ServerTypeIcon(
              serverType: server.serverType,
              size: 24,
              color: _loginForeground(0.7),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    server.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: _loginForeground(0.9),
                    ),
                  ),
                  Text(
                    '${server.address} • ${server.version}',
                    style: TextStyle(
                      fontSize: 13,
                      color: _loginForeground(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscoveredServerTile(DiscoveredServer server) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: _FocusableTile(
        onTap: _isConnecting ? null : () => _connectToDiscovered(server),
        child: Row(
          children: [
            ServerTypeIcon(
              serverType: server.serverType,
              size: 24,
              color: _loginForeground(0.7),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    server.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: _loginForeground(0.9),
                    ),
                  ),
                  Text(
                    server.address,
                    style: TextStyle(
                      fontSize: 13,
                      color: _loginForeground(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isAddDialogOpen = false;

  Future<void> _showAddServerDialog() async {
    if (_isAddDialogOpen) return;
    _isAddDialogOpen = true;
    final defaultAddress = _webDefaultServerUrl;
    _addressController.text = defaultAddress ?? '';
    _addressController.selection = TextSelection.collapsed(
      offset: _addressController.text.length,
    );
    try {
      await showFocusRestoringDialog<void>(
        context: context,
        builder: (ctx) => _AddServerDialog(
          l10n: AppLocalizations.of(context),
          controller: _addressController,
          serverRepo: _serverRepo,
        ),
      );
    } finally {
      _isAddDialogOpen = false;
    }
  }
}

class _FocusableTile extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const _FocusableTile({
    required this.child,
    required this.onTap,
    this.onLongPress,
  });

  @override
  State<_FocusableTile> createState() => _FocusableTileState();
}

class _FocusableTileState extends State<_FocusableTile> {
  bool _focused = false;
  Timer? _selectHoldTimer;
  bool _longPressFiredFromKey = false;
  bool _selectKeyPressed = false;
  bool get _isMoonfin => ThemeRegistry.active.id == ThemeRegistry.moonfinId;

  void _clearSelectKeyState() {
    _selectHoldTimer?.cancel();
    _selectHoldTimer = null;
    _selectKeyPressed = false;
    _longPressFiredFromKey = false;
  }

  Color _tileIdleColor() {
    return _isMoonfin
        ? Colors.white.withValues(alpha: 0.05)
        : AppColorScheme.onSurface.withValues(alpha: 0.05);
  }

  @override
  void dispose() {
    _clearSelectKeyState();
    super.dispose();
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (widget.onTap == null) return KeyEventResult.ignored;

    if (!event.logicalKey.isSelectKey) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      if (_selectKeyPressed) {
        return KeyEventResult.handled;
      }
      _selectKeyPressed = true;
      _longPressFiredFromKey = false;
      _selectHoldTimer?.cancel();
      if (widget.onLongPress != null) {
        _selectHoldTimer = Timer(const Duration(milliseconds: 500), () {
          _longPressFiredFromKey = true;
          widget.onLongPress?.call();
        });
      }
      return KeyEventResult.handled;
    }

    if (event is KeyRepeatEvent) {
      if (widget.onLongPress != null && !_longPressFiredFromKey) {
        _longPressFiredFromKey = true;
        _selectHoldTimer?.cancel();
        _selectHoldTimer = null;
        widget.onLongPress?.call();
      }
      return KeyEventResult.handled;
    }

    if (event is KeyUpEvent) {
      final wasPressed = _selectKeyPressed;
      _selectKeyPressed = false;
      _selectHoldTimer?.cancel();
      _selectHoldTimer = null;
      if (wasPressed && !_longPressFiredFromKey) {
        widget.onTap?.call();
      }
      _longPressFiredFromKey = false;
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(12);
    return Material(
      color: _focused ? _kAccent.withValues(alpha: 0.18) : _tileIdleColor(),
      borderRadius: radius,
      child: Focus(
        onFocusChange: (f) {
          if (!f) {
            _clearSelectKeyState();
          }
          setState(() => _focused = f);
        },
        onKeyEvent: _onKeyEvent,
        child: InkWell(
          canRequestFocus: false,
          borderRadius: radius,
          focusColor: _kAccent.withValues(alpha: 0.2),
          hoverColor: _kAccent.withValues(alpha: 0.12),
          onTap: widget.onTap,
          onLongPress: widget.onLongPress,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            decoration: BoxDecoration(
              borderRadius: radius,
              border: Border.all(
                color: _focused ? _kAccent : Colors.transparent,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class _AddServerDialog extends StatefulWidget {
  final AppLocalizations l10n;
  final TextEditingController controller;
  final ServerRepository serverRepo;

  const _AddServerDialog({
    required this.l10n,
    required this.controller,
    required this.serverRepo,
  });

  @override
  State<_AddServerDialog> createState() => _AddServerDialogState();
}

class _AddServerDialogState extends State<_AddServerDialog> {
  final _userPreferences = GetIt.instance<UserPreferences>();
  final _addressFocus = FocusNode(debugLabel: 'addServerAddress');
  final _connectFocus = FocusNode(debugLabel: 'addServerConnect');
  final _cancelFocus = FocusNode(debugLabel: 'addServerCancel');
  final _tvFieldKey = GlobalKey<CustomTVTextFieldState>();

  bool _isConnecting = false;
  String? _errorMessage;
  bool _dialogDismissed = false;
  bool get _isMoonfin => ThemeRegistry.active.id == ThemeRegistry.moonfinId;

  Color _dialogForeground(double alpha) {
    return (_isMoonfin ? Colors.white : AppColorScheme.onSurface).withValues(
      alpha: alpha,
    );
  }

  Color get _dialogForegroundSolid {
    return _isMoonfin ? Colors.white : AppColorScheme.onSurface;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _addressFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    _addressFocus.dispose();
    _connectFocus.dispose();
    _cancelFocus.dispose();
    super.dispose();
  }

  void _dismissDialog({bool suppressNextPopRoute = false}) {
    if (_dialogDismissed || !mounted) return;
    _dialogDismissed = true;
    if (suppressNextPopRoute) {
      DialogBackSuppressor.markDismissed();
    }

    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
      return;
    }

    final rootNavigator = Navigator.of(context, rootNavigator: true);
    if (rootNavigator.canPop()) {
      rootNavigator.pop();
    }
  }

  Future<void> _submit() async {
    final address = widget.controller.text.trim();
    if (address.isEmpty) return;

    setState(() {
      _isConnecting = true;
      _errorMessage = null;
    });

    try {
      final server = await widget.serverRepo.addServer(address);
      if (!mounted) return;
      if (server != null) {
        _dismissDialog();
      } else {
        _showError(widget.l10n.unableToConnectToServer);
      }
    } catch (e) {
      if (!mounted) return;
      _showError(widget.l10n.unableToConnectToServer);
    }
  }

  void _showError(String message) {
    setState(() {
      _isConnecting = false;
      _errorMessage = message;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _connectFocus.requestFocus();
    });
  }

  void _cancel() {
    _dismissDialog();
  }

  KeyEventResult _onDialogKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;

    if (key.isBackKey) {
      if (event is KeyDownEvent) {
        if (PlatformDetection.isTV &&
            (_tvFieldKey.currentState?.isKeyboardVisible ?? false)) {
          _tvFieldKey.currentState?.closeKeyboard();
          _addressFocus.requestFocus();
          return KeyEventResult.handled;
        }
        _dismissDialog(suppressNextPopRoute: true);
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }

    if (!PlatformDetection.isTV) return KeyEventResult.ignored;

    final onField = _addressFocus.hasFocus;
    final onCancel = _cancelFocus.hasFocus;
    final onConnect = _connectFocus.hasFocus;

    if (onField) {
      if (key == LogicalKeyboardKey.enter || key == LogicalKeyboardKey.select) {
        _tvFieldKey.currentState?.openKeyboard();
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.arrowDown) {
        _connectFocus.requestFocus();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }

    if (onCancel || onConnect) {
      if (key == LogicalKeyboardKey.arrowUp) {
        _addressFocus.requestFocus();
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.arrowLeft && onConnect) {
        _cancelFocus.requestFocus();
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.arrowRight && onCancel) {
        _connectFocus.requestFocus();
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  ButtonStyle _actionStyle() {
    return OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ).copyWith(
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.hovered)) {
          return BorderSide(color: _kAccent, width: 2);
        }
        return BorderSide(color: _dialogForeground(0.2));
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.hovered)) {
          return _kAccent;
        }
        return _dialogForeground(0.85);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    final isTV = PlatformDetection.isTV;

    final field = isTV
        ? Focus(
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
                  preferSystemIme: _userPreferences.get(
                    UserPreferences.preferSystemImeKeyboard,
                  ),
                  hint: l10n.serverAddressHint,
                  textFieldType: TextFieldType.url,
                  keyboardType: KeyboardType.alphabetic,
                  filled: true,
                  fillColor: focused
                      ? _dialogForegroundSolid
                      : _dialogForeground(0.08),
                  borderColor: Theme.of(context).colorScheme.outline,
                  focusedBorderColor: _kAccent,
                  hintStyle: TextStyle(
                    color: focused
                        ? AppColors.black.withValues(alpha: 0.5)
                        : _dialogForeground(0.5),
                  ),
                  textStyle: TextStyle(
                    color: focused ? AppColors.black : _dialogForegroundSolid,
                  ),
                  prefixIcon: Icon(
                    Icons.dns,
                    color: focused ? AppColors.black : _dialogForegroundSolid,
                  ),
                  popParentOnKeyboardClose: false,
                  onFieldSubmitted: (_) => _submit(),
                );
              },
            ),
          )
        : TextField(
            controller: widget.controller,
            focusNode: _addressFocus,
            decoration: InputDecoration(
              labelText: l10n.serverAddress,
              hintText: l10n.serverAddressHint,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.dns),
            ),
            keyboardType: TextInputType.url,
            autofocus: true,
            onSubmitted: (value) => _submit(),
          );

    final cancelButton = OutlinedButton(
      focusNode: _cancelFocus,
      onPressed: _isConnecting ? null : _cancel,
      style: _actionStyle(),
      child: Text(widget.l10n.cancel),
    );

    final connectButton = OutlinedButton(
      focusNode: _connectFocus,
      onPressed: _isConnecting ? null : _submit,
      style: _actionStyle(),
      child: _isConnecting
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(widget.l10n.connect),
    );

    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: _onDialogKey,
      child: AlertDialog(
        title: Text(widget.l10n.connectToServer),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            field,
            if (_errorMessage != null) ...[
              const SizedBox(height: 12),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Color(0xFFef4444), fontSize: 12),
              ),
            ],
          ],
        ),
        actions: [cancelButton, connectButton],
      ),
    );
  }
}
