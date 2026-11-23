// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iptv_database.dart';

// ignore_for_file: type=lint
class $PlaylistsTable extends Playlists
    with TableInfo<$PlaylistsTable, Playlist> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _epgUrlMeta = const VerificationMeta('epgUrl');
  @override
  late final GeneratedColumn<String> epgUrl = GeneratedColumn<String>(
    'epg_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _refreshIntervalMsMeta = const VerificationMeta(
    'refreshIntervalMs',
  );
  @override
  late final GeneratedColumn<int> refreshIntervalMs = GeneratedColumn<int>(
    'refresh_interval_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(86400000),
  );
  static const VerificationMeta _lastRefreshedMeta = const VerificationMeta(
    'lastRefreshed',
  );
  @override
  late final GeneratedColumn<DateTime> lastRefreshed =
      GeneratedColumn<DateTime>(
        'last_refreshed',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    sourceType,
    url,
    filePath,
    epgUrl,
    refreshIntervalMs,
    lastRefreshed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlists';
  @override
  VerificationContext validateIntegrity(
    Insertable<Playlist> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    }
    if (data.containsKey('epg_url')) {
      context.handle(
        _epgUrlMeta,
        epgUrl.isAcceptableOrUnknown(data['epg_url']!, _epgUrlMeta),
      );
    }
    if (data.containsKey('refresh_interval_ms')) {
      context.handle(
        _refreshIntervalMsMeta,
        refreshIntervalMs.isAcceptableOrUnknown(
          data['refresh_interval_ms']!,
          _refreshIntervalMsMeta,
        ),
      );
    }
    if (data.containsKey('last_refreshed')) {
      context.handle(
        _lastRefreshedMeta,
        lastRefreshed.isAcceptableOrUnknown(
          data['last_refreshed']!,
          _lastRefreshedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Playlist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Playlist(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      ),
      epgUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}epg_url'],
      ),
      refreshIntervalMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}refresh_interval_ms'],
      )!,
      lastRefreshed: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_refreshed'],
      ),
    );
  }

  @override
  $PlaylistsTable createAlias(String alias) {
    return $PlaylistsTable(attachedDatabase, alias);
  }
}

class Playlist extends DataClass implements Insertable<Playlist> {
  final int id;
  final String name;
  final String sourceType;
  final String? url;
  final String? filePath;
  final String? epgUrl;
  final int refreshIntervalMs;
  final DateTime? lastRefreshed;
  const Playlist({
    required this.id,
    required this.name,
    required this.sourceType,
    this.url,
    this.filePath,
    this.epgUrl,
    required this.refreshIntervalMs,
    this.lastRefreshed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    if (!nullToAbsent || epgUrl != null) {
      map['epg_url'] = Variable<String>(epgUrl);
    }
    map['refresh_interval_ms'] = Variable<int>(refreshIntervalMs);
    if (!nullToAbsent || lastRefreshed != null) {
      map['last_refreshed'] = Variable<DateTime>(lastRefreshed);
    }
    return map;
  }

  PlaylistsCompanion toCompanion(bool nullToAbsent) {
    return PlaylistsCompanion(
      id: Value(id),
      name: Value(name),
      sourceType: Value(sourceType),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      epgUrl: epgUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(epgUrl),
      refreshIntervalMs: Value(refreshIntervalMs),
      lastRefreshed: lastRefreshed == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRefreshed),
    );
  }

  factory Playlist.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Playlist(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      url: serializer.fromJson<String?>(json['url']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      epgUrl: serializer.fromJson<String?>(json['epgUrl']),
      refreshIntervalMs: serializer.fromJson<int>(json['refreshIntervalMs']),
      lastRefreshed: serializer.fromJson<DateTime?>(json['lastRefreshed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'sourceType': serializer.toJson<String>(sourceType),
      'url': serializer.toJson<String?>(url),
      'filePath': serializer.toJson<String?>(filePath),
      'epgUrl': serializer.toJson<String?>(epgUrl),
      'refreshIntervalMs': serializer.toJson<int>(refreshIntervalMs),
      'lastRefreshed': serializer.toJson<DateTime?>(lastRefreshed),
    };
  }

  Playlist copyWith({
    int? id,
    String? name,
    String? sourceType,
    Value<String?> url = const Value.absent(),
    Value<String?> filePath = const Value.absent(),
    Value<String?> epgUrl = const Value.absent(),
    int? refreshIntervalMs,
    Value<DateTime?> lastRefreshed = const Value.absent(),
  }) => Playlist(
    id: id ?? this.id,
    name: name ?? this.name,
    sourceType: sourceType ?? this.sourceType,
    url: url.present ? url.value : this.url,
    filePath: filePath.present ? filePath.value : this.filePath,
    epgUrl: epgUrl.present ? epgUrl.value : this.epgUrl,
    refreshIntervalMs: refreshIntervalMs ?? this.refreshIntervalMs,
    lastRefreshed: lastRefreshed.present
        ? lastRefreshed.value
        : this.lastRefreshed,
  );
  Playlist copyWithCompanion(PlaylistsCompanion data) {
    return Playlist(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      url: data.url.present ? data.url.value : this.url,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      epgUrl: data.epgUrl.present ? data.epgUrl.value : this.epgUrl,
      refreshIntervalMs: data.refreshIntervalMs.present
          ? data.refreshIntervalMs.value
          : this.refreshIntervalMs,
      lastRefreshed: data.lastRefreshed.present
          ? data.lastRefreshed.value
          : this.lastRefreshed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Playlist(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sourceType: $sourceType, ')
          ..write('url: $url, ')
          ..write('filePath: $filePath, ')
          ..write('epgUrl: $epgUrl, ')
          ..write('refreshIntervalMs: $refreshIntervalMs, ')
          ..write('lastRefreshed: $lastRefreshed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    sourceType,
    url,
    filePath,
    epgUrl,
    refreshIntervalMs,
    lastRefreshed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Playlist &&
          other.id == this.id &&
          other.name == this.name &&
          other.sourceType == this.sourceType &&
          other.url == this.url &&
          other.filePath == this.filePath &&
          other.epgUrl == this.epgUrl &&
          other.refreshIntervalMs == this.refreshIntervalMs &&
          other.lastRefreshed == this.lastRefreshed);
}

class PlaylistsCompanion extends UpdateCompanion<Playlist> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> sourceType;
  final Value<String?> url;
  final Value<String?> filePath;
  final Value<String?> epgUrl;
  final Value<int> refreshIntervalMs;
  final Value<DateTime?> lastRefreshed;
  const PlaylistsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.url = const Value.absent(),
    this.filePath = const Value.absent(),
    this.epgUrl = const Value.absent(),
    this.refreshIntervalMs = const Value.absent(),
    this.lastRefreshed = const Value.absent(),
  });
  PlaylistsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String sourceType,
    this.url = const Value.absent(),
    this.filePath = const Value.absent(),
    this.epgUrl = const Value.absent(),
    this.refreshIntervalMs = const Value.absent(),
    this.lastRefreshed = const Value.absent(),
  }) : name = Value(name),
       sourceType = Value(sourceType);
  static Insertable<Playlist> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? sourceType,
    Expression<String>? url,
    Expression<String>? filePath,
    Expression<String>? epgUrl,
    Expression<int>? refreshIntervalMs,
    Expression<DateTime>? lastRefreshed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sourceType != null) 'source_type': sourceType,
      if (url != null) 'url': url,
      if (filePath != null) 'file_path': filePath,
      if (epgUrl != null) 'epg_url': epgUrl,
      if (refreshIntervalMs != null) 'refresh_interval_ms': refreshIntervalMs,
      if (lastRefreshed != null) 'last_refreshed': lastRefreshed,
    });
  }

  PlaylistsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? sourceType,
    Value<String?>? url,
    Value<String?>? filePath,
    Value<String?>? epgUrl,
    Value<int>? refreshIntervalMs,
    Value<DateTime?>? lastRefreshed,
  }) {
    return PlaylistsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sourceType: sourceType ?? this.sourceType,
      url: url ?? this.url,
      filePath: filePath ?? this.filePath,
      epgUrl: epgUrl ?? this.epgUrl,
      refreshIntervalMs: refreshIntervalMs ?? this.refreshIntervalMs,
      lastRefreshed: lastRefreshed ?? this.lastRefreshed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (epgUrl.present) {
      map['epg_url'] = Variable<String>(epgUrl.value);
    }
    if (refreshIntervalMs.present) {
      map['refresh_interval_ms'] = Variable<int>(refreshIntervalMs.value);
    }
    if (lastRefreshed.present) {
      map['last_refreshed'] = Variable<DateTime>(lastRefreshed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sourceType: $sourceType, ')
          ..write('url: $url, ')
          ..write('filePath: $filePath, ')
          ..write('epgUrl: $epgUrl, ')
          ..write('refreshIntervalMs: $refreshIntervalMs, ')
          ..write('lastRefreshed: $lastRefreshed')
          ..write(')'))
        .toString();
  }
}

