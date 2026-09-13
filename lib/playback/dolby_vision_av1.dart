/// Whether a source has to be decoded in software so its Dolby Vision is
/// dropped and the HDR10 base layer plays.
///
/// AetherEngine tags the fMP4 sample entry `dav1` for a Dolby Vision AV1
/// source whenever the display reports Dolby Vision. FFmpeg's mp4 muxer has
/// no `dav1` tag for AV1, so it refuses the header and the first segment is
/// never built. The software path builds no fMP4 segment at all, so it plays
/// the profile 10.1 base layer instead of failing the load.
///
/// That trades a hardware decode for a CPU one, so it stays as narrow as it
/// can be. Profile 10.4 already muxes as `av01`. Profile 10.0 has no base
/// layer to fall back to, and the engine refuses a software load for it rather
/// than play the wrong colors.
bool needsSoftwareDecodeForDolbyVisionAv1(Map<dynamic, dynamic> payload) {
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
