import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../l10n/app_localizations.dart';
import '../preference/user_preferences.dart';

/// The flags the provider sets on an upload - machine or AI translated,
/// hearing impaired, forced, a hash match against this exact file.
///
/// These decide whether a result is worth taking at all, so they are kept apart
/// from the detail line and shown as badges: run in with the rest they were the
/// first thing to fall off the end of the row.
List<String> remoteSubtitleFlags(
  Map<String, dynamic> subtitle,
  AppLocalizations l10n,
) {
  return <String>[
    if (subtitle['AiTranslated'] == true) l10n.aiTranslated,
    if (subtitle['MachineTranslated'] == true) l10n.machineTranslated,
    if (subtitle['HearingImpaired'] == true) l10n.hearingImpaired,
    if (subtitle['Forced'] == true) l10n.forced,
    if (subtitle['IsHashMatch'] == true) l10n.perfectMatch,
  ];
}

/// Flags and detail as a single string, for a surface that can only take text.
///
/// The tvOS sheet is a native action sheet whose rows are one title each, so it
/// has nowhere to put a badge.
String remoteSubtitleSummary(
  Map<String, dynamic> subtitle,
  AppLocalizations l10n,
) {
  final parts = <String>[
    ...remoteSubtitleFlags(subtitle, l10n),
    remoteSubtitleDetails(subtitle, l10n),
  ]..removeWhere((part) => part.isEmpty);
  return parts.join(' | ');
}

/// The provider's own bookkeeping, as one line under the release name.
String remoteSubtitleDetails(
  Map<String, dynamic> subtitle,
  AppLocalizations l10n,
) {
  final details = <String>[];

  final language =
      (subtitle['ThreeLetterISOLanguageName'] as String?)?.trim() ??
      (subtitle['Language'] as String?)?.trim();
  if (language != null && language.isNotEmpty) {
    details.add(language.toUpperCase());
  }

  final provider = (subtitle['ProviderName'] as String?)?.trim();
  if (provider != null && provider.isNotEmpty) {
    details.add(provider);
  }

  final format = (subtitle['Format'] as String?)?.trim();
  if (format != null && format.isNotEmpty) {
    details.add(format.toUpperCase());
  }

  final rating = subtitle['CommunityRating'] as num?;
  if (rating != null) {
    details.add('${rating.toStringAsFixed(1)}★');
  }

  final downloadCount = subtitle['DownloadCount'] as num?;
  if (downloadCount != null) {
    details.add(l10n.downloadsCount(downloadCount.toInt()));
  }

  final frameRate = subtitle['FrameRate'] as num?;
  if (frameRate != null && frameRate > 0) {
    details.add(l10n.framerateFps(_frameRateLabel(frameRate)));
  }

  return details.join(' | ');
}

// 23.976 stays as it is, 25.000 reads better as 25.
final RegExp _trailingZeros = RegExp(r'\.?0+$');

String _frameRateLabel(num value) =>
    value.toStringAsFixed(3).replaceFirst(_trailingZeros, '');

/// Turns a failed search or download into something worth reading.
///
/// Lifted out of the screens because all three want the same wording, and the
/// tvOS copy had gone without any of it - a failure there used to be swallowed
/// whole. [action] is the localized verb the messages are built around.
String remoteSubtitleErrorMessage(
  Object error,
  AppLocalizations l10n, {
  required String action,
}) {
  if (error is DioException) {
    final status = error.response?.statusCode;
    if (status == 403) {
      return l10n.remoteSubtitlePermissionError(action);
    }
    if (status == 404) {
      return l10n.remoteSubtitleNotFoundError(action);
    }

    final data = error.response?.data;
    String? detail;
    if (data is Map) {
      detail =
          (data['message'] ?? data['Message'] ?? data['error'] ?? data['Error'])
              as String?;
    } else if (data is String && data.trim().isNotEmpty) {
      detail = data.trim();
    }

    if (detail != null && detail.isNotEmpty) {
      return l10n.remoteSubtitleDetailError(action, detail);
    }
    if (status != null) {
      return l10n.remoteSubtitleHttpError(action, status);
    }
  }

  return l10n.remoteSubtitleGenericError(action);
}

/// Which language to ask the providers for.
///
/// The preference wins when it names one; otherwise the languages already on
/// the item are the best guess at what the viewer wants, and English is the
/// last resort. This was copied into all three screens and had drifted - only
/// the tvOS copy screened out the sentinel values - so the strict reading is
/// the one kept here.
String remoteSubtitleLanguage(
  List<Map<String, dynamic>> subtitleStreams,
  List<Map<String, dynamic>> audioStreams,
) {
  final preferred = GetIt.instance<UserPreferences>()
      .get(UserPreferences.defaultSubtitleLanguage)
      .trim()
      .toLowerCase();
  if (preferred.isNotEmpty && preferred != 'auto' && preferred != 'none') {
    return preferred;
  }

  for (final stream in [...subtitleStreams, ...audioStreams]) {
    final language = (stream['Language'] as String?)?.trim();
    if (language != null && language.isNotEmpty) {
      return language;
    }
  }

  return 'eng';
}
