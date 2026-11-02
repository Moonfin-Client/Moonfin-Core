/// Translates the device profile Moonfin builds for Jellyfin and Emby into
/// the codec evidence Silo's playback protocol v3 asks for.
///
/// Jellyfin decides a route from a `DeviceProfile` (direct-play profiles,
/// codec conditions, transcoding profiles). Silo decides it on the server
/// from what the client says it can do: `client_capabilities` (codec lists,
/// HDR) and, per delivery class (`original_http`, `progressive`, `hls`), the
/// containers, codecs and subtitle handling it accepts. Each player backend
/// already builds a profile that says exactly that, so this reads it rather
/// than keeping a second description of every backend.
///
/// **Evidence tier.** A profile is a declaration, not a probe of the
/// device's decoders, so both tiers are `declared`: Silo then
/// matches the flat codec lists and never walks `video_decode[]`, which is
/// left out rather than invented. A backend that enumerates its decoders
/// (Media3's `MediaCodecList`) could claim `exact`.
library;

import 'dart:math';

/// The delivery classes a client negotiates in. Silo folds
/// its four deliveries into these: `original_http` stays as it is,
/// `server_remux_progressive` becomes `progressive`, and both HLS deliveries
/// become `hls`.
const siloDeliveryOriginal = 'original_http';
const siloDeliveryProgressive = 'progressive';
const siloDeliveryHls = 'hls';

/// Client features Moonfin always sends: the v3 contract itself, and native
/// selection of embedded subtitles in a file played whole (so an embedded
/// PGS or text track plays from the file instead of being extracted or
/// burned in).
const siloBaseClientFeatures = ['playback_plan_v3', 'embedded_subtitles_v1'];

/// `original_http` claim: the player picks any audio track of the whole
/// file itself, so a non-default track doesn't force a remux.
const siloClaimSelectedAudioTrack = 'client_selected_audio_track_v1';

/// `original_http` claim: the player takes the source's dynamic range as it
/// is and maps it to the screen itself (mpv tone-maps HDR to an SDR display).
const siloClaimManagedDynamicRange = 'client_managed_dynamic_range_v1';

/// What the player behind a device profile does beyond what the profile
/// says, as far as Silo needs to know.
class SiloPlayerTraits {
  /// The defaults claim nothing the device profile doesn't say: the player
  /// plays progressive and HLS streams, and the server picks the audio
  /// track and handles embedded subtitles and HDR.
  const SiloPlayerTraits({
    this.managesDynamicRange = false,
    this.selectsAnyAudioTrack = false,
    this.playsProgressive = true,
    this.playsHls = true,
    this.rendersEmbeddedSubtitles = false,
    this.drawsAssStyling = true,
    this.loadsFontAttachments = true,
    this.sendsRequestHeaders = true,
  });

  /// The libmpv backend's traits (Windows, Linux): it decodes in software,
  /// picks any audio track, tone-maps HDR and Dolby Vision itself, draws
  /// embedded subtitles, and plays every delivery. It sends the stream's
  /// headers on every request (the media_kit backend hands them to mpv).
  static const mpv = SiloPlayerTraits(
    managesDynamicRange: true,
    selectsAnyAudioTrack: true,
    rendersEmbeddedSubtitles: true,
  );

  /// AetherEngine's traits (macOS, iOS and tvOS): it demuxes the
  /// file itself and picks any audio track, presents HDR and Dolby Vision
  /// through the system (which maps them to an SDR screen), draws embedded
  /// and bitmap subtitles, and plays every delivery. It sends the stream's
  /// headers on every request.
  static const aether = SiloPlayerTraits(
    managesDynamicRange: true,
    selectsAnyAudioTrack: true,
    rendersEmbeddedSubtitles: true,
  );

  /// Media3's traits (Android): ExoPlayer picks any audio track
  /// by its place among the file's (Moonfin hands it the ordinal) and draws
  /// the embedded text and bitmap subtitles it extracts (SubRip, SSA, WebVTT,
  /// PGS, VobSub), but draws ASS without its styling and loads no attached
  /// fonts. It sends HDR and Dolby Vision to the display as they are and
  /// maps nothing to an SDR screen itself.
  static const media3 = SiloPlayerTraits(
    selectsAnyAudioTrack: true,
    rendersEmbeddedSubtitles: true,
    drawsAssStyling: false,
    loadsFontAttachments: false,
  );

