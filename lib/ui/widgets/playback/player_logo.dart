import 'package:flutter/material.dart';

const double _normalHeight = 64;
const double _minHeight = 40;
const double _maxWidthFraction = 0.34;

/// The height the player's top bar logo is drawn at.
///
/// A logo starts at the normal height. If that would make it wider than about
/// a third of the screen, the height shrinks until the width fits, down to a
/// floor that keeps very wide wordmarks readable. Until the image is decoded
/// there's no [aspectRatio], so the logo keeps the normal height.
@visibleForTesting
double playerLogoHeight({
  required double? aspectRatio,
  required double screenWidth,
}) {
  if (aspectRatio == null) return _normalHeight;
  final maxWidth = screenWidth * _maxWidthFraction;
  return (maxWidth / aspectRatio).clamp(_minHeight, _normalHeight);
}

/// The item's logo in the player's top bar, sized by [playerLogoHeight].
class PlayerLogo extends StatefulWidget {
  const PlayerLogo({super.key, required this.image, this.errorBuilder});

  final ImageProvider image;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  State<PlayerLogo> createState() => _PlayerLogoState();
}

class _PlayerLogoState extends State<PlayerLogo> {
  late final _listener = ImageStreamListener(_handleImage);
  ImageStream? _stream;
  double? _aspectRatio;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _watchImage();
  }

  @override
  void didUpdateWidget(covariant PlayerLogo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.image != oldWidget.image) {
      _aspectRatio = null;
      _watchImage();
    }
  }

  void _watchImage() {
    final stream = widget.image.resolve(createLocalImageConfiguration(context));
    if (stream.key == _stream?.key) return;
    _stream?.removeListener(_listener);
    _stream = stream;
    stream.addListener(_listener);
  }

  void _handleImage(ImageInfo info, bool _) {
    final aspectRatio = info.image.width / info.image.height;
    info.dispose();
    if (aspectRatio != _aspectRatio) {
      setState(() => _aspectRatio = aspectRatio);
    }
  }

  @override
  void dispose() {
    _stream?.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: widget.image,
      height: playerLogoHeight(
        aspectRatio: _aspectRatio,
        screenWidth: MediaQuery.sizeOf(context).width,
      ),
      fit: BoxFit.contain,
      alignment: Alignment.centerLeft,
      errorBuilder: widget.errorBuilder,
    );
  }
}
