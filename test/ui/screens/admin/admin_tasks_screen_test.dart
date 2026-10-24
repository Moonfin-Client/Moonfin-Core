import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/admin/admin_draft.dart';
import 'package:moonfin/ui/screens/admin/tasks/admin_tasks_screen.dart';
import 'package:server_core/server_core.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _FakeTasksApi extends Fake implements AdminTasksApi {
  final hiddenArgs = <bool?>[];
  final started = <String>[];
  var extraCategories = <String>[];

  @override
  Future<List<Map<String, dynamic>>> getTasks({bool? isHidden}) async {
    hiddenArgs.add(isHidden);
    final end = DateTime.now().toUtc().subtract(const Duration(hours: 3));
    return [
      {
        'Id': 'scan',
        'Name': 'Scan Media Library',
        'Category': 'Library',
        'State': 'Idle',
        'LastExecutionResult': {
          'StartTimeUtc': end
              .subtract(const Duration(minutes: 2, seconds: 5))
              .toIso8601String(),
          'EndTimeUtc': end.toIso8601String(),
          'Status': 'Failed',
        },
      },
      // A task without a category is left out.
      {'Id': 'loose', 'Name': 'No category task', 'State': 'Idle'},
      for (final category in extraCategories)
        {'Id': category, 'Name': category, 'Category': category, 'State': 'Idle'},
    ];
  }

  @override
  Future<void> startTask(String taskId) async => started.add(taskId);
}

void main() {
  late _FakeTasksApi api;
  late AppLocalizations l10n;

  setUp(() async {
    api = _FakeTasksApi();
    final client = _MockMediaServerClient();
    when(() => client.adminTasksApi).thenReturn(api);
    await GetIt.instance.reset();
    GetIt.instance
      ..registerSingleton<MediaServerClient>(client)
      ..registerSingleton<SocketHandler>(SocketHandler());
    l10n = await AppLocalizations.delegate.load(const Locale('en'));
  });

  tearDown(() async {
    AdminDraft.active.value = null;
    await GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester, {Size size = const Size(1200, 1600)}) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(body: AdminTasksScreen()),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('lists visible tasks with a localized last run', (tester) async {
    await pump(tester);

    expect(api.hiddenArgs, [false]);
    expect(find.text('Scan Media Library'), findsOneWidget);
    expect(find.text('No category task'), findsNothing);
    final lastRan = l10n.adminTaskLastRan(
      l10n.adminActivityHoursAgo(3),
      '${l10n.adminActivityMinutesShort(2)} ${l10n.adminDurationSecondsShort('5')}',
    );
    expect(
      find.text('$lastRan (${l10n.adminTaskResultFailed})'),
      findsOneWidget,
    );
  });

  testWidgets('run starts the task', (tester) async {
    await pump(tester);

    await tester.tap(find.byTooltip(l10n.adminTaskRun));
    await tester.pumpAndSettle();
    expect(api.started, ['scan']);
  });
  testWidgets('many categories stay on one scrolling row', (tester) async {
    api.extraCategories = [for (var i = 0; i < 20; i++) 'Plugin category $i'];
    await pump(tester, size: const Size(390, 844));

    final chips = find.byType(FilterChip);
    expect(chips, findsNWidgets(22));
    final rows = {
      for (var i = 0; i < 22; i++) tester.getTopLeft(chips.at(i)).dy,
    };
    expect(rows, hasLength(1));

    final position = Scrollable.of(tester.element(chips.first)).position;
    expect(position.axis, Axis.horizontal);
    expect(position.maxScrollExtent, greaterThan(0));
  });
}
