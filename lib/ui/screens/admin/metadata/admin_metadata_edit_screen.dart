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
import '../admin_draft.dart';
import '../admin_nav.dart';
import '../libraries/admin_library_dialogs.dart';
import '../widgets/admin_form_styles.dart';

/// The item fields a save posts. Save lays the edits over a fresh GET of the
/// item and sends these keys, so a field this form doesn't edit
/// (OriginalLanguage, a provider id the server doesn't list) goes back as
/// stored instead of being cleared.
const _itemFields = <String>[
  'Id',
  'Name',
  'OriginalTitle',
  'OriginalLanguage',
  'ForcedSortName',
  'CommunityRating',
  'CriticRating',
  'IndexNumber',
  'AirsBeforeSeasonNumber',
  'AirsAfterSeasonNumber',
  'AirsBeforeEpisodeNumber',
  'ParentIndexNumber',
  'DisplayOrder',
  'Album',
  'AlbumArtists',
  'ArtistItems',
  'SeriesName',
  'Overview',
  'Status',
  'AirDays',
  'AirTime',
  'Genres',
  'Tags',
  'Studios',
  'PremiereDate',
  'DateCreated',
  'EndDate',
  'ProductionYear',
  'Height',
  'AspectRatio',
  'Video3DFormat',
  'OfficialRating',
  'CustomRating',
  'People',
  'LockData',
  'LockedFields',
  'ProviderIds',
  'PreferredMetadataLanguage',
  'PreferredMetadataCountryCode',
  'ProductionLocations',
  'RunTimeTicks',
  'Taglines',
];

/// Series runtime is edited in minutes.
const _ticksPerMinute = 600000000;

class AdminMetadataEditScreen extends StatefulWidget {
  final String itemId;

  const AdminMetadataEditScreen({super.key, required this.itemId});

  @override
  State<AdminMetadataEditScreen> createState() =>
      _AdminMetadataEditScreenState();
}

