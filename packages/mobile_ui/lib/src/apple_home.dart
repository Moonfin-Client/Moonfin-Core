part of 'mobile_home.dart';

class _AppleHome extends StatelessWidget {
  const _AppleHome({required this.state, required this.feed});
  final _MobileCinemaHomeState state;
  final _Feed feed;
  @override
  Widget build(BuildContext context) => ColoredBox(
    color: CinemaStyle.black,
    child: SafeArea(
      bottom: false,
      child: CustomScrollView(
        key: const PageStorageKey('apple-cinema-home'),
        controller: state._scroll,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: state.widget.onRefresh),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 20, 16, 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Home',
                      style: CinemaStyle.text(
                        MobileCinemaMode.appleTv,
                        35,
                        weight: FontWeight.w700,
                        spacing: -1.1,
                      ),
                    ),
                  ),
                  CinemaIconButton(
                    icon: CinemaGlyph.more,
                    label: 'Appearance',
                    onPressed: state._appearance,
                    background: const Color(0xFF242426),
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  CinemaPressable(
                    label: state.labels.profile,
                    onPressed: state.widget.onProfile,
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: CinemaAvatar(size: 34, apple: true),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: state._categoryPicker(apple: true)),
          if (feed.featured.isNotEmpty)
            SliverToBoxAdapter(
              child: _AppleFeatured(
                key: ValueKey(state._category),
                state: state,
                items: feed.featured,
              ),
            ),
          if (feed.rails.isEmpty) state._empty() else state._rows(feed),
          SliverToBoxAdapter(
            child: SizedBox(height: state.widget.bottomPadding),
          ),
        ],
      ),
    ),
  );
}

class _AppleFeatured extends StatefulWidget {
  const _AppleFeatured({super.key, required this.state, required this.items});
  final _MobileCinemaHomeState state;
  final List<MobileMedia> items;
  @override
  State<_AppleFeatured> createState() => _AppleFeaturedState();
}

class _AppleFeaturedState extends State<_AppleFeatured> {
  final _pages = PageController(viewportFraction: .92);
  int _index = 0;
  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(1);
    final height = 405.0 + (scale - 1).clamp(0, 2) * 150;
    final state = widget.state;
    return Column(
      children: [
        const SizedBox(height: 13),
        SizedBox(
          height: height,
          child: PageView.builder(
            controller: _pages,
            itemCount: widget.items.length,
            onPageChanged: (index) => setState(() => _index = index),
            itemBuilder: (context, index) {
              final item = widget.items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CinemaPressable(
                        label: '${item.title}, ${state.labels.details}',
                        onPressed: () => state.widget.onOpen(item),
                        child: _Artwork(
                          url: item.backdropUrl ?? item.posterUrl,
                          builder: state.widget.artworkBuilder,
                        ),
                      ),
                      const IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0, .32, .64, 1],
                              colors: [
                                Color(0x00000000),
                                Color(0x00000000),
                                Color(0x66000000),
                                Color(0xFF111111),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 17,
                        left: 18,
                        child: Text(
                          'moonfin',
                          style: CinemaStyle.text(
                            MobileCinemaMode.appleTv,
                            15,
                            weight: FontWeight.w600,
                            spacing: -.5,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 23,
                        right: 23,
                        bottom: 22,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _TitleArt(
                              item: item,
                              mode: MobileCinemaMode.appleTv,
                              artworkBuilder: state.widget.artworkBuilder,
                            ),
                            const SizedBox(height: 13),
                            Text(
                              item.metadata,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CinemaStyle.text(
                                MobileCinemaMode.appleTv,
                                12,
                                color: const Color(0xFFDBDBDF),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                Expanded(
                                  child: CinemaButton(
                                    mode: MobileCinemaMode.appleTv,
                                    label: item.canPlay
                                        ? item.progress > 0
                                              ? state.labels.resume
                                              : 'Watch Now'
                                        : state.labels.details,
                                    icon: item.canPlay
                                        ? CinemaGlyph.play
                                        : CinemaGlyph.info,
                                    onPressed: () => item.canPlay
                                        ? state.widget.onPlay(item)
                                        : state.widget.onOpen(item),
                                  ),
                                ),
                                if (state.widget.onSave != null &&
                                    item.canSave) ...[
                                  const SizedBox(width: 10),
                                  CinemaIconButton(
                                    icon: state._isSaved(item)
                                        ? CinemaGlyph.check
                                        : CinemaGlyph.plus,
                                    label: state._isSaved(item)
                                        ? state.labels.remove
                                        : state.labels.save,
                                    background: const Color(0xFF363638),
                                    onPressed: state._saving.contains(item.id)
                                        ? null
                                        : () => state._toggleSave(item),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 2, 0, 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < widget.items.length; i++)
                CinemaPressable(
                  label: widget.items[i].title,
                  selected: i == _index,
                  onPressed: () => MediaQuery.disableAnimationsOf(context)
                      ? _pages.jumpToPage(i)
                      : _pages.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        ),
                  child: SizedBox(
                    width: 30,
                    height: 37,
                    child: Center(
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i == _index
                              ? CinemaStyle.white
                              : const Color(0xFF49494D),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
