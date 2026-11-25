import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';

AggregatedItem _item(String type, {List<String> backdrops = const []}) =>
    AggregatedItem(
      id: type,
      serverId: 'server',
      rawData: {'Id': type, 'Type': type, 'BackdropImageTags': backdrops},
    );

void main() {
  final tracks = [_item('Audio'), _item('Audio')];

  test('a playlist with its own backdrop keeps it once its tracks load', () {
    final playlist = _item('Playlist', backdrops: ['custom']);
    expect(usesFirstTrackBackdrop(playlist, tracks), isFalse);
  });

  test('a playlist with no backdrop borrows its first track', () {
    expect(usesFirstTrackBackdrop(_item('Playlist'), tracks), isTrue);
  });

  test('a playlist with no tracks yet shows itself', () {
    expect(usesFirstTrackBackdrop(_item('Playlist'), const []), isFalse);
  });

  test('an album shows itself with or without a backdrop', () {
    expect(usesFirstTrackBackdrop(_item('MusicAlbum'), tracks), isFalse);
    expect(
      usesFirstTrackBackdrop(_item('MusicAlbum', backdrops: ['a']), tracks),
      isFalse,
    );
  });
}
