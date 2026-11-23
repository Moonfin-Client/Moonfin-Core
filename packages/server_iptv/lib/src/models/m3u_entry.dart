class M3uEntry {
  final String name;
  final String streamUrl;
  final String? groupTitle;
  final String? tvgId;
  final String? tvgLogo;
  final int? channelNumber;
  final bool isVod;
  final Map<String, String> attributes;

  const M3uEntry({
    required this.name,
    required this.streamUrl,
    this.groupTitle,
    this.tvgId,
    this.tvgLogo,
    this.channelNumber,
    this.isVod = false,
    this.attributes = const {},
  });
}
