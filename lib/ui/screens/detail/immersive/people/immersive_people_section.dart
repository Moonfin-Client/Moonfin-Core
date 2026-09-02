import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../widgets/focus/locked_focus_row.dart';
import '../../../../widgets/navigation_layout.dart';
import '../shared/immersive_spacing.dart';
import 'immersive_people_card.dart';

class ImmersivePeopleSection extends StatefulWidget {
  final List<Map<String, dynamic>> actors;
  final List<Map<String, dynamic>> directors;
  final List<Map<String, dynamic>> writers;
  final ImageApi imageApi;
  final String? serverId;
  final bool Function()? onNavigateUp;
  final bool Function()? onNavigateDown;

  const ImmersivePeopleSection({
    super.key,
    required this.actors,
    required this.directors,
    required this.writers,
    required this.imageApi,
    required this.serverId,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  @override
  State<ImmersivePeopleSection> createState() => ImmersivePeopleSectionState();
}

class ImmersivePeopleSectionState extends State<ImmersivePeopleSection> {
  static const int _fullVisibleCards = 10;
  static const double _avatarWidthFactor = 0.80;

  static int _hubSession = 0;

  late final String _hubKey;

  final ScrollController _scrollController = ScrollController();

  final GlobalKey<LockedFocusRowState<Map<String, dynamic>>> _rowKey =
      GlobalKey<LockedFocusRowState<Map<String, dynamic>>>();

  @override
  void initState() {
    super.initState();

    _hubKey = 'immersive-people-${_hubSession++}';
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  bool _isCompactMobile(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  bool get canFocusTop {
    if (!mounted || _rowKey.currentState == null) {
      return false;
    }

    return widget.actors.isNotEmpty ||
        widget.directors.isNotEmpty ||
        widget.writers.isNotEmpty;
  }

  bool get _navbarIsLeft =>
      GetIt.instance<UserPreferences>().get(UserPreferences.navbarPosition) ==
      NavbarPosition.left;

  void _handleLeftEdge() {
    NavigationLayout.focusNavbarNotifier.value?.call();
  }

  bool focusTop() {
    if (!canFocusTop) {
      return false;
    }

    _rowKey.currentState!.requestFocusFromMemory();

    return true;
  }

  List<Map<String, dynamic>> _mergeCreators(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final merged = <String, _CreatorEntry>{};

    void addPeople(
      List<Map<String, dynamic>> people, {
      required bool isDirector,
      required bool isWriter,
    }) {
      for (final person in people) {
        final id = person['Id']?.toString().trim() ?? '';
        final name = person['Name']?.toString().trim() ?? '';

        if (id.isEmpty && name.isEmpty) {
          continue;
        }

        final key = id.isNotEmpty ? 'id:$id' : 'name:${name.toLowerCase()}';

        final entry = merged.putIfAbsent(
          key,
          () => _CreatorEntry(person: person),
        );

        if (isDirector) {
          entry.isDirector = true;
        }

        if (isWriter) {
          entry.isWriter = true;
        }
      }
    }

    addPeople(widget.directors, isDirector: true, isWriter: false);

    addPeople(widget.writers, isDirector: false, isWriter: true);

    return [
      for (final entry in merged.values)
        {
          ...entry.person,
          'Role': [
            if (entry.isDirector) l10n.director,
            if (entry.isWriter) l10n.writer,
          ].join(', '),
        },
    ];
  }

  String _title(
    BuildContext context, {
    required bool hasCast,
    required bool hasCreators,
  }) {
    final l10n = AppLocalizations.of(context);

    if (hasCast && hasCreators) {
      return l10n.castAndCrew;
    }

    if (hasCast) {
      return l10n.castMembers;
    }

    return l10n.crewSection;
  }

  _PeopleLayout _layoutFor(BuildContext context, double availableWidth) {
    final compact = _isCompactMobile(context);
    final textScaler = MediaQuery.textScalerOf(context);

    if (compact) {
      final metrics = ImmersiveSpacing.compactPeople;

      final cardWidth = metrics.itemWidth(availableWidth);

      final avatarSize =
          (cardWidth * ImmersiveSpacing.compactPeopleAvatarWidthFactor).clamp(
            ImmersiveSpacing.compactPeopleMinAvatarSize,
            ImmersiveSpacing.compactPeopleMaxAvatarSize,
          );

      final nameHeight = textScaler.scale(38).clamp(38.0, 56.0);
      final roleHeight = textScaler.scale(32).clamp(32.0, 48.0);

      final cardHeight = avatarSize + 12 + nameHeight + 4 + roleHeight;

      return _PeopleLayout(
        viewportWidth: availableWidth,
        cardWidth: cardWidth,
        cardSpacing: metrics.gap,
        avatarSize: avatarSize,
        cardHeight: cardHeight,
        compact: true,
      );
    }

    final visibleCards = PlatformDetection.isTV
        ? ImmersiveSpacing.tvPeopleVisibleCards
        : _fullVisibleCards;

    final itemGap = PlatformDetection.isTV
        ? ImmersiveSpacing.tvRailItemGap
        : ImmersiveSpacing.railItemGap;

    final avatarWidthFactor = PlatformDetection.isTV
        ? ImmersiveSpacing.tvPeopleAvatarWidthFactor
        : _avatarWidthFactor;

    final cardWidth =
        (availableWidth - ((visibleCards - 1) * itemGap)) / visibleCards;

    final avatarSize = cardWidth * avatarWidthFactor;

    final nameHeight = textScaler.scale(34).clamp(34.0, 54.0);
    final roleHeight = textScaler.scale(30).clamp(30.0, 48.0);

    final cardHeight = avatarSize + 12 + nameHeight + roleHeight;

    return _PeopleLayout(
      viewportWidth: availableWidth,
      cardWidth: cardWidth,
      cardSpacing: itemGap,
      avatarSize: avatarSize,
      cardHeight: cardHeight,
      compact: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final creators = _mergeCreators(context);

    final hasCast = widget.actors.isNotEmpty;
    final hasCreators = creators.isNotEmpty;

    if (!hasCast && !hasCreators) {
      return const SizedBox.shrink();
    }

    final people = [...widget.actors, ...creators];

    final title = _title(context, hasCast: hasCast, hasCreators: hasCreators);

    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        final layout = _layoutFor(context, availableWidth);

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: layout.compact
                  ? textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    )
                  : textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: layout.compact
                  ? ImmersiveSpacing.mobileTitleToContent
                  : ImmersiveSpacing.titleToContent,
            ),
            _buildRail(context, people, layout),
          ],
        );
      },
    );
  }

  Widget _buildRail(
    BuildContext context,
    List<Map<String, dynamic>> people,
    _PeopleLayout layout,
  ) {
    return SizedBox(
      width: double.infinity,
      height: layout.cardHeight,
      child: OverflowBox(
        alignment: Alignment.topLeft,
        minWidth: layout.viewportWidth,
        maxWidth: layout.viewportWidth,
        minHeight: layout.cardHeight,
        maxHeight: layout.cardHeight,
        child: SizedBox(
          width: layout.viewportWidth,
          height: layout.cardHeight,
          child: LockedFocusRow<Map<String, dynamic>>(
            key: _rowKey,
            items: people,
            hubKey: _hubKey,
            controller: _scrollController,
            height: layout.cardHeight,
            itemExtent: layout.itemExtent,
            clipBehavior: Clip.none,
            onLeftEdge: _navbarIsLeft ? _handleLeftEdge : null,
            onVerticalNavigation: (isUp) {
              return (isUp ? widget.onNavigateUp : widget.onNavigateDown)
                      ?.call() ??
                  false;
            },
            onTap: (_, person) {
              ImmersivePeopleCard.openPerson(
                context,
                person,
                serverId: widget.serverId,
              );
            },
            itemBuilder: (context, person, index, isFocused) {
              final hasNext = index < people.length - 1;

              return Padding(
                padding: EdgeInsets.only(
                  right: hasNext ? layout.cardSpacing : 0,
                ),
                child: ImmersivePeopleCard(
                  person: person,
                  imageApi: widget.imageApi,
                  serverId: widget.serverId,
                  width: layout.cardWidth,
                  avatarSize: layout.avatarSize,
                  isFocused: isFocused,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CreatorEntry {
  final Map<String, dynamic> person;

  bool isDirector = false;
  bool isWriter = false;

  _CreatorEntry({required this.person});
}

class _PeopleLayout {
  final double viewportWidth;
  final double cardWidth;
  final double cardSpacing;
  final double avatarSize;
  final double cardHeight;
  final bool compact;

  const _PeopleLayout({
    required this.viewportWidth,
    required this.cardWidth,
    required this.cardSpacing,
    required this.avatarSize,
    required this.cardHeight,
    required this.compact,
  });

  double get itemExtent => cardWidth + cardSpacing;
}
