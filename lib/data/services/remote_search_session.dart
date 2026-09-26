/// One remote search, retained while its screen is opening. SendString.String
/// replaces the entire query, including an empty string to clear it. Optional
/// MoonfinInputId and MoonfinRevision reject edits from older input sessions.
class RemoteSearchSession {
  RemoteSearchSession(this.inputId);

  final String? inputId;
  String text = '';
  bool active = true;
  bool opening = true;
  int _revision = -1;
  void Function(String)? _onText;

  void attach(void Function(String) onText) {
    if (!active) return;
    opening = false;
    _onText = onText;
    onText(text);
  }

  void receive(Map<String, String> arguments) {
    final value = arguments['String'];
    if (!active || value == null) return;
    final id = arguments['MoonfinInputId'];
    if (id != null) {
      final revision = int.tryParse(arguments['MoonfinRevision'] ?? '');
      if (id != inputId ||
          revision == null ||
          revision < 0 ||
          revision <= _revision) {
        return;
      }
      _revision = revision;
    }
    text = value;
    _onText?.call(value);
  }

  void close() {
    active = false;
    _onText = null;
  }
}
