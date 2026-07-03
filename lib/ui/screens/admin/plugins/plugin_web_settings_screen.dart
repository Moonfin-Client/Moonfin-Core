import 'dart:convert';
import 'package:moonfin_design/moonfin_design.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../util/platform_detection.dart';

class PluginWebSettingsScreen extends StatefulWidget {
  final Uri configurationPageUri;
  final String serverBaseUrl;
  final String accessToken;
  final String? userId;
  final String serverId;
  final String serverName;
  final String title;

  const PluginWebSettingsScreen({
    super.key,
    required this.configurationPageUri,
    required this.serverBaseUrl,
    required this.accessToken,
    this.userId,
    required this.serverId,
    required this.serverName,
    required this.title,
  });

  @override
  State<PluginWebSettingsScreen> createState() =>
      _PluginWebSettingsScreenState();
}

class _PluginWebSettingsScreenState extends State<PluginWebSettingsScreen> {
  static const String _chromeStripScript = '''
(() => {
  const styleId = 'moonfin-plugin-config-strip-chrome';
  if (!document.getElementById(styleId)) {
    const style = document.createElement('style');
    style.id = styleId;
    style.textContent = `
      #header,
      .skinHeader,
      .mainDrawer,
      #drawer,
      #footer,
      .appfooter,
      .sectionTabs,
      .emby-tab-button,
      .pageTitle,
      .pageTitleWithLogo {
        display: none !important;
      }

      html,
      body,
      .mainAnimatedPage,
      .page,
      .scrollY,
      .content-primary {
        margin-top: 0 !important;
        padding-top: 0 !important;
      }

      html,
      body,
      .mainAnimatedPage,
      .page,
      .scrollY,
      .content-primary {
        background-color: #ffffff !important;
      }
    `;
    document.head.appendChild(style);
  }

  const bottomInset = 'calc(88px + env(safe-area-inset-bottom))';
  const scrollHost =
      document.querySelector('.content-primary.scrollY') ||
      document.querySelector('.content-primary') ||
      document.querySelector('.scrollY') ||
      document.querySelector('.mainAnimatedPage') ||
      document.querySelector('.page') ||
      document.body;

  if (scrollHost && !scrollHost.dataset.moonfinBottomInsetApplied) {
    scrollHost.dataset.moonfinBottomInsetApplied = '1';
    scrollHost.style.boxSizing = 'border-box';
    scrollHost.style.paddingBottom = '88px';
    scrollHost.style.paddingBottom = bottomInset;
  }
})();
''';

  WebViewController? _legacyController;
  InAppWebViewController? _inAppController;
  late final TextEditingController _addressController;
  late final Uri _initialConfigUrl;
  late Uri _currentUrl;

  bool _isLoading = true;
  int _progress = 0;
  bool _canGoBack = false;
  bool _canGoForward = false;

  Uri get _serverBaseUri => Uri.parse(widget.serverBaseUrl);

  String get _normalizedServerBaseUrl {
    final value = _serverBaseUri.toString();
    return value.endsWith('/') ? value.substring(0, value.length - 1) : value;
  }

  bool get _useInAppWebView {
    return !kIsWeb &&
        (PlatformDetection.isAndroid ||
            PlatformDetection.isIOS ||
            PlatformDetection.isMacOS ||
            PlatformDetection.isWindows);
  }

  bool get _supportsLegacyEmbeddedWebView {
    return !kIsWeb && WebViewPlatform.instance != null;
  }

  bool get _useLegacyWebView =>
      !_useInAppWebView && _supportsLegacyEmbeddedWebView;

  bool get _supportsAnyEmbeddedWebView => _useInAppWebView || _useLegacyWebView;

