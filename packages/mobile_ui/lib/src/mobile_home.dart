import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'cinema_controls.dart';
import 'mobile_models.dart';

part 'apple_home.dart';
part 'netflix_home.dart';
part 'media_rail.dart';

enum _Category { all, movies, series, saved }

/// The two presentations share data and behavior, not a Material widget theme.
class MobileCinemaHome extends StatefulWidget {
  const MobileCinemaHome({
    super.key,
    required this.mode,
    required this.rails,
    required this.onModeChanged,
    required this.onOpen,
    required this.onPlay,
    required this.onSearch,
    required this.onProfile,
    required this.onRefresh,
    required this.artworkBuilder,
    this.featured = const [],
    this.onSave,
    this.onLoadMore,
    this.onRailVisible,
    this.loading = false,
    this.labels = const MobileHomeLabels(),
    this.bottomPadding = 24,
  });

  final MobileCinemaMode mode;
  final List<MobileMediaRail> rails;
  final List<MobileMedia> featured;
  final ValueChanged<MobileCinemaMode> onModeChanged;
  final ValueChanged<MobileMedia> onOpen, onPlay;
  final VoidCallback onSearch, onProfile;
  final Future<void> Function() onRefresh;
  final Future<void> Function(MobileMedia, bool)? onSave;
  final ValueChanged<String>? onLoadMore, onRailVisible;
  final MobileArtworkBuilder artworkBuilder;
  final bool loading;
  final MobileHomeLabels labels;
  final double bottomPadding;

  static Color backgroundFor(MobileCinemaMode mode) => CinemaStyle.black;

  @override
  State<MobileCinemaHome> createState() => _MobileCinemaHomeState();
}

class _Feed {
  const _Feed(this.rails, this.featured);
  final List<({MobileMediaRail rail, List<MobileMedia> items})> rails;
  final List<MobileMedia> featured;
}

class _MobileCinemaHomeState extends State<MobileCinemaHome> {
  _Category _category = _Category.all;
  final _saved = <String, bool>{};
  final _saving = <String>{};
  Timer? _noticeTimer;
  String? _notice;
  final _scroll = ScrollController();

  bool _isSaved(MobileMedia item) => _saved[item.id] ?? item.saved;
  MobileHomeLabels get labels => widget.labels;
  bool _matches(MobileMedia item) => switch (_category) {
    _Category.all => true,
    _Category.movies => item.kind == MobileMediaKind.movie,
    _Category.series => item.kind == MobileMediaKind.series,
    _Category.saved => _isSaved(item),
  };

