import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/focus/key_event_utils.dart';
import '../../navigation/destinations.dart';
import '../../widgets/focus/request_initial_focus.dart';

class LiveTvScreen extends StatelessWidget {
  const LiveTvScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = <({IconData icon, String title, VoidCallback onTap})>[
      (
        icon: Icons.tv,
        title: l10n.guide,
        onTap: () => context.push(Destinations.liveTvGuide),
      ),
      (
        icon: Icons.fiber_dvr,
        title: l10n.recordings,
        onTap: () => context.push(Destinations.liveTvRecordings),
      ),
      (
        icon: Icons.schedule,
        title: l10n.schedule,
        onTap: () => context.push(Destinations.liveTvSchedule),
      ),
      (
        icon: Icons.repeat,
        title: l10n.seriesRecordings,
        onTap: () => context.push(Destinations.liveTvSeriesRecordings),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF07111F),
              const Color(0xFF0F2238),
              AppColorScheme.accent.withValues(alpha: 0.18),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final columns = width >= 1100 ? 2 : 1;
              final childAspectRatio = columns == 2 ? 2.8 : 3.6;

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1240),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 28, 32, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Live TV',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          l10n.guide,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: Colors.white70),
                        ),
                        const SizedBox(height: 28),
                        Expanded(
                          child: GridView.builder(
                            itemCount: items.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: columns,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: childAspectRatio,
                                ),
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return _LiveTvMenuCard(
                                icon: item.icon,
                                title: item.title,
                                autofocus: index == 0,
                                onTap: item.onTap,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LiveTvMenuCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool autofocus;
  final VoidCallback onTap;

  const _LiveTvMenuCard({
    required this.icon,
    required this.title,
    required this.autofocus,
    required this.onTap,
  });

  @override
  State<_LiveTvMenuCard> createState() => _LiveTvMenuCardState();
}

class _LiveTvMenuCardState extends State<_LiveTvMenuCard> {
  bool _focused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    return handleOneShotSelect(event, widget.onTap);
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _focused
        ? AppColorScheme.accent
        : Colors.white.withValues(alpha: 0.12);
    final shadowColor = _focused
        ? AppColorScheme.accent.withValues(alpha: 0.28)
        : Colors.black.withValues(alpha: 0.16);

    return Focus(
      autofocus: widget.autofocus,
      focusNode: _focusNode,
      onKeyEvent: _onKeyEvent,
      onFocusChange: (focused) {
        if (_focused != focused) {
          setState(() => _focused = focused);
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..scaleByDouble(_focused ? 1.02 : 1.0, _focused ? 1.02 : 1.0, 1.0, 1.0),
          decoration: BoxDecoration(
            color: const Color(0xCC101822),
            borderRadius: AppRadius.circular(24),
            border: Border.all(color: borderColor, width: _focused ? 2.4 : 1),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: _focused ? 28 : 16,
                spreadRadius: _focused ? 2 : 0,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
            child: Row(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: AppColorScheme.accent.withValues(alpha: 0.16),
                    borderRadius: AppRadius.circular(20),
                  ),
                  child: Icon(widget.icon, color: Colors.white, size: 34),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white.withValues(alpha: _focused ? 0.92 : 0.55),
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
