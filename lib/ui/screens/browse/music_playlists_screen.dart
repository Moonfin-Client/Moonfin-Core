import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/viewmodels/music_browse_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../../util/playback_time_label.dart';
import '../../navigation/destinations.dart';
import '../../widgets/music/music_navigation.dart';
import '../../widgets/music/music_widgets.dart';
import 'music_category_screen.dart';

/// The music playlists as a list. Wide screens show the focused playlist
/// beside it with its songs, phones open the playlist instead.
class MusicPlaylistsScreen extends StatefulWidget {
  final String libraryId;

  const MusicPlaylistsScreen({super.key, required this.libraryId});

  @override
  State<MusicPlaylistsScreen> createState() => _MusicPlaylistsScreenState();
}

class _MusicPlaylistsScreenState
    extends MusicCategoryState<MusicPlaylistsScreen> {
  bool _loading = true;
  List<AggregatedItem> _playlists = const [];

  /// The playlist shown beside the list and its songs.
  int _shown = 0;
  List<AggregatedItem> _tracks = const [];
  bool _tracksLoading = false;
  int _tracksRequest = 0;
  Timer? _showTimer;

  @override
  String get libraryId => widget.libraryId;

  @override
  bool get isLoading => _loading;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  @override
  void dispose() {
    _showTimer?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      _playlists = await queries.playlists();
    } catch (e) {
      debugPrint('Failed to load the music playlists: $e');
    }
    if (!mounted) return;
    _loading = false;
    if (wide && _playlists.isNotEmpty) {
      _show(_shown.clamp(0, _playlists.length - 1));
    }
    contentChanged();
  }

  /// Shows the playlist at [index] once focus rests on it, so stepping
  /// through the list doesn't load every playlist on the way.
  void _showSoon(int index) {
    _showTimer?.cancel();
    if (index == _shown) return;
    _showTimer = Timer(const Duration(milliseconds: 250), () => _show(index));
  }

  void _show(int index) {
    _showTimer?.cancel();
    final request = ++_tracksRequest;
    setState(() {
      _shown = index;
      _tracks = const [];
      _tracksLoading = true;
    });
    unawaited(() async {
      List<AggregatedItem> tracks = const [];
      try {
        tracks = await queries.playlistTracks(_playlists[index].id);
      } catch (e) {
        debugPrint('Failed to load the playlist songs: $e');
      }
      if (!mounted || request != _tracksRequest) return;
      setState(() {
        _tracks = tracks;
        _tracksLoading = false;
      });
    }());
  }

  void _open(AggregatedItem playlist) => context.push(
    Destinations.item(playlist.id, serverId: playlist.serverId),
  );

  String _summary(AppLocalizations l10n, AggregatedItem playlist) {
    final count = playlist.childCount ?? 0;
    final runtime = playlist.runtime ?? Duration.zero;
    return [
      if (count > 0) l10n.musicSongCount(count),
      if (runtime > Duration.zero) formatRuntimeShort(runtime),
    ].join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return buildCategoryPage(
      () => buildSections(
        () => _addSections(l10n),
        onRefresh: _load,
        header: () => buildHeader(
          title: l10n.playlists,
          count: _playlists.isEmpty
              ? null
              : l10n.musicPlaylistCount(_playlists.length),
        ),
        body: wide && _playlists.isNotEmpty
            ? (list, _) => Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(width: inset + 380, child: list),
                  const SizedBox(width: 36),
                  Expanded(child: _buildDetail(l10n)),
                ],
              )
            : null,
      ),
    );
  }

  void _addSections(AppLocalizations l10n) {
    if (_loading) {
      addLoadingSection();
      return;
    }
    if (_playlists.isEmpty) {
      addSection(emptyMessage(l10n));
      return;
    }
    final stop = addStop(
      RowFocusEntry.node(node('playlist:0'), containerKey: sectionKey('list')),
    );
    for (var i = 0; i < _playlists.length; i++) {
      final playlist = _playlists[i];
      addSection(
        Padding(
          key: i == 0 ? sectionKey('list') : null,
          padding: EdgeInsets.fromLTRB(inset, i == 0 ? 12 : 0, wide ? 0 : endInset, 2),
          child: MusicTrackTile(
            title: playlist.name,
            subtitle: _summary(l10n, playlist),
            imageUrl: musicImageUrl(playlist, maxHeight: 160),
            highlighted: wide && i == _shown,
            focusNode: node('playlist:$i'),
            onFocus: wide ? () => _showSoon(i) : null,
            onTap: () {
              if (!wide) {
                _open(playlist);
                return;
              }
              if (i != _shown) _show(i);
              node('detail:play').requestFocus();
            },
            edges: MusicGridEdges(
              up: i == 0 ? () => move(stop, true) : null,
              down: i == _playlists.length - 1 ? () {} : null,
              left: leaveLeft,
            ),
            onNavigateRight: wide ? node('detail:play').requestFocus : null,
          ),
        ),
      );
    }
  }

  Widget _buildDetail(AppLocalizations l10n) {
    final playlist = _playlists[_shown.clamp(0, _playlists.length - 1)];
    final onSurface = AppColorScheme.onSurface;
    void back() => node('playlist:$_shown').requestFocus();
    void down() {
      if (_tracks.isNotEmpty) node('detailTrack:0').requestFocus();
    }

    return ListView(
      padding: EdgeInsets.fromLTRB(0, 12, endInset, 48),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 200,
              height: 200,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: AppRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.45),
                    blurRadius: 40,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: musicArt(
                musicImageUrl(playlist, maxHeight: 400),
                icon: Icons.queue_music,
              ),
            ),
            const SizedBox(width: 28),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.playlist.toUpperCase(), style: musicEyebrowStyle()),
                  const SizedBox(height: 6),
                  Text(
                    playlist.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                      color: onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _summary(l10n, playlist),
                    style: TextStyle(
                      fontSize: 15,
                      color: onSurface.withValues(alpha: 0.75),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      MusicPillButton(
                        focusNode: node('detail:play'),
                        icon: Icons.play_arrow_rounded,
                        label: l10n.play,
                        primary: true,
                        onTap: () => unawaited(playMusicTracks(context, _tracks)),
                        onNavigateLeft: back,
                        onNavigateDown: down,
                      ),
                      MusicPillButton(
                        focusNode: node('detail:shuffle'),
                        icon: Icons.shuffle_rounded,
                        label: l10n.shuffle,
                        onTap: () => unawaited(
                          playMusicTracks(context, List.of(_tracks)..shuffle()),
                        ),
                        onNavigateDown: down,
                      ),
                      MusicPillButton(
                        focusNode: node('detail:open'),
                        icon: Icons.queue_music_rounded,
                        label: l10n.openPlaylist,
                        onTap: () => _open(playlist),
                        onNavigateDown: down,
                        onNavigateRight: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        if (_tracksLoading)
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          )
        else
          for (var i = 0; i < _tracks.length; i++)
            MusicTrackTile(
              title: _tracks[i].name,
              subtitle: musicArtistNames(_tracks[i]),
              imageUrl: musicImageUrl(_tracks[i], maxHeight: 120),
              trailing: musicRunTime(_tracks[i]),
              focusNode: node('detailTrack:$i'),
              onTap: () => unawaited(
                playMusicTracks(context, _tracks, startIndex: i),
              ),
              edges: MusicGridEdges(
                up: i == 0 ? node('detail:play').requestFocus : null,
                down: i == _tracks.length - 1 ? () {} : null,
                left: back,
              ),
              onNavigateRight: () {},
            ),
      ],
    );
  }
}