class $ChannelGroupsTable extends ChannelGroups
    with TableInfo<$ChannelGroupsTable, ChannelGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChannelGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlists (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _providerNameMeta = const VerificationMeta(
    'providerName',
  );
  @override
  late final GeneratedColumn<String> providerName = GeneratedColumn<String>(
    'provider_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playlistId,
    name,
    providerName,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'channel_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChannelGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('provider_name')) {
      context.handle(
        _providerNameMeta,
        providerName.isAcceptableOrUnknown(
          data['provider_name']!,
          _providerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_providerNameMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChannelGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChannelGroup(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      providerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_name'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $ChannelGroupsTable createAlias(String alias) {
    return $ChannelGroupsTable(attachedDatabase, alias);
  }
}

class ChannelGroup extends DataClass implements Insertable<ChannelGroup> {
  final int id;
  final int playlistId;
  final String name;

  /// The name the provider uses, which a refresh matches on, so a group
  /// renamed in the editor keeps its id and allowlist.
  final String providerName;
  final int sortOrder;
  const ChannelGroup({
    required this.id,
    required this.playlistId,
    required this.name,
    required this.providerName,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<int>(playlistId);
    map['name'] = Variable<String>(name);
    map['provider_name'] = Variable<String>(providerName);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  ChannelGroupsCompanion toCompanion(bool nullToAbsent) {
    return ChannelGroupsCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      name: Value(name),
      providerName: Value(providerName),
      sortOrder: Value(sortOrder),
    );
  }

  factory ChannelGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChannelGroup(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      name: serializer.fromJson<String>(json['name']),
      providerName: serializer.fromJson<String>(json['providerName']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int>(playlistId),
      'name': serializer.toJson<String>(name),
      'providerName': serializer.toJson<String>(providerName),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  ChannelGroup copyWith({
    int? id,
    int? playlistId,
    String? name,
    String? providerName,
    int? sortOrder,
  }) => ChannelGroup(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    name: name ?? this.name,
    providerName: providerName ?? this.providerName,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  ChannelGroup copyWithCompanion(ChannelGroupsCompanion data) {
    return ChannelGroup(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      name: data.name.present ? data.name.value : this.name,
      providerName: data.providerName.present
          ? data.providerName.value
          : this.providerName,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChannelGroup(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('name: $name, ')
          ..write('providerName: $providerName, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, playlistId, name, providerName, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChannelGroup &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.name == this.name &&
          other.providerName == this.providerName &&
          other.sortOrder == this.sortOrder);
}

class ChannelGroupsCompanion extends UpdateCompanion<ChannelGroup> {
  final Value<int> id;
  final Value<int> playlistId;
  final Value<String> name;
  final Value<String> providerName;
  final Value<int> sortOrder;
  const ChannelGroupsCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.name = const Value.absent(),
    this.providerName = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  ChannelGroupsCompanion.insert({
    this.id = const Value.absent(),
    required int playlistId,
    required String name,
    required String providerName,
    this.sortOrder = const Value.absent(),
  }) : playlistId = Value(playlistId),
       name = Value(name),
       providerName = Value(providerName);
  static Insertable<ChannelGroup> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<String>? name,
    Expression<String>? providerName,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (name != null) 'name': name,
      if (providerName != null) 'provider_name': providerName,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  ChannelGroupsCompanion copyWith({
    Value<int>? id,
    Value<int>? playlistId,
    Value<String>? name,
    Value<String>? providerName,
    Value<int>? sortOrder,
  }) {
    return ChannelGroupsCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      name: name ?? this.name,
      providerName: providerName ?? this.providerName,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (providerName.present) {
      map['provider_name'] = Variable<String>(providerName.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChannelGroupsCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('name: $name, ')
          ..write('providerName: $providerName, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $ChannelsTable extends Channels with TableInfo<$ChannelsTable, Channel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChannelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlists (id)',
    ),
  );
  static const VerificationMeta _groupIdMeta = const VerificationMeta(
    'groupId',
  );
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
    'group_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES channel_groups (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _streamUrlMeta = const VerificationMeta(
    'streamUrl',
  );
  @override
  late final GeneratedColumn<String> streamUrl = GeneratedColumn<String>(
    'stream_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _logoUrlMeta = const VerificationMeta(
    'logoUrl',
  );
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
    'logo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tvgIdMeta = const VerificationMeta('tvgId');
  @override
  late final GeneratedColumn<String> tvgId = GeneratedColumn<String>(
    'tvg_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _channelNumberMeta = const VerificationMeta(
    'channelNumber',
  );
  @override
  late final GeneratedColumn<int> channelNumber = GeneratedColumn<int>(
    'channel_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isVodMeta = const VerificationMeta('isVod');
  @override
  late final GeneratedColumn<bool> isVod = GeneratedColumn<bool>(
    'is_vod',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_vod" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _catchupModeMeta = const VerificationMeta(
    'catchupMode',
  );
  @override
  late final GeneratedColumn<String> catchupMode = GeneratedColumn<String>(
    'catchup_mode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _catchupSourceMeta = const VerificationMeta(
    'catchupSource',
  );
  @override
  late final GeneratedColumn<String> catchupSource = GeneratedColumn<String>(
    'catchup_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _catchupDaysMeta = const VerificationMeta(
    'catchupDays',
  );
  @override
  late final GeneratedColumn<int> catchupDays = GeneratedColumn<int>(
    'catchup_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playlistId,
    groupId,
    name,
    streamUrl,
    logoUrl,
    tvgId,
    channelNumber,
    isVod,
    catchupMode,
    catchupSource,
    catchupDays,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'channels';
  @override
  VerificationContext validateIntegrity(
    Insertable<Channel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(
        _groupIdMeta,
        groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('stream_url')) {
      context.handle(
        _streamUrlMeta,
        streamUrl.isAcceptableOrUnknown(data['stream_url']!, _streamUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_streamUrlMeta);
    }
    if (data.containsKey('logo_url')) {
      context.handle(
        _logoUrlMeta,
        logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta),
      );
    }
    if (data.containsKey('tvg_id')) {
      context.handle(
        _tvgIdMeta,
        tvgId.isAcceptableOrUnknown(data['tvg_id']!, _tvgIdMeta),
      );
    }
    if (data.containsKey('channel_number')) {
      context.handle(
        _channelNumberMeta,
        channelNumber.isAcceptableOrUnknown(
          data['channel_number']!,
          _channelNumberMeta,
        ),
      );
    }
    if (data.containsKey('is_vod')) {
      context.handle(
        _isVodMeta,
        isVod.isAcceptableOrUnknown(data['is_vod']!, _isVodMeta),
      );
    }
    if (data.containsKey('catchup_mode')) {
      context.handle(
        _catchupModeMeta,
        catchupMode.isAcceptableOrUnknown(
          data['catchup_mode']!,
          _catchupModeMeta,
        ),
      );
    }
    if (data.containsKey('catchup_source')) {
      context.handle(
        _catchupSourceMeta,
        catchupSource.isAcceptableOrUnknown(
          data['catchup_source']!,
          _catchupSourceMeta,
        ),
      );
    }
    if (data.containsKey('catchup_days')) {
      context.handle(
        _catchupDaysMeta,
        catchupDays.isAcceptableOrUnknown(
          data['catchup_days']!,
          _catchupDaysMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Channel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Channel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      groupId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}group_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      streamUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stream_url'],
      )!,
      logoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_url'],
      ),
      tvgId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tvg_id'],
      ),
      channelNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}channel_number'],
      ),
      isVod: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_vod'],
      )!,
      catchupMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catchup_mode'],
      ),
      catchupSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catchup_source'],
      ),
      catchupDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}catchup_days'],
      ),
    );
  }

  @override
  $ChannelsTable createAlias(String alias) {
    return $ChannelsTable(attachedDatabase, alias);
  }
}

class Channel extends DataClass implements Insertable<Channel> {
  final int id;
  final int playlistId;
  final int? groupId;
  final String name;
  final String streamUrl;
  final String? logoUrl;
  final String? tvgId;
  final int? channelNumber;
  final bool isVod;
  final String? catchupMode;
  final String? catchupSource;
  final int? catchupDays;
  const Channel({
    required this.id,
    required this.playlistId,
    this.groupId,
    required this.name,
    required this.streamUrl,
    this.logoUrl,
    this.tvgId,
    this.channelNumber,
    required this.isVod,
    this.catchupMode,
    this.catchupSource,
    this.catchupDays,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<int>(playlistId);
    if (!nullToAbsent || groupId != null) {
      map['group_id'] = Variable<int>(groupId);
    }
    map['name'] = Variable<String>(name);
    map['stream_url'] = Variable<String>(streamUrl);
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    if (!nullToAbsent || tvgId != null) {
      map['tvg_id'] = Variable<String>(tvgId);
    }
    if (!nullToAbsent || channelNumber != null) {
      map['channel_number'] = Variable<int>(channelNumber);
    }
    map['is_vod'] = Variable<bool>(isVod);
    if (!nullToAbsent || catchupMode != null) {
      map['catchup_mode'] = Variable<String>(catchupMode);
    }
    if (!nullToAbsent || catchupSource != null) {
      map['catchup_source'] = Variable<String>(catchupSource);
    }
    if (!nullToAbsent || catchupDays != null) {
      map['catchup_days'] = Variable<int>(catchupDays);
    }
    return map;
  }

  ChannelsCompanion toCompanion(bool nullToAbsent) {
    return ChannelsCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      name: Value(name),
      streamUrl: Value(streamUrl),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
      tvgId: tvgId == null && nullToAbsent
          ? const Value.absent()
          : Value(tvgId),
      channelNumber: channelNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(channelNumber),
      isVod: Value(isVod),
      catchupMode: catchupMode == null && nullToAbsent
          ? const Value.absent()
          : Value(catchupMode),
      catchupSource: catchupSource == null && nullToAbsent
          ? const Value.absent()
          : Value(catchupSource),
      catchupDays: catchupDays == null && nullToAbsent
          ? const Value.absent()
          : Value(catchupDays),
    );
  }

  factory Channel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Channel(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      groupId: serializer.fromJson<int?>(json['groupId']),
      name: serializer.fromJson<String>(json['name']),
      streamUrl: serializer.fromJson<String>(json['streamUrl']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
      tvgId: serializer.fromJson<String?>(json['tvgId']),
      channelNumber: serializer.fromJson<int?>(json['channelNumber']),
      isVod: serializer.fromJson<bool>(json['isVod']),
      catchupMode: serializer.fromJson<String?>(json['catchupMode']),
      catchupSource: serializer.fromJson<String?>(json['catchupSource']),
      catchupDays: serializer.fromJson<int?>(json['catchupDays']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int>(playlistId),
      'groupId': serializer.toJson<int?>(groupId),
      'name': serializer.toJson<String>(name),
      'streamUrl': serializer.toJson<String>(streamUrl),
      'logoUrl': serializer.toJson<String?>(logoUrl),
      'tvgId': serializer.toJson<String?>(tvgId),
      'channelNumber': serializer.toJson<int?>(channelNumber),
      'isVod': serializer.toJson<bool>(isVod),
      'catchupMode': serializer.toJson<String?>(catchupMode),
      'catchupSource': serializer.toJson<String?>(catchupSource),
      'catchupDays': serializer.toJson<int?>(catchupDays),
    };
  }

  Channel copyWith({
    int? id,
    int? playlistId,
    Value<int?> groupId = const Value.absent(),
    String? name,
    String? streamUrl,
    Value<String?> logoUrl = const Value.absent(),
    Value<String?> tvgId = const Value.absent(),
    Value<int?> channelNumber = const Value.absent(),
    bool? isVod,
    Value<String?> catchupMode = const Value.absent(),
    Value<String?> catchupSource = const Value.absent(),
    Value<int?> catchupDays = const Value.absent(),
  }) => Channel(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    groupId: groupId.present ? groupId.value : this.groupId,
    name: name ?? this.name,
    streamUrl: streamUrl ?? this.streamUrl,
    logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
    tvgId: tvgId.present ? tvgId.value : this.tvgId,
    channelNumber: channelNumber.present
        ? channelNumber.value
        : this.channelNumber,
    isVod: isVod ?? this.isVod,
    catchupMode: catchupMode.present ? catchupMode.value : this.catchupMode,
    catchupSource: catchupSource.present
        ? catchupSource.value
        : this.catchupSource,
    catchupDays: catchupDays.present ? catchupDays.value : this.catchupDays,
  );
  Channel copyWithCompanion(ChannelsCompanion data) {
    return Channel(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      name: data.name.present ? data.name.value : this.name,
      streamUrl: data.streamUrl.present ? data.streamUrl.value : this.streamUrl,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
      tvgId: data.tvgId.present ? data.tvgId.value : this.tvgId,
      channelNumber: data.channelNumber.present
          ? data.channelNumber.value
          : this.channelNumber,
      isVod: data.isVod.present ? data.isVod.value : this.isVod,
      catchupMode: data.catchupMode.present
          ? data.catchupMode.value
          : this.catchupMode,
      catchupSource: data.catchupSource.present
          ? data.catchupSource.value
          : this.catchupSource,
      catchupDays: data.catchupDays.present
          ? data.catchupDays.value
          : this.catchupDays,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Channel(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('groupId: $groupId, ')
          ..write('name: $name, ')
          ..write('streamUrl: $streamUrl, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('tvgId: $tvgId, ')
          ..write('channelNumber: $channelNumber, ')
          ..write('isVod: $isVod, ')
          ..write('catchupMode: $catchupMode, ')
          ..write('catchupSource: $catchupSource, ')
          ..write('catchupDays: $catchupDays')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playlistId,
    groupId,
    name,
    streamUrl,
    logoUrl,
    tvgId,
    channelNumber,
    isVod,
    catchupMode,
    catchupSource,
    catchupDays,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Channel &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.groupId == this.groupId &&
          other.name == this.name &&
          other.streamUrl == this.streamUrl &&
          other.logoUrl == this.logoUrl &&
          other.tvgId == this.tvgId &&
          other.channelNumber == this.channelNumber &&
          other.isVod == this.isVod &&
          other.catchupMode == this.catchupMode &&
          other.catchupSource == this.catchupSource &&
          other.catchupDays == this.catchupDays);
}

class ChannelsCompanion extends UpdateCompanion<Channel> {
  final Value<int> id;
  final Value<int> playlistId;
  final Value<int?> groupId;
  final Value<String> name;
  final Value<String> streamUrl;
  final Value<String?> logoUrl;
  final Value<String?> tvgId;
  final Value<int?> channelNumber;
  final Value<bool> isVod;
  final Value<String?> catchupMode;
  final Value<String?> catchupSource;
  final Value<int?> catchupDays;
  const ChannelsCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.name = const Value.absent(),
    this.streamUrl = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.tvgId = const Value.absent(),
    this.channelNumber = const Value.absent(),
    this.isVod = const Value.absent(),
    this.catchupMode = const Value.absent(),
    this.catchupSource = const Value.absent(),
    this.catchupDays = const Value.absent(),
  });
  ChannelsCompanion.insert({
    this.id = const Value.absent(),
    required int playlistId,
    this.groupId = const Value.absent(),
    required String name,
    required String streamUrl,
    this.logoUrl = const Value.absent(),
    this.tvgId = const Value.absent(),
    this.channelNumber = const Value.absent(),
    this.isVod = const Value.absent(),
    this.catchupMode = const Value.absent(),
    this.catchupSource = const Value.absent(),
    this.catchupDays = const Value.absent(),
  }) : playlistId = Value(playlistId),
       name = Value(name),
       streamUrl = Value(streamUrl);
  static Insertable<Channel> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<int>? groupId,
    Expression<String>? name,
    Expression<String>? streamUrl,
    Expression<String>? logoUrl,
    Expression<String>? tvgId,
    Expression<int>? channelNumber,
    Expression<bool>? isVod,
    Expression<String>? catchupMode,
    Expression<String>? catchupSource,
    Expression<int>? catchupDays,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (groupId != null) 'group_id': groupId,
      if (name != null) 'name': name,
      if (streamUrl != null) 'stream_url': streamUrl,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (tvgId != null) 'tvg_id': tvgId,
      if (channelNumber != null) 'channel_number': channelNumber,
      if (isVod != null) 'is_vod': isVod,
      if (catchupMode != null) 'catchup_mode': catchupMode,
      if (catchupSource != null) 'catchup_source': catchupSource,
      if (catchupDays != null) 'catchup_days': catchupDays,
    });
  }

  ChannelsCompanion copyWith({
    Value<int>? id,
    Value<int>? playlistId,
    Value<int?>? groupId,
    Value<String>? name,
    Value<String>? streamUrl,
    Value<String?>? logoUrl,
    Value<String?>? tvgId,
    Value<int?>? channelNumber,
    Value<bool>? isVod,
    Value<String?>? catchupMode,
    Value<String?>? catchupSource,
    Value<int?>? catchupDays,
  }) {
    return ChannelsCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
      streamUrl: streamUrl ?? this.streamUrl,
      logoUrl: logoUrl ?? this.logoUrl,
      tvgId: tvgId ?? this.tvgId,
      channelNumber: channelNumber ?? this.channelNumber,
      isVod: isVod ?? this.isVod,
      catchupMode: catchupMode ?? this.catchupMode,
      catchupSource: catchupSource ?? this.catchupSource,
      catchupDays: catchupDays ?? this.catchupDays,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (streamUrl.present) {
      map['stream_url'] = Variable<String>(streamUrl.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (tvgId.present) {
      map['tvg_id'] = Variable<String>(tvgId.value);
    }
    if (channelNumber.present) {
      map['channel_number'] = Variable<int>(channelNumber.value);
    }
    if (isVod.present) {
      map['is_vod'] = Variable<bool>(isVod.value);
    }
    if (catchupMode.present) {
      map['catchup_mode'] = Variable<String>(catchupMode.value);
    }
    if (catchupSource.present) {
      map['catchup_source'] = Variable<String>(catchupSource.value);
    }
    if (catchupDays.present) {
      map['catchup_days'] = Variable<int>(catchupDays.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChannelsCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('groupId: $groupId, ')
          ..write('name: $name, ')
          ..write('streamUrl: $streamUrl, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('tvgId: $tvgId, ')
          ..write('channelNumber: $channelNumber, ')
          ..write('isVod: $isVod, ')
          ..write('catchupMode: $catchupMode, ')
          ..write('catchupSource: $catchupSource, ')
          ..write('catchupDays: $catchupDays')
          ..write(')'))
        .toString();
  }
}

class $ChannelEditsTable extends ChannelEdits
    with TableInfo<$ChannelEditsTable, ChannelEdit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChannelEditsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlists (id)',
    ),
  );
  static const VerificationMeta _streamUrlMeta = const VerificationMeta(
    'streamUrl',
  );
  @override
  late final GeneratedColumn<String> streamUrl = GeneratedColumn<String>(
    'stream_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _numberEditedMeta = const VerificationMeta(
    'numberEdited',
  );
  @override
  late final GeneratedColumn<bool> numberEdited = GeneratedColumn<bool>(
    'number_edited',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("number_edited" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _channelNumberMeta = const VerificationMeta(
    'channelNumber',
  );
  @override
  late final GeneratedColumn<int> channelNumber = GeneratedColumn<int>(
    'channel_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _removedMeta = const VerificationMeta(
    'removed',
  );
  @override
  late final GeneratedColumn<bool> removed = GeneratedColumn<bool>(
    'removed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("removed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playlistId,
    streamUrl,
    name,
    numberEdited,
    channelNumber,
    removed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'channel_edits';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChannelEdit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('stream_url')) {
      context.handle(
        _streamUrlMeta,
        streamUrl.isAcceptableOrUnknown(data['stream_url']!, _streamUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_streamUrlMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('number_edited')) {
      context.handle(
        _numberEditedMeta,
        numberEdited.isAcceptableOrUnknown(
          data['number_edited']!,
          _numberEditedMeta,
        ),
      );
    }
    if (data.containsKey('channel_number')) {
      context.handle(
        _channelNumberMeta,
        channelNumber.isAcceptableOrUnknown(
          data['channel_number']!,
          _channelNumberMeta,
        ),
      );
    }
    if (data.containsKey('removed')) {
      context.handle(
        _removedMeta,
        removed.isAcceptableOrUnknown(data['removed']!, _removedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {playlistId, streamUrl},
  ];
  @override
  ChannelEdit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChannelEdit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      streamUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stream_url'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      numberEdited: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}number_edited'],
      )!,
      channelNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}channel_number'],
      ),
      removed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}removed'],
      )!,
    );
  }

  @override
  $ChannelEditsTable createAlias(String alias) {
    return $ChannelEditsTable(attachedDatabase, alias);
  }
}

class ChannelEdit extends DataClass implements Insertable<ChannelEdit> {
  final int id;
  final int playlistId;
  final String streamUrl;
  final String? name;
  final bool numberEdited;
  final int? channelNumber;
  final bool removed;
  const ChannelEdit({
    required this.id,
    required this.playlistId,
    required this.streamUrl,
    this.name,
    required this.numberEdited,
    this.channelNumber,
    required this.removed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<int>(playlistId);
    map['stream_url'] = Variable<String>(streamUrl);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['number_edited'] = Variable<bool>(numberEdited);
    if (!nullToAbsent || channelNumber != null) {
      map['channel_number'] = Variable<int>(channelNumber);
    }
    map['removed'] = Variable<bool>(removed);
    return map;
  }

  ChannelEditsCompanion toCompanion(bool nullToAbsent) {
    return ChannelEditsCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      streamUrl: Value(streamUrl),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      numberEdited: Value(numberEdited),
      channelNumber: channelNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(channelNumber),
      removed: Value(removed),
    );
  }

  factory ChannelEdit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChannelEdit(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      streamUrl: serializer.fromJson<String>(json['streamUrl']),
      name: serializer.fromJson<String?>(json['name']),
      numberEdited: serializer.fromJson<bool>(json['numberEdited']),
      channelNumber: serializer.fromJson<int?>(json['channelNumber']),
      removed: serializer.fromJson<bool>(json['removed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int>(playlistId),
      'streamUrl': serializer.toJson<String>(streamUrl),
      'name': serializer.toJson<String?>(name),
      'numberEdited': serializer.toJson<bool>(numberEdited),
      'channelNumber': serializer.toJson<int?>(channelNumber),
      'removed': serializer.toJson<bool>(removed),
    };
  }

  ChannelEdit copyWith({
    int? id,
    int? playlistId,
    String? streamUrl,
    Value<String?> name = const Value.absent(),
    bool? numberEdited,
    Value<int?> channelNumber = const Value.absent(),
    bool? removed,
  }) => ChannelEdit(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    streamUrl: streamUrl ?? this.streamUrl,
    name: name.present ? name.value : this.name,
    numberEdited: numberEdited ?? this.numberEdited,
    channelNumber: channelNumber.present
        ? channelNumber.value
        : this.channelNumber,
    removed: removed ?? this.removed,
  );
  ChannelEdit copyWithCompanion(ChannelEditsCompanion data) {
    return ChannelEdit(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      streamUrl: data.streamUrl.present ? data.streamUrl.value : this.streamUrl,
      name: data.name.present ? data.name.value : this.name,
      numberEdited: data.numberEdited.present
          ? data.numberEdited.value
          : this.numberEdited,
      channelNumber: data.channelNumber.present
          ? data.channelNumber.value
          : this.channelNumber,
      removed: data.removed.present ? data.removed.value : this.removed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChannelEdit(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('streamUrl: $streamUrl, ')
          ..write('name: $name, ')
          ..write('numberEdited: $numberEdited, ')
          ..write('channelNumber: $channelNumber, ')
          ..write('removed: $removed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playlistId,
    streamUrl,
    name,
    numberEdited,
    channelNumber,
    removed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChannelEdit &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.streamUrl == this.streamUrl &&
          other.name == this.name &&
          other.numberEdited == this.numberEdited &&
          other.channelNumber == this.channelNumber &&
          other.removed == this.removed);
}

class ChannelEditsCompanion extends UpdateCompanion<ChannelEdit> {
  final Value<int> id;
  final Value<int> playlistId;
  final Value<String> streamUrl;
  final Value<String?> name;
  final Value<bool> numberEdited;
  final Value<int?> channelNumber;
  final Value<bool> removed;
  const ChannelEditsCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.streamUrl = const Value.absent(),
    this.name = const Value.absent(),
    this.numberEdited = const Value.absent(),
    this.channelNumber = const Value.absent(),
    this.removed = const Value.absent(),
  });
  ChannelEditsCompanion.insert({
    this.id = const Value.absent(),
    required int playlistId,
    required String streamUrl,
    this.name = const Value.absent(),
    this.numberEdited = const Value.absent(),
    this.channelNumber = const Value.absent(),
    this.removed = const Value.absent(),
  }) : playlistId = Value(playlistId),
       streamUrl = Value(streamUrl);
  static Insertable<ChannelEdit> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<String>? streamUrl,
    Expression<String>? name,
    Expression<bool>? numberEdited,
    Expression<int>? channelNumber,
    Expression<bool>? removed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (streamUrl != null) 'stream_url': streamUrl,
      if (name != null) 'name': name,
      if (numberEdited != null) 'number_edited': numberEdited,
      if (channelNumber != null) 'channel_number': channelNumber,
      if (removed != null) 'removed': removed,
    });
  }

  ChannelEditsCompanion copyWith({
    Value<int>? id,
    Value<int>? playlistId,
    Value<String>? streamUrl,
    Value<String?>? name,
    Value<bool>? numberEdited,
    Value<int?>? channelNumber,
    Value<bool>? removed,
  }) {
    return ChannelEditsCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      streamUrl: streamUrl ?? this.streamUrl,
      name: name ?? this.name,
      numberEdited: numberEdited ?? this.numberEdited,
      channelNumber: channelNumber ?? this.channelNumber,
      removed: removed ?? this.removed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (streamUrl.present) {
      map['stream_url'] = Variable<String>(streamUrl.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (numberEdited.present) {
      map['number_edited'] = Variable<bool>(numberEdited.value);
    }
    if (channelNumber.present) {
      map['channel_number'] = Variable<int>(channelNumber.value);
    }
    if (removed.present) {
      map['removed'] = Variable<bool>(removed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChannelEditsCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('streamUrl: $streamUrl, ')
          ..write('name: $name, ')
          ..write('numberEdited: $numberEdited, ')
          ..write('channelNumber: $channelNumber, ')
          ..write('removed: $removed')
          ..write(')'))
        .toString();
  }
}

class $EpgProgramsTable extends EpgPrograms
    with TableInfo<$EpgProgramsTable, EpgProgram> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EpgProgramsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _channelTvgIdMeta = const VerificationMeta(
    'channelTvgId',
  );
  @override
  late final GeneratedColumn<String> channelTvgId = GeneratedColumn<String>(
    'channel_tvg_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _episodeTitleMeta = const VerificationMeta(
    'episodeTitle',
  );
  @override
  late final GeneratedColumn<String> episodeTitle = GeneratedColumn<String>(
    'episode_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isMovieMeta = const VerificationMeta(
    'isMovie',
  );
  @override
  late final GeneratedColumn<bool> isMovie = GeneratedColumn<bool>(
    'is_movie',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_movie" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isSeriesMeta = const VerificationMeta(
    'isSeries',
  );
  @override
  late final GeneratedColumn<bool> isSeries = GeneratedColumn<bool>(
    'is_series',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_series" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isSportsMeta = const VerificationMeta(
    'isSports',
  );
  @override
  late final GeneratedColumn<bool> isSports = GeneratedColumn<bool>(
    'is_sports',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sports" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isNewsMeta = const VerificationMeta('isNews');
  @override
  late final GeneratedColumn<bool> isNews = GeneratedColumn<bool>(
    'is_news',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_news" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isKidsMeta = const VerificationMeta('isKids');
  @override
  late final GeneratedColumn<bool> isKids = GeneratedColumn<bool>(
    'is_kids',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_kids" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    channelTvgId,
    title,
    description,
    startTime,
    endTime,
    category,
    icon,
    episodeTitle,
    isMovie,
    isSeries,
    isSports,
    isNews,
    isKids,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'epg_programs';
  @override
  VerificationContext validateIntegrity(
    Insertable<EpgProgram> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('channel_tvg_id')) {
      context.handle(
        _channelTvgIdMeta,
        channelTvgId.isAcceptableOrUnknown(
          data['channel_tvg_id']!,
          _channelTvgIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_channelTvgIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('episode_title')) {
      context.handle(
        _episodeTitleMeta,
        episodeTitle.isAcceptableOrUnknown(
          data['episode_title']!,
          _episodeTitleMeta,
        ),
      );
    }
    if (data.containsKey('is_movie')) {
      context.handle(
        _isMovieMeta,
        isMovie.isAcceptableOrUnknown(data['is_movie']!, _isMovieMeta),
      );
    }
    if (data.containsKey('is_series')) {
      context.handle(
        _isSeriesMeta,
        isSeries.isAcceptableOrUnknown(data['is_series']!, _isSeriesMeta),
      );
    }
    if (data.containsKey('is_sports')) {
      context.handle(
        _isSportsMeta,
        isSports.isAcceptableOrUnknown(data['is_sports']!, _isSportsMeta),
      );
    }
    if (data.containsKey('is_news')) {
      context.handle(
        _isNewsMeta,
        isNews.isAcceptableOrUnknown(data['is_news']!, _isNewsMeta),
      );
    }
    if (data.containsKey('is_kids')) {
      context.handle(
        _isKidsMeta,
        isKids.isAcceptableOrUnknown(data['is_kids']!, _isKidsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EpgProgram map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EpgProgram(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      channelTvgId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel_tvg_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
      episodeTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}episode_title'],
      ),
      isMovie: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_movie'],
      )!,
      isSeries: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_series'],
      )!,
      isSports: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sports'],
      )!,
      isNews: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_news'],
      )!,
      isKids: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_kids'],
      )!,
    );
  }

  @override
  $EpgProgramsTable createAlias(String alias) {
    return $EpgProgramsTable(attachedDatabase, alias);
  }
}

class EpgProgram extends DataClass implements Insertable<EpgProgram> {
  final int id;
  final String channelTvgId;
  final String title;
  final String? description;
  final DateTime startTime;
  final DateTime endTime;
  final String? category;
  final String? icon;
  final String? episodeTitle;
  final bool isMovie;
  final bool isSeries;
  final bool isSports;
  final bool isNews;
  final bool isKids;
  const EpgProgram({
    required this.id,
    required this.channelTvgId,
    required this.title,
    this.description,
    required this.startTime,
    required this.endTime,
    this.category,
    this.icon,
    this.episodeTitle,
    required this.isMovie,
    required this.isSeries,
    required this.isSports,
    required this.isNews,
    required this.isKids,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['channel_tvg_id'] = Variable<String>(channelTvgId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || episodeTitle != null) {
      map['episode_title'] = Variable<String>(episodeTitle);
    }
    map['is_movie'] = Variable<bool>(isMovie);
    map['is_series'] = Variable<bool>(isSeries);
    map['is_sports'] = Variable<bool>(isSports);
    map['is_news'] = Variable<bool>(isNews);
    map['is_kids'] = Variable<bool>(isKids);
    return map;
  }

  EpgProgramsCompanion toCompanion(bool nullToAbsent) {
    return EpgProgramsCompanion(
      id: Value(id),
      channelTvgId: Value(channelTvgId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      startTime: Value(startTime),
      endTime: Value(endTime),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      episodeTitle: episodeTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(episodeTitle),
      isMovie: Value(isMovie),
      isSeries: Value(isSeries),
      isSports: Value(isSports),
      isNews: Value(isNews),
      isKids: Value(isKids),
    );
  }

  factory EpgProgram.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EpgProgram(
      id: serializer.fromJson<int>(json['id']),
      channelTvgId: serializer.fromJson<String>(json['channelTvgId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      category: serializer.fromJson<String?>(json['category']),
      icon: serializer.fromJson<String?>(json['icon']),
      episodeTitle: serializer.fromJson<String?>(json['episodeTitle']),
      isMovie: serializer.fromJson<bool>(json['isMovie']),
      isSeries: serializer.fromJson<bool>(json['isSeries']),
      isSports: serializer.fromJson<bool>(json['isSports']),
      isNews: serializer.fromJson<bool>(json['isNews']),
      isKids: serializer.fromJson<bool>(json['isKids']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'channelTvgId': serializer.toJson<String>(channelTvgId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'category': serializer.toJson<String?>(category),
      'icon': serializer.toJson<String?>(icon),
      'episodeTitle': serializer.toJson<String?>(episodeTitle),
      'isMovie': serializer.toJson<bool>(isMovie),
      'isSeries': serializer.toJson<bool>(isSeries),
      'isSports': serializer.toJson<bool>(isSports),
      'isNews': serializer.toJson<bool>(isNews),
      'isKids': serializer.toJson<bool>(isKids),
    };
  }

  EpgProgram copyWith({
    int? id,
    String? channelTvgId,
    String? title,
    Value<String?> description = const Value.absent(),
    DateTime? startTime,
    DateTime? endTime,
    Value<String?> category = const Value.absent(),
    Value<String?> icon = const Value.absent(),
    Value<String?> episodeTitle = const Value.absent(),
    bool? isMovie,
    bool? isSeries,
    bool? isSports,
    bool? isNews,
    bool? isKids,
  }) => EpgProgram(
    id: id ?? this.id,
    channelTvgId: channelTvgId ?? this.channelTvgId,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    category: category.present ? category.value : this.category,
    icon: icon.present ? icon.value : this.icon,
    episodeTitle: episodeTitle.present ? episodeTitle.value : this.episodeTitle,
    isMovie: isMovie ?? this.isMovie,
    isSeries: isSeries ?? this.isSeries,
    isSports: isSports ?? this.isSports,
    isNews: isNews ?? this.isNews,
    isKids: isKids ?? this.isKids,
  );
  EpgProgram copyWithCompanion(EpgProgramsCompanion data) {
    return EpgProgram(
      id: data.id.present ? data.id.value : this.id,
      channelTvgId: data.channelTvgId.present
          ? data.channelTvgId.value
          : this.channelTvgId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      category: data.category.present ? data.category.value : this.category,
      icon: data.icon.present ? data.icon.value : this.icon,
      episodeTitle: data.episodeTitle.present
          ? data.episodeTitle.value
          : this.episodeTitle,
      isMovie: data.isMovie.present ? data.isMovie.value : this.isMovie,
      isSeries: data.isSeries.present ? data.isSeries.value : this.isSeries,
      isSports: data.isSports.present ? data.isSports.value : this.isSports,
      isNews: data.isNews.present ? data.isNews.value : this.isNews,
      isKids: data.isKids.present ? data.isKids.value : this.isKids,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EpgProgram(')
          ..write('id: $id, ')
          ..write('channelTvgId: $channelTvgId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('category: $category, ')
          ..write('icon: $icon, ')
          ..write('episodeTitle: $episodeTitle, ')
          ..write('isMovie: $isMovie, ')
          ..write('isSeries: $isSeries, ')
          ..write('isSports: $isSports, ')
          ..write('isNews: $isNews, ')
          ..write('isKids: $isKids')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    channelTvgId,
    title,
    description,
    startTime,
    endTime,
    category,
    icon,
    episodeTitle,
    isMovie,
    isSeries,
    isSports,
    isNews,
    isKids,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EpgProgram &&
          other.id == this.id &&
          other.channelTvgId == this.channelTvgId &&
          other.title == this.title &&
          other.description == this.description &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.category == this.category &&
          other.icon == this.icon &&
          other.episodeTitle == this.episodeTitle &&
          other.isMovie == this.isMovie &&
          other.isSeries == this.isSeries &&
          other.isSports == this.isSports &&
          other.isNews == this.isNews &&
          other.isKids == this.isKids);
}

class EpgProgramsCompanion extends UpdateCompanion<EpgProgram> {
  final Value<int> id;
  final Value<String> channelTvgId;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<String?> category;
  final Value<String?> icon;
  final Value<String?> episodeTitle;
  final Value<bool> isMovie;
  final Value<bool> isSeries;
  final Value<bool> isSports;
  final Value<bool> isNews;
  final Value<bool> isKids;
  const EpgProgramsCompanion({
    this.id = const Value.absent(),
    this.channelTvgId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.category = const Value.absent(),
    this.icon = const Value.absent(),
    this.episodeTitle = const Value.absent(),
    this.isMovie = const Value.absent(),
    this.isSeries = const Value.absent(),
    this.isSports = const Value.absent(),
    this.isNews = const Value.absent(),
    this.isKids = const Value.absent(),
  });
  EpgProgramsCompanion.insert({
    this.id = const Value.absent(),
    required String channelTvgId,
    required String title,
    this.description = const Value.absent(),
    required DateTime startTime,
    required DateTime endTime,
    this.category = const Value.absent(),
    this.icon = const Value.absent(),
    this.episodeTitle = const Value.absent(),
    this.isMovie = const Value.absent(),
    this.isSeries = const Value.absent(),
    this.isSports = const Value.absent(),
    this.isNews = const Value.absent(),
    this.isKids = const Value.absent(),
  }) : channelTvgId = Value(channelTvgId),
       title = Value(title),
       startTime = Value(startTime),
       endTime = Value(endTime);
  static Insertable<EpgProgram> custom({
    Expression<int>? id,
    Expression<String>? channelTvgId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? category,
    Expression<String>? icon,
    Expression<String>? episodeTitle,
    Expression<bool>? isMovie,
    Expression<bool>? isSeries,
    Expression<bool>? isSports,
    Expression<bool>? isNews,
    Expression<bool>? isKids,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (channelTvgId != null) 'channel_tvg_id': channelTvgId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (category != null) 'category': category,
      if (icon != null) 'icon': icon,
      if (episodeTitle != null) 'episode_title': episodeTitle,
      if (isMovie != null) 'is_movie': isMovie,
      if (isSeries != null) 'is_series': isSeries,
      if (isSports != null) 'is_sports': isSports,
      if (isNews != null) 'is_news': isNews,
      if (isKids != null) 'is_kids': isKids,
    });
  }

  EpgProgramsCompanion copyWith({
    Value<int>? id,
    Value<String>? channelTvgId,
    Value<String>? title,
    Value<String?>? description,
    Value<DateTime>? startTime,
    Value<DateTime>? endTime,
    Value<String?>? category,
    Value<String?>? icon,
    Value<String?>? episodeTitle,
    Value<bool>? isMovie,
    Value<bool>? isSeries,
    Value<bool>? isSports,
    Value<bool>? isNews,
    Value<bool>? isKids,
  }) {
    return EpgProgramsCompanion(
      id: id ?? this.id,
      channelTvgId: channelTvgId ?? this.channelTvgId,
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      episodeTitle: episodeTitle ?? this.episodeTitle,
      isMovie: isMovie ?? this.isMovie,
      isSeries: isSeries ?? this.isSeries,
      isSports: isSports ?? this.isSports,
      isNews: isNews ?? this.isNews,
      isKids: isKids ?? this.isKids,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (channelTvgId.present) {
      map['channel_tvg_id'] = Variable<String>(channelTvgId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (episodeTitle.present) {
      map['episode_title'] = Variable<String>(episodeTitle.value);
    }
    if (isMovie.present) {
      map['is_movie'] = Variable<bool>(isMovie.value);
    }
    if (isSeries.present) {
      map['is_series'] = Variable<bool>(isSeries.value);
    }
    if (isSports.present) {
      map['is_sports'] = Variable<bool>(isSports.value);
    }
    if (isNews.present) {
      map['is_news'] = Variable<bool>(isNews.value);
    }
    if (isKids.present) {
      map['is_kids'] = Variable<bool>(isKids.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EpgProgramsCompanion(')
          ..write('id: $id, ')
          ..write('channelTvgId: $channelTvgId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('category: $category, ')
          ..write('icon: $icon, ')
          ..write('episodeTitle: $episodeTitle, ')
          ..write('isMovie: $isMovie, ')
          ..write('isSeries: $isSeries, ')
          ..write('isSports: $isSports, ')
          ..write('isNews: $isNews, ')
          ..write('isKids: $isKids')
          ..write(')'))
        .toString();
  }
}

class $EpgSourcesTable extends EpgSources
    with TableInfo<$EpgSourcesTable, EpgSource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EpgSourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlists (id)',
    ),
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastFetchedMeta = const VerificationMeta(
    'lastFetched',
  );
  @override
  late final GeneratedColumn<DateTime> lastFetched = GeneratedColumn<DateTime>(
    'last_fetched',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, playlistId, url, lastFetched];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'epg_sources';
  @override
  VerificationContext validateIntegrity(
    Insertable<EpgSource> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('last_fetched')) {
      context.handle(
        _lastFetchedMeta,
        lastFetched.isAcceptableOrUnknown(
          data['last_fetched']!,
          _lastFetchedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {playlistId},
  ];
  @override
  EpgSource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EpgSource(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      lastFetched: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_fetched'],
      ),
    );
  }

  @override
  $EpgSourcesTable createAlias(String alias) {
    return $EpgSourcesTable(attachedDatabase, alias);
  }
}

class EpgSource extends DataClass implements Insertable<EpgSource> {
  final int id;
  final int playlistId;
  final String url;
  final DateTime? lastFetched;
  const EpgSource({
    required this.id,
    required this.playlistId,
    required this.url,
    this.lastFetched,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<int>(playlistId);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || lastFetched != null) {
      map['last_fetched'] = Variable<DateTime>(lastFetched);
    }
    return map;
  }

  EpgSourcesCompanion toCompanion(bool nullToAbsent) {
    return EpgSourcesCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      url: Value(url),
      lastFetched: lastFetched == null && nullToAbsent
          ? const Value.absent()
          : Value(lastFetched),
    );
  }

  factory EpgSource.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EpgSource(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      url: serializer.fromJson<String>(json['url']),
      lastFetched: serializer.fromJson<DateTime?>(json['lastFetched']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int>(playlistId),
      'url': serializer.toJson<String>(url),
      'lastFetched': serializer.toJson<DateTime?>(lastFetched),
    };
  }

  EpgSource copyWith({
    int? id,
    int? playlistId,
    String? url,
    Value<DateTime?> lastFetched = const Value.absent(),
  }) => EpgSource(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    url: url ?? this.url,
    lastFetched: lastFetched.present ? lastFetched.value : this.lastFetched,
  );
  EpgSource copyWithCompanion(EpgSourcesCompanion data) {
    return EpgSource(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      url: data.url.present ? data.url.value : this.url,
      lastFetched: data.lastFetched.present
          ? data.lastFetched.value
          : this.lastFetched,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EpgSource(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('url: $url, ')
          ..write('lastFetched: $lastFetched')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playlistId, url, lastFetched);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EpgSource &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.url == this.url &&
          other.lastFetched == this.lastFetched);
}

class EpgSourcesCompanion extends UpdateCompanion<EpgSource> {
  final Value<int> id;
  final Value<int> playlistId;
  final Value<String> url;
  final Value<DateTime?> lastFetched;
  const EpgSourcesCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.url = const Value.absent(),
    this.lastFetched = const Value.absent(),
  });
  EpgSourcesCompanion.insert({
    this.id = const Value.absent(),
    required int playlistId,
    required String url,
    this.lastFetched = const Value.absent(),
  }) : playlistId = Value(playlistId),
       url = Value(url);
  static Insertable<EpgSource> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<String>? url,
    Expression<DateTime>? lastFetched,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (url != null) 'url': url,
      if (lastFetched != null) 'last_fetched': lastFetched,
    });
  }

  EpgSourcesCompanion copyWith({
    Value<int>? id,
    Value<int>? playlistId,
    Value<String>? url,
    Value<DateTime?>? lastFetched,
  }) {
    return EpgSourcesCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      url: url ?? this.url,
      lastFetched: lastFetched ?? this.lastFetched,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (lastFetched.present) {
      map['last_fetched'] = Variable<DateTime>(lastFetched.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EpgSourcesCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('url: $url, ')
          ..write('lastFetched: $lastFetched')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemKindMeta = const VerificationMeta(
    'itemKind',
  );
  @override
  late final GeneratedColumn<String> itemKind = GeneratedColumn<String>(
    'item_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
    'ref_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, profileId, itemKind, refId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favorite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('item_kind')) {
      context.handle(
        _itemKindMeta,
        itemKind.isAcceptableOrUnknown(data['item_kind']!, _itemKindMeta),
      );
    } else if (isInserting) {
      context.missing(_itemKindMeta);
    }
    if (data.containsKey('ref_id')) {
      context.handle(
        _refIdMeta,
        refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta),
      );
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {profileId, itemKind, refId},
  ];
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      itemKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_kind'],
      )!,
      refId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ref_id'],
      )!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int id;
  final String profileId;
  final String itemKind;
  final int refId;
  const Favorite({
    required this.id,
    required this.profileId,
    required this.itemKind,
    required this.refId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<String>(profileId);
    map['item_kind'] = Variable<String>(itemKind);
    map['ref_id'] = Variable<int>(refId);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      profileId: Value(profileId),
      itemKind: Value(itemKind),
      refId: Value(refId),
    );
  }

  factory Favorite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<String>(json['profileId']),
      itemKind: serializer.fromJson<String>(json['itemKind']),
      refId: serializer.fromJson<int>(json['refId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<String>(profileId),
      'itemKind': serializer.toJson<String>(itemKind),
      'refId': serializer.toJson<int>(refId),
    };
  }

  Favorite copyWith({
    int? id,
    String? profileId,
    String? itemKind,
    int? refId,
  }) => Favorite(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    itemKind: itemKind ?? this.itemKind,
    refId: refId ?? this.refId,
  );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      itemKind: data.itemKind.present ? data.itemKind.value : this.itemKind,
      refId: data.refId.present ? data.refId.value : this.refId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('itemKind: $itemKind, ')
          ..write('refId: $refId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, profileId, itemKind, refId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.itemKind == this.itemKind &&
          other.refId == this.refId);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<String> profileId;
  final Value<String> itemKind;
  final Value<int> refId;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.itemKind = const Value.absent(),
    this.refId = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required String profileId,
    required String itemKind,
    required int refId,
  }) : profileId = Value(profileId),
       itemKind = Value(itemKind),
       refId = Value(refId);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<String>? profileId,
    Expression<String>? itemKind,
    Expression<int>? refId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (itemKind != null) 'item_kind': itemKind,
      if (refId != null) 'ref_id': refId,
    });
  }

  FavoritesCompanion copyWith({
    Value<int>? id,
    Value<String>? profileId,
    Value<String>? itemKind,
    Value<int>? refId,
  }) {
    return FavoritesCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      itemKind: itemKind ?? this.itemKind,
      refId: refId ?? this.refId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (itemKind.present) {
      map['item_kind'] = Variable<String>(itemKind.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('itemKind: $itemKind, ')
          ..write('refId: $refId')
          ..write(')'))
        .toString();
  }
}

class $WatchHistoryTable extends WatchHistory
    with TableInfo<$WatchHistoryTable, WatchHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WatchHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentTypeMeta = const VerificationMeta(
    'contentType',
  );
  @override
  late final GeneratedColumn<String> contentType = GeneratedColumn<String>(
    'content_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('channel'),
  );
  static const VerificationMeta _channelIdMeta = const VerificationMeta(
    'channelId',
  );
  @override
  late final GeneratedColumn<int> channelId = GeneratedColumn<int>(
    'channel_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES channels (id)',
    ),
  );
  static const VerificationMeta _vodItemIdMeta = const VerificationMeta(
    'vodItemId',
  );
  @override
  late final GeneratedColumn<int> vodItemId = GeneratedColumn<int>(
    'vod_item_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _episodeIdMeta = const VerificationMeta(
    'episodeId',
  );
  @override
  late final GeneratedColumn<int> episodeId = GeneratedColumn<int>(
    'episode_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _positionMsMeta = const VerificationMeta(
    'positionMs',
  );
  @override
  late final GeneratedColumn<int> positionMs = GeneratedColumn<int>(
    'position_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _durationMsMeta = const VerificationMeta(
    'durationMs',
  );
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
    'duration_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _playedMeta = const VerificationMeta('played');
  @override
  late final GeneratedColumn<bool> played = GeneratedColumn<bool>(
    'played',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("played" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _watchedAtMeta = const VerificationMeta(
    'watchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> watchedAt = GeneratedColumn<DateTime>(
    'watched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    contentType,
    channelId,
    vodItemId,
    episodeId,
    positionMs,
    durationMs,
    played,
    watchedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'watch_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<WatchHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('content_type')) {
      context.handle(
        _contentTypeMeta,
        contentType.isAcceptableOrUnknown(
          data['content_type']!,
          _contentTypeMeta,
        ),
      );
    }
    if (data.containsKey('channel_id')) {
      context.handle(
        _channelIdMeta,
        channelId.isAcceptableOrUnknown(data['channel_id']!, _channelIdMeta),
      );
    }
    if (data.containsKey('vod_item_id')) {
      context.handle(
        _vodItemIdMeta,
        vodItemId.isAcceptableOrUnknown(data['vod_item_id']!, _vodItemIdMeta),
      );
    }
    if (data.containsKey('episode_id')) {
      context.handle(
        _episodeIdMeta,
        episodeId.isAcceptableOrUnknown(data['episode_id']!, _episodeIdMeta),
      );
    }
    if (data.containsKey('position_ms')) {
      context.handle(
        _positionMsMeta,
        positionMs.isAcceptableOrUnknown(data['position_ms']!, _positionMsMeta),
      );
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
        _durationMsMeta,
        durationMs.isAcceptableOrUnknown(data['duration_ms']!, _durationMsMeta),
      );
    }
    if (data.containsKey('played')) {
      context.handle(
        _playedMeta,
        played.isAcceptableOrUnknown(data['played']!, _playedMeta),
      );
    }
    if (data.containsKey('watched_at')) {
      context.handle(
        _watchedAtMeta,
        watchedAt.isAcceptableOrUnknown(data['watched_at']!, _watchedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WatchHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WatchHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      contentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_type'],
      )!,
      channelId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}channel_id'],
      ),
      vodItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vod_item_id'],
      ),
      episodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode_id'],
      ),
      positionMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position_ms'],
      )!,
      durationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_ms'],
      ),
      played: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}played'],
      )!,
      watchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}watched_at'],
      )!,
    );
  }

  @override
  $WatchHistoryTable createAlias(String alias) {
    return $WatchHistoryTable(attachedDatabase, alias);
  }
}