  @override
  void didUpdateWidget(MobileCinemaHome oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.rails, widget.rails)) {
      _saved.removeWhere((id, _) => !_saving.contains(id));
    }
  }

  @override
  void dispose() {
    _noticeTimer?.cancel();
    _scroll.dispose();
    super.dispose();
  }

  void _select(_Category value) => setState(() => _category = value);
  void _appearance() =>
      showCinemaModePicker(context, widget.mode, widget.onModeChanged);

  Future<void> _toggleSave(MobileMedia item) async {
    if (_saving.contains(item.id) || widget.onSave == null) return;
    final previous = _isSaved(item);
    setState(() {
      _saved[item.id] = !previous;
      _saving.add(item.id);
    });
    try {
      await widget.onSave!(item, !previous);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _saved[item.id] = previous;
        _notice = labels.saveError;
      });
      _noticeTimer?.cancel();
      _noticeTimer = Timer(const Duration(seconds: 4), () {
        if (mounted) setState(() => _notice = null);
      });
    } finally {
      if (mounted) setState(() => _saving.remove(item.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final rails = [
      for (final rail in widget.rails)
        (rail: rail, items: rail.items.where(_matches).toList(growable: false)),
    ].where((row) => row.items.isNotEmpty || row.rail.loading).toList();
    final seen = <String>{};
    final featured = [
      ...widget.featured,
      for (final row in rails)
        if (!row.rail.continueWatching)
          ...row.items.where((item) => item.kind != MobileMediaKind.other),
    ].where((item) => _matches(item) && seen.add(item.id)).take(4).toList();
    final feed = _Feed(rails, featured);
    return CupertinoTheme(
      data: const CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CinemaStyle.blue,
      ),
      child: DefaultTextStyle(
        style: CinemaStyle.text(widget.mode, 15),
        child: Stack(
          children: [
            Positioned.fill(
              child: widget.mode == MobileCinemaMode.appleTv
                  ? _AppleHome(state: this, feed: feed)
                  : _NetflixHome(state: this, feed: feed),
            ),
            if (_notice != null)
              Positioned(
                left: 20,
                right: 20,
                bottom: 18,
                child: Semantics(
                  liveRegion: true,
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: const Color(0xFF303034),
                      borderRadius: BorderRadius.circular(
                        widget.mode == MobileCinemaMode.appleTv ? 16 : 4,
                      ),
                    ),
                    child: Text(
                      _notice!,
                      style: CinemaStyle.text(widget.mode, 14),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _empty() => SliverFillRemaining(
    hasScrollBody: false,
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.loading)
              const CupertinoActivityIndicator(radius: 14)
            else
              const CinemaIcon(
                CinemaGlyph.library,
                size: 38,
                color: CinemaStyle.secondary,
              ),
            const SizedBox(height: 20),
            Text(
              widget.loading ? labels.loading : labels.empty,
              textAlign: TextAlign.center,
              style: CinemaStyle.text(widget.mode, 23, weight: FontWeight.w600),
            ),
            if (!widget.loading) ...[
              const SizedBox(height: 12),
              Text(
                labels.emptyHint,
                textAlign: TextAlign.center,
                style: CinemaStyle.text(
                  widget.mode,
                  15,
                  color: CinemaStyle.secondary,
                ),
              ),
              const SizedBox(height: 22),
              CinemaButton(
                mode: widget.mode,
                label: labels.retry,
                onPressed: widget.onRefresh,
              ),
            ],
          ],
        ),
      ),
    ),
  );

  Widget _rows(_Feed feed) => SliverList.builder(
    itemCount: feed.rails.length,
    itemBuilder: (context, index) {
      final row = feed.rails[index];
      return _MediaRail(
        key: ValueKey((widget.mode, row.rail.id)),
        rail: row.rail,
        items: row.items,
        mode: widget.mode,
        artworkBuilder: widget.artworkBuilder,
        labels: labels,
        onOpen: widget.onOpen,
        onPlay: widget.onPlay,
        onVisible: () => widget.onRailVisible?.call(row.rail.id),
        onMore: row.rail.hasMore && widget.onLoadMore != null
            ? () => widget.onLoadMore!(row.rail.id)
            : null,
      );
    },
  );

  Widget _categoryPicker({required bool apple}) {
    final names = [
      labels.forYou,
      labels.movies,
      labels.series,
      apple ? labels.saved : 'My list',
    ];
    return SizedBox(
      height: 48,
      child: ListView.separated(
        key: const ValueKey('cinema-categories'),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: apple ? 22 : 18),
        itemCount: _Category.values.length,
        separatorBuilder: (_, _) => SizedBox(width: apple ? 25 : 12),
        itemBuilder: (context, index) {
          final active = index == _category.index;
          return CinemaPressable(
            label: names[index],
            selected: active,
            onPressed: () => _select(_Category.values[index]),
            radius: apple ? 0 : 18,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: apple ? 0 : 15,
                  vertical: 8,
                ),
                decoration: apple
                    ? BoxDecoration(
                        border: active
                            ? const Border(
                                bottom: BorderSide(
                                  color: CinemaStyle.white,
                                  width: 2,
                                ),
                              )
                            : null,
                      )
                    : BoxDecoration(
                        border: Border.all(
                          color: active
                              ? CinemaStyle.white
                              : const Color(0xFF969292),
                          width: .8,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: active ? const Color(0x18FFFFFF) : null,
                      ),
                child: Text(
                  names[index],
                  style: CinemaStyle.text(
                    widget.mode,
                    apple ? 16 : 14,
                    weight: active ? FontWeight.w600 : FontWeight.w400,
                    color: active ? CinemaStyle.white : const Color(0xFFBEBEC5),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Artwork extends StatelessWidget {
  const _Artwork({required this.url, required this.builder});
  final String? url;
  final MobileArtworkBuilder builder;
  @override
  Widget build(BuildContext context) => ColoredBox(
    color: const Color(0xFF242426),
    child: url == null || url!.isEmpty
        ? const Center(
            child: CinemaIcon(
              CinemaGlyph.library,
              size: 32,
              color: CinemaStyle.secondary,
            ),
          )
        : builder(context, url!, BoxFit.cover),
  );
}

class _TitleArt extends StatelessWidget {
  const _TitleArt({
    required this.item,
    required this.mode,
    required this.artworkBuilder,
  });
  final MobileMedia item;
  final MobileCinemaMode mode;
  final MobileArtworkBuilder artworkBuilder;
  @override
  Widget build(BuildContext context) {
    if (item.logoUrl != null)
      return SizedBox(
        height: 70,
        child: artworkBuilder(context, item.logoUrl!, BoxFit.contain),
      );
    if (item.titleArt != null)
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.titleArt!,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: CinemaStyle.text(
              mode,
              48,
              weight: FontWeight.w400,
              spacing: 9,
              height: 1.1,
            ),
          ),
          if (item.titleArtSubtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              item.titleArtSubtitle!,
              style: CinemaStyle.text(
                mode,
                10,
                spacing: 5,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ],
      );
    return Text(
      item.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: CinemaStyle.text(
        mode,
        mode == MobileCinemaMode.appleTv ? 34 : 37,
        weight: FontWeight.w700,
        spacing: -.8,
        height: 1.05,
      ),
    );
  }
}
