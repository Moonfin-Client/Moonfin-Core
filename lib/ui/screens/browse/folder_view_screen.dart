import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../data/models/aggregated_library.dart';
import '../../../data/repositories/user_views_repository.dart';
import '../../navigation/destinations.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/navigation_layout.dart';

class FolderViewScreen extends StatefulWidget {
  const FolderViewScreen({super.key});

  @override
  State<FolderViewScreen> createState() => _FolderViewScreenState();
}

class _FolderViewScreenState extends State<FolderViewScreen> {
  late Future<List<AggregatedLibrary>> _viewsFuture;

  @override
  void initState() {
    super.initState();
    _viewsFuture = GetIt.instance<UserViewsRepository>().getUserViews();
  }

  IconData _iconForCollection(String collectionType) {
    switch (collectionType.toLowerCase()) {
      case 'movies':
        return Icons.movie;
      case 'tvshows':
        return Icons.tv;
      case 'music':
        return Icons.music_note;
      case 'books':
        return Icons.book;
      case 'photos':
        return Icons.photo;
      case 'homevideos':
        return Icons.videocam;
      case 'livetv':
        return Icons.live_tv;
      case 'playlists':
        return Icons.playlist_play;
      case 'boxsets':
        return Icons.collections_bookmark;
      default:
        return Icons.folder_rounded;
    }
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        showBackButton: true,
        child: SafeArea(
          child: FutureBuilder<List<AggregatedLibrary>>(
            future: _viewsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    AppLocalizations.of(context).failedToLoadLibraries,
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withAlpha(179),
                    ),
                  ),
                );
              }

              final views = snapshot.data ?? [];
              if (views.isEmpty) {
                return Center(
                  child: Text(
                    AppLocalizations.of(context).noLibrariesFound,
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withAlpha(179),
                    ),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(top: 80, bottom: 32),
                itemCount: views.length,
                itemBuilder: (context, index) {
                  final lib = views[index];
                  return ListTile(
                    leading: Icon(
                      _iconForCollection(lib.collectionType),
                      color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                      size: 28,
                    ),
                    title: Text(
                      lib.name,
                      style: TextStyle(
                        color: AppColorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      lib.collectionType.isNotEmpty ? lib.collectionType : AppLocalizations.of(context).library,
                      style: TextStyle(
                        color: AppColorScheme.onSurface.withAlpha(128),
                        fontSize: 13,
                      ),
                    ),
                    onTap: () => context.push(
                      Destinations.folder(lib.id, serverId: lib.serverId),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
