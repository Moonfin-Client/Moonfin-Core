import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/models/server.dart';
import '../../../auth/repositories/server_repository.dart';
import '../../../auth/repositories/session_repository.dart';
import '../../../auth/store/authentication_store.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../syncplay/syncplay_manager.dart';
import '../../../watch_party/silo_watch_party_manager.dart';
import '../../navigation/deep_link_navigator.dart';
import '../../navigation/destinations.dart';
import '../syncplay/syncplay_screen.dart';
import 'silo_watch_party_screen.dart';

/// The Watch Parties screen for the active server. Silo has its own Watch
/// Party. Jellyfin lists Moonbase's rooms with SyncPlay's groups beside
/// them, or falls back to SyncPlay alone without Moonbase. Emby and Plex
/// have Moonbase's rooms only. [joinCode] joins a room as it opens.
///
/// The widget type only depends on the server, so a route that rebuilds
/// when a party starts or ends keeps its screen, and a join code is only
/// used once.
Widget watchTogetherScreen({String? joinCode}) => _hasSyncPlay
    ? _JellyfinWatchParties(joinCode: joinCode)
    : SiloWatchPartyScreen(joinCode: joinCode);

bool get _hasSyncPlay {
  final getIt = GetIt.instance;
  return getIt.isRegistered<MediaServerClient>() &&
      getIt<MediaServerClient>().features.supportsSyncPlay;
}

/// Whether the user picks what kind of party they start: Jellyfin with
/// Moonbase rooms, once Moonbase has answered.
bool offersWatchPartyChoice() =>
    _hasSyncPlay &&
    GetIt.instance.isRegistered<SiloWatchPartyManager>() &&
    GetIt.instance<SiloWatchPartyManager>().moonbaseAvailable;

/// Whether starting a party here starts a SyncPlay group instead of a
/// Moonbase room.
bool startsSyncPlay() {
  if (!_hasSyncPlay) return false;
  if (!GetIt.instance<SiloWatchPartyManager>().moonbaseAvailable) return true;
  return GetIt.instance<UserPreferences>().get(
        UserPreferences.watchPartyService,
      ) ==
      WatchPartyServiceChoice.syncplay;
}

class _JellyfinWatchParties extends StatefulWidget {
  const _JellyfinWatchParties({this.joinCode});

  final String? joinCode;

  @override
  State<_JellyfinWatchParties> createState() => _JellyfinWatchPartiesState();
}

class _JellyfinWatchPartiesState extends State<_JellyfinWatchParties> {
  final _party = GetIt.instance<SiloWatchPartyManager>();

  /// A SyncPlay group open when the screen opened shows SyncPlay's screen.
  late final bool _inSyncPlay =
      !_party.inRoom &&
      GetIt.instance.isRegistered<SyncPlayManager>() &&
      GetIt.instance<SyncPlayManager>().state.enabled;

  late final Future<WatchPartyService> _service = _party.isMoonbase
      ? Future.value(WatchPartyService.moonbase)
      : _party.availability();

  @override
  Widget build(BuildContext context) {
    if (_inSyncPlay) return const SyncPlayScreen();
    return FutureBuilder<WatchPartyService>(
      future: _service,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).watchParties),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.data != WatchPartyService.moonbase) {
          return const SyncPlayScreen();
        }
        return SiloWatchPartyScreen(
          joinCode: widget.joinCode,
          service: WatchPartyService.moonbase,
        );
      },
    );
  }
}

/// Where a party push or invite link lands. An invite names the server by
/// its own id (Jellyfin's or Emby's server id, the PMS machine id), which
/// isn't the id the app saves servers under. On the signed-in server it
/// joins the room. A saved server at the invite's address is switched to
/// through the deep link sign-in (which keeps its PIN and Kids Mode gates)
/// and the link opened again. A server the app doesn't have yet is offered
/// to be added, after which the link is opened again.
class WatchPartyLinkScreen extends StatefulWidget {
  const WatchPartyLinkScreen({
    super.key,
    this.code,
    this.serverId,
    this.address,
    this.switched = false,
  });