  @override
  void initState() {
    super.initState();

    _initialConfigUrl = widget.configurationPageUri;
    _currentUrl = _initialConfigUrl;
    _addressController = TextEditingController(text: _currentUrl.toString());

    if (_useLegacyWebView) {
      _initLegacyController();
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _initLegacyController() {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            final parsed = Uri.tryParse(request.url);

            if (parsed != null && !_isSameOrigin(parsed)) {
              _openExternalUri(parsed);
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
          onPageStarted: (url) {
            if (!mounted) return;
            setState(() {
              _isLoading = true;
              _progress = 0;
            });
          },
          onProgress: (progress) {
            if (!mounted) return;
            setState(() => _progress = progress);
          },
          onPageFinished: (url) async {
            final nextUri = Uri.tryParse(url) ?? _currentUrl;
            _currentUrl = nextUri;
            _addressController.text = nextUri.toString();

            await _injectChromeStripLegacy();
            await _refreshNavigationState();

            if (!mounted) return;
            setState(() {
              _isLoading = false;
              _progress = 100;
            });
          },
        ),
      );

    _legacyController = controller;
    _loadLegacyUrl(_initialConfigUrl);
  }

  Future<void> _loadLegacyUrl(Uri targetUrl) async {
    final controller = _legacyController;
    if (controller == null) {
      return;
    }

    _currentUrl = targetUrl;
    _addressController.text = targetUrl.toString();

    if (mounted) {
      setState(() {
        _isLoading = true;
        _progress = 0;
      });
    }

    await controller.loadHtmlString(
      _buildBootstrapHtml(targetUrl),
      baseUrl: '$_normalizedServerBaseUrl/web/',
    );
  }

  Future<void> _injectChromeStripLegacy() async {
    final controller = _legacyController;
    if (controller == null) {
      return;
    }

    try {
      await controller.runJavaScript(_chromeStripScript);
    } catch (_) {}
  }

  Future<void> _injectChromeStripInApp(
    InAppWebViewController controller,
  ) async {
    try {
      await controller.evaluateJavascript(source: _chromeStripScript);
    } catch (_) {}
  }

  Future<void> _refreshNavigationState() async {
    if (_useInAppWebView) {
      final controller = _inAppController;
      if (controller == null) {
        return;
      }

      final canBack = await controller.canGoBack();
      final canForward = await controller.canGoForward();

      if (!mounted) return;
      setState(() {
        _canGoBack = canBack;
        _canGoForward = canForward;
      });
      return;
    }

    final controller = _legacyController;
    if (controller == null) {
      return;
    }

    final canBack = await controller.canGoBack();
    final canForward = await controller.canGoForward();

    if (!mounted) return;
    setState(() {
      _canGoBack = canBack;
      _canGoForward = canForward;
    });
  }

  int _effectivePort(Uri uri) {
    if (uri.hasPort) {
      return uri.port;
    }

    return uri.scheme.toLowerCase() == 'https' ? 443 : 80;
  }

  bool _isSameOrigin(Uri uri) {
    final base = _serverBaseUri;
    return uri.scheme.toLowerCase() == base.scheme.toLowerCase() &&
        uri.host.toLowerCase() == base.host.toLowerCase() &&
        _effectivePort(uri) == _effectivePort(base);
  }

  String _buildBootstrapHtml(Uri targetUrl) {
    final payload = <String, dynamic>{
      'Servers': <Map<String, dynamic>>[
        <String, dynamic>{
          'Id': widget.serverId,
          'Name': widget.serverName,
          'Url': _normalizedServerBaseUrl,
          'ManualAddress': _normalizedServerBaseUrl,
          'AccessToken': widget.accessToken,
          'UserId': widget.userId ?? '',
          'DateLastAccessed': DateTime.now().millisecondsSinceEpoch,
          'LastConnectionMode': 1,
        },
      ],
    };

    final payloadLiteral = jsonEncode(payload);
    final targetLiteral = jsonEncode(targetUrl.toString());
    return '''<!doctype html><html lang="en"><head><meta charset="utf-8"></head><body>
<script>(() => {
  try {
    const credentials = $payloadLiteral;
    const s = JSON.stringify(credentials);
    const keys = [
      'jellyfin_credentials',
      'jellyfin_credentials_v2',
      'jellyfin_credentials_v3',
      'jellyfin-credentials',
      'emby_credentials',
    ];
    for (const k of keys) {
      localStorage.setItem(k, s);
      sessionStorage.setItem(k, s);
    }
  } catch (_) {}
  location.replace($targetLiteral);
})();</script>
</body></html>''';
  }

  Future<void> _openExternalUri(Uri uri) async {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _openExternal() async {
    final uri = Uri.tryParse(_addressController.text.trim()) ?? _currentUrl;
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && mounted) {
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminCouldNotOpenUrl('$uri'))),
      );
    }
  }

  Future<void> _goToAddress() async {
    final raw = _addressController.text.trim();
    if (raw.isEmpty) {
      return;
    }

    var uri = Uri.tryParse(raw);
    if (uri == null || (!uri.hasScheme && !raw.startsWith('/'))) {
      uri = Uri.tryParse('https://$raw');
    }

    if (uri == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context).adminPluginSettingsInvalidUrl,
          ),
        ),
      );
      return;
    }

    if (_useInAppWebView) {
      final controller = _inAppController;
      if (controller == null) {
        return;
      }

      _currentUrl = uri;
      await controller.loadUrl(urlRequest: URLRequest(url: WebUri.uri(uri)));
      return;
    }

    await _loadLegacyUrl(uri);
  }

  Future<void> _goBack() async {
    if (_useInAppWebView) {
      final controller = _inAppController;
      if (controller == null) return;
      await controller.goBack();
      await _refreshNavigationState();
      return;
    }

    final controller = _legacyController;
    if (controller == null) return;
    await controller.goBack();
    await _refreshNavigationState();
  }

  Future<void> _goForward() async {
    if (_useInAppWebView) {
      final controller = _inAppController;
      if (controller == null) return;
      await controller.goForward();
      await _refreshNavigationState();
      return;
    }

    final controller = _legacyController;
    if (controller == null) return;
    await controller.goForward();
    await _refreshNavigationState();
  }

  Future<void> _refreshPage() async {
    if (_useInAppWebView) {
      final controller = _inAppController;
      if (controller == null) {
        return;
      }

      await controller.reload();
      return;
    }

    await _loadLegacyUrl(_currentUrl);
  }

  Widget _buildToolbar() {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 620;

          final navButtons = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                tooltip: l10n.back,
                visualDensity: VisualDensity.compact,
                onPressed: _canGoBack ? _goBack : null,
                icon: const Icon(Icons.arrow_back),
              ),
              IconButton(
                tooltip: l10n.forward,
                visualDensity: VisualDensity.compact,
                onPressed: _canGoForward ? _goForward : null,
                icon: const Icon(Icons.arrow_forward),
              ),
              IconButton(
                tooltip: l10n.refresh,
                visualDensity: VisualDensity.compact,
                onPressed: _refreshPage,
                icon: const Icon(Icons.refresh),
              ),
            ],
          );

          final addressField = TextField(
            controller: _addressController,
            textInputAction: TextInputAction.go,
            onSubmitted: (_) => _goToAddress(),
            decoration: InputDecoration(
              isDense: true,
              hintText: l10n.address,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              prefixIcon: const Icon(Icons.language, size: 18),
              border: OutlineInputBorder(
                borderRadius: AppRadius.circular(14),
              ),
            ),
          );

          if (isNarrow) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    navButtons,
                    const Spacer(),
                    IconButton(
                      tooltip: l10n.go,
                      visualDensity: VisualDensity.compact,
                      onPressed: _goToAddress,
                      icon: const Icon(Icons.arrow_right_alt),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                addressField,
              ],
            );
          }

          return Row(
            children: [
              navButtons,
              const SizedBox(width: 8),
              Expanded(child: addressField),
              const SizedBox(width: 4),
              IconButton(
                tooltip: l10n.go,
                onPressed: _goToAddress,
                icon: const Icon(Icons.arrow_right_alt),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInAppWebView() {
    return InAppWebView(
      key: const ValueKey('plugin-webview-inapp'),
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
        domStorageEnabled: true,
      ),
      initialData: InAppWebViewInitialData(
        data: _buildBootstrapHtml(_currentUrl),
        baseUrl: WebUri.uri(_serverBaseUri.resolve('/web/')),
        mimeType: 'text/html',
        encoding: 'utf-8',
      ),
      onWebViewCreated: (controller) {
        _inAppController = controller;
      },
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        final targetUri = navigationAction.request.url?.uriValue;
        if (targetUri == null) {
          return NavigationActionPolicy.ALLOW;
        }

        if (!_isSameOrigin(targetUri)) {
          _openExternalUri(targetUri);
          return NavigationActionPolicy.CANCEL;
        }

        return NavigationActionPolicy.ALLOW;
      },
      onLoadStart: (controller, uri) {
        _currentUrl = uri?.uriValue ?? _currentUrl;
        _addressController.text = _currentUrl.toString();

        if (!mounted) return;
        setState(() {
          _isLoading = true;
          _progress = 0;
        });
      },
      onProgressChanged: (controller, progress) {
        if (!mounted) return;
        setState(() => _progress = progress);
      },
      onLoadStop: (controller, uri) async {
        _currentUrl = uri?.uriValue ?? _currentUrl;
        _addressController.text = _currentUrl.toString();

        await _injectChromeStripInApp(controller);
        await _refreshNavigationState();

        if (!mounted) return;
        setState(() {
          _isLoading = false;
          _progress = 100;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bottomWebViewPadding = MediaQuery.viewPaddingOf(context).bottom + 12;

    if (!_supportsAnyEmbeddedWebView) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.open_in_browser, size: 42),
                const SizedBox(height: 12),
                Text(
                  l10n.embeddedBrowserNotAvailable,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: _openExternal,
                  icon: const Icon(Icons.open_in_new),
                  label: Text(l10n.openInBrowser),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final legacyController = _legacyController;
    if (_useLegacyWebView && legacyController == null) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            tooltip: l10n.openExternally,
            onPressed: _openExternal,
            icon: const Icon(Icons.open_in_new),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_isLoading)
            LinearProgressIndicator(
              value: _progress > 0 && _progress < 100 ? _progress / 100 : null,
            ),
          _buildToolbar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomWebViewPadding),
              child: _useInAppWebView
                  ? _buildInAppWebView()
                  : WebViewWidget(controller: legacyController!),
            ),
          ),
        ],
      ),
    );
  }
}
