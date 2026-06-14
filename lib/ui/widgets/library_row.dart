import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../l10n/app_localizations.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import 'horizontal_scroll_section.dart';

class LibraryRow extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final VoidCallback? onSeeAll;
  final double? rowHeight;
  final ScrollController? scrollController;
  final bool isLoading;

  const LibraryRow({
    super.key,
    required this.title,
    required this.children,
    this.onSeeAll,
    this.rowHeight,
    this.scrollController,
    this.isLoading = false,
  });

  @override
  State<LibraryRow> createState() => _LibraryRowState();
}

class _LibraryRowState extends State<LibraryRow> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hasItems = widget.children.isNotEmpty;
    final showControls = hasItems && PlatformDetection.useDesktopUi;
    final desktopScale = GetIt.instance<UserPreferences>()
        .get(UserPreferences.desktopUiScale)
        .scaleFactor;
    final rowHeight = (widget.rowHeight ?? 220) * desktopScale;
    return HorizontalScrollSection(
      title: widget.title,
      scrollController: widget.scrollController,
      titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: AppColorScheme.onSurface,
        fontWeight: FontWeight.w700,
      ),
      headerPadding: EdgeInsets.fromLTRB(
        16 * desktopScale,
        16 * desktopScale,
        8 * desktopScale,
        8 * desktopScale,
      ),
      contentSpacing: 0,
      trailing: widget.onSeeAll == null
          ? null
          : TextButton(
              onPressed: widget.onSeeAll,
              child: Text(l10n.seeAll),
            ),
      showControls: showControls,
      builder: (_, scrollController) => SizedBox(
        height: rowHeight + (10 * desktopScale),
        child: widget.isLoading
            ? Center(
                child: SizedBox(
                  width: 24 * desktopScale,
                  height: 24 * desktopScale,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            : hasItems
                ? ListView.separated(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.fromLTRB(
                      20 * desktopScale,
                      5 * desktopScale,
                      20 * desktopScale,
                      5 * desktopScale,
                    ),
                    itemCount: widget.children.length,
                    separatorBuilder: (_, _) =>
                        SizedBox(width: 12 * desktopScale),
                    itemBuilder: (_, i) => widget.children[i],
                  )
                : Center(
                    child: Text(
                      l10n.noItems,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(128),
                          ),
                    ),
                  ),
      ),
    );
  }
}
