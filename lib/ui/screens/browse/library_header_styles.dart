import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../mixins/focus_state_mixin.dart';
import '../../widgets/alphabet_scrub_rail.dart';
import '../../widgets/focus/focus_theme.dart';
import '../../widgets/focus/focusable_toolbar_button.dart';
import '../../widgets/local_search_field.dart';

/// Height of the floating Docked bar on phones.
const kDockedBarHeight = 64.0;

/// Gap between the floating Docked bar and the edges of the screen.
const kDockedBarMargin = 16.0;

/// Width of the Docked side panel before the UI scale.
const kDockedPanelWidth = 300.0;

const _kHorizontalPadding = 60.0;

double _uiScale() => GetIt.instance<UserPreferences>()
    .get(UserPreferences.desktopUiScale)
    .scaleFactor;

/// Everything the Modern and Docked headers show and do. The screen builds
/// one per frame, so the headers share it instead of each taking every value.
@immutable
class LibraryHeaderModel {
  const LibraryHeaderModel({
    required this.title,
    required this.itemCount,
    required this.homeFocusNode,
    required this.sortFocusNode,
    required this.searchFocusNode,
    required this.allLetterFocusNode,
    required this.searchController,
    required this.onSearchChanged,
    required this.onTvSearchKey,
    required this.onHome,
    required this.sortLabel,
    required this.sortAscending,
    required this.onSort,
    required this.groupLabel,
    required this.showLabel,
    required this.alphabetApplies,
    required this.alphabetOn,
    required this.onToggleAlphabet,
    required this.onLetter,
    this.onGroupBy,
    this.onShow,
    this.displayLabel,
    this.onDisplay,
    this.onShuffle,
    this.hud,
  });

  final String title;

  /// Zero hides the count.
  final int itemCount;

  /// Home on TV and Back everywhere else, and where the screen's focus starts.
  final FocusNode homeFocusNode;
  final FocusNode sortFocusNode;
  final FocusNode searchFocusNode;

  /// Sits on `#`, where Up and Back from the grid land.
  final FocusNode allLetterFocusNode;
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final FocusOnKeyEventCallback onTvSearchKey;
  final VoidCallback onHome;

  final String sortLabel;
  final bool sortAscending;
  final VoidCallback onSort;

  /// Shown when [onGroupBy] is set, which is only for movies and series.
  final String groupLabel;
  final VoidCallback? onGroupBy;

  /// The played status filter, shown when [onShow] is set.
  final String showLabel;
  final VoidCallback? onShow;

  final String? displayLabel;
  final VoidCallback? onDisplay;
  final VoidCallback? onShuffle;

  /// Whether the current sort can jump by letter at all.
  final bool alphabetApplies;

  /// The Show Alphabet setting.
  final bool alphabetOn;
  final VoidCallback onToggleAlphabet;
  final ValueChanged<String> onLetter;

  /// The focused item details, only on TV and desktop.
  final Widget? hud;

  /// TV and desktop draw the letters in the header. Phones get the scrub rail.
  bool get showAlpha => alphabetApplies && alphabetOn;
}

/// The Modern header: Home, a wide search and labeled pills in one bar on TV
/// and desktop, with the letters under it. Phones get [CompactLibraryHeader].
class ModernLibraryHeader extends StatelessWidget {
  const ModernLibraryHeader({
    super.key,
    required this.model,
    required this.compact,
  });

  final LibraryHeaderModel model;
  final bool compact;