class _AdminMetadataEditScreenState extends State<AdminMetadataEditScreen>
    with AdminDraftHost {
  int _selectedTab = 0;
  final _tabFocusNodes = <int, FocusNode>{};
  late final ItemsApi _itemsApi;
  late final AdminItemsApi _api;
  late final ImageApi _imageApi;

  bool _loading = true;
  ImageType? _busyImageType;
  String? _error;

  /// The draft's working copy of the item.
  Map<String, dynamic> _item = {};

  /// The item as last fetched: image tags, and the stored time of each date.
  Map<String, dynamic> _stored = const {};
  Map<String, dynamic> _editorInfo = const {};
  List<Map<String, dynamic>> _externalIds = const [];

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
    super.dispose();
  }

  /// Emby lists tags only as TagItems. Its items API writes Tags back there.
  static Map<String, dynamic> _withTags(Map<String, dynamic> item) {
    final tagItems = item['TagItems'];
    if (item['Tags'] == null && tagItems is List) {
      item['Tags'] = [
        for (final tag in tagItems)
          if (tag is Map) tag['Name'],
      ];
    }
    return item;
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await Future.wait<dynamic>([
        _itemsApi.getItem(widget.itemId).then(_withTags),
        _api.getMetadataEditor(widget.itemId),
      ]);
      final item = result[0] as Map<String, dynamic>;
      final editorInfo = result[1] as Map<String, dynamic>;

      if (!mounted) return;
      setState(() {
        _item = item;
        _stored = Map.of(item);
        _editorInfo = editorInfo;
        _externalIds = _asMapList(editorInfo['ExternalIdInfos']);
        _loading = false;
      });
      hostDraft(
        AdminDraft.single(
          working: item,
          reload: () => _itemsApi.getItem(widget.itemId).then(_withTags),
          post: (merged) => _api.updateItem(widget.itemId, {
            for (final key in _itemFields)
              if (merged.containsKey(key)) key: merged[key],
          }),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = describeError(e, AppLocalizations.of(context));
        _loading = false;
      });
    }
  }

  void _set(String key, Object? value) {
    setState(() => _item[key] = value);
    edited();
  }

  /// Text and choices write null for an empty value the item never had, so
  /// opening and leaving a field doesn't count as an edit.
  void _setText(String key, String? value, {bool rebuild = false}) {
    final v = (value ?? '').isEmpty && _stored[key] == null ? null : value;
    if (rebuild) {
      _set(key, v);
    } else {
      _item[key] = v;
      edited();
    }
  }

  String _str(String key) => (_item[key] ?? '').toString();

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

  /// Keeps the stored time when the day is unchanged.
  String? _dateValue(String property, String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return null;
    final current = (_stored[property] ?? '').toString();
    if (current.length >= 10 && current.substring(0, 10) == trimmed) {
      return current;
    }
    return trimmed;
  }

  String _externalKey(Map<String, dynamic> idInfo) {
    return (idInfo['Key'] ?? idInfo['Name'] ?? idInfo['Type'] ?? '').toString();
  }

  String _externalLabel(Map<String, dynamic> idInfo) => externalIdLabel(
    AppLocalizations.of(context),
    '${idInfo['Name'] ?? idInfo['Key'] ?? ''}',
    idInfo['Type']?.toString(),
  );

  /// The server leaves this empty for items that can't carry a content type,
  /// and the content type action is hidden then.
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

  Iterable<(String?, String?)> _cultureItems() =>
      _asMapList(_editorInfo['Cultures']).map((c) => (
            (c['TwoLetterISOLanguageName'] ?? c['ThreeLetterISOLanguageName'])
                ?.toString(),
            (c['DisplayName'] ?? c['Name'])?.toString(),
          ));

  Iterable<(String?, String?)> _countryItems() =>
      _asMapList(_editorInfo['Countries']).map((c) => (
            (c['TwoLetterISORegionName'] ?? c['Name'])?.toString(),
            (c['DisplayName'] ?? c['Name'])?.toString(),
          ));

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
    final imageTags = _stored['ImageTags'];
    if (imageTags is Map) {
      final mapTag = imageTags[type.toServerString()];
      if (mapTag != null && mapTag.toString().isNotEmpty) {
        return mapTag.toString();
      }
    }

    final directTag = _stored['${type.toServerString()}ImageTag'];
    if (directTag != null && directTag.toString().isNotEmpty) {
      return directTag.toString();
    }

    final indexedTags = _stored['${type.toServerString()}ImageTags'];
    if (indexedTags is List && indexedTags.isNotEmpty) {
      final first = indexedTags.first?.toString() ?? '';
      if (first.isNotEmpty) {
        return first;
      }
    }

    return null;
  }

  /// Images aren't part of the draft, so an image change refetches the item
  /// for its tags only and leaves unsaved edits alone.
  Future<void> _runImageAction(
    ImageType type,
    Future<void> Function() action,
  ) async {
    setState(() => _busyImageType = type);
    try {
      await action();
      final fresh = await _itemsApi.getItem(widget.itemId);
      if (mounted) setState(() => _stored = fresh);
    } finally {
      if (mounted) {
        setState(() => _busyImageType = null);
      }
    }
  }

  String get _type => _str('Type');

  bool get _isSeries => _type == 'Series';

  bool get _isBoxSet => _type == 'BoxSet';

  bool get _isPerson => _type == 'Person';

  bool get _isTvChannel => _type == 'TvChannel';

  bool get _isVideoMedia => _str('MediaType') == 'Video';

  bool get _isVideo => _isVideoMedia && !_isTvChannel;

  /// People, genres, studios, ratings and community rating are hidden for
  /// these.
  bool get _isNameOnlyType => const [
    'Person',
    'Genre',
    'Studio',
    'MusicGenre',
    'TvChannel',
  ].contains(_type);

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
  Widget _ratingField(String label, String key) {
    final l10n = AppLocalizations.of(context);
    return adminCodeDropdown(
      label: label,
      defaultLabel: l10n.none,
      current: _str(key),
      rawItems: _parentalRatingOptions().map((r) {
        final name = r['Name']?.toString();
        return (name, name);
      }),
      onChanged: (v) => _setText(key, v, rebuild: true),
    );
  }

  /// PersonKind as the server defines it, less Unknown.
  List<(String, String)> _personKinds(AppLocalizations l10n) => [
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
    return [
      ('Name', l10n.adminMetadataLockFieldName),
      ('Overview', l10n.adminMetadataLockFieldOverview),
      ('Genres', l10n.adminMetadataLockFieldGenres),
      ('OfficialRating', l10n.adminMetadataLockFieldOfficialRating),
      ('Cast', l10n.adminMetadataLockFieldCast),
      (
        'ProductionLocations',
        _isPerson
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

  Widget _textRow(String key, String label,
      {int maxLines = 1, String? helper}) {
    return adminFieldRow(
      label: label,
      helper: helper,
      child: TextFormField(
        initialValue: _str(key),
        minLines: maxLines > 1 ? 3 : null,
        maxLines: maxLines,
        decoration: adminInputDecoration(),
        onChanged: (v) => _setText(key, v),
      ),
    );
  }

  /// An empty field clears the value.
  Widget _numberRow(String key, String label, {bool decimal = false}) {
    return adminFieldRow(
      label: label,
      child: TextFormField(
        initialValue: _str(key),
        keyboardType: TextInputType.numberWithOptions(decimal: decimal),
        decoration: adminInputDecoration(),
        onChanged: (v) {
          final text = v.trim();
          final num? value = text.isEmpty
              ? null
              : (decimal ? double.tryParse(text) : int.tryParse(text));
          if (text.isNotEmpty && value == null) return;
          _item[key] = value;
          edited();
        },
      ),
    );
  }

  Widget _dateRow(String key, String label) {
    return adminFieldRow(
      label: label,
      child: TextFormField(
        initialValue: _dateOnly(_item[key]),
        keyboardType: TextInputType.datetime,
        decoration: adminInputDecoration(hint: 'YYYY-MM-DD'),
        onChanged: (v) {
          _item[key] = _dateValue(key, v);
          edited();
        },
      ),
    );
  }

  /// Names separated by semicolons, sent as `{Name}` entries.
  Widget _namesRow(String key, String label) {
    final l10n = AppLocalizations.of(context);
    return adminFieldRow(
      label: label,
      helper: l10n.adminMetadataNamesHelp,
      child: TextFormField(
        initialValue: _nameList(_item[key]).join(';'),
        decoration: adminInputDecoration(),
        onChanged: (v) {
          _item[key] = [
            for (final name in v.trim().split(';'))
              if (name.isNotEmpty) {'Name': name},
          ];
          edited();
        },
      ),
    );
  }

  Widget _airDaysField(AppLocalizations l10n) {
    final days = _weekdays(l10n);
    final selected = _stringList(_item['AirDays']);
    return adminFieldRow(
      label: l10n.adminMetadataAirDays,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: days.map((day) {
          return FilterChip(
            label: Text(day.$2),
            selected: selected.contains(day.$1),
            // Rebuild the whole list so the days keep calendar order however
            // they were toggled.
            onSelected: (on) => _set('AirDays', [
              for (final d in days)
                if (d.$1 == day.$1 ? on : selected.contains(d.$1)) d.$1,
            ]),
          );
        }).toList(),
      ),
    );
  }

  Widget _displayOrderField(AppLocalizations l10n) {
    final current = _str('DisplayOrder');
    if (_isBoxSet) {
      final options = _boxSetDisplayOrderOptions(l10n);
      final value = options.any((o) => o.$1 == current)
          ? current
          : options.first.$1;
      return adminFieldRow(
        label: l10n.adminMetadataFieldDisplayOrder,
        child: DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          decoration: adminInputDecoration(),
          items: options
              .map((o) => DropdownMenuItem(value: o.$1, child: Text(o.$2)))
              .toList(),
          onChanged: (v) => _set('DisplayOrder', v ?? options.first.$1),
        ),
      );
    }

    return adminCodeDropdown(
      label: l10n.adminMetadataFieldDisplayOrder,
      defaultLabel: l10n.adminMetadataDisplayOrderAired,
      current: current,
      rawItems: _displayOrderOptions(l10n),
      onChanged: (v) => _setText('DisplayOrder', v, rebuild: true),
    );
  }

  Future<void> _searchAndApplyRemote() async {
    final providerIds = _item['ProviderIds'] is Map
        ? Map<String, dynamic>.from(_item['ProviderIds'])
        : null;

    final identified = await IdentifyDialog.show(
      context,
      itemId: widget.itemId,
      // An empty type means unknown, so let the dialog resolve it from the item
      // rather than posting to /Items/RemoteSearch/ with no type at all.
      itemType: _type.isEmpty ? null : _type,
      itemName: _str('Name'),
      itemYear: int.tryParse(_str('ProductionYear')),
      itemPath: _item['Path']?.toString(),
      providerIds: providerIds,
    );

    if (identified != null && mounted) {
      await _load();
    }
  }

  Future<String?> _promptText(String title) async {
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
    return value == null || value.isEmpty || !mounted ? null : value;
  }

  Future<void> _editPerson({int? index}) async {
    final l10n = AppLocalizations.of(context);
    final people = _asMapList(_item['People']);
    final existing = index == null ? null : people[index];
    final nameController =
        TextEditingController(text: (existing?['Name'] ?? '').toString());
    final roleController =
        TextEditingController(text: (existing?['Role'] ?? '').toString());
    final kinds = _personKinds(l10n);
    var type = (existing?['Type'] ?? '').toString();
    if (!kinds.any((k) => k.$1 == type)) {
      type = 'Actor';
    }

    final person = await showDialog<Map<String, dynamic>>(
      context: context,
      builder:
          (ctx) => StatefulBuilder(
            builder: (ctx, setStateDialog) => AlertDialog.adaptive(
              title: Text(index == null
                  ? l10n.adminMetadataAddPerson
                  : l10n.adminMetadataEditPerson),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: adminInputDecoration(label: l10n.name),
                    ),
                    const SizedBox(height: 12),
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
                    if (type == 'Actor' || type == 'GuestStar') ...[
                      const SizedBox(height: 12),
                      TextField(
                        controller: roleController,
                        decoration:
                            adminInputDecoration(label: l10n.adminMetadataRole),
                      ),
                    ],
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
                    final role = roleController.text.trim();
                    Navigator.pop(ctx, {
                      ...?existing,
                      'Name': name,
                      'Role': role.isEmpty ? null : role,
                      'Type': type,
                    });
                  },
                  child: Text(index == null ? l10n.add : l10n.save),
                ),
              ],
            ),
          ),
    );

    nameController.dispose();
    roleController.dispose();

    if (person == null || !mounted) return;
    _set('People', [
      for (var i = 0; i < people.length; i++) i == index ? person : people[i],
      if (index == null) person,
    ]);
  }

  Future<void> _changeContentType() async {
    final l10n = AppLocalizations.of(context);
    final currentType = (_editorInfo['ContentType'] ?? '').toString();
    final options = [
      for (final option in _contentTypeOptions())
        (
          (option['Value'] ?? '').toString(),
          (option['Name'] ?? option['Value'] ?? '').toString(),
        ),
    ];
    if (options.every((o) => o.$1 != currentType)) {
      options.add((currentType, currentType));
    }
    var selectedValue = currentType;

    final value = await showDialog<String>(
      context: context,
      builder:
          (ctx) => StatefulBuilder(
            builder:
                (ctx, setStateDialog) => AlertDialog.adaptive(
                  title: Text(l10n.adminUpdateContentType),
                  content: DropdownButtonFormField<String>(
                    initialValue: selectedValue,
                    isExpanded: true,
                    decoration:
                        adminInputDecoration(label: l10n.adminContentType),
                    items: [
                      for (final (optionValue, optionName) in options)
                        DropdownMenuItem<String>(
                          value: optionValue,
                          child: Text(optionName.isEmpty
                              ? l10n.adminMetadataDefault
                              : optionName),
                        ),
                    ],
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

    // An empty value is Inherit, which removes the override. Only a change is
    // posted.
    if (value == null || value == currentType || !mounted) return;
    try {
      await _api.updateContentType(widget.itemId, value);
      if (!mounted) return;
      setState(() => _editorInfo = {..._editorInfo, 'ContentType': value});
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

  List<Widget> _headerActions(AppLocalizations l10n) => [
    FilledButton.tonalIcon(
      onPressed: () => showRefreshItemDialog(context, itemId: widget.itemId),
      icon: const Icon(Icons.refresh),
      label: Text(l10n.refresh),
    ),
    FilledButton.tonalIcon(
      onPressed: _searchAndApplyRemote,
      icon: const Icon(Icons.travel_explore),
      label: Text(l10n.adminMetadataIdentify),
    ),
    // Emby has no per-item content type.
    if (_contentTypeOptions().isNotEmpty && !AdminServerScope.isEmby(context))
      FilledButton.tonalIcon(
        onPressed: _changeContentType,
        icon: const Icon(Icons.category_outlined),
        label: Text(l10n.adminContentType),
      ),
  ];

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

    final actions = _headerActions(l10n);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child:
              compactHeader
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      adminScreenHeader(
                        context,
                        title: l10n.adminMetadataEditorTitle,
                        subtitle: _str('Name'),
                        icon: Icons.edit_note_outlined,
                      ),
                      Wrap(spacing: 8, runSpacing: 8, children: actions),
                      const SizedBox(height: 12),
                    ],
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: adminScreenHeader(
                          context,
                          title: l10n.adminMetadataEditorTitle,
                          subtitle: _str('Name'),
                          icon: Icons.edit_note_outlined,
                        ),
                      ),
                      for (final action in actions) ...[
                        const SizedBox(width: 8),
                        action,
                      ],
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
          child: draftKeyed(
            IndexedStack(
              index: _selectedTab,
              children: [
                _buildGeneralTab(),
                _buildDetailsTab(),
                _buildExternalTab(),
                _buildImagesTab(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  EdgeInsets get _tabPadding => EdgeInsets.fromLTRB(
      16, 4, 16, MediaQuery.of(context).padding.bottom + 40);

  Widget _buildGeneralTab() {
    final l10n = AppLocalizations.of(context);
    final type = _type;
    final path = _str('Path');
    final isAudioish = const ['Audio', 'MusicAlbum', 'MusicVideo'].contains(type);
    final indexLabel = switch (type) {
      'Episode' => l10n.adminMetadataFieldEpisodeNumber,
      'Season' => l10n.adminMetadataFieldSeasonNumber,
      _ => l10n.adminMetadataFieldTrackNumber,
    };
    final runtimeTicks = (_item['RunTimeTicks'] as num?)?.toInt();
    final isSpecial = type == 'Episode' && _stored['ParentIndexNumber'] == 0;
    final ratings = [
      if (!_isNameOnlyType)
        _numberRow('CommunityRating', l10n.adminMetadataFieldCommunityRating,
            decimal: true),
      if (type == 'Movie' || type == 'Trailer')
        _numberRow('CriticRating', l10n.adminMetadataFieldCriticRating,
            decimal: true),
      if (!_isNameOnlyType || _isTvChannel)
        _ratingField(l10n.adminMetadataFieldOfficialRating, 'OfficialRating'),
      if (!_isNameOnlyType)
        _ratingField(l10n.adminMetadataFieldCustomRating, 'CustomRating'),
    ];
    return ListView(
      padding: _tabPadding,
      children: [
        adminSection(
          context,
          title: l10n.general,
          icon: Icons.info_outline,
          children: [
            if (path.isNotEmpty && _item['EnableMediaSourceDisplay'] != false)
              adminFieldRow(
                label: l10n.path,
                child: SelectableText(path,
                    style: const TextStyle(fontFamily: 'monospace', fontSize: 13)),
              ),
            _textRow('Name', _isPerson ? l10n.name : l10n.adminMetadataFieldTitle),
            if (const ['Series', 'Season', 'Episode', 'Movie', 'Trailer', 'Person']
                .contains(type))
              _textRow('OriginalTitle', l10n.adminMetadataFieldOriginalTitle),
            if (_isSeries || _isVideoMedia)
              adminCodeDropdown(
                label: l10n.adminMetadataFieldOriginalLanguage,
                defaultLabel: l10n.none,
                current: _str('OriginalLanguage'),
                rawItems: _cultureItems(),
                onChanged: (v) =>
                    _setText('OriginalLanguage', v, rebuild: true),
              ),
            // ForcedSortName is the override. SortName is what the server
            // computes, and saving it as forced would pin it for good.
            _textRow('ForcedSortName', l10n.adminMetadataFieldSortTitle),
            if (!_isTvChannel)
              _dateRow('DateCreated', l10n.adminMetadataFieldDateAdded),
            if (_isSeries) ...[
              adminCodeDropdown(
                label: l10n.status,
                defaultLabel: l10n.none,
                current: _str('Status'),
                rawItems: _seriesStatuses(l10n),
                onChanged: (v) => _setText('Status', v, rebuild: true),
              ),
              _airDaysField(l10n),
              _textRow('AirTime', l10n.adminMetadataFieldAirTime),
              adminFieldRow(
                label: l10n.adminMetadataFieldRuntime,
                child: TextFormField(
                  initialValue: runtimeTicks == null
                      ? ''
                      : '${runtimeTicks ~/ _ticksPerMinute}',
                  keyboardType: TextInputType.number,
                  decoration: adminInputDecoration(),
                  onChanged: (v) {
                    final minutes = int.tryParse(v.trim());
                    if (v.trim().isNotEmpty && minutes == null) return;
                    _item['RunTimeTicks'] =
                        minutes == null ? null : minutes * _ticksPerMinute;
                    edited();
                  },
                ),
              ),
            ],
            if (isAudioish) ...[
              _namesRow('ArtistItems', l10n.adminMetadataFieldArtists),
              _namesRow('AlbumArtists', l10n.adminMetadataFieldAlbumArtists),
            ],
            if (type == 'Audio' || type == 'MusicVideo')
              _textRow('Album', l10n.adminMetadataFieldAlbum),
            if (type == 'Book')
              _textRow('SeriesName', l10n.adminMetadataFieldSeriesName),
            if (const ['Audio', 'Episode', 'Season'].contains(type))
              _numberRow('IndexNumber', indexLabel),
            if (type == 'Audio' || type == 'Episode')
              _numberRow(
                'ParentIndexNumber',
                type == 'Episode'
                    ? l10n.adminMetadataFieldSeasonNumber
                    : l10n.adminMetadataFieldDiscNumber,
              ),
            if (isSpecial) ...[
              _numberRow(
                  'AirsBeforeSeasonNumber', l10n.adminMetadataFieldAirsBeforeSeason),
              _numberRow(
                  'AirsAfterSeasonNumber', l10n.adminMetadataFieldAirsAfterSeason),
              _numberRow('AirsBeforeEpisodeNumber',
                  l10n.adminMetadataFieldAirsBeforeEpisode),
            ],
            if (!_isTvChannel) ...[
              _dateRow(
                'PremiereDate',
                _isPerson
                    ? l10n.adminMetadataFieldBirthDate
                    : l10n.adminMetadataFieldPremiereDate,
              ),
              _numberRow(
                'ProductionYear',
                _isPerson
                    ? l10n.adminMetadataFieldBirthYear
                    : l10n.adminMetadataFieldProductionYear,
              ),
            ],
            if (_isPerson)
              adminFieldRow(
                label: l10n.adminMetadataFieldPlaceOfBirth,
                child: TextFormField(
                  initialValue: _stringList(_item['ProductionLocations'])
                          .firstOrNull ??
                      '',
                  decoration: adminInputDecoration(),
                  onChanged: (v) {
                    _item['ProductionLocations'] = v.isEmpty ? <String>[] : [v];
                    edited();
                  },
                ),
              ),
            if (_isSeries || _isPerson)
              _dateRow(
                'EndDate',
                _isPerson
                    ? l10n.adminMetadataFieldDeathDate
                    : l10n.adminMetadataFieldEndDate,
              ),
            if (_isSeries || _isBoxSet) _displayOrderField(l10n),
            if (_isVideo) ...[
              adminCodeDropdown(
                label: l10n.adminMetadataField3DFormat,
                defaultLabel: l10n.none,
                current: _str('Video3DFormat'),
                rawItems: _video3DFormats,
                onChanged: (v) => _setText('Video3DFormat', v, rebuild: true),
              ),
              _textRow('AspectRatio', l10n.adminMetadataFieldAspectRatio),
            ],
          ],
        ),
        if (ratings.isNotEmpty)
          adminSection(
            context,
            title: l10n.adminMetadataSectionRatings,
            icon: Icons.star_outline,
            children: ratings,
          ),
        if (!_isTvChannel)
          adminSection(
            context,
            title: l10n.adminMetadataFieldOverview,
            icon: Icons.notes_outlined,
            children: [
              if (_isVideoMedia && type != 'Episode')
                adminFieldRow(
                  label: l10n.adminMetadataFieldTagline,
                  child: TextFormField(
                    initialValue:
                        _stringList(_item['Taglines']).firstOrNull ?? '',
                    decoration: adminInputDecoration(),
                    onChanged: (v) {
                      _item['Taglines'] = v.isEmpty ? <String>[] : [v];
                      edited();
                    },
                  ),
                ),
              _textRow('Overview', l10n.adminMetadataFieldOverview,
                  maxLines: 10),
            ],
          ),
      ],
    );
  }

  Widget _buildDetailsTab() {
    final l10n = AppLocalizations.of(context);
    final people = _asMapList(_item['People']);
    final lockData = _item['LockData'] == true;
    final lockedFields = _stringList(_item['LockedFields']);
    return ListView(
      padding: _tabPadding,
      children: [
        if (!_isNameOnlyType)
          _chipEditor(
            l10n.adminMetadataGenres,
            Icons.theater_comedy_outlined,
            _stringList(_item['Genres']),
            onAdd: () async {
              final v = await _promptText(l10n.adminMetadataAddGenre);
              final genres = _stringList(_item['Genres']);
              if (v != null && !genres.contains(v)) _set('Genres', [...genres, v]);
            },
            onRemove: (v) => _set('Genres',
                _stringList(_item['Genres']).where((g) => g != v).toList()),
          ),
        _chipEditor(
          l10n.adminMetadataTags,
          Icons.sell_outlined,
          _stringList(_item['Tags']),
          onAdd: () async {
            final v = await _promptText(l10n.adminMetadataAddTag);
            final tags = _stringList(_item['Tags']);
            if (v != null && !tags.contains(v)) _set('Tags', [...tags, v]);
          },
          onRemove: (v) => _set(
              'Tags', _stringList(_item['Tags']).where((t) => t != v).toList()),
        ),
        if (!_isNameOnlyType)
          _chipEditor(
            l10n.adminMetadataStudios,
            Icons.business_outlined,
            _nameList(_item['Studios']),
            onAdd: () async {
              final v = await _promptText(l10n.adminMetadataAddStudio);
              final studios = _asMapList(_item['Studios']);
              if (v != null && studios.every((s) => s['Name'] != v)) {
                _set('Studios', [...studios, {'Name': v}]);
              }
            },
            onRemove: (v) => _set('Studios', [
              for (final s in _asMapList(_item['Studios']))
                if (s['Name'] != v) s,
            ]),
          ),
        if (!_isNameOnlyType)
          adminSection(
            context,
            title: l10n.adminMetadataPeople,
            icon: Icons.people_outline,
            children: [
              for (var i = 0; i < people.length; i++)
                ListTile(
                  title: Text((people[i]['Name'] ?? '').toString()),
                  subtitle: Text(
                    [people[i]['Role'], people[i]['Type']]
                        .map((e) => (e ?? '').toString())
                        .where((e) => e.isNotEmpty)
                        .join(' · '),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        tooltip: l10n.adminMetadataEditPerson,
                        onPressed: () => _editPerson(index: i),
                        icon: const Icon(Icons.edit_outlined),
                      ),
                      IconButton(
                        tooltip: l10n.delete,
                        onPressed: () =>
                            _set('People', [...people]..removeAt(i)),
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                ),
              ListTile(
                leading: const Icon(Icons.add),
                title: Text(people.isEmpty
                    ? l10n.adminNoPeopleEntries
                    : l10n.adminMetadataAddPerson),
                onTap: () => _editPerson(),
              ),
            ],
          ),
        if (!_isTvChannel)
          adminSection(
            context,
            title: l10n.adminMetadataSettings,
            icon: Icons.travel_explore_outlined,
            children: [
              adminCodeDropdown(
                label: l10n.adminMetadataDownloadLanguage,
                helper: l10n.adminMetadataInheritHelp,
                defaultLabel: l10n.adminLibDefault,
                current: _str('PreferredMetadataLanguage'),
                rawItems: _cultureItems(),
                onChanged: (v) =>
                    _setText('PreferredMetadataLanguage', v, rebuild: true),
              ),
              adminCodeDropdown(
                label: l10n.adminMetadataCountryRegion,
                helper: l10n.adminMetadataInheritHelp,
                defaultLabel: l10n.adminLibDefault,
                current: _str('PreferredMetadataCountryCode'),
                rawItems: _countryItems(),
                onChanged: (v) =>
                    _setText('PreferredMetadataCountryCode', v, rebuild: true),
              ),
            ],
          ),
        // A ticked box leaves the field open to refreshes, so the stored list
        // is the inverse of what is ticked. Locked values this list doesn't
        // offer are left untouched.
        adminSection(
          context,
          title: l10n.adminMetadataEnabledFields,
          icon: Icons.lock_open_outlined,
          children: [
            adminSwitchRow(
              title: l10n.adminMetadataLockItem,
              value: lockData,
              onChanged: (v) => _set('LockData', v),
            ),
            if (!lockData) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    AppSpacing.spaceLg, AppSpacing.spaceSm, AppSpacing.spaceLg, 0),
                child: Text(
                  l10n.adminMetadataEnabledFieldsHelp,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              for (final field in _lockableFields(l10n))
                CheckboxListTile(
                  value: !lockedFields.contains(field.$1),
                  title: Text(field.$2),
                  onChanged: (enabled) => _set('LockedFields', [
                    ...lockedFields.where((f) => f != field.$1),
                    if (enabled != true) field.$1,
                  ]),
                ),
            ],
          ],
        ),
      ],
    );
  }

  /// Every listed id is editable, and ids the server doesn't list stay in
  /// ProviderIds untouched.
  Widget _buildExternalTab() {
    final l10n = AppLocalizations.of(context);
    final providerIds = _item['ProviderIds'] is Map
        ? (_item['ProviderIds'] as Map).cast<String, dynamic>()
        : const <String, dynamic>{};
    return ListView(
      padding: _tabPadding,
      children: [
        adminSection(
          context,
          title: l10n.adminMetadataExternalIds,
          icon: Icons.link,
          children: [
            if (_externalIds.isEmpty)
              Padding(
                padding: const EdgeInsets.all(AppSpacing.spaceLg),
                child: Text(l10n.adminNoExternalIds),
              ),
            for (final info in _externalIds)
              adminFieldRow(
                label: _externalLabel(info),
                helper: (info['UrlFormatString'] ?? info['Url'] ?? '')
                        .toString()
                        .isEmpty
                    ? null
                    : (info['UrlFormatString'] ?? info['Url']).toString(),
                child: TextFormField(
                  initialValue:
                      (providerIds[_externalKey(info)] ?? '').toString(),
                  decoration: adminInputDecoration(),
                  onChanged: (v) {
                    _item['ProviderIds'] = {
                      ...?(_item['ProviderIds'] as Map?)?.cast<String, dynamic>(),
                      _externalKey(info): v,
                    };
                    edited();
                  },
                ),
              ),
          ],
        ),
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

  Widget _chipEditor(
    String label,
    IconData icon,
    List<String> values, {
    required VoidCallback onAdd,
    required ValueChanged<String> onRemove,
  }) {
    final l10n = AppLocalizations.of(context);
    return adminSection(
      context,
      title: label,
      icon: icon,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.spaceLg),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (final value in values)
                Chip(label: Text(value), onDeleted: () => onRemove(value)),
              ActionChip(
                avatar: const Icon(Icons.add, size: 18),
                label: Text(l10n.add),
                onPressed: onAdd,
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
