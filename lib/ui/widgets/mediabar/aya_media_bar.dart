import 'package:flutter/material.dart';

import '../../../../data/models/media_bar_slide_item.dart';

class AyaMediaBar extends StatelessWidget {
  final List<MediaBarSlideItem> items;
  final double height;

  const AyaMediaBar({
    super.key,
    required this.items,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(
        child: Text('Aya'),
      ),
    );
  }
}