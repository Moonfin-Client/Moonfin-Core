/// The colour the admin picked for a message.
enum ServerMessageColor { green, red, yellow, blue, white }

/// How noisy a message should be when it arrives.
enum ServerMessageDelivery {
  /// Only marks the menu button as unread.
  inbox,

  /// Shows a small popup in the corner.
  toast,

  /// Opens the message window once, until the user reads it.
  popup,
}

/// One message written by a server admin in Moonbase.
class ServerMessage {
  final String id;
  final String title;
  final String body;
  final ServerMessageColor color;
  final ServerMessageDelivery delivery;
  final bool pinned;
  final String? actionLabel;
  final String? actionUrl;
  final DateTime? createdUtc;

  const ServerMessage({
    required this.id,
    required this.title,
    required this.body,
    this.color = ServerMessageColor.white,
    this.delivery = ServerMessageDelivery.inbox,
    this.pinned = false,
    this.actionLabel,
    this.actionUrl,
    this.createdUtc,
  });

  bool get hasAction =>
      (actionUrl?.isNotEmpty ?? false) && (actionLabel?.isNotEmpty ?? false);

  /// Reads a key tolerating PascalCase, since Emby servers capitalize keys.
  static dynamic _value(Map<String, dynamic> json, String key) =>
      json[key] ?? json[key[0].toUpperCase() + key.substring(1)];

  static String _string(Map<String, dynamic> json, String key) {
    final value = _value(json, key);
    return value is String ? value : '';
  }

  static String? _nullableString(Map<String, dynamic> json, String key) {
    final value = _string(json, key).trim();
    return value.isEmpty ? null : value;
  }

  static DateTime? _date(Map<String, dynamic> json, String key) {
    final value = _value(json, key);
    if (value is! String || value.trim().isEmpty) return null;
    return DateTime.tryParse(value)?.toUtc();
  }

  static ServerMessage? fromJson(Map<String, dynamic> json) {
    final id = _string(json, 'id').trim();
    if (id.isEmpty) return null;

    final title = _string(json, 'title').trim();
    final body = _string(json, 'body').trim();
    if (title.isEmpty && body.isEmpty) return null;

    return ServerMessage(
      id: id,
      title: title,
      body: body,
      color: switch (_string(json, 'color').toLowerCase()) {
        'green' => ServerMessageColor.green,
        'red' => ServerMessageColor.red,
        'yellow' => ServerMessageColor.yellow,
        'blue' => ServerMessageColor.blue,
        _ => ServerMessageColor.white,
      },
      delivery: switch (_string(json, 'delivery').toLowerCase()) {
        'popup' => ServerMessageDelivery.popup,
        'toast' => ServerMessageDelivery.toast,
        _ => ServerMessageDelivery.inbox,
      },
      pinned: _value(json, 'pinned') == true,
      actionLabel: _nullableString(json, 'actionLabel'),
      actionUrl: _nullableString(json, 'actionUrl'),
      createdUtc: _date(json, 'createdUtc'),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'color': color.name,
    'delivery': delivery.name,
    'pinned': pinned,
    if (actionLabel != null) 'actionLabel': actionLabel,
    if (actionUrl != null) 'actionUrl': actionUrl,
    if (createdUtc != null) 'createdUtc': createdUtc!.toIso8601String(),
  };
}
