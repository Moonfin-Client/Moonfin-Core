/// Builds the audio or subtitle entries for the native Apple TV player menu.
/// Subtitle entries also carry what system remotes need to list the track.
List<Map<String, dynamic>> appleTvTrackOptions(
  List<Map<String, dynamic>> streams,
  int? selectedIndex, {
  required bool audio,
}) {
  final options = <Map<String, dynamic>>[];
  for (final s in streams) {
    final index = (s['Index'] as int?) ?? -1;
    final displayTitle = s['DisplayTitle'] as String?;
    final title = s['Title'] as String?;
    final language = s['Language'] as String?;
    final codec = s['Codec'] as String?;
    final label = displayTitle ?? title ?? language ?? 'Track';
    final String subtitle;
    if (audio) {
      subtitle = [
        if (language != null && displayTitle != null) language,
        if (codec != null) codec.toUpperCase(),
        if (s['Channels'] != null) '${s['Channels']}ch',
      ].join(' · ');
    } else {
      final subtitleType =
          ((codec == null || codec.isEmpty) ? 'Unknown' : codec).toUpperCase();
      final deliveryMethod = (s['DeliveryMethod'] as String?)
          ?.trim()
          .toLowerCase();
      final location = s['IsExternal'] == true
          ? 'External'
          : (deliveryMethod == 'embed' ? 'Embedded' : 'Internal');
      subtitle = '$subtitleType · $location';
    }
    options.add({
      'index': index,
      'label': label,
      'subtitle': subtitle,
      'selected': index == selectedIndex,
      if (!audio) ...{
        'language': ?language,
        'forced': s['IsForced'] == true,
        'hearingImpaired': s['IsHearingImpaired'] == true,
      },
    });
  }
  return options;
}
