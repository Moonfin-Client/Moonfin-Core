import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/admin_pin_offer.dart';
import 'package:moonfin/data/services/pin_guard.dart';
import 'package:moonfin/data/services/server_pin_service.dart';
import 'package:moonfin/util/pin_code_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockService extends Mock implements ServerPinService {}

void main() {
  const account = ServerPinAccount(
    baseUrl: 'https://media.test',
    accessToken: 'token-1',
  );
  late PreferenceStore store;
  late AdminPinOffer offer;
  late _MockService service;

  setUpAll(() => registerFallbackValue(account));

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    store = PreferenceStore();
    await store.init();
    offer = AdminPinOffer(store);
    service = _MockService();
    when(() => service.status(any()))
        .thenAnswer((_) async => ServerPinAvailability.unavailable);
  });

  PinGuard guardFor({bool withAccount = true}) => PinGuard(
    pin: PinCodeUtil(store, 'admin'),
    service: service,
    account: withAccount ? account : null,
  );

  test('an administrator with no PIN and no plugin is offered one', () async {
    expect(
      offer.shouldOffer(
        userId: 'admin',
        isAdministrator: true,
        guard: guardFor(),
      ),
      isTrue,
    );
  });

  test('nobody else is', () async {
    expect(
      offer.shouldOffer(
        userId: 'admin',
        isAdministrator: false,
        guard: guardFor(),
      ),
      isFalse,
    );
  });

  test('a no is remembered for that user only', () async {
    await offer.decline('admin');

    expect(offer.hasDeclined('admin'), isTrue);
    expect(offer.hasDeclined('other'), isFalse);
    expect(
      offer.shouldOffer(
        userId: 'admin',
        isAdministrator: true,
        guard: guardFor(),
      ),
      isFalse,
    );
  });

  test('an administrator who already has a PIN is not asked', () async {
    await PinCodeUtil(store, 'admin').setPin('4821');

    expect(
      offer.shouldOffer(
        userId: 'admin',
        isAdministrator: true,
        guard: guardFor(),
      ),
      isFalse,
    );
  });

  test('an administrator on a plugin server with no PIN is offered one too', () async {
    when(() => service.status(any()))
        .thenAnswer((_) async => ServerPinAvailability.disabled);

    expect(
      offer.shouldOffer(
        userId: 'admin',
        isAdministrator: true,
        guard: guardFor(),
      ),
      isTrue,
    );
  });

  test('a server that cannot be asked at all still gets the offer', () async {
    expect(
      offer.shouldOffer(
        userId: 'admin',
        isAdministrator: true,
        guard: guardFor(withAccount: false),
      ),
      isTrue,
    );
  });

  group('a PIN synced from the server', () {
    test('an administrator is told once, in place of the offer', () async {
      final guard = guardFor();
      await guard.pin.setServerBacked(true);

      expect(
        offer.shouldNoteSyncedPin(
          userId: 'admin',
          isAdministrator: true,
          guard: guard,
        ),
        isTrue,
      );
      expect(
        offer.shouldOffer(
          userId: 'admin',
          isAdministrator: true,
          guard: guard,
        ),
        isFalse,
      );

      await offer.markSyncedPinNoted('admin');

      expect(
        offer.shouldNoteSyncedPin(
          userId: 'admin',
          isAdministrator: true,
          guard: guard,
        ),
        isFalse,
      );
    });

    test('nobody is told about a PIN that is only on the device', () async {
      await PinCodeUtil(store, 'admin').setPin('4821');

      expect(
        offer.shouldNoteSyncedPin(
          userId: 'admin',
          isAdministrator: true,
          guard: guardFor(),
        ),
        isFalse,
      );
    });

    test('only administrators are told', () async {
      final guard = guardFor();
      await guard.pin.setServerBacked(true);

      expect(
        offer.shouldNoteSyncedPin(
          userId: 'admin',
          isAdministrator: false,
          guard: guard,
        ),
        isFalse,
      );
    });
  });
}
