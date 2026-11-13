import 'package:dio/dio.dart';
import 'package:server_emby/src/api/emby_live_tv_api.dart';
import 'package:test/test.dart';

import 'admin_fake.dart';

void main() {
  test('Emby reads native tags and rejects invalid or denied lineups', () async {
    final fake = AdminFake({
      '/LiveTv/Channels': {
        'Items': [
          {'Id': 'one', 'Name': 'Sports', 'TagItems': [
            {'Name': 'US | SPORTS'}, {'Name': 'US|SPORTS'}, {'Name': 'US|SPORTS'},
          ]},
          {'Id': 'two', 'Name': 'News', 'Tags': ['CA | NEWS']},
          {'Id': 'three', 'Name': 'Local'},
        ],
      },
    });
    final api = EmbyLiveTvApi(fake.dio);
    final lineup = await api.getChannelGroups(userId: 'viewer');
    expect(fake.requests, hasLength(1));
    expect(fake.last.queryParameters['UserId'], 'viewer');
    expect(fake.last.queryParameters['Fields'], 'ImageTags,UserData,Tags');
    expect(lineup.channels, hasLength(3));
    expect(lineup.groupsByChannelId, {
      'one': {'US | SPORTS', 'US|SPORTS'}, 'two': {'CA | NEWS'},
    });
    fake.responses['/LiveTv/Channels'] = {};
    await expectLater(api.getChannelGroups(), throwsA(isA<FormatException>()));
    fake.statuses['/LiveTv/Channels'] = 403;
    await expectLater(api.getChannelGroups(), throwsA(isA<DioException>()));
  });
}
