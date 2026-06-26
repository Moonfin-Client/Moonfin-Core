import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../widgets/book/discover/book_discovery_models.dart';
import 'librivox_author_books_screen.dart';

class LibrivoxAuthorsScreen extends StatelessWidget {
  final List<LibrivoxBook> books;
  final Map<String, String?> coverCache;

  const LibrivoxAuthorsScreen({
    super.key,
    required this.books,
    required this.coverCache,
  });

  @override
  Widget build(BuildContext context) {
    final authorMap = <String, List<LibrivoxBook>>{};
    for (final book in books) {
      authorMap.putIfAbsent(book.authorName, () => []).add(book);
    }
    final authors = authorMap.keys.toList()..sort();
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0F182A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.authorsCountTitle(authors.length)),
      ),
      body: ListView.builder(
        itemCount: authors.length,
        itemBuilder: (context, index) {
          final author = authors[index];
          final authorBooks = authorMap[author]!;
          final initial = author.trim().isNotEmpty
              ? author.trim()[0].toUpperCase()
              : '?';
          final avatarColor =
              audiobookPlaceholderColors[author.hashCode.abs() %
                  audiobookPlaceholderColors.length];
          return ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => LibrivoxAuthorBooksScreen(
                  author: author,
                  books: authorBooks,
                  coverCache: coverCache,
                ),
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: avatarColor,
              child: Text(
                initial,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            title: Text(
              author,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              l10n.audiobookCountLabel(authorBooks.length),
              style: const TextStyle(color: Color(0xFF9EDBFF), fontSize: 13),
            ),
            trailing: const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF5C7290),
            ),
          );
        },
      ),
    );
  }
}