  /// Down from anywhere in the bar lands on `#` when the letters show, so the
  /// letter row is never skipped by a geometric guess.
  KeyEventResult _onBarKey(FocusNode node, KeyEvent event) {
    if (!event.isActionable || !event.logicalKey.isDownKey) {
      return KeyEventResult.ignored;
    }
    if (model.allLetterFocusNode.context?.mounted != true) {
      return KeyEventResult.ignored;
    }
    model.allLetterFocusNode.requestFocus();
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    if (compact) return CompactLibraryHeader(model: model, showControls: true);

    final m = model;
    final l10n = AppLocalizations.of(context);
    final scale = _uiScale();
    final hPad = _kHorizontalPadding * scale;
    final gap = SizedBox(width: 4 * scale);

    return Padding(
      padding: EdgeInsets.fromLTRB(hPad, 16 * scale, hPad, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _LibraryTitle(m, fontSize: 30 * scale),
          SizedBox(height: 10 * scale),
          Focus(
            canRequestFocus: false,
            skipTraversal: true,
            onKeyEvent: _onBarKey,
            child: Container(
              padding: EdgeInsets.all(6 * scale),
              decoration: BoxDecoration(
                color: AppColorScheme.surface.withValues(alpha: 0.6),
                borderRadius: AppRadius.circular(16),
                border: Border.all(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.06),
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) => Row(
                  children: [
                    _homeButton(m, 44 * scale, 22 * scale),
                    _BarDivider(scale),
                    Expanded(
                      child: LocalSearchField(
                        controller: m.searchController,
                        focusNode: m.searchFocusNode,
                        onChanged: m.onSearchChanged,
                        onTvKeyEvent: m.onTvSearchKey,
                      ),
                    ),
                    _BarDivider(scale),
                    // The pills keep their natural width and scroll once a
                    // narrow window can't fit them beside the search.
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth * 0.62,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _Pill(
                              focusNode: m.sortFocusNode,
                              icon: Icons.sort,
                              label: l10n.sortBy,
                              value: m.sortLabel,
                              trailing: m.sortAscending
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              onTap: m.onSort,
                            ),
                            if (m.onGroupBy != null) ...[
                              gap,
                              _Pill(
                                icon: Icons.category_outlined,
                                label: l10n.groupByTitle,
                                value: m.groupLabel,
                                onTap: m.onGroupBy!,
                              ),
                            ],
                            if (m.onShow != null) ...[
                              gap,
                              _Pill(
                                icon: Icons.filter_list,
                                label: l10n.libraryShowLabel,
                                value: m.showLabel,
                                onTap: m.onShow!,
                              ),
                            ],
                            if (m.onShuffle != null) ...[
                              gap,
                              FocusableToolbarButton(
                                icon: Icons.shuffle,
                                tooltip: l10n.shuffle,
                                size: 44 * scale,
                                iconSize: 22 * scale,
                                onTap: m.onShuffle!,
                              ),
                            ],
                            if (m.onDisplay != null) ...[
                              gap,
                              FocusableToolbarButton(
                                icon: Icons.settings,
                                tooltip: l10n.display,
                                size: 44 * scale,
                                iconSize: 22 * scale,
                                onTap: m.onDisplay!,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (m.hud != null) ...[const SizedBox(height: 6), m.hud!],
          if (m.showAlpha) ...[
            SizedBox(height: 8 * scale),
            AlphaPickerBar(
              onChanged: m.onLetter,
              allFocusNode: m.allLetterFocusNode,
            ),
          ],
          SizedBox(height: 4 * scale),
        ],
      ),
    );
  }
}

/// The phone header for Modern and Docked: Back, the title and search. With
/// [showControls] it also carries Settings and a row of labeled chips, which
/// Docked keeps in its bottom bar instead.
class CompactLibraryHeader extends StatelessWidget {
  const CompactLibraryHeader({
    super.key,
    required this.model,
    required this.showControls,
  });

  final LibraryHeaderModel model;
  final bool showControls;

  @override
  Widget build(BuildContext context) {
    final m = model;
    final l10n = AppLocalizations.of(context);
    final topPad = MediaQuery.paddingOf(context).top + 8;
    const gap = SizedBox(width: 8);

    return Padding(
      padding: EdgeInsets.fromLTRB(16, topPad, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _homeButton(m, 40, 24),
              const SizedBox(width: 8),
              Expanded(child: _LibraryTitle(m, fontSize: 24)),
              if (showControls && m.onShuffle != null)
                FocusableToolbarButton(
                  icon: Icons.shuffle,
                  tooltip: l10n.shuffle,
                  size: 40,
                  iconSize: 22,
                  onTap: m.onShuffle!,
                ),
              if (showControls && m.onDisplay != null)
                FocusableToolbarButton(
                  icon: Icons.settings,
                  tooltip: l10n.display,
                  size: 40,
                  iconSize: 22,
                  onTap: m.onDisplay!,
                ),
            ],
          ),
          const SizedBox(height: 8),
          LocalSearchField(
            controller: m.searchController,
            focusNode: m.searchFocusNode,
            onChanged: m.onSearchChanged,
            onTvKeyEvent: m.onTvSearchKey,
          ),
          if (showControls) ...[
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _Pill(
                    compact: true,
                    focusNode: m.sortFocusNode,
                    icon: Icons.sort,
                    label: l10n.sortBy,
                    value: m.sortLabel,
                    trailing: m.sortAscending
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    onTap: m.onSort,
                  ),
                  if (m.onGroupBy != null) ...[
                    gap,
                    _Pill(
                    compact: true,
                      icon: Icons.category_outlined,
                      label: l10n.groupByTitle,
                      value: m.groupLabel,
                      onTap: m.onGroupBy!,
                    ),
                  ],
                  if (m.onShow != null) ...[
                    gap,
                    _Pill(
                    compact: true,
                      icon: Icons.filter_list,
                      label: l10n.libraryShowLabel,
                      value: m.showLabel,
                      onTap: m.onShow!,
                    ),
                  ],
                ],
              ),
            ),
          ],
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

/// The Docked side panel on TV and desktop: Home and the title, search, a
/// labeled row per control and the letters in a grid.
///
/// Its controls live in their own [FocusScope] so the grid can send focus
/// back to whichever one was last used. Right moves along a letter row and
/// otherwise leaves the panel through [onExitRight].
class DockedLibraryPanel extends StatelessWidget {
  const DockedLibraryPanel({
    super.key,
    required this.model,
    required this.scopeNode,
    required this.onExitRight,
  });

  final LibraryHeaderModel model;
  final FocusScopeNode scopeNode;
  final VoidCallback onExitRight;

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (!event.isActionable || !event.logicalKey.isRightKey) {
      return KeyEventResult.ignored;
    }
    final moved =
        FocusManager.instance.primaryFocus?.focusInDirection(
          TraversalDirection.right,
        ) ??
        false;
    if (!moved) onExitRight();
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    final m = model;
    final l10n = AppLocalizations.of(context);
    final scale = _uiScale();
    final rowGap = SizedBox(height: 4 * scale);

    return Container(
      width: kDockedPanelWidth * scale,
      decoration: BoxDecoration(
        color: AppColorScheme.surface.withValues(alpha: 0.55),
        border: Border(
          right: BorderSide(
            color: AppColorScheme.onSurface.withValues(alpha: 0.06),
          ),
        ),
      ),
      child: FocusScope(
        node: scopeNode,
        onKeyEvent: _onKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            20 * scale,
            24 * scale,
            20 * scale,
            20 * scale,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  _homeButton(m, 44 * scale, 22 * scale),
                  SizedBox(width: 10 * scale),
                  Expanded(
                    child: _LibraryTitle(
                      m,
                      fontSize: 26 * scale,
                      stacked: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16 * scale),
              LocalSearchField(
                controller: m.searchController,
                focusNode: m.searchFocusNode,
                onChanged: m.onSearchChanged,
                onTvKeyEvent: m.onTvSearchKey,
              ),
              SizedBox(height: 16 * scale),
              _PanelRow(
                focusNode: m.sortFocusNode,
                icon: Icons.sort,
                label: l10n.sortBy,
                value: m.sortLabel,
                trailing: m.sortAscending
                    ? Icons.arrow_upward
                    : Icons.arrow_downward,
                onTap: m.onSort,
              ),
              if (m.onGroupBy != null) ...[
                rowGap,
                _PanelRow(
                  icon: Icons.category_outlined,
                  label: l10n.groupByTitle,
                  value: m.groupLabel,
                  onTap: m.onGroupBy!,
                ),
              ],
              if (m.onShow != null) ...[
                rowGap,
                _PanelRow(
                  icon: Icons.filter_list,
                  label: l10n.libraryShowLabel,
                  value: m.showLabel,
                  onTap: m.onShow!,
                ),
              ],
              if (m.onShuffle != null) ...[
                rowGap,
                _PanelRow(
                  icon: Icons.shuffle,
                  label: l10n.shuffle,
                  onTap: m.onShuffle!,
                ),
              ],
              if (m.onDisplay != null) ...[
                rowGap,
                _PanelRow(
                  icon: Icons.grid_view,
                  label: l10n.display,
                  value: m.displayLabel,
                  onTap: m.onDisplay!,
                ),
              ],
              if (m.showAlpha) ...[
                SizedBox(height: 12 * scale),
                Divider(
                  height: 1,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.08),
                ),
                SizedBox(height: 12 * scale),
                Text(
                  l10n.libraryJumpToLetter,
                  style: TextStyle(
                    fontSize: 12 * scale,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                SizedBox(height: 8 * scale),
                _LetterGrid(m, scale: scale),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// The floating Docked bar on phones, with the header above it coming from
/// [CompactLibraryHeader].
class DockedLibraryBar extends StatelessWidget {
  const DockedLibraryBar({super.key, required this.model});

  final LibraryHeaderModel model;

  @override
  Widget build(BuildContext context) {
    final m = model;
    final l10n = AppLocalizations.of(context);
    return Container(
      height: kDockedBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: AppColorScheme.surface.withValues(alpha: 0.96),
        borderRadius: AppRadius.circular(20),
        border: Border.all(
          color: AppColorScheme.onSurface.withValues(alpha: 0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          _BarButton(icon: Icons.sort, label: l10n.sortBy, onTap: m.onSort),
          if (m.onShow != null)
            _BarButton(
              icon: Icons.filter_list,
              label: l10n.libraryShowLabel,
              onTap: m.onShow!,
            ),
          if (m.onGroupBy != null)
            _BarButton(
              icon: Icons.category_outlined,
              label: l10n.groupByTitle,
              onTap: m.onGroupBy!,
            ),
          if (m.onShuffle != null)
            _BarButton(
              icon: Icons.shuffle,
              label: l10n.shuffle,
              onTap: m.onShuffle!,
            ),
          // Lets the alphabet come back after it's switched off, so it shows
          // whenever the sort can jump by letter rather than only while on.
          if (m.alphabetApplies)
            _BarButton(
              icon: Icons.sort_by_alpha,
              label: l10n.libraryAToZ,
              toggled: m.alphabetOn,
              onTap: m.onToggleAlphabet,
            ),
          if (m.onDisplay != null)
            _BarButton(
              icon: Icons.grid_view,
              label: l10n.display,
              onTap: m.onDisplay!,
            ),
        ],
      ),
    );
  }
}

/// The library's A to Z row on TV and desktop.
class AlphaPickerBar extends StatelessWidget {
  final FocusNode? allFocusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback? onUpKey;

  const AlphaPickerBar({
    super.key,
    required this.onChanged,
    this.allFocusNode,
    this.onUpKey,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: kAlphabetLetters.map((letter) {
          return AlphaLetterButton(
            label: letter,
            onTap: () => onChanged(letter),
            // Letters jump rather than filter, so there is no All entry and
            // the first letter is where the grid hands focus back to the bar.
            focusNode: letter == kAlphabetLetters.first ? allFocusNode : null,
            onUpKey: onUpKey,
          );
        }).toList(),
      ),
    );
  }
}

class AlphaLetterButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final FocusNode? focusNode;
  final VoidCallback? onUpKey;

  const AlphaLetterButton({
    super.key,
    required this.label,
    required this.onTap,
    this.focusNode,
    this.onUpKey,
  });

  @override
  State<AlphaLetterButton> createState() => _AlphaLetterButtonState();
}

class _AlphaLetterButtonState extends State<AlphaLetterButton>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final desktopScale = _uiScale();
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (f) => setFocused(f),
        onKeyEvent: (_, event) {
          if (event.isActionable &&
              event.logicalKey.isUpKey &&
              widget.onUpKey != null) {
            widget.onUpKey!();
            return KeyEventResult.handled;
          }
          if (isActivateKey(event)) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            width: 30 * desktopScale,
            height: 30 * desktopScale,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: AppRadius.circular(4),
              border: showFocusBorder
                  ? Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder.copyWith(
                        color: focusColor,
                        width: 1.5,
                      ),
                    )
                  : null,
            ),
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 15 * desktopScale,
                fontWeight: focused || hovered
                    ? FontWeight.w700
                    : FontWeight.w500,
                color: focused || hovered
                    ? AppColorScheme.accent
                    : AppColorScheme.onSurface.withValues(alpha: 0.85),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _homeButton(LibraryHeaderModel m, double size, double iconSize) =>
    FocusableToolbarButton(
      focusNode: m.homeFocusNode,
      icon: PlatformDetection.isTV ? Icons.home : Icons.arrow_back,
      size: size,
      iconSize: iconSize,
      onTap: m.onHome,
    );

class _LibraryTitle extends StatelessWidget {
  const _LibraryTitle(
    this.model, {
    required this.fontSize,
    this.stacked = false,
  });

  final LibraryHeaderModel model;
  final double fontSize;
  final bool stacked;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final title = Text(
      model.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        height: 1.15,
        fontWeight: FontWeight.w300,
        color: onSurface,
      ),
    );
    if (model.itemCount <= 0) return title;
    final count = Text(
      AppLocalizations.of(context).itemCountLabel(model.itemCount),
      maxLines: 1,
      style: TextStyle(
        fontSize: (fontSize * 0.5).clamp(12.0, 18.0),
        color: onSurface.withValues(alpha: 0.6),
      ),
    );
    if (stacked) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [title, count],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Flexible(child: title),
        SizedBox(width: fontSize * 0.45),
        count,
      ],
    );
  }
}

class _BarDivider extends StatelessWidget {
  const _BarDivider(this.scale);

  final double scale;

  @override
  Widget build(BuildContext context) => Container(
    width: 1,
    height: 28 * scale,
    margin: EdgeInsets.symmetric(horizontal: 6 * scale),
    color: AppColorScheme.onSurface.withValues(alpha: 0.1),
  );
}

/// Focus, hover, select and tap handling shared by every new control, which
/// only differ in how they draw.
class _Pressable extends StatefulWidget {
  const _Pressable({
    required this.onTap,
    required this.builder,
    this.focusNode,
  });

  final VoidCallback onTap;
  final FocusNode? focusNode;

  /// [focused] fills the control, [highlighted] (focus or hover) draws the
  /// focus border, the way [FocusableToolbarButton] does.
  final Widget Function(bool focused, bool highlighted, Color focusColor)
  builder;

  @override
  State<_Pressable> createState() => _PressableState();
}

class _PressableState extends State<_Pressable> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: Focus(
          focusNode: widget.focusNode,
          onFocusChange: setFocused,
          onKeyEvent: (_, event) {
            if (isActivateKey(event)) {
              widget.onTap();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onTap,
            child: widget.builder(focused, showFocusBorder, focusColor),
          ),
        ),
      ),
    );
  }
}