  /// A browser's `<video>` element, with hls.js for HLS: it sends no headers
  /// of its own (neither does hls.js here), picks no audio track of a file,
  /// and draws no embedded subtitles. Sidecars are loaded as text tracks. Its
  /// device profile comes from the browser's `isTypeSupported` answers.
  static const web = SiloPlayerTraits(sendsRequestHeaders: false);

  /// A cast receiver (Chromecast, AirPlay, DLNA): it loads
  /// the URL itself, so it sends none of the phone's headers, and its own
  /// player seeks by byte ranges, which a chunked remux has none of, so it
  /// takes the original file or HLS only. It picks no audio track and draws
  /// no embedded subtitles.
  static const castReceiver = SiloPlayerTraits(
    sendsRequestHeaders: false,
    playsProgressive: false,
  );

  /// libmpv on Android (media_kit, the other engine there): as on the
  /// desktop, except that it decodes through MediaCodec onto the surface,
  /// so it doesn't map HDR to an SDR screen.
  static const mpvAndroid = SiloPlayerTraits(
    selectsAnyAudioTrack: true,
    rendersEmbeddedSubtitles: true,
  );

  /// Maps an original file's HDR or Dolby Vision to the screen itself
  /// ([siloClaimManagedDynamicRange]).
  final bool managesDynamicRange;

  /// Picks any audio track of an original file ([siloClaimSelectedAudioTrack]).
  final bool selectsAnyAudioTrack;

  /// Plays one chunked remuxed response (`progressive`).
  final bool playsProgressive;

  /// Plays HLS (`hls`).
  final bool playsHls;

  /// Selects and draws an embedded subtitle track of a file played whole.
  final bool rendersEmbeddedSubtitles;

  /// Draws ASS and SSA with their styling (positions, fonts, effects).
  /// Without it, Silo may hand over a simplified rendering.
  final bool drawsAssStyling;

  /// Uses the fonts attached to a file for its embedded ASS subtitles.
  final bool loadsFontAttachments;

  /// Sends the stream's headers with every request it makes for it. A player
  /// that can't (a browser's media element, a cast receiver) gets the
  /// account's token in every media URL instead.
  final bool sendsRequestHeaders;
}

/// The capability half of a Silo playback start: `client_capabilities`, the
/// `deliveries` of `client_playback_context`, and the `client_features`
/// they rely on.
class SiloClientCapabilities {
  const SiloClientCapabilities({
    required this.clientCapabilities,
    required this.deliveries,
    required this.clientFeatures,
  });

  /// `ClientCodecCapabilitiesV3`.
  final Map<String, dynamic> clientCapabilities;

  /// `DeliveryCapabilityV3` by delivery class.
  final Map<String, Map<String, dynamic>> deliveries;

  final List<String> clientFeatures;

  /// The HDR formats the decoder handles (`hdr_details`).
  Map<String, dynamic> get hdrDetails =>
      clientCapabilities['hdr_details'] as Map<String, dynamic>;
}

