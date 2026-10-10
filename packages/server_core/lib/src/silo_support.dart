/// Whether Moonfin offers Silo servers.
///
/// Off until Silo support is complete enough to use (sign-in, browsing and
/// playback), so the work can land in small pull requests without users
/// adding a Silo server that can't play anything yet. With it off, the server
/// probe never reports Silo, so nothing else in the app sees a Silo server.
///
/// To try it during development:
/// `flutter run --dart-define=MOONFIN_SILO=true`
const bool siloSupportEnabled = bool.fromEnvironment('MOONFIN_SILO');
