import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/remote_search_sender.dart';
import 'package:moonfin/data/services/remote_search_session.dart';
import 'package:moonfin/data/services/websocket_message_parser.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/src/api/emby_session_api.dart';
import 'package:server_jellyfin/src/api/jellyfin_session_api.dart';

void main() {
  final factories = <String, SessionApi Function(Dio)>{
    'Jellyfin': JellyfinSessionApi.new,
    'Emby': EmbySessionApi.new,
  };
  for (final entry in factories.entries) {
    test(
      '${entry.key} carries search, Unicode and empty text through the session envelope',
      () async {
        RemoteSearchSession? receiver;
        final values = <String>[];
        final dio = Dio();
        addTearDown(dio.close);
        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (request, handler) {
              expect(request.method, 'POST');
              expect(request.path, '/Sessions/selected-tv/Command');
              // Model the server forwarding the posted body on its existing socket.
              final message = WebSocketMessageParser.parse(
                jsonEncode({
                  'MessageType': 'GeneralCommand',
                  'Data': request.data,
                }),
              ) as GeneralCommandMessage;
              if (message.name == 'GoToSearch') {
                receiver = RemoteSearchSession(
                  message.arguments['MoonfinInputId'],
                );
                receiver!.attach(values.add);
              } else {
                expect(message.name, 'SendString');
                receiver!.receive(message.arguments);
              }
              handler.resolve(
                Response(requestOptions: request, statusCode: 204),
              );
            },
          ),
        );
        final api = entry.value(dio);
        final sender = RemoteSearchSender(
          inputId: 'phone',
          send: (name, arguments) =>
              api.sendGeneralCommand('selected-tv', name, arguments: arguments),
        );
        sender.setText('élève 日本語 🦞');
        await sender.flush();
        sender.setText('');
        await sender.flush();
        expect(values, ['', 'élève 日本語 🦞', '']);
        sender.close();
        receiver!.close();
      },
    );
  }
}
