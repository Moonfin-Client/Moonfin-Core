import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../../l10n/app_localizations.dart';
import '../../util/error_message.dart';
import '../../widgets/settings/settings_section_header.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/parental_rating_severity.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/settings/preference_binding.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';

class ParentalSettingsScreen extends StatefulWidget {
  const ParentalSettingsScreen({super.key});

  @override
  State<ParentalSettingsScreen> createState() => _ParentalSettingsScreenState();
}

class _ParentalSettingsScreenState extends State<ParentalSettingsScreen> {
  late final PreferenceBinding<String> _blockedRatings;
  final FocusNode _firstRatingFocusNode = FocusNode(
    debugLabel: 'ParentalFirstRating',
  );
  final List<String> _serverRatings = [];
  bool _loadingRatings = true;
  String? _ratingsError;

  @override
  void initState() {
    super.initState();
    _blockedRatings = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      UserPreferences.blockedParentalRatings,
    );
    _loadServerRatings();
  }

  @override
  void dispose() {
    _firstRatingFocusNode.dispose();
    _blockedRatings.dispose();
    super.dispose();
  }

  Set<String> get _blocked => _parseStored(_blockedRatings.value);

  static Set<String> _parseStored(String csv) => csv
      .split(',')
      .map((e) => e.trim().toUpperCase())
      .where((e) => e.isNotEmpty)
      .toSet();

  /// Mildest first, so blocking reads down the list as "everything from here".
  List<String> get _effectiveRatings {
    final merged = <String>{..._serverRatings, ..._blocked};
    final sorted = merged.toList()
      ..sort((a, b) {
        final bySeverity = parentalRatingSeverity(
          a,
        ).compareTo(parentalRatingSeverity(b));
        return bySeverity != 0 ? bySeverity : a.compareTo(b);
      });
    return sorted;
  }

  /// Ratings the ladder can place, which block everything above them, and the
  /// ones it can't, which only ever block themselves.
  bool _ranks(String rating) =>
      isRankedRatingSeverity(parentalRatingSeverity(rating));

  Future<void> _loadServerRatings() async {
    try {
      final client = GetIt.instance<MediaServerClient>();
      final discovered = <String>{};
      const pageSize = 200;
      var startIndex = 0;
      var safetyPages = 0;

      while (safetyPages < 15) {
        final response = await client.itemsApi.getItems(
          includeItemTypes: const [
            'Movie',
            'Series',
            'Episode',
            'Video',
            'MusicVideo',
            'Book',
            'AudioBook',
          ],
          recursive: true,
          fields: 'OfficialRating',
          startIndex: startIndex,
          limit: pageSize,
          enableTotalRecordCount: true,
        );

        final items = response['Items'];
        final totalRecordCount = response['TotalRecordCount'] as num?;
        final page = items is List
            ? items
                  .whereType<Map>()
                  .map((e) => Map<String, dynamic>.from(e))
                  .toList()
            : const <Map<String, dynamic>>[];

        for (final item in page) {
          final rating = item['OfficialRating']?.toString().trim();
          if (rating != null && rating.isNotEmpty) {
            discovered.add(rating.toUpperCase());
          }
        }

        if (page.length < pageSize) {
          break;
        }

        startIndex += page.length;
        safetyPages += 1;
        if (totalRecordCount != null &&
            startIndex >= totalRecordCount.toInt()) {
          break;
        }
      }

      if (!mounted) {
        return;
      }

      setState(() {
        _serverRatings
          ..clear()
          ..addAll(discovered.toList()..sort((a, b) => a.compareTo(b)));
        _loadingRatings = false;
        _ratingsError = null;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _loadingRatings = false;
        _ratingsError = describeError(error, AppLocalizations.of(context));
      });
    }
  }

  void _toggle(String rating) {
    final current = _parseStored(
      GetIt.instance<UserPreferences>().get(
        UserPreferences.blockedParentalRatings,
      ),
    );
    if (current.contains(rating)) {
      current.remove(rating);
    } else {
      current.add(rating);
    }
    _blockedRatings.value = current.join(',');
    setState(() {});
  }

  Widget _ratingTile(
    BuildContext context, {
    required String rating,
    required bool isBlocked,
    required bool isFirst,
  }) {
    return TvFocusHighlight(
        builder: (_, focused) => ListTile(
          focusNode: isFirst ? _firstRatingFocusNode : null,
          autofocus: PlatformDetection.isTV && isFirst,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          leading: IconTheme(
            data: IconThemeData(
              color: focused
                  ? AppColors.black.withValues(alpha: 0.54)
                  : AppColorScheme.onSurface.withValues(
                      alpha: 0.7,
                    ),
              size: 24,
            ),
            child: Icon(
              isBlocked
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
            ),
          ),
          title: DefaultTextStyle.merge(
            style: TextStyle(
              color: focused
                  ? AppColors.black.withValues(alpha: 0.87)
                  : AppColorScheme.onSurface,
            ),
            child: Text(rating),
          ),
          onTap: () => _toggle(rating),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final ratings = _effectiveRatings;
    final targetNode =
        PlatformDetection.isTV && !_loadingRatings && ratings.isNotEmpty
        ? _firstRatingFocusNode
        : null;
    return RequestInitialFocus(
      targetNode: targetNode,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final ratings = _effectiveRatings;
    final ranked = ratings.where(_ranks).toList();
    final unranked = ratings.where((r) => !_ranks(r)).toList();

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.parentalControls)),
        body: ValueListenableBuilder<String>(
          valueListenable: _blockedRatings,
          builder: (context, blockedValue, _) {
            final blocked = _parseStored(blockedValue);

            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(l10n.blockContentWithRatings),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    l10n.blockedRatingsCeilingHint,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                if (_loadingRatings)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (ratings.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _ratingsError == null
                          ? l10n.noContentRatingsFound
                          : l10n.couldNotLoadServerRatings,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                else ...[
                  if (_ratingsError != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                      child: Text(
                        l10n.couldNotRefreshRatings,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  SettingsSectionHeader(l10n.ratings),
                  adaptiveListSection(
                    children: [
                      for (final (index, rating) in ranked.indexed)
                        _ratingTile(
                          context,
                          rating: rating,
                          isBlocked: blocked.contains(rating),
                          isFirst: index == 0,
                        ),
                    ],
                  ),
                  // These can't be placed on the ladder, so they can't say
                  // anything about what else to hide.
                  if (unranked.isNotEmpty) ...[
                    SettingsSectionHeader(l10n.blockedRatingsUnrankedSection),
                    adaptiveListSection(
                      children: [
                        for (final rating in unranked)
                          _ratingTile(
                            context,
                            rating: rating,
                            isBlocked: blocked.contains(rating),
                            isFirst: false,
                          ),
                      ],
                    ),
                  ],
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
