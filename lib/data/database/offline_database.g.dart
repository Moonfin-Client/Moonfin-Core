// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_database.dart';

// ignore_for_file: type=lint
class $DownloadedItemsTable extends DownloadedItems
    with TableInfo<$DownloadedItemsTable, DownloadedItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DownloadedItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localFilePathMeta = const VerificationMeta(
    'localFilePath',
  );
  @override
  late final GeneratedColumn<String> localFilePath = GeneratedColumn<String>(
    'local_file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metadataJsonMeta = const VerificationMeta(
    'metadataJson',
  );
  @override
  late final GeneratedColumn<String> metadataJson = GeneratedColumn<String>(
    'metadata_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _posterPathMeta = const VerificationMeta(
    'posterPath',
  );
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
    'poster_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _backdropPathMeta = const VerificationMeta(
    'backdropPath',
  );
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
    'backdrop_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoPathMeta = const VerificationMeta(
    'logoPath',
  );
  @override
  late final GeneratedColumn<String> logoPath = GeneratedColumn<String>(
    'logo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thumbPathMeta = const VerificationMeta(
    'thumbPath',
  );
  @override
  late final GeneratedColumn<String> thumbPath = GeneratedColumn<String>(
    'thumb_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _downloadStatusMeta = const VerificationMeta(
    'downloadStatus',
  );
  @override
  late final GeneratedColumn<int> downloadStatus = GeneratedColumn<int>(
    'download_status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _downloadProgressMeta = const VerificationMeta(
    'downloadProgress',
  );
  @override
  late final GeneratedColumn<double> downloadProgress = GeneratedColumn<double>(
    'download_progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fileSizeBytesMeta = const VerificationMeta(
    'fileSizeBytes',
  );
  @override
  late final GeneratedColumn<int> fileSizeBytes = GeneratedColumn<int>(
    'file_size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _playbackPositionTicksMeta =
      const VerificationMeta('playbackPositionTicks');
  @override
  late final GeneratedColumn<int> playbackPositionTicks = GeneratedColumn<int>(
    'playback_position_ticks',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _progressSyncedMeta = const VerificationMeta(
    'progressSynced',
  );
  @override
  late final GeneratedColumn<bool> progressSynced = GeneratedColumn<bool>(
    'progress_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("progress_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _downloadedAtMeta = const VerificationMeta(
    'downloadedAt',
  );
  @override
  late final GeneratedColumn<DateTime> downloadedAt = GeneratedColumn<DateTime>(
    'downloaded_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _qualityPresetMeta = const VerificationMeta(
    'qualityPreset',
  );
  @override
  late final GeneratedColumn<String> qualityPreset = GeneratedColumn<String>(
    'quality_preset',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('original'),
  );
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<String> seriesId = GeneratedColumn<String>(
    'series_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seasonIdMeta = const VerificationMeta(
    'seasonId',
  );
  @override
  late final GeneratedColumn<String> seasonId = GeneratedColumn<String>(
    'season_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seriesNameMeta = const VerificationMeta(
    'seriesName',
  );
  @override
  late final GeneratedColumn<String> seriesName = GeneratedColumn<String>(
    'series_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seasonNameMeta = const VerificationMeta(
    'seasonName',
  );
  @override
  late final GeneratedColumn<String> seasonName = GeneratedColumn<String>(
    'season_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _indexNumberMeta = const VerificationMeta(
    'indexNumber',
  );
  @override
  late final GeneratedColumn<int> indexNumber = GeneratedColumn<int>(
    'index_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parentIndexNumberMeta = const VerificationMeta(
    'parentIndexNumber',
  );
  @override
  late final GeneratedColumn<int> parentIndexNumber = GeneratedColumn<int>(
    'parent_index_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _downloadSourceMeta = const VerificationMeta(
    'downloadSource',
  );
  @override
  late final GeneratedColumn<String> downloadSource = GeneratedColumn<String>(
    'download_source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('manual'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    itemId,
    serverId,
    type,
    name,
    localFilePath,
    metadataJson,
    posterPath,
    backdropPath,
    logoPath,
    thumbPath,
    downloadStatus,
    downloadProgress,
    errorMessage,
    fileSizeBytes,
    playbackPositionTicks,
    progressSynced,
    downloadedAt,
    qualityPreset,
    seriesId,
    seasonId,
    seriesName,
    seasonName,
    indexNumber,
    parentIndexNumber,
    downloadSource,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'downloaded_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<DownloadedItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    } else if (isInserting) {
      context.missing(_serverIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('local_file_path')) {
      context.handle(
        _localFilePathMeta,
        localFilePath.isAcceptableOrUnknown(
          data['local_file_path']!,
          _localFilePathMeta,
        ),
      );
    }
    if (data.containsKey('metadata_json')) {
      context.handle(
        _metadataJsonMeta,
        metadataJson.isAcceptableOrUnknown(
          data['metadata_json']!,
          _metadataJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_metadataJsonMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
        _posterPathMeta,
        posterPath.isAcceptableOrUnknown(data['poster_path']!, _posterPathMeta),
      );
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
        _backdropPathMeta,
        backdropPath.isAcceptableOrUnknown(
          data['backdrop_path']!,
          _backdropPathMeta,
        ),
      );
    }
    if (data.containsKey('logo_path')) {
      context.handle(
        _logoPathMeta,
        logoPath.isAcceptableOrUnknown(data['logo_path']!, _logoPathMeta),
      );
    }
    if (data.containsKey('thumb_path')) {
      context.handle(
        _thumbPathMeta,
        thumbPath.isAcceptableOrUnknown(data['thumb_path']!, _thumbPathMeta),
      );
    }
    if (data.containsKey('download_status')) {
      context.handle(
        _downloadStatusMeta,
        downloadStatus.isAcceptableOrUnknown(
          data['download_status']!,
          _downloadStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_downloadStatusMeta);
    }
    if (data.containsKey('download_progress')) {
      context.handle(
        _downloadProgressMeta,
        downloadProgress.isAcceptableOrUnknown(
          data['download_progress']!,
          _downloadProgressMeta,
        ),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    }
    if (data.containsKey('file_size_bytes')) {
      context.handle(
        _fileSizeBytesMeta,
        fileSizeBytes.isAcceptableOrUnknown(
          data['file_size_bytes']!,
          _fileSizeBytesMeta,
        ),
      );
    }
    if (data.containsKey('playback_position_ticks')) {
      context.handle(
        _playbackPositionTicksMeta,
        playbackPositionTicks.isAcceptableOrUnknown(
          data['playback_position_ticks']!,
          _playbackPositionTicksMeta,
        ),
      );
    }
    if (data.containsKey('progress_synced')) {
      context.handle(
        _progressSyncedMeta,
        progressSynced.isAcceptableOrUnknown(
          data['progress_synced']!,
          _progressSyncedMeta,
        ),
      );
    }
    if (data.containsKey('downloaded_at')) {
      context.handle(
        _downloadedAtMeta,
        downloadedAt.isAcceptableOrUnknown(
          data['downloaded_at']!,
          _downloadedAtMeta,
        ),
      );
    }
    if (data.containsKey('quality_preset')) {
      context.handle(
        _qualityPresetMeta,
        qualityPreset.isAcceptableOrUnknown(
          data['quality_preset']!,
          _qualityPresetMeta,
        ),
      );
    }
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    }
    if (data.containsKey('season_id')) {
      context.handle(
        _seasonIdMeta,
        seasonId.isAcceptableOrUnknown(data['season_id']!, _seasonIdMeta),
      );
    }
    if (data.containsKey('series_name')) {
      context.handle(
        _seriesNameMeta,
        seriesName.isAcceptableOrUnknown(data['series_name']!, _seriesNameMeta),
      );
    }
    if (data.containsKey('season_name')) {
      context.handle(
        _seasonNameMeta,
        seasonName.isAcceptableOrUnknown(data['season_name']!, _seasonNameMeta),
      );
    }
    if (data.containsKey('index_number')) {
      context.handle(
        _indexNumberMeta,
        indexNumber.isAcceptableOrUnknown(
          data['index_number']!,
          _indexNumberMeta,
        ),
      );
    }
    if (data.containsKey('parent_index_number')) {
      context.handle(
        _parentIndexNumberMeta,
        parentIndexNumber.isAcceptableOrUnknown(
          data['parent_index_number']!,
          _parentIndexNumberMeta,
        ),
      );
    }
    if (data.containsKey('download_source')) {
      context.handle(
        _downloadSourceMeta,
        downloadSource.isAcceptableOrUnknown(
          data['download_source']!,
          _downloadSourceMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {itemId, serverId};
  @override
  DownloadedItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DownloadedItem(
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      localFilePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_file_path'],
      ),
      metadataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata_json'],
      )!,
      posterPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poster_path'],
      ),
      backdropPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backdrop_path'],
      ),
      logoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_path'],
      ),
      thumbPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumb_path'],
      ),
      downloadStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}download_status'],
      )!,
      downloadProgress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}download_progress'],
      )!,
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
      fileSizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size_bytes'],
      )!,
      playbackPositionTicks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playback_position_ticks'],
      )!,
      progressSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}progress_synced'],
      )!,
      downloadedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}downloaded_at'],
      ),
      qualityPreset: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quality_preset'],
      )!,
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}series_id'],
      ),
      seasonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}season_id'],
      ),
      seriesName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}series_name'],
      ),
      seasonName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}season_name'],
      ),
      indexNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}index_number'],
      ),
      parentIndexNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_index_number'],
      ),
      downloadSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}download_source'],
      )!,
    );
  }

  @override
  $DownloadedItemsTable createAlias(String alias) {
    return $DownloadedItemsTable(attachedDatabase, alias);
  }
}

