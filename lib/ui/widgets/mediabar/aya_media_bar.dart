import 'package:flutter/material.dart';

import '../../../../data/models/media_bar_slide_item.dart';

class AyaMediaBar extends StatelessWidget {
  final List<MediaBarSlideItem> items;
  final double height;
  final int activeIndex;

  const AyaMediaBar({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final item = items[activeIndex];

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Center(
        child: Text(item.title),
      ),
    );
  }
}