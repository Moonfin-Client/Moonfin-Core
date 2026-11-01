import 'package:flutter/cupertino.dart';

import 'cinema_controls.dart';
import 'mobile_models.dart';

Future<void> showCinemaDetails(
  BuildContext context, {
  required MobileCinemaMode mode,
  required MobileMedia item,
  required MobileArtworkBuilder artworkBuilder,
  required VoidCallback onPlay,
  Future<void> Function(bool)? onSave,
  VoidCallback? onMore,
}) => showCinemaSheet<void>(
  context,
  mode: mode,
  builder: (context) => _CinemaDetails(
    mode: mode,
    item: item,
    artworkBuilder: artworkBuilder,
    onPlay: onPlay,
    onSave: onSave,
    onMore: onMore,
  ),
);

class _CinemaDetails extends StatefulWidget {
  const _CinemaDetails({
    required this.mode,
    required this.item,
    required this.artworkBuilder,
    required this.onPlay,
    this.onSave,
    this.onMore,
  });
  final MobileCinemaMode mode;
  final MobileMedia item;
  final MobileArtworkBuilder artworkBuilder;
  final VoidCallback onPlay;
  final Future<void> Function(bool)? onSave;
  final VoidCallback? onMore;
  @override
  State<_CinemaDetails> createState() => _CinemaDetailsState();
}

