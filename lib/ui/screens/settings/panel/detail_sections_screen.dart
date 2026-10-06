part of '../settings_side_panel.dart';

/// Switches for the parts of the details screen, limited to what the chosen
/// style draws. The hidden list is shared, so a section switched off under one
/// style stays off after switching to another.
class _DetailSectionsScreen extends StatelessWidget {
  const _DetailSectionsScreen();

  String _groupTitle(DetailSectionGroup group, AppLocalizations l10n) =>
      switch (group) {
        DetailSectionGroup.header => l10n.detailSectionGroupHeader,
        DetailSectionGroup.sections => l10n.detailSectionGroupSections,
        DetailSectionGroup.seerr =>
          GetIt.instance<SeerrPreferences>().labelOrDefault(l10n.seerr),
        DetailSectionGroup.person => l10n.detailSectionGroupPerson,
        DetailSectionGroup.collection => l10n.detailSectionGroupCollection,
        DetailSectionGroup.other => l10n.detailSectionGroupOther,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final hint = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final prefs = GetIt.instance<UserPreferences>();

    return RequestInitialFocus(
      child: withCleanSettingsTypography(
        context,
        Scaffold(
          appBar: buildSettingsAppBar(context, Text(l10n.detailSections)),
          body: ListenableBuilder(
            listenable: prefs,
            builder: (context, _) {
              final style = prefs.get(UserPreferences.detailScreenStyle);
              final offered = DetailSection.values
                  .where((s) => s.isOffered && s.isAvailableIn(style))
                  .toList();
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                    child: Text(
                      l10n.detailSectionsScreenDescription,
                      style: hint,
                    ),
                  ),
                  for (final group in DetailSectionGroup.values)
                    if (offered.any((s) => s.group == group)) ...[
                      _SectionHeader(_groupTitle(group, l10n)),
                      ButtonLayoutList(
                        key: ValueKey('detailSections:${group.name}'),
                        layout: detailSectionLayout,
                        entries: [
                          for (final section in offered.where(
                            (s) => s.group == group,
                          ))
                            ButtonLayoutEntry(
                              id: section.id,
                              title: section.label(l10n),
                              subtitle: section.subtitle(l10n),
                              icon: section.icon,
                            ),
                        ],
                      ),
                    ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
