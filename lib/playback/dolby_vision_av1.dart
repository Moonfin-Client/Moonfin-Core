/// Whether a source should be presented as its HDR10 base layer, with the Dolby
/// Vision left out of the container.
///
/// AetherEngine tags the fMP4 sample entry `dav1` for a Dolby Vision AV1 source
/// whenever the display reports Dolby Vision. FFmpeg's mp4 muxer has no `dav1`
/// tag for AV1, so it refuses the header and the first segment is never built.
/// Asking for the base layer takes the plain `av01` route instead, which muxes
/// and still decodes in hardware.
///
/// Only profile 10.1 needs it. Profile 10.4 already muxes as `av01`. Profile
/// 10.0 has no base layer to present, so the engine keeps its Dolby Vision
/// route and says so in the log.
bool needsBaseLayerOnlyForDolbyVisionAv1(Map<dynamic, dynamic> payload) {
  if (payload['videoCodec']?.toString() != 'av1') return false;
  if (payload['videoDvProfile'] != 10) return false;
  if (payload['videoDvBlCompatId'] == 1) return true;
  if (payload['videoDvBlCompatId'] != null) return false;
  final rangeType = payload['videoRangeType']
      ?.toString()
      .toUpperCase()
      .replaceAll(RegExp(r'[^A-Z0-9]+'), '');
  return rangeType == 'DOVIWITHHDR10' || rangeType == 'DOVIWITHHDR10PLUS';
}
