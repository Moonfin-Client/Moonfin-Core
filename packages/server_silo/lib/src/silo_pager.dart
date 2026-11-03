import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import 'silo_problem.dart';

/// Silo's largest page (`limit` maximum on its list endpoints).
const siloMaxPageSize = 200;

/// One page of a Silo list answer (`CatalogBrowseCollection` and its kin).
class SiloPage {
  const SiloPage({
    required this.items,
    this.nextCursor,
    this.windowCursor,
    this.hasMore = false,
    this.total,
    this.totalExact = false,
  });

  /// Reads a list answer: `items`, `page.next_cursor`, `page.has_more`,
  /// `window_cursor`, `total`, `total_exact`.
  factory SiloPage.fromJson(Map<String, dynamic> json) {
    final page = asJsonMap(json['page']);
    final next = page?['next_cursor'];
    final window = json['window_cursor'];
    final total = json['total'];
    final items = json['items'];
    return SiloPage(
      items: items is List
          ? [
              for (final i in items)
                if (asJsonMap(i) case final map?) map,
            ]
          : const [],
      nextCursor: next is String && next.isNotEmpty ? next : null,
      windowCursor: window is String && window.isNotEmpty ? window : null,
      hasMore: page?['has_more'] == true,
      total: total is num ? total.toInt() : null,
      totalExact: json['total_exact'] == true,
    );
  }

  final List<Map<String, dynamic>> items;

  /// Cursor for the page after this one, or null on the last page.
  final String? nextCursor;

  /// Seed for jumping anywhere in the same result with `seek`.
  final String? windowCursor;

  final bool hasMore;

  /// Items in the whole result: exact when [totalExact], else an estimate.
  final int? total;
  final bool totalExact;
}

/// Fetches one page: no [cursor] for the first page, [cursor] alone for the
/// next one, and [cursor] (the window cursor) with [seek] to jump to an
/// offset.
/// [limit] is at most [siloMaxPageSize].
typedef SiloPageFetch =
    Future<SiloPage> Function({String? cursor, int? seek, required int limit});

/// What [SiloPager.page] returns: the items from `startIndex` on and the
/// result's total, as Moonfin's `TotalRecordCount`.
class SiloPagedResult {
  const SiloPagedResult(this.items, this.totalRecordCount);

  final List<Map<String, dynamic>> items;
  final int totalRecordCount;
}

/// Turns Moonfin's offset paging (`startIndex`, `limit`) into Silo's cursors.
///
/// Silo has no offset parameter. A first page returns a `next_cursor` for
/// the page after it, and a `window_cursor` that, sent with `seek=<offset>`,
/// jumps anywhere in the same result.
///
/// **Silo signs every cursor over the whole query, `limit` included**: a
/// cursor is only accepted with the same `limit` as the request that issued
/// it (server `listCatalogItems`, `CursorScope.Filter`). Moonfin asks for
/// pages of every size (75 first, 48 per scroll, hundreds for a jump), so
/// the pager never passes those on. It asks Silo for pages of one fixed size,
/// [pageSize], and serves Moonfin's ranges from what it fetched, keeping the
/// pages it fetched last (requests that changed `limit` were refused as
/// `invalid_cursor`).
///
/// Per query [signature] it remembers the window cursor, the next cursor and
/// where it points, and the last pages, and picks the cheapest request:
///
/// - offset 0: a plain first request
/// - one page from where the last page ended: `cursor=next_cursor`
/// - anywhere else, or more than one page: `cursor=window_cursor&seek=`,
///   up to [parallelRequests] pages at once. With no window cursor yet, the
///   first page is fetched to get one, and with none at all, next cursors
///   are followed from the start.
///
/// An offset at or past an exact total answers empty without a request.
/// When Silo rejects a cursor (it expired, or the server restarted) the
/// remembered state is dropped and the request is made again from the start,
/// once.
class SiloPager {
  SiloPager({
    this.maxEntries = 32,
    this.pageSize = 100,
    this.parallelRequests = 4,
    this.keptPages = 8,
    bool Function(Object error)? isInvalidCursor,
  }) : assert(pageSize > 0 && pageSize <= siloMaxPageSize),
       _isInvalidCursor = isInvalidCursor ?? isSiloInvalidCursorError;

