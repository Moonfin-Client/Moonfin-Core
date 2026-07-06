import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart' show GlassSettings;
import 'package:server_core/server_core.dart';

import '../../navigation/destinations.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/adaptive/adaptive_glass.dart';
import '../../widgets/focus/focusable_button.dart';
import '../../widgets/game/game_poster_rail.dart';
import '../../../util/game_library.dart';
import '../../../util/platform_detection.dart';

/// Premium, responsive game detail screen. Builds a cinematic hero from keyless libretro
/// thumbnails (in-game snapshot backdrop + box-art poster), shows the data the games API
/// exposes (system, core, size, BIOS, save state), and offers Continue/Play plus Restart.
/// Portrait on mobile, landscape on desktop/TV, with d-pad focus in leanback mode.
class GameDetailScreen extends StatefulWidget {
  const GameDetailScreen({
    super.key,
    required this.libraryId,
    required this.gameId,
  });

  final String libraryId;
  final String gameId;

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();

  bool _loading = true;
  String? _error;
  GameDetail? _game;
  bool _hasSave = false;
  List<GameSummary> _related = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final games = _client.gamesApi;
    if (games == null) {
      setState(() {
        _loading = false;
        _error = 'This server does not support games.';
      });
      return;
    }

    try {
      final game = await games.getGame(widget.libraryId, widget.gameId);
      if (!mounted) return;
      if (game == null) {
        setState(() {
          _loading = false;
          _error = 'Game not found.';
        });
        return;
      }

      setState(() {
        _game = game;
        _loading = false;
      });

      // Save state and related games are enrichments; a failure here must not block the
      // screen that already has its core data.
      _loadSave(games, game);
      _loadRelated(games, game);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Failed to load game: $e';
      });
    }
  }

  Future<void> _loadSave(GamesApi games, GameDetail game) async {
    try {
      final save = await games.getSave(game.id);
      if (!mounted) return;
      setState(() => _hasSave = save != null && save.isNotEmpty);
    } catch (_) {}
  }

  Future<void> _loadRelated(GamesApi games, GameDetail game) async {
    try {
      final all = await games.getGames(widget.libraryId, system: game.system);
      if (!mounted) return;
      setState(() {
        _related = all
            .where((g) => g.id != game.id)
            .take(20)
            .toList(growable: false);
      });
    } catch (_) {}
  }

  void _play({required bool fresh}) {
    final game = _game;
    if (game == null) return;
    if (!PlatformDetection.gamesPlaybackSupported) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).gamePlaybackUnsupported),
        ),
      );
      return;
    }
    final biosId = game.bios.isNotEmpty ? game.bios.first.id : null;
    context.push(
      Destinations.gamePlayerOf(
        widget.libraryId,
        game.id,
        core: game.core,
        biosId: biosId,
        name: game.title,
        startFresh: fresh,
      ),
    );
  }

  void _openGame(GameSummary game) {
    context.push(Destinations.gameDetailOf(widget.libraryId, game.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(_error!, textAlign: TextAlign.center),
        ),
      );
    }

    final game = _game!;
    return LayoutBuilder(
      builder: (context, constraints) {
        final tv = PlatformDetection.isTV;
        final landscape = tv || constraints.maxWidth >= 720;
        return landscape
            ? _LandscapeBody(
                game: game,
                hasSave: _hasSave,
                related: _related,
                tv: tv,
                onPlay: () => _play(fresh: false),
                onRestart: () => _play(fresh: true),
                onOpenGame: _openGame,
              )
            : _PortraitBody(
                game: game,
                hasSave: _hasSave,
                related: _related,
                onPlay: () => _play(fresh: false),
                onRestart: () => _play(fresh: true),
                onOpenGame: _openGame,
              );
      },
    );
  }
}

class _PortraitBody extends StatelessWidget {
  const _PortraitBody({
    required this.game,
    required this.hasSave,
    required this.related,
    required this.onPlay,
    required this.onRestart,
    required this.onOpenGame,
  });

