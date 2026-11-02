import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/models/login_state.dart';
import '../../../auth/models/server.dart';
import '../../../auth/repositories/auth_repository.dart';
import '../../../auth/repositories/plex_repository.dart';
import '../../../auth/repositories/server_repository.dart';
import '../../../auth/repositories/server_user_repository.dart';
import '../../../auth/repositories/session_repository.dart';
import '../../../auth/services/silo_household.dart';
import '../../../auth/store/authentication_preferences.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/services/pin_guard.dart';
import '../../../data/services/server_pin_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/login_scaffold.dart';
import '../../widgets/pin_entry_dialog.dart';
import '../../widgets/profile_carousel.dart';
import 'silo_profile_unlock.dart';

class ServerScreen extends StatefulWidget {
  final String serverId;
  const ServerScreen({super.key, required this.serverId});

  @override
  State<ServerScreen> createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  final _serverRepo = GetIt.instance<ServerRepository>();
  final _userRepo = GetIt.instance<ServerUserRepository>();
  final _authRepo = GetIt.instance<AuthRepository>();
  final _sessionRepo = GetIt.instance<SessionRepository>();
  final _plexRepo = GetIt.instance<PlexRepository>();
  final _clientFactory = GetIt.instance<MediaServerClientFactory>();

  Server? _server;
  List<_MergedUser> _users = [];
  bool _isLoading = true;
  String? _errorMessage;
  final _carouselFocus = FocusNode();
  int _selected = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      await _serverRepo.loadStoredServers();
      final server = _serverRepo.getServer(widget.serverId);
      if (server == null) {
        if (mounted) context.go(Destinations.serverSelect);
        return;
      }

      final stored = _userRepo.getStoredServerUsers(server.id);
      final publicUsers = server.serverType == ServerType.plex
          ? await _plexRepo.homeUsers(server)
          : await _userRepo.getPublicServerUsers(server);

      final merged = <String, _MergedUser>{};
      for (final u in stored) {
        merged[u.id] = _MergedUser(
          id: u.id,
          name: u.name,
          imageTag: u.imageTag,
          hasToken: true,
          hasPassword: true,
          siloHasPin: u.siloHasPin,
        );
      }
      for (final u in publicUsers) {
        merged.putIfAbsent(
          u.id,
          () => _MergedUser(
            id: u.id,
            name: u.name,
            imageTag: u.imageTag,
            hasToken: false,
            hasPassword: u.hasPassword,
          ),
        );
      }

      if (mounted && merged.isEmpty) {
        context.go('${Destinations.login}?serverId=${server.id}&noUsers=true');
        return;
      }

      if (!mounted) return;
      final allUsers = merged.values.toList();

      setState(() {
        _server = server;
        _users = allUsers;
        _selected = 0;
        _isLoading = false;
        _errorMessage = null;
      });