/// [FocusTheme.focusDecoration] with a clear border while unfocused, so a
/// control that sizes to its label doesn't grow when focus arrives.
BoxDecoration _controlDecoration({
  required bool focused,
  required bool highlighted,
  required Color focusColor,
  required double radius,
  Color idle = Colors.transparent,
}) {
  final decoration = FocusTheme.focusDecoration(
    isFocused: highlighted,
    radius: radius,
    color: focusColor,
    backgroundColor: focused ? AppColorScheme.onSurface : idle,
    suppressFocusGlow: ThemeRegistry.active.id == ThemeRegistry.neonPulseId,
  );
  if (decoration.border != null) return decoration;
  return decoration.copyWith(
    border: Border.all(
      color: Colors.transparent,
      width: FocusTheme.borderWidth,
    ),
  );
}

Color _foreground(bool focused) =>
    focused ? AppColors.black : AppColorScheme.onSurface;

/// A Modern bar control: an icon, its name and the value it's set to. Phones
/// get the [compact] version, sized for touch rather than the UI scale.
class _Pill extends StatelessWidget {
  const _Pill({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    this.trailing,
    this.focusNode,
    this.compact = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final IconData? trailing;
  final VoidCallback onTap;
  final FocusNode? focusNode;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final scale = compact ? 1.0 : _uiScale();
    return _Pressable(
      focusNode: focusNode,
      onTap: onTap,
      builder: (focused, highlighted, focusColor) {
        final fg = _foreground(focused);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 44 * scale,
          padding: compact
              ? const EdgeInsets.fromLTRB(12, 0, 16, 0)
              : EdgeInsets.symmetric(horizontal: 12 * scale),
          decoration: _controlDecoration(
            focused: focused,
            highlighted: highlighted,
            focusColor: focusColor,
            radius: compact ? 22 : 12,
            idle: compact
                ? AppColorScheme.surface.withValues(alpha: 0.72)
                : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: (compact ? 18 : 20) * scale,
                color: fg.withValues(alpha: 0.7),
              ),
              SizedBox(width: (compact ? 6 : 8) * scale),
              Text(
                label,
                style: TextStyle(
                  fontSize: (compact ? 14 : 15) * scale,
                  fontWeight: FontWeight.w500,
                  color: fg,
                ),
              ),
              SizedBox(width: 6 * scale),
              Text(
                value,
                style: TextStyle(
                  fontSize: (compact ? 14 : 15) * scale,
                  color: fg.withValues(alpha: 0.6),
                ),
              ),
              if (trailing != null) ...[
                SizedBox(width: 4 * scale),
                Icon(trailing, size: (compact ? 14 : 16) * scale, color: fg),
              ],
            ],
          ),
        );
      },
    );
  }
}

