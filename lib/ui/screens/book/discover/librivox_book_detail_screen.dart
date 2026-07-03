import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../util/platform_detection.dart';
import '../../../widgets/book/discover/book_discovery_models.dart';
import 'librivox_author_books_screen.dart';

class LibrivoxBookDetailScreen extends StatelessWidget {
  final LibrivoxBook book;
  final String? coverUrl;
  final List<LibrivoxBook> allBooks;
  final Map<String, String?> coverCache;

  const LibrivoxBookDetailScreen({
    super.key,
    required this.book,
    required this.allBooks,
    required this.coverCache,
    this.coverUrl,
  });

  Future<void> _openExternal(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final colorIndex =
        book.id.hashCode.abs() % audiobookPlaceholderColors.length;
    final accent = audiobookPlaceholderColors[colorIndex];
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0F182A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.audiobookDetails),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: AppRadius.circular(14),
                    child: SizedBox(
                      width: 120,
                      height: 180,
                      child: coverUrl != null
                          ? CachedNetworkImage(
                              imageUrl: coverUrl!,
                              fit: BoxFit.cover,
                              errorWidget: (_, _, _) =>
                                  _buildCoverFallback(accent),
                            )
                          : _buildCoverFallback(accent),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            final authorBooks = allBooks
                                .where((b) => b.authorName == book.authorName)
                                .toList();
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => LibrivoxAuthorBooksScreen(
                                  author: book.authorName,
                                  books: authorBooks.isNotEmpty
                                      ? authorBooks
                                      : [book],
                                  coverCache: coverCache,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            book.authorName,
                            style: const TextStyle(
                              color: Color(0xFF9EDBFF),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF9EDBFF),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: [
                            if (book.formattedDuration.isNotEmpty)
                              _buildDetailChip(book.formattedDuration),
                            if ((book.language ?? '').isNotEmpty)
                              _buildDetailChip(book.language!),
                            if ((book.sectionCount ?? 0) > 0)
                              _buildDetailChip(
                                l10n.sectionCountLabel(book.sectionCount!),
                              ),
                            if ((book.copyrightYear ?? 0) > 0)
                              _buildDetailChip('${book.copyrightYear}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Text(
                l10n.overview,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                (book.description ?? '').trim().isEmpty
                    ? l10n.noLibrivoxDescription
                    : book.description!.trim(),
                style: const TextStyle(
                  color: Color(0xFFD7E8F6),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              if (book.genres.isNotEmpty) ...[
                const SizedBox(height: 20),
                Text(
                  l10n.genres,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: book.genres
                      .take(20)
                      .map(
                        (genre) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeRegistry.active.borders.chipBackground,
                            borderRadius:
                                ThemeRegistry.active.borders.chipRadius,
                            border: Border.fromBorderSide(
                              ThemeRegistry.active.borders.chipBorder,
                            ),
                          ),
                          child: Text(
                            genre,
                            style: const TextStyle(
                              color: Color(0xFFD7E8F6),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
              if (book.readerNames.isNotEmpty) ...[
                const SizedBox(height: 20),
                Text(
                  l10n.readers,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  book.readerNames.join(', '),
                  style: const TextStyle(
                    color: Color(0xFFD7E8F6),
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Text(
                l10n.openLinks,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  if ((book.librivoxUrl ?? '').isNotEmpty)
                    ElevatedButton.icon(
                      onPressed: () => _openExternal(book.librivoxUrl!),
                      icon: const Icon(Icons.open_in_new_rounded),
                      label: Text(l10n.librivoxPage),
                    ),
                  if ((book.archiveUrl ?? '').isNotEmpty)
                    ElevatedButton.icon(
                      onPressed: () => _openExternal(book.archiveUrl!),
                      icon: const Icon(Icons.archive_rounded),
                      label: Text(l10n.internetArchive),
                    ),
                  if ((book.rssUrl ?? '').isNotEmpty)
                    ElevatedButton.icon(
                      onPressed: () => _openExternal(book.rssUrl!),
                      icon: const Icon(Icons.rss_feed_rounded),
                      label: Text(l10n.rssFeed),
                    ),
                  if (!PlatformDetection.isTV && (book.zipUrl ?? '').isNotEmpty)
                    ElevatedButton.icon(
                      onPressed: () => _openExternal(book.zipUrl!),
                      icon: const Icon(Icons.download_rounded),
                      label: Text(l10n.downloadZip),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(44),
        borderRadius: AppRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildCoverFallback(Color accent) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accent, accent.withAlpha(165)],
        ),
      ),
      alignment: Alignment.center,
      child: const Icon(Icons.headphones_rounded, color: Colors.white, size: 40),
    );
  }
}
