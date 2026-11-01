import 'package:flutter/cupertino.dart';
import 'package:moonfin_mobile_ui/moonfin_mobile_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'catalog.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  runApp(MoonfinShowcase(preferences: preferences));
}

class MoonfinShowcase extends StatelessWidget {
  const MoonfinShowcase({super.key, required this.preferences});
  final SharedPreferences preferences;
  @override
  Widget build(BuildContext context) => CupertinoApp(
    title: 'Moonfin · Your cinema',
    debugShowCheckedModeBanner: false,
    theme: const CupertinoThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: CinemaStyle.black,
      primaryColor: CinemaStyle.blue,
    ),
    home: _ShowcaseHome(preferences: preferences),
  );
}

class _ShowcaseHome extends StatefulWidget {
  const _ShowcaseHome({required this.preferences});
  final SharedPreferences preferences;
  @override
  State<_ShowcaseHome> createState() => _ShowcaseHomeState();
}

class _ShowcaseHomeState extends State<_ShowcaseHome> {
  late MobileCinemaMode _mode;
  late final Set<String> _saved;
  CinemaDestination _destination = CinemaDestination.home;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _mode = MobileCinemaMode.fromPreference(
      Uri.base.queryParameters['mode'] ??
          widget.preferences.getString('mode') ??
          'appleTv',
    );
    _saved =
        widget.preferences.getStringList('saved')?.toSet() ??
        demoCatalog.where((item) => item.saved).map((item) => item.id).toSet();
  }

  Future<void> _setMode(MobileCinemaMode value) async {
    setState(() => _mode = value);
    await widget.preferences.setString('mode', value.name);
  }

  List<MobileMediaRail> get _rails => [
    MobileMediaRail(
      id: 'resume',
      title: _mode == MobileCinemaMode.appleTv
          ? 'Up Next'
          : 'Continue Watching',
      continueWatching: true,
      items: demoCatalog
          .where((item) => item.progress > 0)
          .map(_withSaved)
          .toList(),
    ),
    MobileMediaRail(
      id: 'tonight',
      title: _mode == MobileCinemaMode.appleTv
          ? 'What to Watch'
          : 'Your top picks',
      ranked: true,
      items: demoCatalog.map(_withSaved).toList(),
    ),
    MobileMediaRail(
      id: 'series',
      title: _mode == MobileCinemaMode.appleTv
          ? 'Can’t-Miss Series'
          : 'TV Shows You’ll Love',
      items: demoCatalog
          .where((item) => item.kind == MobileMediaKind.series)
          .map(_withSaved)
          .toList(),
    ),
    MobileMediaRail(
      id: 'movies',
      title: _mode == MobileCinemaMode.appleTv
          ? 'A Night at the Movies'
          : 'Epic Movie Nights',
      items: demoCatalog
          .where((item) => item.kind == MobileMediaKind.movie)
          .map(_withSaved)
          .toList(),
    ),
  ];

  Future<void> _save(MobileMedia item, bool saved) async {
    setState(() {
      if (saved) {
        _saved.add(item.id);
      } else {
        _saved.remove(item.id);
      }
    });
    await widget.preferences.setStringList('saved', _saved.toList());
  }

  Widget _artwork(BuildContext context, String url, BoxFit fit) => Image.asset(
    url,
    fit: fit,
    errorBuilder: (_, _, _) =>
        const Center(child: CinemaIcon(CinemaGlyph.library, size: 32)),
  );

  void _details(MobileMedia item) => showCinemaDetails(
    context,
    mode: _mode,
    item: _withSaved(item),
    artworkBuilder: _artwork,
    onPlay: () => _play(item),
    onSave: (saved) => _save(item, saved),
  );

  void _play(MobileMedia item) => Navigator.of(context).push(
    CupertinoPageRoute<void>(
      builder: (context) => CupertinoPageScaffold(
        backgroundColor: CinemaStyle.black,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CinemaIconButton(
                      icon: CinemaGlyph.back,
                      label: 'Back',
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Playback preview',
                      style: CinemaStyle.text(_mode, 17),
                    ),
                  ],
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    _mode == MobileCinemaMode.appleTv ? 18 : 4,
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: _artwork(context, item.backdropUrl!, BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 26),
                Text(
                  item.title,
                  style: CinemaStyle.text(_mode, 32, weight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                Text(
                  'Playback starts from your connected media server in Moonfin. This preview lets you explore the interface.',
                  style: CinemaStyle.text(
                    _mode,
                    16,
                    height: 1.5,
                    color: CinemaStyle.secondary,
                  ),
                ),
                const SizedBox(height: 28),
                CinemaButton(
                  mode: _mode,
                  label: 'Back to browsing',
                  onPressed: () => Navigator.pop(context),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final apple = _mode == MobileCinemaMode.appleTv;
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF101012),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: ColoredBox(
            color: CinemaStyle.black,
            child: DefaultTextStyle(
              style: CinemaStyle.text(_mode, 15),
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: apple
                        ? 0
                        : 70 + MediaQuery.paddingOf(context).bottom,
                    child: _page(),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: CinemaNavigationBar(
                      mode: _mode,
                      selected: _destination,
                      onSelected: (value) =>
                          setState(() => _destination = value),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _page() => switch (_destination) {
    CinemaDestination.home => MobileCinemaHome(
      mode: _mode,
      rails: _rails,
      featured: [
        demoCatalog.first,
        demoCatalog[1],
        demoCatalog[5],
      ].map(_withSaved).toList(),
      onModeChanged: _setMode,
      onOpen: _details,
      onPlay: _play,
      onSearch: () => setState(() => _destination = CinemaDestination.search),
      onProfile: () => setState(() => _destination = CinemaDestination.profile),
      onRefresh: () async {},
      onSave: _save,
      artworkBuilder: _artwork,
      bottomPadding: _mode == MobileCinemaMode.appleTv ? 110 : 24,
    ),
    CinemaDestination.search => CinemaSearchPage(
      mode: _mode,
      items: demoCatalog
          .where(
            (item) => item.title.toLowerCase().contains(_query.toLowerCase()),
          )
          .toList(),
      onQuery: (value) => setState(() => _query = value),
      onOpen: _details,
      artworkBuilder: _artwork,
    ),
    CinemaDestination.downloads => _downloads(),
    CinemaDestination.library => _library(),
    CinemaDestination.profile => _profile(),
  };

  Widget _profile() => SafeArea(
    bottom: false,
    child: ListView(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 120),
      children: [
        Text(
          _mode == MobileCinemaMode.appleTv ? 'Account' : 'My Moonfin',
          style: CinemaStyle.text(
            _mode,
            34,
            weight: FontWeight.w700,
            spacing: -.8,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            CinemaAvatar(size: 58, apple: _mode == MobileCinemaMode.appleTv),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                'Your cinema',
                style: CinemaStyle.text(_mode, 24, weight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 38),
        Text(
          'Appearance',
          style: CinemaStyle.text(_mode, 23, weight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        for (final mode in MobileCinemaMode.values)
          CinemaPressable(
            label: '${mode.label} mode',
            selected: _mode == mode,
            onPressed: () => _setMode(mode),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mode.label,
                          style: CinemaStyle.text(
                            _mode,
                            18,
                            weight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          mode == MobileCinemaMode.appleTv
                              ? 'Editorial browsing. Quietly cinematic.'
                              : 'Your next obsession, front and center.',
                          style: CinemaStyle.text(
                            _mode,
                            13,
                            color: CinemaStyle.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_mode == mode)
                    CinemaIcon(
                      CinemaGlyph.check,
                      color: _mode == MobileCinemaMode.appleTv
                          ? CinemaStyle.blue
                          : CinemaStyle.red,
                    ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 28),
        Row(
          children: [
            Expanded(
              child: Text(
                'My List',
                style: CinemaStyle.text(_mode, 23, weight: FontWeight.w700),
              ),
            ),
            Text(
              '${_saved.length} titles',
              style: CinemaStyle.text(_mode, 13, color: CinemaStyle.secondary),
            ),
          ],
        ),
        const SizedBox(height: 18),
        for (final item in demoCatalog.where(
          (item) => _saved.contains(item.id),
        ))
          _libraryItem(item),
        if (_saved.isEmpty)
          Text(
            'Add a title to make it yours.',
            style: CinemaStyle.text(_mode, 15, color: CinemaStyle.secondary),
          ),
      ],
    ),
  );

  Widget _library() => SafeArea(
    bottom: false,
    child: ListView(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 120),
      children: [
        Text(
          'Library',
          style: CinemaStyle.text(
            _mode,
            35,
            weight: FontWeight.w700,
            spacing: -.8,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Your collection, all together.',
          style: CinemaStyle.text(_mode, 15, color: CinemaStyle.secondary),
        ),
        const SizedBox(height: 25),
        for (final item in demoCatalog) _libraryItem(item),
      ],
    ),
  );

  Widget _libraryItem(MobileMedia item) => Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: CinemaPressable(
      label: item.title,
      onPressed: () => _details(item),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              _mode == MobileCinemaMode.appleTv ? 8 : 3,
            ),
            child: SizedBox(
              width: 60,
              height: 86,
              child: _artwork(context, item.posterUrl!, BoxFit.cover),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: CinemaStyle.text(_mode, 17, weight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(
                  item.subtitle,
                  style: CinemaStyle.text(
                    _mode,
                    12,
                    color: CinemaStyle.secondary,
                  ),
                ),
              ],
            ),
          ),
          const CinemaIcon(
            CinemaGlyph.chevron,
            size: 14,
            color: CinemaStyle.secondary,
          ),
        ],
      ),
    ),
  );

  Widget _downloads() => SafeArea(
    bottom: false,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(24, 26, 24, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Downloads',
            style: CinemaStyle.text(
              _mode,
              34,
              weight: FontWeight.w700,
              spacing: -.8,
            ),
          ),
          const Spacer(),
          const Center(
            child: CinemaIcon(
              CinemaGlyph.download,
              size: 64,
              color: CinemaStyle.secondary,
            ),
          ),
          const SizedBox(height: 28),
          Center(
            child: Text(
              'Your stories. To go.',
              style: CinemaStyle.text(_mode, 26, weight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Downloaded titles from your server will appear here, ready whenever you are.',
            textAlign: TextAlign.center,
            style: CinemaStyle.text(
              _mode,
              16,
              color: CinemaStyle.secondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: CinemaButton(
              mode: _mode,
              label: 'Find something to watch',
              onPressed: () =>
                  setState(() => _destination = CinemaDestination.home),
            ),
          ),
          const Spacer(),
        ],
      ),
    ),
  );

  MobileMedia _withSaved(MobileMedia item) => MobileMedia(
    id: item.id,
    title: item.title,
    subtitle: item.subtitle,
    overview: item.overview,
    metadata: item.metadata,
    posterUrl: item.posterUrl,
    backdropUrl: item.backdropUrl,
    logoUrl: item.logoUrl,
    titleArt: item.titleArt,
    titleArtSubtitle: item.titleArtSubtitle,
    kind: item.kind,
    progress: item.progress,
    saved: _saved.contains(item.id),
  );
}