  /// How many query signatures are remembered. The least recently used is
  /// forgotten first.
  final int maxEntries;

  /// The `limit` of every request to Silo.
  final int pageSize;

  /// How many pages a large request fetches at once (by `seek`).
  final int parallelRequests;

  /// How many fetched pages are kept per query to serve later ranges.
  final int keptPages;

  final bool Function(Object error) _isInvalidCursor;

  final LinkedHashMap<String, _PagerState> _states = LinkedHashMap();

  /// Number of query signatures remembered.
  int get length => _states.length;

  /// Forgets every remembered cursor, as after a library change.
  void clear() => _states.clear();

  /// Items [startIndex] to [startIndex] + [limit] of the query [signature]
  /// (see [siloPageSignature]), fetched with [fetch]. A null [limit] means
  /// one page of Silo's default size (50).
  Future<SiloPagedResult> page({
    required String signature,
    required int startIndex,
    int? limit,
    required SiloPageFetch fetch,
  }) async {
    final start = startIndex < 0 ? 0 : startIndex;
    final wanted = limit == null || limit <= 0 ? 50 : limit;
    try {
      return await _page(signature, start, wanted, fetch);
    } catch (error) {
      if (!_isInvalidCursor(error)) rethrow;
      _states.remove(signature);
      return _page(signature, start, wanted, fetch);
    }
  }

  Future<SiloPagedResult> _page(
    String signature,
    int start,
    int wanted,
    SiloPageFetch fetch,
  ) async {
    final state = _states.remove(signature) ?? _PagerState(keptPages);
    _states[signature] = state;
    while (_states.length > maxEntries) {
      _states.remove(_states.keys.first);
    }

    final end = start + wanted;
    final items = <Map<String, dynamic>>[];
    var pos = start;
    while (pos < end) {
      if (state.knownEnd case final last? when pos >= last) break;

      // What the kept pages already hold.
      final kept = state.itemsAt(pos, end - pos);
      if (kept.isNotEmpty) {
        items.addAll(kept);
        pos += kept.length;
        continue;
      }

      if (pos == 0) {
        state.add(0, await fetch(limit: pageSize));
      } else if (state.nextStart == pos &&
          state.nextCursor != null &&
          (end - pos <= pageSize || state.windowCursor == null)) {
        state.add(pos, await fetch(cursor: state.nextCursor, limit: pageSize));
      } else if (state.windowCursor case final window?) {
        await _seek(state, window, pos, end, fetch);
      } else if (!state.started) {
        // The first page brings the window cursor (and maybe the range).
        state.add(0, await fetch(limit: pageSize));
      } else if (state.nextCursor != null && state.nextStart < pos) {
        // No window cursor: walk the next cursors forward.
        final from = state.nextStart;
        final walked = await fetch(cursor: state.nextCursor, limit: pageSize);
        state.add(from, walked);
        if (walked.items.isEmpty) {
          state.knownEnd ??= from;
          break;
        }
      } else if (pos < state.nextStart) {
        // Behind the walk, with no way to seek: start over from the top.
        _states[signature] = _PagerState(keptPages);
        return _page(signature, start, wanted, fetch);
      } else {
        // Nothing left to follow.
        state.knownEnd ??= pos;
        break;
      }
      // A page that brought nothing for this offset, though Silo claims
      // more, ends the range rather than asking again forever.
      if (state.fetchedAt(pos) && state.itemsAt(pos, 1).isEmpty) {
        state.knownEnd ??= pos;
        break;
      }
    }
    return SiloPagedResult(items, state.totalFor(start + items.length));
  }

  /// Fetches the pages from [pos] toward [end] by `seek`, a few at once.
  Future<void> _seek(
    _PagerState state,
    String window,
    int pos,
    int end,
    SiloPageFetch fetch,
  ) async {
    final offsets = <int>[];
    for (
      var at = pos;
      at < end && offsets.length < parallelRequests;
      at += pageSize
    ) {
      if (state.knownEnd case final last? when at >= last) break;
      offsets.add(at);
    }
    final pages = await Future.wait([
      for (final at in offsets)
        fetch(cursor: window, seek: at, limit: pageSize),
    ]);
    for (var i = 0; i < pages.length; i++) {
      state.add(offsets[i], pages[i]);
    }
  }
}