class _CinemaDetailsState extends State<_CinemaDetails> {
  late bool _saved = widget.item.saved;
  bool _saving = false;
  String? _error;
  Future<void> _save() async {
    if (_saving || widget.onSave == null) return;
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await widget.onSave!(!_saved);
      if (mounted) setState(() => _saved = !_saved);
    } catch (_) {
      if (mounted)
        setState(
          () => _error = 'Could not update your list. Please try again.',
        );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final apple = widget.mode == MobileCinemaMode.appleTv;
    final image = item.backdropUrl ?? item.posterUrl;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: image == null
                    ? const ColoredBox(color: Color(0xFF303034))
                    : widget.artworkBuilder(context, image, BoxFit.cover),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: CinemaIconButton(
                  icon: CinemaGlyph.close,
                  label: 'Close',
                  onPressed: () => Navigator.pop(context),
                  background: const Color(0xBB202020),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              apple ? 24 : 17,
              23,
              apple ? 24 : 17,
              30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: CinemaStyle.text(
                    widget.mode,
                    apple ? 29 : 27,
                    weight: FontWeight.w700,
                    spacing: -.5,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  item.metadata,
                  style: CinemaStyle.text(
                    widget.mode,
                    13,
                    color: const Color(0xFFADADB4),
                  ),
                ),
                const SizedBox(height: 22),
                if (item.canPlay)
                  SizedBox(
                    width: double.infinity,
                    child: CinemaButton(
                      mode: widget.mode,
                      label: item.progress > 0
                          ? 'Resume'
                          : apple
                          ? 'Watch Now'
                          : 'Play',
                      icon: CinemaGlyph.play,
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onPlay();
                      },
                    ),
                  ),
                if (item.overview.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  Text(
                    item.overview,
                    style: CinemaStyle.text(
                      widget.mode,
                      15,
                      height: 1.5,
                      color: apple
                          ? const Color(0xFFC5C5CD)
                          : CinemaStyle.white,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                Wrap(
                  runSpacing: 18,
                  children: [
                    if (widget.onSave != null && item.canSave)
                      _action(
                        _saved ? CinemaGlyph.check : CinemaGlyph.plus,
                        apple
                            ? _saved
                                  ? 'Added'
                                  : 'Add'
                            : 'My List',
                        _saved ? 'Remove from favorites' : 'Add to favorites',
                        _saving ? null : _save,
                      ),
                    if (widget.onMore != null)
                      _action(
                        CinemaGlyph.info,
                        apple ? 'Full Details' : 'More Info',
                        'Full details',
                        () {
                          Navigator.pop(context);
                          widget.onMore!();
                        },
                      ),
                  ],
                ),
                if (_error != null) ...[
                  const SizedBox(height: 18),
                  Semantics(
                    liveRegion: true,
                    child: Text(
                      _error!,
                      style: CinemaStyle.text(
                        widget.mode,
                        13,
                        color: const Color(0xFFFF7D84),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _action(
    CinemaGlyph icon,
    String text,
    String label,
    VoidCallback? action,
  ) => Padding(
    padding: const EdgeInsets.only(right: 32),
    child: CinemaPressable(
      label: label,
      onPressed: action,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CinemaIcon(icon, size: 26),
            const SizedBox(height: 9),
            Text(
              text,
              style: CinemaStyle.text(
                widget.mode,
                12,
                color: CinemaStyle.secondary,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class CinemaSearchPage extends StatefulWidget {
  const CinemaSearchPage({
    super.key,
    required this.mode,
    required this.items,
    required this.onQuery,
    required this.onOpen,
    required this.artworkBuilder,
    this.loading = false,
  });
  final MobileCinemaMode mode;
  final List<MobileMedia> items;
  final ValueChanged<String> onQuery;
  final ValueChanged<MobileMedia> onOpen;
  final MobileArtworkBuilder artworkBuilder;
  final bool loading;
  @override
  State<CinemaSearchPage> createState() => _CinemaSearchPageState();
}

class _CinemaSearchPageState extends State<CinemaSearchPage> {
  final _query = TextEditingController();
  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apple = widget.mode == MobileCinemaMode.appleTv;
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(apple ? 22 : 16, 24, 20, 20),
              child: Text(
                'Search',
                style: CinemaStyle.text(
                  widget.mode,
                  apple ? 35 : 29,
                  weight: FontWeight.w700,
                  spacing: -.8,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: apple
                  ? CupertinoSearchTextField(
                      controller: _query,
                      placeholder: 'Movies, shows, and more',
                      autofocus: true,
                      style: CinemaStyle.text(widget.mode, 17),
                      onChanged: widget.onQuery,
                    )
                  : CupertinoTextField(
                      controller: _query,
                      autofocus: true,
                      placeholder: 'Search for movies or shows',
                      style: CinemaStyle.text(widget.mode, 17),
                      placeholderStyle: CinemaStyle.text(
                        widget.mode,
                        16,
                        color: CinemaStyle.secondary,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: CinemaIcon(
                          CinemaGlyph.search,
                          color: CinemaStyle.secondary,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B2B2B),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: widget.onQuery,
                      suffix: CinemaIconButton(
                        icon: CinemaGlyph.close,
                        label: 'Clear search',
                        size: 17,
                        onPressed: () {
                          _query.clear();
                          widget.onQuery('');
                        },
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 28, 22, 16),
              child: Text(
                _query.text.isEmpty ? 'Explore your library' : 'Search results',
                style: CinemaStyle.text(
                  widget.mode,
                  apple ? 23 : 22,
                  weight: FontWeight.w700,
                ),
              ),
            ),
          ),
          if (widget.loading)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(28),
                child: CupertinoActivityIndicator(),
              ),
            ),
          if (!widget.loading && widget.items.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'No results. Try another title.',
                  style: CinemaStyle.text(
                    widget.mode,
                    16,
                    color: CinemaStyle.secondary,
                  ),
                ),
              ),
            ),
          SliverList.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              final art = item.backdropUrl ?? item.posterUrl;
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: CinemaPressable(
                  label: item.title,
                  onPressed: () => widget.onOpen(item),
                  radius: apple ? 10 : 3,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(apple ? 10 : 3),
                        child: SizedBox(
                          width: apple ? 130 : 132,
                          height: 77,
                          child: art == null
                              ? const ColoredBox(color: Color(0xFF303034))
                              : widget.artworkBuilder(
                                  context,
                                  art,
                                  BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          item.title,
                          style: CinemaStyle.text(
                            widget.mode,
                            16,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      CinemaIcon(
                        apple ? CinemaGlyph.chevron : CinemaGlyph.play,
                        size: apple ? 15 : 21,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}
