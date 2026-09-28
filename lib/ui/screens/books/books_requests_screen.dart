import 'dart:async';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/repositories/session_repository.dart';
import '../../../auth/repositories/user_repository.dart';
import '../../../data/repositories/books_repository.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../data/viewmodels/books_requests_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/key_event_utils.dart';
import '../../navigation/destinations.dart';
import '../../navigation/route_lifecycle_observer.dart';
import '../../widgets/bottom_nav/bottom_navbar.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/top_toolbar.dart';

class BooksRequestsScreen extends StatefulWidget {
  const BooksRequestsScreen({
    super.key,
    this.repository,
    this.supportedOverride,
  });
  final BooksRepository? repository;
  final bool? supportedOverride;

  @override
  State<BooksRequestsScreen> createState() => _BooksRequestsScreenState();
}

class _BooksRequestsScreenState extends State<BooksRequestsScreen>
    with WidgetsBindingObserver, RouteAware {
  late BooksRepository _repository;
  late BooksRequestsViewModel _model;
  final TextEditingController _search = TextEditingController();
  final FocusNode _searchFocus = FocusNode(debugLabel: 'books-search');
  final GlobalKey<CustomTVTextFieldState> _tvFieldKey = GlobalKey();
  Timer? _statusTimer;
  bool _visible = true;
  bool _routeVisible = true;
  ModalRoute<dynamic>? _observedRoute;
  final Set<String> _starting = {};
  String? _identity;

  bool get _supported =>
      widget.supportedOverride ??
      (GetIt.instance.isRegistered<PluginSyncService>() &&
          GetIt.instance<PluginSyncService>().booksSupported);

  @override
  void initState() {
    super.initState();
    _repository = widget.repository ?? _currentRepository();
    _model = BooksRequestsViewModel(_repository)..addListener(_changed);
    _search.addListener(_changed);
    _searchFocus.addListener(_changed);
    WidgetsBinding.instance.addObserver(this);
    if (GetIt.instance.isRegistered<PluginSyncService>()) {
      GetIt.instance<PluginSyncService>().addListener(_onCapabilityChanged);
    }
    _bindIdentity();
    _startPolling();
    if (PlatformDetection.useLeanbackUi) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _searchFocus.requestFocus();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route == null || route == _observedRoute) return;
    if (_observedRoute != null) routeLifecycleObserver.unsubscribe(this);
    _observedRoute = route;
    routeLifecycleObserver.subscribe(this, route);
  }

  @override
  void didPushNext() {
    _routeVisible = false;
    _startPolling();
  }

  @override
  void didPopNext() {
    _routeVisible = true;
    _startPolling();
  }

  void _onCapabilityChanged() {
    _startPolling();
    _changed();
  }

  void _bindIdentity() {
    if (widget.repository != null) {
      _model.bindIdentity('test');
      return;
    }
    final session = GetIt.instance<SessionRepository>();
    final next = '${session.activeServerId}:${session.activeUserId}';
    if (next == _identity) return;
    if (_identity != null) {
      _model.removeListener(_changed);
      _model.dispose();
      _repository = _currentRepository();
      _model = BooksRequestsViewModel(_repository)..addListener(_changed);
    }
    _identity = next;
    _search.removeListener(_changed);
    _search.clear();
    _search.addListener(_changed);
    _model.bindIdentity(next);
  }

  BooksRepository _currentRepository() => BooksRepository(
    GetIt.instance<MediaServerClient>(),
    username: GetIt.instance<UserRepository>().currentUser?.name ?? '',
  );

  void _changed() {
    if (mounted) setState(() {});
  }

  void _startPolling() {
    _statusTimer?.cancel();
    if (!_visible || !_routeVisible || !_supported) return;
    _model.refreshStatus();
    _statusTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _model.refreshStatus(),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _visible = state == AppLifecycleState.resumed;
    _startPolling();
  }

  @override
  void dispose() {
    _statusTimer?.cancel();
    if (_observedRoute != null) routeLifecycleObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    if (GetIt.instance.isRegistered<PluginSyncService>()) {
      GetIt.instance<PluginSyncService>().removeListener(_onCapabilityChanged);
    }
    _model.removeListener(_changed);
    _model.dispose();
    _search.removeListener(_changed);
    _search.dispose();
    _searchFocus.removeListener(_changed);
    _searchFocus.dispose();
    super.dispose();
  }

  Future<void> _openReleases(BookResult book) async {
    await showFocusRestoringDialog<void>(
      context: context,
      builder: (_) => BookReleasesDialog(
        book: book,
        type: _model.type,
        repository: _repository,
        onStart: _startDownload,
        onDownloads: _openDownloads,
      ),
    );
  }

  Future<bool> _startDownload(
    BookResult book,
    BookRelease release,
    BooksMediaType type,
  ) async {
    if (widget.repository == null) {
      final session = GetIt.instance<SessionRepository>();
      if (_identity != '${session.activeServerId}:${session.activeUserId}') {
        return false;
      }
    }
    final key = '${release.source}:${release.sourceId}';
    if (_starting.contains(key)) return false;
    _starting.add(key);
    try {
      await _repository.download(book, release, type);
      await _model.refreshStatus();
      return true;
    } finally {
      _starting.remove(key);
    }
  }

  void _openDownloads() {
    _model.refreshStatus();
    showFocusRestoringDialog<void>(
      context: context,
      builder: (_) => AnimatedBuilder(
        animation: _model,
        builder: (context, _) {
          final l10n = AppLocalizations.of(context);
          final dialog = AlertDialog(
            title: Text(l10n.booksDownloads),
            actions: [
              TextButton(
                onPressed: _model.refreshStatus,
                child: Text(l10n.booksRefresh),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(l10n.booksClose),
              ),
            ],
            content: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700, maxHeight: 520),
              child: SizedBox(
                width: 620,
                child: _model.downloads.isEmpty
                    ? Text(
                        _model.statusError == null
                            ? l10n.booksActiveEmpty
                            : _model.statusError!.statusCode == 403
                            ? l10n.booksForbidden
                            : l10n.booksStatusFailed,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            _model.downloads.length +
                            (_model.statusError == null ? 0 : 1),
                        itemBuilder: (context, index) {
                          if (index == _model.downloads.length) {
                            return Text(
                              _model.statusError?.statusCode == 403
                                  ? l10n.booksForbidden
                                  : l10n.booksStatusFailed,
                            );
                          }
                          final task = _model.downloads[index];
                          final label = _statusLabel(task.status, l10n);
                          return Focus(
                            key: ValueKey('books-download:${task.id}'),
                            child: Builder(
                              builder: (context) {
                                final focused = Focus.of(context).hasFocus;
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: focused
                                          ? AppColorScheme.accent
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(task.title),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(label),
                                        if (task.status == 'downloading')
                                          LinearProgressIndicator(
                                            value:
                                                task.progress != null &&
                                                    task.progress! >= 0 &&
                                                    task.progress! <= 100
                                                ? task.progress! / 100
                                                : null,
                                          ),
                                      ],
                                    ),
                                    leading: Icon(_statusIcon(task.status)),
                                    trailing:
                                        task.status != 'downloading' ||
                                            task.progress == null ||
                                            task.progress! < 0 ||
                                            task.progress! > 100
                                        ? null
                                        : Text('${task.progress!.round()}%'),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),
            ),
          );
          return _BooksRemoteActions(child: dialog);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _bindIdentity();
    final l10n = AppLocalizations.of(context);
    final tv = PlatformDetection.useLeanbackUi;
    final width = MediaQuery.sizeOf(context).width;
    final pad = tv
        ? 48.0
        : width < 600
        ? 16.0
        : width < 1200
        ? 24.0
        : 32.0;
    final columns =
        width < 450 || MediaQuery.textScalerOf(context).scale(16) >= 30
        ? 1
        : ((width - 2 * pad + 16) / (tv ? 210 : 190)).floor().clamp(2, 7);
    final screen = Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        activeRoute: Destinations.booksRequests,
        showBackButton: true,
        // NavigationLayout reserves the music bar's changing extra height.
        pinTopToolbar: true,
        child: SafeArea(
          bottom: false,
          child: ValueListenableBuilder<NavbarPosition?>(
            valueListenable: NavigationLayout.positionNotifier,
            builder: (context, position, child) {
              final navbar = NavigationLayout.sanitizeNavbarPosition(
                position ??
                    GetIt.instance<UserPreferences>().get(
                      UserPreferences.navbarPosition,
                    ),
              );
              final vertical = tv ? 24.0 : 16.0;
              final leftRail =
                  navbar == NavbarPosition.left &&
                  !PlatformDetection.useMobileUi;
              // Off the top, clear NavigationLayout's floating back button
              // (16 inset + 40 height), as the other request pages do.
              final top = navbar == NavbarPosition.top
                  ? TopToolbar.baseHeightFor(context)
                  : 56.0;
              return BottomNavPadded(
                fallback: vertical + MediaQuery.paddingOf(context).bottom,
                builder: (context, bottom) => SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    pad + (leftRail ? 72.0 : 0.0),
                    top + vertical,
                    pad,
                    bottom,
                  ),
                  child: child,
                ),
              );
            },
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1440),
                child: !_supported
                    ? Column(
                        children: [
                          Text(l10n.booksUnavailable),
                          TextButton(
                            onPressed: () => context.popOrHome(),
                            child: Text(l10n.back),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 24,
                            runSpacing: 8,
                            children: [
                              Text(
                                l10n.books,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium,
                              ),
                              OutlinedButton.icon(
                                key: const ValueKey('books-downloads'),
                                onPressed: _openDownloads,
                                icon: const Icon(Icons.download_rounded),
                                label: Text(
                                  _model.activeCount == 0
                                      ? l10n.booksDownloads
                                      : '${l10n.booksDownloads} (${_model.activeCount})',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(l10n.booksHint),
                          const SizedBox(height: 24),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 800),
                            child: Row(
                              children: [
                                Expanded(
                                  child: tv
                                      ? Focus(
                                          key: const ValueKey('books-search'),
                                          focusNode: _searchFocus,
                                          onKeyEvent: (node, event) {
                                            if (node.hasPrimaryFocus &&
                                                event is KeyDownEvent &&
                                                event.logicalKey.isSelectKey) {
                                              _tvFieldKey.currentState
                                                  ?.openKeyboard();
                                              return KeyEventResult.handled;
                                            }
                                            return KeyEventResult.ignored;
                                          },
                                          child: CustomTVTextField(
                                            key: _tvFieldKey,
                                            controller: _search,
                                            isFocused: _searchFocus.hasFocus,
                                            hint: l10n.booksSearchLabel,
                                            textStyle: TextStyle(
                                              color: AppColorScheme.onSurface,
                                              fontSize: 20,
                                            ),
                                            hintStyle: TextStyle(
                                              color: AppColorScheme.onSurface
                                                  .withValues(alpha: 0.7),
                                              fontSize: 20,
                                            ),
                                            inputPurpose: InputPurpose.search,
                                            popParentOnKeyboardClose: false,
                                            prefixIcon: const Icon(
                                              Icons.search_rounded,
                                            ),
                                            suffixIcon: _search.text.isEmpty
                                                ? null
                                                : IconButton(
                                                    tooltip: l10n.clear,
                                                    onPressed: _search.clear,
                                                    icon: const Icon(
                                                      Icons.close_rounded,
                                                    ),
                                                  ),
                                            filled: true,
                                            fillColor:
                                                AppColorScheme.surfaceVariant,
                                            focusedBorderColor:
                                                AppColorScheme.accent,
                                            onFieldSubmitted: _model.search,
                                          ),
                                        )
                                      : TextField(
                                          key: const ValueKey('books-search'),
                                          controller: _search,
                                          focusNode: _searchFocus,
                                          decoration: InputDecoration(
                                            labelText: l10n.booksSearchLabel,
                                            prefixIcon: const Icon(
                                              Icons.search_rounded,
                                            ),
                                            suffixIcon: _search.text.isEmpty
                                                ? null
                                                : IconButton(
                                                    tooltip: l10n.clear,
                                                    onPressed: _search.clear,
                                                    icon: const Icon(
                                                      Icons.close_rounded,
                                                    ),
                                                  ),
                                          ),
                                          textInputAction:
                                              TextInputAction.search,
                                          onSubmitted: _model.search,
                                        ),
                                ),
                                const SizedBox(width: 8),
                                FilledButton(
                                  onPressed: () => _model.search(_search.text),
                                  child: Text(l10n.search),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SegmentedButton<BooksMediaType>(
                            key: const ValueKey('books-type'),
                            segments: [
                              ButtonSegment(
                                value: BooksMediaType.ebook,
                                icon: const Icon(Icons.menu_book_rounded),
                                label: Text(l10n.books),
                              ),
                              ButtonSegment(
                                value: BooksMediaType.audiobook,
                                icon: const Icon(Icons.headphones_rounded),
                                label: Text(l10n.audiobooks),
                              ),
                            ],
                            selected: {_model.type},
                            onSelectionChanged: (selected) =>
                                _model.setType(selected.first),
                          ),
                          const SizedBox(height: 24),
                          if (_model.searching)
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: columns,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: columns == 1
                                        ? 1.6
                                        : (tv ? 0.72 : 0.75),
                                  ),
                              itemCount: columns * 2,
                              itemBuilder: (context, index) => Card(
                                color: AppColorScheme.surfaceVariant,
                                child: Center(child: Text(l10n.booksLoading)),
                              ),
                            ),
                          if (_model.searchError != null) ...[
                            Text(
                              _model.searchError!.statusCode == 403
                                  ? l10n.booksForbidden
                                  : l10n.booksSearchFailed,
                            ),
                            TextButton(
                              onPressed: () => _model.search(_search.text),
                              child: Text(l10n.booksRetry),
                            ),
                          ] else if (!_model.searching &&
                              _model.results.isEmpty)
                            Text(
                              _model.query.isEmpty
                                  ? l10n.booksSearchPrompt
                                  : l10n.booksSearchEmpty,
                            ),
                          if (_model.results.isNotEmpty)
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: columns,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: columns == 1
                                        ? 1.6
                                        : (tv ? 0.72 : 0.75),
                                  ),
                              itemCount: _model.results.length,
                              itemBuilder: (context, index) {
                                final book = _model.results[index];
                                return _BookCard(
                                  key: ValueKey(
                                    'books-result:${book.provider}:${book.id}',
                                  ),
                                  book: book,
                                  type: _model.type,
                                  onTap: () => _openReleases(book),
                                );
                              },
                            ),
                          if (_model.hasMore)
                            Center(
                              child: TextButton(
                                onPressed: _model.loadingMore
                                    ? null
                                    : () => _model.search(
                                        _model.query,
                                        more: true,
                                      ),
                                child: Text(
                                  _model.loadingMore
                                      ? l10n.booksLoading
                                      : l10n.booksMore,
                                ),
                              ),
                            ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
    return _BooksRemoteActions(child: screen);
  }
}

// Material controls already expose ActivateIntent. Reuse it for the same
// remote keys as the shared TV controls, without changing touch/desktop UI.
class _BooksRemoteActions extends StatelessWidget {
  const _BooksRemoteActions({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!PlatformDetection.useLeanbackUi) return child;
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (_, event) {
        if (!event.logicalKey.isSelectKey) return KeyEventResult.ignored;
        // A held OK button must not open another dialog or submit twice.
        if (event is! KeyDownEvent) return KeyEventResult.handled;
        return activateFocusedTarget(context);
      },
      child: child,
    );
  }
}

class _BookCard extends StatefulWidget {
  const _BookCard({
    super.key,
    required this.book,
    required this.type,
    required this.onTap,
  });
  final BookResult book;
  final BooksMediaType type;
  final VoidCallback onTap;

  @override
  State<_BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<_BookCard> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    final type = widget.type;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _focused ? AppColorScheme.accent : Colors.transparent,
          width: 2,
        ),
        borderRadius: AppRadius.circular(AppShapes.small),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: widget.onTap,
          onFocusChange: (focused) => setState(() => _focused = focused),
          focusColor: AppColorScheme.accent.withValues(alpha: 0.35),
          child: Semantics(
            button: true,
            label:
                '${book.title}, ${book.authors.join(', ')}, ${type == BooksMediaType.ebook ? AppLocalizations.of(context).books : AppLocalizations.of(context).audiobooks}, ${AppLocalizations.of(context).booksReleasesTitle}',
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: _BookCover(book: book, type: type),
                    ),
                  ),
                  Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (book.authors.isNotEmpty)
                    Text(
                      book.authors.join(', '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (book.year != null) Text('${book.year}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BookCover extends StatelessWidget {
  const _BookCover({required this.book, required this.type});

  final BookResult book;
  final BooksMediaType type;

  @override
  Widget build(BuildContext context) {
    final placeholder = Center(
      child: Icon(
        type == BooksMediaType.ebook
            ? Icons.menu_book_rounded
            : Icons.headphones_rounded,
        size: 64,
        color: AppColorScheme.accent,
      ),
    );
    final coverUrl = book.coverUrl;
    if (coverUrl == null) return placeholder;
    return Image.network(
      coverUrl,
      fit: BoxFit.contain,
      loadingBuilder: (_, image, progress) =>
          progress == null ? image : placeholder,
      errorBuilder: (_, _, _) => placeholder,
    );
  }
}

class BookReleasesDialog extends StatefulWidget {
  const BookReleasesDialog({
    super.key,
    required this.book,
    required this.type,
    required this.repository,
    required this.onStart,
    required this.onDownloads,
  });
  final BookResult book;
  final BooksMediaType type;
  final BooksRepository repository;
  final Future<bool> Function(BookResult, BookRelease, BooksMediaType) onStart;
  final VoidCallback onDownloads;
  @override
  State<BookReleasesDialog> createState() => _BookReleasesDialogState();
}

class _BookReleasesDialogState extends State<BookReleasesDialog> {
  final FocusNode _closeFocus = FocusNode(debugLabel: 'books-close');
  late Future<List<BookRelease>> _releases;
  BookRelease? _selected;
  bool _starting = false;
  bool _started = false;
  bool _unknown = false;
  bool _forbidden = false;
  @override
  void initState() {
    super.initState();
    _releases = widget.repository.releases(widget.book, widget.type);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !PlatformDetection.useMobileUi) _closeFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    _closeFocus.dispose();
    super.dispose();
  }

  void _retry() {
    setState(
      () => _releases = widget.repository.releases(widget.book, widget.type),
    );
  }

  Future<void> _submit() async {
    final selected = _selected;
    if (_starting || _started || selected == null) return;
    setState(() => _starting = true);
    try {
      final started = await widget.onStart(widget.book, selected, widget.type);
      if (mounted) {
        setState(() {
          _started = started;
          _unknown = !started;
        });
      }
    } on BooksApiException catch (error) {
      if (mounted) {
        setState(() {
          _forbidden = error.statusCode == 403;
          _unknown = !_forbidden;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _unknown = true);
    } finally {
      if (mounted) setState(() => _starting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dialog = AlertDialog(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: PlatformDetection.useLeanbackUi ? 96 : 64,
            height: PlatformDetection.useLeanbackUi ? 96 : 64,
            child: _BookCover(book: widget.book, type: widget.type),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text('${widget.book.title}\n${l10n.booksReleasesTitle}'),
          ),
        ],
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760, maxHeight: 500),
        child: SizedBox(
          width: 680,
          child: FutureBuilder<List<BookRelease>>(
            future: _releases,
            builder: (context, snapshot) {
              if (!snapshot.hasData && !snapshot.hasError) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                final forbidden =
                    snapshot.error is BooksApiException &&
                    (snapshot.error as BooksApiException).statusCode == 403;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      forbidden
                          ? l10n.booksForbidden
                          : l10n.booksReleasesFailed,
                    ),
                    TextButton(onPressed: _retry, child: Text(l10n.booksRetry)),
                  ],
                );
              }
              final releases = snapshot.data!;
              if (releases.isEmpty) return Text(l10n.booksReleasesEmpty);
              return ListView.builder(
                shrinkWrap: true,
                itemCount: releases.length,
                itemBuilder: (context, index) {
                  final release = releases[index];
                  final selected = identical(_selected, release);
                  return ListTile(
                    key: ValueKey(
                      'books-release:${release.source}:${release.sourceId}',
                    ),
                    selected: selected,
                    focusColor: AppColorScheme.accent.withValues(alpha: 0.35),
                    leading: Icon(
                      selected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                    ),
                    onTap: _starting || _started
                        ? null
                        : () => setState(() => _selected = release),
                    title: Text(
                      release.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      [
                        release.format,
                        release.language,
                        release.size,
                      ].whereType<String>().join(' · '),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      actions: [
        if (_selected != null && !_started)
          Text(
            '${l10n.booksReleaseSelected}: ${_selected!.format ?? _selected!.title}',
          ),
        if (_unknown) Text(l10n.booksStartUnknown),
        if (_forbidden) Text(l10n.booksForbidden),
        if (_started) Text(l10n.booksStarted),
        TextButton(
          focusNode: _closeFocus,
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.booksClose),
        ),
        if (_started)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              widget.onDownloads();
            },
            child: Text(l10n.booksShowDownloads),
          ),
        FilledButton(
          key: const ValueKey('books-submit'),
          onPressed:
              _selected == null ||
                  _starting ||
                  _started ||
                  _unknown ||
                  _forbidden
              ? null
              : _submit,
          child: Text(
            _starting
                ? l10n.booksStarting
                : _selected == null
                ? l10n.booksSelectRelease
                : l10n.download,
          ),
        ),
      ],
    );
    return _BooksRemoteActions(child: dialog);
  }
}

String _statusLabel(String status, AppLocalizations l10n) =>
    switch (status.toLowerCase()) {
      'queued' || 'pending' => l10n.booksQueued,
      'resolving' || 'locating' => l10n.booksPreparing,
      'downloading' || 'active' => l10n.booksDownloading,
      'processing' || 'post_processing' => l10n.booksProcessing,
      'complete' || 'completed' => l10n.booksComplete,
      'error' || 'failed' => l10n.booksFailed,
      'cancelled' => l10n.booksCancelled,
      _ => l10n.booksUnknownStatus,
    };
IconData _statusIcon(String status) => switch (status.toLowerCase()) {
  'queued' || 'pending' => Icons.schedule_rounded,
  'resolving' || 'locating' => Icons.hourglass_top_rounded,
  'downloading' || 'active' => Icons.download_rounded,
  'processing' || 'post_processing' => Icons.hourglass_bottom_rounded,
  'complete' || 'completed' => Icons.check_circle_outline_rounded,
  'error' || 'failed' => Icons.error_outline_rounded,
  _ => Icons.help_outline_rounded,
};