  final GameDetail game;
  final bool hasSave;
  final List<GameSummary> related;
  final VoidCallback onPlay;
  final VoidCallback onRestart;
  final ValueChanged<GameSummary> onOpenGame;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 320,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _Backdrop(game: game, landscape: false),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _Poster(game: game, width: 104),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: _HeroTitle(game: game),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
            child: _MetaPills(game: game, hasSave: hasSave),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
            child: _ActionRow(
              hasSave: hasSave,
              tv: false,
              fullWidthPrimary: true,
              onPlay: onPlay,
              onRestart: onRestart,
            ),
          ),
          if (game.overview != null && game.overview!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: _OverviewBlock(text: game.overview!),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: _DetailsPanel(game: game, hasSave: hasSave),
          ),
          if (related.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 24),
              child: GamePosterRail(
                title: 'More in ${game.system}',
                games: related,
                onTapGame: onOpenGame,
              ),
            )
          else
            const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _LandscapeBody extends StatelessWidget {
  const _LandscapeBody({
    required this.game,
    required this.hasSave,
    required this.related,
    required this.tv,
    required this.onPlay,
    required this.onRestart,
    required this.onOpenGame,
  });

  final GameDetail game;
  final bool hasSave;
  final List<GameSummary> related;
  final bool tv;
  final VoidCallback onPlay;
  final VoidCallback onRestart;
  final ValueChanged<GameSummary> onOpenGame;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _Backdrop(game: game, landscape: true),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(40, 24, 40, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Poster(game: game, width: tv ? 168 : 150),
                    const SizedBox(width: 26),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _HeroTitle(game: game, large: true),
                            const SizedBox(height: 16),
                            _MetaPills(game: game, hasSave: hasSave),
                            const SizedBox(height: 20),
                            _ActionRow(
                              hasSave: hasSave,
                              tv: tv,
                              fullWidthPrimary: false,
                              onPlay: onPlay,
                              onRestart: onRestart,
                            ),
                            if (game.overview != null && game.overview!.isNotEmpty) ...[
                              const SizedBox(height: 22),
                              _OverviewBlock(text: game.overview!),
                            ],
                            const SizedBox(height: 22),
                            _DetailsPanel(game: game, hasSave: hasSave),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (related.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: GamePosterRail(
                      title: 'More in ${game.system}',
                      games: related,
                      onTapGame: onOpenGame,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Full-bleed hero image. Tries the in-game snapshot, then the title screen, then a blurred
/// box art, and finally a seeded color gradient, with scrims for text legibility.
class _Backdrop extends StatelessWidget {
  const _Backdrop({required this.game, required this.landscape});

  final GameDetail game;
  final bool landscape;

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).scaffoldBackgroundColor;
    final base = gameFallbackColor(game.id);
    final name = thumbName(game.fileName);

    final steps = <_BackdropStep>[
      if (libretroSnapUrl(game.core, name) case final u?)
        _BackdropStep(u, blur: false),
      if (libretroTitleUrl(game.core, name) case final u?)
        _BackdropStep(u, blur: false),
      if (libretroBoxartUrl(game.core, name) case final u?)
        _BackdropStep(u, blur: true),
    ];

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [base, Color.lerp(base, Colors.black, 0.55)!],
            ),
          ),
        ),
        _BackdropImage(steps: steps, index: 0),
        if (landscape)
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [bg, bg.withValues(alpha: 0.35), Colors.transparent],
                stops: const [0.30, 0.62, 0.92],
              ),
            ),
          ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                bg.withValues(alpha: landscape ? 0.4 : 0.75),
                bg,
              ],
              stops: const [0.35, 0.78, 1.0],
            ),
          ),
        ),
      ],
    );
  }
}

class _BackdropStep {
  const _BackdropStep(this.url, {required this.blur});
  final String url;
  final bool blur;
}

class _BackdropImage extends StatelessWidget {
  const _BackdropImage({required this.steps, required this.index});

  final List<_BackdropStep> steps;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (index >= steps.length) return const SizedBox.shrink();
    final step = steps[index];
    final image = CachedNetworkImage(
      imageUrl: step.url,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      fadeInDuration: const Duration(milliseconds: 250),
      errorWidget: (context, url, error) =>
          _BackdropImage(steps: steps, index: index + 1),
    );
    if (!step.blur) return image;
    final sigma = GlassSettings.capSigma(24);
    if (sigma <= 0) {
      return ColorFiltered(
        colorFilter: const ColorFilter.mode(Color(0x8C000000), BlendMode.srcOver),
        child: image,
      );
    }
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: image,
    );
  }
}

class _Poster extends StatelessWidget {
  const _Poster({required this.game, required this.width});

  final GameDetail game;
  final double width;

  @override
  Widget build(BuildContext context) {
    final url = libretroBoxartUrl(game.core, thumbName(game.fileName));
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white24),
          boxShadow: const [
            BoxShadow(color: Colors.black54, blurRadius: 18, offset: Offset(0, 8)),
          ],
        ),
        child: SizedBox(
          width: width,
          height: width * 1.34,
          child: url == null
              ? _ArtFallback(seed: game.id, iconSize: 40)
              : CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                  errorWidget: (_, _, _) => _ArtFallback(seed: game.id, iconSize: 40),
                ),
        ),
      ),
    );
  }
}

class _ArtFallback extends StatelessWidget {
  const _ArtFallback({required this.seed, required this.iconSize});

  final String seed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: gameFallbackColor(seed),
      child: Center(
        child: Icon(Icons.videogame_asset, size: iconSize, color: Colors.white70),
      ),
    );
  }
}

class _HeroTitle extends StatelessWidget {
  const _HeroTitle({required this.game, this.large = false});

  final GameDetail game;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          game.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: large ? 30 : 20,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          game.system,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        if (_metaSummary(game) case final summary?) ...[
          const SizedBox(height: 4),
          Text(
            summary,
            style: const TextStyle(color: Colors.white60, fontSize: 13),
          ),
        ],
      ],
    );
  }
}

/// A one-line "genre · year · players" summary from whatever metadata is present, or null
/// when the libretro lookup returned nothing usable.
String? _metaSummary(GameDetail game) {
  final parts = <String>[
    if (game.genre != null && game.genre!.isNotEmpty) game.genre!,
    if (game.year != null) '${game.year}',
    if (game.players != null && game.players! > 0)
      game.players == 1 ? '1 player' : '${game.players} players',
  ];
  return parts.isEmpty ? null : parts.join(' · ');
}

