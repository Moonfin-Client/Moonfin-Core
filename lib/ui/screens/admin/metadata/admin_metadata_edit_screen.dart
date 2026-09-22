import 'dart:io';
import 'package:moonfin_design/moonfin_design.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../../../../util/image_mime.dart';
import '../../../../util/platform_detection.dart';
import '../../../widgets/adaptive/adaptive_dialog.dart';
import '../../../widgets/identify_dialog.dart';
import '../../detail/modern/widgets/details_tab_bar.dart';
import '../widgets/admin_form_styles.dart';

class AdminMetadataEditScreen extends StatefulWidget {
  final String itemId;

  const AdminMetadataEditScreen({super.key, required this.itemId});

  @override
  State<AdminMetadataEditScreen> createState() =>
      _AdminMetadataEditScreenState();
}

class _AdminMetadataEditScreenState extends State<AdminMetadataEditScreen> {
  int _selectedTab = 0;
  final _tabFocusNodes = <int, FocusNode>{};
  late final ItemsApi _itemsApi;
  late final AdminItemsApi _api;
  late final ImageApi _imageApi;

  bool _loading = true;
  bool _saving = false;
  ImageType? _busyImageType;
  String? _error;

  Map<String, dynamic> _raw = const {};
  Map<String, dynamic> _editorInfo = const {};
  List<Map<String, dynamic>> _externalIds = const [];

  final _nameController = TextEditingController();
  final _sortNameController = TextEditingController();
  final _originalTitleController = TextEditingController();
  final _premiereDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _productionYearController = TextEditingController();
  final _communityRatingController = TextEditingController();
  final _criticRatingController = TextEditingController();
  final _taglineController = TextEditingController();
  final _overviewController = TextEditingController();

  List<String> _genres = [];
  List<String> _tags = [];
  List<String> _studios = [];
  List<Map<String, String>> _people = const [];
  String _displayOrder = '';
  String _officialRating = '';
  String _customRating = '';
  String _metadataLanguage = '';
  String _metadataCountry = '';
  String _status = '';
  String _video3DFormat = '';
  List<String> _airDays = [];
  bool _lockData = false;
  List<String> _lockedFields = [];

  final Map<String, TextEditingController> _externalControllers = {};

  @override
  void initState() {
    super.initState();
    _itemsApi = GetIt.instance<MediaServerClient>().itemsApi;
    _api = GetIt.instance<MediaServerClient>().adminItemsApi;
    _imageApi = GetIt.instance<MediaServerClient>().imageApi;
    _load();
  }

  FocusNode _tabNode(int index) => _tabFocusNodes.putIfAbsent(
      index, () => FocusNode(debugLabel: 'admin_metadata_tab_$index'));

  @override
  void dispose() {
    for (final node in _tabFocusNodes.values) {
      node.dispose();
    }
    _nameController.dispose();
    _sortNameController.dispose();
    _originalTitleController.dispose();
    _premiereDateController.dispose();
    _endDateController.dispose();
    _productionYearController.dispose();
    _communityRatingController.dispose();
    _criticRatingController.dispose();
    _taglineController.dispose();
    _overviewController.dispose();
    for (final c in _externalControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await Future.wait<dynamic>([
        _itemsApi.getItem(widget.itemId),
        _api.getMetadataEditor(widget.itemId),
      ]);
      final raw = result[0] as Map<String, dynamic>;
      final editorInfo = result[1] as Map<String, dynamic>;
      final external = _asMapList(editorInfo['ExternalIdInfos']);

      if (!mounted) return;
      _hydrate(raw, external);
      setState(() {
        _raw = raw;
        _editorInfo = editorInfo;
        _externalIds = external;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = describeError(e, AppLocalizations.of(context));
        _loading = false;
      });
    }
  }

  void _hydrate(Map<String, dynamic> raw, List<Map<String, dynamic>> external) {
    _nameController.text = (raw['Name'] ?? '').toString();
    _sortNameController.text =
        (raw['SortName'] ?? raw['ForcedSortName'] ?? '').toString();
    _originalTitleController.text = (raw['OriginalTitle'] ?? '').toString();
    _premiereDateController.text = _dateOnly(raw['PremiereDate']);
    _endDateController.text = _dateOnly(raw['EndDate']);
    _productionYearController.text = (raw['ProductionYear'] ?? '').toString();
    _communityRatingController.text = (raw['CommunityRating'] ?? '').toString();
    _criticRatingController.text = (raw['CriticRating'] ?? '').toString();
    _taglineController.text =
        _firstString(raw['Taglines']) ?? (raw['Tagline'] ?? '').toString();
    _overviewController.text = (raw['Overview'] ?? '').toString();
    _displayOrder = (raw['DisplayOrder'] ?? '').toString();
    _officialRating = (raw['OfficialRating'] ?? '').toString();
    _customRating = (raw['CustomRating'] ?? '').toString();
    _metadataLanguage = (raw['PreferredMetadataLanguage'] ?? '').toString();
    _metadataCountry = (raw['PreferredMetadataCountryCode'] ?? '').toString();
    _status = (raw['Status'] ?? '').toString();
    _video3DFormat = (raw['Video3DFormat'] ?? '').toString();
    _airDays = _stringList(raw['AirDays']);
    _lockData = raw['LockData'] == true;
    _lockedFields = _stringList(raw['LockedFields']);

    _genres = _stringList(raw['Genres']);
    _tags = _stringList(raw['Tags']);
    _studios = _nameList(raw['Studios']);

    final peopleRaw = raw['People'];
    if (peopleRaw is List) {
      _people =
          peopleRaw
              .whereType<Map>()
              .map((e) => e.cast<String, dynamic>())
              .map(
                (e) => {
                  'Name': (e['Name'] ?? '').toString(),
                  'Role': (e['Role'] ?? '').toString(),
                  'Type': (e['Type'] ?? '').toString(),
                },
              )
              .toList();
    } else {
      _people = const [];
    }

    final providerIds =
        raw['ProviderIds'] is Map
            ? (raw['ProviderIds'] as Map).cast<String, dynamic>()
            : <String, dynamic>{};

    for (final c in _externalControllers.values) {
      c.dispose();
    }
    _externalControllers.clear();
    for (final idInfo in external) {
      final key = _externalKey(idInfo);
      final value = (providerIds[key] ?? '').toString();
      _externalControllers[key] = TextEditingController(text: value);
    }
  }

  List<Map<String, dynamic>> _asMapList(dynamic value) {
    if (value is List) {
      return value
          .whereType<Map>()
          .map((entry) => entry.cast<String, dynamic>())
          .toList();
    }
    return const [];
  }

  List<String> _stringList(dynamic value) {
    if (value is List) {
      return value.map((e) => e.toString()).where((e) => e.isNotEmpty).toList();
    }
    return <String>[];
  }

