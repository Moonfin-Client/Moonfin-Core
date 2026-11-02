/// SRT files can prefix a cue with an ASS-style alignment tag.
final srtAlignmentTag = RegExp(r'^\s*\{\\an([1-9])\}');

/// Secondary cues follow the primary's placement, but retain inline text styling.
String secondaryWebVttCueText(String text) =>
    '<c.moonfin-secondary>${text.replaceFirst(srtAlignmentTag, '')}</c>';
