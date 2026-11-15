import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// Reads its query only in initState, like SearchScreen reads initialQuery.
class _QueryScreen extends StatefulWidget {
  final String? initialQuery;
  const _QueryScreen({super.key, this.initialQuery});

  @override
  State<_QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends State<_QueryScreen> {
  late final String? _query = widget.initialQuery;

  @override
  Widget build(BuildContext context) => Text('query=$_query');
}

GoRouter _router({required bool keyed}) => GoRouter(
      initialLocation: '/search?query=Dune',
      routes: [
        GoRoute(
          path: '/search',
          builder: (context, state) => _QueryScreen(
            key: keyed ? ValueKey(state.uri.toString()) : null,
            initialQuery: state.uri.queryParameters['query'],
          ),
        ),
      ],
    );

void main() {
  testWidgets('unkeyed route keeps the old query (the bug)', (tester) async {
    final router = _router(keyed: false);
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    expect(find.text('query=Dune'), findsOneWidget);

    router.go('/search?query=Heart%20of%20the%20Beast');
    await tester.pumpAndSettle();
    expect(find.text('query=Dune'), findsOneWidget);
  });

  testWidgets('URI-keyed route shows the new query', (tester) async {
    final router = _router(keyed: true);
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    expect(find.text('query=Dune'), findsOneWidget);

    router.go('/search?query=Heart%20of%20the%20Beast');
    await tester.pumpAndSettle();
    expect(find.text('query=Heart of the Beast'), findsOneWidget);
  });
}
