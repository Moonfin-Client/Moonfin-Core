import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_activity_gate.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_cache.dart';
import 'package:moonfin/data/services/retro_artwork/retro_artwork_transport.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/bounded_network_image.dart';
import 'package:moonfin/ui/widgets/game/game_system_card.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

void main() {
  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  // Shared stress conditions: RTL layout plus a large text scaler, the
  // combination most likely to overflow the fixed-height card.
  Future<void> pumpUnderRtlAndLargeText(WidgetTester tester) {
    return tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: MediaQuery(
            data: MediaQueryData(textScaler: TextScaler.linear(3)),
            child: Scaffold(
              body: Center(
                child: SizedBox(width: 360, height: 320, child: _Card()),
              ),
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('does not throw when RTL is combined with large text scaling', (
    tester,
  ) async {
    await pumpUnderRtlAndLargeText(tester);

    expect(tester.takeException(), isNull);
  });

  testWidgets('renders the localized item count under RTL and large text', (
    tester,
  ) async {
    await pumpUnderRtlAndLargeText(tester);

    expect(find.text('707 items'), findsOneWidget);
  });

  testWidgets('mirrors the navigation chevron for right-to-left layouts', (
    tester,
  ) async {
    await pumpUnderRtlAndLargeText(tester);

    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
  });

  group('artwork collage fallback', () {
    Widget buildCard({
      required GameSystem system,
      RetroArtworkTransport? transport,
      RetroArtworkActivityGate? activityGate,
    }) => MaterialApp(
      theme: AppTheme.buildTheme(ThemeRegistry.active),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 360,
            height: 320,
            child: GameSystemCard(
              system: system,
              gameCount: system.gameCount,
              retroArtworkTransport: transport,
              retroArtworkActivityGate: activityGate,
              libraryId: transport == null ? null : 'retro',
              serverIdentity: transport == null ? null : 'server-record-1',
              onTap: () {},
            ),
          ),
        ),
      ),
    );

    testWidgets(
      'invalid protocol-2 previews never fall through to network images',
      (tester) async {
        await tester.pumpWidget(
          buildCard(
            system: const GameSystem(
              id: 'arcade',
              name: 'Arcade',
              core: 'arcade',
              gameCount: 8,
              previewArtwork: GameSystemPreviewArtwork(
                selectionGeneration: 'selection-1',
                panels: [
                  GameSystemPreviewPanel(
                    gameId: 'ready-thumb',
                    artwork: GameArtworkDescriptor(
                      state: 'thumbnailReady',
                      url: '/artwork/ready-thumb',
                    ),
                  ),
                  GameSystemPreviewPanel(
                    gameId: 'pending',
                    artwork: GameArtworkDescriptor(
                      state: 'pending',
                      url: '/artwork/pending',
                    ),
                  ),
                  GameSystemPreviewPanel(
                    gameId: 'ready-original',
                    artwork: GameArtworkDescriptor(
                      state: 'originalReady',
                      url: '/artwork/ready-original',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(BoundedNetworkImage), findsNothing);
        expect(find.byIcon(Icons.videogame_asset), findsNWidgets(4));
      },
    );

    testWidgets(
      'a legacy system with no preview uses all four deterministic placeholders',
      (tester) async {
        await tester.pumpWidget(
          buildCard(
            system: const GameSystem(
              id: 'arcade',
              name: 'Arcade',
              core: 'arcade',
              gameCount: 8,
            ),
          ),
        );

        expect(find.byType(BoundedNetworkImage), findsNothing);
        expect(find.byIcon(Icons.videogame_asset), findsNWidgets(4));
      },
    );

    testWidgets('a newer preview revision replaces the live source', (
      tester,
    ) async {
      final http = _TrackingArtworkHttpClient();
      final gate = RetroArtworkActivityGate();
      final transport = RetroArtworkTransport(
        httpClient: http,
        cache: RetroArtworkByteLruCache(maxBytes: 100),
        activityGate: gate,
      );
      addTearDown(transport.dispose);

      GameSystem system({
        required String state,
        required String url,
        required String revision,
      }) => GameSystem(
        id: 'arcade',
        name: 'Arcade',
        core: 'arcade',
        gameCount: 1,
        previewArtwork: GameSystemPreviewArtwork(
          selectionGeneration: 'selection-$revision',
          panels: [
            GameSystemPreviewPanel(
              gameId: 'game',
              artwork: GameArtworkDescriptor(
                state: state,
                url: url,
                revision: revision,
              ),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        buildCard(
          system: system(
            state: 'originalReady',
            url: '/art/game/original',
            revision: 'r1',
          ),
          transport: transport,
          activityGate: gate,
        ),
      );
      // Past RetroArtworkImage.defaultSettleDelay, which holds the transfer
      // back so a fling or fast letter change never issues it.
      await tester.pump(const Duration(milliseconds: 150));
      expect(http.requested, contains(Uri.parse('/art/game/original')));

      await tester.pumpWidget(
        buildCard(
          system: system(
            state: 'thumbnailReady',
            url: '/art/game/thumbnail',
            revision: 'r2',
          ),
          transport: transport,
          activityGate: gate,
        ),
      );
      await tester.pump(const Duration(milliseconds: 150));

      expect(http.requested, contains(Uri.parse('/art/game/thumbnail')));
      expect(tester.takeException(), isNull);
    });
  });
}

class _TrackingArtworkHttpClient implements RetroArtworkHttpClient {
  final List<Uri> requested = <Uri>[];

  @override
  Future<Uint8List> getBytes(
    Uri uri, {
    required RetroArtworkCancellationSignal cancellation,
  }) {
    requested.add(uri);
    final result = Completer<Uint8List>();
    cancellation.addListener(() {
      if (!result.isCompleted) {
        result.completeError(
          RetroArtworkCancelledException(cancellation.reason),
        );
      }
    });
    return result.future;
  }

  @override
  void close() {}
}

class _Card extends StatelessWidget {
  const _Card();

  @override
  Widget build(BuildContext context) {
    return GameSystemCard(
      system: const GameSystem(
        id: 'atari2600',
        name: 'Atari 2600 with a long localized name',
        core: 'stella',
        gameCount: 707,
      ),
      gameCount: 707,
      onTap: () {},
    );
  }
}
