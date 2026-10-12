import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:server_core/server_core.dart';

class _Session extends Mock implements SessionRepository {}

class _Client extends Mock implements MediaServerClient {}

class _Store extends Mock implements PreferenceStore {}

class _PausedInit extends SeerrRepository {
  _PausedInit(super.store, super.session, super.client);
  final initialized = Completer<void>();
  @override
  Future<void> ensureInitialized({bool force = false}) => initialized.future;
}

void main() {
  for (final changed in ['user', 'server', 'token']) {
    test(
      'does not submit under a different $changed after async initialization',
      () async {
        final session = _Session();
        final client = _Client();
        when(() => session.activeServerId).thenReturn('server');
        when(() => session.activeUserId).thenReturn('user');
        when(() => client.baseUrl).thenReturn('https://server');
        when(() => client.userId).thenReturn('user');
        when(() => client.accessToken).thenReturn('token');
        final repository = _PausedInit(_Store(), session, client);
        final pending = repository.createRequest(
          mediaId: 42,
          mediaType: 'movie',
        );
        switch (changed) {
          case 'user':
            when(() => session.activeUserId).thenReturn('other');
          case 'server':
            when(() => session.activeServerId).thenReturn('other');
          case 'token':
            when(() => client.accessToken).thenReturn('other');
        }
        repository.initialized.complete();
        await expectLater(
          pending,
          throwsA(
            isA<StateError>().having(
              (e) => e.message,
              'message',
              'Seerr account changed before request submission',
            ),
          ),
        );
      },
    );
  }
}
