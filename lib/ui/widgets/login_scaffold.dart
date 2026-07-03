import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

const _kCardRadius = 20.0;
const _kCardMaxWidth = 700.0;
const _kMoonfinCardColor = Color(0xCC111528);
const _kMoonfinCardBorderColor = Color(0x33FFFFFF);

class LoginScaffold extends StatelessWidget {
  final double maxWidth;
  final Widget child;
  final Widget? header;
  final Widget? footer;

  const LoginScaffold({
    super.key,
    this.maxWidth = _kCardMaxWidth,
    this.header,
    this.footer,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isMoonfin = ThemeRegistry.active.id == ThemeRegistry.moonfinId;
    final gradientColors = isMoonfin
        ? const [Color(0xFF0a0a0a), Color(0xFF1a1a2e), Color(0xFF16213e)]
        : [
            AppColorScheme.background,
            AppColorScheme.surfaceVariant,
            AppColorScheme.surface,
          ];
      final cardColor = isMoonfin
        ? _kMoonfinCardColor
        : AppColorScheme.surface.withAlpha(0xCC);
      final cardBorder = isMoonfin
        ? Border.all(color: _kMoonfinCardBorderColor)
        : Border.fromBorderSide(ThemeRegistry.active.borders.cardBorder);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
        ),
        child: SafeArea(
          child: Align(
            alignment: const Alignment(0, -0.6),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ?header,
                    Container(
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: AppRadius.circular(_kCardRadius),
                        border: cardBorder,
                      ),
                      padding: const EdgeInsets.all(32),
                      child: child,
                    ),
                    ?footer,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