class DownloadedItem extends DataClass implements Insertable<DownloadedItem> {
  final String itemId;
  final String serverId;
  final String type;
  final String name;
  final String? localFilePath;
  final String metadataJson;
  final String? posterPath;
  final String? backdropPath;
  final String? logoPath;
  final String? thumbPath;
  final int downloadStatus;
  final double downloadProgress;
  final String? errorMessage;
  final int fileSizeBytes;
  final int playbackPositionTicks;
  final bool progressSynced;
  final DateTime? downloadedAt;
  final String qualityPreset;
  final String? seriesId;
  final String? seasonId;
  final String? seriesName;
  final String? seasonName;
  final int? indexNumber;
  final int? parentIndexNumber;

  /// Who queued the download: `manual` for the user, `auto` for an
  /// auto-download subscription. Only auto rows are ever removed by the
  /// subscription's delete-after-watched rule.
  final String downloadSource;
  const DownloadedItem({
    required this.itemId,
    required this.serverId,
    required this.type,
    required this.name,
    this.localFilePath,
    required this.metadataJson,
    this.posterPath,
    this.backdropPath,
    this.logoPath,
    this.thumbPath,
    required this.downloadStatus,
    required this.downloadProgress,
    this.errorMessage,
    required this.fileSizeBytes,
    required this.playbackPositionTicks,
    required this.progressSynced,
    this.downloadedAt,
    required this.qualityPreset,
    this.seriesId,
    this.seasonId,
    this.seriesName,
    this.seasonName,
    this.indexNumber,
    this.parentIndexNumber,
    required this.downloadSource,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<String>(itemId);
    map['server_id'] = Variable<String>(serverId);
    map['type'] = Variable<String>(type);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || localFilePath != null) {
      map['local_file_path'] = Variable<String>(localFilePath);
    }
    map['metadata_json'] = Variable<String>(metadataJson);
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || logoPath != null) {
      map['logo_path'] = Variable<String>(logoPath);
    }
    if (!nullToAbsent || thumbPath != null) {
      map['thumb_path'] = Variable<String>(thumbPath);
    }
    map['download_status'] = Variable<int>(downloadStatus);
    map['download_progress'] = Variable<double>(downloadProgress);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    map['file_size_bytes'] = Variable<int>(fileSizeBytes);
    map['playback_position_ticks'] = Variable<int>(playbackPositionTicks);
    map['progress_synced'] = Variable<bool>(progressSynced);
    if (!nullToAbsent || downloadedAt != null) {
      map['downloaded_at'] = Variable<DateTime>(downloadedAt);
    }
    map['quality_preset'] = Variable<String>(qualityPreset);
    if (!nullToAbsent || seriesId != null) {
      map['series_id'] = Variable<String>(seriesId);
    }
    if (!nullToAbsent || seasonId != null) {
      map['season_id'] = Variable<String>(seasonId);
    }
    if (!nullToAbsent || seriesName != null) {
      map['series_name'] = Variable<String>(seriesName);
    }
    if (!nullToAbsent || seasonName != null) {
      map['season_name'] = Variable<String>(seasonName);
    }
    if (!nullToAbsent || indexNumber != null) {
      map['index_number'] = Variable<int>(indexNumber);
    }
    if (!nullToAbsent || parentIndexNumber != null) {
      map['parent_index_number'] = Variable<int>(parentIndexNumber);
    }
    map['download_source'] = Variable<String>(downloadSource);
    return map;
  }

  DownloadedItemsCompanion toCompanion(bool nullToAbsent) {
    return DownloadedItemsCompanion(
      itemId: Value(itemId),
      serverId: Value(serverId),
      type: Value(type),
      name: Value(name),
      localFilePath: localFilePath == null && nullToAbsent
          ? const Value.absent()
          : Value(localFilePath),
      metadataJson: Value(metadataJson),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      logoPath: logoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(logoPath),
      thumbPath: thumbPath == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbPath),
      downloadStatus: Value(downloadStatus),
      downloadProgress: Value(downloadProgress),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      fileSizeBytes: Value(fileSizeBytes),
      playbackPositionTicks: Value(playbackPositionTicks),
      progressSynced: Value(progressSynced),
      downloadedAt: downloadedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(downloadedAt),
      qualityPreset: Value(qualityPreset),
      seriesId: seriesId == null && nullToAbsent
          ? const Value.absent()
          : Value(seriesId),
      seasonId: seasonId == null && nullToAbsent
          ? const Value.absent()
          : Value(seasonId),
      seriesName: seriesName == null && nullToAbsent
          ? const Value.absent()
          : Value(seriesName),
      seasonName: seasonName == null && nullToAbsent
          ? const Value.absent()
          : Value(seasonName),
      indexNumber: indexNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(indexNumber),
      parentIndexNumber: parentIndexNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(parentIndexNumber),
      downloadSource: Value(downloadSource),
    );
  }

  factory DownloadedItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DownloadedItem(
      itemId: serializer.fromJson<String>(json['itemId']),
      serverId: serializer.fromJson<String>(json['serverId']),
      type: serializer.fromJson<String>(json['type']),
      name: serializer.fromJson<String>(json['name']),
      localFilePath: serializer.fromJson<String?>(json['localFilePath']),
      metadataJson: serializer.fromJson<String>(json['metadataJson']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      logoPath: serializer.fromJson<String?>(json['logoPath']),
      thumbPath: serializer.fromJson<String?>(json['thumbPath']),
      downloadStatus: serializer.fromJson<int>(json['downloadStatus']),
      downloadProgress: serializer.fromJson<double>(json['downloadProgress']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      fileSizeBytes: serializer.fromJson<int>(json['fileSizeBytes']),
      playbackPositionTicks: serializer.fromJson<int>(
        json['playbackPositionTicks'],
      ),
      progressSynced: serializer.fromJson<bool>(json['progressSynced']),
      downloadedAt: serializer.fromJson<DateTime?>(json['downloadedAt']),
      qualityPreset: serializer.fromJson<String>(json['qualityPreset']),
      seriesId: serializer.fromJson<String?>(json['seriesId']),
      seasonId: serializer.fromJson<String?>(json['seasonId']),
      seriesName: serializer.fromJson<String?>(json['seriesName']),
      seasonName: serializer.fromJson<String?>(json['seasonName']),
      indexNumber: serializer.fromJson<int?>(json['indexNumber']),
      parentIndexNumber: serializer.fromJson<int?>(json['parentIndexNumber']),
      downloadSource: serializer.fromJson<String>(json['downloadSource']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<String>(itemId),
      'serverId': serializer.toJson<String>(serverId),
      'type': serializer.toJson<String>(type),
      'name': serializer.toJson<String>(name),
      'localFilePath': serializer.toJson<String?>(localFilePath),
      'metadataJson': serializer.toJson<String>(metadataJson),
      'posterPath': serializer.toJson<String?>(posterPath),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'logoPath': serializer.toJson<String?>(logoPath),
      'thumbPath': serializer.toJson<String?>(thumbPath),
      'downloadStatus': serializer.toJson<int>(downloadStatus),
      'downloadProgress': serializer.toJson<double>(downloadProgress),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'fileSizeBytes': serializer.toJson<int>(fileSizeBytes),
      'playbackPositionTicks': serializer.toJson<int>(playbackPositionTicks),
      'progressSynced': serializer.toJson<bool>(progressSynced),
      'downloadedAt': serializer.toJson<DateTime?>(downloadedAt),
      'qualityPreset': serializer.toJson<String>(qualityPreset),
      'seriesId': serializer.toJson<String?>(seriesId),
      'seasonId': serializer.toJson<String?>(seasonId),
      'seriesName': serializer.toJson<String?>(seriesName),
      'seasonName': serializer.toJson<String?>(seasonName),
      'indexNumber': serializer.toJson<int?>(indexNumber),
      'parentIndexNumber': serializer.toJson<int?>(parentIndexNumber),
      'downloadSource': serializer.toJson<String>(downloadSource),
    };
  }

  DownloadedItem copyWith({
    String? itemId,
    String? serverId,
    String? type,
    String? name,
    Value<String?> localFilePath = const Value.absent(),
    String? metadataJson,
    Value<String?> posterPath = const Value.absent(),
    Value<String?> backdropPath = const Value.absent(),
    Value<String?> logoPath = const Value.absent(),
    Value<String?> thumbPath = const Value.absent(),
    int? downloadStatus,
    double? downloadProgress,
    Value<String?> errorMessage = const Value.absent(),
    int? fileSizeBytes,
    int? playbackPositionTicks,
    bool? progressSynced,
    Value<DateTime?> downloadedAt = const Value.absent(),
    String? qualityPreset,
    Value<String?> seriesId = const Value.absent(),
    Value<String?> seasonId = const Value.absent(),
    Value<String?> seriesName = const Value.absent(),
    Value<String?> seasonName = const Value.absent(),
    Value<int?> indexNumber = const Value.absent(),
    Value<int?> parentIndexNumber = const Value.absent(),
    String? downloadSource,
  }) => DownloadedItem(
    itemId: itemId ?? this.itemId,
    serverId: serverId ?? this.serverId,
    type: type ?? this.type,
    name: name ?? this.name,
    localFilePath: localFilePath.present
        ? localFilePath.value
        : this.localFilePath,
    metadataJson: metadataJson ?? this.metadataJson,
    posterPath: posterPath.present ? posterPath.value : this.posterPath,
    backdropPath: backdropPath.present ? backdropPath.value : this.backdropPath,
    logoPath: logoPath.present ? logoPath.value : this.logoPath,
    thumbPath: thumbPath.present ? thumbPath.value : this.thumbPath,
    downloadStatus: downloadStatus ?? this.downloadStatus,
    downloadProgress: downloadProgress ?? this.downloadProgress,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
    fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
    playbackPositionTicks: playbackPositionTicks ?? this.playbackPositionTicks,
    progressSynced: progressSynced ?? this.progressSynced,
    downloadedAt: downloadedAt.present ? downloadedAt.value : this.downloadedAt,
    qualityPreset: qualityPreset ?? this.qualityPreset,
    seriesId: seriesId.present ? seriesId.value : this.seriesId,
    seasonId: seasonId.present ? seasonId.value : this.seasonId,
    seriesName: seriesName.present ? seriesName.value : this.seriesName,
    seasonName: seasonName.present ? seasonName.value : this.seasonName,
    indexNumber: indexNumber.present ? indexNumber.value : this.indexNumber,
    parentIndexNumber: parentIndexNumber.present
        ? parentIndexNumber.value
        : this.parentIndexNumber,
    downloadSource: downloadSource ?? this.downloadSource,
  );
  DownloadedItem copyWithCompanion(DownloadedItemsCompanion data) {
    return DownloadedItem(
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      localFilePath: data.localFilePath.present
          ? data.localFilePath.value
          : this.localFilePath,
      metadataJson: data.metadataJson.present
          ? data.metadataJson.value
          : this.metadataJson,
      posterPath: data.posterPath.present
          ? data.posterPath.value
          : this.posterPath,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      logoPath: data.logoPath.present ? data.logoPath.value : this.logoPath,
      thumbPath: data.thumbPath.present ? data.thumbPath.value : this.thumbPath,
      downloadStatus: data.downloadStatus.present
          ? data.downloadStatus.value
          : this.downloadStatus,
      downloadProgress: data.downloadProgress.present
          ? data.downloadProgress.value
          : this.downloadProgress,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      fileSizeBytes: data.fileSizeBytes.present
          ? data.fileSizeBytes.value
          : this.fileSizeBytes,
      playbackPositionTicks: data.playbackPositionTicks.present
          ? data.playbackPositionTicks.value
          : this.playbackPositionTicks,
      progressSynced: data.progressSynced.present
          ? data.progressSynced.value
          : this.progressSynced,
      downloadedAt: data.downloadedAt.present
          ? data.downloadedAt.value
          : this.downloadedAt,
      qualityPreset: data.qualityPreset.present
          ? data.qualityPreset.value
          : this.qualityPreset,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      seasonId: data.seasonId.present ? data.seasonId.value : this.seasonId,
      seriesName: data.seriesName.present
          ? data.seriesName.value
          : this.seriesName,
      seasonName: data.seasonName.present
          ? data.seasonName.value
          : this.seasonName,
      indexNumber: data.indexNumber.present
          ? data.indexNumber.value
          : this.indexNumber,
      parentIndexNumber: data.parentIndexNumber.present
          ? data.parentIndexNumber.value
          : this.parentIndexNumber,
      downloadSource: data.downloadSource.present
          ? data.downloadSource.value
          : this.downloadSource,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DownloadedItem(')
          ..write('itemId: $itemId, ')
          ..write('serverId: $serverId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('localFilePath: $localFilePath, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('logoPath: $logoPath, ')
          ..write('thumbPath: $thumbPath, ')
          ..write('downloadStatus: $downloadStatus, ')
          ..write('downloadProgress: $downloadProgress, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('playbackPositionTicks: $playbackPositionTicks, ')
          ..write('progressSynced: $progressSynced, ')
          ..write('downloadedAt: $downloadedAt, ')
          ..write('qualityPreset: $qualityPreset, ')
          ..write('seriesId: $seriesId, ')
          ..write('seasonId: $seasonId, ')
          ..write('seriesName: $seriesName, ')
          ..write('seasonName: $seasonName, ')
          ..write('indexNumber: $indexNumber, ')
          ..write('parentIndexNumber: $parentIndexNumber, ')
          ..write('downloadSource: $downloadSource')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    itemId,
    serverId,
    type,
    name,
    localFilePath,
    metadataJson,
    posterPath,
    backdropPath,
    logoPath,
    thumbPath,
    downloadStatus,
    downloadProgress,
    errorMessage,
    fileSizeBytes,
    playbackPositionTicks,
    progressSynced,
    downloadedAt,
    qualityPreset,
    seriesId,
    seasonId,
    seriesName,
    seasonName,
    indexNumber,
    parentIndexNumber,
    downloadSource,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DownloadedItem &&
          other.itemId == this.itemId &&
          other.serverId == this.serverId &&
          other.type == this.type &&
          other.name == this.name &&
          other.localFilePath == this.localFilePath &&
          other.metadataJson == this.metadataJson &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.logoPath == this.logoPath &&
          other.thumbPath == this.thumbPath &&
          other.downloadStatus == this.downloadStatus &&
          other.downloadProgress == this.downloadProgress &&
          other.errorMessage == this.errorMessage &&
          other.fileSizeBytes == this.fileSizeBytes &&
          other.playbackPositionTicks == this.playbackPositionTicks &&
          other.progressSynced == this.progressSynced &&
          other.downloadedAt == this.downloadedAt &&
          other.qualityPreset == this.qualityPreset &&
          other.seriesId == this.seriesId &&
          other.seasonId == this.seasonId &&
          other.seriesName == this.seriesName &&
          other.seasonName == this.seasonName &&
          other.indexNumber == this.indexNumber &&
          other.parentIndexNumber == this.parentIndexNumber &&
          other.downloadSource == this.downloadSource);
}

class DownloadedItemsCompanion extends UpdateCompanion<DownloadedItem> {
  final Value<String> itemId;
  final Value<String> serverId;
  final Value<String> type;
  final Value<String> name;
  final Value<String?> localFilePath;
  final Value<String> metadataJson;
  final Value<String?> posterPath;
  final Value<String?> backdropPath;
  final Value<String?> logoPath;
  final Value<String?> thumbPath;
  final Value<int> downloadStatus;
  final Value<double> downloadProgress;
  final Value<String?> errorMessage;
  final Value<int> fileSizeBytes;
  final Value<int> playbackPositionTicks;
  final Value<bool> progressSynced;
  final Value<DateTime?> downloadedAt;
  final Value<String> qualityPreset;
  final Value<String?> seriesId;
  final Value<String?> seasonId;
  final Value<String?> seriesName;
  final Value<String?> seasonName;
  final Value<int?> indexNumber;
  final Value<int?> parentIndexNumber;
  final Value<String> downloadSource;
  final Value<int> rowid;
  const DownloadedItemsCompanion({
    this.itemId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.localFilePath = const Value.absent(),
    this.metadataJson = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.thumbPath = const Value.absent(),
    this.downloadStatus = const Value.absent(),
    this.downloadProgress = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.fileSizeBytes = const Value.absent(),
    this.playbackPositionTicks = const Value.absent(),
    this.progressSynced = const Value.absent(),
    this.downloadedAt = const Value.absent(),
    this.qualityPreset = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.seasonId = const Value.absent(),
    this.seriesName = const Value.absent(),
    this.seasonName = const Value.absent(),
    this.indexNumber = const Value.absent(),
    this.parentIndexNumber = const Value.absent(),
    this.downloadSource = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DownloadedItemsCompanion.insert({
    required String itemId,
    required String serverId,
    required String type,
    required String name,
    this.localFilePath = const Value.absent(),
    required String metadataJson,
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.thumbPath = const Value.absent(),
    required int downloadStatus,
    this.downloadProgress = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.fileSizeBytes = const Value.absent(),
    this.playbackPositionTicks = const Value.absent(),
    this.progressSynced = const Value.absent(),
    this.downloadedAt = const Value.absent(),
    this.qualityPreset = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.seasonId = const Value.absent(),
    this.seriesName = const Value.absent(),
    this.seasonName = const Value.absent(),
    this.indexNumber = const Value.absent(),
    this.parentIndexNumber = const Value.absent(),
    this.downloadSource = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : itemId = Value(itemId),
       serverId = Value(serverId),
       type = Value(type),
       name = Value(name),
       metadataJson = Value(metadataJson),
       downloadStatus = Value(downloadStatus);
  static Insertable<DownloadedItem> custom({
    Expression<String>? itemId,
    Expression<String>? serverId,
    Expression<String>? type,
    Expression<String>? name,
    Expression<String>? localFilePath,
    Expression<String>? metadataJson,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<String>? logoPath,
    Expression<String>? thumbPath,
    Expression<int>? downloadStatus,
    Expression<double>? downloadProgress,
    Expression<String>? errorMessage,
    Expression<int>? fileSizeBytes,
    Expression<int>? playbackPositionTicks,
    Expression<bool>? progressSynced,
    Expression<DateTime>? downloadedAt,
    Expression<String>? qualityPreset,
    Expression<String>? seriesId,
    Expression<String>? seasonId,
    Expression<String>? seriesName,
    Expression<String>? seasonName,
    Expression<int>? indexNumber,
    Expression<int>? parentIndexNumber,
    Expression<String>? downloadSource,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (serverId != null) 'server_id': serverId,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (localFilePath != null) 'local_file_path': localFilePath,
      if (metadataJson != null) 'metadata_json': metadataJson,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (logoPath != null) 'logo_path': logoPath,
      if (thumbPath != null) 'thumb_path': thumbPath,
      if (downloadStatus != null) 'download_status': downloadStatus,
      if (downloadProgress != null) 'download_progress': downloadProgress,
      if (errorMessage != null) 'error_message': errorMessage,
      if (fileSizeBytes != null) 'file_size_bytes': fileSizeBytes,
      if (playbackPositionTicks != null)
        'playback_position_ticks': playbackPositionTicks,
      if (progressSynced != null) 'progress_synced': progressSynced,
      if (downloadedAt != null) 'downloaded_at': downloadedAt,
      if (qualityPreset != null) 'quality_preset': qualityPreset,
      if (seriesId != null) 'series_id': seriesId,
      if (seasonId != null) 'season_id': seasonId,
      if (seriesName != null) 'series_name': seriesName,
      if (seasonName != null) 'season_name': seasonName,
      if (indexNumber != null) 'index_number': indexNumber,
      if (parentIndexNumber != null) 'parent_index_number': parentIndexNumber,
      if (downloadSource != null) 'download_source': downloadSource,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DownloadedItemsCompanion copyWith({
    Value<String>? itemId,
    Value<String>? serverId,
    Value<String>? type,
    Value<String>? name,
    Value<String?>? localFilePath,
    Value<String>? metadataJson,
    Value<String?>? posterPath,
    Value<String?>? backdropPath,
    Value<String?>? logoPath,
    Value<String?>? thumbPath,
    Value<int>? downloadStatus,
    Value<double>? downloadProgress,
    Value<String?>? errorMessage,
    Value<int>? fileSizeBytes,
    Value<int>? playbackPositionTicks,
    Value<bool>? progressSynced,
    Value<DateTime?>? downloadedAt,
    Value<String>? qualityPreset,
    Value<String?>? seriesId,
    Value<String?>? seasonId,
    Value<String?>? seriesName,
    Value<String?>? seasonName,
    Value<int?>? indexNumber,
    Value<int?>? parentIndexNumber,
    Value<String>? downloadSource,
    Value<int>? rowid,
  }) {
    return DownloadedItemsCompanion(
      itemId: itemId ?? this.itemId,
      serverId: serverId ?? this.serverId,
      type: type ?? this.type,
      name: name ?? this.name,
      localFilePath: localFilePath ?? this.localFilePath,
      metadataJson: metadataJson ?? this.metadataJson,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      logoPath: logoPath ?? this.logoPath,
      thumbPath: thumbPath ?? this.thumbPath,
      downloadStatus: downloadStatus ?? this.downloadStatus,
      downloadProgress: downloadProgress ?? this.downloadProgress,
      errorMessage: errorMessage ?? this.errorMessage,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      playbackPositionTicks:
          playbackPositionTicks ?? this.playbackPositionTicks,
      progressSynced: progressSynced ?? this.progressSynced,
      downloadedAt: downloadedAt ?? this.downloadedAt,
      qualityPreset: qualityPreset ?? this.qualityPreset,
      seriesId: seriesId ?? this.seriesId,
      seasonId: seasonId ?? this.seasonId,
      seriesName: seriesName ?? this.seriesName,
      seasonName: seasonName ?? this.seasonName,
      indexNumber: indexNumber ?? this.indexNumber,
      parentIndexNumber: parentIndexNumber ?? this.parentIndexNumber,
      downloadSource: downloadSource ?? this.downloadSource,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (localFilePath.present) {
      map['local_file_path'] = Variable<String>(localFilePath.value);
    }
    if (metadataJson.present) {
      map['metadata_json'] = Variable<String>(metadataJson.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (logoPath.present) {
      map['logo_path'] = Variable<String>(logoPath.value);
    }
    if (thumbPath.present) {
      map['thumb_path'] = Variable<String>(thumbPath.value);
    }
    if (downloadStatus.present) {
      map['download_status'] = Variable<int>(downloadStatus.value);
    }
    if (downloadProgress.present) {
      map['download_progress'] = Variable<double>(downloadProgress.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (fileSizeBytes.present) {
      map['file_size_bytes'] = Variable<int>(fileSizeBytes.value);
    }
    if (playbackPositionTicks.present) {
      map['playback_position_ticks'] = Variable<int>(
        playbackPositionTicks.value,
      );
    }
    if (progressSynced.present) {
      map['progress_synced'] = Variable<bool>(progressSynced.value);
    }
    if (downloadedAt.present) {
      map['downloaded_at'] = Variable<DateTime>(downloadedAt.value);
    }
    if (qualityPreset.present) {
      map['quality_preset'] = Variable<String>(qualityPreset.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<String>(seriesId.value);
    }
    if (seasonId.present) {
      map['season_id'] = Variable<String>(seasonId.value);
    }
    if (seriesName.present) {
      map['series_name'] = Variable<String>(seriesName.value);
    }
    if (seasonName.present) {
      map['season_name'] = Variable<String>(seasonName.value);
    }
    if (indexNumber.present) {
      map['index_number'] = Variable<int>(indexNumber.value);
    }
    if (parentIndexNumber.present) {
      map['parent_index_number'] = Variable<int>(parentIndexNumber.value);
    }
    if (downloadSource.present) {
      map['download_source'] = Variable<String>(downloadSource.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadedItemsCompanion(')
          ..write('itemId: $itemId, ')
          ..write('serverId: $serverId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('localFilePath: $localFilePath, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('logoPath: $logoPath, ')
          ..write('thumbPath: $thumbPath, ')
          ..write('downloadStatus: $downloadStatus, ')
          ..write('downloadProgress: $downloadProgress, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('playbackPositionTicks: $playbackPositionTicks, ')
          ..write('progressSynced: $progressSynced, ')
          ..write('downloadedAt: $downloadedAt, ')
          ..write('qualityPreset: $qualityPreset, ')
          ..write('seriesId: $seriesId, ')
          ..write('seasonId: $seasonId, ')
          ..write('seriesName: $seriesName, ')
          ..write('seasonName: $seasonName, ')
          ..write('indexNumber: $indexNumber, ')
          ..write('parentIndexNumber: $parentIndexNumber, ')
          ..write('downloadSource: $downloadSource, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AutoDownloadSubscriptionsTable extends AutoDownloadSubscriptions
    with TableInfo<$AutoDownloadSubscriptionsTable, AutoDownloadSubscription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AutoDownloadSubscriptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<String> seriesId = GeneratedColumn<String>(
    'series_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seriesNameMeta = const VerificationMeta(
    'seriesName',
  );
  @override
  late final GeneratedColumn<String> seriesName = GeneratedColumn<String>(
    'series_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qualityPresetMeta = const VerificationMeta(
    'qualityPreset',
  );
  @override
  late final GeneratedColumn<String> qualityPreset = GeneratedColumn<String>(
    'quality_preset',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastCheckedAtMeta = const VerificationMeta(
    'lastCheckedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastCheckedAt =
      GeneratedColumn<DateTime>(
        'last_checked_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _lastQueuedCountMeta = const VerificationMeta(
    'lastQueuedCount',
  );
  @override
  late final GeneratedColumn<int> lastQueuedCount = GeneratedColumn<int>(
    'last_queued_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    seriesId,
    serverId,
    userId,
    seriesName,
    qualityPreset,
    createdAt,
    lastCheckedAt,
    lastQueuedCount,
    lastError,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auto_download_subscriptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<AutoDownloadSubscription> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_seriesIdMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    } else if (isInserting) {
      context.missing(_serverIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('series_name')) {
      context.handle(
        _seriesNameMeta,
        seriesName.isAcceptableOrUnknown(data['series_name']!, _seriesNameMeta),
      );
    } else if (isInserting) {
      context.missing(_seriesNameMeta);
    }
    if (data.containsKey('quality_preset')) {
      context.handle(
        _qualityPresetMeta,
        qualityPreset.isAcceptableOrUnknown(
          data['quality_preset']!,
          _qualityPresetMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_qualityPresetMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_checked_at')) {
      context.handle(
        _lastCheckedAtMeta,
        lastCheckedAt.isAcceptableOrUnknown(
          data['last_checked_at']!,
          _lastCheckedAtMeta,
        ),
      );
    }
    if (data.containsKey('last_queued_count')) {
      context.handle(
        _lastQueuedCountMeta,
        lastQueuedCount.isAcceptableOrUnknown(
          data['last_queued_count']!,
          _lastQueuedCountMeta,
        ),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {seriesId, serverId, userId};
  @override
  AutoDownloadSubscription map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AutoDownloadSubscription(
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}series_id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      seriesName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}series_name'],
      )!,
      qualityPreset: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quality_preset'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastCheckedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_checked_at'],
      ),
      lastQueuedCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_queued_count'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
    );
  }

  @override
  $AutoDownloadSubscriptionsTable createAlias(String alias) {
    return $AutoDownloadSubscriptionsTable(attachedDatabase, alias);
  }
}

class AutoDownloadSubscription extends DataClass
    implements Insertable<AutoDownloadSubscription> {
  final String seriesId;
  final String serverId;
  final String userId;
  final String seriesName;
  final String qualityPreset;
  final DateTime createdAt;
  final DateTime? lastCheckedAt;
  final int lastQueuedCount;
  final String? lastError;
  const AutoDownloadSubscription({
    required this.seriesId,
    required this.serverId,
    required this.userId,
    required this.seriesName,
    required this.qualityPreset,
    required this.createdAt,
    this.lastCheckedAt,
    required this.lastQueuedCount,
    this.lastError,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['series_id'] = Variable<String>(seriesId);
    map['server_id'] = Variable<String>(serverId);
    map['user_id'] = Variable<String>(userId);
    map['series_name'] = Variable<String>(seriesName);
    map['quality_preset'] = Variable<String>(qualityPreset);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastCheckedAt != null) {
      map['last_checked_at'] = Variable<DateTime>(lastCheckedAt);
    }
    map['last_queued_count'] = Variable<int>(lastQueuedCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  AutoDownloadSubscriptionsCompanion toCompanion(bool nullToAbsent) {
    return AutoDownloadSubscriptionsCompanion(
      seriesId: Value(seriesId),
      serverId: Value(serverId),
      userId: Value(userId),
      seriesName: Value(seriesName),
      qualityPreset: Value(qualityPreset),
      createdAt: Value(createdAt),
      lastCheckedAt: lastCheckedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCheckedAt),
      lastQueuedCount: Value(lastQueuedCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory AutoDownloadSubscription.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AutoDownloadSubscription(
      seriesId: serializer.fromJson<String>(json['seriesId']),
      serverId: serializer.fromJson<String>(json['serverId']),
      userId: serializer.fromJson<String>(json['userId']),
      seriesName: serializer.fromJson<String>(json['seriesName']),
      qualityPreset: serializer.fromJson<String>(json['qualityPreset']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastCheckedAt: serializer.fromJson<DateTime?>(json['lastCheckedAt']),
      lastQueuedCount: serializer.fromJson<int>(json['lastQueuedCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'seriesId': serializer.toJson<String>(seriesId),
      'serverId': serializer.toJson<String>(serverId),
      'userId': serializer.toJson<String>(userId),
      'seriesName': serializer.toJson<String>(seriesName),
      'qualityPreset': serializer.toJson<String>(qualityPreset),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastCheckedAt': serializer.toJson<DateTime?>(lastCheckedAt),
      'lastQueuedCount': serializer.toJson<int>(lastQueuedCount),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  AutoDownloadSubscription copyWith({
    String? seriesId,
    String? serverId,
    String? userId,
    String? seriesName,
    String? qualityPreset,
    DateTime? createdAt,
    Value<DateTime?> lastCheckedAt = const Value.absent(),
    int? lastQueuedCount,
    Value<String?> lastError = const Value.absent(),
  }) => AutoDownloadSubscription(
    seriesId: seriesId ?? this.seriesId,
    serverId: serverId ?? this.serverId,
    userId: userId ?? this.userId,
    seriesName: seriesName ?? this.seriesName,
    qualityPreset: qualityPreset ?? this.qualityPreset,
    createdAt: createdAt ?? this.createdAt,
    lastCheckedAt: lastCheckedAt.present
        ? lastCheckedAt.value
        : this.lastCheckedAt,
    lastQueuedCount: lastQueuedCount ?? this.lastQueuedCount,
    lastError: lastError.present ? lastError.value : this.lastError,
  );
  AutoDownloadSubscription copyWithCompanion(
    AutoDownloadSubscriptionsCompanion data,
  ) {
    return AutoDownloadSubscription(
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      userId: data.userId.present ? data.userId.value : this.userId,
      seriesName: data.seriesName.present
          ? data.seriesName.value
          : this.seriesName,
      qualityPreset: data.qualityPreset.present
          ? data.qualityPreset.value
          : this.qualityPreset,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastCheckedAt: data.lastCheckedAt.present
          ? data.lastCheckedAt.value
          : this.lastCheckedAt,
      lastQueuedCount: data.lastQueuedCount.present
          ? data.lastQueuedCount.value
          : this.lastQueuedCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AutoDownloadSubscription(')
          ..write('seriesId: $seriesId, ')
          ..write('serverId: $serverId, ')
          ..write('userId: $userId, ')
          ..write('seriesName: $seriesName, ')
          ..write('qualityPreset: $qualityPreset, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastCheckedAt: $lastCheckedAt, ')
          ..write('lastQueuedCount: $lastQueuedCount, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    seriesId,
    serverId,
    userId,
    seriesName,
    qualityPreset,
    createdAt,
    lastCheckedAt,
    lastQueuedCount,
    lastError,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AutoDownloadSubscription &&
          other.seriesId == this.seriesId &&
          other.serverId == this.serverId &&
          other.userId == this.userId &&
          other.seriesName == this.seriesName &&
          other.qualityPreset == this.qualityPreset &&
          other.createdAt == this.createdAt &&
          other.lastCheckedAt == this.lastCheckedAt &&
          other.lastQueuedCount == this.lastQueuedCount &&
          other.lastError == this.lastError);
}

class AutoDownloadSubscriptionsCompanion
    extends UpdateCompanion<AutoDownloadSubscription> {
  final Value<String> seriesId;
  final Value<String> serverId;
  final Value<String> userId;
  final Value<String> seriesName;
  final Value<String> qualityPreset;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastCheckedAt;
  final Value<int> lastQueuedCount;
  final Value<String?> lastError;
  final Value<int> rowid;
  const AutoDownloadSubscriptionsCompanion({
    this.seriesId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.userId = const Value.absent(),
    this.seriesName = const Value.absent(),
    this.qualityPreset = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastCheckedAt = const Value.absent(),
    this.lastQueuedCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AutoDownloadSubscriptionsCompanion.insert({
    required String seriesId,
    required String serverId,
    required String userId,
    required String seriesName,
    required String qualityPreset,
    required DateTime createdAt,
    this.lastCheckedAt = const Value.absent(),
    this.lastQueuedCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : seriesId = Value(seriesId),
       serverId = Value(serverId),
       userId = Value(userId),
       seriesName = Value(seriesName),
       qualityPreset = Value(qualityPreset),
       createdAt = Value(createdAt);
  static Insertable<AutoDownloadSubscription> custom({
    Expression<String>? seriesId,
    Expression<String>? serverId,
    Expression<String>? userId,
    Expression<String>? seriesName,
    Expression<String>? qualityPreset,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastCheckedAt,
    Expression<int>? lastQueuedCount,
    Expression<String>? lastError,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (seriesId != null) 'series_id': seriesId,
      if (serverId != null) 'server_id': serverId,
      if (userId != null) 'user_id': userId,
      if (seriesName != null) 'series_name': seriesName,
      if (qualityPreset != null) 'quality_preset': qualityPreset,
      if (createdAt != null) 'created_at': createdAt,
      if (lastCheckedAt != null) 'last_checked_at': lastCheckedAt,
      if (lastQueuedCount != null) 'last_queued_count': lastQueuedCount,
      if (lastError != null) 'last_error': lastError,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AutoDownloadSubscriptionsCompanion copyWith({
    Value<String>? seriesId,
    Value<String>? serverId,
    Value<String>? userId,
    Value<String>? seriesName,
    Value<String>? qualityPreset,
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastCheckedAt,
    Value<int>? lastQueuedCount,
    Value<String?>? lastError,
    Value<int>? rowid,
  }) {
    return AutoDownloadSubscriptionsCompanion(
      seriesId: seriesId ?? this.seriesId,
      serverId: serverId ?? this.serverId,
      userId: userId ?? this.userId,
      seriesName: seriesName ?? this.seriesName,
      qualityPreset: qualityPreset ?? this.qualityPreset,
      createdAt: createdAt ?? this.createdAt,
      lastCheckedAt: lastCheckedAt ?? this.lastCheckedAt,
      lastQueuedCount: lastQueuedCount ?? this.lastQueuedCount,
      lastError: lastError ?? this.lastError,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (seriesId.present) {
      map['series_id'] = Variable<String>(seriesId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (seriesName.present) {
      map['series_name'] = Variable<String>(seriesName.value);
    }
    if (qualityPreset.present) {
      map['quality_preset'] = Variable<String>(qualityPreset.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastCheckedAt.present) {
      map['last_checked_at'] = Variable<DateTime>(lastCheckedAt.value);
    }
    if (lastQueuedCount.present) {
      map['last_queued_count'] = Variable<int>(lastQueuedCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AutoDownloadSubscriptionsCompanion(')
          ..write('seriesId: $seriesId, ')
          ..write('serverId: $serverId, ')
          ..write('userId: $userId, ')
          ..write('seriesName: $seriesName, ')
          ..write('qualityPreset: $qualityPreset, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastCheckedAt: $lastCheckedAt, ')
          ..write('lastQueuedCount: $lastQueuedCount, ')
          ..write('lastError: $lastError, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$OfflineDatabase extends GeneratedDatabase {
  _$OfflineDatabase(QueryExecutor e) : super(e);
  $OfflineDatabaseManager get managers => $OfflineDatabaseManager(this);
  late final $DownloadedItemsTable downloadedItems = $DownloadedItemsTable(
    this,
  );
  late final $AutoDownloadSubscriptionsTable autoDownloadSubscriptions =
      $AutoDownloadSubscriptionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    downloadedItems,
    autoDownloadSubscriptions,
  ];
}

typedef $$DownloadedItemsTableCreateCompanionBuilder =
    DownloadedItemsCompanion Function({
      required String itemId,
      required String serverId,
      required String type,
      required String name,
      Value<String?> localFilePath,
      required String metadataJson,
      Value<String?> posterPath,
      Value<String?> backdropPath,
      Value<String?> logoPath,
      Value<String?> thumbPath,
      required int downloadStatus,
      Value<double> downloadProgress,
      Value<String?> errorMessage,
      Value<int> fileSizeBytes,
      Value<int> playbackPositionTicks,
      Value<bool> progressSynced,
      Value<DateTime?> downloadedAt,
      Value<String> qualityPreset,
      Value<String?> seriesId,
      Value<String?> seasonId,
      Value<String?> seriesName,
      Value<String?> seasonName,
      Value<int?> indexNumber,
      Value<int?> parentIndexNumber,
      Value<String> downloadSource,
      Value<int> rowid,
    });
typedef $$DownloadedItemsTableUpdateCompanionBuilder =
    DownloadedItemsCompanion Function({
      Value<String> itemId,
      Value<String> serverId,
      Value<String> type,
      Value<String> name,
      Value<String?> localFilePath,
      Value<String> metadataJson,
      Value<String?> posterPath,
      Value<String?> backdropPath,
      Value<String?> logoPath,
      Value<String?> thumbPath,
      Value<int> downloadStatus,
      Value<double> downloadProgress,
      Value<String?> errorMessage,
      Value<int> fileSizeBytes,
      Value<int> playbackPositionTicks,
      Value<bool> progressSynced,
      Value<DateTime?> downloadedAt,
      Value<String> qualityPreset,
      Value<String?> seriesId,
      Value<String?> seasonId,
      Value<String?> seriesName,
      Value<String?> seasonName,
      Value<int?> indexNumber,
      Value<int?> parentIndexNumber,
      Value<String> downloadSource,
      Value<int> rowid,
    });

class $$DownloadedItemsTableFilterComposer
    extends Composer<_$OfflineDatabase, $DownloadedItemsTable> {
  $$DownloadedItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbPath => $composableBuilder(
    column: $table.thumbPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get downloadStatus => $composableBuilder(
    column: $table.downloadStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get downloadProgress => $composableBuilder(
    column: $table.downloadProgress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get playbackPositionTicks => $composableBuilder(
    column: $table.playbackPositionTicks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get progressSynced => $composableBuilder(
    column: $table.progressSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get qualityPreset => $composableBuilder(
    column: $table.qualityPreset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get seriesId => $composableBuilder(
    column: $table.seriesId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get seasonId => $composableBuilder(
    column: $table.seasonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get seriesName => $composableBuilder(
    column: $table.seriesName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get seasonName => $composableBuilder(
    column: $table.seasonName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get indexNumber => $composableBuilder(
    column: $table.indexNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parentIndexNumber => $composableBuilder(
    column: $table.parentIndexNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get downloadSource => $composableBuilder(
    column: $table.downloadSource,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DownloadedItemsTableOrderingComposer
    extends Composer<_$OfflineDatabase, $DownloadedItemsTable> {
  $$DownloadedItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbPath => $composableBuilder(
    column: $table.thumbPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get downloadStatus => $composableBuilder(
    column: $table.downloadStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get downloadProgress => $composableBuilder(
    column: $table.downloadProgress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get playbackPositionTicks => $composableBuilder(
    column: $table.playbackPositionTicks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get progressSynced => $composableBuilder(
    column: $table.progressSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qualityPreset => $composableBuilder(
    column: $table.qualityPreset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seriesId => $composableBuilder(
    column: $table.seriesId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seasonId => $composableBuilder(
    column: $table.seasonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seriesName => $composableBuilder(
    column: $table.seriesName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seasonName => $composableBuilder(
    column: $table.seasonName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get indexNumber => $composableBuilder(
    column: $table.indexNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parentIndexNumber => $composableBuilder(
    column: $table.parentIndexNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get downloadSource => $composableBuilder(
    column: $table.downloadSource,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DownloadedItemsTableAnnotationComposer
    extends Composer<_$OfflineDatabase, $DownloadedItemsTable> {
  $$DownloadedItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logoPath =>
      $composableBuilder(column: $table.logoPath, builder: (column) => column);

  GeneratedColumn<String> get thumbPath =>
      $composableBuilder(column: $table.thumbPath, builder: (column) => column);

  GeneratedColumn<int> get downloadStatus => $composableBuilder(
    column: $table.downloadStatus,
    builder: (column) => column,
  );

  GeneratedColumn<double> get downloadProgress => $composableBuilder(
    column: $table.downloadProgress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get playbackPositionTicks => $composableBuilder(
    column: $table.playbackPositionTicks,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get progressSynced => $composableBuilder(
    column: $table.progressSynced,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get qualityPreset => $composableBuilder(
    column: $table.qualityPreset,
    builder: (column) => column,
  );

  GeneratedColumn<String> get seriesId =>
      $composableBuilder(column: $table.seriesId, builder: (column) => column);

  GeneratedColumn<String> get seasonId =>
      $composableBuilder(column: $table.seasonId, builder: (column) => column);

  GeneratedColumn<String> get seriesName => $composableBuilder(
    column: $table.seriesName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get seasonName => $composableBuilder(
    column: $table.seasonName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get indexNumber => $composableBuilder(
    column: $table.indexNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get parentIndexNumber => $composableBuilder(
    column: $table.parentIndexNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get downloadSource => $composableBuilder(
    column: $table.downloadSource,
    builder: (column) => column,
  );
}

class $$DownloadedItemsTableTableManager
    extends
        RootTableManager<
          _$OfflineDatabase,
          $DownloadedItemsTable,
          DownloadedItem,
          $$DownloadedItemsTableFilterComposer,
          $$DownloadedItemsTableOrderingComposer,
          $$DownloadedItemsTableAnnotationComposer,
          $$DownloadedItemsTableCreateCompanionBuilder,
          $$DownloadedItemsTableUpdateCompanionBuilder,
          (
            DownloadedItem,
            BaseReferences<
              _$OfflineDatabase,
              $DownloadedItemsTable,
              DownloadedItem
            >,
          ),
          DownloadedItem,
          PrefetchHooks Function()
        > {
  $$DownloadedItemsTableTableManager(
    _$OfflineDatabase db,
    $DownloadedItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DownloadedItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DownloadedItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DownloadedItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> itemId = const Value.absent(),
                Value<String> serverId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> localFilePath = const Value.absent(),
                Value<String> metadataJson = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<String?> thumbPath = const Value.absent(),
                Value<int> downloadStatus = const Value.absent(),
                Value<double> downloadProgress = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<int> fileSizeBytes = const Value.absent(),
                Value<int> playbackPositionTicks = const Value.absent(),
                Value<bool> progressSynced = const Value.absent(),
                Value<DateTime?> downloadedAt = const Value.absent(),
                Value<String> qualityPreset = const Value.absent(),
                Value<String?> seriesId = const Value.absent(),
                Value<String?> seasonId = const Value.absent(),
                Value<String?> seriesName = const Value.absent(),
                Value<String?> seasonName = const Value.absent(),
                Value<int?> indexNumber = const Value.absent(),
                Value<int?> parentIndexNumber = const Value.absent(),
                Value<String> downloadSource = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DownloadedItemsCompanion(
                itemId: itemId,
                serverId: serverId,
                type: type,
                name: name,
                localFilePath: localFilePath,
                metadataJson: metadataJson,
                posterPath: posterPath,
                backdropPath: backdropPath,
                logoPath: logoPath,
                thumbPath: thumbPath,
                downloadStatus: downloadStatus,
                downloadProgress: downloadProgress,
                errorMessage: errorMessage,
                fileSizeBytes: fileSizeBytes,
                playbackPositionTicks: playbackPositionTicks,
                progressSynced: progressSynced,
                downloadedAt: downloadedAt,
                qualityPreset: qualityPreset,
                seriesId: seriesId,
                seasonId: seasonId,
                seriesName: seriesName,
                seasonName: seasonName,
                indexNumber: indexNumber,
                parentIndexNumber: parentIndexNumber,
                downloadSource: downloadSource,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String itemId,
                required String serverId,
                required String type,
                required String name,
                Value<String?> localFilePath = const Value.absent(),
                required String metadataJson,
                Value<String?> posterPath = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<String?> thumbPath = const Value.absent(),
                required int downloadStatus,
                Value<double> downloadProgress = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<int> fileSizeBytes = const Value.absent(),
                Value<int> playbackPositionTicks = const Value.absent(),
                Value<bool> progressSynced = const Value.absent(),
                Value<DateTime?> downloadedAt = const Value.absent(),
                Value<String> qualityPreset = const Value.absent(),
                Value<String?> seriesId = const Value.absent(),
                Value<String?> seasonId = const Value.absent(),
                Value<String?> seriesName = const Value.absent(),
                Value<String?> seasonName = const Value.absent(),
                Value<int?> indexNumber = const Value.absent(),
                Value<int?> parentIndexNumber = const Value.absent(),
                Value<String> downloadSource = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DownloadedItemsCompanion.insert(
                itemId: itemId,
                serverId: serverId,
                type: type,
                name: name,
                localFilePath: localFilePath,
                metadataJson: metadataJson,
                posterPath: posterPath,
                backdropPath: backdropPath,
                logoPath: logoPath,
                thumbPath: thumbPath,
                downloadStatus: downloadStatus,
                downloadProgress: downloadProgress,
                errorMessage: errorMessage,
                fileSizeBytes: fileSizeBytes,
                playbackPositionTicks: playbackPositionTicks,
                progressSynced: progressSynced,
                downloadedAt: downloadedAt,
                qualityPreset: qualityPreset,
                seriesId: seriesId,
                seasonId: seasonId,
                seriesName: seriesName,
                seasonName: seasonName,
                indexNumber: indexNumber,
                parentIndexNumber: parentIndexNumber,
                downloadSource: downloadSource,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DownloadedItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$OfflineDatabase,
      $DownloadedItemsTable,
      DownloadedItem,
      $$DownloadedItemsTableFilterComposer,
      $$DownloadedItemsTableOrderingComposer,
      $$DownloadedItemsTableAnnotationComposer,
      $$DownloadedItemsTableCreateCompanionBuilder,
      $$DownloadedItemsTableUpdateCompanionBuilder,
      (
        DownloadedItem,
        BaseReferences<
          _$OfflineDatabase,
          $DownloadedItemsTable,
          DownloadedItem
        >,
      ),
      DownloadedItem,
      PrefetchHooks Function()
    >;
typedef $$AutoDownloadSubscriptionsTableCreateCompanionBuilder =
    AutoDownloadSubscriptionsCompanion Function({
      required String seriesId,
      required String serverId,
      required String userId,
      required String seriesName,
      required String qualityPreset,
      required DateTime createdAt,
      Value<DateTime?> lastCheckedAt,
      Value<int> lastQueuedCount,
      Value<String?> lastError,
      Value<int> rowid,
    });
typedef $$AutoDownloadSubscriptionsTableUpdateCompanionBuilder =
    AutoDownloadSubscriptionsCompanion Function({
      Value<String> seriesId,
      Value<String> serverId,
      Value<String> userId,
      Value<String> seriesName,
      Value<String> qualityPreset,
      Value<DateTime> createdAt,
      Value<DateTime?> lastCheckedAt,
      Value<int> lastQueuedCount,
      Value<String?> lastError,
      Value<int> rowid,
    });

class $$AutoDownloadSubscriptionsTableFilterComposer
    extends Composer<_$OfflineDatabase, $AutoDownloadSubscriptionsTable> {
  $$AutoDownloadSubscriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get seriesId => $composableBuilder(
    column: $table.seriesId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get seriesName => $composableBuilder(
    column: $table.seriesName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get qualityPreset => $composableBuilder(
    column: $table.qualityPreset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastCheckedAt => $composableBuilder(
    column: $table.lastCheckedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastQueuedCount => $composableBuilder(
    column: $table.lastQueuedCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AutoDownloadSubscriptionsTableOrderingComposer
    extends Composer<_$OfflineDatabase, $AutoDownloadSubscriptionsTable> {
  $$AutoDownloadSubscriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get seriesId => $composableBuilder(
    column: $table.seriesId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seriesName => $composableBuilder(
    column: $table.seriesName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qualityPreset => $composableBuilder(
    column: $table.qualityPreset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastCheckedAt => $composableBuilder(
    column: $table.lastCheckedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastQueuedCount => $composableBuilder(
    column: $table.lastQueuedCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AutoDownloadSubscriptionsTableAnnotationComposer
    extends Composer<_$OfflineDatabase, $AutoDownloadSubscriptionsTable> {
  $$AutoDownloadSubscriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get seriesId =>
      $composableBuilder(column: $table.seriesId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get seriesName => $composableBuilder(
    column: $table.seriesName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get qualityPreset => $composableBuilder(
    column: $table.qualityPreset,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastCheckedAt => $composableBuilder(
    column: $table.lastCheckedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastQueuedCount => $composableBuilder(
    column: $table.lastQueuedCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$AutoDownloadSubscriptionsTableTableManager
    extends
        RootTableManager<
          _$OfflineDatabase,
          $AutoDownloadSubscriptionsTable,
          AutoDownloadSubscription,
          $$AutoDownloadSubscriptionsTableFilterComposer,
          $$AutoDownloadSubscriptionsTableOrderingComposer,
          $$AutoDownloadSubscriptionsTableAnnotationComposer,
          $$AutoDownloadSubscriptionsTableCreateCompanionBuilder,
          $$AutoDownloadSubscriptionsTableUpdateCompanionBuilder,
          (
            AutoDownloadSubscription,
            BaseReferences<
              _$OfflineDatabase,
              $AutoDownloadSubscriptionsTable,
              AutoDownloadSubscription
            >,
          ),
          AutoDownloadSubscription,
          PrefetchHooks Function()
        > {
  $$AutoDownloadSubscriptionsTableTableManager(
    _$OfflineDatabase db,
    $AutoDownloadSubscriptionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AutoDownloadSubscriptionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AutoDownloadSubscriptionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AutoDownloadSubscriptionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> seriesId = const Value.absent(),
                Value<String> serverId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> seriesName = const Value.absent(),
                Value<String> qualityPreset = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastCheckedAt = const Value.absent(),
                Value<int> lastQueuedCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AutoDownloadSubscriptionsCompanion(
                seriesId: seriesId,
                serverId: serverId,
                userId: userId,
                seriesName: seriesName,
                qualityPreset: qualityPreset,
                createdAt: createdAt,
                lastCheckedAt: lastCheckedAt,
                lastQueuedCount: lastQueuedCount,
                lastError: lastError,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String seriesId,
                required String serverId,
                required String userId,
                required String seriesName,
                required String qualityPreset,
                required DateTime createdAt,
                Value<DateTime?> lastCheckedAt = const Value.absent(),
                Value<int> lastQueuedCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AutoDownloadSubscriptionsCompanion.insert(
                seriesId: seriesId,
                serverId: serverId,
                userId: userId,
                seriesName: seriesName,
                qualityPreset: qualityPreset,
                createdAt: createdAt,
                lastCheckedAt: lastCheckedAt,
                lastQueuedCount: lastQueuedCount,
                lastError: lastError,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AutoDownloadSubscriptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$OfflineDatabase,
      $AutoDownloadSubscriptionsTable,
      AutoDownloadSubscription,
      $$AutoDownloadSubscriptionsTableFilterComposer,
      $$AutoDownloadSubscriptionsTableOrderingComposer,
      $$AutoDownloadSubscriptionsTableAnnotationComposer,
      $$AutoDownloadSubscriptionsTableCreateCompanionBuilder,
      $$AutoDownloadSubscriptionsTableUpdateCompanionBuilder,
      (
        AutoDownloadSubscription,
        BaseReferences<
          _$OfflineDatabase,
          $AutoDownloadSubscriptionsTable,
          AutoDownloadSubscription
        >,
      ),
      AutoDownloadSubscription,
      PrefetchHooks Function()
    >;

class $OfflineDatabaseManager {
  final _$OfflineDatabase _db;
  $OfflineDatabaseManager(this._db);
  $$DownloadedItemsTableTableManager get downloadedItems =>
      $$DownloadedItemsTableTableManager(_db, _db.downloadedItems);
  $$AutoDownloadSubscriptionsTableTableManager get autoDownloadSubscriptions =>
      $$AutoDownloadSubscriptionsTableTableManager(
        _db,
        _db.autoDownloadSubscriptions,
      );
}