/// A Docked panel row: an icon, its name, the value it's set to and a
/// chevron.
class _PanelRow extends StatelessWidget {
  const _PanelRow({
    required this.icon,
    required this.label,
    required this.onTap,
    this.value,
    this.trailing,
    this.focusNode,
  });

  final IconData icon;
  final String label;
  final String? value;
  final IconData? trailing;
  final VoidCallback onTap;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final scale = _uiScale();
    return _Pressable(
      focusNode: focusNode,
      onTap: onTap,
      builder: (focused, highlighted, focusColor) {
        final fg = _foreground(focused);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 48 * scale,
          padding: EdgeInsets.fromLTRB(12 * scale, 0, 8 * scale, 0),
          decoration: _controlDecoration(
            focused: focused,
            highlighted: highlighted,
            focusColor: focusColor,
            radius: 10,
          ),
          child: Row(
            children: [
              Icon(icon, size: 20 * scale, color: fg.withValues(alpha: 0.7)),
              SizedBox(width: 12 * scale),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15 * scale,
                  fontWeight: FontWeight.w500,
                  color: fg,
                ),
              ),
              SizedBox(width: 8 * scale),
              Expanded(
                child: Text(
                  value ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14 * scale,
                    color: fg.withValues(alpha: 0.6),
                  ),
                ),
              ),
              if (trailing != null) ...[
                SizedBox(width: 4 * scale),
                Icon(trailing, size: 16 * scale, color: fg),
              ],
              Icon(
                Icons.chevron_right,
                size: 18 * scale,
                color: fg.withValues(alpha: 0.5),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// The Docked letters, seven to a row with `#` first.
class _LetterGrid extends StatelessWidget {
  const _LetterGrid(this.model, {required this.scale});

  static const _columns = 7;

  final LibraryHeaderModel model;
  final double scale;

  @override
  Widget build(BuildContext context) {
    const letters = kAlphabetLetters;
    return Column(
      children: [
        for (var row = 0; row * _columns < letters.length; row++)
          Padding(
            padding: EdgeInsets.only(bottom: 4 * scale),
            child: Row(
              children: [
                for (var col = 0; col < _columns; col++)
                  Expanded(
                    child: row * _columns + col < letters.length
                        ? Center(
                            child: AlphaLetterButton(
                              label: letters[row * _columns + col],
                              onTap: () =>
                                  model.onLetter(letters[row * _columns + col]),
                              focusNode: row == 0 && col == 0
                                  ? model.allLetterFocusNode
                                  : null,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

/// A Docked phone bar button, an icon over its name.
class _BarButton extends StatelessWidget {
  const _BarButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.toggled,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  /// Set for an on/off button, which tints while on.
  final bool? toggled;

  @override
  Widget build(BuildContext context) {
    final button = _Pressable(
      onTap: onTap,
      builder: (focused, highlighted, focusColor) {
        final on = toggled ?? false;
        final fg = focused
            ? AppColors.black
            : on
            ? AppColorScheme.accent
            : AppColorScheme.onSurface;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: _controlDecoration(
            focused: focused,
            highlighted: highlighted,
            focusColor: focusColor,
            radius: 14,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 22, color: fg),
              const SizedBox(height: 3),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: fg,
                ),
              ),
            ],
          ),
        );
      },
    );
    return Expanded(
      child: toggled == null
          ? button
          : Semantics(toggled: toggled, child: button),
    );
  }
}
