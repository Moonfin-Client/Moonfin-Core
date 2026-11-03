import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

import '../l10n/app_localizations.dart';

/// Silo refusals that mean "not now" or "not with this version", which any
/// screen can meet and which deserve a sentence rather than an HTTP code.
sealed class SiloFailure {
  const SiloFailure();

  /// The failure a Silo request [error] carried, or null for anything else.
  /// Only answers that carry Silo's problem body count (Silo sends one with
  /// every error), so another server's `429` keeps its own handling. Silo's
  /// playback `426` has no v2 problem body and counts too.
  static SiloFailure? of(DioException error, {DateTime? now}) {
    final status = error.response?.statusCode;
    if (status == 426) return const SiloUpdateRequired(serverIsNewer: true);
    final problem = SiloProblem.of(error);
    if (problem == null) return null;
    if (problem.code == 'client_upgrade_required') {
      return const SiloUpdateRequired(serverIsNewer: true);
    }
    final wait = SiloProblem.retryAfter(error, now: now);
    return switch (status) {
      429 => SiloTryAgainLater(wait: wait, busy: false),
      503 => SiloTryAgainLater(wait: wait, busy: true),
      _ => null,
    };
  }

  /// A sentence for the person, in their language.
  String message(AppLocalizations l10n);
}

/// The server and this build don't speak the same Silo API.
class SiloUpdateRequired extends SiloFailure {
  /// True: update Moonfin. False: update Silo.
  final bool serverIsNewer;

  const SiloUpdateRequired({required this.serverIsNewer});

  factory SiloUpdateRequired.of(SiloApiUnsupported unsupported) =>
      SiloUpdateRequired(serverIsNewer: unsupported.serverIsNewer);

  @override
  String message(AppLocalizations l10n) => serverIsNewer
      ? l10n.siloAppUpdateRequired
      : l10n.siloServerUpdateRequired;
}

/// `429` (too many attempts) or `503` (busy, starting, or a service it needs
/// is down), with the wait Silo's `Retry-After` asked for, if any.
class SiloTryAgainLater extends SiloFailure {
  final Duration? wait;
  final bool busy;

  const SiloTryAgainLater({this.wait, required this.busy});

  @override
  String message(AppLocalizations l10n) {
    final wait = this.wait;
    if (wait == null || wait <= Duration.zero) {
      return busy ? l10n.siloServerBusy : l10n.siloTooManyAttempts;
    }
    final text = siloWaitText(wait, l10n);
    return busy
        ? l10n.siloServerBusyWait(text)
        : l10n.siloTooManyAttemptsWait(text);
  }
}

/// "45 seconds", "3 minutes": seconds up to a minute and a half, whole
/// minutes (rounded up) beyond.
String siloWaitText(Duration wait, AppLocalizations l10n) {
  final seconds = (wait.inMilliseconds / 1000).ceil();
  if (seconds <= 90) return l10n.siloWaitSeconds(seconds);
  return l10n.siloWaitMinutes((seconds / 60).ceil());
}
