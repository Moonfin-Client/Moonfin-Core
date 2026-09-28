import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../data/services/connectivity_service.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../widgets/navigation_layout.dart';

/// Which questions the first-run wizard still has to ask, in the order shown.
///
/// [navbar] leads because it is the frame everything after it sits in.
/// [navbarStyle] follows it and only shows once Bottom has been picked, see
/// [visibleSetupSteps]. [tour] is never suppressed, since it asks nothing
/// that could already have been answered.
enum SetupStep { navbar, navbarStyle, mediaBar, homeRows, detailStyle, tour }

/// [steps] as the user sees them, given the navbar position in effect. The
/// style question only means something for the bottom navbar.
List<SetupStep> visibleSetupSteps(
  List<SetupStep> steps,
  NavbarPosition effectivePosition,
) =>
    [
      for (final step in steps)
        if (step != SetupStep.navbarStyle ||
            effectivePosition == NavbarPosition.bottom)
          step,
    ];

/// Decides whether the wizard runs, and for which steps.
///
/// The router asks this on every navigation, so [shouldRun] stays a couple of
/// preference reads and never touches the network. Anything slow happens
/// inside the wizard itself.
class SetupWizardGate {
  SetupWizardGate(this._prefs);

  final UserPreferences _prefs;

  /// Set when a run is abandoned before it can finish, because the server was
  /// out of reach or its settings never arrived. Without it the router would
  /// send the user straight back in on the next navigation and strand them.
  /// In memory only, so the next launch tries again.
  bool _deferredThisLaunch = false;

  /// Set while an explicit re-run from settings is in flight, so the router
  /// leaves it alone even though the server is already marked as set up.
  bool _rerunning = false;

  /// The id the client factory filed this client under, which is also the id
  /// the sync service keys its per-server state by.
  String? _serverIdFor(MediaServerClient client) {
    if (!GetIt.instance.isRegistered<MediaServerClientFactory>()) return null;
    for (final entry
        in GetIt.instance<MediaServerClientFactory>().clients.entries) {
      if (identical(entry.value, client)) return entry.key;
    }
    return null;
  }

  /// Keyed by server id rather than address, so moving a server to a new URL
  /// doesn't read as one nobody has set up yet. It is the same pairing the
  /// settings themselves are scoped by, so the flag can't drift from the
  /// answers it stands for.
  String? _serverKeyFor(MediaServerClient client) {
    final userId = client.userId;
    if (userId == null || userId.isEmpty) return null;
    return '${_serverIdFor(client) ?? client.baseUrl}_$userId';
  }

  bool _isCompleteFor(String serverKey) =>
      _prefs.get(UserPreferences.setupWizardVersionForServer(serverKey)) >=
      UserPreferences.setupWizardVersion;

  bool shouldRun(MediaServerClient client) {
    if (_rerunning) return true;
    if (_deferredThisLaunch) return false;

    // A server we can't reach can neither serve the previews nor resolve the
    // settings the wizard would otherwise overwrite. Leave the flag unwritten
    // so a later launch, on a better network, still gets the chance.
    if (GetIt.instance.isRegistered<ConnectivityService>() &&
        !GetIt.instance<ConnectivityService>().canReachServer) {
      return false;
    }

    final serverKey = _serverKeyFor(client);
    if (serverKey == null) return false;
    if (_isCompleteFor(serverKey)) return false;
    return remainingSteps().isNotEmpty;
  }

  /// The steps still worth asking, in order.
  ///
  /// Anything already chosen drops out, which on a second device usually
  /// empties the list entirely and finishes the wizard without drawing a
  /// frame. A deliberate re-run asks everything, because going looking for it
  /// says more than the stored values do.
  List<SetupStep> remainingSteps() {
    final offerStyle = NavigationLayout.allowBottomNavbar;
    if (_rerunning) {
      return [
        for (final step in SetupStep.values)
          if (step != SetupStep.navbarStyle || offerStyle) step,
      ];
    }

    final askNavbar = !_prefs.containsPreference(
      UserPreferences.navbarPosition,
    );
    final steps = <SetupStep>[
      if (askNavbar) SetupStep.navbar,
      // Tied to the navbar question: a user whose other answers came over
      // from another device would otherwise get a wizard asking only this.
      if (askNavbar &&
          offerStyle &&
          !_prefs.containsPreference(UserPreferences.bottomNavbarStyle))
        SetupStep.navbarStyle,
      if (!_prefs.containsPreference(UserPreferences.mediaBarMode))
        SetupStep.mediaBar,
      if (!_prefs.containsPreference(UserPreferences.homeRowsStyle))
        SetupStep.homeRows,
      if (!_prefs.containsPreference(UserPreferences.detailScreenStyle))
        SetupStep.detailStyle,
    ];
    // The tour only pays for itself alongside something else. On its own it is
    // a splash screen between the user and the app they came to open.
    if (steps.isEmpty) return const [];
    return [...steps, SetupStep.tour];
  }

  /// Waits for the server to hand over this user's settings.
  ///
  /// The plugin resolves a profile shortly after sign-in and applies it whole.
  /// Answering before that lands means watching the answers get overwritten a
  /// second later.
  Future<bool> waitForSettings(
    MediaServerClient client, {
    Duration timeout = const Duration(seconds: 3),
  }) async {
    if (!GetIt.instance.isRegistered<PluginSyncService>()) return true;
    final sync = GetIt.instance<PluginSyncService>();
    // Has to be the id the sync service wrote under. Reading without it falls
    // back to the address, which is a key nothing ever sets, so the wait could
    // only ever time out.
    final serverId = _serverIdFor(client);

    final deadline = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(deadline)) {
      if (sync.isSyncInitializedForServer(client, serverId: serverId)) {
        return true;
      }
      await Future<void>.delayed(const Duration(milliseconds: 120));
    }
    // A server with no plugin on it has no profile coming, so there is nothing
    // left to wait for. One that has the plugin is still going to push, and it
    // would land on top of anything chosen here.
    return !sync.pluginAvailable;
  }

  /// Stand down for the rest of this launch without marking anything done.
  void deferThisLaunch() {
    // The re-run flag goes with it. shouldRun answers true for a re-run before
    // it looks at anything else, so leaving it set sends the router straight
    // back here and the wizard never stops loading.
    _rerunning = false;
    _deferredThisLaunch = true;
  }

  /// Marks this server and user as set up, whether they answered every question
  /// or skipped the lot. Skipping is an answer: it means stop asking.
  Future<void> markComplete(MediaServerClient client) async {
    _rerunning = false;
    final serverKey = _serverKeyFor(client);
    if (serverKey == null) return;
    await _prefs.set(
      UserPreferences.setupWizardVersionForServer(serverKey),
      UserPreferences.setupWizardVersion,
    );
  }

  /// Asks every question again, whatever the stored values say.
  ///
  /// Cleared by [markComplete], which every way out of the wizard goes through.
  void beginRerun() {
    _rerunning = true;
    _deferredThisLaunch = false;
  }
}
