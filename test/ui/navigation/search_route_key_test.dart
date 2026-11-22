import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin/data/services/remote_search_session.dart';
import 'package:moonfin/ui/navigation/app_router.dart';
import 'package:moonfin/ui/navigation/destinations.dart';

class _Context extends Fake implements BuildContext {}

Key? _searchKey(String location, {Object? extra}) {
  final route = appRouter.configuration.routes.whereType<GoRoute>().firstWhere(
    (route) => route.path == Destinations.search,
  );
  final state = GoRouterState(
    appRouter.configuration,
    uri: Uri.parse(location),
    matchedLocation: Destinations.search,
    fullPath: Destinations.search,
    pathParameters: const {},
    extra: extra,
    pageKey: const ValueKey('search'),
  );
  return route.builder!(_Context(), state).key;
}

void main() {
  test('only a link to another search gives the screen a new key', () {
    final dune = _searchKey(Destinations.searchWith('Dune'));

    expect(_searchKey(Destinations.searchWith('Dune')), dune);
    expect(
      _searchKey(Destinations.searchWith('Heart of the Beast')),
      isNot(dune),
    );
  });

  test('a remote search keeps its session key whatever the link', () {
    final session = RemoteSearchSession(null);

    expect(
      _searchKey(Destinations.searchWith('Dune'), extra: session),
      ObjectKey(session),
    );
  });
}