class WatchHistoryData extends DataClass
    implements Insertable<WatchHistoryData> {
  final int id;
  final String profileId;
  final String contentType;
  final int? channelId;
  final int? vodItemId;
  final int? episodeId;
  final int positionMs;
  final int? durationMs;
  final bool played;
  final DateTime watchedAt;
  const WatchHistoryData({
    required this.id,
    required this.profileId,
    required this.contentType,
    this.channelId,
    this.vodItemId,
    this.episodeId,
    required this.positionMs,
    this.durationMs,
    required this.played,
    required this.watchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<String>(profileId);
    map['content_type'] = Variable<String>(contentType);
    if (!nullToAbsent || channelId != null) {
      map['channel_id'] = Variable<int>(channelId);
    }
    if (!nullToAbsent || vodItemId != null) {
      map['vod_item_id'] = Variable<int>(vodItemId);
    }
    if (!nullToAbsent || episodeId != null) {
      map['episode_id'] = Variable<int>(episodeId);
    }
    map['position_ms'] = Variable<int>(positionMs);
    if (!nullToAbsent || durationMs != null) {
      map['duration_ms'] = Variable<int>(durationMs);
    }
    map['played'] = Variable<bool>(played);
    map['watched_at'] = Variable<DateTime>(watchedAt);
    return map;
  }

  WatchHistoryCompanion toCompanion(bool nullToAbsent) {
    return WatchHistoryCompanion(
      id: Value(id),
      profileId: Value(profileId),
      contentType: Value(contentType),
      channelId: channelId == null && nullToAbsent
          ? const Value.absent()
          : Value(channelId),
      vodItemId: vodItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(vodItemId),
      episodeId: episodeId == null && nullToAbsent
          ? const Value.absent()
          : Value(episodeId),
      positionMs: Value(positionMs),
      durationMs: durationMs == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMs),
      played: Value(played),
      watchedAt: Value(watchedAt),
    );
  }

  factory WatchHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WatchHistoryData(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<String>(json['profileId']),
      contentType: serializer.fromJson<String>(json['contentType']),
      channelId: serializer.fromJson<int?>(json['channelId']),
      vodItemId: serializer.fromJson<int?>(json['vodItemId']),
      episodeId: serializer.fromJson<int?>(json['episodeId']),
      positionMs: serializer.fromJson<int>(json['positionMs']),
      durationMs: serializer.fromJson<int?>(json['durationMs']),
      played: serializer.fromJson<bool>(json['played']),
      watchedAt: serializer.fromJson<DateTime>(json['watchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<String>(profileId),
      'contentType': serializer.toJson<String>(contentType),
      'channelId': serializer.toJson<int?>(channelId),
      'vodItemId': serializer.toJson<int?>(vodItemId),
      'episodeId': serializer.toJson<int?>(episodeId),
      'positionMs': serializer.toJson<int>(positionMs),
      'durationMs': serializer.toJson<int?>(durationMs),
      'played': serializer.toJson<bool>(played),
      'watchedAt': serializer.toJson<DateTime>(watchedAt),
    };
  }

  WatchHistoryData copyWith({
    int? id,
    String? profileId,
    String? contentType,
    Value<int?> channelId = const Value.absent(),
    Value<int?> vodItemId = const Value.absent(),
    Value<int?> episodeId = const Value.absent(),
    int? positionMs,
    Value<int?> durationMs = const Value.absent(),
    bool? played,
    DateTime? watchedAt,
  }) => WatchHistoryData(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    contentType: contentType ?? this.contentType,
    channelId: channelId.present ? channelId.value : this.channelId,
    vodItemId: vodItemId.present ? vodItemId.value : this.vodItemId,
    episodeId: episodeId.present ? episodeId.value : this.episodeId,
    positionMs: positionMs ?? this.positionMs,
    durationMs: durationMs.present ? durationMs.value : this.durationMs,
    played: played ?? this.played,
    watchedAt: watchedAt ?? this.watchedAt,
  );
  WatchHistoryData copyWithCompanion(WatchHistoryCompanion data) {
    return WatchHistoryData(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      contentType: data.contentType.present
          ? data.contentType.value
          : this.contentType,
      channelId: data.channelId.present ? data.channelId.value : this.channelId,
      vodItemId: data.vodItemId.present ? data.vodItemId.value : this.vodItemId,
      episodeId: data.episodeId.present ? data.episodeId.value : this.episodeId,
      positionMs: data.positionMs.present
          ? data.positionMs.value
          : this.positionMs,
      durationMs: data.durationMs.present
          ? data.durationMs.value
          : this.durationMs,
      played: data.played.present ? data.played.value : this.played,
      watchedAt: data.watchedAt.present ? data.watchedAt.value : this.watchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WatchHistoryData(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('contentType: $contentType, ')
          ..write('channelId: $channelId, ')
          ..write('vodItemId: $vodItemId, ')
          ..write('episodeId: $episodeId, ')
          ..write('positionMs: $positionMs, ')
          ..write('durationMs: $durationMs, ')
          ..write('played: $played, ')
          ..write('watchedAt: $watchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    contentType,
    channelId,
    vodItemId,
    episodeId,
    positionMs,
    durationMs,
    played,
    watchedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WatchHistoryData &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.contentType == this.contentType &&
          other.channelId == this.channelId &&
          other.vodItemId == this.vodItemId &&
          other.episodeId == this.episodeId &&
          other.positionMs == this.positionMs &&
          other.durationMs == this.durationMs &&
          other.played == this.played &&
          other.watchedAt == this.watchedAt);
}

class WatchHistoryCompanion extends UpdateCompanion<WatchHistoryData> {
  final Value<int> id;
  final Value<String> profileId;
  final Value<String> contentType;
  final Value<int?> channelId;
  final Value<int?> vodItemId;
  final Value<int?> episodeId;
  final Value<int> positionMs;
  final Value<int?> durationMs;
  final Value<bool> played;
  final Value<DateTime> watchedAt;
  const WatchHistoryCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.contentType = const Value.absent(),
    this.channelId = const Value.absent(),
    this.vodItemId = const Value.absent(),
    this.episodeId = const Value.absent(),
    this.positionMs = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.played = const Value.absent(),
    this.watchedAt = const Value.absent(),
  });
  WatchHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String profileId,
    this.contentType = const Value.absent(),
    this.channelId = const Value.absent(),
    this.vodItemId = const Value.absent(),
    this.episodeId = const Value.absent(),
    this.positionMs = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.played = const Value.absent(),
    this.watchedAt = const Value.absent(),
  }) : profileId = Value(profileId);
  static Insertable<WatchHistoryData> custom({
    Expression<int>? id,
    Expression<String>? profileId,
    Expression<String>? contentType,
    Expression<int>? channelId,
    Expression<int>? vodItemId,
    Expression<int>? episodeId,
    Expression<int>? positionMs,
    Expression<int>? durationMs,
    Expression<bool>? played,
    Expression<DateTime>? watchedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (contentType != null) 'content_type': contentType,
      if (channelId != null) 'channel_id': channelId,
      if (vodItemId != null) 'vod_item_id': vodItemId,
      if (episodeId != null) 'episode_id': episodeId,
      if (positionMs != null) 'position_ms': positionMs,
      if (durationMs != null) 'duration_ms': durationMs,
      if (played != null) 'played': played,
      if (watchedAt != null) 'watched_at': watchedAt,
    });
  }

  WatchHistoryCompanion copyWith({
    Value<int>? id,
    Value<String>? profileId,
    Value<String>? contentType,
    Value<int?>? channelId,
    Value<int?>? vodItemId,
    Value<int?>? episodeId,
    Value<int>? positionMs,
    Value<int?>? durationMs,
    Value<bool>? played,
    Value<DateTime>? watchedAt,
  }) {
    return WatchHistoryCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      contentType: contentType ?? this.contentType,
      channelId: channelId ?? this.channelId,
      vodItemId: vodItemId ?? this.vodItemId,
      episodeId: episodeId ?? this.episodeId,
      positionMs: positionMs ?? this.positionMs,
      durationMs: durationMs ?? this.durationMs,
      played: played ?? this.played,
      watchedAt: watchedAt ?? this.watchedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<String>(contentType.value);
    }
    if (channelId.present) {
      map['channel_id'] = Variable<int>(channelId.value);
    }
    if (vodItemId.present) {
      map['vod_item_id'] = Variable<int>(vodItemId.value);
    }
    if (episodeId.present) {
      map['episode_id'] = Variable<int>(episodeId.value);
    }
    if (positionMs.present) {
      map['position_ms'] = Variable<int>(positionMs.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    if (played.present) {
      map['played'] = Variable<bool>(played.value);
    }
    if (watchedAt.present) {
      map['watched_at'] = Variable<DateTime>(watchedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WatchHistoryCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('contentType: $contentType, ')
          ..write('channelId: $channelId, ')
          ..write('vodItemId: $vodItemId, ')
          ..write('episodeId: $episodeId, ')
          ..write('positionMs: $positionMs, ')
          ..write('durationMs: $durationMs, ')
          ..write('played: $played, ')
          ..write('watchedAt: $watchedAt')
          ..write(')'))
        .toString();
  }
}

class $EnabledGroupsTable extends EnabledGroups
    with TableInfo<$EnabledGroupsTable, EnabledGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnabledGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _groupIdMeta = const VerificationMeta(
    'groupId',
  );
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
    'group_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, profileId, groupId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'enabled_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<EnabledGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(
        _groupIdMeta,
        groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta),
      );
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {profileId, groupId},
  ];
  @override
  EnabledGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EnabledGroup(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      groupId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}group_id'],
      )!,
    );
  }

  @override
  $EnabledGroupsTable createAlias(String alias) {
    return $EnabledGroupsTable(attachedDatabase, alias);
  }
}

class EnabledGroup extends DataClass implements Insertable<EnabledGroup> {
  final int id;
  final String profileId;
  final int groupId;
  const EnabledGroup({
    required this.id,
    required this.profileId,
    required this.groupId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<String>(profileId);
    map['group_id'] = Variable<int>(groupId);
    return map;
  }

  EnabledGroupsCompanion toCompanion(bool nullToAbsent) {
    return EnabledGroupsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      groupId: Value(groupId),
    );
  }

  factory EnabledGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EnabledGroup(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<String>(json['profileId']),
      groupId: serializer.fromJson<int>(json['groupId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<String>(profileId),
      'groupId': serializer.toJson<int>(groupId),
    };
  }

  EnabledGroup copyWith({int? id, String? profileId, int? groupId}) =>
      EnabledGroup(
        id: id ?? this.id,
        profileId: profileId ?? this.profileId,
        groupId: groupId ?? this.groupId,
      );
  EnabledGroup copyWithCompanion(EnabledGroupsCompanion data) {
    return EnabledGroup(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EnabledGroup(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('groupId: $groupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, profileId, groupId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EnabledGroup &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.groupId == this.groupId);
}

class EnabledGroupsCompanion extends UpdateCompanion<EnabledGroup> {
  final Value<int> id;
  final Value<String> profileId;
  final Value<int> groupId;
  const EnabledGroupsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.groupId = const Value.absent(),
  });
  EnabledGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String profileId,
    required int groupId,
  }) : profileId = Value(profileId),
       groupId = Value(groupId);
  static Insertable<EnabledGroup> custom({
    Expression<int>? id,
    Expression<String>? profileId,
    Expression<int>? groupId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (groupId != null) 'group_id': groupId,
    });
  }

  EnabledGroupsCompanion copyWith({
    Value<int>? id,
    Value<String>? profileId,
    Value<int>? groupId,
  }) {
    return EnabledGroupsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      groupId: groupId ?? this.groupId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnabledGroupsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('groupId: $groupId')
          ..write(')'))
        .toString();
  }
}

class $VodItemsTable extends VodItems with TableInfo<$VodItemsTable, VodItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VodItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlists (id)',
    ),
  );
  static const VerificationMeta _streamIdMeta = const VerificationMeta(
    'streamId',
  );
  @override
  late final GeneratedColumn<int> streamId = GeneratedColumn<int>(
    'stream_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _streamIconMeta = const VerificationMeta(
    'streamIcon',
  );
  @override
  late final GeneratedColumn<String> streamIcon = GeneratedColumn<String>(
    'stream_icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _containerExtensionMeta =
      const VerificationMeta('containerExtension');
  @override
  late final GeneratedColumn<String> containerExtension =
      GeneratedColumn<String>(
        'container_extension',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _plotMeta = const VerificationMeta('plot');
  @override
  late final GeneratedColumn<String> plot = GeneratedColumn<String>(
    'plot',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<String> genre = GeneratedColumn<String>(
    'genre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _backdropUrlMeta = const VerificationMeta(
    'backdropUrl',
  );
  @override
  late final GeneratedColumn<String> backdropUrl = GeneratedColumn<String>(
    'backdrop_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoUrlMeta = const VerificationMeta(
    'logoUrl',
  );
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
    'logo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taglineMeta = const VerificationMeta(
    'tagline',
  );
  @override
  late final GeneratedColumn<String> tagline = GeneratedColumn<String>(
    'tagline',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tmdbIdMeta = const VerificationMeta('tmdbId');
  @override
  late final GeneratedColumn<int> tmdbId = GeneratedColumn<int>(
    'tmdb_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSeriesMeta = const VerificationMeta(
    'isSeries',
  );
  @override
  late final GeneratedColumn<bool> isSeries = GeneratedColumn<bool>(
    'is_series',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_series" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playlistId,
    streamId,
    name,
    streamIcon,
    containerExtension,
    plot,
    genre,
    year,
    rating,
    durationSeconds,
    backdropUrl,
    logoUrl,
    tagline,
    tmdbId,
    isSeries,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vod_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<VodItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('stream_id')) {
      context.handle(
        _streamIdMeta,
        streamId.isAcceptableOrUnknown(data['stream_id']!, _streamIdMeta),
      );
    } else if (isInserting) {
      context.missing(_streamIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('stream_icon')) {
      context.handle(
        _streamIconMeta,
        streamIcon.isAcceptableOrUnknown(data['stream_icon']!, _streamIconMeta),
      );
    }
    if (data.containsKey('container_extension')) {
      context.handle(
        _containerExtensionMeta,
        containerExtension.isAcceptableOrUnknown(
          data['container_extension']!,
          _containerExtensionMeta,
        ),
      );
    }
    if (data.containsKey('plot')) {
      context.handle(
        _plotMeta,
        plot.isAcceptableOrUnknown(data['plot']!, _plotMeta),
      );
    }
    if (data.containsKey('genre')) {
      context.handle(
        _genreMeta,
        genre.isAcceptableOrUnknown(data['genre']!, _genreMeta),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('backdrop_url')) {
      context.handle(
        _backdropUrlMeta,
        backdropUrl.isAcceptableOrUnknown(
          data['backdrop_url']!,
          _backdropUrlMeta,
        ),
      );
    }
    if (data.containsKey('logo_url')) {
      context.handle(
        _logoUrlMeta,
        logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta),
      );
    }
    if (data.containsKey('tagline')) {
      context.handle(
        _taglineMeta,
        tagline.isAcceptableOrUnknown(data['tagline']!, _taglineMeta),
      );
    }
    if (data.containsKey('tmdb_id')) {
      context.handle(
        _tmdbIdMeta,
        tmdbId.isAcceptableOrUnknown(data['tmdb_id']!, _tmdbIdMeta),
      );
    }
    if (data.containsKey('is_series')) {
      context.handle(
        _isSeriesMeta,
        isSeries.isAcceptableOrUnknown(data['is_series']!, _isSeriesMeta),
      );
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VodItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VodItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      streamId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stream_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      streamIcon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stream_icon'],
      ),
      containerExtension: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}container_extension'],
      ),
      plot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plot'],
      ),
      genre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}genre'],
      ),
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      ),
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      ),
      backdropUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backdrop_url'],
      ),
      logoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_url'],
      ),
      tagline: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagline'],
      ),
      tmdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tmdb_id'],
      ),
      isSeries: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_series'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $VodItemsTable createAlias(String alias) {
    return $VodItemsTable(attachedDatabase, alias);
  }
}

class VodItem extends DataClass implements Insertable<VodItem> {
  final int id;
  final int playlistId;
  final int streamId;
  final String name;
  final String? streamIcon;
  final String? containerExtension;
  final String? plot;
  final String? genre;
  final int? year;
  final double? rating;
  final int? durationSeconds;
  final String? backdropUrl;
  final String? logoUrl;
  final String? tagline;
  final int? tmdbId;
  final bool isSeries;
  final DateTime addedAt;
  const VodItem({
    required this.id,
    required this.playlistId,
    required this.streamId,
    required this.name,
    this.streamIcon,
    this.containerExtension,
    this.plot,
    this.genre,
    this.year,
    this.rating,
    this.durationSeconds,
    this.backdropUrl,
    this.logoUrl,
    this.tagline,
    this.tmdbId,
    required this.isSeries,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<int>(playlistId);
    map['stream_id'] = Variable<int>(streamId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || streamIcon != null) {
      map['stream_icon'] = Variable<String>(streamIcon);
    }
    if (!nullToAbsent || containerExtension != null) {
      map['container_extension'] = Variable<String>(containerExtension);
    }
    if (!nullToAbsent || plot != null) {
      map['plot'] = Variable<String>(plot);
    }
    if (!nullToAbsent || genre != null) {
      map['genre'] = Variable<String>(genre);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || backdropUrl != null) {
      map['backdrop_url'] = Variable<String>(backdropUrl);
    }
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    if (!nullToAbsent || tagline != null) {
      map['tagline'] = Variable<String>(tagline);
    }
    if (!nullToAbsent || tmdbId != null) {
      map['tmdb_id'] = Variable<int>(tmdbId);
    }
    map['is_series'] = Variable<bool>(isSeries);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  VodItemsCompanion toCompanion(bool nullToAbsent) {
    return VodItemsCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      streamId: Value(streamId),
      name: Value(name),
      streamIcon: streamIcon == null && nullToAbsent
          ? const Value.absent()
          : Value(streamIcon),
      containerExtension: containerExtension == null && nullToAbsent
          ? const Value.absent()
          : Value(containerExtension),
      plot: plot == null && nullToAbsent ? const Value.absent() : Value(plot),
      genre: genre == null && nullToAbsent
          ? const Value.absent()
          : Value(genre),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      rating: rating == null && nullToAbsent
          ? const Value.absent()
          : Value(rating),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      backdropUrl: backdropUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropUrl),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
      tagline: tagline == null && nullToAbsent
          ? const Value.absent()
          : Value(tagline),
      tmdbId: tmdbId == null && nullToAbsent
          ? const Value.absent()
          : Value(tmdbId),
      isSeries: Value(isSeries),
      addedAt: Value(addedAt),
    );
  }

