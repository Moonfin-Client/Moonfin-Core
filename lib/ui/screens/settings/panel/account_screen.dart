part of '../settings_side_panel.dart';

class _AccountScreen extends StatelessWidget {
  const _AccountScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.account)),
      body: ListView(
        children: [
          _SectionHeader(l10n.settingsSignInSection),
          adaptiveListSection(
            children: [
              EnumPreferenceTile<UserSelectBehavior>(
                autofocus: true,
                preference: UserPreferences.autoLoginUserBehavior,
                title: l10n.autoLogin,
                icon: Icons.person,
                labelOf: (v) {
                  if (v == UserSelectBehavior.currentUser) {
                    final session = GetIt.instance<SessionRepository>();
                    // If I'm the auto-login user, just say "Current User"
                    // If someone else is, show their name so it's clear
                    if (session.activeUserIsAutoLoginTarget) {
                      return l10n.currentUser;
                    }
                    return session.autoLoginTargetDisplayName() ??
                        l10n.currentUser;
                  }
                  return switch (v) {
                    UserSelectBehavior.disabled => l10n.disabled,
                    UserSelectBehavior.lastUser => l10n.lastUser,
                    _ => l10n.currentUser,
                  };
                },
                dialogLabelOf: (v) => switch (v) {
                  UserSelectBehavior.disabled => l10n.disabled,
                  UserSelectBehavior.lastUser => l10n.lastUser,
                  UserSelectBehavior.currentUser => l10n.currentUser,
                },
                onChanged: () {
                  final behavior = GetIt.instance<PreferenceStore>().get(
                    UserPreferences.autoLoginUserBehavior,
                  );
                  GetIt.instance<SessionRepository>().applyAutoLoginForBehavior(
                    behavior,
                  );
                },
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.alwaysAuthenticate,
                title: l10n.alwaysAuthenticate,
                subtitle: l10n.requirePasswordWithToken,
                icon: Icons.lock,
              ),
              _TvSettingsListTile(
                leading: const Icon(Icons.pin),
                title: Text(l10n.pinCode),
                subtitle: Text(l10n.requirePinToAccess),
                onTap: () =>
                    context.pushSettingsScreen(const PinCodeSettingsScreen()),
              ),
            ],
          ),
          _SectionHeader(l10n.settingsFamilySection),
          adaptiveListSection(
            children: [
              _TvSettingsListTile(
                leading: const Icon(Icons.child_care),
                title: Text(l10n.kidsMode),
                subtitle: Text(l10n.kidsModeSubtitle),
                onTap: () => unawaited(_enableKidsMode(context)),
              ),
              _TvSettingsListTile(
                leading: const Icon(Icons.family_restroom),
                title: Text(l10n.parentalControls),
                subtitle: Text(l10n.contentRatingRestrictions),
                onTap: () =>
                    context.pushSettingsScreen(const ParentalSettingsScreen()),
              ),
            ],
          ),
          // Certificate trust is the browser's job on web, so this is
          // native-only.
          if (!PlatformDetection.isWeb) ...[
            _SectionHeader(l10n.settingsServersSection),
            adaptiveListSection(
              children: [
                EnumPreferenceTile<UserSortBy>(
                  preference: AuthenticationPreferences.sortBy,
                  title: l10n.settingsSortServersBy,
                  icon: Icons.swap_horiz,
                  labelOf: (v) => switch (v) {
                    UserSortBy.lastUsed => l10n.settingsLastUsed,
                    UserSortBy.alphabetical => l10n.settingsAlphabetical,
                  },
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.allowSelfSignedCerts,
                  title: l10n.settingsAllowSelfSignedCerts,
                  subtitle: l10n.settingsAllowSelfSignedCertsSubtitle,
                  icon: Icons.gpp_maybe,
                  onChangedValue: (v) => gAllowSelfSignedCertificates = v,
                ),
                _TvSettingsListTile(
                  leading: const Icon(Icons.verified_user),
                  title: Text(l10n.settingsClientCertificates),
                  subtitle: Text(l10n.settingsClientCertificatesSubtitle),
                  onTap: () => context.pushSettingsScreen(
                    const _ClientCertificatesScreen(),
                  ),
                ),
              ],
            ),
          ],
          // Settings sync is the Moonfin plugin's. Not offered when no
          // signed-in server could have it (all Silo, say).
          if (moonfinPluginOnAnySignedInServer())
            adaptiveListSection(
              children: [
                _TvSettingsListTile(
                  leading: const Icon(Icons.sync),
                  title: Text(l10n.settingsSync),
                  subtitle: Text(l10n.settingsSyncSubtitle),
                  onTap: () =>
                      context.pushSettingsScreen(const _PluginScreen()),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

/// Turns Kids Mode on behind a PIN, asked for every time the mode goes on.
///
/// There is nowhere else to change this PIN, so carrying an old one over would
/// hand the mode a code the parent turning it on never chose and may not know.
Future<void> _enableKidsMode(BuildContext context) async {
  final userId = GetIt.instance<SessionRepository>().activeUserId ?? '';
  final pin = PinCodeUtil.kidsMode(GetIt.instance<PreferenceStore>(), userId);
  final navigator = Navigator.of(context);

  final ready = await PinEntryDialog.show(
    context,
    mode: PinEntryMode.set,
    onPinSet: pin.setPin,
  );
  if (!ready) return;

  await GetIt.instance<UserPreferences>().set(
    UserPreferences.kidsModeEnabled,
    true,
  );

  // Settings are sitting on whichever screen turned the mode on, which is one
  // the mode has just taken away. Drop back to the panel, where the only entry
  // left is the way out.
  navigator.popUntil((route) => route.isFirst);
}

class _ClientCertificatesScreen extends StatefulWidget {
  const _ClientCertificatesScreen();

  @override
  State<_ClientCertificatesScreen> createState() =>
      _ClientCertificatesScreenState();
}

class _ClientCertificatesScreenState extends State<_ClientCertificatesScreen> {
  final _store = GetIt.instance<ClientCertificateStore>();
  List<StoredClientCertificate>? _certificates;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final certificates = await _store.getAll();
    if (mounted) setState(() => _certificates = certificates);
  }

  String get _activeServerHost {
    final serverId = GetIt.instance<SessionRepository>().activeServerId;
    if (serverId == null) return '';
    final address = GetIt.instance<ServerRepository>()
        .getServer(serverId)
        ?.address;
    return Uri.tryParse(address ?? '')?.host ?? '';
  }

  Future<void> _add() async {
    final l10n = AppLocalizations.of(context);
    var typed = _activeServerHost;
    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog.adaptive(
        title: Text(l10n.clientCertAddHostPrompt),
        content: Material(
          type: MaterialType.transparency,
          child: TextFormField(
            initialValue: typed,
            autofocus: true,
            keyboardType: TextInputType.url,
            onChanged: (value) => typed = value,
            onFieldSubmitted: (_) => Navigator.of(dialogContext).pop(true),
          ),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          adaptiveDialogAction(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    // Matches the host form the server list keeps, punycode included.
    final url = normalizeServerBaseUrl(typed);
    final host =
        Uri.tryParse(url.contains('://') ? url : 'https://$url')?.host ?? '';
    if (host.isNotEmpty) await _import(host);
  }

  Future<void> _import(String host) async {
    final saved = await showClientCertificateDialog(
      context: context,
      host: host,
    );
    if (saved != null) await _load();
  }

  Future<void> _manage(StoredClientCertificate certificate) async {
    final l10n = AppLocalizations.of(context);
    final action = await showFocusRestoringDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog.adaptive(
        title: Text(certificate.host),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          adaptiveDialogAction(
            onPressed: () => Navigator.of(dialogContext).pop('replace'),
            child: Text(l10n.clientCertReplace),
          ),
          adaptiveDialogAction(
            onPressed: () => Navigator.of(dialogContext).pop('remove'),
            isDestructive: true,
            child: Text(l10n.remove),
          ),
        ],
      ),
    );
    if (!mounted) return;
    if (action == 'replace') await _import(certificate.host);
    if (action == 'remove') {
      await removeClientCertificate(_store, certificate.host);
      await _load();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dates = MaterialLocalizations.of(context);
    final certificates = _certificates;
    return Scaffold(
      appBar: buildSettingsAppBar(
        context,
        Text(l10n.settingsClientCertificates),
      ),
      body: certificates == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                adaptiveListSection(
                  children: [
                    for (final certificate in certificates)
                      _TvSettingsListTile(
                        leading: const Icon(Icons.verified_user),
                        title: Text(certificate.host),
                        subtitle: Text(
                          '${l10n.clientCertSubject}: ${certificate.subject}\n'
                          '${l10n.clientCertExpires(dates.formatMediumDate(certificate.notAfter.toLocal()))}',
                        ),
                        onTap: () => _manage(certificate),
                      ),
                    _TvSettingsListTile(
                      autofocus: certificates.isEmpty,
                      leading: const Icon(Icons.add),
                      title: Text(l10n.clientCertAdd),
                      onTap: _add,
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
