import 'package:flutter/widgets.dart';

/// Non-web stub. Local trailers on native platforms play through the media_kit /
/// mpv / Media3 backends, so this widget is only ever built on web.
class WebLocalTrailer extends StatelessWidget {
  final String url;
  final bool muted;
  final bool ignorePointer;
  final VoidCallback? onCompleted;
  final VoidCallback? onError;

  const WebLocalTrailer({
    super.key,
    required this.url,
    this.muted = true,
    this.ignorePointer = true,
    this.onCompleted,
    this.onError,
  });

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
