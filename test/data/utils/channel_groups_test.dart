import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/utils/channel_groups.dart';

List<String> _groups(Object? tags) =>
    channelGroupsFromTags({'Id': 'c1', 'Tags': tags});

void main() {
  test('a channel without tags is in no group', () {
    expect(channelGroupsFromTags({'Id': 'c1'}), isEmpty);
    expect(_groups(null), isEmpty);
    expect(_groups(<String>[]), isEmpty);
  });

  test('a tag without a pipe is a group of its own', () {
    expect(_groups(['News 24']), ['News 24']);
    expect(_groups(['News 24', 'Sport']), ['News 24', 'Sport']);
  });

  group('pieces Jellyfin split on a pipe', () {
    test('are joined back where the pipe has spaces around it', () {
      expect(_groups(['FR ', ' Kids']), ['FR | Kids']);
      expect(_groups(['FR ', ' Kids', 'FR ', ' Sport']), [
        'FR | Kids',
        'FR | Sport',
      ]);
    });

    test('are joined back with a space on one side only', () {
      expect(_groups(['US', ' SPORTS']), ['US| SPORTS']);
      expect(_groups(['US ', 'SPORTS']), ['US |SPORTS']);
    });

    test('stay apart at a bare pipe, which reads as two tags', () {
      expect(_groups(['US', 'SPORTS']), ['US', 'SPORTS']);
    });

    test('are joined across an empty piece', () {
      expect(_groups(['FR ', '', ' Kids']), ['FR || Kids']);
      expect(_groups(['FR', '', 'Kids']), ['FR||Kids']);
      expect(_groups(['', 'FR', ' Sport']), ['|FR| Sport']);
    });
  });

  group('the Kids tag Jellyfin adds by itself', () {
    test('is left out in any case', () {
      expect(_groups(['Kids']), isEmpty);
      expect(_groups(['kids']), isEmpty);
      expect(_groups(['KIDS']), isEmpty);
      expect(_groups(['FR ', ' Films Non-Stop', 'Kids']), [
        'FR | Films Non-Stop',
      ]);
    });

    test('is told apart from a group ending in Kids once joined', () {
      expect(_groups(['FR ', ' Kids', 'Kids']), ['FR | Kids']);
    });

    test('takes the Kids half of a bare-pipe group with it', () {
      // US|KIDS reads as the tags US and KIDS, and KIDS as the automatic tag.
      expect(_groups(['US', 'KIDS']), ['US']);
    });
  });

  test('duplicates, blank tags and anything but text are dropped', () {
    expect(_groups(['News', 'News']), ['News']);
    expect(_groups(['FR ', ' Sport', 'FR ', ' Sport']), ['FR | Sport']);
    expect(_groups(['  News  ']), ['News']);
    expect(_groups(['   ']), isEmpty);
    expect(_groups(['News', 7, null, true]), ['News']);
    expect(_groups('News'), isEmpty);
  });

  group('Emby', () {
    test('lists tags as TagItems when Tags is missing', () {
      expect(
        channelGroupsFromTags({
          'Id': 'c1',
          'TagItems': [
            {'Name': 'Sports HD', 'Id': 1},
            {'Name': 'Kids', 'Id': 2},
            {'Id': 3},
          ],
        }),
        ['Sports HD'],
      );
    });

    test('names arrive whole, so they are never joined', () {
      expect(
        channelGroupsFromTags({
          'Id': 'c1',
          'TagItems': [
            {'Name': 'US', 'Id': 1},
            {'Name': ' SPORTS', 'Id': 2},
          ],
        }),
        ['US', 'SPORTS'],
      );
    });

    test('Tags wins when both are there', () {
      expect(
        channelGroupsFromTags({
          'Id': 'c1',
          'Tags': ['News'],
          'TagItems': [
            {'Name': 'Sports HD', 'Id': 1},
          ],
        }),
        ['News'],
      );
    });
  });
}
