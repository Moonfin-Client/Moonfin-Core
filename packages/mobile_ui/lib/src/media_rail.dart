part of 'mobile_home.dart';

class _MediaRail extends StatefulWidget {
  const _MediaRail({
    super.key,
    required this.rail,
    required this.items,
    required this.mode,
    required this.artworkBuilder,
    required this.labels,
    required this.onOpen,
    required this.onPlay,
    required this.onVisible,
    this.onMore,
  });
  final MobileMediaRail rail;
  final List<MobileMedia> items;
  final MobileCinemaMode mode;
  final MobileArtworkBuilder artworkBuilder;
  final MobileHomeLabels labels;
  final ValueChanged<MobileMedia> onOpen, onPlay;
  final VoidCallback onVisible;
  final VoidCallback? onMore;
  @override
  State<_MediaRail> createState() => _MediaRailState();
}

class _MediaRailState extends State<_MediaRail> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) widget.onVisible();
    });
  }

  @override
  Widget build(BuildContext context) {
    final apple = widget.mode == MobileCinemaMode.appleTv;
    final resume = widget.rail.continueWatching;
    final rank = !apple && widget.rail.ranked && !resume;
    final imageWidth = apple
        ? 248.0
        : resume
        ? 125.0
        : 116.0;
    final imageHeight = apple
        ? 140.0
        : resume
        ? 172.0
        : 174.0;
    final scale = MediaQuery.textScalerOf(context).scale(1).clamp(1, 3);
    final footer = apple
        ? 62.0 * scale
        : resume
        ? 42.0
        : 0.0;
    return Padding(
      padding: EdgeInsets.only(bottom: apple ? 25 : 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              apple ? 22 : 16,
              0,
              18,
              apple ? 13 : 12,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.rail.title,
                    style: CinemaStyle.text(
                      widget.mode,
                      apple ? 24 : 21,
                      weight: FontWeight.w700,
                      spacing: apple ? -.5 : -.1,
                    ),
                  ),
                ),
                if (widget.onMore != null)
                  CinemaIconButton(
                    icon: CinemaGlyph.chevron,
                    label: widget.labels.loadMore,
                    onPressed: widget.onMore,
                    size: 15,
                    color: apple ? CinemaStyle.secondary : CinemaStyle.white,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: imageHeight + footer,
            child: ListView.separated(
              key: PageStorageKey((widget.mode, widget.rail.id)),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: apple ? 22 : 16),
              itemCount: widget.items.isEmpty && widget.rail.loading
                  ? 3
                  : widget.items.length + (widget.onMore == null ? 0 : 1),
              separatorBuilder: (_, _) => SizedBox(width: apple ? 13 : 8),
              itemBuilder: (context, index) {
                if (widget.items.isEmpty)
                  return Container(
                    width: imageWidth,
                    height: imageHeight,
                    decoration: BoxDecoration(
                      color: const Color(0xFF222225),
                      borderRadius: BorderRadius.circular(apple ? 10 : 4),
                    ),
                  );
                if (index == widget.items.length)
                  return SizedBox(
                    width: 100,
                    child: Center(
                      child: CinemaIconButton(
                        icon: CinemaGlyph.chevron,
                        label: widget.labels.loadMore,
                        onPressed: widget.onMore,
                      ),
                    ),
                  );
                final item = widget.items[index];
                final artwork = ClipRRect(
                  borderRadius: BorderRadius.circular(apple ? 10 : 4),
                  child: SizedBox(
                    width: imageWidth,
                    height: imageHeight,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        _Artwork(
                          url: apple
                              ? item.backdropUrl ?? item.posterUrl
                              : item.posterUrl ?? item.backdropUrl,
                          builder: widget.artworkBuilder,
                        ),
                        if (resume && item.canPlay)
                          Center(
                            child: CinemaIconButton(
                              icon: CinemaGlyph.play,
                              label: widget.labels.resume,
                              background: const Color(0x99000000),
                              size: apple ? 21 : 23,
                              onPressed: () => widget.onPlay(item),
                            ),
                          ),
                        if (apple && item.progress > 0)
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 8,
                            child: _Progress(
                              item.progress,
                              color: CinemaStyle.white,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
                return SizedBox(
                  width: imageWidth + (rank ? 38 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CinemaPressable(
                        label: '${item.title}, ${widget.labels.details}',
                        preserveChildSemantics: true,
                        onPressed: () => widget.onOpen(item),
                        radius: apple ? 10 : 4,
                        child: rank
                            ? Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 38),
                                    child: artwork,
                                  ),
                                  _Rank(index + 1),
                                ],
                              )
                            : artwork,
                      ),
                      if (apple) ...[
                        const SizedBox(height: 9),
                        Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CinemaStyle.text(
                            widget.mode,
                            15,
                            weight: FontWeight.w600,
                          ),
                        ),
                        if (item.subtitle.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            item.subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: CinemaStyle.text(
                              widget.mode,
                              12,
                              color: CinemaStyle.secondary,
                            ),
                          ),
                        ],
                      ] else if (resume) ...[
                        _Progress(
                          item.progress,
                          color: CinemaStyle.red,
                          height: 3,
                        ),
                        ColoredBox(
                          color: const Color(0xFF202020),
                          child: SizedBox(
                            height: 38,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CinemaPressable(
                                    label:
                                        '${item.title}, ${widget.labels.details}',
                                    onPressed: () => widget.onOpen(item),
                                    child: const Center(
                                      child: CinemaIcon(
                                        CinemaGlyph.info,
                                        size: 19,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: CinemaPressable(
                                    label:
                                        '${widget.labels.details}: ${item.title}',
                                    onPressed: () => widget.onOpen(item),
                                    child: const Center(
                                      child: CinemaIcon(
                                        CinemaGlyph.more,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Progress extends StatelessWidget {
  const _Progress(this.value, {required this.color, this.height = 3});
  final double value, height;
  final Color color;
  @override
  Widget build(BuildContext context) => Semantics(
    value: '${(value * 100).round()}%',
    child: SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned.fill(child: ColoredBox(color: const Color(0x665F5F62))),
          FractionallySizedBox(
            widthFactor: value.clamp(0, 1),
            heightFactor: 1,
            child: ColoredBox(color: color),
          ),
        ],
      ),
    ),
  );
}

class _Rank extends StatelessWidget {
  const _Rank(this.value);
  final int value;
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontFamily: 'BarlowCondensed',
      package: 'moonfin_mobile_ui',
      fontSize: 91,
      height: .97,
      fontWeight: FontWeight.w700,
      letterSpacing: -5,
    );
    return ExcludeSemantics(
      child: Stack(
        children: [
          Text(
            '$value',
            style: style.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = const Color(0xFFA5A5AA),
            ),
          ),
          Text('$value', style: style.copyWith(color: CinemaStyle.black)),
        ],
      ),
    );
  }
}
