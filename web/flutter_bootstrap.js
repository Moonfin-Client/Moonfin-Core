{{flutter_js}}
{{flutter_build_config}}

// Fonts for characters the bundled ones don't cover ship in fonts/ next to the
// app (scripts/fetch-web-fonts.sh), so browsers never ask Google Fonts for them.
_flutter.loader.load({
  config: { fontFallbackBaseUrl: "fonts/" },
  serviceWorkerSettings: {
    serviceWorkerVersion: {{flutter_service_worker_version}},
  },
});
