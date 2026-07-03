import 'package:cached_network_image/cached_network_image.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:flutter/material.dart';

import '../../../../util/platform_detection.dart';
import '../../../widgets/book/discover/book_discovery_models.dart';
import 'librivox_book_detail_screen.dart';

class LibrivoxAuthorBooksScreen extends StatelessWidget {
  final String author;
  final List<LibrivoxBook> books;
  final Map<String, String?> coverCache;

  const LibrivoxAuthorBooksScreen({
    super.key,
    required this.author,
    required this.books,
    required this.coverCache,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile =
        PlatformDetection.useMobileUi || MediaQuery.sizeOf(context).width < 600;
    return Scaffold(
      backgroundColor: const Color(0xFF0F182A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(author, overflow: TextOverflow.ellipsis),
      ),
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(
          isMobile ? 16 : 24,
          8,
          isMobile ? 16 : 24,
          24,
        ),
        itemCount: books.length,
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final book = books[index];
          final coverUrl = coverCache[book.id];
          final colorIndex =
              book.id.hashCode.abs() % audiobookPlaceholderColors.length;
          final placeholderColor = audiobookPlaceholderColors[colorIndex];
          return InkWell(
            borderRadius: AppRadius.circular(12),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => LibrivoxBookDetailScreen(
                  book: book,
                  coverUrl: coverUrl,
                  allBooks: books,
                  coverCache: coverCache,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1A2740),
                borderRadius: AppRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: AppRadius.circular(8),
                    child: SizedBox(
                      width: 60,
                      height: 90,
                      child: coverUrl != null
                          ? CachedNetworkImage(
                              imageUrl: coverUrl,
                              fit: BoxFit.cover,
                              errorWidget: (_, _, _) => Container(
                                color: placeholderColor,
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.headphones_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            )
                          : Container(
                              color: placeholderColor,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.headphones_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        if (book.formattedDuration.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            book.formattedDuration,
                            style: const TextStyle(
                              color: Color(0xFF9EDBFF),
                              fontSize: 13,
                            ),
                          ),
                        ],
                        if (book.genres.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            book.genres.take(2).join(' · '),
                            style: const TextStyle(
                              color: Color(0xFF5C7290),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF5C7290),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