/// Reads [deviceProfile] (a Jellyfin `DeviceProfile` as Moonfin builds it)
/// into Silo's terms, for a player with [traits].
///
/// - **Codecs and containers** come from the video direct-play profiles. A
///   codec the codec profiles rule out entirely (Moonfin writes that as a
///   `VideoProfile` that must equal `none`) is left out.
/// - **HDR** (`hdr_details`, and `hdr` when anything is on) comes from the
///   HEVC and AV1 range types the codec profiles don't rule out: HDR10, HLG,
///   HDR10+, and Dolby Vision profiles 5, 7 and 8 from their range types.
/// - **`max_resolution`** is the widest `Width` limit on the video codecs,
///   as a resolution class. No limit leaves it out (unconstrained).
/// - **Deliveries:** `original_http` takes the direct-play containers and
///   codecs, and `progressive` the same codecs in Silo's remux containers.
///   `hls` takes the decodable codecs among H.264, HEVC and the HLS
///   transcoding profiles' video codecs, and those profiles' audio codecs.
///   A profile without HLS transcoding has no `hls`. A channel limit below 6
///   on the audio codec profiles becomes `max_channels`, and a player that
///   downmixes on its own has none.
SiloClientCapabilities siloCapabilitiesFromDeviceProfile(
  Map<String, dynamic> deviceProfile, {
  SiloPlayerTraits traits = const SiloPlayerTraits(),
}) {
  final directPlay = _profiles(deviceProfile['DirectPlayProfiles']);
  final codecProfiles = _profiles(deviceProfile['CodecProfiles']);
  final transcoding = _profiles(deviceProfile['TranscodingProfiles']);

  final videoDirect = directPlay.where(
    (p) => (p['Type'] ?? 'Video') == 'Video',
  );
  final excluded = _excludedVideoCodecs(codecProfiles);
  final videoCodecs = _union([
    for (final p in videoDirect) _csv(p['VideoCodec']),
  ]).where((c) => !excluded.contains(c)).toList();
  final audioCodecs = _union([
    for (final p in videoDirect) _csv(p['AudioCodec']),
  ]);
  final containers = _withAliases(
    _union([for (final p in videoDirect) _csv(p['Container'])]),
  );

  final hlsProfiles = transcoding.where(
    (p) => p['Type'] == 'Video' && '${p['Protocol']}'.toLowerCase() == 'hls',
  );
  // What the player decodes from an HLS stream, which for Silo is a copy
  // remux as often as a transcode, so not only the transcode targets.
  final hlsTargets = {for (final p in hlsProfiles) ..._csv(p['VideoCodec'])};
  final hlsVideo = hlsProfiles.isEmpty
      ? const <String>[]
      : videoCodecs
            .where((c) => _hlsVideoCodecs.contains(c) || hlsTargets.contains(c))
            .toList();
  final hlsAudio = _union([for (final p in hlsProfiles) _csv(p['AudioCodec'])]);

  final hdr = _hdrDetails(codecProfiles, videoCodecs);
  final anyHdr =
      hdr['hdr10'] == true ||
      hdr['hlg'] == true ||
      hdr['hdr10_plus'] == true ||
      (hdr['dolby_vision_profiles'] as List).isNotEmpty;
  final maxResolution = _maxResolution(codecProfiles);
  final maxChannels = _maxChannels(codecProfiles);

  Map<String, dynamic> delivery({
    required bool supported,
    required List<String> containers,
    required List<String> video,
    required List<String> audio,
    required Map<String, dynamic> subtitles,
    List<String> claims = const [],
    String? failureReason,
  }) => {
    'enabled': true,
    'supported_on_device': supported,
    'failure_reason': ?(supported ? null : failureReason),
    'containers': containers,
    'video_codecs': video,
    'audio_decode_codecs': audio,
    // Silo honors passthrough only under `exact` evidence.
    'audio_passthrough_codecs': const <String>[],
    'max_channels': ?maxChannels,
    'subtitles': subtitles,
    'features': const <String>[],
    // A stream's URL and headers are fixed once the player opens it.
    'auth_header_refresh': false,
    'validated_claims': claims,
    'transformations': const <Map<String, dynamic>>[],
  };

  // A remux or HLS stream carries its subtitles as sidecars Moonfin loads
  // as external tracks. It can't fetch a sidecar's font bundle and loads
  // no external bitmap subtitles, so those are burned in.
  final sidecarSubtitles = {
    'embedded_text': false,
    'sidecar_text': true,
    'ass_styling': traits.drawsAssStyling,
    'embedded_bitmap': false,
    'sidecar_bitmap': false,
    'font_attachments': false,
  };

  return SiloClientCapabilities(
    clientCapabilities: {
      'video_evidence': 'declared',
      'audio_evidence': 'declared',
      'codecs_video': videoCodecs,
      // `declared` can't tell hardware from software decode, and Silo reads
      // the two lists alike on this tier.
      'codecs_video_hardware': videoCodecs,
      'codecs_audio': audioCodecs,
      'containers': containers,
      'max_resolution': ?maxResolution,
      'hdr': anyHdr,
      'hdr_details': hdr,
    },
    deliveries: {
      siloDeliveryOriginal: delivery(
        supported: true,
        containers: containers,
        video: videoCodecs,
        audio: audioCodecs,
        subtitles: _originalSubtitles(traits),
        claims: [
          if (traits.selectsAnyAudioTrack) siloClaimSelectedAudioTrack,
          if (traits.managesDynamicRange && anyHdr)
            siloClaimManagedDynamicRange,
        ],
      ),
      siloDeliveryProgressive: delivery(
        supported: traits.playsProgressive,
        failureReason: 'player_has_no_progressive_remux',
        containers: _withAliases(const ['mp4', 'mkv']),
        video: videoCodecs,
        audio: audioCodecs,
        subtitles: sidecarSubtitles,
      ),
      siloDeliveryHls: delivery(
        supported: traits.playsHls && hlsVideo.isNotEmpty,
        failureReason: 'player_has_no_hls',
        containers: const ['hls'],
        video: hlsVideo,
        audio: hlsAudio.isEmpty ? const ['aac'] : hlsAudio,
        subtitles: sidecarSubtitles,
      ),
    },
    clientFeatures: [
      for (final feature in siloBaseClientFeatures)
        if (feature != 'embedded_subtitles_v1' ||
            traits.rendersEmbeddedSubtitles)
          feature,
    ],
  );
}

