import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Only the tvOS runner registers this. Every other build has to get through
/// the system IME path without it.
const _appleTvSystemChannel = MethodChannel('moonfin/appletv_system');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<String> nativeCalls;
  late List<String> flutterTextInputCalls;

  setUp(() {
    nativeCalls = [];
    flutterTextInputCalls = [];
  });

  void recordChannels(WidgetTester tester) {
    final messenger = tester.binding.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(_appleTvSystemChannel, (call) async {
      nativeCalls.add(call.method);
      return null;
    });
    messenger.setMockMethodCallHandler(SystemChannels.textInput, (call) async {
      flutterTextInputCalls.add(call.method);
      return null;
    });
    addTearDown(() {
      messenger.setMockMethodCallHandler(_appleTvSystemChannel, null);
      messenger.setMockMethodCallHandler(SystemChannels.textInput, null);
    });
  }

  Future<CustomTVTextFieldState> openField(WidgetTester tester) async {
    final key = GlobalKey<CustomTVTextFieldState>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTVTextField(
            key: key,
            controller: TextEditingController(),
            preferSystemIme: true,
          ),
        ),
      ),
    );
    final field = key.currentState!;
    field.openKeyboard();
    // The field blinks forever once it has focus, so settle is not available.
    await tester.pump(const Duration(milliseconds: 50));
    return field;
  }

  testWidgets('a build without the tvOS runner never calls the channel', (
    tester,
  ) async {
    recordChannels(tester);

    final field = await openField(tester);
    field.closeKeyboard();
    await tester.pump(const Duration(milliseconds: 50));

    expect(nativeCalls, isEmpty);
  });

  testWidgets('the system IME still opens the Flutter text input', (
    tester,
  ) async {
    recordChannels(tester);

    await openField(tester);

    expect(flutterTextInputCalls, contains('TextInput.show'));
  });

  testWidgets('tearing the field down mid-session raises no error', (
    tester,
  ) async {
    recordChannels(tester);
    final errors = <Object>[];
    final previous = FlutterError.onError;
    FlutterError.onError = (details) => errors.add(details.exception);
    addTearDown(() => FlutterError.onError = previous);

    await openField(tester);
    await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    await tester.pump(const Duration(milliseconds: 50));

    expect(errors, isEmpty);
  });
}
