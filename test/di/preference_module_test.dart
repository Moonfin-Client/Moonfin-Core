import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/di/modules/preference_module.dart';
import 'package:moonfin/util/insecure_certificates.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    await GetIt.instance.reset();
    gAllowSelfSignedCertificates = false;
  });

  Future<void> registerWith(Map<String, Object> stored) async {
    SharedPreferences.setMockInitialValues(stored);
    final store = PreferenceStore();
    await store.init();
    registerPreferenceModule(store);
  }

  test(
    'a stored opt-in is in place before anything reaches a server',
    () async {
      await registerWith({'pref_allow_self_signed_certs': true});

      expect(gAllowSelfSignedCertificates, isTrue);
    },
  );

  test('certificates stay checked when the user never opted in', () async {
    gAllowSelfSignedCertificates = true;
    await registerWith({});

    expect(gAllowSelfSignedCertificates, isFalse);
  });
}