  factory VodItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VodItem(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      streamId: serializer.fromJson<int>(json['streamId']),
      name: serializer.fromJson<String>(json['name']),
      streamIcon: serializer.fromJson<String?>(json['streamIcon']),
      containerExtension: serializer.fromJson<String?>(
        json['containerExtension'],
      ),
      plot: serializer.fromJson<String?>(json['plot']),
      genre: serializer.fromJson<String?>(json['genre']),
      year: serializer.fromJson<int?>(json['year']),
      rating: serializer.fromJson<double?>(json['rating']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      backdropUrl: serializer.fromJson<String?>(json['backdropUrl']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
      tagline: serializer.fromJson<String?>(json['tagline']),
      tmdbId: serializer.fromJson<int?>(json['tmdbId']),
      isSeries: serializer.fromJson<bool>(json['isSeries']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int>(playlistId),
      'streamId': serializer.toJson<int>(streamId),
      'name': serializer.toJson<String>(name),
      'streamIcon': serializer.toJson<String?>(streamIcon),
      'containerExtension': serializer.toJson<String?>(containerExtension),
      'plot': serializer.toJson<String?>(plot),
      'genre': serializer.toJson<String?>(genre),
      'year': serializer.toJson<int?>(year),
      'rating': serializer.toJson<double?>(rating),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'backdropUrl': serializer.toJson<String?>(backdropUrl),
      'logoUrl': serializer.toJson<String?>(logoUrl),
      'tagline': serializer.toJson<String?>(tagline),
      'tmdbId': serializer.toJson<int?>(tmdbId),
      'isSeries': serializer.toJson<bool>(isSeries),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  VodItem copyWith({
    int? id,
    int? playlistId,
    int? streamId,
    String? name,
    Value<String?> streamIcon = const Value.absent(),
    Value<String?> containerExtension = const Value.absent(),
    Value<String?> plot = const Value.absent(),
    Value<String?> genre = const Value.absent(),
    Value<int?> year = const Value.absent(),
    Value<double?> rating = const Value.absent(),
    Value<int?> durationSeconds = const Value.absent(),
    Value<String?> backdropUrl = const Value.absent(),
    Value<String?> logoUrl = const Value.absent(),
    Value<String?> tagline = const Value.absent(),
    Value<int?> tmdbId = const Value.absent(),
    bool? isSeries,
    DateTime? addedAt,
  }) => VodItem(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    streamId: streamId ?? this.streamId,
    name: name ?? this.name,
    streamIcon: streamIcon.present ? streamIcon.value : this.streamIcon,
    containerExtension: containerExtension.present
        ? containerExtension.value
        : this.containerExtension,
    plot: plot.present ? plot.value : this.plot,
    genre: genre.present ? genre.value : this.genre,
    year: year.present ? year.value : this.year,
    rating: rating.present ? rating.value : this.rating,
    durationSeconds: durationSeconds.present
        ? durationSeconds.value
        : this.durationSeconds,
    backdropUrl: backdropUrl.present ? backdropUrl.value : this.backdropUrl,
    logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
    tagline: tagline.present ? tagline.value : this.tagline,
    tmdbId: tmdbId.present ? tmdbId.value : this.tmdbId,
    isSeries: isSeries ?? this.isSeries,
    addedAt: addedAt ?? this.addedAt,
  );
  VodItem copyWithCompanion(VodItemsCompanion data) {
    return VodItem(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      streamId: data.streamId.present ? data.streamId.value : this.streamId,
      name: data.name.present ? data.name.value : this.name,
      streamIcon: data.streamIcon.present
          ? data.streamIcon.value
          : this.streamIcon,
      containerExtension: data.containerExtension.present
          ? data.containerExtension.value
          : this.containerExtension,
      plot: data.plot.present ? data.plot.value : this.plot,
      genre: data.genre.present ? data.genre.value : this.genre,
      year: data.year.present ? data.year.value : this.year,
      rating: data.rating.present ? data.rating.value : this.rating,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      backdropUrl: data.backdropUrl.present
          ? data.backdropUrl.value
          : this.backdropUrl,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
      tagline: data.tagline.present ? data.tagline.value : this.tagline,
      tmdbId: data.tmdbId.present ? data.tmdbId.value : this.tmdbId,
      isSeries: data.isSeries.present ? data.isSeries.value : this.isSeries,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VodItem(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('streamId: $streamId, ')
          ..write('name: $name, ')
          ..write('streamIcon: $streamIcon, ')
          ..write('containerExtension: $containerExtension, ')
          ..write('plot: $plot, ')
          ..write('genre: $genre, ')
          ..write('year: $year, ')
          ..write('rating: $rating, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('backdropUrl: $backdropUrl, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('tagline: $tagline, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('isSeries: $isSeries, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playlistId,
    streamId,
    name,
    streamIcon,
    containerExtension,
    plot,
    genre,
    year,
    rating,
    durationSeconds,
    backdropUrl,
    logoUrl,
    tagline,
    tmdbId,
    isSeries,
    addedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VodItem &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.streamId == this.streamId &&
          other.name == this.name &&
          other.streamIcon == this.streamIcon &&
          other.containerExtension == this.containerExtension &&
          other.plot == this.plot &&
          other.genre == this.genre &&
          other.year == this.year &&
          other.rating == this.rating &&
          other.durationSeconds == this.durationSeconds &&
          other.backdropUrl == this.backdropUrl &&
          other.logoUrl == this.logoUrl &&
          other.tagline == this.tagline &&
          other.tmdbId == this.tmdbId &&
          other.isSeries == this.isSeries &&
          other.addedAt == this.addedAt);
}

class VodItemsCompanion extends UpdateCompanion<VodItem> {
  final Value<int> id;
  final Value<int> playlistId;
  final Value<int> streamId;
  final Value<String> name;
  final Value<String?> streamIcon;
  final Value<String?> containerExtension;
  final Value<String?> plot;
  final Value<String?> genre;
  final Value<int?> year;
  final Value<double?> rating;
  final Value<int?> durationSeconds;
  final Value<String?> backdropUrl;
  final Value<String?> logoUrl;
  final Value<String?> tagline;
  final Value<int?> tmdbId;
  final Value<bool> isSeries;
  final Value<DateTime> addedAt;
  const VodItemsCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.streamId = const Value.absent(),
    this.name = const Value.absent(),
    this.streamIcon = const Value.absent(),
    this.containerExtension = const Value.absent(),
    this.plot = const Value.absent(),
    this.genre = const Value.absent(),
    this.year = const Value.absent(),
    this.rating = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.backdropUrl = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.tagline = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.isSeries = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  VodItemsCompanion.insert({
    this.id = const Value.absent(),
    required int playlistId,
    required int streamId,
    required String name,
    this.streamIcon = const Value.absent(),
    this.containerExtension = const Value.absent(),
    this.plot = const Value.absent(),
    this.genre = const Value.absent(),
    this.year = const Value.absent(),
    this.rating = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.backdropUrl = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.tagline = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.isSeries = const Value.absent(),
    this.addedAt = const Value.absent(),
  }) : playlistId = Value(playlistId),
       streamId = Value(streamId),
       name = Value(name);
  static Insertable<VodItem> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<int>? streamId,
    Expression<String>? name,
    Expression<String>? streamIcon,
    Expression<String>? containerExtension,
    Expression<String>? plot,
    Expression<String>? genre,
    Expression<int>? year,
    Expression<double>? rating,
    Expression<int>? durationSeconds,
    Expression<String>? backdropUrl,
    Expression<String>? logoUrl,
    Expression<String>? tagline,
    Expression<int>? tmdbId,
    Expression<bool>? isSeries,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (streamId != null) 'stream_id': streamId,
      if (name != null) 'name': name,
      if (streamIcon != null) 'stream_icon': streamIcon,
      if (containerExtension != null) 'container_extension': containerExtension,
      if (plot != null) 'plot': plot,
      if (genre != null) 'genre': genre,
      if (year != null) 'year': year,
      if (rating != null) 'rating': rating,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (backdropUrl != null) 'backdrop_url': backdropUrl,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (tagline != null) 'tagline': tagline,
      if (tmdbId != null) 'tmdb_id': tmdbId,
      if (isSeries != null) 'is_series': isSeries,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  VodItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? playlistId,
    Value<int>? streamId,
    Value<String>? name,
    Value<String?>? streamIcon,
    Value<String?>? containerExtension,
    Value<String?>? plot,
    Value<String?>? genre,
    Value<int?>? year,
    Value<double?>? rating,
    Value<int?>? durationSeconds,
    Value<String?>? backdropUrl,
    Value<String?>? logoUrl,
    Value<String?>? tagline,
    Value<int?>? tmdbId,
    Value<bool>? isSeries,
    Value<DateTime>? addedAt,
  }) {
    return VodItemsCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      streamId: streamId ?? this.streamId,
      name: name ?? this.name,
      streamIcon: streamIcon ?? this.streamIcon,
      containerExtension: containerExtension ?? this.containerExtension,
      plot: plot ?? this.plot,
      genre: genre ?? this.genre,
      year: year ?? this.year,
      rating: rating ?? this.rating,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      backdropUrl: backdropUrl ?? this.backdropUrl,
      logoUrl: logoUrl ?? this.logoUrl,
      tagline: tagline ?? this.tagline,
      tmdbId: tmdbId ?? this.tmdbId,
      isSeries: isSeries ?? this.isSeries,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (streamId.present) {
      map['stream_id'] = Variable<int>(streamId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (streamIcon.present) {
      map['stream_icon'] = Variable<String>(streamIcon.value);
    }
    if (containerExtension.present) {
      map['container_extension'] = Variable<String>(containerExtension.value);
    }
    if (plot.present) {
      map['plot'] = Variable<String>(plot.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String>(genre.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (backdropUrl.present) {
      map['backdrop_url'] = Variable<String>(backdropUrl.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (tagline.present) {
      map['tagline'] = Variable<String>(tagline.value);
    }
    if (tmdbId.present) {
      map['tmdb_id'] = Variable<int>(tmdbId.value);
    }
    if (isSeries.present) {
      map['is_series'] = Variable<bool>(isSeries.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VodItemsCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('streamId: $streamId, ')
          ..write('name: $name, ')
          ..write('streamIcon: $streamIcon, ')
          ..write('containerExtension: $containerExtension, ')
          ..write('plot: $plot, ')
          ..write('genre: $genre, ')
          ..write('year: $year, ')
          ..write('rating: $rating, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('backdropUrl: $backdropUrl, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('tagline: $tagline, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('isSeries: $isSeries, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

class $SeriesSeasonsTable extends SeriesSeasons
    with TableInfo<$SeriesSeasonsTable, SeriesSeason> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesSeasonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlists (id)',
    ),
  );
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<int> seriesId = GeneratedColumn<int>(
    'series_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seasonNumberMeta = const VerificationMeta(
    'seasonNumber',
  );
  @override
  late final GeneratedColumn<int> seasonNumber = GeneratedColumn<int>(
    'season_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _coverUrlMeta = const VerificationMeta(
    'coverUrl',
  );
  @override
  late final GeneratedColumn<String> coverUrl = GeneratedColumn<String>(
    'cover_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _episodeCountMeta = const VerificationMeta(
    'episodeCount',
  );
  @override
  late final GeneratedColumn<int> episodeCount = GeneratedColumn<int>(
    'episode_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playlistId,
    seriesId,
    seasonNumber,
    coverUrl,
    episodeCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'series_seasons';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeriesSeason> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_seriesIdMeta);
    }
    if (data.containsKey('season_number')) {
      context.handle(
        _seasonNumberMeta,
        seasonNumber.isAcceptableOrUnknown(
          data['season_number']!,
          _seasonNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_seasonNumberMeta);
    }
    if (data.containsKey('cover_url')) {
      context.handle(
        _coverUrlMeta,
        coverUrl.isAcceptableOrUnknown(data['cover_url']!, _coverUrlMeta),
      );
    }
    if (data.containsKey('episode_count')) {
      context.handle(
        _episodeCountMeta,
        episodeCount.isAcceptableOrUnknown(
          data['episode_count']!,
          _episodeCountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {playlistId, seriesId, seasonNumber},
  ];
  @override
  SeriesSeason map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeriesSeason(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}series_id'],
      )!,
      seasonNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}season_number'],
      )!,
      coverUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_url'],
      ),
      episodeCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode_count'],
      ),
    );
  }

  @override
  $SeriesSeasonsTable createAlias(String alias) {
    return $SeriesSeasonsTable(attachedDatabase, alias);
  }
}

class SeriesSeason extends DataClass implements Insertable<SeriesSeason> {
  final int id;
  final int playlistId;
  final int seriesId;
  final int seasonNumber;
  final String? coverUrl;
  final int? episodeCount;
  const SeriesSeason({
    required this.id,
    required this.playlistId,
    required this.seriesId,
    required this.seasonNumber,
    this.coverUrl,
    this.episodeCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<int>(playlistId);
    map['series_id'] = Variable<int>(seriesId);
    map['season_number'] = Variable<int>(seasonNumber);
    if (!nullToAbsent || coverUrl != null) {
      map['cover_url'] = Variable<String>(coverUrl);
    }
    if (!nullToAbsent || episodeCount != null) {
      map['episode_count'] = Variable<int>(episodeCount);
    }
    return map;
  }

  SeriesSeasonsCompanion toCompanion(bool nullToAbsent) {
    return SeriesSeasonsCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      seriesId: Value(seriesId),
      seasonNumber: Value(seasonNumber),
      coverUrl: coverUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(coverUrl),
      episodeCount: episodeCount == null && nullToAbsent
          ? const Value.absent()
          : Value(episodeCount),
    );
  }

  factory SeriesSeason.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SeriesSeason(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      seriesId: serializer.fromJson<int>(json['seriesId']),
      seasonNumber: serializer.fromJson<int>(json['seasonNumber']),
      coverUrl: serializer.fromJson<String?>(json['coverUrl']),
      episodeCount: serializer.fromJson<int?>(json['episodeCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int>(playlistId),
      'seriesId': serializer.toJson<int>(seriesId),
      'seasonNumber': serializer.toJson<int>(seasonNumber),
      'coverUrl': serializer.toJson<String?>(coverUrl),
      'episodeCount': serializer.toJson<int?>(episodeCount),
    };
  }

  SeriesSeason copyWith({
    int? id,
    int? playlistId,
    int? seriesId,
    int? seasonNumber,
    Value<String?> coverUrl = const Value.absent(),
    Value<int?> episodeCount = const Value.absent(),
  }) => SeriesSeason(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    seriesId: seriesId ?? this.seriesId,
    seasonNumber: seasonNumber ?? this.seasonNumber,
    coverUrl: coverUrl.present ? coverUrl.value : this.coverUrl,
    episodeCount: episodeCount.present ? episodeCount.value : this.episodeCount,
  );
  SeriesSeason copyWithCompanion(SeriesSeasonsCompanion data) {
    return SeriesSeason(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      seasonNumber: data.seasonNumber.present
          ? data.seasonNumber.value
          : this.seasonNumber,
      coverUrl: data.coverUrl.present ? data.coverUrl.value : this.coverUrl,
      episodeCount: data.episodeCount.present
          ? data.episodeCount.value
          : this.episodeCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SeriesSeason(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('seriesId: $seriesId, ')
          ..write('seasonNumber: $seasonNumber, ')
          ..write('coverUrl: $coverUrl, ')
          ..write('episodeCount: $episodeCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playlistId,
    seriesId,
    seasonNumber,
    coverUrl,
    episodeCount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SeriesSeason &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.seriesId == this.seriesId &&
          other.seasonNumber == this.seasonNumber &&
          other.coverUrl == this.coverUrl &&
          other.episodeCount == this.episodeCount);
}

class SeriesSeasonsCompanion extends UpdateCompanion<SeriesSeason> {
  final Value<int> id;
  final Value<int> playlistId;
  final Value<int> seriesId;
  final Value<int> seasonNumber;
  final Value<String?> coverUrl;
  final Value<int?> episodeCount;
  const SeriesSeasonsCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.seasonNumber = const Value.absent(),
    this.coverUrl = const Value.absent(),
    this.episodeCount = const Value.absent(),
  });
  SeriesSeasonsCompanion.insert({
    this.id = const Value.absent(),
    required int playlistId,
    required int seriesId,
    required int seasonNumber,
    this.coverUrl = const Value.absent(),
    this.episodeCount = const Value.absent(),
  }) : playlistId = Value(playlistId),
       seriesId = Value(seriesId),
       seasonNumber = Value(seasonNumber);
  static Insertable<SeriesSeason> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<int>? seriesId,
    Expression<int>? seasonNumber,
    Expression<String>? coverUrl,
    Expression<int>? episodeCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (seriesId != null) 'series_id': seriesId,
      if (seasonNumber != null) 'season_number': seasonNumber,
      if (coverUrl != null) 'cover_url': coverUrl,
      if (episodeCount != null) 'episode_count': episodeCount,
    });
  }

  SeriesSeasonsCompanion copyWith({
    Value<int>? id,
    Value<int>? playlistId,
    Value<int>? seriesId,
    Value<int>? seasonNumber,
    Value<String?>? coverUrl,
    Value<int?>? episodeCount,
  }) {
    return SeriesSeasonsCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      seriesId: seriesId ?? this.seriesId,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      coverUrl: coverUrl ?? this.coverUrl,
      episodeCount: episodeCount ?? this.episodeCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<int>(seriesId.value);
    }
    if (seasonNumber.present) {
      map['season_number'] = Variable<int>(seasonNumber.value);
    }
    if (coverUrl.present) {
      map['cover_url'] = Variable<String>(coverUrl.value);
    }
    if (episodeCount.present) {
      map['episode_count'] = Variable<int>(episodeCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesSeasonsCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('seriesId: $seriesId, ')
          ..write('seasonNumber: $seasonNumber, ')
          ..write('coverUrl: $coverUrl, ')
          ..write('episodeCount: $episodeCount')
          ..write(')'))
        .toString();
  }
}

class $SeriesEpisodesTable extends SeriesEpisodes
    with TableInfo<$SeriesEpisodesTable, SeriesEpisode> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesEpisodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlists (id)',
    ),
  );
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<int> seriesId = GeneratedColumn<int>(
    'series_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _episodeIdMeta = const VerificationMeta(
    'episodeId',
  );
  @override
  late final GeneratedColumn<int> episodeId = GeneratedColumn<int>(
    'episode_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seasonNumberMeta = const VerificationMeta(
    'seasonNumber',
  );
  @override
  late final GeneratedColumn<int> seasonNumber = GeneratedColumn<int>(
    'season_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _episodeNumberMeta = const VerificationMeta(
    'episodeNumber',
  );
  @override
  late final GeneratedColumn<int> episodeNumber = GeneratedColumn<int>(
    'episode_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _plotMeta = const VerificationMeta('plot');
  @override
  late final GeneratedColumn<String> plot = GeneratedColumn<String>(
    'plot',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _containerExtensionMeta =
      const VerificationMeta('containerExtension');
  @override
  late final GeneratedColumn<String> containerExtension =
      GeneratedColumn<String>(
        'container_extension',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _stillUrlMeta = const VerificationMeta(
    'stillUrl',
  );
  @override
  late final GeneratedColumn<String> stillUrl = GeneratedColumn<String>(
    'still_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _airDateMeta = const VerificationMeta(
    'airDate',
  );
  @override
  late final GeneratedColumn<DateTime> airDate = GeneratedColumn<DateTime>(
    'air_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playlistId,
    seriesId,
    episodeId,
    seasonNumber,
    episodeNumber,
    title,
    plot,
    durationSeconds,
    containerExtension,
    stillUrl,
    rating,
    airDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'series_episodes';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeriesEpisode> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_seriesIdMeta);
    }
    if (data.containsKey('episode_id')) {
      context.handle(
        _episodeIdMeta,
        episodeId.isAcceptableOrUnknown(data['episode_id']!, _episodeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_episodeIdMeta);
    }
    if (data.containsKey('season_number')) {
      context.handle(
        _seasonNumberMeta,
        seasonNumber.isAcceptableOrUnknown(
          data['season_number']!,
          _seasonNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_seasonNumberMeta);
    }
    if (data.containsKey('episode_number')) {
      context.handle(
        _episodeNumberMeta,
        episodeNumber.isAcceptableOrUnknown(
          data['episode_number']!,
          _episodeNumberMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('plot')) {
      context.handle(
        _plotMeta,
        plot.isAcceptableOrUnknown(data['plot']!, _plotMeta),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('container_extension')) {
      context.handle(
        _containerExtensionMeta,
        containerExtension.isAcceptableOrUnknown(
          data['container_extension']!,
          _containerExtensionMeta,
        ),
      );
    }
    if (data.containsKey('still_url')) {
      context.handle(
        _stillUrlMeta,
        stillUrl.isAcceptableOrUnknown(data['still_url']!, _stillUrlMeta),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('air_date')) {
      context.handle(
        _airDateMeta,
        airDate.isAcceptableOrUnknown(data['air_date']!, _airDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {playlistId, episodeId},
  ];
  @override
  SeriesEpisode map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeriesEpisode(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}series_id'],
      )!,
      episodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode_id'],
      )!,
      seasonNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}season_number'],
      )!,
      episodeNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode_number'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      plot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plot'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      ),
      containerExtension: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}container_extension'],
      ),
      stillUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}still_url'],
      ),
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      ),
      airDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}air_date'],
      ),
    );
  }

  @override
  $SeriesEpisodesTable createAlias(String alias) {
    return $SeriesEpisodesTable(attachedDatabase, alias);
  }
}

class SeriesEpisode extends DataClass implements Insertable<SeriesEpisode> {
  final int id;
  final int playlistId;
  final int seriesId;
  final int episodeId;
  final int seasonNumber;
  final int? episodeNumber;
  final String title;
  final String? plot;
  final int? durationSeconds;
  final String? containerExtension;
  final String? stillUrl;
  final double? rating;
  final DateTime? airDate;
  const SeriesEpisode({
    required this.id,
    required this.playlistId,
    required this.seriesId,
    required this.episodeId,
    required this.seasonNumber,
    this.episodeNumber,
    required this.title,
    this.plot,
    this.durationSeconds,
    this.containerExtension,
    this.stillUrl,
    this.rating,
    this.airDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<int>(playlistId);
    map['series_id'] = Variable<int>(seriesId);
    map['episode_id'] = Variable<int>(episodeId);
    map['season_number'] = Variable<int>(seasonNumber);
    if (!nullToAbsent || episodeNumber != null) {
      map['episode_number'] = Variable<int>(episodeNumber);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || plot != null) {
      map['plot'] = Variable<String>(plot);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || containerExtension != null) {
      map['container_extension'] = Variable<String>(containerExtension);
    }
    if (!nullToAbsent || stillUrl != null) {
      map['still_url'] = Variable<String>(stillUrl);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    if (!nullToAbsent || airDate != null) {
      map['air_date'] = Variable<DateTime>(airDate);
    }
    return map;
  }

  SeriesEpisodesCompanion toCompanion(bool nullToAbsent) {
    return SeriesEpisodesCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      seriesId: Value(seriesId),
      episodeId: Value(episodeId),
      seasonNumber: Value(seasonNumber),
      episodeNumber: episodeNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(episodeNumber),
      title: Value(title),
      plot: plot == null && nullToAbsent ? const Value.absent() : Value(plot),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      containerExtension: containerExtension == null && nullToAbsent
          ? const Value.absent()
          : Value(containerExtension),
      stillUrl: stillUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(stillUrl),
      rating: rating == null && nullToAbsent
          ? const Value.absent()
          : Value(rating),
      airDate: airDate == null && nullToAbsent
          ? const Value.absent()
          : Value(airDate),
    );
  }

  factory SeriesEpisode.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SeriesEpisode(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      seriesId: serializer.fromJson<int>(json['seriesId']),
      episodeId: serializer.fromJson<int>(json['episodeId']),
      seasonNumber: serializer.fromJson<int>(json['seasonNumber']),
      episodeNumber: serializer.fromJson<int?>(json['episodeNumber']),
      title: serializer.fromJson<String>(json['title']),
      plot: serializer.fromJson<String?>(json['plot']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      containerExtension: serializer.fromJson<String?>(
        json['containerExtension'],
      ),
      stillUrl: serializer.fromJson<String?>(json['stillUrl']),
      rating: serializer.fromJson<double?>(json['rating']),
      airDate: serializer.fromJson<DateTime?>(json['airDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int>(playlistId),
      'seriesId': serializer.toJson<int>(seriesId),
      'episodeId': serializer.toJson<int>(episodeId),
      'seasonNumber': serializer.toJson<int>(seasonNumber),
      'episodeNumber': serializer.toJson<int?>(episodeNumber),
      'title': serializer.toJson<String>(title),
      'plot': serializer.toJson<String?>(plot),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'containerExtension': serializer.toJson<String?>(containerExtension),
      'stillUrl': serializer.toJson<String?>(stillUrl),
      'rating': serializer.toJson<double?>(rating),
      'airDate': serializer.toJson<DateTime?>(airDate),
    };
  }

  SeriesEpisode copyWith({
    int? id,
    int? playlistId,
    int? seriesId,
    int? episodeId,
    int? seasonNumber,
    Value<int?> episodeNumber = const Value.absent(),
    String? title,
    Value<String?> plot = const Value.absent(),
    Value<int?> durationSeconds = const Value.absent(),
    Value<String?> containerExtension = const Value.absent(),
    Value<String?> stillUrl = const Value.absent(),
    Value<double?> rating = const Value.absent(),
    Value<DateTime?> airDate = const Value.absent(),
  }) => SeriesEpisode(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    seriesId: seriesId ?? this.seriesId,
    episodeId: episodeId ?? this.episodeId,
    seasonNumber: seasonNumber ?? this.seasonNumber,
    episodeNumber: episodeNumber.present
        ? episodeNumber.value
        : this.episodeNumber,
    title: title ?? this.title,
    plot: plot.present ? plot.value : this.plot,
    durationSeconds: durationSeconds.present
        ? durationSeconds.value
        : this.durationSeconds,
    containerExtension: containerExtension.present
        ? containerExtension.value
        : this.containerExtension,
    stillUrl: stillUrl.present ? stillUrl.value : this.stillUrl,
    rating: rating.present ? rating.value : this.rating,
    airDate: airDate.present ? airDate.value : this.airDate,
  );
  SeriesEpisode copyWithCompanion(SeriesEpisodesCompanion data) {
    return SeriesEpisode(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      episodeId: data.episodeId.present ? data.episodeId.value : this.episodeId,
      seasonNumber: data.seasonNumber.present
          ? data.seasonNumber.value
          : this.seasonNumber,
      episodeNumber: data.episodeNumber.present
          ? data.episodeNumber.value
          : this.episodeNumber,
      title: data.title.present ? data.title.value : this.title,
      plot: data.plot.present ? data.plot.value : this.plot,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      containerExtension: data.containerExtension.present
          ? data.containerExtension.value
          : this.containerExtension,
      stillUrl: data.stillUrl.present ? data.stillUrl.value : this.stillUrl,
      rating: data.rating.present ? data.rating.value : this.rating,
      airDate: data.airDate.present ? data.airDate.value : this.airDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SeriesEpisode(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('seriesId: $seriesId, ')
          ..write('episodeId: $episodeId, ')
          ..write('seasonNumber: $seasonNumber, ')
          ..write('episodeNumber: $episodeNumber, ')
          ..write('title: $title, ')
          ..write('plot: $plot, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('containerExtension: $containerExtension, ')
          ..write('stillUrl: $stillUrl, ')
          ..write('rating: $rating, ')
          ..write('airDate: $airDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playlistId,
    seriesId,
    episodeId,
    seasonNumber,
    episodeNumber,
    title,
    plot,
    durationSeconds,
    containerExtension,
    stillUrl,
    rating,
    airDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SeriesEpisode &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.seriesId == this.seriesId &&
          other.episodeId == this.episodeId &&
          other.seasonNumber == this.seasonNumber &&
          other.episodeNumber == this.episodeNumber &&
          other.title == this.title &&
          other.plot == this.plot &&
          other.durationSeconds == this.durationSeconds &&
          other.containerExtension == this.containerExtension &&
          other.stillUrl == this.stillUrl &&
          other.rating == this.rating &&
          other.airDate == this.airDate);
}

class SeriesEpisodesCompanion extends UpdateCompanion<SeriesEpisode> {
  final Value<int> id;
  final Value<int> playlistId;
  final Value<int> seriesId;
  final Value<int> episodeId;
  final Value<int> seasonNumber;
  final Value<int?> episodeNumber;
  final Value<String> title;
  final Value<String?> plot;
  final Value<int?> durationSeconds;
  final Value<String?> containerExtension;
  final Value<String?> stillUrl;
  final Value<double?> rating;
  final Value<DateTime?> airDate;
  const SeriesEpisodesCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.episodeId = const Value.absent(),
    this.seasonNumber = const Value.absent(),
    this.episodeNumber = const Value.absent(),
    this.title = const Value.absent(),
    this.plot = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.containerExtension = const Value.absent(),
    this.stillUrl = const Value.absent(),
    this.rating = const Value.absent(),
    this.airDate = const Value.absent(),
  });
  SeriesEpisodesCompanion.insert({
    this.id = const Value.absent(),
    required int playlistId,
    required int seriesId,
    required int episodeId,
    required int seasonNumber,
    this.episodeNumber = const Value.absent(),
    required String title,
    this.plot = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.containerExtension = const Value.absent(),
    this.stillUrl = const Value.absent(),
    this.rating = const Value.absent(),
    this.airDate = const Value.absent(),
  }) : playlistId = Value(playlistId),
       seriesId = Value(seriesId),
       episodeId = Value(episodeId),
       seasonNumber = Value(seasonNumber),
       title = Value(title);
  static Insertable<SeriesEpisode> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<int>? seriesId,
    Expression<int>? episodeId,
    Expression<int>? seasonNumber,
    Expression<int>? episodeNumber,
    Expression<String>? title,
    Expression<String>? plot,
    Expression<int>? durationSeconds,
    Expression<String>? containerExtension,
    Expression<String>? stillUrl,
    Expression<double>? rating,
    Expression<DateTime>? airDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (seriesId != null) 'series_id': seriesId,
      if (episodeId != null) 'episode_id': episodeId,
      if (seasonNumber != null) 'season_number': seasonNumber,
      if (episodeNumber != null) 'episode_number': episodeNumber,
      if (title != null) 'title': title,
      if (plot != null) 'plot': plot,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (containerExtension != null) 'container_extension': containerExtension,
      if (stillUrl != null) 'still_url': stillUrl,
      if (rating != null) 'rating': rating,
      if (airDate != null) 'air_date': airDate,
    });
  }

  SeriesEpisodesCompanion copyWith({
    Value<int>? id,
    Value<int>? playlistId,
    Value<int>? seriesId,
    Value<int>? episodeId,
    Value<int>? seasonNumber,
    Value<int?>? episodeNumber,
    Value<String>? title,
    Value<String?>? plot,
    Value<int?>? durationSeconds,
    Value<String?>? containerExtension,
    Value<String?>? stillUrl,
    Value<double?>? rating,
    Value<DateTime?>? airDate,
  }) {
    return SeriesEpisodesCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      seriesId: seriesId ?? this.seriesId,
      episodeId: episodeId ?? this.episodeId,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      episodeNumber: episodeNumber ?? this.episodeNumber,
      title: title ?? this.title,
      plot: plot ?? this.plot,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      containerExtension: containerExtension ?? this.containerExtension,
      stillUrl: stillUrl ?? this.stillUrl,
      rating: rating ?? this.rating,
      airDate: airDate ?? this.airDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<int>(seriesId.value);
    }
    if (episodeId.present) {
      map['episode_id'] = Variable<int>(episodeId.value);
    }
    if (seasonNumber.present) {
      map['season_number'] = Variable<int>(seasonNumber.value);
    }
    if (episodeNumber.present) {
      map['episode_number'] = Variable<int>(episodeNumber.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (plot.present) {
      map['plot'] = Variable<String>(plot.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (containerExtension.present) {
      map['container_extension'] = Variable<String>(containerExtension.value);
    }
    if (stillUrl.present) {
      map['still_url'] = Variable<String>(stillUrl.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (airDate.present) {
      map['air_date'] = Variable<DateTime>(airDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesEpisodesCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('seriesId: $seriesId, ')
          ..write('episodeId: $episodeId, ')
          ..write('seasonNumber: $seasonNumber, ')
          ..write('episodeNumber: $episodeNumber, ')
          ..write('title: $title, ')
          ..write('plot: $plot, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('containerExtension: $containerExtension, ')
          ..write('stillUrl: $stillUrl, ')
          ..write('rating: $rating, ')
          ..write('airDate: $airDate')
          ..write(')'))
        .toString();
  }
}

class $SeriesDetailsCacheTable extends SeriesDetailsCache
    with TableInfo<$SeriesDetailsCacheTable, SeriesDetailsCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesDetailsCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<int> seriesId = GeneratedColumn<int>(
    'series_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, playlistId, seriesId, fetchedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'series_details_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeriesDetailsCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_seriesIdMeta);
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_fetchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {playlistId, seriesId},
  ];
  @override
  SeriesDetailsCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeriesDetailsCacheData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}series_id'],
      )!,
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
    );
  }

  @override
  $SeriesDetailsCacheTable createAlias(String alias) {
    return $SeriesDetailsCacheTable(attachedDatabase, alias);
  }
}

class SeriesDetailsCacheData extends DataClass
    implements Insertable<SeriesDetailsCacheData> {
  final int id;
  final int playlistId;
  final int seriesId;
  final DateTime fetchedAt;
  const SeriesDetailsCacheData({
    required this.id,
    required this.playlistId,
    required this.seriesId,
    required this.fetchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<int>(playlistId);
    map['series_id'] = Variable<int>(seriesId);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    return map;
  }

  SeriesDetailsCacheCompanion toCompanion(bool nullToAbsent) {
    return SeriesDetailsCacheCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      seriesId: Value(seriesId),
      fetchedAt: Value(fetchedAt),
    );
  }

  factory SeriesDetailsCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SeriesDetailsCacheData(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      seriesId: serializer.fromJson<int>(json['seriesId']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int>(playlistId),
      'seriesId': serializer.toJson<int>(seriesId),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
    };
  }

  SeriesDetailsCacheData copyWith({
    int? id,
    int? playlistId,
    int? seriesId,
    DateTime? fetchedAt,
  }) => SeriesDetailsCacheData(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    seriesId: seriesId ?? this.seriesId,
    fetchedAt: fetchedAt ?? this.fetchedAt,
  );
  SeriesDetailsCacheData copyWithCompanion(SeriesDetailsCacheCompanion data) {
    return SeriesDetailsCacheData(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SeriesDetailsCacheData(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('seriesId: $seriesId, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playlistId, seriesId, fetchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SeriesDetailsCacheData &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.seriesId == this.seriesId &&
          other.fetchedAt == this.fetchedAt);
}

class SeriesDetailsCacheCompanion
    extends UpdateCompanion<SeriesDetailsCacheData> {
  final Value<int> id;
  final Value<int> playlistId;
  final Value<int> seriesId;
  final Value<DateTime> fetchedAt;
  const SeriesDetailsCacheCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.fetchedAt = const Value.absent(),
  });
  SeriesDetailsCacheCompanion.insert({
    this.id = const Value.absent(),
    required int playlistId,
    required int seriesId,
    required DateTime fetchedAt,
  }) : playlistId = Value(playlistId),
       seriesId = Value(seriesId),
       fetchedAt = Value(fetchedAt);
  static Insertable<SeriesDetailsCacheData> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<int>? seriesId,
    Expression<DateTime>? fetchedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (seriesId != null) 'series_id': seriesId,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
    });
  }

  SeriesDetailsCacheCompanion copyWith({
    Value<int>? id,
    Value<int>? playlistId,
    Value<int>? seriesId,
    Value<DateTime>? fetchedAt,
  }) {
    return SeriesDetailsCacheCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      seriesId: seriesId ?? this.seriesId,
      fetchedAt: fetchedAt ?? this.fetchedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<int>(seriesId.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesDetailsCacheCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('seriesId: $seriesId, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }
}

class $RecordingsTable extends Recordings
    with TableInfo<$RecordingsTable, Recording> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlists (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _durationMsMeta = const VerificationMeta(
    'durationMs',
  );
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
    'duration_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('recording'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playlistId,
    title,
    filePath,
    startedAt,
    durationMs,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recordings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Recording> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
        _durationMsMeta,
        durationMs.isAcceptableOrUnknown(data['duration_ms']!, _durationMsMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recording map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Recording(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      durationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_ms'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $RecordingsTable createAlias(String alias) {
    return $RecordingsTable(attachedDatabase, alias);
  }
}

class Recording extends DataClass implements Insertable<Recording> {
  final int id;
  final int? playlistId;
  final String title;
  final String filePath;
  final DateTime startedAt;
  final int? durationMs;
  final String status;
  const Recording({
    required this.id,
    this.playlistId,
    required this.title,
    required this.filePath,
    required this.startedAt,
    this.durationMs,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || playlistId != null) {
      map['playlist_id'] = Variable<int>(playlistId);
    }
    map['title'] = Variable<String>(title);
    map['file_path'] = Variable<String>(filePath);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || durationMs != null) {
      map['duration_ms'] = Variable<int>(durationMs);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  RecordingsCompanion toCompanion(bool nullToAbsent) {
    return RecordingsCompanion(
      id: Value(id),
      playlistId: playlistId == null && nullToAbsent
          ? const Value.absent()
          : Value(playlistId),
      title: Value(title),
      filePath: Value(filePath),
      startedAt: Value(startedAt),
      durationMs: durationMs == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMs),
      status: Value(status),
    );
  }

  factory Recording.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Recording(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int?>(json['playlistId']),
      title: serializer.fromJson<String>(json['title']),
      filePath: serializer.fromJson<String>(json['filePath']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      durationMs: serializer.fromJson<int?>(json['durationMs']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int?>(playlistId),
      'title': serializer.toJson<String>(title),
      'filePath': serializer.toJson<String>(filePath),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'durationMs': serializer.toJson<int?>(durationMs),
      'status': serializer.toJson<String>(status),
    };
  }

  Recording copyWith({
    int? id,
    Value<int?> playlistId = const Value.absent(),
    String? title,
    String? filePath,
    DateTime? startedAt,
    Value<int?> durationMs = const Value.absent(),
    String? status,
  }) => Recording(
    id: id ?? this.id,
    playlistId: playlistId.present ? playlistId.value : this.playlistId,
    title: title ?? this.title,
    filePath: filePath ?? this.filePath,
    startedAt: startedAt ?? this.startedAt,
    durationMs: durationMs.present ? durationMs.value : this.durationMs,
    status: status ?? this.status,
  );
  Recording copyWithCompanion(RecordingsCompanion data) {
    return Recording(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      title: data.title.present ? data.title.value : this.title,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      durationMs: data.durationMs.present
          ? data.durationMs.value
          : this.durationMs,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Recording(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath, ')
          ..write('startedAt: $startedAt, ')
          ..write('durationMs: $durationMs, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playlistId,
    title,
    filePath,
    startedAt,
    durationMs,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recording &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.title == this.title &&
          other.filePath == this.filePath &&
          other.startedAt == this.startedAt &&
          other.durationMs == this.durationMs &&
          other.status == this.status);
}

class RecordingsCompanion extends UpdateCompanion<Recording> {
  final Value<int> id;
  final Value<int?> playlistId;
  final Value<String> title;
  final Value<String> filePath;
  final Value<DateTime> startedAt;
  final Value<int?> durationMs;
  final Value<String> status;
  const RecordingsCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.title = const Value.absent(),
    this.filePath = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.status = const Value.absent(),
  });
  RecordingsCompanion.insert({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    required String title,
    required String filePath,
    this.startedAt = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.status = const Value.absent(),
  }) : title = Value(title),
       filePath = Value(filePath);
  static Insertable<Recording> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<String>? title,
    Expression<String>? filePath,
    Expression<DateTime>? startedAt,
    Expression<int>? durationMs,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (title != null) 'title': title,
      if (filePath != null) 'file_path': filePath,
      if (startedAt != null) 'started_at': startedAt,
      if (durationMs != null) 'duration_ms': durationMs,
      if (status != null) 'status': status,
    });
  }

  RecordingsCompanion copyWith({
    Value<int>? id,
    Value<int?>? playlistId,
    Value<String>? title,
    Value<String>? filePath,
    Value<DateTime>? startedAt,
    Value<int?>? durationMs,
    Value<String>? status,
  }) {
    return RecordingsCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      title: title ?? this.title,
      filePath: filePath ?? this.filePath,
      startedAt: startedAt ?? this.startedAt,
      durationMs: durationMs ?? this.durationMs,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordingsCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath, ')
          ..write('startedAt: $startedAt, ')
          ..write('durationMs: $durationMs, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $ScheduledRecordingsTable extends ScheduledRecordings
    with TableInfo<$ScheduledRecordingsTable, ScheduledRecording> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduledRecordingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlists (id)',
    ),
  );
  static const VerificationMeta _channelIdMeta = const VerificationMeta(
    'channelId',
  );
  @override
  late final GeneratedColumn<int> channelId = GeneratedColumn<int>(
    'channel_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES channels (id)',
    ),
  );
  static const VerificationMeta _recordingIdMeta = const VerificationMeta(
    'recordingId',
  );
  @override
  late final GeneratedColumn<int> recordingId = GeneratedColumn<int>(
    'recording_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recordings (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _programStartMeta = const VerificationMeta(
    'programStart',
  );
  @override
  late final GeneratedColumn<DateTime> programStart = GeneratedColumn<DateTime>(
    'program_start',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _programEndMeta = const VerificationMeta(
    'programEnd',
  );
  @override
  late final GeneratedColumn<DateTime> programEnd = GeneratedColumn<DateTime>(
    'program_end',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('scheduled'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playlistId,
    channelId,
    recordingId,
    title,
    programStart,
    programEnd,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scheduled_recordings';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduledRecording> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('channel_id')) {
      context.handle(
        _channelIdMeta,
        channelId.isAcceptableOrUnknown(data['channel_id']!, _channelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_channelIdMeta);
    }
    if (data.containsKey('recording_id')) {
      context.handle(
        _recordingIdMeta,
        recordingId.isAcceptableOrUnknown(
          data['recording_id']!,
          _recordingIdMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('program_start')) {
      context.handle(
        _programStartMeta,
        programStart.isAcceptableOrUnknown(
          data['program_start']!,
          _programStartMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_programStartMeta);
    }
    if (data.containsKey('program_end')) {
      context.handle(
        _programEndMeta,
        programEnd.isAcceptableOrUnknown(data['program_end']!, _programEndMeta),
      );
    } else if (isInserting) {
      context.missing(_programEndMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduledRecording map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduledRecording(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      channelId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}channel_id'],
      )!,
      recordingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recording_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      programStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}program_start'],
      )!,
      programEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}program_end'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $ScheduledRecordingsTable createAlias(String alias) {
    return $ScheduledRecordingsTable(attachedDatabase, alias);
  }
}

class ScheduledRecording extends DataClass
    implements Insertable<ScheduledRecording> {
  final int id;
  final int playlistId;
  final int channelId;
  final int? recordingId;
  final String title;
  final DateTime programStart;
  final DateTime programEnd;
  final String status;
  const ScheduledRecording({
    required this.id,
    required this.playlistId,
    required this.channelId,
    this.recordingId,
    required this.title,
    required this.programStart,
    required this.programEnd,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<int>(playlistId);
    map['channel_id'] = Variable<int>(channelId);
    if (!nullToAbsent || recordingId != null) {
      map['recording_id'] = Variable<int>(recordingId);
    }
    map['title'] = Variable<String>(title);
    map['program_start'] = Variable<DateTime>(programStart);
    map['program_end'] = Variable<DateTime>(programEnd);
    map['status'] = Variable<String>(status);
    return map;
  }

  ScheduledRecordingsCompanion toCompanion(bool nullToAbsent) {
    return ScheduledRecordingsCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      channelId: Value(channelId),
      recordingId: recordingId == null && nullToAbsent
          ? const Value.absent()
          : Value(recordingId),
      title: Value(title),
      programStart: Value(programStart),
      programEnd: Value(programEnd),
      status: Value(status),
    );
  }

  factory ScheduledRecording.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduledRecording(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      channelId: serializer.fromJson<int>(json['channelId']),
      recordingId: serializer.fromJson<int?>(json['recordingId']),
      title: serializer.fromJson<String>(json['title']),
      programStart: serializer.fromJson<DateTime>(json['programStart']),
      programEnd: serializer.fromJson<DateTime>(json['programEnd']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int>(playlistId),
      'channelId': serializer.toJson<int>(channelId),
      'recordingId': serializer.toJson<int?>(recordingId),
      'title': serializer.toJson<String>(title),
      'programStart': serializer.toJson<DateTime>(programStart),
      'programEnd': serializer.toJson<DateTime>(programEnd),
      'status': serializer.toJson<String>(status),
    };
  }

  ScheduledRecording copyWith({
    int? id,
    int? playlistId,
    int? channelId,
    Value<int?> recordingId = const Value.absent(),
    String? title,
    DateTime? programStart,
    DateTime? programEnd,
    String? status,
  }) => ScheduledRecording(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    channelId: channelId ?? this.channelId,
    recordingId: recordingId.present ? recordingId.value : this.recordingId,
    title: title ?? this.title,
    programStart: programStart ?? this.programStart,
    programEnd: programEnd ?? this.programEnd,
    status: status ?? this.status,
  );
  ScheduledRecording copyWithCompanion(ScheduledRecordingsCompanion data) {
    return ScheduledRecording(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      channelId: data.channelId.present ? data.channelId.value : this.channelId,
      recordingId: data.recordingId.present
          ? data.recordingId.value
          : this.recordingId,
      title: data.title.present ? data.title.value : this.title,
      programStart: data.programStart.present
          ? data.programStart.value
          : this.programStart,
      programEnd: data.programEnd.present
          ? data.programEnd.value
          : this.programEnd,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledRecording(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('channelId: $channelId, ')
          ..write('recordingId: $recordingId, ')
          ..write('title: $title, ')
          ..write('programStart: $programStart, ')
          ..write('programEnd: $programEnd, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playlistId,
    channelId,
    recordingId,
    title,
    programStart,
    programEnd,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduledRecording &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.channelId == this.channelId &&
          other.recordingId == this.recordingId &&
          other.title == this.title &&
          other.programStart == this.programStart &&
          other.programEnd == this.programEnd &&
          other.status == this.status);
}

class ScheduledRecordingsCompanion extends UpdateCompanion<ScheduledRecording> {
  final Value<int> id;
  final Value<int> playlistId;
  final Value<int> channelId;
  final Value<int?> recordingId;
  final Value<String> title;
  final Value<DateTime> programStart;
  final Value<DateTime> programEnd;
  final Value<String> status;
  const ScheduledRecordingsCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.channelId = const Value.absent(),
    this.recordingId = const Value.absent(),
    this.title = const Value.absent(),
    this.programStart = const Value.absent(),
    this.programEnd = const Value.absent(),
    this.status = const Value.absent(),
  });
  ScheduledRecordingsCompanion.insert({
    this.id = const Value.absent(),
    required int playlistId,
    required int channelId,
    this.recordingId = const Value.absent(),
    required String title,
    required DateTime programStart,
    required DateTime programEnd,
    this.status = const Value.absent(),
  }) : playlistId = Value(playlistId),
       channelId = Value(channelId),
       title = Value(title),
       programStart = Value(programStart),
       programEnd = Value(programEnd);
  static Insertable<ScheduledRecording> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<int>? channelId,
    Expression<int>? recordingId,
    Expression<String>? title,
    Expression<DateTime>? programStart,
    Expression<DateTime>? programEnd,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (channelId != null) 'channel_id': channelId,
      if (recordingId != null) 'recording_id': recordingId,
      if (title != null) 'title': title,
      if (programStart != null) 'program_start': programStart,
      if (programEnd != null) 'program_end': programEnd,
      if (status != null) 'status': status,
    });
  }

  ScheduledRecordingsCompanion copyWith({
    Value<int>? id,
    Value<int>? playlistId,
    Value<int>? channelId,
    Value<int?>? recordingId,
    Value<String>? title,
    Value<DateTime>? programStart,
    Value<DateTime>? programEnd,
    Value<String>? status,
  }) {
    return ScheduledRecordingsCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      channelId: channelId ?? this.channelId,
      recordingId: recordingId ?? this.recordingId,
      title: title ?? this.title,
      programStart: programStart ?? this.programStart,
      programEnd: programEnd ?? this.programEnd,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (channelId.present) {
      map['channel_id'] = Variable<int>(channelId.value);
    }
    if (recordingId.present) {
      map['recording_id'] = Variable<int>(recordingId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (programStart.present) {
      map['program_start'] = Variable<DateTime>(programStart.value);
    }
    if (programEnd.present) {
      map['program_end'] = Variable<DateTime>(programEnd.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledRecordingsCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('channelId: $channelId, ')
          ..write('recordingId: $recordingId, ')
          ..write('title: $title, ')
          ..write('programStart: $programStart, ')
          ..write('programEnd: $programEnd, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _channelIdMeta = const VerificationMeta(
    'channelId',
  );
  @override
  late final GeneratedColumn<int> channelId = GeneratedColumn<int>(
    'channel_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES channels (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _programStartMeta = const VerificationMeta(
    'programStart',
  );
  @override
  late final GeneratedColumn<DateTime> programStart = GeneratedColumn<DateTime>(
    'program_start',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notificationIdMeta = const VerificationMeta(
    'notificationId',
  );
  @override
  late final GeneratedColumn<int> notificationId = GeneratedColumn<int>(
    'notification_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    channelId,
    title,
    programStart,
    notificationId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('channel_id')) {
      context.handle(
        _channelIdMeta,
        channelId.isAcceptableOrUnknown(data['channel_id']!, _channelIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('program_start')) {
      context.handle(
        _programStartMeta,
        programStart.isAcceptableOrUnknown(
          data['program_start']!,
          _programStartMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_programStartMeta);
    }
    if (data.containsKey('notification_id')) {
      context.handle(
        _notificationIdMeta,
        notificationId.isAcceptableOrUnknown(
          data['notification_id']!,
          _notificationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notificationIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {notificationId},
  ];
  @override
  Reminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      channelId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}channel_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      programStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}program_start'],
      )!,
      notificationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notification_id'],
      )!,
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final int id;
  final int? channelId;
  final String title;
  final DateTime programStart;
  final int notificationId;
  const Reminder({
    required this.id,
    this.channelId,
    required this.title,
    required this.programStart,
    required this.notificationId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || channelId != null) {
      map['channel_id'] = Variable<int>(channelId);
    }
    map['title'] = Variable<String>(title);
    map['program_start'] = Variable<DateTime>(programStart);
    map['notification_id'] = Variable<int>(notificationId);
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      channelId: channelId == null && nullToAbsent
          ? const Value.absent()
          : Value(channelId),
      title: Value(title),
      programStart: Value(programStart),
      notificationId: Value(notificationId),
    );
  }

  factory Reminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reminder(
      id: serializer.fromJson<int>(json['id']),
      channelId: serializer.fromJson<int?>(json['channelId']),
      title: serializer.fromJson<String>(json['title']),
      programStart: serializer.fromJson<DateTime>(json['programStart']),
      notificationId: serializer.fromJson<int>(json['notificationId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'channelId': serializer.toJson<int?>(channelId),
      'title': serializer.toJson<String>(title),
      'programStart': serializer.toJson<DateTime>(programStart),
      'notificationId': serializer.toJson<int>(notificationId),
    };
  }

  Reminder copyWith({
    int? id,
    Value<int?> channelId = const Value.absent(),
    String? title,
    DateTime? programStart,
    int? notificationId,
  }) => Reminder(
    id: id ?? this.id,
    channelId: channelId.present ? channelId.value : this.channelId,
    title: title ?? this.title,
    programStart: programStart ?? this.programStart,
    notificationId: notificationId ?? this.notificationId,
  );
  Reminder copyWithCompanion(RemindersCompanion data) {
    return Reminder(
      id: data.id.present ? data.id.value : this.id,
      channelId: data.channelId.present ? data.channelId.value : this.channelId,
      title: data.title.present ? data.title.value : this.title,
      programStart: data.programStart.present
          ? data.programStart.value
          : this.programStart,
      notificationId: data.notificationId.present
          ? data.notificationId.value
          : this.notificationId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('channelId: $channelId, ')
          ..write('title: $title, ')
          ..write('programStart: $programStart, ')
          ..write('notificationId: $notificationId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, channelId, title, programStart, notificationId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.channelId == this.channelId &&
          other.title == this.title &&
          other.programStart == this.programStart &&
          other.notificationId == this.notificationId);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<int> id;
  final Value<int?> channelId;
  final Value<String> title;
  final Value<DateTime> programStart;
  final Value<int> notificationId;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.channelId = const Value.absent(),
    this.title = const Value.absent(),
    this.programStart = const Value.absent(),
    this.notificationId = const Value.absent(),
  });
  RemindersCompanion.insert({
    this.id = const Value.absent(),
    this.channelId = const Value.absent(),
    required String title,
    required DateTime programStart,
    required int notificationId,
  }) : title = Value(title),
       programStart = Value(programStart),
       notificationId = Value(notificationId);
  static Insertable<Reminder> custom({
    Expression<int>? id,
    Expression<int>? channelId,
    Expression<String>? title,
    Expression<DateTime>? programStart,
    Expression<int>? notificationId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (channelId != null) 'channel_id': channelId,
      if (title != null) 'title': title,
      if (programStart != null) 'program_start': programStart,
      if (notificationId != null) 'notification_id': notificationId,
    });
  }

  RemindersCompanion copyWith({
    Value<int>? id,
    Value<int?>? channelId,
    Value<String>? title,
    Value<DateTime>? programStart,
    Value<int>? notificationId,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      channelId: channelId ?? this.channelId,
      title: title ?? this.title,
      programStart: programStart ?? this.programStart,
      notificationId: notificationId ?? this.notificationId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (channelId.present) {
      map['channel_id'] = Variable<int>(channelId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (programStart.present) {
      map['program_start'] = Variable<DateTime>(programStart.value);
    }
    if (notificationId.present) {
      map['notification_id'] = Variable<int>(notificationId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('channelId: $channelId, ')
          ..write('title: $title, ')
          ..write('programStart: $programStart, ')
          ..write('notificationId: $notificationId')
          ..write(')'))
        .toString();
  }
}

abstract class _$IptvDatabase extends GeneratedDatabase {
  _$IptvDatabase(QueryExecutor e) : super(e);
  $IptvDatabaseManager get managers => $IptvDatabaseManager(this);
  late final $PlaylistsTable playlists = $PlaylistsTable(this);
  late final $ChannelGroupsTable channelGroups = $ChannelGroupsTable(this);
  late final $ChannelsTable channels = $ChannelsTable(this);
  late final $ChannelEditsTable channelEdits = $ChannelEditsTable(this);
  late final $EpgProgramsTable epgPrograms = $EpgProgramsTable(this);
  late final $EpgSourcesTable epgSources = $EpgSourcesTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $WatchHistoryTable watchHistory = $WatchHistoryTable(this);
  late final $EnabledGroupsTable enabledGroups = $EnabledGroupsTable(this);
  late final $VodItemsTable vodItems = $VodItemsTable(this);
  late final $SeriesSeasonsTable seriesSeasons = $SeriesSeasonsTable(this);
  late final $SeriesEpisodesTable seriesEpisodes = $SeriesEpisodesTable(this);
  late final $SeriesDetailsCacheTable seriesDetailsCache =
      $SeriesDetailsCacheTable(this);
  late final $RecordingsTable recordings = $RecordingsTable(this);
  late final $ScheduledRecordingsTable scheduledRecordings =
      $ScheduledRecordingsTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final Index idxChannelsPlaylistVod = Index(
    'idx_channels_playlist_vod',
    'CREATE INDEX idx_channels_playlist_vod ON channels (playlist_id, is_vod)',
  );
  late final Index idxChannelsGroup = Index(
    'idx_channels_group',
    'CREATE INDEX idx_channels_group ON channels (group_id)',
  );
  late final Index idxChannelsTvg = Index(
    'idx_channels_tvg',
    'CREATE INDEX idx_channels_tvg ON channels (tvg_id)',
  );
  late final Index idxChannelsName = Index(
    'idx_channels_name',
    'CREATE INDEX idx_channels_name ON channels (name)',
  );
  late final Index idxEpgChannelStart = Index(
    'idx_epg_channel_start',
    'CREATE INDEX idx_epg_channel_start ON epg_programs (channel_tvg_id, start_time)',
  );
  late final Index idxWatchHistoryProfileTypeTime = Index(
    'idx_watch_history_profile_type_time',
    'CREATE INDEX idx_watch_history_profile_type_time ON watch_history (profile_id, content_type, watched_at)',
  );
  late final Index idxWatchHistoryProfileVod = Index(
    'idx_watch_history_profile_vod',
    'CREATE INDEX idx_watch_history_profile_vod ON watch_history (profile_id, vod_item_id)',
  );
  late final Index idxWatchHistoryProfileEpisode = Index(
    'idx_watch_history_profile_episode',
    'CREATE INDEX idx_watch_history_profile_episode ON watch_history (profile_id, episode_id)',
  );
  late final Index idxVodPlaylistSeries = Index(
    'idx_vod_playlist_series',
    'CREATE INDEX idx_vod_playlist_series ON vod_items (playlist_id, is_series)',
  );
  late final Index idxVodPlaylistStream = Index(
    'idx_vod_playlist_stream',
    'CREATE INDEX idx_vod_playlist_stream ON vod_items (playlist_id, stream_id)',
  );
  late final Index idxVodAdded = Index(
    'idx_vod_added',
    'CREATE INDEX idx_vod_added ON vod_items (added_at)',
  );
  late final Index idxSeriesEpisodesSeriesSeason = Index(
    'idx_series_episodes_series_season',
    'CREATE INDEX idx_series_episodes_series_season ON series_episodes (playlist_id, series_id, season_number)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    playlists,
    channelGroups,
    channels,
    channelEdits,
    epgPrograms,
    epgSources,
    favorites,
    watchHistory,
    enabledGroups,
    vodItems,
    seriesSeasons,
    seriesEpisodes,
    seriesDetailsCache,
    recordings,
    scheduledRecordings,
    reminders,
    idxChannelsPlaylistVod,
    idxChannelsGroup,
    idxChannelsTvg,
    idxChannelsName,
    idxEpgChannelStart,
    idxWatchHistoryProfileTypeTime,
    idxWatchHistoryProfileVod,
    idxWatchHistoryProfileEpisode,
    idxVodPlaylistSeries,
    idxVodPlaylistStream,
    idxVodAdded,
    idxSeriesEpisodesSeriesSeason,
  ];
}

typedef $$PlaylistsTableCreateCompanionBuilder =
    PlaylistsCompanion Function({
      Value<int> id,
      required String name,
      required String sourceType,
      Value<String?> url,
      Value<String?> filePath,
      Value<String?> epgUrl,
      Value<int> refreshIntervalMs,
      Value<DateTime?> lastRefreshed,
    });
typedef $$PlaylistsTableUpdateCompanionBuilder =
    PlaylistsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> sourceType,
      Value<String?> url,
      Value<String?> filePath,
      Value<String?> epgUrl,
      Value<int> refreshIntervalMs,
      Value<DateTime?> lastRefreshed,
    });

final class $$PlaylistsTableReferences
    extends BaseReferences<_$IptvDatabase, $PlaylistsTable, Playlist> {
  $$PlaylistsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ChannelGroupsTable, List<ChannelGroup>>
  _channelGroupsRefsTable(_$IptvDatabase db) => MultiTypedResultKey.fromTable(
    db.channelGroups,
    aliasName: 'playlists__id__channel_groups__playlist_id',
  );

  $$ChannelGroupsTableProcessedTableManager get channelGroupsRefs {
    final manager = $$ChannelGroupsTableTableManager(
      $_db,
      $_db.channelGroups,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_channelGroupsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ChannelsTable, List<Channel>> _channelsRefsTable(
    _$IptvDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.channels,
    aliasName: 'playlists__id__channels__playlist_id',
  );

  $$ChannelsTableProcessedTableManager get channelsRefs {
    final manager = $$ChannelsTableTableManager(
      $_db,
      $_db.channels,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_channelsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ChannelEditsTable, List<ChannelEdit>>
  _channelEditsRefsTable(_$IptvDatabase db) => MultiTypedResultKey.fromTable(
    db.channelEdits,
    aliasName: 'playlists__id__channel_edits__playlist_id',
  );

  $$ChannelEditsTableProcessedTableManager get channelEditsRefs {
    final manager = $$ChannelEditsTableTableManager(
      $_db,
      $_db.channelEdits,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_channelEditsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EpgSourcesTable, List<EpgSource>>
  _epgSourcesRefsTable(_$IptvDatabase db) => MultiTypedResultKey.fromTable(
    db.epgSources,
    aliasName: 'playlists__id__epg_sources__playlist_id',
  );

  $$EpgSourcesTableProcessedTableManager get epgSourcesRefs {
    final manager = $$EpgSourcesTableTableManager(
      $_db,
      $_db.epgSources,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_epgSourcesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VodItemsTable, List<VodItem>> _vodItemsRefsTable(
    _$IptvDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.vodItems,
    aliasName: 'playlists__id__vod_items__playlist_id',
  );

  $$VodItemsTableProcessedTableManager get vodItemsRefs {
    final manager = $$VodItemsTableTableManager(
      $_db,
      $_db.vodItems,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_vodItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SeriesSeasonsTable, List<SeriesSeason>>
  _seriesSeasonsRefsTable(_$IptvDatabase db) => MultiTypedResultKey.fromTable(
    db.seriesSeasons,
    aliasName: 'playlists__id__series_seasons__playlist_id',
  );

  $$SeriesSeasonsTableProcessedTableManager get seriesSeasonsRefs {
    final manager = $$SeriesSeasonsTableTableManager(
      $_db,
      $_db.seriesSeasons,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_seriesSeasonsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SeriesEpisodesTable, List<SeriesEpisode>>
  _seriesEpisodesRefsTable(_$IptvDatabase db) => MultiTypedResultKey.fromTable(
    db.seriesEpisodes,
    aliasName: 'playlists__id__series_episodes__playlist_id',
  );

  $$SeriesEpisodesTableProcessedTableManager get seriesEpisodesRefs {
    final manager = $$SeriesEpisodesTableTableManager(
      $_db,
      $_db.seriesEpisodes,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_seriesEpisodesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RecordingsTable, List<Recording>>
  _recordingsRefsTable(_$IptvDatabase db) => MultiTypedResultKey.fromTable(
    db.recordings,
    aliasName: 'playlists__id__recordings__playlist_id',
  );

  $$RecordingsTableProcessedTableManager get recordingsRefs {
    final manager = $$RecordingsTableTableManager(
      $_db,
      $_db.recordings,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_recordingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ScheduledRecordingsTable,
    List<ScheduledRecording>
  >
  _scheduledRecordingsRefsTable(_$IptvDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.scheduledRecordings,
        aliasName: 'playlists__id__scheduled_recordings__playlist_id',
      );

  $$ScheduledRecordingsTableProcessedTableManager get scheduledRecordingsRefs {
    final manager = $$ScheduledRecordingsTableTableManager(
      $_db,
      $_db.scheduledRecordings,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _scheduledRecordingsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlaylistsTableFilterComposer
    extends Composer<_$IptvDatabase, $PlaylistsTable> {
  $$PlaylistsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get epgUrl => $composableBuilder(
    column: $table.epgUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get refreshIntervalMs => $composableBuilder(
    column: $table.refreshIntervalMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastRefreshed => $composableBuilder(
    column: $table.lastRefreshed,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> channelGroupsRefs(
    Expression<bool> Function($$ChannelGroupsTableFilterComposer f) f,
  ) {
    final $$ChannelGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.channelGroups,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelGroupsTableFilterComposer(
            $db: $db,
            $table: $db.channelGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> channelsRefs(
    Expression<bool> Function($$ChannelsTableFilterComposer f) f,
  ) {
    final $$ChannelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableFilterComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> channelEditsRefs(
    Expression<bool> Function($$ChannelEditsTableFilterComposer f) f,
  ) {
    final $$ChannelEditsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.channelEdits,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelEditsTableFilterComposer(
            $db: $db,
            $table: $db.channelEdits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> epgSourcesRefs(
    Expression<bool> Function($$EpgSourcesTableFilterComposer f) f,
  ) {
    final $$EpgSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.epgSources,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpgSourcesTableFilterComposer(
            $db: $db,
            $table: $db.epgSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> vodItemsRefs(
    Expression<bool> Function($$VodItemsTableFilterComposer f) f,
  ) {
    final $$VodItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vodItems,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VodItemsTableFilterComposer(
            $db: $db,
            $table: $db.vodItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> seriesSeasonsRefs(
    Expression<bool> Function($$SeriesSeasonsTableFilterComposer f) f,
  ) {
    final $$SeriesSeasonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesSeasons,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesSeasonsTableFilterComposer(
            $db: $db,
            $table: $db.seriesSeasons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> seriesEpisodesRefs(
    Expression<bool> Function($$SeriesEpisodesTableFilterComposer f) f,
  ) {
    final $$SeriesEpisodesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesEpisodes,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesEpisodesTableFilterComposer(
            $db: $db,
            $table: $db.seriesEpisodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recordingsRefs(
    Expression<bool> Function($$RecordingsTableFilterComposer f) f,
  ) {
    final $$RecordingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recordings,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecordingsTableFilterComposer(
            $db: $db,
            $table: $db.recordings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> scheduledRecordingsRefs(
    Expression<bool> Function($$ScheduledRecordingsTableFilterComposer f) f,
  ) {
    final $$ScheduledRecordingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduledRecordings,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduledRecordingsTableFilterComposer(
            $db: $db,
            $table: $db.scheduledRecordings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlaylistsTableOrderingComposer
    extends Composer<_$IptvDatabase, $PlaylistsTable> {
  $$PlaylistsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get epgUrl => $composableBuilder(
    column: $table.epgUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get refreshIntervalMs => $composableBuilder(
    column: $table.refreshIntervalMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastRefreshed => $composableBuilder(
    column: $table.lastRefreshed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlaylistsTableAnnotationComposer
    extends Composer<_$IptvDatabase, $PlaylistsTable> {
  $$PlaylistsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get epgUrl =>
      $composableBuilder(column: $table.epgUrl, builder: (column) => column);

  GeneratedColumn<int> get refreshIntervalMs => $composableBuilder(
    column: $table.refreshIntervalMs,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastRefreshed => $composableBuilder(
    column: $table.lastRefreshed,
    builder: (column) => column,
  );

  Expression<T> channelGroupsRefs<T extends Object>(
    Expression<T> Function($$ChannelGroupsTableAnnotationComposer a) f,
  ) {
    final $$ChannelGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.channelGroups,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.channelGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> channelsRefs<T extends Object>(
    Expression<T> Function($$ChannelsTableAnnotationComposer a) f,
  ) {
    final $$ChannelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableAnnotationComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> channelEditsRefs<T extends Object>(
    Expression<T> Function($$ChannelEditsTableAnnotationComposer a) f,
  ) {
    final $$ChannelEditsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.channelEdits,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelEditsTableAnnotationComposer(
            $db: $db,
            $table: $db.channelEdits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> epgSourcesRefs<T extends Object>(
    Expression<T> Function($$EpgSourcesTableAnnotationComposer a) f,
  ) {
    final $$EpgSourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.epgSources,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpgSourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.epgSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> vodItemsRefs<T extends Object>(
    Expression<T> Function($$VodItemsTableAnnotationComposer a) f,
  ) {
    final $$VodItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vodItems,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VodItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.vodItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> seriesSeasonsRefs<T extends Object>(
    Expression<T> Function($$SeriesSeasonsTableAnnotationComposer a) f,
  ) {
    final $$SeriesSeasonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesSeasons,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesSeasonsTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesSeasons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> seriesEpisodesRefs<T extends Object>(
    Expression<T> Function($$SeriesEpisodesTableAnnotationComposer a) f,
  ) {
    final $$SeriesEpisodesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.seriesEpisodes,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesEpisodesTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesEpisodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recordingsRefs<T extends Object>(
    Expression<T> Function($$RecordingsTableAnnotationComposer a) f,
  ) {
    final $$RecordingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recordings,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecordingsTableAnnotationComposer(
            $db: $db,
            $table: $db.recordings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> scheduledRecordingsRefs<T extends Object>(
    Expression<T> Function($$ScheduledRecordingsTableAnnotationComposer a) f,
  ) {
    final $$ScheduledRecordingsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scheduledRecordings,
          getReferencedColumn: (t) => t.playlistId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduledRecordingsTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduledRecordings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PlaylistsTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $PlaylistsTable,
          Playlist,
          $$PlaylistsTableFilterComposer,
          $$PlaylistsTableOrderingComposer,
          $$PlaylistsTableAnnotationComposer,
          $$PlaylistsTableCreateCompanionBuilder,
          $$PlaylistsTableUpdateCompanionBuilder,
          (Playlist, $$PlaylistsTableReferences),
          Playlist,
          PrefetchHooks Function({
            bool channelGroupsRefs,
            bool channelsRefs,
            bool channelEditsRefs,
            bool epgSourcesRefs,
            bool vodItemsRefs,
            bool seriesSeasonsRefs,
            bool seriesEpisodesRefs,
            bool recordingsRefs,
            bool scheduledRecordingsRefs,
          })
        > {
  $$PlaylistsTableTableManager(_$IptvDatabase db, $PlaylistsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaylistsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaylistsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> epgUrl = const Value.absent(),
                Value<int> refreshIntervalMs = const Value.absent(),
                Value<DateTime?> lastRefreshed = const Value.absent(),
              }) => PlaylistsCompanion(
                id: id,
                name: name,
                sourceType: sourceType,
                url: url,
                filePath: filePath,
                epgUrl: epgUrl,
                refreshIntervalMs: refreshIntervalMs,
                lastRefreshed: lastRefreshed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String sourceType,
                Value<String?> url = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> epgUrl = const Value.absent(),
                Value<int> refreshIntervalMs = const Value.absent(),
                Value<DateTime?> lastRefreshed = const Value.absent(),
              }) => PlaylistsCompanion.insert(
                id: id,
                name: name,
                sourceType: sourceType,
                url: url,
                filePath: filePath,
                epgUrl: epgUrl,
                refreshIntervalMs: refreshIntervalMs,
                lastRefreshed: lastRefreshed,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlaylistsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                channelGroupsRefs = false,
                channelsRefs = false,
                channelEditsRefs = false,
                epgSourcesRefs = false,
                vodItemsRefs = false,
                seriesSeasonsRefs = false,
                seriesEpisodesRefs = false,
                recordingsRefs = false,
                scheduledRecordingsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (channelGroupsRefs) db.channelGroups,
                    if (channelsRefs) db.channels,
                    if (channelEditsRefs) db.channelEdits,
                    if (epgSourcesRefs) db.epgSources,
                    if (vodItemsRefs) db.vodItems,
                    if (seriesSeasonsRefs) db.seriesSeasons,
                    if (seriesEpisodesRefs) db.seriesEpisodes,
                    if (recordingsRefs) db.recordings,
                    if (scheduledRecordingsRefs) db.scheduledRecordings,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (channelGroupsRefs)
                        await $_getPrefetchedData<
                          Playlist,
                          $PlaylistsTable,
                          ChannelGroup
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistsTableReferences
                              ._channelGroupsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistsTableReferences(
                                db,
                                table,
                                p0,
                              ).channelGroupsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (channelsRefs)
                        await $_getPrefetchedData<
                          Playlist,
                          $PlaylistsTable,
                          Channel
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistsTableReferences
                              ._channelsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistsTableReferences(
                                db,
                                table,
                                p0,
                              ).channelsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (channelEditsRefs)
                        await $_getPrefetchedData<
                          Playlist,
                          $PlaylistsTable,
                          ChannelEdit
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistsTableReferences
                              ._channelEditsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistsTableReferences(
                                db,
                                table,
                                p0,
                              ).channelEditsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (epgSourcesRefs)
                        await $_getPrefetchedData<
                          Playlist,
                          $PlaylistsTable,
                          EpgSource
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistsTableReferences
                              ._epgSourcesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistsTableReferences(
                                db,
                                table,
                                p0,
                              ).epgSourcesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (vodItemsRefs)
                        await $_getPrefetchedData<
                          Playlist,
                          $PlaylistsTable,
                          VodItem
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistsTableReferences
                              ._vodItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistsTableReferences(
                                db,
                                table,
                                p0,
                              ).vodItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (seriesSeasonsRefs)
                        await $_getPrefetchedData<
                          Playlist,
                          $PlaylistsTable,
                          SeriesSeason
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistsTableReferences
                              ._seriesSeasonsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistsTableReferences(
                                db,
                                table,
                                p0,
                              ).seriesSeasonsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (seriesEpisodesRefs)
                        await $_getPrefetchedData<
                          Playlist,
                          $PlaylistsTable,
                          SeriesEpisode
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistsTableReferences
                              ._seriesEpisodesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistsTableReferences(
                                db,
                                table,
                                p0,
                              ).seriesEpisodesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recordingsRefs)
                        await $_getPrefetchedData<
                          Playlist,
                          $PlaylistsTable,
                          Recording
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistsTableReferences
                              ._recordingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistsTableReferences(
                                db,
                                table,
                                p0,
                              ).recordingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (scheduledRecordingsRefs)
                        await $_getPrefetchedData<
                          Playlist,
                          $PlaylistsTable,
                          ScheduledRecording
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistsTableReferences
                              ._scheduledRecordingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistsTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduledRecordingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PlaylistsTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $PlaylistsTable,
      Playlist,
      $$PlaylistsTableFilterComposer,
      $$PlaylistsTableOrderingComposer,
      $$PlaylistsTableAnnotationComposer,
      $$PlaylistsTableCreateCompanionBuilder,
      $$PlaylistsTableUpdateCompanionBuilder,
      (Playlist, $$PlaylistsTableReferences),
      Playlist,
      PrefetchHooks Function({
        bool channelGroupsRefs,
        bool channelsRefs,
        bool channelEditsRefs,
        bool epgSourcesRefs,
        bool vodItemsRefs,
        bool seriesSeasonsRefs,
        bool seriesEpisodesRefs,
        bool recordingsRefs,
        bool scheduledRecordingsRefs,
      })
    >;
typedef $$ChannelGroupsTableCreateCompanionBuilder =
    ChannelGroupsCompanion Function({
      Value<int> id,
      required int playlistId,
      required String name,
      required String providerName,
      Value<int> sortOrder,
    });
typedef $$ChannelGroupsTableUpdateCompanionBuilder =
    ChannelGroupsCompanion Function({
      Value<int> id,
      Value<int> playlistId,
      Value<String> name,
      Value<String> providerName,
      Value<int> sortOrder,
    });

final class $$ChannelGroupsTableReferences
    extends BaseReferences<_$IptvDatabase, $ChannelGroupsTable, ChannelGroup> {
  $$ChannelGroupsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PlaylistsTable _playlistIdTable(_$IptvDatabase db) =>
      db.playlists.createAlias('channel_groups__playlist_id__playlists__id');

  $$PlaylistsTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistsTableTableManager(
      $_db,
      $_db.playlists,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ChannelsTable, List<Channel>> _channelsRefsTable(
    _$IptvDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.channels,
    aliasName: 'channel_groups__id__channels__group_id',
  );

  $$ChannelsTableProcessedTableManager get channelsRefs {
    final manager = $$ChannelsTableTableManager(
      $_db,
      $_db.channels,
    ).filter((f) => f.groupId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_channelsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChannelGroupsTableFilterComposer
    extends Composer<_$IptvDatabase, $ChannelGroupsTable> {
  $$ChannelGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistsTableFilterComposer get playlistId {
    final $$PlaylistsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableFilterComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> channelsRefs(
    Expression<bool> Function($$ChannelsTableFilterComposer f) f,
  ) {
    final $$ChannelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.groupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableFilterComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChannelGroupsTableOrderingComposer
    extends Composer<_$IptvDatabase, $ChannelGroupsTable> {
  $$ChannelGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistsTableOrderingComposer get playlistId {
    final $$PlaylistsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableOrderingComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChannelGroupsTableAnnotationComposer
    extends Composer<_$IptvDatabase, $ChannelGroupsTable> {
  $$ChannelGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$PlaylistsTableAnnotationComposer get playlistId {
    final $$PlaylistsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableAnnotationComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> channelsRefs<T extends Object>(
    Expression<T> Function($$ChannelsTableAnnotationComposer a) f,
  ) {
    final $$ChannelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.groupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableAnnotationComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChannelGroupsTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $ChannelGroupsTable,
          ChannelGroup,
          $$ChannelGroupsTableFilterComposer,
          $$ChannelGroupsTableOrderingComposer,
          $$ChannelGroupsTableAnnotationComposer,
          $$ChannelGroupsTableCreateCompanionBuilder,
          $$ChannelGroupsTableUpdateCompanionBuilder,
          (ChannelGroup, $$ChannelGroupsTableReferences),
          ChannelGroup,
          PrefetchHooks Function({bool playlistId, bool channelsRefs})
        > {
  $$ChannelGroupsTableTableManager(_$IptvDatabase db, $ChannelGroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChannelGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChannelGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChannelGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> providerName = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => ChannelGroupsCompanion(
                id: id,
                playlistId: playlistId,
                name: name,
                providerName: providerName,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playlistId,
                required String name,
                required String providerName,
                Value<int> sortOrder = const Value.absent(),
              }) => ChannelGroupsCompanion.insert(
                id: id,
                playlistId: playlistId,
                name: name,
                providerName: providerName,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChannelGroupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playlistId = false, channelsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (channelsRefs) db.channels],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable: $$ChannelGroupsTableReferences
                                    ._playlistIdTable(db),
                                referencedColumn: $$ChannelGroupsTableReferences
                                    ._playlistIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (channelsRefs)
                    await $_getPrefetchedData<
                      ChannelGroup,
                      $ChannelGroupsTable,
                      Channel
                    >(
                      currentTable: table,
                      referencedTable: $$ChannelGroupsTableReferences
                          ._channelsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ChannelGroupsTableReferences(
                            db,
                            table,
                            p0,
                          ).channelsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.groupId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ChannelGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $ChannelGroupsTable,
      ChannelGroup,
      $$ChannelGroupsTableFilterComposer,
      $$ChannelGroupsTableOrderingComposer,
      $$ChannelGroupsTableAnnotationComposer,
      $$ChannelGroupsTableCreateCompanionBuilder,
      $$ChannelGroupsTableUpdateCompanionBuilder,
      (ChannelGroup, $$ChannelGroupsTableReferences),
      ChannelGroup,
      PrefetchHooks Function({bool playlistId, bool channelsRefs})
    >;
typedef $$ChannelsTableCreateCompanionBuilder =
    ChannelsCompanion Function({
      Value<int> id,
      required int playlistId,
      Value<int?> groupId,
      required String name,
      required String streamUrl,
      Value<String?> logoUrl,
      Value<String?> tvgId,
      Value<int?> channelNumber,
      Value<bool> isVod,
      Value<String?> catchupMode,
      Value<String?> catchupSource,
      Value<int?> catchupDays,
    });
typedef $$ChannelsTableUpdateCompanionBuilder =
    ChannelsCompanion Function({
      Value<int> id,
      Value<int> playlistId,
      Value<int?> groupId,
      Value<String> name,
      Value<String> streamUrl,
      Value<String?> logoUrl,
      Value<String?> tvgId,
      Value<int?> channelNumber,
      Value<bool> isVod,
      Value<String?> catchupMode,
      Value<String?> catchupSource,
      Value<int?> catchupDays,
    });

final class $$ChannelsTableReferences
    extends BaseReferences<_$IptvDatabase, $ChannelsTable, Channel> {
  $$ChannelsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlaylistsTable _playlistIdTable(_$IptvDatabase db) =>
      db.playlists.createAlias('channels__playlist_id__playlists__id');

  $$PlaylistsTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistsTableTableManager(
      $_db,
      $_db.playlists,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ChannelGroupsTable _groupIdTable(_$IptvDatabase db) =>
      db.channelGroups.createAlias('channels__group_id__channel_groups__id');

  $$ChannelGroupsTableProcessedTableManager? get groupId {
    final $_column = $_itemColumn<int>('group_id');
    if ($_column == null) return null;
    final manager = $$ChannelGroupsTableTableManager(
      $_db,
      $_db.channelGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$WatchHistoryTable, List<WatchHistoryData>>
  _watchHistoryRefsTable(_$IptvDatabase db) => MultiTypedResultKey.fromTable(
    db.watchHistory,
    aliasName: 'channels__id__watch_history__channel_id',
  );

  $$WatchHistoryTableProcessedTableManager get watchHistoryRefs {
    final manager = $$WatchHistoryTableTableManager(
      $_db,
      $_db.watchHistory,
    ).filter((f) => f.channelId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_watchHistoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ScheduledRecordingsTable,
    List<ScheduledRecording>
  >
  _scheduledRecordingsRefsTable(_$IptvDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.scheduledRecordings,
        aliasName: 'channels__id__scheduled_recordings__channel_id',
      );

  $$ScheduledRecordingsTableProcessedTableManager get scheduledRecordingsRefs {
    final manager = $$ScheduledRecordingsTableTableManager(
      $_db,
      $_db.scheduledRecordings,
    ).filter((f) => f.channelId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _scheduledRecordingsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RemindersTable, List<Reminder>>
  _remindersRefsTable(_$IptvDatabase db) => MultiTypedResultKey.fromTable(
    db.reminders,
    aliasName: 'channels__id__reminders__channel_id',
  );

  $$RemindersTableProcessedTableManager get remindersRefs {
    final manager = $$RemindersTableTableManager(
      $_db,
      $_db.reminders,
    ).filter((f) => f.channelId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_remindersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChannelsTableFilterComposer
    extends Composer<_$IptvDatabase, $ChannelsTable> {
  $$ChannelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get streamUrl => $composableBuilder(
    column: $table.streamUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tvgId => $composableBuilder(
    column: $table.tvgId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get channelNumber => $composableBuilder(
    column: $table.channelNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVod => $composableBuilder(
    column: $table.isVod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get catchupMode => $composableBuilder(
    column: $table.catchupMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get catchupSource => $composableBuilder(
    column: $table.catchupSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get catchupDays => $composableBuilder(
    column: $table.catchupDays,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistsTableFilterComposer get playlistId {
    final $$PlaylistsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableFilterComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChannelGroupsTableFilterComposer get groupId {
    final $$ChannelGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.channelGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelGroupsTableFilterComposer(
            $db: $db,
            $table: $db.channelGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> watchHistoryRefs(
    Expression<bool> Function($$WatchHistoryTableFilterComposer f) f,
  ) {
    final $$WatchHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.watchHistory,
      getReferencedColumn: (t) => t.channelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WatchHistoryTableFilterComposer(
            $db: $db,
            $table: $db.watchHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> scheduledRecordingsRefs(
    Expression<bool> Function($$ScheduledRecordingsTableFilterComposer f) f,
  ) {
    final $$ScheduledRecordingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduledRecordings,
      getReferencedColumn: (t) => t.channelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduledRecordingsTableFilterComposer(
            $db: $db,
            $table: $db.scheduledRecordings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> remindersRefs(
    Expression<bool> Function($$RemindersTableFilterComposer f) f,
  ) {
    final $$RemindersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.channelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableFilterComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChannelsTableOrderingComposer
    extends Composer<_$IptvDatabase, $ChannelsTable> {
  $$ChannelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get streamUrl => $composableBuilder(
    column: $table.streamUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tvgId => $composableBuilder(
    column: $table.tvgId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get channelNumber => $composableBuilder(
    column: $table.channelNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVod => $composableBuilder(
    column: $table.isVod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get catchupMode => $composableBuilder(
    column: $table.catchupMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get catchupSource => $composableBuilder(
    column: $table.catchupSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get catchupDays => $composableBuilder(
    column: $table.catchupDays,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistsTableOrderingComposer get playlistId {
    final $$PlaylistsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableOrderingComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChannelGroupsTableOrderingComposer get groupId {
    final $$ChannelGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.channelGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.channelGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChannelsTableAnnotationComposer
    extends Composer<_$IptvDatabase, $ChannelsTable> {
  $$ChannelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get streamUrl =>
      $composableBuilder(column: $table.streamUrl, builder: (column) => column);

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  GeneratedColumn<String> get tvgId =>
      $composableBuilder(column: $table.tvgId, builder: (column) => column);

  GeneratedColumn<int> get channelNumber => $composableBuilder(
    column: $table.channelNumber,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isVod =>
      $composableBuilder(column: $table.isVod, builder: (column) => column);

  GeneratedColumn<String> get catchupMode => $composableBuilder(
    column: $table.catchupMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get catchupSource => $composableBuilder(
    column: $table.catchupSource,
    builder: (column) => column,
  );

  GeneratedColumn<int> get catchupDays => $composableBuilder(
    column: $table.catchupDays,
    builder: (column) => column,
  );

  $$PlaylistsTableAnnotationComposer get playlistId {
    final $$PlaylistsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableAnnotationComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChannelGroupsTableAnnotationComposer get groupId {
    final $$ChannelGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.channelGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.channelGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> watchHistoryRefs<T extends Object>(
    Expression<T> Function($$WatchHistoryTableAnnotationComposer a) f,
  ) {
    final $$WatchHistoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.watchHistory,
      getReferencedColumn: (t) => t.channelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WatchHistoryTableAnnotationComposer(
            $db: $db,
            $table: $db.watchHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> scheduledRecordingsRefs<T extends Object>(
    Expression<T> Function($$ScheduledRecordingsTableAnnotationComposer a) f,
  ) {
    final $$ScheduledRecordingsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scheduledRecordings,
          getReferencedColumn: (t) => t.channelId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduledRecordingsTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduledRecordings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> remindersRefs<T extends Object>(
    Expression<T> Function($$RemindersTableAnnotationComposer a) f,
  ) {
    final $$RemindersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.channelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableAnnotationComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChannelsTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $ChannelsTable,
          Channel,
          $$ChannelsTableFilterComposer,
          $$ChannelsTableOrderingComposer,
          $$ChannelsTableAnnotationComposer,
          $$ChannelsTableCreateCompanionBuilder,
          $$ChannelsTableUpdateCompanionBuilder,
          (Channel, $$ChannelsTableReferences),
          Channel,
          PrefetchHooks Function({
            bool playlistId,
            bool groupId,
            bool watchHistoryRefs,
            bool scheduledRecordingsRefs,
            bool remindersRefs,
          })
        > {
  $$ChannelsTableTableManager(_$IptvDatabase db, $ChannelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChannelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChannelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChannelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<int?> groupId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> streamUrl = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<String?> tvgId = const Value.absent(),
                Value<int?> channelNumber = const Value.absent(),
                Value<bool> isVod = const Value.absent(),
                Value<String?> catchupMode = const Value.absent(),
                Value<String?> catchupSource = const Value.absent(),
                Value<int?> catchupDays = const Value.absent(),
              }) => ChannelsCompanion(
                id: id,
                playlistId: playlistId,
                groupId: groupId,
                name: name,
                streamUrl: streamUrl,
                logoUrl: logoUrl,
                tvgId: tvgId,
                channelNumber: channelNumber,
                isVod: isVod,
                catchupMode: catchupMode,
                catchupSource: catchupSource,
                catchupDays: catchupDays,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playlistId,
                Value<int?> groupId = const Value.absent(),
                required String name,
                required String streamUrl,
                Value<String?> logoUrl = const Value.absent(),
                Value<String?> tvgId = const Value.absent(),
                Value<int?> channelNumber = const Value.absent(),
                Value<bool> isVod = const Value.absent(),
                Value<String?> catchupMode = const Value.absent(),
                Value<String?> catchupSource = const Value.absent(),
                Value<int?> catchupDays = const Value.absent(),
              }) => ChannelsCompanion.insert(
                id: id,
                playlistId: playlistId,
                groupId: groupId,
                name: name,
                streamUrl: streamUrl,
                logoUrl: logoUrl,
                tvgId: tvgId,
                channelNumber: channelNumber,
                isVod: isVod,
                catchupMode: catchupMode,
                catchupSource: catchupSource,
                catchupDays: catchupDays,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChannelsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                playlistId = false,
                groupId = false,
                watchHistoryRefs = false,
                scheduledRecordingsRefs = false,
                remindersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (watchHistoryRefs) db.watchHistory,
                    if (scheduledRecordingsRefs) db.scheduledRecordings,
                    if (remindersRefs) db.reminders,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (playlistId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.playlistId,
                                    referencedTable: $$ChannelsTableReferences
                                        ._playlistIdTable(db),
                                    referencedColumn: $$ChannelsTableReferences
                                        ._playlistIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (groupId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.groupId,
                                    referencedTable: $$ChannelsTableReferences
                                        ._groupIdTable(db),
                                    referencedColumn: $$ChannelsTableReferences
                                        ._groupIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (watchHistoryRefs)
                        await $_getPrefetchedData<
                          Channel,
                          $ChannelsTable,
                          WatchHistoryData
                        >(
                          currentTable: table,
                          referencedTable: $$ChannelsTableReferences
                              ._watchHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChannelsTableReferences(
                                db,
                                table,
                                p0,
                              ).watchHistoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.channelId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (scheduledRecordingsRefs)
                        await $_getPrefetchedData<
                          Channel,
                          $ChannelsTable,
                          ScheduledRecording
                        >(
                          currentTable: table,
                          referencedTable: $$ChannelsTableReferences
                              ._scheduledRecordingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChannelsTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduledRecordingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.channelId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (remindersRefs)
                        await $_getPrefetchedData<
                          Channel,
                          $ChannelsTable,
                          Reminder
                        >(
                          currentTable: table,
                          referencedTable: $$ChannelsTableReferences
                              ._remindersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChannelsTableReferences(
                                db,
                                table,
                                p0,
                              ).remindersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.channelId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ChannelsTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $ChannelsTable,
      Channel,
      $$ChannelsTableFilterComposer,
      $$ChannelsTableOrderingComposer,
      $$ChannelsTableAnnotationComposer,
      $$ChannelsTableCreateCompanionBuilder,
      $$ChannelsTableUpdateCompanionBuilder,
      (Channel, $$ChannelsTableReferences),
      Channel,
      PrefetchHooks Function({
        bool playlistId,
        bool groupId,
        bool watchHistoryRefs,
        bool scheduledRecordingsRefs,
        bool remindersRefs,
      })
    >;
typedef $$ChannelEditsTableCreateCompanionBuilder =
    ChannelEditsCompanion Function({
      Value<int> id,
      required int playlistId,
      required String streamUrl,
      Value<String?> name,
      Value<bool> numberEdited,
      Value<int?> channelNumber,
      Value<bool> removed,
    });
typedef $$ChannelEditsTableUpdateCompanionBuilder =
    ChannelEditsCompanion Function({
      Value<int> id,
      Value<int> playlistId,
      Value<String> streamUrl,
      Value<String?> name,
      Value<bool> numberEdited,
      Value<int?> channelNumber,
      Value<bool> removed,
    });

final class $$ChannelEditsTableReferences
    extends BaseReferences<_$IptvDatabase, $ChannelEditsTable, ChannelEdit> {
  $$ChannelEditsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlaylistsTable _playlistIdTable(_$IptvDatabase db) =>
      db.playlists.createAlias('channel_edits__playlist_id__playlists__id');

  $$PlaylistsTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistsTableTableManager(
      $_db,
      $_db.playlists,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ChannelEditsTableFilterComposer
    extends Composer<_$IptvDatabase, $ChannelEditsTable> {
  $$ChannelEditsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get streamUrl => $composableBuilder(
    column: $table.streamUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get numberEdited => $composableBuilder(
    column: $table.numberEdited,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get channelNumber => $composableBuilder(
    column: $table.channelNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get removed => $composableBuilder(
    column: $table.removed,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistsTableFilterComposer get playlistId {
    final $$PlaylistsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableFilterComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChannelEditsTableOrderingComposer
    extends Composer<_$IptvDatabase, $ChannelEditsTable> {
  $$ChannelEditsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get streamUrl => $composableBuilder(
    column: $table.streamUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get numberEdited => $composableBuilder(
    column: $table.numberEdited,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get channelNumber => $composableBuilder(
    column: $table.channelNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get removed => $composableBuilder(
    column: $table.removed,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistsTableOrderingComposer get playlistId {
    final $$PlaylistsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableOrderingComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChannelEditsTableAnnotationComposer
    extends Composer<_$IptvDatabase, $ChannelEditsTable> {
  $$ChannelEditsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get streamUrl =>
      $composableBuilder(column: $table.streamUrl, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get numberEdited => $composableBuilder(
    column: $table.numberEdited,
    builder: (column) => column,
  );

  GeneratedColumn<int> get channelNumber => $composableBuilder(
    column: $table.channelNumber,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get removed =>
      $composableBuilder(column: $table.removed, builder: (column) => column);

  $$PlaylistsTableAnnotationComposer get playlistId {
    final $$PlaylistsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableAnnotationComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChannelEditsTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $ChannelEditsTable,
          ChannelEdit,
          $$ChannelEditsTableFilterComposer,
          $$ChannelEditsTableOrderingComposer,
          $$ChannelEditsTableAnnotationComposer,
          $$ChannelEditsTableCreateCompanionBuilder,
          $$ChannelEditsTableUpdateCompanionBuilder,
          (ChannelEdit, $$ChannelEditsTableReferences),
          ChannelEdit,
          PrefetchHooks Function({bool playlistId})
        > {
  $$ChannelEditsTableTableManager(_$IptvDatabase db, $ChannelEditsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChannelEditsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChannelEditsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChannelEditsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<String> streamUrl = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<bool> numberEdited = const Value.absent(),
                Value<int?> channelNumber = const Value.absent(),
                Value<bool> removed = const Value.absent(),
              }) => ChannelEditsCompanion(
                id: id,
                playlistId: playlistId,
                streamUrl: streamUrl,
                name: name,
                numberEdited: numberEdited,
                channelNumber: channelNumber,
                removed: removed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playlistId,
                required String streamUrl,
                Value<String?> name = const Value.absent(),
                Value<bool> numberEdited = const Value.absent(),
                Value<int?> channelNumber = const Value.absent(),
                Value<bool> removed = const Value.absent(),
              }) => ChannelEditsCompanion.insert(
                id: id,
                playlistId: playlistId,
                streamUrl: streamUrl,
                name: name,
                numberEdited: numberEdited,
                channelNumber: channelNumber,
                removed: removed,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChannelEditsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playlistId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable: $$ChannelEditsTableReferences
                                    ._playlistIdTable(db),
                                referencedColumn: $$ChannelEditsTableReferences
                                    ._playlistIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ChannelEditsTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $ChannelEditsTable,
      ChannelEdit,
      $$ChannelEditsTableFilterComposer,
      $$ChannelEditsTableOrderingComposer,
      $$ChannelEditsTableAnnotationComposer,
      $$ChannelEditsTableCreateCompanionBuilder,
      $$ChannelEditsTableUpdateCompanionBuilder,
      (ChannelEdit, $$ChannelEditsTableReferences),
      ChannelEdit,
      PrefetchHooks Function({bool playlistId})
    >;
typedef $$EpgProgramsTableCreateCompanionBuilder =
    EpgProgramsCompanion Function({
      Value<int> id,
      required String channelTvgId,
      required String title,
      Value<String?> description,
      required DateTime startTime,
      required DateTime endTime,
      Value<String?> category,
      Value<String?> icon,
      Value<String?> episodeTitle,
      Value<bool> isMovie,
      Value<bool> isSeries,
      Value<bool> isSports,
      Value<bool> isNews,
      Value<bool> isKids,
    });
typedef $$EpgProgramsTableUpdateCompanionBuilder =
    EpgProgramsCompanion Function({
      Value<int> id,
      Value<String> channelTvgId,
      Value<String> title,
      Value<String?> description,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
      Value<String?> category,
      Value<String?> icon,
      Value<String?> episodeTitle,
      Value<bool> isMovie,
      Value<bool> isSeries,
      Value<bool> isSports,
      Value<bool> isNews,
      Value<bool> isKids,
    });

class $$EpgProgramsTableFilterComposer
    extends Composer<_$IptvDatabase, $EpgProgramsTable> {
  $$EpgProgramsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channelTvgId => $composableBuilder(
    column: $table.channelTvgId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get episodeTitle => $composableBuilder(
    column: $table.episodeTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMovie => $composableBuilder(
    column: $table.isMovie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSeries => $composableBuilder(
    column: $table.isSeries,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSports => $composableBuilder(
    column: $table.isSports,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isNews => $composableBuilder(
    column: $table.isNews,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isKids => $composableBuilder(
    column: $table.isKids,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EpgProgramsTableOrderingComposer
    extends Composer<_$IptvDatabase, $EpgProgramsTable> {
  $$EpgProgramsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channelTvgId => $composableBuilder(
    column: $table.channelTvgId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get episodeTitle => $composableBuilder(
    column: $table.episodeTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMovie => $composableBuilder(
    column: $table.isMovie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSeries => $composableBuilder(
    column: $table.isSeries,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSports => $composableBuilder(
    column: $table.isSports,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isNews => $composableBuilder(
    column: $table.isNews,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isKids => $composableBuilder(
    column: $table.isKids,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EpgProgramsTableAnnotationComposer
    extends Composer<_$IptvDatabase, $EpgProgramsTable> {
  $$EpgProgramsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get channelTvgId => $composableBuilder(
    column: $table.channelTvgId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get episodeTitle => $composableBuilder(
    column: $table.episodeTitle,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isMovie =>
      $composableBuilder(column: $table.isMovie, builder: (column) => column);

  GeneratedColumn<bool> get isSeries =>
      $composableBuilder(column: $table.isSeries, builder: (column) => column);

  GeneratedColumn<bool> get isSports =>
      $composableBuilder(column: $table.isSports, builder: (column) => column);

  GeneratedColumn<bool> get isNews =>
      $composableBuilder(column: $table.isNews, builder: (column) => column);

  GeneratedColumn<bool> get isKids =>
      $composableBuilder(column: $table.isKids, builder: (column) => column);
}

class $$EpgProgramsTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $EpgProgramsTable,
          EpgProgram,
          $$EpgProgramsTableFilterComposer,
          $$EpgProgramsTableOrderingComposer,
          $$EpgProgramsTableAnnotationComposer,
          $$EpgProgramsTableCreateCompanionBuilder,
          $$EpgProgramsTableUpdateCompanionBuilder,
          (
            EpgProgram,
            BaseReferences<_$IptvDatabase, $EpgProgramsTable, EpgProgram>,
          ),
          EpgProgram,
          PrefetchHooks Function()
        > {
  $$EpgProgramsTableTableManager(_$IptvDatabase db, $EpgProgramsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EpgProgramsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EpgProgramsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EpgProgramsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> channelTvgId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime> endTime = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<String?> episodeTitle = const Value.absent(),
                Value<bool> isMovie = const Value.absent(),
                Value<bool> isSeries = const Value.absent(),
                Value<bool> isSports = const Value.absent(),
                Value<bool> isNews = const Value.absent(),
                Value<bool> isKids = const Value.absent(),
              }) => EpgProgramsCompanion(
                id: id,
                channelTvgId: channelTvgId,
                title: title,
                description: description,
                startTime: startTime,
                endTime: endTime,
                category: category,
                icon: icon,
                episodeTitle: episodeTitle,
                isMovie: isMovie,
                isSeries: isSeries,
                isSports: isSports,
                isNews: isNews,
                isKids: isKids,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String channelTvgId,
                required String title,
                Value<String?> description = const Value.absent(),
                required DateTime startTime,
                required DateTime endTime,
                Value<String?> category = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<String?> episodeTitle = const Value.absent(),
                Value<bool> isMovie = const Value.absent(),
                Value<bool> isSeries = const Value.absent(),
                Value<bool> isSports = const Value.absent(),
                Value<bool> isNews = const Value.absent(),
                Value<bool> isKids = const Value.absent(),
              }) => EpgProgramsCompanion.insert(
                id: id,
                channelTvgId: channelTvgId,
                title: title,
                description: description,
                startTime: startTime,
                endTime: endTime,
                category: category,
                icon: icon,
                episodeTitle: episodeTitle,
                isMovie: isMovie,
                isSeries: isSeries,
                isSports: isSports,
                isNews: isNews,
                isKids: isKids,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EpgProgramsTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $EpgProgramsTable,
      EpgProgram,
      $$EpgProgramsTableFilterComposer,
      $$EpgProgramsTableOrderingComposer,
      $$EpgProgramsTableAnnotationComposer,
      $$EpgProgramsTableCreateCompanionBuilder,
      $$EpgProgramsTableUpdateCompanionBuilder,
      (
        EpgProgram,
        BaseReferences<_$IptvDatabase, $EpgProgramsTable, EpgProgram>,
      ),
      EpgProgram,
      PrefetchHooks Function()
    >;
typedef $$EpgSourcesTableCreateCompanionBuilder =
    EpgSourcesCompanion Function({
      Value<int> id,
      required int playlistId,
      required String url,
      Value<DateTime?> lastFetched,
    });
typedef $$EpgSourcesTableUpdateCompanionBuilder =
    EpgSourcesCompanion Function({
      Value<int> id,
      Value<int> playlistId,
      Value<String> url,
      Value<DateTime?> lastFetched,
    });

final class $$EpgSourcesTableReferences
    extends BaseReferences<_$IptvDatabase, $EpgSourcesTable, EpgSource> {
  $$EpgSourcesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlaylistsTable _playlistIdTable(_$IptvDatabase db) =>
      db.playlists.createAlias('epg_sources__playlist_id__playlists__id');

  $$PlaylistsTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistsTableTableManager(
      $_db,
      $_db.playlists,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EpgSourcesTableFilterComposer
    extends Composer<_$IptvDatabase, $EpgSourcesTable> {
  $$EpgSourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastFetched => $composableBuilder(
    column: $table.lastFetched,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistsTableFilterComposer get playlistId {
    final $$PlaylistsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableFilterComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EpgSourcesTableOrderingComposer
    extends Composer<_$IptvDatabase, $EpgSourcesTable> {
  $$EpgSourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastFetched => $composableBuilder(
    column: $table.lastFetched,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistsTableOrderingComposer get playlistId {
    final $$PlaylistsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableOrderingComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EpgSourcesTableAnnotationComposer
    extends Composer<_$IptvDatabase, $EpgSourcesTable> {
  $$EpgSourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<DateTime> get lastFetched => $composableBuilder(
    column: $table.lastFetched,
    builder: (column) => column,
  );

  $$PlaylistsTableAnnotationComposer get playlistId {
    final $$PlaylistsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableAnnotationComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EpgSourcesTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $EpgSourcesTable,
          EpgSource,
          $$EpgSourcesTableFilterComposer,
          $$EpgSourcesTableOrderingComposer,
          $$EpgSourcesTableAnnotationComposer,
          $$EpgSourcesTableCreateCompanionBuilder,
          $$EpgSourcesTableUpdateCompanionBuilder,
          (EpgSource, $$EpgSourcesTableReferences),
          EpgSource,
          PrefetchHooks Function({bool playlistId})
        > {
  $$EpgSourcesTableTableManager(_$IptvDatabase db, $EpgSourcesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EpgSourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EpgSourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EpgSourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<DateTime?> lastFetched = const Value.absent(),
              }) => EpgSourcesCompanion(
                id: id,
                playlistId: playlistId,
                url: url,
                lastFetched: lastFetched,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playlistId,
                required String url,
                Value<DateTime?> lastFetched = const Value.absent(),
              }) => EpgSourcesCompanion.insert(
                id: id,
                playlistId: playlistId,
                url: url,
                lastFetched: lastFetched,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EpgSourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playlistId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable: $$EpgSourcesTableReferences
                                    ._playlistIdTable(db),
                                referencedColumn: $$EpgSourcesTableReferences
                                    ._playlistIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EpgSourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $EpgSourcesTable,
      EpgSource,
      $$EpgSourcesTableFilterComposer,
      $$EpgSourcesTableOrderingComposer,
      $$EpgSourcesTableAnnotationComposer,
      $$EpgSourcesTableCreateCompanionBuilder,
      $$EpgSourcesTableUpdateCompanionBuilder,
      (EpgSource, $$EpgSourcesTableReferences),
      EpgSource,
      PrefetchHooks Function({bool playlistId})
    >;
typedef $$FavoritesTableCreateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> id,
      required String profileId,
      required String itemKind,
      required int refId,
    });
typedef $$FavoritesTableUpdateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> id,
      Value<String> profileId,
      Value<String> itemKind,
      Value<int> refId,
    });

class $$FavoritesTableFilterComposer
    extends Composer<_$IptvDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemKind => $composableBuilder(
    column: $table.itemKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$IptvDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemKind => $composableBuilder(
    column: $table.itemKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$IptvDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get itemKind =>
      $composableBuilder(column: $table.itemKind, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);
}

class $$FavoritesTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $FavoritesTable,
          Favorite,
          $$FavoritesTableFilterComposer,
          $$FavoritesTableOrderingComposer,
          $$FavoritesTableAnnotationComposer,
          $$FavoritesTableCreateCompanionBuilder,
          $$FavoritesTableUpdateCompanionBuilder,
          (Favorite, BaseReferences<_$IptvDatabase, $FavoritesTable, Favorite>),
          Favorite,
          PrefetchHooks Function()
        > {
  $$FavoritesTableTableManager(_$IptvDatabase db, $FavoritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> profileId = const Value.absent(),
                Value<String> itemKind = const Value.absent(),
                Value<int> refId = const Value.absent(),
              }) => FavoritesCompanion(
                id: id,
                profileId: profileId,
                itemKind: itemKind,
                refId: refId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String profileId,
                required String itemKind,
                required int refId,
              }) => FavoritesCompanion.insert(
                id: id,
                profileId: profileId,
                itemKind: itemKind,
                refId: refId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $FavoritesTable,
      Favorite,
      $$FavoritesTableFilterComposer,
      $$FavoritesTableOrderingComposer,
      $$FavoritesTableAnnotationComposer,
      $$FavoritesTableCreateCompanionBuilder,
      $$FavoritesTableUpdateCompanionBuilder,
      (Favorite, BaseReferences<_$IptvDatabase, $FavoritesTable, Favorite>),
      Favorite,
      PrefetchHooks Function()
    >;
typedef $$WatchHistoryTableCreateCompanionBuilder =
    WatchHistoryCompanion Function({
      Value<int> id,
      required String profileId,
      Value<String> contentType,
      Value<int?> channelId,
      Value<int?> vodItemId,
      Value<int?> episodeId,
      Value<int> positionMs,
      Value<int?> durationMs,
      Value<bool> played,
      Value<DateTime> watchedAt,
    });
typedef $$WatchHistoryTableUpdateCompanionBuilder =
    WatchHistoryCompanion Function({
      Value<int> id,
      Value<String> profileId,
      Value<String> contentType,
      Value<int?> channelId,
      Value<int?> vodItemId,
      Value<int?> episodeId,
      Value<int> positionMs,
      Value<int?> durationMs,
      Value<bool> played,
      Value<DateTime> watchedAt,
    });

final class $$WatchHistoryTableReferences
    extends
        BaseReferences<_$IptvDatabase, $WatchHistoryTable, WatchHistoryData> {
  $$WatchHistoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ChannelsTable _channelIdTable(_$IptvDatabase db) =>
      db.channels.createAlias('watch_history__channel_id__channels__id');

  $$ChannelsTableProcessedTableManager? get channelId {
    final $_column = $_itemColumn<int>('channel_id');
    if ($_column == null) return null;
    final manager = $$ChannelsTableTableManager(
      $_db,
      $_db.channels,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_channelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WatchHistoryTableFilterComposer
    extends Composer<_$IptvDatabase, $WatchHistoryTable> {
  $$WatchHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vodItemId => $composableBuilder(
    column: $table.vodItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episodeId => $composableBuilder(
    column: $table.episodeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get positionMs => $composableBuilder(
    column: $table.positionMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get played => $composableBuilder(
    column: $table.played,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get watchedAt => $composableBuilder(
    column: $table.watchedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ChannelsTableFilterComposer get channelId {
    final $$ChannelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.channelId,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableFilterComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WatchHistoryTableOrderingComposer
    extends Composer<_$IptvDatabase, $WatchHistoryTable> {
  $$WatchHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vodItemId => $composableBuilder(
    column: $table.vodItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episodeId => $composableBuilder(
    column: $table.episodeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get positionMs => $composableBuilder(
    column: $table.positionMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get played => $composableBuilder(
    column: $table.played,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get watchedAt => $composableBuilder(
    column: $table.watchedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChannelsTableOrderingComposer get channelId {
    final $$ChannelsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.channelId,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableOrderingComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WatchHistoryTableAnnotationComposer
    extends Composer<_$IptvDatabase, $WatchHistoryTable> {
  $$WatchHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get vodItemId =>
      $composableBuilder(column: $table.vodItemId, builder: (column) => column);

  GeneratedColumn<int> get episodeId =>
      $composableBuilder(column: $table.episodeId, builder: (column) => column);

  GeneratedColumn<int> get positionMs => $composableBuilder(
    column: $table.positionMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get played =>
      $composableBuilder(column: $table.played, builder: (column) => column);

  GeneratedColumn<DateTime> get watchedAt =>
      $composableBuilder(column: $table.watchedAt, builder: (column) => column);

  $$ChannelsTableAnnotationComposer get channelId {
    final $$ChannelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.channelId,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableAnnotationComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WatchHistoryTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $WatchHistoryTable,
          WatchHistoryData,
          $$WatchHistoryTableFilterComposer,
          $$WatchHistoryTableOrderingComposer,
          $$WatchHistoryTableAnnotationComposer,
          $$WatchHistoryTableCreateCompanionBuilder,
          $$WatchHistoryTableUpdateCompanionBuilder,
          (WatchHistoryData, $$WatchHistoryTableReferences),
          WatchHistoryData,
          PrefetchHooks Function({bool channelId})
        > {
  $$WatchHistoryTableTableManager(_$IptvDatabase db, $WatchHistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WatchHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WatchHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WatchHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> profileId = const Value.absent(),
                Value<String> contentType = const Value.absent(),
                Value<int?> channelId = const Value.absent(),
                Value<int?> vodItemId = const Value.absent(),
                Value<int?> episodeId = const Value.absent(),
                Value<int> positionMs = const Value.absent(),
                Value<int?> durationMs = const Value.absent(),
                Value<bool> played = const Value.absent(),
                Value<DateTime> watchedAt = const Value.absent(),
              }) => WatchHistoryCompanion(
                id: id,
                profileId: profileId,
                contentType: contentType,
                channelId: channelId,
                vodItemId: vodItemId,
                episodeId: episodeId,
                positionMs: positionMs,
                durationMs: durationMs,
                played: played,
                watchedAt: watchedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String profileId,
                Value<String> contentType = const Value.absent(),
                Value<int?> channelId = const Value.absent(),
                Value<int?> vodItemId = const Value.absent(),
                Value<int?> episodeId = const Value.absent(),
                Value<int> positionMs = const Value.absent(),
                Value<int?> durationMs = const Value.absent(),
                Value<bool> played = const Value.absent(),
                Value<DateTime> watchedAt = const Value.absent(),
              }) => WatchHistoryCompanion.insert(
                id: id,
                profileId: profileId,
                contentType: contentType,
                channelId: channelId,
                vodItemId: vodItemId,
                episodeId: episodeId,
                positionMs: positionMs,
                durationMs: durationMs,
                played: played,
                watchedAt: watchedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WatchHistoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({channelId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (channelId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.channelId,
                                referencedTable: $$WatchHistoryTableReferences
                                    ._channelIdTable(db),
                                referencedColumn: $$WatchHistoryTableReferences
                                    ._channelIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WatchHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $WatchHistoryTable,
      WatchHistoryData,
      $$WatchHistoryTableFilterComposer,
      $$WatchHistoryTableOrderingComposer,
      $$WatchHistoryTableAnnotationComposer,
      $$WatchHistoryTableCreateCompanionBuilder,
      $$WatchHistoryTableUpdateCompanionBuilder,
      (WatchHistoryData, $$WatchHistoryTableReferences),
      WatchHistoryData,
      PrefetchHooks Function({bool channelId})
    >;
typedef $$EnabledGroupsTableCreateCompanionBuilder =
    EnabledGroupsCompanion Function({
      Value<int> id,
      required String profileId,
      required int groupId,
    });
typedef $$EnabledGroupsTableUpdateCompanionBuilder =
    EnabledGroupsCompanion Function({
      Value<int> id,
      Value<String> profileId,
      Value<int> groupId,
    });

class $$EnabledGroupsTableFilterComposer
    extends Composer<_$IptvDatabase, $EnabledGroupsTable> {
  $$EnabledGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get groupId => $composableBuilder(
    column: $table.groupId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EnabledGroupsTableOrderingComposer
    extends Composer<_$IptvDatabase, $EnabledGroupsTable> {
  $$EnabledGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get groupId => $composableBuilder(
    column: $table.groupId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EnabledGroupsTableAnnotationComposer
    extends Composer<_$IptvDatabase, $EnabledGroupsTable> {
  $$EnabledGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<int> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);
}

class $$EnabledGroupsTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $EnabledGroupsTable,
          EnabledGroup,
          $$EnabledGroupsTableFilterComposer,
          $$EnabledGroupsTableOrderingComposer,
          $$EnabledGroupsTableAnnotationComposer,
          $$EnabledGroupsTableCreateCompanionBuilder,
          $$EnabledGroupsTableUpdateCompanionBuilder,
          (
            EnabledGroup,
            BaseReferences<_$IptvDatabase, $EnabledGroupsTable, EnabledGroup>,
          ),
          EnabledGroup,
          PrefetchHooks Function()
        > {
  $$EnabledGroupsTableTableManager(_$IptvDatabase db, $EnabledGroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnabledGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EnabledGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EnabledGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> profileId = const Value.absent(),
                Value<int> groupId = const Value.absent(),
              }) => EnabledGroupsCompanion(
                id: id,
                profileId: profileId,
                groupId: groupId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String profileId,
                required int groupId,
              }) => EnabledGroupsCompanion.insert(
                id: id,
                profileId: profileId,
                groupId: groupId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EnabledGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $EnabledGroupsTable,
      EnabledGroup,
      $$EnabledGroupsTableFilterComposer,
      $$EnabledGroupsTableOrderingComposer,
      $$EnabledGroupsTableAnnotationComposer,
      $$EnabledGroupsTableCreateCompanionBuilder,
      $$EnabledGroupsTableUpdateCompanionBuilder,
      (
        EnabledGroup,
        BaseReferences<_$IptvDatabase, $EnabledGroupsTable, EnabledGroup>,
      ),
      EnabledGroup,
      PrefetchHooks Function()
    >;
typedef $$VodItemsTableCreateCompanionBuilder =
    VodItemsCompanion Function({
      Value<int> id,
      required int playlistId,
      required int streamId,
      required String name,
      Value<String?> streamIcon,
      Value<String?> containerExtension,
      Value<String?> plot,
      Value<String?> genre,
      Value<int?> year,
      Value<double?> rating,
      Value<int?> durationSeconds,
      Value<String?> backdropUrl,
      Value<String?> logoUrl,
      Value<String?> tagline,
      Value<int?> tmdbId,
      Value<bool> isSeries,
      Value<DateTime> addedAt,
    });
typedef $$VodItemsTableUpdateCompanionBuilder =
    VodItemsCompanion Function({
      Value<int> id,
      Value<int> playlistId,
      Value<int> streamId,
      Value<String> name,
      Value<String?> streamIcon,
      Value<String?> containerExtension,
      Value<String?> plot,
      Value<String?> genre,
      Value<int?> year,
      Value<double?> rating,
      Value<int?> durationSeconds,
      Value<String?> backdropUrl,
      Value<String?> logoUrl,
      Value<String?> tagline,
      Value<int?> tmdbId,
      Value<bool> isSeries,
      Value<DateTime> addedAt,
    });

final class $$VodItemsTableReferences
    extends BaseReferences<_$IptvDatabase, $VodItemsTable, VodItem> {
  $$VodItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlaylistsTable _playlistIdTable(_$IptvDatabase db) =>
      db.playlists.createAlias('vod_items__playlist_id__playlists__id');

  $$PlaylistsTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistsTableTableManager(
      $_db,
      $_db.playlists,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VodItemsTableFilterComposer
    extends Composer<_$IptvDatabase, $VodItemsTable> {
  $$VodItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get streamId => $composableBuilder(
    column: $table.streamId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get streamIcon => $composableBuilder(
    column: $table.streamIcon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get containerExtension => $composableBuilder(
    column: $table.containerExtension,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plot => $composableBuilder(
    column: $table.plot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get genre => $composableBuilder(
    column: $table.genre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backdropUrl => $composableBuilder(
    column: $table.backdropUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagline => $composableBuilder(
    column: $table.tagline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSeries => $composableBuilder(
    column: $table.isSeries,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistsTableFilterComposer get playlistId {
    final $$PlaylistsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableFilterComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VodItemsTableOrderingComposer
    extends Composer<_$IptvDatabase, $VodItemsTable> {
  $$VodItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get streamId => $composableBuilder(
    column: $table.streamId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get streamIcon => $composableBuilder(
    column: $table.streamIcon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get containerExtension => $composableBuilder(
    column: $table.containerExtension,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plot => $composableBuilder(
    column: $table.plot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genre => $composableBuilder(
    column: $table.genre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backdropUrl => $composableBuilder(
    column: $table.backdropUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagline => $composableBuilder(
    column: $table.tagline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSeries => $composableBuilder(
    column: $table.isSeries,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistsTableOrderingComposer get playlistId {
    final $$PlaylistsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableOrderingComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VodItemsTableAnnotationComposer
    extends Composer<_$IptvDatabase, $VodItemsTable> {
  $$VodItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get streamId =>
      $composableBuilder(column: $table.streamId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get streamIcon => $composableBuilder(
    column: $table.streamIcon,
    builder: (column) => column,
  );

  GeneratedColumn<String> get containerExtension => $composableBuilder(
    column: $table.containerExtension,
    builder: (column) => column,
  );

  GeneratedColumn<String> get plot =>
      $composableBuilder(column: $table.plot, builder: (column) => column);

  GeneratedColumn<String> get genre =>
      $composableBuilder(column: $table.genre, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get backdropUrl => $composableBuilder(
    column: $table.backdropUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  GeneratedColumn<String> get tagline =>
      $composableBuilder(column: $table.tagline, builder: (column) => column);

  GeneratedColumn<int> get tmdbId =>
      $composableBuilder(column: $table.tmdbId, builder: (column) => column);

  GeneratedColumn<bool> get isSeries =>
      $composableBuilder(column: $table.isSeries, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$PlaylistsTableAnnotationComposer get playlistId {
    final $$PlaylistsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableAnnotationComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VodItemsTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $VodItemsTable,
          VodItem,
          $$VodItemsTableFilterComposer,
          $$VodItemsTableOrderingComposer,
          $$VodItemsTableAnnotationComposer,
          $$VodItemsTableCreateCompanionBuilder,
          $$VodItemsTableUpdateCompanionBuilder,
          (VodItem, $$VodItemsTableReferences),
          VodItem,
          PrefetchHooks Function({bool playlistId})
        > {
  $$VodItemsTableTableManager(_$IptvDatabase db, $VodItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VodItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VodItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VodItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<int> streamId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> streamIcon = const Value.absent(),
                Value<String?> containerExtension = const Value.absent(),
                Value<String?> plot = const Value.absent(),
                Value<String?> genre = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<double?> rating = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<String?> backdropUrl = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<String?> tagline = const Value.absent(),
                Value<int?> tmdbId = const Value.absent(),
                Value<bool> isSeries = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) => VodItemsCompanion(
                id: id,
                playlistId: playlistId,
                streamId: streamId,
                name: name,
                streamIcon: streamIcon,
                containerExtension: containerExtension,
                plot: plot,
                genre: genre,
                year: year,
                rating: rating,
                durationSeconds: durationSeconds,
                backdropUrl: backdropUrl,
                logoUrl: logoUrl,
                tagline: tagline,
                tmdbId: tmdbId,
                isSeries: isSeries,
                addedAt: addedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playlistId,
                required int streamId,
                required String name,
                Value<String?> streamIcon = const Value.absent(),
                Value<String?> containerExtension = const Value.absent(),
                Value<String?> plot = const Value.absent(),
                Value<String?> genre = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<double?> rating = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<String?> backdropUrl = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<String?> tagline = const Value.absent(),
                Value<int?> tmdbId = const Value.absent(),
                Value<bool> isSeries = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) => VodItemsCompanion.insert(
                id: id,
                playlistId: playlistId,
                streamId: streamId,
                name: name,
                streamIcon: streamIcon,
                containerExtension: containerExtension,
                plot: plot,
                genre: genre,
                year: year,
                rating: rating,
                durationSeconds: durationSeconds,
                backdropUrl: backdropUrl,
                logoUrl: logoUrl,
                tagline: tagline,
                tmdbId: tmdbId,
                isSeries: isSeries,
                addedAt: addedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VodItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playlistId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable: $$VodItemsTableReferences
                                    ._playlistIdTable(db),
                                referencedColumn: $$VodItemsTableReferences
                                    ._playlistIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VodItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $VodItemsTable,
      VodItem,
      $$VodItemsTableFilterComposer,
      $$VodItemsTableOrderingComposer,
      $$VodItemsTableAnnotationComposer,
      $$VodItemsTableCreateCompanionBuilder,
      $$VodItemsTableUpdateCompanionBuilder,
      (VodItem, $$VodItemsTableReferences),
      VodItem,
      PrefetchHooks Function({bool playlistId})
    >;
typedef $$SeriesSeasonsTableCreateCompanionBuilder =
    SeriesSeasonsCompanion Function({
      Value<int> id,
      required int playlistId,
      required int seriesId,
      required int seasonNumber,
      Value<String?> coverUrl,
      Value<int?> episodeCount,
    });
typedef $$SeriesSeasonsTableUpdateCompanionBuilder =
    SeriesSeasonsCompanion Function({
      Value<int> id,
      Value<int> playlistId,
      Value<int> seriesId,
      Value<int> seasonNumber,
      Value<String?> coverUrl,
      Value<int?> episodeCount,
    });

final class $$SeriesSeasonsTableReferences
    extends BaseReferences<_$IptvDatabase, $SeriesSeasonsTable, SeriesSeason> {
  $$SeriesSeasonsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PlaylistsTable _playlistIdTable(_$IptvDatabase db) =>
      db.playlists.createAlias('series_seasons__playlist_id__playlists__id');

  $$PlaylistsTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistsTableTableManager(
      $_db,
      $_db.playlists,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SeriesSeasonsTableFilterComposer
    extends Composer<_$IptvDatabase, $SeriesSeasonsTable> {
  $$SeriesSeasonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seriesId => $composableBuilder(
    column: $table.seriesId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverUrl => $composableBuilder(
    column: $table.coverUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episodeCount => $composableBuilder(
    column: $table.episodeCount,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistsTableFilterComposer get playlistId {
    final $$PlaylistsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableFilterComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeriesSeasonsTableOrderingComposer
    extends Composer<_$IptvDatabase, $SeriesSeasonsTable> {
  $$SeriesSeasonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seriesId => $composableBuilder(
    column: $table.seriesId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverUrl => $composableBuilder(
    column: $table.coverUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episodeCount => $composableBuilder(
    column: $table.episodeCount,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistsTableOrderingComposer get playlistId {
    final $$PlaylistsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableOrderingComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeriesSeasonsTableAnnotationComposer
    extends Composer<_$IptvDatabase, $SeriesSeasonsTable> {
  $$SeriesSeasonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get seriesId =>
      $composableBuilder(column: $table.seriesId, builder: (column) => column);

  GeneratedColumn<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverUrl =>
      $composableBuilder(column: $table.coverUrl, builder: (column) => column);

  GeneratedColumn<int> get episodeCount => $composableBuilder(
    column: $table.episodeCount,
    builder: (column) => column,
  );

  $$PlaylistsTableAnnotationComposer get playlistId {
    final $$PlaylistsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableAnnotationComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeriesSeasonsTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $SeriesSeasonsTable,
          SeriesSeason,
          $$SeriesSeasonsTableFilterComposer,
          $$SeriesSeasonsTableOrderingComposer,
          $$SeriesSeasonsTableAnnotationComposer,
          $$SeriesSeasonsTableCreateCompanionBuilder,
          $$SeriesSeasonsTableUpdateCompanionBuilder,
          (SeriesSeason, $$SeriesSeasonsTableReferences),
          SeriesSeason,
          PrefetchHooks Function({bool playlistId})
        > {
  $$SeriesSeasonsTableTableManager(_$IptvDatabase db, $SeriesSeasonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeriesSeasonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeriesSeasonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeriesSeasonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<int> seriesId = const Value.absent(),
                Value<int> seasonNumber = const Value.absent(),
                Value<String?> coverUrl = const Value.absent(),
                Value<int?> episodeCount = const Value.absent(),
              }) => SeriesSeasonsCompanion(
                id: id,
                playlistId: playlistId,
                seriesId: seriesId,
                seasonNumber: seasonNumber,
                coverUrl: coverUrl,
                episodeCount: episodeCount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playlistId,
                required int seriesId,
                required int seasonNumber,
                Value<String?> coverUrl = const Value.absent(),
                Value<int?> episodeCount = const Value.absent(),
              }) => SeriesSeasonsCompanion.insert(
                id: id,
                playlistId: playlistId,
                seriesId: seriesId,
                seasonNumber: seasonNumber,
                coverUrl: coverUrl,
                episodeCount: episodeCount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SeriesSeasonsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playlistId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable: $$SeriesSeasonsTableReferences
                                    ._playlistIdTable(db),
                                referencedColumn: $$SeriesSeasonsTableReferences
                                    ._playlistIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SeriesSeasonsTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $SeriesSeasonsTable,
      SeriesSeason,
      $$SeriesSeasonsTableFilterComposer,
      $$SeriesSeasonsTableOrderingComposer,
      $$SeriesSeasonsTableAnnotationComposer,
      $$SeriesSeasonsTableCreateCompanionBuilder,
      $$SeriesSeasonsTableUpdateCompanionBuilder,
      (SeriesSeason, $$SeriesSeasonsTableReferences),
      SeriesSeason,
      PrefetchHooks Function({bool playlistId})
    >;
typedef $$SeriesEpisodesTableCreateCompanionBuilder =
    SeriesEpisodesCompanion Function({
      Value<int> id,
      required int playlistId,
      required int seriesId,
      required int episodeId,
      required int seasonNumber,
      Value<int?> episodeNumber,
      required String title,
      Value<String?> plot,
      Value<int?> durationSeconds,
      Value<String?> containerExtension,
      Value<String?> stillUrl,
      Value<double?> rating,
      Value<DateTime?> airDate,
    });
typedef $$SeriesEpisodesTableUpdateCompanionBuilder =
    SeriesEpisodesCompanion Function({
      Value<int> id,
      Value<int> playlistId,
      Value<int> seriesId,
      Value<int> episodeId,
      Value<int> seasonNumber,
      Value<int?> episodeNumber,
      Value<String> title,
      Value<String?> plot,
      Value<int?> durationSeconds,
      Value<String?> containerExtension,
      Value<String?> stillUrl,
      Value<double?> rating,
      Value<DateTime?> airDate,
    });

final class $$SeriesEpisodesTableReferences
    extends
        BaseReferences<_$IptvDatabase, $SeriesEpisodesTable, SeriesEpisode> {
  $$SeriesEpisodesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PlaylistsTable _playlistIdTable(_$IptvDatabase db) =>
      db.playlists.createAlias('series_episodes__playlist_id__playlists__id');

  $$PlaylistsTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistsTableTableManager(
      $_db,
      $_db.playlists,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SeriesEpisodesTableFilterComposer
    extends Composer<_$IptvDatabase, $SeriesEpisodesTable> {
  $$SeriesEpisodesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seriesId => $composableBuilder(
    column: $table.seriesId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episodeId => $composableBuilder(
    column: $table.episodeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episodeNumber => $composableBuilder(
    column: $table.episodeNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plot => $composableBuilder(
    column: $table.plot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get containerExtension => $composableBuilder(
    column: $table.containerExtension,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stillUrl => $composableBuilder(
    column: $table.stillUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get airDate => $composableBuilder(
    column: $table.airDate,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistsTableFilterComposer get playlistId {
    final $$PlaylistsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableFilterComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeriesEpisodesTableOrderingComposer
    extends Composer<_$IptvDatabase, $SeriesEpisodesTable> {
  $$SeriesEpisodesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seriesId => $composableBuilder(
    column: $table.seriesId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episodeId => $composableBuilder(
    column: $table.episodeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episodeNumber => $composableBuilder(
    column: $table.episodeNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plot => $composableBuilder(
    column: $table.plot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get containerExtension => $composableBuilder(
    column: $table.containerExtension,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stillUrl => $composableBuilder(
    column: $table.stillUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get airDate => $composableBuilder(
    column: $table.airDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistsTableOrderingComposer get playlistId {
    final $$PlaylistsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableOrderingComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeriesEpisodesTableAnnotationComposer
    extends Composer<_$IptvDatabase, $SeriesEpisodesTable> {
  $$SeriesEpisodesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get seriesId =>
      $composableBuilder(column: $table.seriesId, builder: (column) => column);

  GeneratedColumn<int> get episodeId =>
      $composableBuilder(column: $table.episodeId, builder: (column) => column);

  GeneratedColumn<int> get seasonNumber => $composableBuilder(
    column: $table.seasonNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get episodeNumber => $composableBuilder(
    column: $table.episodeNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get plot =>
      $composableBuilder(column: $table.plot, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get containerExtension => $composableBuilder(
    column: $table.containerExtension,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stillUrl =>
      $composableBuilder(column: $table.stillUrl, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<DateTime> get airDate =>
      $composableBuilder(column: $table.airDate, builder: (column) => column);

  $$PlaylistsTableAnnotationComposer get playlistId {
    final $$PlaylistsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableAnnotationComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SeriesEpisodesTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $SeriesEpisodesTable,
          SeriesEpisode,
          $$SeriesEpisodesTableFilterComposer,
          $$SeriesEpisodesTableOrderingComposer,
          $$SeriesEpisodesTableAnnotationComposer,
          $$SeriesEpisodesTableCreateCompanionBuilder,
          $$SeriesEpisodesTableUpdateCompanionBuilder,
          (SeriesEpisode, $$SeriesEpisodesTableReferences),
          SeriesEpisode,
          PrefetchHooks Function({bool playlistId})
        > {
  $$SeriesEpisodesTableTableManager(
    _$IptvDatabase db,
    $SeriesEpisodesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeriesEpisodesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeriesEpisodesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeriesEpisodesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<int> seriesId = const Value.absent(),
                Value<int> episodeId = const Value.absent(),
                Value<int> seasonNumber = const Value.absent(),
                Value<int?> episodeNumber = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> plot = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<String?> containerExtension = const Value.absent(),
                Value<String?> stillUrl = const Value.absent(),
                Value<double?> rating = const Value.absent(),
                Value<DateTime?> airDate = const Value.absent(),
              }) => SeriesEpisodesCompanion(
                id: id,
                playlistId: playlistId,
                seriesId: seriesId,
                episodeId: episodeId,
                seasonNumber: seasonNumber,
                episodeNumber: episodeNumber,
                title: title,
                plot: plot,
                durationSeconds: durationSeconds,
                containerExtension: containerExtension,
                stillUrl: stillUrl,
                rating: rating,
                airDate: airDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playlistId,
                required int seriesId,
                required int episodeId,
                required int seasonNumber,
                Value<int?> episodeNumber = const Value.absent(),
                required String title,
                Value<String?> plot = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<String?> containerExtension = const Value.absent(),
                Value<String?> stillUrl = const Value.absent(),
                Value<double?> rating = const Value.absent(),
                Value<DateTime?> airDate = const Value.absent(),
              }) => SeriesEpisodesCompanion.insert(
                id: id,
                playlistId: playlistId,
                seriesId: seriesId,
                episodeId: episodeId,
                seasonNumber: seasonNumber,
                episodeNumber: episodeNumber,
                title: title,
                plot: plot,
                durationSeconds: durationSeconds,
                containerExtension: containerExtension,
                stillUrl: stillUrl,
                rating: rating,
                airDate: airDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SeriesEpisodesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playlistId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable: $$SeriesEpisodesTableReferences
                                    ._playlistIdTable(db),
                                referencedColumn:
                                    $$SeriesEpisodesTableReferences
                                        ._playlistIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SeriesEpisodesTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $SeriesEpisodesTable,
      SeriesEpisode,
      $$SeriesEpisodesTableFilterComposer,
      $$SeriesEpisodesTableOrderingComposer,
      $$SeriesEpisodesTableAnnotationComposer,
      $$SeriesEpisodesTableCreateCompanionBuilder,
      $$SeriesEpisodesTableUpdateCompanionBuilder,
      (SeriesEpisode, $$SeriesEpisodesTableReferences),
      SeriesEpisode,
      PrefetchHooks Function({bool playlistId})
    >;
typedef $$SeriesDetailsCacheTableCreateCompanionBuilder =
    SeriesDetailsCacheCompanion Function({
      Value<int> id,
      required int playlistId,
      required int seriesId,
      required DateTime fetchedAt,
    });
typedef $$SeriesDetailsCacheTableUpdateCompanionBuilder =
    SeriesDetailsCacheCompanion Function({
      Value<int> id,
      Value<int> playlistId,
      Value<int> seriesId,
      Value<DateTime> fetchedAt,
    });

class $$SeriesDetailsCacheTableFilterComposer
    extends Composer<_$IptvDatabase, $SeriesDetailsCacheTable> {
  $$SeriesDetailsCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get playlistId => $composableBuilder(
    column: $table.playlistId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seriesId => $composableBuilder(
    column: $table.seriesId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SeriesDetailsCacheTableOrderingComposer
    extends Composer<_$IptvDatabase, $SeriesDetailsCacheTable> {
  $$SeriesDetailsCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get playlistId => $composableBuilder(
    column: $table.playlistId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seriesId => $composableBuilder(
    column: $table.seriesId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SeriesDetailsCacheTableAnnotationComposer
    extends Composer<_$IptvDatabase, $SeriesDetailsCacheTable> {
  $$SeriesDetailsCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get playlistId => $composableBuilder(
    column: $table.playlistId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get seriesId =>
      $composableBuilder(column: $table.seriesId, builder: (column) => column);

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);
}

class $$SeriesDetailsCacheTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $SeriesDetailsCacheTable,
          SeriesDetailsCacheData,
          $$SeriesDetailsCacheTableFilterComposer,
          $$SeriesDetailsCacheTableOrderingComposer,
          $$SeriesDetailsCacheTableAnnotationComposer,
          $$SeriesDetailsCacheTableCreateCompanionBuilder,
          $$SeriesDetailsCacheTableUpdateCompanionBuilder,
          (
            SeriesDetailsCacheData,
            BaseReferences<
              _$IptvDatabase,
              $SeriesDetailsCacheTable,
              SeriesDetailsCacheData
            >,
          ),
          SeriesDetailsCacheData,
          PrefetchHooks Function()
        > {
  $$SeriesDetailsCacheTableTableManager(
    _$IptvDatabase db,
    $SeriesDetailsCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeriesDetailsCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeriesDetailsCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeriesDetailsCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<int> seriesId = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
              }) => SeriesDetailsCacheCompanion(
                id: id,
                playlistId: playlistId,
                seriesId: seriesId,
                fetchedAt: fetchedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playlistId,
                required int seriesId,
                required DateTime fetchedAt,
              }) => SeriesDetailsCacheCompanion.insert(
                id: id,
                playlistId: playlistId,
                seriesId: seriesId,
                fetchedAt: fetchedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SeriesDetailsCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $SeriesDetailsCacheTable,
      SeriesDetailsCacheData,
      $$SeriesDetailsCacheTableFilterComposer,
      $$SeriesDetailsCacheTableOrderingComposer,
      $$SeriesDetailsCacheTableAnnotationComposer,
      $$SeriesDetailsCacheTableCreateCompanionBuilder,
      $$SeriesDetailsCacheTableUpdateCompanionBuilder,
      (
        SeriesDetailsCacheData,
        BaseReferences<
          _$IptvDatabase,
          $SeriesDetailsCacheTable,
          SeriesDetailsCacheData
        >,
      ),
      SeriesDetailsCacheData,
      PrefetchHooks Function()
    >;
typedef $$RecordingsTableCreateCompanionBuilder =
    RecordingsCompanion Function({
      Value<int> id,
      Value<int?> playlistId,
      required String title,
      required String filePath,
      Value<DateTime> startedAt,
      Value<int?> durationMs,
      Value<String> status,
    });
typedef $$RecordingsTableUpdateCompanionBuilder =
    RecordingsCompanion Function({
      Value<int> id,
      Value<int?> playlistId,
      Value<String> title,
      Value<String> filePath,
      Value<DateTime> startedAt,
      Value<int?> durationMs,
      Value<String> status,
    });

final class $$RecordingsTableReferences
    extends BaseReferences<_$IptvDatabase, $RecordingsTable, Recording> {
  $$RecordingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlaylistsTable _playlistIdTable(_$IptvDatabase db) =>
      db.playlists.createAlias('recordings__playlist_id__playlists__id');

  $$PlaylistsTableProcessedTableManager? get playlistId {
    final $_column = $_itemColumn<int>('playlist_id');
    if ($_column == null) return null;
    final manager = $$PlaylistsTableTableManager(
      $_db,
      $_db.playlists,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ScheduledRecordingsTable,
    List<ScheduledRecording>
  >
  _scheduledRecordingsRefsTable(_$IptvDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.scheduledRecordings,
        aliasName: 'recordings__id__scheduled_recordings__recording_id',
      );

  $$ScheduledRecordingsTableProcessedTableManager get scheduledRecordingsRefs {
    final manager = $$ScheduledRecordingsTableTableManager(
      $_db,
      $_db.scheduledRecordings,
    ).filter((f) => f.recordingId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _scheduledRecordingsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecordingsTableFilterComposer
    extends Composer<_$IptvDatabase, $RecordingsTable> {
  $$RecordingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistsTableFilterComposer get playlistId {
    final $$PlaylistsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableFilterComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> scheduledRecordingsRefs(
    Expression<bool> Function($$ScheduledRecordingsTableFilterComposer f) f,
  ) {
    final $$ScheduledRecordingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduledRecordings,
      getReferencedColumn: (t) => t.recordingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduledRecordingsTableFilterComposer(
            $db: $db,
            $table: $db.scheduledRecordings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecordingsTableOrderingComposer
    extends Composer<_$IptvDatabase, $RecordingsTable> {
  $$RecordingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistsTableOrderingComposer get playlistId {
    final $$PlaylistsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableOrderingComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecordingsTableAnnotationComposer
    extends Composer<_$IptvDatabase, $RecordingsTable> {
  $$RecordingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$PlaylistsTableAnnotationComposer get playlistId {
    final $$PlaylistsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableAnnotationComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> scheduledRecordingsRefs<T extends Object>(
    Expression<T> Function($$ScheduledRecordingsTableAnnotationComposer a) f,
  ) {
    final $$ScheduledRecordingsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scheduledRecordings,
          getReferencedColumn: (t) => t.recordingId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduledRecordingsTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduledRecordings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecordingsTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $RecordingsTable,
          Recording,
          $$RecordingsTableFilterComposer,
          $$RecordingsTableOrderingComposer,
          $$RecordingsTableAnnotationComposer,
          $$RecordingsTableCreateCompanionBuilder,
          $$RecordingsTableUpdateCompanionBuilder,
          (Recording, $$RecordingsTableReferences),
          Recording,
          PrefetchHooks Function({
            bool playlistId,
            bool scheduledRecordingsRefs,
          })
        > {
  $$RecordingsTableTableManager(_$IptvDatabase db, $RecordingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecordingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecordingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecordingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> playlistId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<int?> durationMs = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => RecordingsCompanion(
                id: id,
                playlistId: playlistId,
                title: title,
                filePath: filePath,
                startedAt: startedAt,
                durationMs: durationMs,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> playlistId = const Value.absent(),
                required String title,
                required String filePath,
                Value<DateTime> startedAt = const Value.absent(),
                Value<int?> durationMs = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => RecordingsCompanion.insert(
                id: id,
                playlistId: playlistId,
                title: title,
                filePath: filePath,
                startedAt: startedAt,
                durationMs: durationMs,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecordingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({playlistId = false, scheduledRecordingsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (scheduledRecordingsRefs) db.scheduledRecordings,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (playlistId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.playlistId,
                                    referencedTable: $$RecordingsTableReferences
                                        ._playlistIdTable(db),
                                    referencedColumn:
                                        $$RecordingsTableReferences
                                            ._playlistIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (scheduledRecordingsRefs)
                        await $_getPrefetchedData<
                          Recording,
                          $RecordingsTable,
                          ScheduledRecording
                        >(
                          currentTable: table,
                          referencedTable: $$RecordingsTableReferences
                              ._scheduledRecordingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecordingsTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduledRecordingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recordingId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecordingsTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $RecordingsTable,
      Recording,
      $$RecordingsTableFilterComposer,
      $$RecordingsTableOrderingComposer,
      $$RecordingsTableAnnotationComposer,
      $$RecordingsTableCreateCompanionBuilder,
      $$RecordingsTableUpdateCompanionBuilder,
      (Recording, $$RecordingsTableReferences),
      Recording,
      PrefetchHooks Function({bool playlistId, bool scheduledRecordingsRefs})
    >;
typedef $$ScheduledRecordingsTableCreateCompanionBuilder =
    ScheduledRecordingsCompanion Function({
      Value<int> id,
      required int playlistId,
      required int channelId,
      Value<int?> recordingId,
      required String title,
      required DateTime programStart,
      required DateTime programEnd,
      Value<String> status,
    });
typedef $$ScheduledRecordingsTableUpdateCompanionBuilder =
    ScheduledRecordingsCompanion Function({
      Value<int> id,
      Value<int> playlistId,
      Value<int> channelId,
      Value<int?> recordingId,
      Value<String> title,
      Value<DateTime> programStart,
      Value<DateTime> programEnd,
      Value<String> status,
    });

final class $$ScheduledRecordingsTableReferences
    extends
        BaseReferences<
          _$IptvDatabase,
          $ScheduledRecordingsTable,
          ScheduledRecording
        > {
  $$ScheduledRecordingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PlaylistsTable _playlistIdTable(_$IptvDatabase db) => db.playlists
      .createAlias('scheduled_recordings__playlist_id__playlists__id');

  $$PlaylistsTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistsTableTableManager(
      $_db,
      $_db.playlists,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ChannelsTable _channelIdTable(_$IptvDatabase db) =>
      db.channels.createAlias('scheduled_recordings__channel_id__channels__id');

  $$ChannelsTableProcessedTableManager get channelId {
    final $_column = $_itemColumn<int>('channel_id')!;

    final manager = $$ChannelsTableTableManager(
      $_db,
      $_db.channels,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_channelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RecordingsTable _recordingIdTable(_$IptvDatabase db) => db.recordings
      .createAlias('scheduled_recordings__recording_id__recordings__id');

  $$RecordingsTableProcessedTableManager? get recordingId {
    final $_column = $_itemColumn<int>('recording_id');
    if ($_column == null) return null;
    final manager = $$RecordingsTableTableManager(
      $_db,
      $_db.recordings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recordingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ScheduledRecordingsTableFilterComposer
    extends Composer<_$IptvDatabase, $ScheduledRecordingsTable> {
  $$ScheduledRecordingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get programStart => $composableBuilder(
    column: $table.programStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get programEnd => $composableBuilder(
    column: $table.programEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistsTableFilterComposer get playlistId {
    final $$PlaylistsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableFilterComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChannelsTableFilterComposer get channelId {
    final $$ChannelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.channelId,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableFilterComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecordingsTableFilterComposer get recordingId {
    final $$RecordingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recordingId,
      referencedTable: $db.recordings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecordingsTableFilterComposer(
            $db: $db,
            $table: $db.recordings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduledRecordingsTableOrderingComposer
    extends Composer<_$IptvDatabase, $ScheduledRecordingsTable> {
  $$ScheduledRecordingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get programStart => $composableBuilder(
    column: $table.programStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get programEnd => $composableBuilder(
    column: $table.programEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistsTableOrderingComposer get playlistId {
    final $$PlaylistsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableOrderingComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChannelsTableOrderingComposer get channelId {
    final $$ChannelsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.channelId,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableOrderingComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecordingsTableOrderingComposer get recordingId {
    final $$RecordingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recordingId,
      referencedTable: $db.recordings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecordingsTableOrderingComposer(
            $db: $db,
            $table: $db.recordings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduledRecordingsTableAnnotationComposer
    extends Composer<_$IptvDatabase, $ScheduledRecordingsTable> {
  $$ScheduledRecordingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get programStart => $composableBuilder(
    column: $table.programStart,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get programEnd => $composableBuilder(
    column: $table.programEnd,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$PlaylistsTableAnnotationComposer get playlistId {
    final $$PlaylistsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlists,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableAnnotationComposer(
            $db: $db,
            $table: $db.playlists,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChannelsTableAnnotationComposer get channelId {
    final $$ChannelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.channelId,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableAnnotationComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecordingsTableAnnotationComposer get recordingId {
    final $$RecordingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recordingId,
      referencedTable: $db.recordings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecordingsTableAnnotationComposer(
            $db: $db,
            $table: $db.recordings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduledRecordingsTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $ScheduledRecordingsTable,
          ScheduledRecording,
          $$ScheduledRecordingsTableFilterComposer,
          $$ScheduledRecordingsTableOrderingComposer,
          $$ScheduledRecordingsTableAnnotationComposer,
          $$ScheduledRecordingsTableCreateCompanionBuilder,
          $$ScheduledRecordingsTableUpdateCompanionBuilder,
          (ScheduledRecording, $$ScheduledRecordingsTableReferences),
          ScheduledRecording,
          PrefetchHooks Function({
            bool playlistId,
            bool channelId,
            bool recordingId,
          })
        > {
  $$ScheduledRecordingsTableTableManager(
    _$IptvDatabase db,
    $ScheduledRecordingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduledRecordingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduledRecordingsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ScheduledRecordingsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<int> channelId = const Value.absent(),
                Value<int?> recordingId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> programStart = const Value.absent(),
                Value<DateTime> programEnd = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => ScheduledRecordingsCompanion(
                id: id,
                playlistId: playlistId,
                channelId: channelId,
                recordingId: recordingId,
                title: title,
                programStart: programStart,
                programEnd: programEnd,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playlistId,
                required int channelId,
                Value<int?> recordingId = const Value.absent(),
                required String title,
                required DateTime programStart,
                required DateTime programEnd,
                Value<String> status = const Value.absent(),
              }) => ScheduledRecordingsCompanion.insert(
                id: id,
                playlistId: playlistId,
                channelId: channelId,
                recordingId: recordingId,
                title: title,
                programStart: programStart,
                programEnd: programEnd,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ScheduledRecordingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({playlistId = false, channelId = false, recordingId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (playlistId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.playlistId,
                                    referencedTable:
                                        $$ScheduledRecordingsTableReferences
                                            ._playlistIdTable(db),
                                    referencedColumn:
                                        $$ScheduledRecordingsTableReferences
                                            ._playlistIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (channelId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.channelId,
                                    referencedTable:
                                        $$ScheduledRecordingsTableReferences
                                            ._channelIdTable(db),
                                    referencedColumn:
                                        $$ScheduledRecordingsTableReferences
                                            ._channelIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (recordingId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recordingId,
                                    referencedTable:
                                        $$ScheduledRecordingsTableReferences
                                            ._recordingIdTable(db),
                                    referencedColumn:
                                        $$ScheduledRecordingsTableReferences
                                            ._recordingIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ScheduledRecordingsTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $ScheduledRecordingsTable,
      ScheduledRecording,
      $$ScheduledRecordingsTableFilterComposer,
      $$ScheduledRecordingsTableOrderingComposer,
      $$ScheduledRecordingsTableAnnotationComposer,
      $$ScheduledRecordingsTableCreateCompanionBuilder,
      $$ScheduledRecordingsTableUpdateCompanionBuilder,
      (ScheduledRecording, $$ScheduledRecordingsTableReferences),
      ScheduledRecording,
      PrefetchHooks Function({
        bool playlistId,
        bool channelId,
        bool recordingId,
      })
    >;
typedef $$RemindersTableCreateCompanionBuilder =
    RemindersCompanion Function({
      Value<int> id,
      Value<int?> channelId,
      required String title,
      required DateTime programStart,
      required int notificationId,
    });
typedef $$RemindersTableUpdateCompanionBuilder =
    RemindersCompanion Function({
      Value<int> id,
      Value<int?> channelId,
      Value<String> title,
      Value<DateTime> programStart,
      Value<int> notificationId,
    });

final class $$RemindersTableReferences
    extends BaseReferences<_$IptvDatabase, $RemindersTable, Reminder> {
  $$RemindersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ChannelsTable _channelIdTable(_$IptvDatabase db) =>
      db.channels.createAlias('reminders__channel_id__channels__id');

  $$ChannelsTableProcessedTableManager? get channelId {
    final $_column = $_itemColumn<int>('channel_id');
    if ($_column == null) return null;
    final manager = $$ChannelsTableTableManager(
      $_db,
      $_db.channels,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_channelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RemindersTableFilterComposer
    extends Composer<_$IptvDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get programStart => $composableBuilder(
    column: $table.programStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnFilters(column),
  );

  $$ChannelsTableFilterComposer get channelId {
    final $$ChannelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.channelId,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableFilterComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableOrderingComposer
    extends Composer<_$IptvDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get programStart => $composableBuilder(
    column: $table.programStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChannelsTableOrderingComposer get channelId {
    final $$ChannelsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.channelId,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableOrderingComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$IptvDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get programStart => $composableBuilder(
    column: $table.programStart,
    builder: (column) => column,
  );

  GeneratedColumn<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => column,
  );

  $$ChannelsTableAnnotationComposer get channelId {
    final $$ChannelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.channelId,
      referencedTable: $db.channels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelsTableAnnotationComposer(
            $db: $db,
            $table: $db.channels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$IptvDatabase,
          $RemindersTable,
          Reminder,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (Reminder, $$RemindersTableReferences),
          Reminder,
          PrefetchHooks Function({bool channelId})
        > {
  $$RemindersTableTableManager(_$IptvDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> channelId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> programStart = const Value.absent(),
                Value<int> notificationId = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                channelId: channelId,
                title: title,
                programStart: programStart,
                notificationId: notificationId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> channelId = const Value.absent(),
                required String title,
                required DateTime programStart,
                required int notificationId,
              }) => RemindersCompanion.insert(
                id: id,
                channelId: channelId,
                title: title,
                programStart: programStart,
                notificationId: notificationId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RemindersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({channelId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (channelId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.channelId,
                                referencedTable: $$RemindersTableReferences
                                    ._channelIdTable(db),
                                referencedColumn: $$RemindersTableReferences
                                    ._channelIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$IptvDatabase,
      $RemindersTable,
      Reminder,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (Reminder, $$RemindersTableReferences),
      Reminder,
      PrefetchHooks Function({bool channelId})
    >;

class $IptvDatabaseManager {
  final _$IptvDatabase _db;
  $IptvDatabaseManager(this._db);
  $$PlaylistsTableTableManager get playlists =>
      $$PlaylistsTableTableManager(_db, _db.playlists);
  $$ChannelGroupsTableTableManager get channelGroups =>
      $$ChannelGroupsTableTableManager(_db, _db.channelGroups);
  $$ChannelsTableTableManager get channels =>
      $$ChannelsTableTableManager(_db, _db.channels);
  $$ChannelEditsTableTableManager get channelEdits =>
      $$ChannelEditsTableTableManager(_db, _db.channelEdits);
  $$EpgProgramsTableTableManager get epgPrograms =>
      $$EpgProgramsTableTableManager(_db, _db.epgPrograms);
  $$EpgSourcesTableTableManager get epgSources =>
      $$EpgSourcesTableTableManager(_db, _db.epgSources);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
  $$WatchHistoryTableTableManager get watchHistory =>
      $$WatchHistoryTableTableManager(_db, _db.watchHistory);
  $$EnabledGroupsTableTableManager get enabledGroups =>
      $$EnabledGroupsTableTableManager(_db, _db.enabledGroups);
  $$VodItemsTableTableManager get vodItems =>
      $$VodItemsTableTableManager(_db, _db.vodItems);
  $$SeriesSeasonsTableTableManager get seriesSeasons =>
      $$SeriesSeasonsTableTableManager(_db, _db.seriesSeasons);
  $$SeriesEpisodesTableTableManager get seriesEpisodes =>
      $$SeriesEpisodesTableTableManager(_db, _db.seriesEpisodes);
  $$SeriesDetailsCacheTableTableManager get seriesDetailsCache =>
      $$SeriesDetailsCacheTableTableManager(_db, _db.seriesDetailsCache);
  $$RecordingsTableTableManager get recordings =>
      $$RecordingsTableTableManager(_db, _db.recordings);
  $$ScheduledRecordingsTableTableManager get scheduledRecordings =>
      $$ScheduledRecordingsTableTableManager(_db, _db.scheduledRecordings);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
}
