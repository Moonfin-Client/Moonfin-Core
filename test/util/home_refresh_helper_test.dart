import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';
import 'package:moonfin/util/home_refresh_helper.dart';

class _Home extends Mock implements HomeViewModel {}

class _DisposeCaller extends StatefulWidget {
  const _DisposeCaller();

  @override
  State<_DisposeCaller> createState() => _DisposeCallerState();
}

class _DisposeCallerState extends State<_DisposeCaller> {
  @override
  void dispose() {
    refreshHomeRows();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => const SizedBox();
}

void main() {
  late _Home home;

  setUp(() async {
    await GetIt.instance.reset();
    home = _Home();
    when(
      () => home.load(forceRefresh: any(named: 'forceRefresh')),
    ).thenAnswer((_) async {});
  });

  tearDown(() => GetIt.instance.reset());

  testWidgets('does nothing when the home view model is not registered', (
    tester,
  ) async {
    refreshHomeRows(followUp: true);
    await tester.pump(const Duration(seconds: 4));
    expect(tester.takeException(), isNull);
  });

  testWidgets('reloads the rows once', (tester) async {
    GetIt.instance.registerSingleton<HomeViewModel>(home);
    refreshHomeRows();
    await tester.pump(const Duration(seconds: 4));
    verify(() => home.load(forceRefresh: true)).called(1);
  });

  testWidgets('a follow-up picks up artwork the server was still fetching', (
    tester,
  ) async {
    GetIt.instance.registerSingleton<HomeViewModel>(home);
    refreshHomeRows(followUp: true);
    await tester.pump(const Duration(seconds: 1));
    verify(() => home.load(forceRefresh: true)).called(1);
    await tester.pump(const Duration(seconds: 3));
    verify(() => home.load(forceRefresh: true)).called(1);
  });

  testWidgets('a second call replaces the pending follow-up', (tester) async {
    GetIt.instance.registerSingleton<HomeViewModel>(home);
    refreshHomeRows(followUp: true);
    await tester.pump(const Duration(seconds: 1));
    refreshHomeRows(followUp: true);
    await tester.pump(const Duration(seconds: 4));
    verify(() => home.load(forceRefresh: true)).called(3);
  });

  testWidgets('a call from dispose does not fire while the tree is locked', (
    tester,
  ) async {
    // The real view model notifies its listeners as the first thing load does,
    // so the fake has to as well or the locked tree is never exercised.
    final loads = ValueNotifier<int>(0);
    addTearDown(loads.dispose);
    when(
      () => home.load(forceRefresh: any(named: 'forceRefresh')),
    ).thenAnswer((_) async => loads.value++);

    GetIt.instance.registerSingleton<HomeViewModel>(home);
    await tester.pumpWidget(
      MaterialApp(
        home: ValueListenableBuilder<int>(
          valueListenable: loads,
          builder: (_, value, _) =>
              Column(children: [Text('loads: $value'), const _DisposeCaller()]),
        ),
      ),
    );
    await tester.pumpWidget(
      MaterialApp(
        home: ValueListenableBuilder<int>(
          valueListenable: loads,
          builder: (_, value, _) => Text('loads: $value'),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    await tester.pump();
    expect(loads.value, 1);
  });
}