  final String? code;
  final String? serverId;
  final String? address;

  /// The link already went through a user switch, so it isn't tried again.
  final bool switched;

  @override
  State<WatchPartyLinkScreen> createState() => _WatchPartyLinkScreenState();
}

class _WatchPartyLinkScreenState extends State<WatchPartyLinkScreen> {
  late final Future<bool> _here = _onThisServer();
  bool _adding = false;
  bool _failed = false;

  Future<bool> _onThisServer() async {
    final id = widget.serverId;
    if (id == null || id.isEmpty) return true;
    final getIt = GetIt.instance;
    if (getIt.isRegistered<SessionRepository>() &&
        getIt<SessionRepository>().activeServerId == id) {
      return true;
    }
    if (getIt.isRegistered<MediaServerClient>()) {
      try {
        final info = await getIt<MediaServerClient>().systemApi
            .getPublicSystemInfo()
            .timeout(const Duration(seconds: 5));
        if ('${info['Id']}' == id) return true;
      } catch (_) {}
    }
    final saved = _savedAt(widget.address);
    if (saved != null && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _switchTo(saved));
    }
    return false;
  }

  /// The saved server at [address], matched by host and port, since Emby's
  /// invite leaves out its `/emby` path.
  static Server? _savedAt(String? address) {
    final want = Uri.tryParse(address ?? '');
    if (want == null || want.host.isEmpty) return null;
    if (!GetIt.instance.isRegistered<ServerRepository>()) return null;
    for (final server in GetIt.instance<ServerRepository>().servers) {
      final have = Uri.tryParse(server.address);
      if (have != null &&
          have.host.toLowerCase() == want.host.toLowerCase() &&
          have.port == want.port) {
        return server;
      }
    }
    return null;
  }

  void _switchTo(Server server) {
    if (!mounted) return;
    final users = GetIt.instance<AuthenticationStore>().getUsers(server.id)
      ..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));
    final user = users.firstOrNull;
    // A switch the sign-in gates refused lands back here: sign in by hand.
    if (user == null || widget.switched) {
      context.go('${Destinations.server}?serverId=${server.id}');
      return;
    }
    final query = {
      'code': ?widget.code,
      'serverId': server.id,
      'userId': user.id,
    }.entries.map((e) => '${e.key}=${Uri.encodeQueryComponent(e.value)}');
    navigateWhenReady('${Destinations.watchParty}?${query.join('&')}');
  }

  Future<void> _add() async {
    final address = widget.address;
    if (address == null || address.isEmpty) return;
    setState(() {
      _adding = true;
      _failed = false;
    });
    try {
      final server = await GetIt.instance<ServerRepository>().addServer(
        address,
      );
      if (!mounted) return;
      if (server != null) {
        context.go('${Destinations.server}?serverId=${server.id}');
        return;
      }
    } catch (_) {}
    if (mounted) {
      setState(() {
        _adding = false;
        _failed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<bool>(
    future: _here,
    builder: (context, here) {
      if (here.data == true) return watchTogetherScreen(joinCode: widget.code);
      final l10n = AppLocalizations.of(context);
      final address = widget.address;
      final deciding =
          here.connectionState != ConnectionState.done ||
          _savedAt(address) != null;
      return Scaffold(
        appBar: AppBar(title: Text(l10n.watchParties)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: deciding
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.dns_outlined, size: 56),
                      const SizedBox(height: 16),
                      Text(
                        l10n.watchPartyAddServerQuestion(address ?? ''),
                        textAlign: TextAlign.center,
                      ),
                      if (_failed) ...[
                        const SizedBox(height: 8),
                        Text(
                          l10n.unableToConnectToServer,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      FilledButton.icon(
                        autofocus: true,
                        onPressed:
                            _adding || address == null || address.isEmpty
                            ? null
                            : _add,
                        icon: const Icon(Icons.add),
                        label: Text(l10n.addServer),
                      ),
                    ],
                  ),
          ),
        ),
      );
    },
  );
}
