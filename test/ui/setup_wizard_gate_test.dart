import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/setup/setup_wizard_gate.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeClient implements MediaServerClient {
  @override
  String get baseUrl => 'http://server';

  @override
  String? get userId => 'user';

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// A client with no signed-in user, which is what the router can briefly see
/// while a session is being torn down.
class _AnonymousClient extends _FakeClient {
  @override
  String? get userId => null;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late SetupWizardGate gate;
  final client = _FakeClient();

  const serverKey = 'http://server_user';

  setUp(() async {
    // The wizard only ever runs with somebody signed in, and the settings it
    // asks about are stored per server and user. Without a scope to write into
    // they would land on unscoped keys and none of this would be realistic.
    SharedPreferences.setMockInitialValues({
      'pref_last_server_id': 'http://server',
      'pref_last_user_id': 'user',
    });
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    gate = SetupWizardGate(prefs);
    // Tests run as Android, which would offer the bottom navbar. Most of these
    // are about the gate itself, so they run as a device without one.
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
  });

  tearDown(
    () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
  );

  group('what the wizard still has to ask', () {
    test('a fresh sign-in is asked everything, and ends on the tour', () {
      expect(gate.remainingSteps(), [
        SetupStep.navbar,
        SetupStep.mediaBar,
        SetupStep.homeRows,
        SetupStep.detailStyle,
        SetupStep.tour,
      ]);
      expect(gate.shouldRun(client), isTrue);
    });

    test('a question answered elsewhere is not asked again', () async {
      await prefs.set(
        UserPreferences.mediaBarMode,
        UserPreferences.mediaBarModeBanner,
      );

      expect(gate.remainingSteps(), [
        SetupStep.navbar,
        SetupStep.homeRows,
        SetupStep.detailStyle,
        SetupStep.tour,
      ]);
    });

    // The whole point of the second-device case: the account already knows how
    // it likes to look, so there is nothing worth interrupting anyone for.
    test(
      'an account that has answered everything is not shown the wizard',
      () async {
        await prefs.set(UserPreferences.navbarPosition, NavbarPosition.left);
        await prefs.set(
          UserPreferences.mediaBarMode,
          UserPreferences.mediaBarModeGallery,
        );
        await prefs.set(UserPreferences.homeRowsStyle, HomeRowsStyle.v1);
        await prefs.set(
          UserPreferences.detailScreenStyle,
          DetailScreenStyle.classic,
        );

        expect(gate.remainingSteps(), isEmpty);
        expect(gate.shouldRun(client), isFalse);
      },
    );

    test('the tour never shows up on its own', () async {
      await prefs.set(UserPreferences.navbarPosition, NavbarPosition.top);
      await prefs.set(
        UserPreferences.mediaBarMode,
        UserPreferences.mediaBarModeOff,
      );
      await prefs.set(UserPreferences.homeRowsStyle, HomeRowsStyle.v2);
      await prefs.set(
        UserPreferences.detailScreenStyle,
        DetailScreenStyle.modern,
      );

      expect(gate.remainingSteps(), isNot(contains(SetupStep.tour)));
    });
  });

  group('once it has had its turn', () {
    test('finishing stops it coming back', () async {
      await gate.markComplete(client);

      expect(gate.shouldRun(client), isFalse);
      expect(
        prefs.get(UserPreferences.setupWizardVersionForServer(serverKey)),
        UserPreferences.setupWizardVersion,
      );
    });

    // Writing the defaults here would look like deliberate choices to every
    // later device, and none of them would ever ask.
    test('skipping writes the flag and nothing else', () async {
      await gate.markComplete(client);

      expect(gate.shouldRun(client), isFalse);
      expect(prefs.containsPreference(UserPreferences.mediaBarMode), isFalse);
      expect(prefs.containsPreference(UserPreferences.homeRowsStyle), isFalse);
      expect(
        prefs.containsPreference(UserPreferences.detailScreenStyle),
        isFalse,
      );
    });

    test('a deliberate re-run asks everything again', () async {
      await prefs.set(
        UserPreferences.mediaBarMode,
        UserPreferences.mediaBarModeMakd,
      );
      await gate.markComplete(client);

      gate.beginRerun();

      expect(gate.shouldRun(client), isTrue);
      // Everything this device can show. There is no bottom bar here, so no
      // question about its style.
      expect(
        gate.remainingSteps(),
        SetupStep.values.where((s) => s != SetupStep.navbarStyle),
      );
    });

    test('finishing a re-run puts it away again', () async {
      gate.beginRerun();
      await gate.markComplete(client);

      expect(gate.shouldRun(client), isFalse);
    });
  });

  group('the bottom navbar style question', () {
    setUp(() => PlatformDetection.setInterfaceLayout(InterfaceLayout.phone));

    test('a phone asks it right after where navigation goes', () {
      expect(gate.remainingSteps(), [
        SetupStep.navbar,
        SetupStep.navbarStyle,
        SetupStep.mediaBar,
        SetupStep.homeRows,
        SetupStep.detailStyle,
        SetupStep.tour,
      ]);
    });

    test('isn\'t asked on its own when the navbar came from elsewhere',
        () async {
      await prefs.set(UserPreferences.navbarPosition, NavbarPosition.bottom);

      expect(gate.remainingSteps(), isNot(contains(SetupStep.navbarStyle)));
    });

    test('isn\'t asked again once answered', () async {
      await prefs.set(
        UserPreferences.bottomNavbarStyle,
        BottomNavbarStyle.split,
      );

      expect(gate.remainingSteps(), isNot(contains(SetupStep.navbarStyle)));
    });

    test('a re-run on a phone includes it', () {
      gate.beginRerun();

      expect(gate.remainingSteps(), SetupStep.values);
    });

    test('only shows once Bottom is picked', () {
      final steps = gate.remainingSteps();

      expect(
        visibleSetupSteps(steps, NavbarPosition.top),
        isNot(contains(SetupStep.navbarStyle)),
      );
      expect(
        visibleSetupSteps(steps, NavbarPosition.bottom),
        contains(SetupStep.navbarStyle),
      );
    });
  });

  group('giving up without answering', () {
    // A run that can't finish must not strand anyone. The router asks on
    // every navigation, so without this it would bounce them straight back in.
    test('a deferred run stands down for the rest of the launch', () {
      expect(gate.shouldRun(client), isTrue);

      gate.deferThisLaunch();

      expect(gate.shouldRun(client), isFalse);
      expect(
        prefs.get(UserPreferences.setupWizardVersionForServer(serverKey)),
        0,
        reason: 'deferring is not finishing, so a later launch still asks',
      );
    });

    // The re-run flag is answered before anything else, so a re-run that gives
    // up has to drop it too. Left set, the router sends the user back into a
    // wizard that gives up again, and the loading never ends.
    test('a re-run that gives up does not bounce back', () async {
      await gate.markComplete(client);
      gate.beginRerun();

      gate.deferThisLaunch();

      expect(gate.shouldRun(client), isFalse);
    });

    test('a client with nobody signed in is left alone', () {
      expect(gate.shouldRun(_AnonymousClient()), isFalse);
    });
  });
}