  List<String> _nameList(dynamic value) {
    if (value is List) {
      return value
          .map((e) => e is Map ? (e['Name'] ?? '').toString() : e.toString())
          .where((e) => e.isNotEmpty)
          .toList();
    }
    return <String>[];
  }

  String _dateOnly(dynamic value) {
    final text = (value ?? '').toString();
    if (text.isEmpty) return '';
    return text.length >= 10 ? text.substring(0, 10) : text;
  }

  String? _dateValue(String property, String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    final current = (_raw[property] ?? '').toString();
    if (current.length >= 10 && current.substring(0, 10) == trimmed) {
      return current;
    }

    return trimmed;
  }

  String? _nullIfEmpty(String s) => s.isEmpty ? null : s;

  String? _firstString(dynamic value) {
    if (value is List && value.isNotEmpty) {
      final first = value.first?.toString() ?? '';
      return first.isEmpty ? null : first;
    }
    return null;
  }

  String _externalKey(Map<String, dynamic> idInfo) {
    return (idInfo['Key'] ?? idInfo['Name'] ?? idInfo['Type'] ?? '').toString();
  }

  String _externalLabel(Map<String, dynamic> idInfo) {
    return (idInfo['DisplayName'] ??
            idInfo['Key'] ??
            idInfo['Name'] ??
            idInfo['Type'] ??
            '')
        .toString();
  }

  List<Map<String, dynamic>> _contentTypeOptions() {
    return _asMapList(_editorInfo['ContentTypeOptions']);
  }

  /// The metadata editor payload already carries the lists the server expects
  /// these fields to be picked from, so none of them costs an extra request.
  /// An older server that omits a list leaves the dropdown empty, and
  /// [adminCodeDropdown] falls back to a free-text field in that case.
  List<Map<String, dynamic>> _parentalRatingOptions() {
    return _asMapList(_editorInfo['ParentalRatingOptions']);
  }

  List<Map<String, dynamic>> _cultureOptions() {
    return _asMapList(_editorInfo['Cultures']);
  }

  List<Map<String, dynamic>> _countryOptions() {
    return _asMapList(_editorInfo['Countries']);
  }

  List<Map<String, String>> _fallbackContentTypeOptions() {
    final l10n = AppLocalizations.of(context);
    return [
      {'Value': '', 'Name': l10n.defaultLabel},
      {'Value': 'movies', 'Name': l10n.movies},
      {'Value': 'music', 'Name': l10n.music},
      {'Value': 'tvshows', 'Name': l10n.tvShows},
      {'Value': 'books', 'Name': l10n.books},
      {'Value': 'homevideos', 'Name': l10n.homeVideosAndPhotos},
      {'Value': 'musicvideos', 'Name': l10n.musicVideos},
      {'Value': 'mixed', 'Name': l10n.mixedMoviesAndShows},
    ];
  }

  List<Map<String, String>> _resolvedContentTypeOptions(String currentType) {
    final fromEditor =
        _contentTypeOptions()
            .map(
              (option) => {
                'Value': (option['Value'] ?? '').toString(),
                'Name': (option['Name'] ?? option['Value'] ?? '').toString(),
              },
            )
            .toList();

    final options =
        fromEditor.isNotEmpty ? fromEditor : _fallbackContentTypeOptions();
    if (currentType.isNotEmpty &&
        options.every((option) => option['Value'] != currentType)) {
      return [
        ...options,
        {'Value': currentType, 'Name': currentType},
      ];
    }
    return options;
  }

  String _imageUrl(ImageType type) {
    final tag = _imageTag(type);
    return switch (type) {
      ImageType.primary => _imageApi.getPrimaryImageUrl(
        widget.itemId,
        maxWidth: 600,
        tag: tag,
      ),
      ImageType.backdrop => _imageApi.getBackdropImageUrl(
        widget.itemId,
        maxWidth: 900,
        tag: tag,
      ),
      ImageType.logo => _imageApi.getLogoImageUrl(
        widget.itemId,
        maxWidth: 400,
        tag: tag,
      ),
      ImageType.banner => _imageApi.getBannerImageUrl(
        widget.itemId,
        maxWidth: 900,
        tag: tag,
      ),
      ImageType.thumb => _imageApi.getThumbImageUrl(
        widget.itemId,
        maxWidth: 500,
        tag: tag,
      ),
      _ => '',
    };
  }

  String? _imageTag(ImageType type) {
    final imageTags = _raw['ImageTags'];
    if (imageTags is Map) {
      final mapTag = imageTags[type.toServerString()];
      if (mapTag != null && mapTag.toString().isNotEmpty) {
        return mapTag.toString();
      }
    }

    final directTag = _raw['${type.toServerString()}ImageTag'];
    if (directTag != null && directTag.toString().isNotEmpty) {
      return directTag.toString();
    }

    final indexedTags = _raw['${type.toServerString()}ImageTags'];
    if (indexedTags is List && indexedTags.isNotEmpty) {
      final first = indexedTags.first?.toString() ?? '';
      if (first.isNotEmpty) {
        return first;
      }
    }

    return null;
  }


  Future<void> _runImageAction(
    ImageType type,
    Future<void> Function() action,
  ) async {
    setState(() => _busyImageType = type);
    try {
      await action();
      await _load();
    } finally {
      if (mounted) {
        setState(() => _busyImageType = null);
      }
    }
  }

  bool get _isSeries => (_raw['Type'] ?? '').toString() == 'Series';

  bool get _isBoxSet => (_raw['Type'] ?? '').toString() == 'BoxSet';

  bool get _isVideo =>
      (_raw['MediaType'] ?? '').toString() == 'Video' &&
      (_raw['Type'] ?? '').toString() != 'TvChannel';

  /// Episode ordering schemes the server understands for a series. The empty
  /// value means "aired order", which is what Jellyfin falls back to when the
  /// field is unset.
  List<(String, String)> _displayOrderOptions(AppLocalizations l10n) => [
    ('originalAirDate', l10n.adminMetadataDisplayOrderOriginalAirDate),
    ('absolute', l10n.adminMetadataDisplayOrderAbsolute),
    ('dvd', l10n.adminMetadataDisplayOrderDvd),
    ('digital', l10n.adminMetadataDisplayOrderDigital),
    ('storyArc', l10n.adminMetadataDisplayOrderStoryArc),
    ('production', l10n.adminMetadataDisplayOrderProduction),
    ('tv', l10n.adminMetadataDisplayOrderTv),
    ('alternate', l10n.adminMetadataDisplayOrderAlternate),
    ('regional', l10n.adminMetadataDisplayOrderRegional),
    ('altdvd', l10n.adminMetadataDisplayOrderAlternateDvd),
  ];

