import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/viewmodels/item_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../widgets/overlay_sheet.dart';

String getCollectionSortLabel(
  CollectionSortOption option,
  AppLocalizations l10n,
) {
  return switch (option) {
    CollectionSortOption.server => l10n.sortServerOrder,
    CollectionSortOption.alphabetical => l10n.sortAlphabetical,
    CollectionSortOption.releaseAscending => l10n.sortReleaseAscending,
    CollectionSortOption.releaseDescending => l10n.sortReleaseDescending,
    CollectionSortOption.custom => l10n.sortCustomDragDrop,
  };
}

Future<void> showCollectionSortDialog(
  BuildContext context, {
  required ItemDetailViewModel vm,
}) {
  final l10n = AppLocalizations.of(context);
  return showFocusRestoringDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        backgroundColor: const Color(0xFF1E1E24),
        title: Text(
          l10n.playlistSortOptions,
          style: Theme.of(dialogContext).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: CollectionSortOption.values.map((option) {
            final active = vm.collectionSort == option;
            void pick() {
              vm.setCollectionSort(option);
              Navigator.of(dialogContext).pop();
            }

            return Focus(
              autofocus: active,
              onKeyEvent: (_, event) {
                if (isActivateKey(event)) {
                  pick();
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              child: Builder(
                builder: (optionContext) {
                  final focused = Focus.of(optionContext).hasFocus;
                  return InkWell(
                    onTap: pick,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: focused ? Colors.white12 : Colors.transparent,
                        borderRadius: AppRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            active
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: active
                                ? AppColorScheme.accent
                                : Colors.white54,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            getCollectionSortLabel(option, l10n),
                            style: Theme.of(dialogContext)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: active
                                      ? AppColorScheme.accent
                                      : Colors.white,
                                  fontWeight: active
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
      );
    },
  );
}
