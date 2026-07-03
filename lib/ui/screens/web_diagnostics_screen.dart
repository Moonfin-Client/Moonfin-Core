import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../l10n/app_localizations.dart';
import '../../platform/web_runtime_config.dart';
import '../../util/platform_detection.dart';
import '../../util/server_url.dart';
import '../../util/web_diagnostics_failure.dart';
import '../navigation/destinations.dart';

class WebDiagnosticsScreen extends StatelessWidget {
  const WebDiagnosticsScreen({
    super.key,
    this.reason,
    this.targetUrl,
    this.detail,
  });

  final String? reason;
  final String? targetUrl;
  final String? detail;

  static const _corsSnippet =
      r'''# Example reverse-proxy headers for Moonfin web
add_header Access-Control-Allow-Origin "$http_origin" always;
add_header Access-Control-Allow-Credentials "true" always;
add_header Access-Control-Allow-Headers "Authorization, X-Emby-Authorization, X-Emby-Token, Content-Type, Range, Accept, Origin" always;
add_header Access-Control-Expose-Headers "Content-Length, Content-Range, Accept-Ranges" always;
add_header Access-Control-Allow-Methods "GET, POST, PUT, DELETE, OPTIONS" always;
if ($request_method = OPTIONS) { return 204; }''';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final origin = Uri.base;
    final isHttpsPage = origin.scheme.toLowerCase() == 'https';
    final inferredReason = webDiagnosticsFailureReasonFromQuery(reason);
    final normalizedTargetUrl = _normalizeConfiguredUrl(targetUrl);
    final detailText = (detail ?? '').trim();

    final configuredTargets = <String>{
      _normalizeConfiguredUrl(webRuntimeConfig.forcedServerUrl),
      _normalizeConfiguredUrl(webRuntimeConfig.defaultServerUrl),
      _normalizeConfiguredUrl(webRuntimeConfig.discoveryProxyUrl),
    }.where((value) => value.isNotEmpty).toList(growable: false);

    final insecureConfiguredTargets = configuredTargets
        .where((url) => url.toLowerCase().startsWith('http://'))
        .toList(growable: false);

    final hasMixedContentRisk =
        PlatformDetection.isWeb &&
        isHttpsPage &&
        insecureConfiguredTargets.isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.webDiagnosticsTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              l10n.webDiagnosticsIntro,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            if (inferredReason != null) ...[
              _StatusCard(
                title:
                    inferredReason == WebDiagnosticsFailureReason.mixedContent
                  ? l10n.webDiagnosticsDetectedMixedContentFailure
                  : l10n.webDiagnosticsDetectedCorsPreflightFailure,
                icon: Icons.error_outline,
                color: AppColorScheme.statusRequested.withValues(alpha: 0.22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (inferredReason ==
                        WebDiagnosticsFailureReason.mixedContent)
                      Text(
                        l10n.webDiagnosticsMixedContentFailureBody,
                      )
                    else
                      Text(
                        l10n.webDiagnosticsCorsFailureBody,
                      ),
                    if (normalizedTargetUrl.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(l10n.webDiagnosticsTargetUrl(normalizedTargetUrl)),
                    ],
                    if (detailText.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(l10n.webDiagnosticsDetail(detailText)),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
            _StatusCard(
              title: l10n.webDiagnosticsCurrentRuntimeContext,
              icon: Icons.public,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _kv(l10n.webDiagnosticsOrigin, origin.origin),
                  _kv(l10n.webDiagnosticsScheme, origin.scheme),
                  _kv(
                    l10n.webDiagnosticsPluginMode,
                    webRuntimeConfig.pluginMode
                        ? l10n.enabled
                        : l10n.disabled,
                  ),
                  _kv(
                    l10n.webDiagnosticsWebRtcScan,
                    webRuntimeConfig.enableWebRtcScan
                        ? l10n.enabled
                        : l10n.disabled,
                  ),
                  _kv(
                    l10n.webDiagnosticsForcedServerUrl,
                    webRuntimeConfig.forcedServerUrl?.trim().isNotEmpty == true
                        ? normalizeServerBaseUrl(
                            webRuntimeConfig.forcedServerUrl!.trim(),
                          )
                        : l10n.notConfigured,
                  ),
                  _kv(
                    l10n.webDiagnosticsDefaultServerUrl,
                    webRuntimeConfig.defaultServerUrl?.trim().isNotEmpty == true
                        ? normalizeServerBaseUrl(
                            webRuntimeConfig.defaultServerUrl!.trim(),
                          )
                        : l10n.notConfigured,
                  ),
                  _kv(
                    l10n.webDiagnosticsDiscoveryProxyUrl,
                    webRuntimeConfig.discoveryProxyUrl?.trim().isNotEmpty ==
                            true
                        ? normalizeServerBaseUrl(
                            webRuntimeConfig.discoveryProxyUrl!.trim(),
                          )
                        : l10n.notConfigured,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _StatusCard(
              title: l10n.webDiagnosticsMixedContent,
              icon: hasMixedContentRisk
                  ? Icons.warning_amber
                  : Icons.check_circle,
              color: hasMixedContentRisk
                  ? AppColorScheme.statusRequested.withValues(alpha: 0.18)
                  : AppColorScheme.accent.withValues(alpha: 0.14),
              child: hasMixedContentRisk
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.webDiagnosticsMixedContentDetected,
                        ),
                        const SizedBox(height: 8),
                        ...insecureConfiguredTargets.map(
                          (url) => Text('• $url'),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.webDiagnosticsMixedContentFix,
                        ),
                      ],
                    )
                  : Text(
                      l10n.webDiagnosticsNoMixedContentDetected,
                    ),
            ),
            const SizedBox(height: 12),
            _StatusCard(
              title: l10n.webDiagnosticsCorsChecklist,
              icon: Icons.rule,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.webDiagnosticsCorsChecklistItem1,
                  ),
                  SizedBox(height: 4),
                  Text(
                    l10n.webDiagnosticsCorsChecklistItem2,
                  ),
                  SizedBox(height: 4),
                  Text(
                    l10n.webDiagnosticsCorsChecklistItem3,
                  ),
                  SizedBox(height: 4),
                  Text(l10n.webDiagnosticsCorsChecklistItem4),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _StatusCard(
              title: l10n.webDiagnosticsHeaderSnippetTitle,
              icon: Icons.code,
              child: SelectableText(
                _corsSnippet,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontFamily: 'monospace',
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 12),
            if (!PlatformDetection.isWeb)
              _StatusCard(
                title: l10n.note,
                icon: Icons.info,
                child: Text(
                  l10n.webDiagnosticsNonWebNote,
                ),
              ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  onPressed: () => context.go(Destinations.serverSelect),
                  icon: const Icon(Icons.arrow_back),
                  label: Text(l10n.backToServerSelect),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _normalizeConfiguredUrl(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return '';
    return normalizeServerBaseUrl(trimmed);
  }

  Widget _kv(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.white70),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final Color? color;

  const _StatusCard({
    required this.title,
    required this.icon,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: AppRadius.circular(12),
        color: color ?? AppColorScheme.onSurface.withValues(alpha: 0.06),
        border: Border.all(
          color: AppColorScheme.onSurface.withValues(alpha: 0.18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
