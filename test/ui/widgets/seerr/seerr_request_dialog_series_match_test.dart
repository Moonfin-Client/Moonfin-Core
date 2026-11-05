import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_request_dialog.dart';

const _braunschlag1986 = SeerrSonarrSeries(
  tvdbId: 474933,
  title: 'Braunschlag 1986',
  year: 2026,
);
const _braunschlag2012 = SeerrSonarrSeries(
  tvdbId: 257396,
  title: 'Braunschlag',
  year: 2012,
  overview: 'To save his town Braunschlag from bankruptcy...',
);

/// A Seerr server with one series on it, which TMDB may or may not have a
/// TVDB id for.
class _FakeSeerr extends Fake implements SeerrRepository {
  _FakeSeerr({
    this.externalTvdbId,
    this.mediaInfo,
    this.matches = const [],
    this.lookupFails = false,
  });

  final int? externalTvdbId;
  final SeerrMediaInfo? mediaInfo;
  final List<SeerrSonarrSeries> matches;

  /// The lookup can't be made, as on a Seerr with no Sonarr (a 404) or Silo.
  final bool lookupFails;
  int lookups = 0;
  int? requestedTvdbId;
  bool requested = false;

  SeerrTvDetails get _details => SeerrTvDetails(
    id: 316811,
    name: 'Braunschlag 1986',
    numberOfSeasons: 1,
    externalIds: SeerrExternalIds(tvdbId: externalTvdbId),
    mediaInfo: mediaInfo,
  );

  @override
  Future<void> ensureInitialized({bool force = false}) async {}

  @override
  Future<Map<String, dynamic>> getPublicSettings() async => const {};

  @override
  Future<SeerrUser> getCurrentUser() async =>
      SeerrUser(id: 1, permissions: SeerrPermission.request);

  @override
  Future<(SeerrTvDetails, bool)> getTvDetailsWithWatchlist(int tmdbId) async =>
      (_details, false);

  @override
  Future<SeerrTvDetails> getTvDetails(int tmdbId) async => _details;

  @override
  Future<List<SeerrSonarrSeries>> lookupSonarrSeries(int tmdbId) async {
    lookups++;
    if (lookupFails) throw Exception('No sonarr server has been setup');
    return matches;
  }

  @override
  Future<SeerrRequest> createRequest({
    required int mediaId,
    required String mediaType,
    List<int>? seasons,
    bool allSeasons = false,
    bool is4k = false,
    int? profileId,
    String? rootFolder,
    int? serverId,
    int? tvdbId,
  }) async {
    requested = true;
    requestedTvdbId = tvdbId;
    return const SeerrRequest(
      id: 1,
      status: SeerrRequest.statusPending,
      type: 'tv',
      is4k: false,
    );
  }
}

/// No saved server, profile or folder choices, which the real preferences
/// report as empty strings.
class _FakePrefs implements SeerrPreferences {
  @override
  dynamic noSuchMethod(Invocation invocation) => '';
}

Future<SeerrMediaDetailViewModel> _loadedVm(_FakeSeerr seerr) async {
  final vm = SeerrMediaDetailViewModel(seerr, _FakePrefs());
  await vm.load('316811', 'tv');
  return vm;
}

Future<void> _pumpDialog(
  WidgetTester tester,
  SeerrMediaDetailViewModel vm,
) async {
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: Navigator(
          onGenerateRoute: (_) => MaterialPageRoute<void>(
            builder: (_) => SeerrRequestDialog(
              vm: vm,
              isTv: true,
              is4k: false,
              seasons: const [],
              numberOfSeasons: 1,
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  group('needsSeriesMatch', () {
    test('asks for a match when TMDB has no TVDB id for the series', () async {
      final vm = await _loadedVm(_FakeSeerr());
      expect(vm.needsSeriesMatch, isTrue);
      vm.dispose();
    });

    test('has nothing to ask when TMDB knows the TVDB id', () async {
      final vm = await _loadedVm(_FakeSeerr(externalTvdbId: 474933));
      expect(vm.needsSeriesMatch, isFalse);
      vm.dispose();
    });

    test('uses the TVDB id Seerr kept from an earlier request', () async {
      final vm = await _loadedVm(
        _FakeSeerr(mediaInfo: const SeerrMediaInfo(tvdbId: 474933, status: 4)),
      );
      expect(vm.needsSeriesMatch, isFalse);
      vm.dispose();
    });
  });

  testWidgets('a series with no TVDB id is matched before it is requested', (
    tester,
  ) async {
    final seerr = _FakeSeerr(
      matches: const [_braunschlag1986, _braunschlag2012],
    );
    final vm = await _loadedVm(seerr);
    await _pumpDialog(tester, vm);

    expect(
      find.text(
        "We couldn't match this series automatically. "
        'Pick the right one below.',
      ),
      findsOneWidget,
    );
    expect(find.text('Braunschlag 1986'), findsOneWidget);
    expect(find.text('2012'), findsOneWidget);
    expect(find.text('All Seasons'), findsNothing);

    // Next does nothing until a match is picked.
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('All Seasons'), findsNothing);

    await tester.tap(find.text('Braunschlag 1986'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text('All Seasons'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
    // The sheet says which series the request is for.
    expect(find.text('Braunschlag 1986'), findsOneWidget);
    expect(find.text('Braunschlag'), findsNothing);

    // Back returns to the picker with the choice kept.
    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();
    expect(find.text('Braunschlag 1986'), findsOneWidget);
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Submit Request'));
    await tester.pumpAndSettle();

    expect(seerr.requested, isTrue);
    expect(seerr.requestedTvdbId, 474933);
    vm.dispose();
  });

  testWidgets('a series Sonarr has no match for cannot be requested', (
    tester,
  ) async {
    final seerr = _FakeSeerr();
    final vm = await _loadedVm(seerr);
    await _pumpDialog(tester, vm);

    expect(seerr.lookups, 1);
    expect(
      find.text(
        "We couldn't find a match for this series, so it can't be "
        'requested.',
      ),
      findsOneWidget,
    );
    expect(find.text('Close'), findsOneWidget);
    expect(find.text('Next'), findsNothing);
    expect(find.text('Submit Request'), findsNothing);

    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();
    expect(seerr.requested, isFalse);
    vm.dispose();
  });

  testWidgets('a lookup that cannot be made goes straight to the request', (
    tester,
  ) async {
    final seerr = _FakeSeerr(lookupFails: true);
    final vm = await _loadedVm(seerr);
    await _pumpDialog(tester, vm);

    expect(seerr.lookups, 1);
    expect(find.text('All Seasons'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(find.text('Submit Request'));
    await tester.pumpAndSettle();
    expect(seerr.requested, isTrue);
    expect(seerr.requestedTvdbId, isNull);
    vm.dispose();
  });

  testWidgets('a series TMDB has a TVDB id for never looks one up', (
    tester,
  ) async {
    final seerr = _FakeSeerr(externalTvdbId: 474933);
    final vm = await _loadedVm(seerr);
    await _pumpDialog(tester, vm);

    expect(seerr.lookups, 0);
    expect(find.text('All Seasons'), findsOneWidget);
    vm.dispose();
  });
}
