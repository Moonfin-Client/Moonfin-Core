import 'package:json_annotation/json_annotation.dart';

part 'seerr_models.g.dart';

class MoonfinProxyConfig {
  final String jellyfinBaseUrl;
  final String jellyfinToken;

  const MoonfinProxyConfig({
    required this.jellyfinBaseUrl,
    required this.jellyfinToken,
  });
}

@JsonSerializable()
class MoonfinStatusResponse {
  final bool enabled;
  final bool authenticated;
  final String? url;
  final int? seerrUserId;
  final String? displayName;
  final String? avatar;
  final int permissions;
  final int? sessionCreated;
  final int? lastValidated;

  const MoonfinStatusResponse({
    this.enabled = false,
    this.authenticated = false,
    this.url,
    this.seerrUserId,
    this.displayName,
    this.avatar,
    this.permissions = 0,
    this.sessionCreated,
    this.lastValidated,
  });

  factory MoonfinStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$MoonfinStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoonfinStatusResponseToJson(this);
}

@JsonSerializable()
class MoonfinLoginRequest {
  final String username;
  final String password;
  final String authType;

  const MoonfinLoginRequest({
    required this.username,
    required this.password,
    this.authType = 'jellyfin',
  });

  factory MoonfinLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$MoonfinLoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MoonfinLoginRequestToJson(this);
}

@JsonSerializable()
class MoonfinLoginResponse {
  final bool success;
  final String? error;
  final int? seerrUserId;
  final String? displayName;
  final String? avatar;
  final int permissions;

  const MoonfinLoginResponse({
    this.success = false,
    this.error,
    this.seerrUserId,
    this.displayName,
    this.avatar,
    this.permissions = 0,
  });

  factory MoonfinLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$MoonfinLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoonfinLoginResponseToJson(this);
}

@JsonSerializable()
class MoonfinValidateResponse {
  final bool valid;
  final int? lastValidated;

  const MoonfinValidateResponse({
    this.valid = false,
    this.lastValidated,
  });

  factory MoonfinValidateResponse.fromJson(Map<String, dynamic> json) =>
      _$MoonfinValidateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoonfinValidateResponseToJson(this);
}

@JsonSerializable()
class SeerrMainSettings {
  final String apiKey;

  const SeerrMainSettings({required this.apiKey});

  factory SeerrMainSettings.fromJson(Map<String, dynamic> json) =>
      _$SeerrMainSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SeerrMainSettingsToJson(this);
}

@JsonSerializable()
class SeerrStatus {
  final String? version;
  final int? commitTag;
  final int? updateAvailable;
  final int? commitsBehind;

  const SeerrStatus({
    this.version,
    this.commitTag,
    this.updateAvailable,
    this.commitsBehind,
  });

  factory SeerrStatus.fromJson(Map<String, dynamic> json) =>
      _$SeerrStatusFromJson(json);

  Map<String, dynamic> toJson() => _$SeerrStatusToJson(this);
}

/// Title and poster for a request or issue card. The request and issue list
/// media objects only carry ids, so these come from the details endpoints.
class SeerrMediaSummary {
  final String? title;
  final String? posterPath;

  const SeerrMediaSummary({this.title, this.posterPath});
}