  /// How a collection sorts its children. Unrelated to the series scheme above
  /// despite sharing the `DisplayOrder` field name, so it keeps its own list.
  /// The server treats an unset value as `Default`.
  List<(String, String)> _boxSetDisplayOrderOptions(AppLocalizations l10n) => [
    ('Default', l10n.adminMetadataDisplayOrderDateModified),
    ('SortName', l10n.adminMetadataDisplayOrderSortName),
    ('PremiereDate', l10n.adminMetadataDisplayOrderReleaseDate),
  ];

  /// Ratings are stored by their display name, which is what the server sends
  /// back as each option's `Name`.
  Widget _ratingField(
    String label,
    String current,
    ValueChanged<String?> onChanged,
  ) {
    final l10n = AppLocalizations.of(context);
    return adminCodeDropdown(
      label: label,
      defaultLabel: l10n.none,
      current: current,
      rawItems: _parentalRatingOptions().map((r) {
        final name = r['Name']?.toString();
        return (name, name);
      }),
      onChanged: onChanged,
    );
  }

  /// PersonKind as the server defines it. 'Actor' is the sensible starting
  /// point for a new credit, so it is what an empty or unrecognised type falls
  /// back to rather than 'Unknown'.
  List<(String, String)> _personKinds(AppLocalizations l10n) => [
    ('Unknown', l10n.adminMetadataPersonKindUnknown),
    ('Actor', l10n.adminMetadataPersonKindActor),
    ('Director', l10n.adminMetadataPersonKindDirector),
    ('Composer', l10n.adminMetadataPersonKindComposer),
    ('Writer', l10n.adminMetadataPersonKindWriter),
    ('GuestStar', l10n.adminMetadataPersonKindGuestStar),
    ('Producer', l10n.adminMetadataPersonKindProducer),
    ('Conductor', l10n.adminMetadataPersonKindConductor),
    ('Lyricist', l10n.adminMetadataPersonKindLyricist),
    ('Arranger', l10n.adminMetadataPersonKindArranger),
    ('Engineer', l10n.adminMetadataPersonKindEngineer),
    ('Mixer', l10n.adminMetadataPersonKindMixer),
    ('Remixer', l10n.adminMetadataPersonKindRemixer),
    ('Creator', l10n.adminMetadataPersonKindCreator),
    ('Artist', l10n.adminMetadataPersonKindArtist),
    ('AlbumArtist', l10n.adminMetadataPersonKindAlbumArtist),
    ('Author', l10n.adminMetadataPersonKindAuthor),
    ('Illustrator', l10n.adminMetadataPersonKindIllustrator),
    ('Penciller', l10n.adminMetadataPersonKindPenciller),
    ('Inker', l10n.adminMetadataPersonKindInker),
    ('Colorist', l10n.adminMetadataPersonKindColorist),
    ('Letterer', l10n.adminMetadataPersonKindLetterer),
    ('CoverArtist', l10n.adminMetadataPersonKindCoverArtist),
    ('Editor', l10n.adminMetadataPersonKindEditor),
    ('Translator', l10n.adminMetadataPersonKindTranslator),
    ('Narrator', l10n.adminMetadataPersonKindNarrator),
  ];

  List<(String, String)> _weekdays(AppLocalizations l10n) => [
    ('Sunday', l10n.adminDaySunday),
    ('Monday', l10n.adminDayMonday),
    ('Tuesday', l10n.adminDayTuesday),
    ('Wednesday', l10n.adminDayWednesday),
    ('Thursday', l10n.adminDayThursday),
    ('Friday', l10n.adminDayFriday),
    ('Saturday', l10n.adminDaySaturday),
  ];

  /// Fields a refresh can be told to leave alone. The server UI swaps the
  /// production locations label on a person, and only offers runtime on a
  /// series.
  List<(String, String)> _lockableFields(AppLocalizations l10n) {
    final isPerson = (_raw['Type'] ?? '').toString() == 'Person';
    return [
      ('Name', l10n.adminMetadataLockFieldName),
      ('Overview', l10n.adminMetadataLockFieldOverview),
      ('Genres', l10n.adminMetadataLockFieldGenres),
      ('OfficialRating', l10n.adminMetadataLockFieldOfficialRating),
      ('Cast', l10n.adminMetadataLockFieldCast),
      (
        'ProductionLocations',
        isPerson
            ? l10n.adminMetadataLockFieldBirthLocation
            : l10n.adminMetadataLockFieldProductionLocations,
      ),
      if (_isSeries) ('Runtime', l10n.adminMetadataLockFieldRuntime),
      ('Studios', l10n.adminMetadataLockFieldStudios),
      ('Tags', l10n.adminMetadataLockFieldTags),
    ];
  }

  List<(String, String)> _seriesStatuses(AppLocalizations l10n) => [
    ('Continuing', l10n.continuing),
    ('Ended', l10n.ended),
    ('Unreleased', l10n.filterUnreleased),
  ];

  /// The abbreviations read the same in every language, so they carry no
  /// localized label of their own.
  static const _video3DFormats = <(String, String)>[
    ('HalfSideBySide', 'HSBS'),
    ('HalfTopAndBottom', 'HTAB'),
    ('FullSideBySide', 'FSBS'),
    ('FullTopAndBottom', 'FTAB'),
    ('MVC', 'MVC'),
  ];

