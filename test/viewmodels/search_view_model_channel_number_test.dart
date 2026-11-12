import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/search_repository.dart';
import 'package:moonfin/data/viewmodels/search_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

AggregatedItem _ch(String name, [Object? number, String server = 'a']) =>
    AggregatedItem(
      id: '$server-$name',
      serverId: server,
      rawData: {
        'Id': '$server-$name',
        'Name': name,
        'Type': 'TvChannel',
        'ChannelNumber': ?number,
      },
    );

List<String> _find(
  List<AggregatedItem> lineup,
  String query, {
  int limit = 24,
}) => [
  for (final channel in matchChannels(lineup, query, limit: limit))
    channel.name,
];

// In lineup order, which on one server is number order.
final _fr = [
  _ch('TF1', '1'),
  _ch('France 2', '2'),
  _ch('M6', '6'),
  _ch('TMC', '10'),
  _ch('TFX', '11'),
  _ch('TF1 Séries Films', '20'),
  _ch('6ter', '22'),
  _ch('RMC Découverte', '24'),
  _ch('Eurosport 1', '105'),
  _ch('beIN Sports 3', '124'),
  _ch('Gulli', '240'),
  _ch('Tiji', '246'),
  _ch('France 24', '412'),
  _ch('Arte'),
];

// Out of order, so any order in the results comes from the numbers.
final _atsc = [
  _ch('Delta', '2.10'),
  _ch('Charlie', '2.2'),
  _ch('Alpha', '2'),
  _ch('Bravo', '2.1'),
  _ch('Golf', '20'),
  _ch('Foxtrot', '12.1'),
  _ch('Echo', '12'),
];

// What /LiveTv/Channels answers, before the repository adds a Type.
final _lineup = <Map<String, dynamic>>[
  {'Id': 'c1', 'Name': 'TF1', 'ChannelNumber': '1'},
  {'Id': 'c6', 'Name': 'M6', 'ChannelNumber': '6'},
  {'Id': 'c22', 'Name': '6ter', 'ChannelNumber': '22'},
  {'Id': 'c105', 'Name': 'Eurosport 1', 'ChannelNumber': '105'},
];