      if (allUsers.isNotEmpty && !PlatformDetection.useMobileUi) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _carouselFocus.requestFocus();
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _errorMessage = AppLocalizations.of(context).unableToConnectToServer;
      });
    }
  }

  String _buildUserLoginRoute(
    Server server,
    _MergedUser user, {
    bool resetPin = false,
  }) {
    return Uri(
      path: Destinations.login,
      queryParameters: {
        'serverId': server.id,
        'username': user.name,
        if (!user.hasPassword) 'hasPassword': 'false',
        if (resetPin) 'resetPin': '1',
      },
    ).toString();
  }

  /// Set while a tapped user is being handled, since the PIN lookup before the
  /// dialog takes long enough that Select gets pressed again.
  bool _handlingUserTap = false;

  /// Set while a tapped user's session starts. The first sign-in on a server
  /// waits for the plugin sync, so the screen says it's working.
  bool _signingIn = false;

  Future<T> _whileSigningIn<T>(Future<T> Function() run) async {
    setState(() => _signingIn = true);
    try {
      return await run();
    } finally {
      if (mounted) setState(() => _signingIn = false);
    }
  }

  Future<void> _onUserTap(_MergedUser user) async {
    if (_handlingUserTap) return;
    _handlingUserTap = true;
    try {
      await _handleUserTap(user);
    } finally {
      _handlingUserTap = false;
    }
  }

  Future<void> _handleUserTap(_MergedUser user) async {
    final server = _server;
    if (server == null) return;

    final guard = PinGuard.forAccount(
      store: GetIt.instance<PreferenceStore>(),
      service: GetIt.instance<ServerPinService>(),
      userId: user.id,
      serverAddress: server.address,
      accessToken: _userRepo
          .getStoredServerUsers(server.id)
          .where((stored) => stored.id == user.id)
          .map((stored) => stored.accessToken)
          .firstOrNull,
    );
    await guard.refresh();
    if (!mounted) return;

    if (guard.pin.isPinEnabled) {
      final verified = await PinEntryDialog.show(
        context,
        mode: PinEntryMode.verify,
        onVerifyAsync: guard.verify,
        onForgotPin: () {
          if (mounted) {
            context.go(_buildUserLoginRoute(server, user, resetPin: true));
          }
        },
      );
      if (!verified) return;
    }

    final alwaysAuthenticate =
        GetIt.instance<AuthenticationPreferences>().shouldAlwaysAuthenticate;

    // A Silo profile locked with a PIN asks for it first.
    final stored = _userRepo
        .getStoredServerUsers(server.id)
        .where((u) => u.id == user.id)
        .firstOrNull;
    if (stored != null && stored.siloHasPin && !alwaysAuthenticate) {
      if (!mounted) return;
      if (!await unlockSiloProfileIfNeeded(
        context,
        server: server,
        user: stored,
      )) {
        return;
      }
      if (!mounted) return;
    }

    if (user.hasToken && !alwaysAuthenticate) {
      final success = await _whileSigningIn(
        () => _trySwitchSession(server.id, user.id),
      );
      if (success && mounted) {
        context.go(Destinations.home);
        return;
      }
      if (mounted) {
        context.go(_buildUserLoginRoute(server, user));
      }
      return;
    }

    if (server.serverType == ServerType.plex) {
      await _switchPlexHomeUser(server, user);
      return;
    }

    if (!user.hasPassword && !alwaysAuthenticate) {
      final result = await _whileSigningIn(
        () => _tryPasswordlessAuth(server, user),
      );
      if (result is Authenticated && mounted) {
        final switched = await _whileSigningIn(
          () => _sessionRepo.switchCurrentSession(
            serverId: server.id,
            userId: result.userId,
          ),
        );
        if (switched && mounted) {
          context.go(Destinations.home);
          return;
        }
      }
      if (mounted) {
        context.go(_buildUserLoginRoute(server, user));
      }
      return;
    }

    if (mounted) {
      context.go(_buildUserLoginRoute(server, user));
    }
  }

  /// Plex Home members sign in through plex.tv, with their PIN when they have
  /// one, and get a server token of their own.
  Future<void> _switchPlexHomeUser(Server server, _MergedUser user) async {
    String? plexToken;
    try {
      if (user.hasPassword) {
        final verified = await PinEntryDialog.show(
          context,
          mode: PinEntryMode.verify,
          onVerifyAsync: (pin) async {
            plexToken = await _plexRepo.homeUserToken(
              server.id,
              user.id,
              pin: pin,
            );
            return plexToken == null
                ? const PinRejected()
                : const PinAccepted();
          },
        );
        if (!verified) return;
      } else {
        plexToken = await _plexRepo.homeUserToken(server.id, user.id);
      }
      final signedIn =
          plexToken != null &&
          await _plexRepo.signInHomeUser(
            server,
            userId: user.id,
            name: user.name,
            plexToken: plexToken!,
          );
      if (signedIn && mounted) {
        context.go(Destinations.home);
        return;
      }
    } catch (_) {}
    if (mounted) {
      setState(() => _errorMessage = AppLocalizations.of(context).loginFailed);
    }
  }

  Future<bool> _trySwitchSession(String serverId, String userId) async {
    try {
      return await _sessionRepo.switchCurrentSession(
        serverId: serverId,
        userId: userId,
      );
    } catch (_) {
      return false;
    }
  }

  Future<LoginState?> _tryPasswordlessAuth(
    Server server,
    _MergedUser user,
  ) async {
    final client = _clientFactory.getClient(
      serverId: server.id,
      serverType: server.serverType,
      baseUrl: server.address,
    );
    try {
      return await _authRepo.authenticate(
        client: client,
        serverId: server.id,
        username: user.name,
        password: '',
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) => SignInBackScope(
    onBack: () => context.go(Destinations.serverSelect),
    child: _buildContent(context),
  );

  Widget _buildContent(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final server = _server;
    if (server == null) {
      return Scaffold(
        body: Center(
          child: Text(
            _errorMessage ??
                AppLocalizations.of(context).unableToConnectToServer,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return PlatformDetection.useMobileUi
        ? _buildPhone(context, server)
        : _buildWide(context, server);
  }

  Widget _buildWide(BuildContext context, Server server) {
    final l10n = AppLocalizations.of(context);
    final entries = [for (final user in _users) _entryFor(user)];
    return LoginBackdrop(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(48, 28, 48, 32),
        child: Column(
          children: [
            _buildTopBar(server, logoHeight: 40, fontSize: 15),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.whosWatching,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ProfileCarousel(
                        entries: entries,
                        selected: _selected,
                        focusNode: _carouselFocus,
                        onSelected: (index) => setState(() => _selected = index),
                        onActivate: (index) => _onUserTap(_users[index]),
                        subtitle: _users.isEmpty
                            ? null
                            : _buildStatus(_users[_selected]),
                      ),
                      ..._buildNotices(server),
                    ],
                  ),
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                _pillButton(
                  icon: Icons.person,
                  label: l10n.addUser,
                  onPressed: () =>
                      context.go('${Destinations.login}?serverId=${server.id}'),
                ),
                _pillButton(
                  icon: Icons.home,
                  label: l10n.selectServer,
                  onPressed: () => context.go(Destinations.serverSelect),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhone(BuildContext context, Server server) {
    final l10n = AppLocalizations.of(context);
    final entries = [for (final user in _users) _entryFor(user)];
    final user = _users.isEmpty ? null : _users[_selected];
    return LoginBackdrop(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Column(
          children: [
            _buildTopBar(server, logoHeight: 28, fontSize: 13),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.whosWatching,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      if (user != null) ...[
                        const SizedBox(height: 28),
                        ProfileHero(
                          entry: entries[_selected],
                          subtitle: _buildStatus(user),
                          onPrevious: _selected > 0
                              ? () => setState(() => _selected--)
                              : null,
                          onNext: _selected < _users.length - 1
                              ? () => setState(() => _selected++)
                              : null,
                        ),
                      ],
                      const SizedBox(height: 28),
                      ProfileStrip(
                        entries: entries,
                        selected: _selected,
                        onSelected: (index) => setState(() => _selected = index),
                        onAdd: () =>
                            context.go('${Destinations.login}?serverId=${server.id}'),
                        addLabel: l10n.addUser,
                      ),
                      ..._buildNotices(server),
                    ],
                  ),
                ),
              ),
            ),
            if (user != null)
              ProfilePrimaryButton(
                label: l10n.continueAsUser(user.name),
                onPressed: _signingIn ? null : () => _onUserTap(user),
              ),
            const SizedBox(height: 4),
            TextButton(
              onPressed: () => context.go(Destinations.serverSelect),
              style: TextButton.styleFrom(
                foregroundColor: AppColorScheme.onSurface.withValues(alpha: 0.78),
                minimumSize: const Size(0, 44),
              ),
              child: Text(l10n.selectServer),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(
    Server server, {
    required double logoHeight,
    required double fontSize,
  }) {
    final color = AppColorScheme.onSurface.withValues(alpha: 0.65);
    return Row(
      children: [
        Image.asset('assets/images/logo_and_text.png', height: logoHeight),
        const SizedBox(width: 16),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.dns_outlined, size: fontSize + 3, color: color),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  server.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: fontSize, color: color),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildNotices(Server server) {
    final l10n = AppLocalizations.of(context);
    final disclaimer = server.loginDisclaimer;
    return [
      if (disclaimer != null && disclaimer.isNotEmpty) ...[
        const SizedBox(height: 20),
        Text(
          disclaimer,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
      if (_signingIn) ...[
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 10),
            Text(
              l10n.signingIn,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ] else if (_errorMessage != null) ...[
        const SizedBox(height: 16),
        Text(
          _errorMessage!,
          style: const TextStyle(color: Color(0xFFef4444)),
          textAlign: TextAlign.center,
        ),
      ],
    ];
  }

  Widget _pillButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 44,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: _focusableButtonStyle(context).copyWith(
          shape: const WidgetStatePropertyAll(StadiumBorder()),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20),
          ),
          textStyle: WidgetStatePropertyAll(
            Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  ButtonStyle _focusableButtonStyle(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    final focusBorder = ThemeRegistry.active.borders.focusBorder;
    return ButtonStyle(
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.hovered)) {
          return focusBorder.copyWith(color: accent);
        }
        return BorderSide(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
        );
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.hovered)) {
          return accent;
        }
        return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8);
      }),
    );
  }

  String? _userImageUrl(_MergedUser user) {
    final server = _server!;
    // Plex keeps every account's avatar on plex.tv, under its uuid.
    if (server.serverType == ServerType.plex) {
      return 'https://plex.tv/users/${user.id}/avatar';
    }
    if (!server.serverType.hasJellyfinUserImagePath) {
      return siloProfileImageUrl(
        _clientFactory,
        serverId: server.id,
        userId: user.id,
      );
    }
    if (user.imageTag == null) return null;
    return '${server.address}/Users/${user.id}/Images/Primary?tag=${user.imageTag}';
  }

  // A Plex Home member with a PIN reads as having a password.
  bool _asksForPin(_MergedUser user) =>
      user.siloHasPin ||
      (!user.hasToken &&
          user.hasPassword &&
          _server?.serverType == ServerType.plex);

  ProfileEntry _entryFor(_MergedUser user) => ProfileEntry(
    id: user.id,
    name: user.name,
    avatarUrl: _userImageUrl(user),
    badge: _asksForPin(user) ? ProfileBadge.pin : ProfileBadge.none,
  );

  Widget? _buildStatus(_MergedUser user) {
    final l10n = AppLocalizations.of(context);
    if (user.hasToken) return ProfileStatusLine(l10n.signedInOnThisDevice);
    if (_asksForPin(user)) {
      return ProfileStatusLine(l10n.pinRequired, icon: Icons.lock_outline);
    }
    if (user.hasPassword) return ProfileStatusLine(l10n.passwordRequired);
    return null;
  }

  @override
  void dispose() {
    _carouselFocus.dispose();
    super.dispose();
  }
}

class _MergedUser {
  final String id;
  final String name;
  final String? imageTag;
  final bool hasToken;
  final bool hasPassword;

  /// A Silo household profile locked with a PIN.
  final bool siloHasPin;

  const _MergedUser({
    required this.id,
    required this.name,
    this.imageTag,
    required this.hasToken,
    required this.hasPassword,
    this.siloHasPin = false,
  });
}
