import 'dart:async';

import 'package:flutter/material.dart';
import 'package:server_core/server_core.dart';
import 'package:uuid/uuid.dart';

import '../../data/services/remote_search_sender.dart';
import '../../l10n/app_localizations.dart';
import '../util/error_message.dart';

/// Also works with ordinary session receivers: unverified text implementations
/// get one explicit Send instead of a stream of replacement values.
class RemoteSearchSheet extends StatefulWidget {
  const RemoteSearchSheet({
    super.key,
    required this.sessionApi,
    required this.sessionId,
    required this.deviceName,
    required this.liveUpdates,
    required this.connected,
  });

  final SessionApi sessionApi;
  final String sessionId;
  final String deviceName;
  final bool liveUpdates;
  final ValueNotifier<bool> connected;

  @override
  State<RemoteSearchSheet> createState() => _RemoteSearchSheetState();
}

class _RemoteSearchSheetState extends State<RemoteSearchSheet>
    with WidgetsBindingObserver {
  final _text = TextEditingController();
  final _focus = FocusNode();
  late RemoteSearchSender _sender;
  Timer? _debounce;
  Object? _error;
  bool _finishing = false;
  bool _retryFinish = false;
  bool _suspended = false;
  String? _lastQueuedText = '';

  RemoteSearchSender _newSender() {
    final api = widget.sessionApi;
    final id = widget.sessionId;
    final live = widget.liveUpdates;
    return RemoteSearchSender(
      inputId: const Uuid().v4(),
      send: (name, arguments) => api.sendGeneralCommand(
        id,
        name,
        arguments: live
            ? arguments
            : {
                if (arguments.containsKey('String'))
                  'String': arguments['String']!,
              },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _sender = _newSender();
    _text.addListener(_changed);
    widget.connected.addListener(_connectionChanged);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _focus.requestFocus();
      unawaited(_send());
    });
  }

  void _changed() {
    if (!widget.liveUpdates || _suspended || !widget.connected.value) return;
    // Predictive keyboards compose ordinary words too. Mirror the visible
    // phrase without changing the phone's composing range or selection.
    if (_lastQueuedText == _text.text) return;
    _debounce?.cancel();
    _lastQueuedText = _text.text;
    _sender.setText(_text.text);
    if (_error == null && !_finishing) {
      _debounce = Timer(const Duration(milliseconds: 200), () => _send());
    }
  }

  void _connectionChanged() {
    _debounce?.cancel();
    _sender.close();
    _lastQueuedText = null;
    _finishing = false;
    _retryFinish = false;
    _error = null;
    if (widget.connected.value) _sender = _newSender();
    if (mounted) setState(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (_suspended) {
        _sender = _newSender();
        _lastQueuedText = null;
        setState(() {
          _finishing = false;
          _retryFinish = false;
          _error = null;
        });
      }
      _suspended = false;
    } else if (state == AppLifecycleState.hidden ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      _suspended = true;
      _debounce?.cancel();
      _sender.close();
    }
  }

  Future<void> _send({bool finish = false}) async {
    if (!widget.connected.value || _suspended || _finishing) return;
    _debounce?.cancel();
    setState(() {
      if (finish) _finishing = true;
      _error = null;
    });
    if (finish) {
      // Match keyboard submission when Done was tapped in the app. Only an
      // explicit completion ends composition; live previews leave it alone.
      _focus.unfocus();
      _text.clearComposing();
      if (!widget.liveUpdates || _lastQueuedText != _text.text) {
        _lastQueuedText = _text.text;
        _sender.setText(_text.text);
      }
    }
    final sender = _sender;
    try {
      await sender.flush();
      if (mounted && identical(sender, _sender)) _retryFinish = false;
      if (finish &&
          mounted &&
          identical(sender, _sender) &&
          widget.connected.value &&
          !_suspended) {
        Navigator.of(context).pop();
      }
    } catch (error) {
      if (mounted && identical(sender, _sender)) {
        setState(() {
          _error = error;
          _retryFinish = _retryFinish || finish;
          if (finish) _finishing = false;
        });
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.connected.removeListener(_connectionChanged);
    _debounce?.cancel();
    _sender.close();
    _text.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final connected = widget.connected.value;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        16,
        20,
        MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${l10n.search} · ${widget.deviceName}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _text,
                focusNode: _focus,
                enabled: connected && !_finishing,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _send(finish: true),
                decoration: InputDecoration(
                  hintText: l10n.searchEllipsis,
                  suffixIcon: IconButton(
                    tooltip: l10n.clear,
                    onPressed: connected && !_finishing ? _text.clear : null,
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
              if (!connected) Text(l10n.remoteNoSessions),
              if (_error != null) ...[
                Text(l10n.remoteCommandFailed(describeError(_error!, l10n))),
                TextButton(
                  onPressed: () =>
                      _send(finish: _retryFinish || !widget.liveUpdates),
                  child: Text(l10n.retry),
                ),
              ],
              const SizedBox(height: 12),
              FilledButton(
                onPressed: connected && !_finishing
                    ? () => _send(finish: true)
                    : null,
                child: Text(widget.liveUpdates ? l10n.done : l10n.send),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
