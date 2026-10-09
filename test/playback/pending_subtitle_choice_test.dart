import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/pending_subtitle_choice.dart';

void main() {
  late PendingSubtitleChoice choice;
  late int selected;
  late bool current;

  setUp(() {
    choice = PendingSubtitleChoice()..nextSource();
    selected = 0;
    current = true;
  });

  void hold(String url) => choice.hold(
    url,
    isCurrent: () => current,
    select: () async => selected++,
  );

  test('a held choice is applied once its file is added', () async {
    hold('http://server/3.srt');

    await choice.added('http://server/3.srt', choice.source);

    expect(selected, 1);
  });

  test('another file finishing leaves the choice waiting', () async {
    hold('http://server/3.srt');

    await choice.added('http://server/4.srt', choice.source);
    expect(selected, 0);

    await choice.added('http://server/3.srt', choice.source);
    expect(selected, 1);
  });

  test('an add from the previous source does not consume it', () async {
    final previous = choice.source;
    choice.nextSource();
    hold('http://server/3.srt');

    await choice.added('http://server/3.srt', previous);
    expect(selected, 0);

    await choice.added('http://server/3.srt', choice.source);
    expect(selected, 1);
  });

  test('a choice the viewer replaced is dropped without selecting', () async {
    hold('http://server/3.srt');
    current = false;

    await choice.added('http://server/3.srt', choice.source);
    current = true;
    await choice.added('http://server/3.srt', choice.source);

    expect(selected, 0);
  });

  test('a new source drops the choice the last one held', () async {
    hold('http://server/3.srt');
    choice.nextSource();

    await choice.added('http://server/3.srt', choice.source);

    expect(selected, 0);
  });

  test('the choice is applied only once', () async {
    hold('http://server/3.srt');

    await choice.added('http://server/3.srt', choice.source);
    await choice.added('http://server/3.srt', choice.source);

    expect(selected, 1);
  });
}
