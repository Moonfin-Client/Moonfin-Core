import 'package:dio/dio.dart';
import 'package:server_emby/src/api/emby_live_tv_api.dart';
import 'package:test/test.dart';

import 'admin_fake.dart';

void main() {
  test('a viewer sees valid guide channels even if one row is incomplete', () async {
    const path = '/LiveTv/Channels';
    final fake = AdminFake({path: {'Items': [
      {'Id': 'one', 'Name': 'Sports', 'TagItems': [
        for (final name in ['US | SPORTS', 'US|SPORTS', 'US|SPORTS']) {'Name': name},
      ]},
      null, {'Name': 'Missing ID'}, {'Id': '', 'Name': 'Empty ID'},
      {'Id': 'bad-name', 'Name': 123, 'Tags': ['Bad group']},
      {'Id': 'two', 'Name': 'News', 'Tags': ['CA | NEWS']},
      {'Id': 'three', 'Name': 'Local'},
    ]}});
    final api = EmbyLiveTvApi(fake.dio);
    final lineup = await api.getChannelGroups(userId: 'viewer');
    expect(fake.requests.single.queryParameters, containsPair('UserId', 'viewer'));
    expect(fake.last.queryParameters['Fields'], 'ImageTags,UserData,Tags');
    expect(lineup.channels!.map((row) => row['Id']), ['one', 'two', 'three']);
    expect(lineup.groupsByChannelId, {'one': {'US | SPORTS', 'US|SPORTS'}, 'two': {'CA | NEWS'}});
    fake.responses[path] = <String, dynamic>{};
    await expectLater(api.getChannelGroups(), throwsFormatException);
    fake.statuses[path] = 403;
    await expectLater(api.getChannelGroups(), throwsA(isA<DioException>()));
  });
}