class _MetaPills extends StatelessWidget {
  const _MetaPills({required this.game, required this.hasSave});

  final GameDetail game;
  final bool hasSave;

  @override
  Widget build(BuildContext context) {
    final pills = <Widget>[
      if (game.region != null && game.region!.isNotEmpty) _Pill(text: game.region!),
      if (game.sizeBytes > 0) _Pill(text: _formatBytes(game.sizeBytes)),
      if (hasSave) const _Pill(text: 'Save found', accent: true),
      if (game.bios.isNotEmpty) const _Pill(text: 'BIOS required'),
    ];
    return Wrap(spacing: 7, runSpacing: 7, children: pills);
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.text, this.accent = false});

  final String text;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    final color = accent ? const Color(0xFFA9F0CC) : Colors.white;
    final bg = accent ? const Color(0x267FE0B0) : const Color(0x1AFFFFFF);
    final border = accent ? const Color(0x4D7FE0B0) : const Color(0x24FFFFFF);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.hasSave,
    required this.tv,
    required this.fullWidthPrimary,
    required this.onPlay,
    required this.onRestart,
  });

  final bool hasSave;
  final bool tv;
  final bool fullWidthPrimary;
  final VoidCallback onPlay;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    final primaryLabel = hasSave ? 'Continue' : 'Play';
    final accent = Theme.of(context).colorScheme.primary;

    if (tv) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FocusableButton(
            autofocus: true,
            focusColor: accent,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            onPressed: onPlay,
            child: _ActionLabel(
              icon: Icons.play_arrow,
              label: primaryLabel,
              color: Colors.white,
            ),
          ),
          if (hasSave) ...[
            const SizedBox(width: 12),
            FocusableButton(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              onPressed: onRestart,
              child: const _ActionLabel(
                icon: Icons.refresh,
                label: 'Restart',
                color: Colors.white,
              ),
            ),
          ],
        ],
      );
    }

    final primary = FilledButton.icon(
      onPressed: onPlay,
      icon: const Icon(Icons.play_arrow),
      label: Text(primaryLabel),
    );
    final restart = OutlinedButton.icon(
      onPressed: onRestart,
      icon: const Icon(Icons.refresh),
      label: const Text('Restart'),
    );

    if (fullWidthPrimary) {
      return Row(
        children: [
          Expanded(child: primary),
          if (hasSave) ...[const SizedBox(width: 10), restart],
        ],
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        primary,
        if (hasSave) ...[const SizedBox(width: 10), restart],
      ],
    );
  }
}

class _ActionLabel extends StatelessWidget {
  const _ActionLabel({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _OverviewBlock extends StatelessWidget {
  const _OverviewBlock({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            'Overview',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
        ),
      ],
    );
  }
}

class _DetailsPanel extends StatelessWidget {
  const _DetailsPanel({required this.game, required this.hasSave});

  final GameDetail game;
  final bool hasSave;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[
      if (game.genre != null && game.genre!.isNotEmpty)
        _DetailRow(label: 'Genre', value: game.genre!),
      if (game.developer != null && game.developer!.isNotEmpty)
        _DetailRow(label: 'Developer', value: game.developer!),
      if (game.publisher != null && game.publisher!.isNotEmpty)
        _DetailRow(label: 'Publisher', value: game.publisher!),
      if (game.franchise != null && game.franchise!.isNotEmpty)
        _DetailRow(label: 'Franchise', value: game.franchise!),
      if (game.year != null) _DetailRow(label: 'Year', value: '${game.year}'),
      if (game.region != null && game.region!.isNotEmpty)
        _DetailRow(label: 'Region', value: game.region!),
      if (game.rating != null)
        _DetailRow(label: 'Rating', value: '${game.rating!.toStringAsFixed(1)} / 5'),
      _DetailRow(label: 'File', value: game.fileName),
      if (game.sizeBytes > 0)
        _DetailRow(label: 'Size', value: _formatBytes(game.sizeBytes)),
      _DetailRow(label: 'Core', value: game.core),
      _DetailRow(label: 'Save state', value: hasSave ? 'Found' : 'None'),
      if (game.bios.isNotEmpty)
        _DetailRow(
          label: 'BIOS',
          value: game.bios.map((b) => b.fileName).join(', '),
        ),
    ];

    return adaptiveGlass(
      context: context,
      fallbackColor: const Color(0x14FFFFFF),
      cornerRadius: 14,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rows,
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 96,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white60, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

String _formatBytes(int bytes) {
  if (bytes <= 0) return '';
  const units = ['B', 'KB', 'MB', 'GB'];
  var size = bytes.toDouble();
  var unit = 0;
  while (size >= 1024 && unit < units.length - 1) {
    size /= 1024;
    unit++;
  }
  final rounded = (size >= 10 || unit == 0) ? size.toStringAsFixed(0) : size.toStringAsFixed(1);
  return '$rounded ${units[unit]}';
}