void main() {
  group('matchChannels', () {
    test('finds a channel by its full number', () {
      expect(_find(_fr, '105'), ['Eurosport 1']);
    });

    test(
      'same number, then names, then numbers that start with it, then '
      'numbers that contain it',
      () {
        expect(_find(_fr, '24'), [
          'RMC Découverte',
          'France 24',
          'Gulli',
          'Tiji',
          'beIN Sports 3',
        ]);
      },
    );

    test('a channel named with the digit comes right after the number', () {
      expect(_find(_fr, '6'), ['M6', '6ter', 'Tiji']);
    });

    test('a channel is listed once, at its first match', () {
      expect(_find(_fr, '1'), [
        'TF1',
        'TF1 Séries Films',
        'Eurosport 1',
        'TMC',
        'TFX',
        'beIN Sports 3',
        'France 24',
      ]);
    });

    test('the same for another digit', () {
      expect(_find(_fr, '2'), [
        'France 2',
        'France 24',
        'TF1 Séries Films',
        '6ter',
        'RMC Découverte',
        'Gulli',
        'Tiji',
        'beIN Sports 3',
      ]);
    });

    test('names stay right after the number on a full lineup', () {
      // Only channel 20 has a digit in its name.
      final lineup = [
        for (var n = 1; n < 300; n++)
          _ch(n == 20 ? 'TF1 Séries Films' : 'Channel', '$n'),
      ];
      final numbers = [
        for (final channel in matchChannels(lineup, '1', limit: 24))
          channel.channelNumber,
      ];
      expect(numbers, [
        '1',
        '20',
        for (var n = 10; n < 20; n++) '$n',
        for (var n = 100; n < 112; n++) '$n',
      ]);
    });

    test('the cap counts every step', () {
      expect(_find(_fr, '2', limit: 3), [
        'France 2',
        'France 24',
        'TF1 Séries Films',
      ]);
    });

    test('subchannels sort by their whole numbers', () {
      expect(_find(_atsc, '2'), [
        'Alpha',
        'Bravo',
        'Charlie',
        'Delta',
        'Golf',
        'Echo',
        'Foxtrot',
      ]);
    });

    test('a subchannel finds itself, then longer numbers', () {
      expect(_find(_atsc, '2.1'), ['Bravo', 'Delta', 'Foxtrot']);
    });

    test('a dash stands for the dot', () {
      expect(_find(_atsc, '2-1'), ['Bravo', 'Delta', 'Foxtrot']);
    });

    test('a trailing separator still searches while typing', () {
      for (final query in ['2.', '2-']) {
        expect(
          _find(_atsc, query),
          ['Alpha', 'Bravo', 'Charlie', 'Delta', 'Foxtrot'],
          reason: query,
        );
      }
    });

    test('names are matched with the query as typed', () {
      final lineup = [_ch('Alpha', '2'), _ch('Kilo 2', '40')];
      expect(_find(lineup, '2'), ['Alpha', 'Kilo 2']);
      expect(_find(lineup, '2.'), ['Alpha']);
    });

    test('stored zeros are dropped, typed zeros are kept', () {
      final lineup = [
        _ch('Seven', '007'),
        _ch('Mike', '70'),
        _ch('Lima', '1007'),
      ];
      expect([for (final c in lineup) c.channelNumber], ['007', '70', '1007']);
      expect(_find(lineup, '7'), ['Seven', 'Mike', 'Lima']);
      expect(_find(lineup, '007'), ['Seven', 'Lima']);
    });

    test('stored zeros are also searched as written', () {
      final lineup = [
        _ch('Ten', '10'),
        _ch('Seven', '007'),
        _ch('Oscar', '010'),
      ];
      expect(_find(lineup, '00'), ['Seven']);
      expect(_find(lineup, '01'), ['Oscar']);
      expect(_find(lineup, '0'), ['Seven', 'Oscar', 'Ten']);
    });

    test('a number with its zeros dropped still starts with the query', () {
      final lineup = [_ch('Twelve', '12'), _ch('Papa', '001.5')];
      expect(_find(lineup, '1'), ['Papa', 'Twelve']);
    });

    test('reads a number sent as a JSON number', () {
      final lineup = [_ch('Fox', 105), _ch('Sept', 7.0), _ch('PBS', 2.1)];
      expect([for (final c in lineup) c.channelNumber], ['105', '7.0', '2.1']);
      expect(_find(lineup, '105'), ['Fox']);
      expect(_find(lineup, '7'), ['Sept']);
      expect(_find(lineup, '2.1'), ['PBS']);
    });

    test('digits mixed with letters search names only', () {
      expect(_find(_fr, 'TF1'), ['TF1', 'TF1 Séries Films']);
      expect(_find(_fr, '6ter'), ['6ter']);
      expect(_find(_fr, 'France 2'), ['France 2', 'France 24']);
      expect(_find(_fr, '2.1 PBS'), isEmpty);
    });

    test('a sign, an inner space or a comma is not a number', () {
      final lineup = [_ch('Five', '5'), _ch('Five Point Five', '5.5')];
      for (final query in ['+5', '-5', '.5', '5 5', '5,5']) {
        expect(_find(lineup, query), isEmpty, reason: query);
      }
    });

    test('a stored number that is not plain digits is ignored', () {
      final lineup = [
        _ch('Alpha', 'A1'),
        _ch('Bravo', '1A'),
        _ch('Charlie', '+1'),
        _ch('Delta', '0x1'),
        _ch('Echo', '1,5'),
      ];
      expect(_find(lineup, '1'), isEmpty);
    });

    test('a channel without a number is found by name only', () {
      final lineup = [
        _ch('Arte'),
        _ch('Arte HD', ''),
        _ch('Arte Kids', '   '),
      ];
      expect([for (final c in lineup) c.channelNumber], [null, null, null]);
      expect(_find(lineup, 'arte'), ['Arte', 'Arte HD', 'Arte Kids']);
      expect(_find(lineup, '1'), isEmpty);
    });

    test('channels on one number keep the lineup order', () {
      final a = _ch('A', '7');
      final b = _ch('B', '7', 'b');
      expect(_find([a, b], '7'), ['A', 'B']);
      expect(_find([b, a], '7'), ['B', 'A']);
    });

    test('a name query folds accents, keeps lineup order and the cap', () {
      final lineup = [
        _ch('Téva', '30'),
        _ch('Teva Kids', '5'),
        _ch('Arte', '7'),
      ];
      expect(_find(lineup, 'teva'), ['Téva', 'Teva Kids']);
      expect(_find(lineup, 'TÉVA'), ['Téva', 'Teva Kids']);
      final sports = [
        for (var i = 1; i <= 30; i++) _ch('Sport $i', '${100 - i}'),
      ];
      expect(_find(sports, 'sport'), [
        for (var i = 1; i <= 24; i++) 'Sport $i',
      ]);
    });

    test('an empty or blank query finds nothing', () {
      expect(_find(_fr, ''), isEmpty);
      expect(_find(_fr, '   '), isEmpty);
    });

    test('a number too long for an int searches names', () {
      const huge = '99999999999999999999';
      final lineup = [_ch('Canal $huge', '5'), _ch('Huge', huge)];
      expect(_find(lineup, huge), ['Canal $huge']);
      expect(_find(lineup, '9'), ['Canal $huge']);
    });
  });

  group('SearchViewModel channel search', () {
    late _MockClient client;
    late _MockItemsApi itemsApi;
    late _MockLiveTvApi liveTv;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
      client = _MockClient();
      itemsApi = _MockItemsApi();
      liveTv = _MockLiveTvApi();
      when(() => client.itemsApi).thenReturn(itemsApi);
      when(() => client.liveTvApi).thenReturn(liveTv);
      when(() => client.userId).thenReturn('user');
      when(() => client.gamesApi).thenReturn(null);
      when(() => client.serverType).thenReturn(ServerType.jellyfin);
      when(
        () => itemsApi.getItems(
          searchTerm: any(named: 'searchTerm'),
          parentId: any(named: 'parentId'),
          includeItemTypes: any(named: 'includeItemTypes'),
          excludeItemTypes: any(named: 'excludeItemTypes'),
          limit: any(named: 'limit'),
          recursive: any(named: 'recursive'),
          fields: any(named: 'fields'),
          studios: any(named: 'studios'),
        ),
      ).thenAnswer((_) async => {'Items': <dynamic>[]});
      when(
        () => itemsApi.getPersons(
          searchTerm: any(named: 'searchTerm'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableImageTypes: any(named: 'enableImageTypes'),
        ),
      ).thenAnswer((_) async => {'Items': <dynamic>[]});
    });

    tearDown(() => GetIt.instance.reset());

    // The call fetchLiveTvChannels makes.
    Future<Map<String, dynamic>> channelsCall() => liveTv.getChannels(
      fields: any(named: 'fields'),
      enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
      userId: any(named: 'userId'),
    );

    Future<SearchViewModel> search(String query) async {
      final vm = SearchViewModel(SearchRepository(client), client);
      addTearDown(vm.dispose);
      vm.searchImmediate(query);
      while (vm.state == SearchState.loading) {
        await pumpEventQueue();
      }
      return vm;
    }

    // The Channels row, or null when search shows none.
    List<String>? channelRow(SearchViewModel vm) {
      for (final group in vm.results) {
        if (group.itemTypes.contains('TvChannel')) {
          return [for (final channel in group.items) channel.name];
        }
      }
      return null;
    }

    test('typing a channel number fills the Channels row', () async {
      when(channelsCall).thenAnswer((_) async => {'Items': _lineup});
      expect(channelRow(await search('105')), ['Eurosport 1']);
    });

    test('number and name matches come in order', () async {
      when(channelsCall).thenAnswer((_) async => {'Items': _lineup});
      expect(channelRow(await search('6')), ['M6', '6ter']);
    });

    test('a name search fills it by name', () async {
      when(channelsCall).thenAnswer((_) async => {'Items': _lineup});
      expect(channelRow(await search('sport')), ['Eurosport 1']);
    });

    test('a lineup that fails does not break search', () async {
      when(channelsCall).thenThrow(Exception('unavailable'));
      final vm = await search('105');
      expect(vm.state, SearchState.ready);
      expect(vm.error, isNull);
      expect(channelRow(vm), isNull);
    });

    test('a server with no channels shows no Channels row', () async {
      when(channelsCall).thenAnswer((_) async => {'Items': <dynamic>[]});
      final vm = await search('105');
      expect(vm.state, SearchState.ready);
      expect(channelRow(vm), isNull);
    });
  });
}
