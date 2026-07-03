import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/viewmodels/seerr_person_view_model.dart';
import '../../../preference/user_preferences.dart';
import '../../navigation/destinations.dart';
import '../../widgets/library_row.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/focus/step_scroll.dart';

const _tmdbPosterBase = 'https://image.tmdb.org/t/p/w342';
const _tmdbProfileLarge = 'https://image.tmdb.org/t/p/w500';

class SeerrPersonScreen extends StatefulWidget {
  final String personId;

  const SeerrPersonScreen({super.key, required this.personId});

  @override
  State<SeerrPersonScreen> createState() => _SeerrPersonScreenState();
}

class _SeerrPersonScreenState extends State<SeerrPersonScreen> {
  SeerrPersonViewModel? _vm;
  bool _initializing = true;
  bool _bioExpanded = false;
  bool _bioFocused = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final repo = await GetIt.instance.getAsync<SeerrRepository>();
    final vm = SeerrPersonViewModel(repo);
    vm.addListener(_onChanged);

    if (!mounted) {
      vm.dispose();
      return;
    }

    setState(() {
      _vm = vm;
      _initializing = false;
    });

    _loadPerson();
  }

  void _loadPerson() {
    final vm = _vm;
    if (vm == null) return;
    final id = int.tryParse(widget.personId);
    if (id == null) return;
    vm.load(id);
  }

  @override
  void dispose() {
    _vm?.removeListener(_onChanged);
    _vm?.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildScreenContent(context));

  Widget _buildScreenContent(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(showBackButton: true, child: _buildBody()),
    );
  }

  Widget _buildBody() {
    final l10n = AppLocalizations.of(context);
    final vm = _vm;
    if (_initializing || vm == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final s = vm.state;

    if (s.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (s.error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              s.error!,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _loadPerson, child: Text(l10n.retry)),
          ],
        ),
      );
    }

    final person = s.person;
    if (person == null) return const SizedBox.shrink();

    return _buildContent(person, s);
  }

  Widget _buildContent(SeerrPersonDetails person, SeerrPersonState s) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final topPad = MediaQuery.of(context).padding.top;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(32, topPad + 16, 32, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: person.profilePath != null
                      ? CachedNetworkImage(
                          imageUrl: '$_tmdbProfileLarge${person.profilePath}',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          errorWidget: (_, _, _) => _profilePlaceholder(),
                        )
                      : _profilePlaceholder(),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        person.name,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: AppColorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (person.knownForDepartment != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          person.knownForDepartment!,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColorScheme.onSurface.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 8),
                      _buildBirthInfo(person),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (person.biography != null && person.biography!.isNotEmpty)
          SliverToBoxAdapter(child: _buildBiography(person.biography!)),
        if (s.castCredits.isNotEmpty)
          SliverToBoxAdapter(
            child: _buildCreditsRow(l10n.appearances, s.castCredits, true),
          ),
        if (s.crewCredits.isNotEmpty)
          SliverToBoxAdapter(
            child: _buildCreditsRow(l10n.crewSection, s.crewCredits, false),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: 80)),
      ],
    );
  }

  Widget _profilePlaceholder() {
    return Container(
      width: 120,
      height: 120,
      color: AppColorScheme.surface,
      child: Icon(
        Icons.person,
        color: AppColorScheme.onSurface.withValues(alpha: 0.38),
        size: 48,
      ),
    );
  }

  Widget _buildBirthInfo(SeerrPersonDetails person) {
    final l10n = AppLocalizations.of(context);
    final parts = <String>[];

    if (person.birthday != null) {
      final formatted = _formatDate(person.birthday!);
      if (formatted != null) {
        if (person.deathday != null) {
          final deathFormatted = _formatDate(person.deathday!);
          parts.add('$formatted — ${deathFormatted ?? person.deathday}');
        } else {
          final age = _calculateAge(person.birthday!);
          parts.add(
            age != null ? '$formatted (${l10n.ageValue(age)})' : formatted,
          );
        }
      }
    }

    if (person.placeOfBirth != null) {
      parts.add(person.placeOfBirth!);
    }

    if (parts.isEmpty) return const SizedBox.shrink();

    return Text(
      parts.join('\n'),
      style: TextStyle(
        color: AppColorScheme.onSurface.withValues(alpha: 0.54),
        fontSize: 13,
        height: 1.4,
      ),
    );
  }

  Widget _buildBiography(String bio) {
    final l10n = AppLocalizations.of(context);
    final textStyle = TextStyle(
      color: AppColorScheme.onSurface.withValues(alpha: 0.85),
      fontSize: 14,
      height: 1.5,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final textPainter = TextPainter(
            text: TextSpan(text: bio, style: textStyle),
            maxLines: 4,
            textDirection: TextDirection.ltr,
          )..layout(maxWidth: constraints.maxWidth);
          final canToggle = textPainter.didExceedMaxLines;

          return Focus(
            onFocusChange: (focused) {
              if (_bioFocused == focused) return;
              setState(() => _bioFocused = focused);
            },
            onKeyEvent: (_, event) {
              if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
                return KeyEventResult.ignored;
              }

              if (_bioExpanded &&
                  event.logicalKey == LogicalKeyboardKey.arrowDown) {
                if (_stepScroll(context, down: true)) {
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              }
              if (_bioExpanded &&
                  event.logicalKey == LogicalKeyboardKey.arrowUp) {
                if (_stepScroll(context, down: false)) {
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              }

              if (canToggle &&
                  (event.logicalKey == LogicalKeyboardKey.select ||
                      event.logicalKey == LogicalKeyboardKey.enter ||
                      event.logicalKey == LogicalKeyboardKey.space)) {
                setState(() => _bioExpanded = !_bioExpanded);
                return KeyEventResult.handled;
              }

              return KeyEventResult.ignored;
            },
            child: GestureDetector(
              onTap: canToggle
                  ? () => setState(() => _bioExpanded = !_bioExpanded)
                  : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: AppRadius.circular(8),
                  border: _bioFocused
                      ? Border.all(color: AppColorScheme.accent, width: 1.5)
                      : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.biography,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    AnimatedCrossFade(
                      firstChild: Text(
                        bio,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle,
                      ),
                      secondChild: Text(bio, style: textStyle),
                      crossFadeState: _bioExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 250),
                    ),
                    if (canToggle) ...[
                      const SizedBox(height: 4),
                      Text(
                        _bioExpanded ? l10n.showLess : l10n.showMore,
                        style: TextStyle(
                          color: AppColorScheme.accent,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _stepScroll(BuildContext context, {required bool down}) {
    return stepScrollWithinContextBounds(context, down: down);
  }

  Widget _buildCreditsRow(
    String title,
    List<SeerrDiscoverItem> items,
    bool isCast,
  ) {
    final suppressFocusGlow = ThemeRegistry.active.borders.focusGlow.isNotEmpty;
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    final cardExpansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );
    return LibraryRow(
      title: title,
      children: items
          .map(
            (item) => MediaCard(
              title: item.displayTitle,
              subtitle: isCast ? item.character : item.job ?? item.department,
              imageUrl: item.posterPath != null
                  ? '$_tmdbPosterBase${item.posterPath}'
                  : null,
              width: 130,
              aspectRatio: 2 / 3,
              seerrMediaType: item.mediaType,
              seerrStatus: item.mediaInfo?.status,
              focusColor: focusColor,
              cardFocusExpansion: cardExpansion,
              suppressFocusGlow: suppressFocusGlow,
              onTap: () {
                final mediaType = item.mediaType ?? 'movie';
                context.push(
                  Destinations.seerrMedia(item.id.toString()),
                  extra: {'mediaType': mediaType},
                );
              },
            ),
          )
          .toList(),
    );
  }

  static String? _formatDate(String isoDate) {
    final dt = DateTime.tryParse(isoDate);
    if (dt == null) return null;
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  static int? _calculateAge(String birthday) {
    final birth = DateTime.tryParse(birthday);
    if (birth == null) return null;
    final now = DateTime.now();
    var age = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age--;
    }
    return age;
  }
}