  /// Sits under the two provider dropdowns. [adminCodeDropdown] builds its own
  /// decoration and has no slot for helper text, so the hint is a plain line
  /// under the field rather than a reason to widen the shared helper.
  Widget _inheritHint(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: AppSpacing.spaceXs),
      child: Text(
        l10n.adminMetadataInheritHelp,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Widget _airDaysField(AppLocalizations l10n) {
    final days = _weekdays(l10n);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        adminSectionLabel(
          context,
          l10n.adminMetadataAirDays,
          icon: Icons.event_repeat_outlined,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: days.map((day) {
            final selected = _airDays.contains(day.$1);
            return FilterChip(
              label: Text(day.$2),
              selected: selected,
              // Rebuild the whole list so the days keep calendar order however
              // they were toggled.
              onSelected: (on) => setState(() {
                _airDays = [
                  for (final d in days)
                    if (d.$1 == day.$1 ? on : _airDays.contains(d.$1)) d.$1,
                ];
              }),
            );
          }).toList(),
        ),
      ],
    );
  }

  /// A checked box means the field is left enabled for refreshes to overwrite,
  /// so the stored list is the inverse of what is ticked. Values the server
  /// locked that this list does not offer are left untouched.
  Widget _lockedFieldsEditor(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        adminSwitchRow(
          title: l10n.adminMetadataLockItem,
          value: _lockData,
          onChanged: (v) => setState(() => _lockData = v),
        ),
        if (!_lockData) ...[
          adminSectionLabel(
            context,
            l10n.adminMetadataEnabledFields,
            icon: Icons.lock_open_outlined,
          ),
          Text(
            l10n.adminMetadataEnabledFieldsHelp,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          ..._lockableFields(l10n).map((field) {
            final locked = _lockedFields.contains(field.$1);
            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: !locked,
              title: Text(field.$2),
              onChanged: (enabled) => setState(() {
                final next = [..._lockedFields]..remove(field.$1);
                if (enabled != true) next.add(field.$1);
                _lockedFields = next;
              }),
            );
          }),
        ],
      ],
    );
  }

  Widget _displayOrderField(AppLocalizations l10n) {
    if (_isBoxSet) {
      final options = _boxSetDisplayOrderOptions(l10n);
      final value = options.any((o) => o.$1 == _displayOrder)
          ? _displayOrder
          : options.first.$1;
      return DropdownButtonFormField<String>(
        initialValue: value,
        isExpanded: true,
        decoration: adminInputDecoration(label: l10n.adminMetadataFieldDisplayOrder),
        items: options
            .map((o) => DropdownMenuItem(value: o.$1, child: Text(o.$2)))
            .toList(),
        onChanged: (v) => setState(() => _displayOrder = v ?? options.first.$1),
      );
    }

    return adminCodeDropdown(
      label: l10n.adminMetadataFieldDisplayOrder,
      defaultLabel: l10n.adminMetadataDisplayOrderAired,
      current: _displayOrder,
      rawItems: _displayOrderOptions(l10n),
      onChanged: (v) => setState(() => _displayOrder = v ?? ''),
    );
  }

  static const _preservedItemFields = <String>[
    'Id',
    'IndexNumber',
    'ParentIndexNumber',
    'AirsBeforeSeasonNumber',
    'AirsAfterSeasonNumber',
    'AirsBeforeEpisodeNumber',
    'Album',
    'AlbumArtists',
    'ArtistItems',
    'AirTime',
    'DateCreated',
    'Height',
    'AspectRatio',
    'RunTimeTicks',
    'ProductionLocations',
    'DisplayOrder',
  ];

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context);
    final sortName = _sortNameController.text.trim();
    final tagline = _taglineController.text.trim();

    final update = <String, dynamic>{
      for (final key in _preservedItemFields)
        if (_raw.containsKey(key)) key: _raw[key],
      'Name': _nameController.text.trim(),
      'ForcedSortName': _nullIfEmpty(sortName),
      'OriginalTitle': _originalTitleController.text.trim(),
      'PremiereDate': _dateValue('PremiereDate', _premiereDateController.text),
      'EndDate': _dateValue('EndDate', _endDateController.text),
      'ProductionYear':
          int.tryParse(_productionYearController.text.trim()) ??
          _raw['ProductionYear'],
      'OfficialRating': _officialRating,
      'CustomRating': _customRating,
      'PreferredMetadataLanguage': _metadataLanguage,
      'PreferredMetadataCountryCode': _metadataCountry,
      'CommunityRating':
          double.tryParse(_communityRatingController.text.trim()) ??
          _raw['CommunityRating'],
      'CriticRating':
          double.tryParse(_criticRatingController.text.trim()) ??
          _raw['CriticRating'],
      if (_isSeries || _isBoxSet) 'DisplayOrder': _displayOrder,
      if (_isSeries) 'Status': _nullIfEmpty(_status),
      if (_isVideo) 'Video3DFormat': _nullIfEmpty(_video3DFormat),
      if (_isSeries) 'AirDays': _airDays,
      'LockData': _lockData,
      'LockedFields': _lockedFields,
      'Taglines': tagline.isEmpty ? <String>[] : [tagline],
      'Overview': _overviewController.text.trim(),
      'Genres': _genres,
      'Tags': _tags,
      'Studios': _studios.map((s) => {'Name': s}).toList(),
      'People': _people,
      'ProviderIds': Map<String, String>.fromEntries(
        _externalIds.map((info) {
          final key = _externalKey(info);
          return MapEntry(key, _externalControllers[key]?.text.trim() ?? '');
        }),
      ),
    };

    setState(() => _saving = true);
    try {
      await _api.updateItem(widget.itemId, update);
      if (!mounted) return;
      setState(() {
        _raw = {..._raw, ...update};
        _saving = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.adminMetadataSaved)));
    } catch (e) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.adminMetadataSaveFailed(describeError(e, l10n)))));
    }
  }

  Future<void> _refreshMetadata() async {
    final l10n = AppLocalizations.of(context);
    var recursive = false;
    var replaceAllMetadata = false;
    var replaceAllImages = false;

    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (ctx) => StatefulBuilder(
            builder:
                (ctx, setStateDialog) => AlertDialog.adaptive(
                  title: Text(l10n.adminRefreshMetadata),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CheckboxListTile(
                        value: recursive,
                        onChanged:
                            (v) => setStateDialog(() => recursive = v ?? false),
                        title: Text(l10n.adminMetadataRecursive),
                        contentPadding: EdgeInsets.zero,
                      ),
                      CheckboxListTile(
                        value: replaceAllMetadata,
                        onChanged:
                            (v) => setStateDialog(
                              () => replaceAllMetadata = v ?? false,
                            ),
                        title: Text(l10n.adminReplaceAllMetadata),
                        contentPadding: EdgeInsets.zero,
                      ),
                      CheckboxListTile(
                        value: replaceAllImages,
                        onChanged:
                            (v) => setStateDialog(
                              () => replaceAllImages = v ?? false,
                            ),
                        title: Text(l10n.adminReplaceAllImages),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  actions: [
                    adaptiveDialogAction(
                      onPressed: () => Navigator.pop(ctx, false),
                      child: Text(l10n.cancel),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(ctx, true),
                      child: Text(l10n.refresh),
                    ),
                  ],
                ),
          ),
    );

    if (confirmed != true || !mounted) return;

    try {
      final mode = replaceAllMetadata || replaceAllImages
          ? MetadataRefreshMode.fullRefresh
          : MetadataRefreshMode.defaultRefresh;
      await _api.refreshItem(
        widget.itemId,
        recursive: recursive,
        replaceAllMetadata: replaceAllMetadata,
        replaceAllImages: replaceAllImages,
        metadataRefreshMode: mode,
        imageRefreshMode: mode,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminMetadataRefreshRequested)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.adminMetadataRefreshFailed(describeError(e, l10n)))));
    }
  }

  Future<void> _searchAndApplyRemote() async {
    final searchType = (_raw['Type'] ?? '').toString();
    final name = (_raw['Name'] ?? '').toString();
    final year = int.tryParse((_raw['ProductionYear'] ?? '').toString());
    final path = _raw['Path']?.toString();
    final providerIds = _raw['ProviderIds'] is Map
        ? Map<String, dynamic>.from(_raw['ProviderIds'])
        : null;

    final applied = await IdentifyDialog.show(
      context,
      itemId: widget.itemId,
      // An empty type means unknown, so let the dialog resolve it from the item
      // rather than posting to /Items/RemoteSearch/ with no type at all.
      itemType: searchType.isEmpty ? null : searchType,
      itemName: name,
      itemYear: year,
      itemPath: path,
      providerIds: providerIds,
    );

    if (applied == true && mounted) {
      await _load();
    }
  }

  Future<void> _addChip(String title, List<String> target) async {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController();
    final value = await showDialog<String>(
      context: context,
      builder:
          (ctx) => AlertDialog.adaptive(
            title: Text(title),
            content: TextField(
              controller: controller,
              autofocus: true,
              decoration: adminInputDecoration(),
              onSubmitted: (v) => Navigator.pop(ctx, v.trim()),
            ),
            actions: [
              adaptiveDialogAction(
                onPressed: () => Navigator.pop(ctx),
                child: Text(l10n.cancel),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, controller.text.trim()),
                child: Text(l10n.add),
              ),
            ],
          ),
    );
    controller.dispose();

    if (value == null || !mounted) return;
    setState(() {
      if (!target.contains(value)) {
        target.add(value);
      }
    });
  }

  Future<void> _editPerson({int? index}) async {
    final l10n = AppLocalizations.of(context);
    final existing = index == null ? null : _people[index];
    final nameController = TextEditingController(text: existing?['Name'] ?? '');
    final roleController = TextEditingController(text: existing?['Role'] ?? '');
    final kinds = _personKinds(l10n);
    var type = existing?['Type'] ?? '';
    if (!kinds.any((k) => k.$1 == type)) {
      type = 'Actor';
    }

    final person = await showDialog<Map<String, String>>(
      context: context,
      builder:
          (ctx) => AlertDialog.adaptive(
            title: Text(index == null ? l10n.adminMetadataAddPerson : l10n.adminMetadataEditPerson),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: adminInputDecoration(label: l10n.name),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: roleController,
                    decoration:
                        adminInputDecoration(label: l10n.adminMetadataRole),
                  ),
                  const SizedBox(height: 12),
                  StatefulBuilder(
                    builder: (ctx, setStateDialog) =>
                        DropdownButtonFormField<String>(
                      initialValue: type,
                      isExpanded: true,
                      decoration:
                          adminInputDecoration(label: l10n.adminMetadataType),
                      items: kinds
                          .map((k) =>
                              DropdownMenuItem(value: k.$1, child: Text(k.$2)))
                          .toList(),
                      onChanged: (v) =>
                          setStateDialog(() => type = v ?? 'Actor'),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              adaptiveDialogAction(
                onPressed: () => Navigator.pop(ctx),
                child: Text(l10n.cancel),
              ),
              FilledButton(
                onPressed: () {
                  final name = nameController.text.trim();
                  if (name.isEmpty) {
                    Navigator.pop(ctx);
                    return;
                  }
                  Navigator.pop(ctx, {
                    'Name': name,
                    'Role': roleController.text.trim(),
                    'Type': type,
                  });
                },
                child: Text(index == null ? l10n.add : l10n.save),
              ),
            ],
          ),
    );

    nameController.dispose();
    roleController.dispose();

    if (person == null || !mounted) return;
    setState(() {
      if (index == null) {
        _people = [..._people, person];
      } else {
        final next = [..._people];
        next[index] = person;
        _people = next;
      }
    });
  }

  Future<void> _changeContentType() async {
    final l10n = AppLocalizations.of(context);
    final currentType = (_editorInfo['ContentType'] ?? '').toString();
    final options = _resolvedContentTypeOptions(currentType);
    var selectedValue = currentType;

    if (selectedValue.isEmpty && options.isNotEmpty) {
      selectedValue = options.first['Value'] ?? '';
    }

    final value = await showDialog<String>(
      context: context,
      builder:
          (ctx) => StatefulBuilder(
            builder:
                (ctx, setStateDialog) => AlertDialog.adaptive(
                  title: Text(l10n.adminUpdateContentType),
                  content: DropdownButtonFormField<String>(
                    initialValue: selectedValue,
                    decoration:
                        adminInputDecoration(label: l10n.adminContentType),
                    items:
                        options.map((option) {
                          final optionValue = option['Value'] ?? '';
                          final optionName = option['Name'] ?? optionValue;
                          return DropdownMenuItem<String>(
                            value: optionValue,
                            child: Text(
                              optionName.isEmpty ? l10n.adminMetadataDefault : optionName,
                            ),
                          );
                        }).toList(),
                    onChanged: (next) {
                      setStateDialog(() => selectedValue = next ?? '');
                    },
                  ),
                  actions: [
                    adaptiveDialogAction(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(l10n.cancel),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(ctx, selectedValue),
                      child: Text(l10n.adminMetadataUpdate),
                    ),
                  ],
                ),
          ),
    );

    if (value == null || value.isEmpty || !mounted) return;
    try {
      await _api.updateContentType(widget.itemId, value);
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.adminMetadataContentTypeUpdated)));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminMetadataContentTypeFailed(describeError(e, l10n)))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final compactHeader = screenWidth < 920;

    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminMetadataLoadFailed(_error!), textAlign: TextAlign.center),
            const SizedBox(height: 12),
            FilledButton.tonal(onPressed: _load, child: Text(l10n.retry)),
          ],
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child:
              compactHeader
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      adminScreenHeader(
                        context,
                        title: l10n.adminMetadataEditorTitle,
                        icon: Icons.edit_note_outlined,
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          FilledButton.tonalIcon(
                            onPressed: _refreshMetadata,
                            icon: const Icon(Icons.refresh),
                            label: Text(l10n.refresh),
                          ),
                          FilledButton.tonalIcon(
                            onPressed: _searchAndApplyRemote,
                            icon: const Icon(Icons.travel_explore),
                            label: Text(l10n.adminMetadataIdentify),
                          ),
                          FilledButton.tonalIcon(
                            onPressed: _changeContentType,
                            icon: const Icon(Icons.category_outlined),
                            label: Text(l10n.adminMetadataType),
                          ),
                          FilledButton.icon(
                            onPressed: _saving ? null : _save,
                            icon: const Icon(Icons.save),
                            label: Text(l10n.save),
                          ),
                        ],
                      ),
                    ],
                  )
                  : Row(
                    children: [
                      Icon(Icons.edit_note_outlined,
                          color: AppColorScheme.accent, size: 26),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          l10n.adminMetadataEditorTitle,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                            color: AppColorScheme.onSurface,
                          ),
                        ),
                      ),
                      FilledButton.tonalIcon(
                        onPressed: _refreshMetadata,
                        icon: const Icon(Icons.refresh),
                        label: Text(l10n.refresh),
                      ),
                      const SizedBox(width: 8),
                      FilledButton.tonalIcon(
                        onPressed: _searchAndApplyRemote,
                        icon: const Icon(Icons.travel_explore),
                        label: Text(l10n.adminMetadataIdentify),
                      ),
                      const SizedBox(width: 8),
                      FilledButton.tonalIcon(
                        onPressed: _changeContentType,
                        icon: const Icon(Icons.category_outlined),
                        label: Text(l10n.adminMetadataType),
                      ),
                      const SizedBox(width: 8),
                      FilledButton.icon(
                        onPressed: _saving ? null : _save,
                        icon: const Icon(Icons.save),
                        label: Text(l10n.save),
                      ),
                    ],
                  ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: DetailsTabBar(
            segmented: true,
            wrap: PlatformDetection.useMobileUi,
            labels: [
              l10n.general,
              l10n.adminMetadataDetails,
              l10n.adminMetadataExternalIds,
              l10n.adminMetadataImages,
            ],
            selectedIndex: _selectedTab,
            onSelect: (i) => setState(() => _selectedTab = i),
            focusNodeFor: _tabNode,
          ),
        ),
        Expanded(
          child: IndexedStack(
            index: _selectedTab,
            children: [
              _buildGeneralTab(),
              _buildDetailsTab(),
              _buildExternalTab(),
              _buildImagesTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGeneralTab() {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _field(_nameController, l10n.adminMetadataFieldTitle),
        const SizedBox(height: 12),
        _field(_sortNameController, l10n.adminMetadataFieldSortTitle),
        const SizedBox(height: 12),
        _field(_originalTitleController, l10n.adminMetadataFieldOriginalTitle),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _field(
                _premiereDateController,
                l10n.adminMetadataFieldPremiereDate,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _field(_endDateController, l10n.adminMetadataFieldEndDate),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _field(
          _productionYearController,
          l10n.adminMetadataFieldProductionYear,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _ratingField(
                l10n.adminMetadataFieldOfficialRating,
                _officialRating,
                (v) => setState(() => _officialRating = v ?? ''),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _ratingField(
                l10n.adminMetadataFieldCustomRating,
                _customRating,
                (v) => setState(() => _customRating = v ?? ''),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _field(
                _communityRatingController,
                l10n.adminMetadataFieldCommunityRating,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _field(
                _criticRatingController,
                l10n.adminMetadataFieldCriticRating,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
          ],
        ),
        if (_isSeries || _isBoxSet) ...[
          const SizedBox(height: 12),
          _displayOrderField(l10n),
        ],
        if (_isSeries) ...[
          const SizedBox(height: 12),
          adminCodeDropdown(
            label: l10n.status,
            defaultLabel: l10n.none,
            current: _status,
            rawItems: _seriesStatuses(l10n).map((o) => (o.$1, o.$2)),
            onChanged: (v) => setState(() => _status = v ?? ''),
          ),
          const SizedBox(height: 12),
          _airDaysField(l10n),
        ],
        if (_isVideo) ...[
          const SizedBox(height: 12),
          adminCodeDropdown(
            label: l10n.adminMetadataField3DFormat,
            defaultLabel: l10n.none,
            current: _video3DFormat,
            rawItems: _video3DFormats.map((o) => (o.$1, o.$2)),
            onChanged: (v) => setState(() => _video3DFormat = v ?? ''),
          ),
        ],
        const SizedBox(height: 12),
        _field(_taglineController, l10n.adminMetadataFieldTagline),
        const SizedBox(height: 12),
        _field(_overviewController, l10n.adminMetadataFieldOverview, maxLines: 8),
      ],
    );
  }

  Widget _buildDetailsTab() {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _chipEditor(l10n.adminMetadataGenres, _genres, () => _addChip(l10n.adminMetadataAddGenre, _genres)),
        const SizedBox(height: 12),
        _chipEditor(l10n.adminMetadataTags, _tags, () => _addChip(l10n.adminMetadataAddTag, _tags)),
        const SizedBox(height: 12),
        _chipEditor(
          l10n.adminMetadataStudios,
          _studios,
          () => _addChip(l10n.adminMetadataAddStudio, _studios),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: adminSectionLabel(context, l10n.adminMetadataPeople,
                  icon: Icons.people_outline),
            ),
            FilledButton.tonalIcon(
              onPressed: () => _editPerson(),
              icon: const Icon(Icons.add),
              label: Text(l10n.add),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (_people.isEmpty)
          Text(l10n.adminNoPeopleEntries)
        else
          ..._people.asMap().entries.map((entry) {
            final i = entry.key;
            final p = entry.value;
            final name = p['Name'] ?? '';
            final role = p['Role'] ?? '';
            final type = p['Type'] ?? '';
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(name),
              subtitle: Text(
                [role, type].where((e) => e.isNotEmpty).join(' • '),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => _editPerson(index: i),
                    icon: const Icon(Icons.edit_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        final next = [..._people];
                        next.removeAt(i);
                        _people = next;
                      });
                    },
                    icon: const Icon(Icons.delete_outline),
                  ),
                ],
              ),
            );
          }),
        const SizedBox(height: 8),
        adminSectionLabel(
          context,
          l10n.adminMetadataSettings,
          icon: Icons.travel_explore_outlined,
        ),
        adminCodeDropdown(
          label: l10n.adminMetadataDownloadLanguage,
          defaultLabel: l10n.adminLibDefault,
          current: _metadataLanguage,
          rawItems: _cultureOptions().map((c) => (
                (c['TwoLetterISOLanguageName'] ?? c['ThreeLetterISOLanguageName'])
                    ?.toString(),
                (c['DisplayName'] ?? c['Name'])?.toString(),
              )),
          onChanged: (v) => setState(() => _metadataLanguage = v ?? ''),
        ),
        _inheritHint(l10n),
        const SizedBox(height: 12),
        adminCodeDropdown(
          label: l10n.adminMetadataCountryRegion,
          defaultLabel: l10n.adminLibDefault,
          current: _metadataCountry,
          rawItems: _countryOptions().map((c) => (
                (c['TwoLetterISORegionName'] ?? c['Name'])?.toString(),
                (c['DisplayName'] ?? c['Name'])?.toString(),
              )),
          onChanged: (v) => setState(() => _metadataCountry = v ?? ''),
        ),
        _inheritHint(l10n),
        const SizedBox(height: 8),
        _lockedFieldsEditor(l10n),
      ],
    );
  }

  Widget _buildExternalTab() {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (_externalIds.isEmpty)
          Text(l10n.adminNoExternalIds)
        else
          ..._externalIds.map((info) {
            final key = _externalKey(info);
            final label = _externalLabel(info);
            final controller =
                _externalControllers[key] ??
                (_externalControllers[key] = TextEditingController());
            final url =
                (info['UrlFormatString'] ?? info['Url'] ?? '').toString();
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _field(controller, label),
                  if (url.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        url,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                ],
              ),
            );
          }),
      ],
    );
  }

  Widget _buildImagesTab() {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _imageCard(
          ImageType.primary,
          l10n.adminMetadataImagePrimary,
          _imageUrl(ImageType.primary),
          aspectRatio: 2 / 3,
          maxPreviewWidth: 200,
        ),
        const SizedBox(height: 12),
        _imageCard(
          ImageType.backdrop,
          l10n.adminMetadataImageBackdrop,
          _imageUrl(ImageType.backdrop),
          aspectRatio: 16 / 9,
        ),
        const SizedBox(height: 12),
        _imageCard(
          ImageType.logo,
          l10n.adminMetadataImageLogo,
          _imageUrl(ImageType.logo),
          aspectRatio: 16 / 5,
          maxPreviewWidth: 400,
        ),
        const SizedBox(height: 12),
        _imageCard(
          ImageType.banner,
          l10n.adminMetadataImageBanner,
          _imageUrl(ImageType.banner),
          aspectRatio: 5 / 1,
        ),
        const SizedBox(height: 12),
        _imageCard(
          ImageType.thumb,
          l10n.adminMetadataImageThumb,
          _imageUrl(ImageType.thumb),
          aspectRatio: 16 / 9,
          maxPreviewWidth: 320,
        ),
      ],
    );
  }

  Widget _imageCard(
    ImageType imageType,
    String label,
    String url, {
    double aspectRatio = 16 / 9,
    double maxPreviewWidth = double.infinity,
  }) {
    final l10n = AppLocalizations.of(context);
    final busy = _busyImageType == imageType;

    return adminGlassGroup(
      context,
      children: [
      Padding(
        padding: const EdgeInsets.all(AppSpacing.spaceLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxPreviewWidth),
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: Image.network(
                  url,
                  headers: serverImageHeaders,
                  fit: BoxFit.contain,
                  errorBuilder:
                      (_, _, _) => Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHighest,
                          borderRadius: AppRadius.circular(4),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 32,
                          ),
                        ),
                      ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.tonal(
                  onPressed: busy ? null : () => _searchRemoteImage(imageType),
                  child: Text(l10n.search),
                ),
                FilledButton.tonal(
                  onPressed: busy ? null : () => _uploadImage(imageType),
                  child: Text(l10n.adminMetadataUpload),
                ),
                FilledButton.tonal(
                  onPressed: busy ? null : () => _deleteImage(imageType),
                  child: Text(l10n.delete),
                ),
                if (busy)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      ],
    );
  }

  Future<void> _searchRemoteImage(ImageType imageType) async {
    final l10n = AppLocalizations.of(context);
    try {
      final selected = await showDialog<Map<String, dynamic>>(
        context: context,
        builder:
            (ctx) => _RemoteImagePickerDialog(
              api: _api,
              itemId: widget.itemId,
              imageType: imageType,
            ),
      );

      final imageUrl = (selected?['Url'] ?? '').toString();
      if (imageUrl.isEmpty || !mounted) {
        return;
      }

      await _runImageAction(imageType, () async {
        await _api.downloadRemoteImage(
          widget.itemId,
          imageType: imageType,
          imageUrl: imageUrl,
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.adminMetadataImageUpdated(imageType.toServerString())),
          ),
        );
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.adminMetadataImageDownloadFailed(describeError(e, l10n)))));
    }
  }

  Future<void> _uploadImage(ImageType imageType) async {
    final l10n = AppLocalizations.of(context);
    final result = await FilePicker.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: const ['png', 'jpg', 'jpeg', 'webp', 'gif', 'bmp'],
      withData: true,
    );

    if (!mounted || result == null || result.files.isEmpty) return;

    final messenger = ScaffoldMessenger.of(context);

    final file = result.files.single;
    final contentType = imageContentTypeForFileName(file.name);
    if (contentType == null) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.adminUnsupportedImageFormat)),
      );
      return;
    }

    final bytes =
        file.bytes ??
        (file.path != null ? await File(file.path!).readAsBytes() : null);
    if (!mounted) return;

    if (bytes == null) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.adminMetadataImageReadFailed)),
      );
      return;
    }

    try {
      await _runImageAction(imageType, () async {
        await _api.uploadItemImage(
          widget.itemId,
          imageType: imageType,
          bytes: bytes,
          contentType: contentType,
        );
        if (!mounted) return;
        messenger.showSnackBar(
          SnackBar(
            content: Text(l10n.adminMetadataImageUploaded(imageType.toServerString())),
          ),
        );
      });
    } catch (e) {
      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.adminMetadataImageUploadFailed(describeError(e, l10n)))),
      );
    }
  }

  Future<void> _deleteImage(ImageType imageType) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (ctx) => AlertDialog.adaptive(
            title: Text(l10n.adminMetadataDeleteImageTitle(imageType.toServerString())),
            content: Text(
              l10n.adminMetadataDeleteImageContent,
            ),
            actions: [
              adaptiveDialogAction(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(l10n.cancel),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(l10n.delete),
              ),
            ],
          ),
    );

    if (confirmed != true || !mounted) return;

    try {
      await _runImageAction(imageType, () async {
        await _api.deleteItemImage(widget.itemId, imageType: imageType);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.adminMetadataImageDeleted(imageType.toServerString())),
          ),
        );
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.adminMetadataImageDeleteFailed(describeError(e, l10n)))));
    }
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: adminInputDecoration(label: label),
    );
  }

  Widget _chipEditor(String label, List<String> values, VoidCallback onAdd) {
    final l10n = AppLocalizations.of(context);
    return adminGlassGroup(
      context,
      children: [
      Padding(
        padding: const EdgeInsets.all(AppSpacing.spaceLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                FilledButton.tonalIcon(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add),
                  label: Text(l10n.add),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (values.isEmpty)
              Text(l10n.none)
            else
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    values
                        .map(
                          (value) => Chip(
                            label: Text(value),
                            onDeleted: () {
                              setState(() {
                                values.remove(value);
                              });
                            },
                          ),
                        )
                        .toList(),
              ),
          ],
        ),
      ),
      ],
    );
  }
}

