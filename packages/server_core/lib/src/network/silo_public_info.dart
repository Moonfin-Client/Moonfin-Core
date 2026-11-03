import 'json_body.dart';

/// Silo's public, unauthenticated system info endpoint (native API).
const siloSystemInfoPath = '/api/v2/system/info';

/// The Silo API major version this build speaks (`/api/v2`). A server
/// reports its own as `api_major` in `/system/info` (folded into
/// `SiloApiMajor`). Any other major is refused when the server is added.
const siloSupportedApiMajor = 2;

/// Silo answered that this client's API is retired: `410 Gone` with the
/// `client_upgrade_required` problem (how Silo tombstones a replaced API
/// namespace), or a `/system/info` whose `api_major` isn't
/// [siloSupportedApiMajor].
class SiloApiUnsupported implements Exception {
  /// The server's API major when it gave one, or null for a tombstone.
  final int? apiMajor;

  const SiloApiUnsupported({this.apiMajor});

  /// Whether the server is newer than this build (update Moonfin), rather
  /// than older (update Silo). A tombstone means newer.
  bool get serverIsNewer =>
      apiMajor == null || apiMajor! > siloSupportedApiMajor;

  @override
  String toString() =>
      'Silo API ${apiMajor ?? 'retired'} (this build speaks $siloSupportedApiMajor)';
}

/// Whether [status] and [body] are Silo's `client_upgrade_required` answer.
bool isSiloClientUpgradeRequired(int? status, Object? body) {
  if (status != 410 && status != 426) return false;
  final type = asJsonMap(body)?['type'];
  return status == 426 ||
      (type is String && type.endsWith('/client_upgrade_required'));
}

/// Whether [data] is the body of Silo's `GET /api/v2/system/info`.
bool isSiloSystemInfo(Map<String, dynamic>? data) =>
    data != null &&
    data['api_major'] is num &&
    data['server_version'] is String;

/// Folds Silo's public endpoints into the Jellyfin `PublicSystemInfo` keys
/// Moonfin reads: `Id`, `ServerName`, `Version`, `ProductName`,
/// `StartupWizardCompleted` and `LoginDisclaimer`. The native values stay
/// available under `Silo*` keys.
///
/// - [systemInfo]: `GET /api/v2/system/info` (required).
/// - [identity]: `GET /api/v2/system/identity`. `Id` is its `server_id`, the
///   native v2 identity. Silo's legacy v1 health route reports a different
///   id, which must never be used.
/// - [branding]: `GET /api/v2/theme/branding`, for the server name and the
///   sign-in subtitle.
/// - [setup]: `GET /api/v2/system/setup`.
///
/// The last three are optional because they are cosmetic once the server is
/// known to be Silo. Callers fetch them best effort.
Map<String, dynamic> siloPublicInfoToJellyfinShape({
  required Map<String, dynamic> systemInfo,
  Map<String, dynamic>? identity,
  Map<String, dynamic>? branding,
  Map<String, dynamic>? setup,
}) {
  final wizardCompleted = setup?['wizard_completed'];
  final needsSetup = setup?['needs_setup'];
  final loginSubtitle = jsonText(branding?['login_subtitle']);
  return {
    'Id': jsonText(identity?['server_id']),
    'ServerName': jsonText(branding?['server_name']) ?? 'Silo',
    // A git short hash such as "4b2e921c+dirty", not a semantic version.
    // Display it, never parse it. Compatibility is decided by SiloApiMajor.
    'Version': systemInfo['server_version'],
    'ProductName': 'Silo',
    'StartupWizardCompleted': wizardCompleted is bool
        ? wizardCompleted
        : (needsSetup is bool ? !needsSetup : true),
    if (loginSubtitle != null) 'LoginDisclaimer': loginSubtitle,
    'SiloApiMajor': systemInfo['api_major'],
    'SiloContractDigest': systemInfo['contract_digest'],
  };
}
