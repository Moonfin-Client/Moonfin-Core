import 'dart:convert';
import 'dart:io';

import 'package:playback_silo/playback_silo.dart';
import 'package:test/test.dart';

import 'silo_contract.dart';

final _capabilities = siloCapabilitiesFromDeviceProfile(
  jsonDecode(File('test/fixtures/device_profile_mpv.json').readAsStringSync())
      as Map<String, dynamic>,
  traits: SiloPlayerTraits.aether,
);

void main() {
  test('a Mac whose display can\'t be asked', () {
    final context = siloPlaybackContext(
      environment: const SiloPlaybackEnvironment(
        formFactor: 'desktop',
        platform: 'macos',
        osVersion: 'Version 15.5 (Build 24F74)',
        manufacturer: 'Apple',
        model: 'Mac16,10',
      ),
      appVersion: '1.9.0',
      capabilities: _capabilities,
    );
    expect(context['protocol_version'], 3);
    expect(context['form_factor'], 'desktop');
    expect(context['app_version'], '1.9.0');
    expect(context['device'], {
      'platform': 'macos',
      'os_version': 'Version 15.5 (Build 24F74)',
      'manufacturer': 'Apple',
      'model': 'Mac16,10',
    });
    // No native HDR claim, and Silo is told why.
    expect(context['output'], {
      'hdr_details': {
        'hdr10': false,
        'hdr10_plus': false,
        'hlg': false,
        'dolby_vision_profiles': <int>[],
      },
      'display': {'hdr_evidence': 'unknown'},
    });
    expect(context['deliveries'], _capabilities.deliveries);
    expect(siloSchemaErrors('ClientPlaybackContextV3', context), isEmpty);
  });

  test('a display that answered: what both it and the decoder show', () {
    final context = siloPlaybackContext(
      environment: const SiloPlaybackEnvironment(
        formFactor: 'tv',
        displayHdr: {
          'hdr10': true,
          'hlg': true,
          'dolby_vision_profiles': [8, 5, 7],
        },
      ),
      appVersion: '1.9.0',
      capabilities: _capabilities,
    );
    final output = context['output'] as Map;
    // The decoder has no profile 7, and the display no HDR10+.
    expect(output['hdr_details'], {
      'hdr10': true,
      'hdr10_plus': false,
      'hlg': true,
      'dolby_vision_profiles': [5, 8],
    });
    expect(output['display'], {
      'hdr_evidence': 'exact',
      'hdr_types': {
        'hdr10': true,
        'hdr10_plus': false,
        'hlg': true,
        'dolby_vision_profiles': [5, 7, 8],
      },
    });
    expect(siloSchemaErrors('ClientPlaybackContextV3', context), isEmpty);
  });

  test('unknown and over-long values are left out or cut', () {
    final context = siloPlaybackContext(
      environment: SiloPlaybackEnvironment(
        osVersion: '  ',
        model: 'x' * 200,
        appBuild: '',
      ),
      appVersion: ' ',
      capabilities: _capabilities,
    );
    expect(context['device'], {'model': 'x' * 128});
    expect(context, isNot(contains('app_build')));
    expect(context['app_version'], 'unknown');
    expect(siloSchemaErrors('ClientPlaybackContextV3', context), isEmpty);
  });
}