/// What the pager remembers about one query.
class _PagerState {
  _PagerState(this._keep);

  bool started = false;
  String? windowCursor;
  String? nextCursor;
  int nextStart = 0;
  int? total;
  bool totalExact = false;

  /// Where the result ends, once a page without more has been seen (or the
  /// exact total says so).
  int? knownEnd;

  /// The pages fetched last, oldest first: start offset and items.
  final List<({int start, List<Map<String, dynamic>> items})> pages = [];
  final int _keep;

  void add(int at, SiloPage page) {
    started = true;
    windowCursor = page.windowCursor ?? windowCursor;
    if (page.total != null) {
      total = page.total;
      totalExact = page.totalExact;
      if (page.totalExact) knownEnd = page.total;
    }
    final end = at + page.items.length;
    // A short page alone doesn't end the list: only Silo saying so does.
    if (!page.hasMore) knownEnd = end;
    // The next cursor points past the furthest page seen.
    if (end >= nextStart || nextCursor == null) {
      nextCursor = page.hasMore ? page.nextCursor : null;
      nextStart = end;
    }
    pages.removeWhere((p) => p.start == at);
    pages.add((start: at, items: page.items));
    while (pages.length > _keep) {
      pages.removeAt(0);
    }
  }

  /// Whether a kept page was fetched starting at [pos].
  bool fetchedAt(int pos) => pages.any((p) => p.start == pos);

  /// Up to [count] items from [pos] on, as far as one kept page reaches.
  List<Map<String, dynamic>> itemsAt(int pos, int count) {
    for (final p in pages.reversed) {
      final offset = pos - p.start;
      if (offset >= 0 && offset < p.items.length) {
        final stop = offset + count < p.items.length
            ? offset + count
            : p.items.length;
        return p.items.sublist(offset, stop);
      }
    }
    return const [];
  }

  /// The total for Moonfin: Silo's exact total, else where the result was
  /// seen to end, else Silo's estimate (never less than what was seen). With
  /// nothing at all, it's what was seen plus one while there is more.
  int totalFor(int seenEnd) {
    if (total != null && totalExact) return total!;
    if (knownEnd != null) return knownEnd!;
    if (total != null) return total! < seenEnd ? seenEnd + 1 : total!;
    return nextCursor != null ? seenEnd + 1 : seenEnd;
  }
}

/// A stable key for one list query: its parameters, minus the paging ones
/// (`cursor`, `seek`, `limit`), sorted, with null and empty values dropped.
/// Two requests with the same signature page through the same result.
String siloPageSignature(String path, Map<String, Object?> params) {
  final kept = <String, Object?>{
    for (final key in params.keys.toList()..sort())
      if (!const {'cursor', 'seek', 'limit'}.contains(key) &&
          params[key] != null &&
          params[key] != '' &&
          !(params[key] is Iterable && (params[key] as Iterable).isEmpty))
        key: params[key] is Iterable
            ? (params[key] as Iterable).map((e) => '$e').toList()
            : '${params[key]}',
  };
  return '$path?${jsonEncode(kept)}';
}

/// Whether [error] is Silo refusing a cursor: a 400 or 422 whose problem
/// code, or one of whose field errors, names the cursor (an expired or
/// foreign `cursor`, a `seek` out of range of its window).
bool isSiloInvalidCursorError(Object error) {
  if (error is! DioException) return false;
  final status = error.response?.statusCode;
  if (status != 400 && status != 422) return false;
  final problem = SiloProblem.of(error);
  if (problem == null) return false;
  final code = problem.code?.toLowerCase() ?? '';
  if (code.contains('cursor')) return true;
  return problem.errors.any((e) {
    final where = e.location?.toLowerCase() ?? '';
    return where.endsWith('.cursor') || where.endsWith('.seek');
  });
}