/// The subtitles of a file played whole: embedded tracks are drawn from the
/// file (text, ASS with its attached fonts, bitmaps), sidecars are loaded as
/// external tracks, and an external bitmap file isn't loaded.
Map<String, dynamic> _originalSubtitles(SiloPlayerTraits traits) => {
  'embedded_text': traits.rendersEmbeddedSubtitles,
  'sidecar_text': true,
  'ass_styling': traits.drawsAssStyling,
  'embedded_bitmap': traits.rendersEmbeddedSubtitles,
  'sidecar_bitmap': false,
  'font_attachments':
      traits.rendersEmbeddedSubtitles && traits.loadsFontAttachments,
  if (traits.rendersEmbeddedSubtitles)
    'native_embedded': [
      for (final container in _nativeSubtitleContainers)
        {
          'container': container,
          'codecs': _nativeSubtitleCodecs,
          // Moonfin picks an embedded track by its probed stream index
          // (Silo's `subtitle_tracks[].index`, Moonfin's `Index`).
          'track_identity': 'ffmpeg_stream_index',
          'ass_styling': traits.drawsAssStyling,
          'font_attachments': traits.loadsFontAttachments,
        },
    ],
};

/// The video codecs every HLS player takes (HEVC in fMP4 segments). A
/// transcoding profile can add others.
const _hlsVideoCodecs = {'h264', 'hevc'};

const _nativeSubtitleContainers = ['mkv', 'matroska', 'webm', 'mp4', 'mov'];

const _nativeSubtitleCodecs = [
  'subrip',
  'ass',
  'ssa',
  'webvtt',
  'mov_text',
  'hdmv_pgs_subtitle',
  'dvd_subtitle',
  'dvb_subtitle',
];

List<Map<String, dynamic>> _profiles(Object? list) => [
  if (list is List)
    for (final p in list)
      if (p is Map) p.cast<String, dynamic>(),
];

List<String> _csv(Object? value) => [
  if (value is String)
    for (final v in value.split(','))
      if (v.trim().isNotEmpty) v.trim().toLowerCase(),
];

List<String> _union(Iterable<List<String>> lists) {
  final seen = <String>{};
  return [
    for (final list in lists)
      for (final v in list)
        if (seen.add(v)) v,
  ];
}

/// Silo names a Matroska file's container `mkv`, and Moonfin's profiles use
/// either spelling. Both go in, so each matches.
List<String> _withAliases(List<String> containers) {
  final out = [...containers];
  void pair(String a, String b) {
    if (out.contains(a) && !out.contains(b)) out.add(b);
    if (out.contains(b) && !out.contains(a)) out.add(a);
  }

  pair('mkv', 'matroska');
  return out;
}

/// The codecs of the video codec profiles that can never be met: an
/// unconditional `VideoProfile` that must equal `none`.
Set<String> _excludedVideoCodecs(List<Map<String, dynamic>> codecProfiles) {
  final out = <String>{};
  for (final p in codecProfiles) {
    if (p['Type'] != 'Video' || _profiles(p['ApplyConditions']).isNotEmpty) {
      continue;
    }
    final never = _profiles(p['Conditions']).any(
      (c) =>
          c['Condition'] == 'Equals' &&
          c['Property'] == 'VideoProfile' &&
          '${c['Value']}'.toLowerCase() == 'none',
    );
    if (never) out.addAll(_csv(p['Codec']));
  }
  return out;
}

