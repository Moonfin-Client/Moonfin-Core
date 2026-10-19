import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
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
  late PinCodeUtil pin;
  late _MockService service;
  late PinGuard guard;

  setUpAll(() => registerFallbackValue(account));

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    store = PreferenceStore();
    await store.init();
    pin = PinCodeUtil(store, 'user');
    service = _MockService();
    guard = PinGuard(pin: pin, service: service, account: account);
  });

  void serverSays(ServerPinVerdict verdict) =>
      when(() => service.verify(any(), any())).thenAnswer((_) async => verdict);

  void serverStatus(ServerPinAvailability status) =>
      when(() => service.status(any())).thenAnswer((_) async => status);

  group('verify', () {
    test('a PIN the server accepts is accepted and kept for later', () async {
      serverSays(const ServerPinValid());

      expect(await guard.verify('4821'), isA<PinAccepted>());

      expect(pin.isServerBacked, isTrue);
      expect(pin.verifyPin('4821'), isTrue);
    });

    test('a PIN the server refuses is refused, and the device is not asked', () async {
      await pin.setPin('0000');
      serverSays(const ServerPinWrong());

      expect(await guard.verify('0000'), isA<PinRejected>());
    });

    test('the server decides the wait', () async {
      serverSays(const ServerPinLocked(Duration(seconds: 30)));

      final outcome = await guard.verify('4821');

      expect((outcome as PinLockedOut).wait, const Duration(seconds: 30));
    });

    test('with the server out of reach the PIN on the device decides', () async {
      await pin.setPin('4821');
      serverSays(const ServerPinUnavailable());

      expect(await guard.verify('4821'), isA<PinAccepted>());
      expect(await guard.verify('0000'), isA<PinRejected>());
    });

    test('with nothing to ask with the PIN on the device decides', () async {
      await pin.setPin('4821');
      final offline = PinGuard(pin: pin, service: service);

      expect(await offline.verify('4821'), isA<PinAccepted>());
      verifyNever(() => service.verify(any(), any()));
    });

    test('guesses at the device are counted and cost a wait', () async {
      await pin.setPin('4821');
      final offline = PinGuard(pin: pin, service: service);

      for (var i = 0; i < 5; i++) {
        expect(await offline.verify('0000'), isA<PinRejected>());
      }
      expect(await offline.verify('0000'), isA<PinLockedOut>());
      expect(await offline.verify('4821'), isA<PinLockedOut>());
    });

    test('a PIN only this device knew moves to the server', () async {
      await pin.setPin('4821');
      serverSays(const ServerPinNone());
      when(
        () => service.setPin(any(), any(), currentPin: any(named: 'currentPin')),
      ).thenAnswer((_) async => const ServerPinValid());

      expect(await guard.verify('4821'), isA<PinAccepted>());

      verify(() => service.setPin(account, '4821')).called(1);
      expect(pin.isServerBacked, isTrue);
    });

    test('a wrong local PIN is not uploaded', () async {
      await pin.setPin('4821');
      serverSays(const ServerPinNone());

      expect(await guard.verify('0000'), isA<PinRejected>());

      verifyNever(
        () => service.setPin(any(), any(), currentPin: any(named: 'currentPin')),
      );
    });

    test('a PIN an administrator removed stops being asked for', () async {
      await pin.setPin('4821');
      await pin.setServerBacked(true);
      serverSays(const ServerPinNone());

      expect(await guard.verify('anything'), isA<PinAccepted>());

      expect(pin.isPinEnabled, isFalse);
      verifyNever(
        () => service.setPin(any(), any(), currentPin: any(named: 'currentPin')),
      );
    });
  });

  group('refresh', () {
    test('a device that never saw the PIN learns of it', () async {
      serverStatus(ServerPinAvailability.enabled);

      expect(pin.isPinEnabled, isFalse);
      await guard.refresh();

      expect(pin.isPinEnabled, isTrue);
    });

    test('a PIN removed on the server is dropped here', () async {
      await pin.setPin('4821');
      await pin.setServerBacked(true);
      serverStatus(ServerPinAvailability.disabled);

      await guard.refresh();

      expect(pin.isPinEnabled, isFalse);
    });

    test('a PIN that only the device has survives a plugin with none', () async {
      await pin.setPin('4821');
      serverStatus(ServerPinAvailability.disabled);

      await guard.refresh();

      expect(pin.isPinEnabled, isTrue);
    });

    test('an unanswered question changes nothing', () async {
      await pin.setPin('4821');
      await pin.setServerBacked(true);
      serverStatus(ServerPinAvailability.unavailable);

      await guard.refresh();

      expect(pin.isPinEnabled, isTrue);
      expect(pin.isServerBacked, isTrue);
    });
  });

  group('forgotten PIN', () {
    test('an administrator clears it on the server and here', () async {
      await pin.setPin('4821');
      await pin.setServerBacked(true);
      when(
        () => service.removePinFor(any(), any()),
      ).thenAnswer((_) async => const ServerPinValid());

      expect(await guard.resetForgotten('user'), isTrue);

      expect(pin.isPinEnabled, isFalse);
    });

    test('anyone else cannot, so the PIN stays', () async {
      await pin.setPin('4821');
      await pin.setServerBacked(true);
      when(
        () => service.removePinFor(any(), any()),
      ).thenAnswer((_) async => const ServerPinUnavailable());

      expect(await guard.resetForgotten('user'), isFalse);

      expect(pin.isPinEnabled, isTrue);
    });

    test('a PIN only the device has is cleared without the server', () async {
      await pin.setPin('4821');

      expect(await guard.resetForgotten('user'), isTrue);

      expect(pin.isPinEnabled, isFalse);
      verifyNever(() => service.removePinFor(any(), any()));
    });
  });

  group('savePin', () {
    setUp(() {
      when(
        () => service.setPin(any(), any(), currentPin: any(named: 'currentPin')),
      ).thenAnswer((_) async => const ServerPinValid());
    });

    test('a PIN the server keeps is kept here too', () async {
      expect(await guard.savePin('4821'), isTrue);

      expect(pin.isServerBacked, isTrue);
      expect(pin.verifyPin('4821'), isTrue);
      verify(() => service.setPin(account, '4821')).called(1);
    });

    test('the PIN being replaced goes to the server', () async {
      await guard.savePin('1111', currentPin: '4821');

      verify(() => service.setPin(account, '1111', currentPin: '4821')).called(1);
    });

    test('a PIN the server turned down is not kept', () async {
      when(
        () => service.setPin(any(), any(), currentPin: any(named: 'currentPin')),
      ).thenAnswer((_) async => const ServerPinWrong());

      expect(await guard.savePin('1111', currentPin: '0000'), isFalse);

      expect(pin.isPinEnabled, isFalse);
    });

    test('a server that cannot be reached leaves the PIN on the device', () async {
      when(
        () => service.setPin(any(), any(), currentPin: any(named: 'currentPin')),
      ).thenAnswer((_) async => const ServerPinUnavailable());

      expect(await guard.savePin('4821'), isTrue);

      expect(pin.isServerBacked, isFalse);
      expect(pin.verifyPin('4821'), isTrue);
    });

    test('without an account it is kept on the device alone', () async {
      final offline = PinGuard(pin: pin, service: service);

      expect(await offline.savePin('4821'), isTrue);

      expect(pin.verifyPin('4821'), isTrue);
      verifyNever(
        () => service.setPin(any(), any(), currentPin: any(named: 'currentPin')),
      );
    });
  });
}
