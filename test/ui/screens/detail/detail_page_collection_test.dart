import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ViewModel extends Mock implements ItemDetailViewModel {}

AggregatedItem _item(String id, String type, {String serverId = 'jf'}) =>
    AggregatedItem(
      id: id,
      serverId: serverId,
      rawData: {'Id': id, 'Name': id, 'Type': type},
    );

void main() {
  late UserPreferences prefs;
  late AppLocalizations l10n;
  late _ViewModel vm;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.set(UserPreferences.seerrShowMissingCollectionItems, true);
    l10n = await AppLocalizations.delegate.load(const Locale('en'));
    vm = _ViewModel();
    when(() => vm.item).thenReturn(_item('box', 'BoxSet'));
    when(() => vm.collectionItems).thenReturn([
      _item('film', 'Movie'),
      _item('show', 'Series'),
      _item('clip', 'Video'),
    ]);
    when(
      () => vm.missingCollectionItems,
    ).thenReturn([_item('wanted', 'Movie', serverId: 'seerr')]);
  });

  List<String> ids(String kind) => [
    for (final (id, _, items) in collectionGroups(vm, prefs, l10n))
      if (id == kind) ...items.map((i) => i.id),
  ];

  test('a collection splits into movies, series and other, with the titles '
      'Seerr adds among its movies', () {
    expect(collectionGroups(vm, prefs, l10n).map((g) => g.$2), [
      'Movies',
      'Series',
      'Other',
    ]);
    expect(ids('movies'), ['film', 'wanted']);
    expect(ids('series'), ['show']);
    expect(ids('other'), ['clip']);
  });

  test('Kids Mode keeps to the library', () async {
    await prefs.set(UserPreferences.kidsModeEnabled, true);
    expect(ids('movies'), ['film']);
  });

  test('a collection of one kind is named for it', () {
    when(() => vm.collectionItems).thenReturn([_item('film', 'Movie')]);
    expect(collectionLabel(collectionGroups(vm, prefs, l10n), l10n), 'Movies');
  });

  test('a collection of only other titles is named Items', () {
    when(() => vm.collectionItems).thenReturn([_item('clip', 'Video')]);
    when(() => vm.missingCollectionItems).thenReturn(const []);
    expect(collectionLabel(collectionGroups(vm, prefs, l10n), l10n), 'Items');
  });

  test('anything but a collection has no groups', () {
    when(() => vm.item).thenReturn(_item('film', 'Movie'));
    expect(collectionGroups(vm, prefs, l10n), isEmpty);
  });
}