/// The range types the codec profiles rule out for [codec], in Moonfin's
/// upper-case spelling (`HDR10`, `HDR10_PLUS`, `DOVI_WITH_EL`…).
Set<String> _unsupportedRanges(
  List<Map<String, dynamic>> codecProfiles,
  String codec,
) {
  final out = <String>{};
  for (final p in codecProfiles) {
    if (p['Type'] != 'Video' || !_csv(p['Codec']).contains(codec)) continue;
    for (final c in _profiles(p['Conditions'])) {
      if (c['Property'] != 'VideoRangeType' || c['Condition'] != 'NotEquals') {
        continue;
      }
      for (final v in '${c['Value']}'.split('|')) {
        out.add(_rangeKey(v));
      }
    }
  }
  return out;
}

/// `DOVIWithHDR10` and `DOVI_WITH_HDR10` both become `DOVIWITHHDR10`.
String _rangeKey(String value) =>
    value.trim().toUpperCase().replaceAll('_', '');

Map<String, dynamic> _hdrDetails(
  List<Map<String, dynamic>> codecProfiles,
  List<String> videoCodecs,
) {
  bool hdr10 = false, hlg = false, hdr10Plus = false;
  final dolbyVision = <int>{};
  for (final codec in const ['hevc', 'av1']) {
    if (!videoCodecs.contains(codec)) continue;
    final ruledOut = _unsupportedRanges(codecProfiles, codec);
    bool allows(String range) => !ruledOut.contains(_rangeKey(range));
    hdr10 |= allows('HDR10');
    hlg |= allows('HLG');
    hdr10Plus |= allows('HDR10_PLUS');
    if (codec == 'hevc') {
      if (allows('DOVI')) dolbyVision.add(5);
      if (allows('DOVI_WITH_EL')) dolbyVision.add(7);
      if (allows('DOVI_WITH_HDR10')) dolbyVision.add(8);
    } else if (allows('DOVI')) {
      // AV1 Dolby Vision is profile 10.
      dolbyVision.add(10);
    }
  }
  return {
    'hdr10': hdr10,
    'hdr10_plus': hdr10Plus,
    'hlg': hlg,
    'dolby_vision_profiles': dolbyVision.toList()..sort(),
  };
}

/// The `LessThanEqual` limits on [property] in the [type] codec profiles
/// that always apply (no `ApplyConditions`).
Iterable<int> _limits(
  List<Map<String, dynamic>> codecProfiles,
  String type,
  String property,
) sync* {
  for (final p in codecProfiles) {
    if (p['Type'] != type || _profiles(p['ApplyConditions']).isNotEmpty) {
      continue;
    }
    for (final c in _profiles(p['Conditions'])) {
      if (c['Property'] != property || c['Condition'] != 'LessThanEqual') {
        continue;
      }
      final limit = int.tryParse('${c['Value']}');
      if (limit != null && limit > 0) yield limit;
    }
  }
}

/// The widest unconditional `Width` limit on a video codec, as Silo's
/// resolution class, or null when nothing limits it.
String? _maxResolution(List<Map<String, dynamic>> codecProfiles) {
  final widths = _limits(codecProfiles, 'Video', 'Width');
  if (widths.isEmpty) return null;
  final widest = widths.reduce(max);
  if (widest <= 854) return '480p';
  if (widest <= 1280) return '720p';
  if (widest <= 2560) return '1080p';
  if (widest <= 4096) return '2160p';
  return '4320p';
}

/// A channel limit below six on the audio codec profiles, as Silo's
/// per-delivery `max_channels`. Null means none, which is what a player that
/// downmixes on its own advertises (eight channels).
int? _maxChannels(List<Map<String, dynamic>> codecProfiles) {
  final limits = _limits(codecProfiles, 'VideoAudio', 'AudioChannels');
  if (limits.isEmpty) return null;
  final lowest = limits.reduce(min);
  return lowest < 6 ? lowest : null;
}
