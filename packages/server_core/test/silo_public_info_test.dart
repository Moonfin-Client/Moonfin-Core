import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

// The four public responses of Silo 4b2e921c (fixtures in server_silo).
const _systemInfo = {
  'server_version': '4b2e921c+dirty',
  'api_major': 2,
  'contract_digest':
      '12ea11dd8223e9426ab5376aad1116c150a674b432989b3cb4e5dbc9458b960a',
};
const _identity = {'server_id': '7b72fbd5-e741-48f0-9d05-b438990f3a7e'};
const _branding = {
  'server_name': 'Silo',
  'login_subtitle': 'Sign in with an existing account.',
};
const _setup = {'needs_setup': false, 'wizard_completed': true};

void main() {
  test('isSiloSystemInfo needs api_major and server_version', () {
    expect(isSiloSystemInfo(_systemInfo), isTrue);
    expect(isSiloSystemInfo(null), isFalse);
    expect(isSiloSystemInfo({'server_version': 'x'}), isFalse);
    expect(isSiloSystemInfo({'api_major': 2, 'server_version': 4}), isFalse);
    // Jellyfin's public info isn't Silo's.
    expect(
      isSiloSystemInfo({'ProductName': 'Jellyfin Server', 'Version': '10.10'}),
      isFalse,
    );
  });

  test('maps the four endpoints to the Jellyfin keys', () {
    expect(
      siloPublicInfoToJellyfinShape(
        systemInfo: _systemInfo,
        identity: _identity,
        branding: _branding,
        setup: _setup,
      ),
      {
        'Id': '7b72fbd5-e741-48f0-9d05-b438990f3a7e',
        'ServerName': 'Silo',
        'Version': '4b2e921c+dirty',
        'ProductName': 'Silo',
        'StartupWizardCompleted': true,
        'LoginDisclaimer': 'Sign in with an existing account.',
        'SiloApiMajor': 2,
        'SiloContractDigest': _systemInfo['contract_digest'],
      },
    );
  });

  test('works from system info alone', () {
    final info = siloPublicInfoToJellyfinShape(systemInfo: _systemInfo);
    expect(info['Id'], isNull);
    expect(info['ServerName'], 'Silo');
    expect(info['StartupWizardCompleted'], isTrue);
    expect(info.containsKey('LoginDisclaimer'), isFalse);
  });

  test('setup state: wizard_completed first, then needs_setup', () {
    bool? completed(Map<String, dynamic> setup) =>
        siloPublicInfoToJellyfinShape(
              systemInfo: _systemInfo,
              setup: setup,
            )['StartupWizardCompleted']
            as bool?;
    expect(
      completed({'wizard_completed': false, 'needs_setup': false}),
      isFalse,
    );
    expect(completed({'needs_setup': true}), isFalse);
    expect(completed({'needs_setup': false}), isTrue);
    expect(completed({}), isTrue);
  });

  test('blank branding falls back to "Silo" and no disclaimer', () {
    final info = siloPublicInfoToJellyfinShape(
      systemInfo: _systemInfo,
      branding: {'server_name': '  ', 'login_subtitle': ''},
    );
    expect(info['ServerName'], 'Silo');
    expect(info.containsKey('LoginDisclaimer'), isFalse);
  });

  test('a custom server name is used as is', () {
    final info = siloPublicInfoToJellyfinShape(
      systemInfo: _systemInfo,
      branding: {'server_name': ' Snowy Streams '},
    );
    expect(info['ServerName'], 'Snowy Streams');
  });
}
