import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/lyrics.dart';
import '../../../l10n/app_localizations.dart';

class LyricsView extends StatefulWidget {
  final LyricsData lyrics;
  final Stream<Duration> positionStream;
  final Duration position;

  /// Called when the user taps (or D-pad selects) a synced line, with that
  /// line's timestamp so the player can seek to it. Null disables seeking.
  final ValueChanged<Duration>? onSeekToLine;

  const LyricsView({
    super.key,
    required this.lyrics,
    required this.positionStream,
    required this.position,
    this.onSeekToLine,
  });

  @override
  State<LyricsView> createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  final _scrollController = ScrollController();
  StreamSubscription<Duration>? _sub;
  late List<GlobalKey> _lineKeys;
  int _activeIndex = -1;

  @override
  void initState() {
    super.initState();
    _lineKeys = _buildLineKeys(widget.lyrics.lines.length);
    if (widget.lyrics.isSynced) {
      _updateActive(widget.position);
      _sub = widget.positionStream.listen(_updateActive);
    }
  }

  @override
  void didUpdateWidget(covariant LyricsView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.lyrics.lines.length != widget.lyrics.lines.length) {
      _lineKeys = _buildLineKeys(widget.lyrics.lines.length);
    }

    if (oldWidget.lyrics.isSynced != widget.lyrics.isSynced ||
        !identical(oldWidget.positionStream, widget.positionStream)) {
      _sub?.cancel();
      _sub = null;
      if (widget.lyrics.isSynced) {
        _sub = widget.positionStream.listen(_updateActive);
      }
    }

    if (widget.lyrics.isSynced) {
      _updateActive(widget.position);
    } else if (_activeIndex != -1) {
      setState(() => _activeIndex = -1);
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _updateActive(Duration position) {
    if (!widget.lyrics.isSynced) return;
    final lines = widget.lyrics.lines;
    int idx = -1;
    for (var i = lines.length - 1; i >= 0; i--) {
      if (position >= lines[i].start) {
        idx = i;
        break;
      }
    }
    if (idx != _activeIndex) {
      setState(() => _activeIndex = idx);
      _scrollToActive(idx);
    }
  }

  void _scrollToActive(int index) {
    if (index < 0 || index >= _lineKeys.length) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final targetContext = _lineKeys[index].currentContext;
      if (targetContext == null) return;
      Scrollable.ensureVisible(
        targetContext,
        alignment: 0.3,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  List<GlobalKey> _buildLineKeys(int length) {
    return List<GlobalKey>.generate(length, (_) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    final lines = widget.lyrics.lines;
    if (lines.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).lyricsNotAvailable,
          style: TextStyle(color: AppColorScheme.onSurface.withValues(alpha: 0.5)),
        ),
      );
    }

    if (!widget.lyrics.isSynced) {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spaceXl,
          vertical: AppSpacing.spaceLg,
        ),
        itemCount: lines.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            lines[index].text,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.8),
              fontSize: 16,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final glow = ThemeRegistry.active.textGlow;
    final list = ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spaceXl,
        vertical: AppSpacing.space3xl,
      ),
      itemCount: lines.length,
      itemBuilder: (context, index) {
        final isActive = index == _activeIndex;
        final line = Center(
          key: _lineKeys[index],
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            style: TextStyle(
              color: isActive
                  ? AppColorScheme.accent
                  : AppColorScheme.onSurface.withValues(alpha: 0.38),
              fontSize: isActive ? 24 : 18,
              fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
              height: 1.35,
              shadows: isActive ? glow : null,
            ),
            child: Text(lines[index].text, textAlign: TextAlign.center),
          ),
        );
        if (widget.onSeekToLine == null) return line;
        return InkWell(
          onTap: () => widget.onSeekToLine!(lines[index].start),
          borderRadius: AppRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: line,
          ),
        );
      },
    );

    // Soft fade at the top and bottom edges so lines scroll in/out gracefully.
    return ShaderMask(
      shaderCallback: (rect) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          Colors.white,
          Colors.white,
          Colors.transparent,
        ],
        stops: [0.0, 0.12, 0.88, 1.0],
      ).createShader(rect),
      blendMode: BlendMode.dstIn,
      child: list,
    );
  }
}
