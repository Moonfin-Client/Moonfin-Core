import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../../util/platform_detection.dart';
import 'track_selector_dialog.dart';

const _supportUrl = 'https://buymeacoffee.com/moonfin';

Future<void> showSupportDialog(BuildContext context) =>
    showQrOrLaunch(
      context,
      url: _supportUrl,
      title: AppLocalizations.of(context).settingsSupportMoonfin,
    );

Future<void> showQrOrLaunch(
  BuildContext context, {
  required String url,
  required String title,
}) async {
  if (!PlatformDetection.isTV) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    return;
  }

  final choice = await showStyledPlayerDialog<String>(
    context,
    title: title,
    builder: (ctx) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColorScheme.onSurface,
            borderRadius: AppRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: QrImageView(
            data: url,
            version: QrVersions.auto,
            size: 180,
            backgroundColor: AppColorScheme.onSurface,
            eyeStyle: QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: AppColorScheme.background,
            ),
            dataModuleStyle: QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.square,
              color: AppColorScheme.background,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(ctx).scanWithYourPhone,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.7),
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          url,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.54),
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () => Navigator.of(ctx).pop('open'),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                Icon(
                  Icons.open_in_browser,
                  size: 22,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                ),
                const SizedBox(width: 16),
                Text(
                  AppLocalizations.of(ctx).openLink,
                  style: TextStyle(fontSize: 15, color: AppColorScheme.onSurface),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    showCancel: true,
  );

  if (choice == 'open') {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