class _RemoteImagePickerDialog extends StatefulWidget {
  final AdminItemsApi api;
  final String itemId;
  final ImageType imageType;

  const _RemoteImagePickerDialog({
    required this.api,
    required this.itemId,
    required this.imageType,
  });

  @override
  State<_RemoteImagePickerDialog> createState() =>
      _RemoteImagePickerDialogState();
}

class _RemoteImagePickerDialogState extends State<_RemoteImagePickerDialog> {
  static const int _pageSize = 24;

  bool _loading = true;
  String? _error;
  String _providerName = '';
  int _page = 0;
  int _totalCount = 0;
  List<String> _providers = const [];
  List<Map<String, dynamic>> _images = const [];

  int get _totalPages =>
      _totalCount == 0 ? 1 : ((_totalCount - 1) ~/ _pageSize) + 1;

  double get _previewAspectRatio {
    return switch (widget.imageType) {
      ImageType.primary => 2 / 3,
      ImageType.backdrop => 16 / 9,
      ImageType.logo => 16 / 5,
      ImageType.banner => 5 / 1,
      ImageType.thumb => 16 / 9,
      _ => 16 / 9,
    };
  }

  double _gridChildAspectRatio(int crossAxisCount) {
    final preview = _previewAspectRatio;

    // Narrower cards on dense grids to preserve useful image area.
    if (crossAxisCount >= 3) {
      return switch (widget.imageType) {
        ImageType.primary => 0.68,
        ImageType.logo => 1.08,
        ImageType.banner => 1.65,
        _ => 0.92,
      };
    }

    return switch (widget.imageType) {
      ImageType.primary => 0.74,
      ImageType.logo => 1.16,
      ImageType.banner => 1.9,
      _ => preview > 1.7 ? 1.08 : 0.98,
    };
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await widget.api.getRemoteImages(
        widget.itemId,
        imageType: widget.imageType,
        startIndex: _page * _pageSize,
        limit: _pageSize,
        providerName: _providerName.isEmpty ? null : _providerName,
      );

      if (!mounted) return;
      setState(() {
        _images =
            (result['Images'] as List?)
                ?.whereType<Map>()
                .map((entry) => entry.cast<String, dynamic>())
                .toList() ??
            const [];
        if (_providers.isEmpty) {
          _providers =
              (result['Providers'] as List?)
                  ?.map((entry) => entry.toString())
                  .where((entry) => entry.isNotEmpty)
                  .toList() ??
              const [];
        }
        _totalCount = (result['TotalRecordCount'] as num?)?.toInt() ?? 0;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = describeError(e, AppLocalizations.of(context));
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final viewport = MediaQuery.sizeOf(context);
    final compact = viewport.width < 700;

    return Dialog(
      insetPadding:
          compact
              ? const EdgeInsets.symmetric(horizontal: 12, vertical: 20)
              : const EdgeInsets.symmetric(horizontal: 40, vertical: 28),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: compact ? viewport.width : 960,
          maxHeight: viewport.height * 0.88,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.adminMetadataChooseImage(widget.imageType.toServerString()),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LayoutBuilder(
                builder: (context, constraints) {
                  final narrowToolbar = constraints.maxWidth < 560;
                  final pager = Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed:
                            _loading || _page == 0
                                ? null
                                : () {
                                  setState(() => _page -= 1);
                                  _load();
                                },
                        icon: const Icon(Icons.chevron_left),
                      ),
                      Text('${_page + 1} / $_totalPages'),
                      IconButton(
                        onPressed:
                            _loading || _page + 1 >= _totalPages
                                ? null
                                : () {
                                  setState(() => _page += 1);
                                  _load();
                                },
                        icon: const Icon(Icons.chevron_right),
                      ),
                    ],
                  );

                  if (narrowToolbar) {
                    return Column(
                      children: [
                        DropdownButtonFormField<String>(
                          initialValue: _providerName,
                          decoration: adminInputDecoration(
                              label: l10n.adminMetadataProvider),
                          items: [
                            DropdownMenuItem<String>(
                              value: '',
                              child: Text(l10n.adminAllProviders),
                            ),
                            ..._providers.map(
                              (provider) => DropdownMenuItem<String>(
                                value: provider,
                                child: Text(provider),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _providerName = value ?? '';
                              _page = 0;
                            });
                            _load();
                          },
                        ),
                        const SizedBox(height: 8),
                        pager,
                      ],
                    );
                  }

                  return Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: _providerName,
                          decoration: adminInputDecoration(
                              label: l10n.adminMetadataProvider),
                          items: [
                            DropdownMenuItem<String>(
                              value: '',
                              child: Text(l10n.adminAllProviders),
                            ),
                            ..._providers.map(
                              (provider) => DropdownMenuItem<String>(
                                value: provider,
                                child: Text(provider),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _providerName = value ?? '';
                              _page = 0;
                            });
                            _load();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      pager,
                    ],
                  );
                },
              ),
              const SizedBox(height: 12),
              Expanded(
                child:
                    _loading
                        ? const Center(child: CircularProgressIndicator())
                        : _error != null
                        ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(_error!, textAlign: TextAlign.center),
                              const SizedBox(height: 12),
                              FilledButton.tonal(
                                onPressed: _load,
                                child: Text(l10n.retry),
                              ),
                            ],
                          ),
                        )
                        : _images.isEmpty
                        ? Center(child: Text(l10n.adminNoRemoteImages))
                        : LayoutBuilder(
                          builder: (context, constraints) {
                            final maxWidth = constraints.maxWidth;
                            final crossAxisCount =
                                maxWidth >= 980
                                    ? 4
                                    : maxWidth >= 660
                                    ? 3
                                    : maxWidth >= 420
                                    ? 2
                                    : 1;

                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12,
                                    childAspectRatio: _gridChildAspectRatio(
                                      crossAxisCount,
                                    ),
                                  ),
                              itemCount: _images.length,
                              itemBuilder: (context, index) {
                                final image = _images[index];
                                final previewUrl =
                                    (image['ThumbnailUrl'] ??
                                            image['Url'] ??
                                            '')
                                        .toString();
                                final providerName =
                                    (image['ProviderName'] ?? '').toString();
                                final size = [image['Width'], image['Height']]
                                    .where((value) => value != null)
                                    .map((value) => value.toString())
                                    .join(' x ');

                                return InkWell(
                                  onTap: () => Navigator.pop(context, image),
                                  borderRadius: AppRadius.circular(12),
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: AspectRatio(
                                            aspectRatio: _previewAspectRatio,
                                            child:
                                                previewUrl.isEmpty
                                                    ? Container(
                                                      color:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .surfaceContainerHighest,
                                                      child: const Center(
                                                        child: Icon(
                                                          Icons
                                                              .image_not_supported_outlined,
                                                        ),
                                                      ),
                                                    )
                                                    : Image.network(
                                                      previewUrl,
                                                      headers:
                                                          serverImageHeaders,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                providerName.isEmpty
                                                    ? l10n.adminMetadataRemoteImage
                                                    : providerName,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    Theme.of(
                                                      context,
                                                    ).textTheme.titleSmall,
                                              ),
                                              if (size.isNotEmpty)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        top: 2,
                                                      ),
                                                  child: Text(
                                                    size,
                                                    style:
                                                        Theme.of(
                                                          context,
                                                        ).textTheme.bodySmall,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10n.cancel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
