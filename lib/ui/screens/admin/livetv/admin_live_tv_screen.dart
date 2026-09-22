import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../../../widgets/adaptive/adaptive_dialog.dart';
import '../widgets/admin_form_styles.dart';

class AdminLiveTvScreen extends StatefulWidget {
  const AdminLiveTvScreen({super.key});

  @override
  State<AdminLiveTvScreen> createState() => _AdminLiveTvScreenState();
}

class _AdminLiveTvScreenState extends State<AdminLiveTvScreen> {
  bool _loading = true;
  bool _discovering = false;
  bool _savingConfig = false;
  bool _refreshingGuide = false;
  String? _error;

  List<Map<String, dynamic>> _tuners = const [];
  List<Map<String, dynamic>> _providers = const [];
  List<Map<String, dynamic>> _discoveredTuners = const [];
  Map<String, dynamic> _config = const {};

  AdminLiveTvApi get _api => GetIt.instance<MediaServerClient>().adminLiveTvApi;

  @override
  void initState() {
    super.initState();
    _loadAll();
  }

  String _friendlyError(Object error) {
    final l10n = AppLocalizations.of(context);
    if (error is DioException) {
      final status = error.response?.statusCode;
      if (status == 404 || status == 405 || status == 501) {
        return l10n.adminLiveTvNotAvailable;
      }
    }
    return describeError(error, l10n);
  }

  Future<void> _loadAll() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final config = await _api.getLiveTvConfiguration();
      final tuners = (config['TunerHosts'] as List<dynamic>? ?? const [])
          .whereType<Map>()
          .map((item) => item.cast<String, dynamic>())
          .toList();
      final providers = (config['ListingProviders'] as List<dynamic>? ?? const [])
          .whereType<Map>()
          .map((item) => item.cast<String, dynamic>())
          .toList();
      if (!mounted) return;
      setState(() {
        _tuners = tuners;
        _providers = providers;
        _config = config;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = _friendlyError(e);
        _loading = false;
      });
    }
  }

  String _display(Map<String, dynamic> item, List<String> keys, {String? fallback}) {
    for (final key in keys) {
      final value = item[key];
      if (value == null) continue;
      final text = value.toString().trim();
      if (text.isNotEmpty) return text;
    }
    return fallback ?? AppLocalizations.of(context).unknown;
  }

  String _idOf(Map<String, dynamic> item) {
    return _display(item, const ['Id', 'ID', 'Guid', 'Name'], fallback: '');
  }

  int _intValue(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }

  String _guideDaysText() {
    final l10n = AppLocalizations.of(context);
    final days = (_config['GuideDays'] as num?)?.toInt();
    return days == null
        ? l10n.adminGuideDaysAuto
        : l10n.adminGuideDaysValue(days);
  }

  Widget _dialogSectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 16, 2, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1,
            color: AppColorScheme.accent.withValues(alpha: 0.9),
          ),
        ),
      ),
    );
  }

  Future<void> _discoverTuners() async {
    if (_discovering) return;
    setState(() => _discovering = true);
    try {
      final found = await _api.discoverTuners();
      if (!mounted) return;
      setState(() {
        _discoveredTuners = found;
        _discovering = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _discovering = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminTunerDiscoveryFailed(_friendlyError(e)))),
      );
    }
  }

  Future<List<(String, String)>> _loadTunerTypes() async {
    final l10n = AppLocalizations.of(context);
    final fallback = <(String, String)>[
      ('m3u', l10n.adminTunerTypeM3u),
      ('hdhomerun', l10n.adminTunerTypeHdHomerun),
    ];
    try {
      final types = await _api.getTunerHostTypes();
      final parsed = <(String, String)>[];
      for (final type in types) {
        final id = _display(type, const ['Id', 'Type'], fallback: '');
        final name = _display(type, const ['Name'], fallback: id);
        if (id.isNotEmpty) parsed.add((id, name));
      }
      return parsed.isEmpty ? fallback : parsed;
    } catch (_) {
      return fallback;
    }
  }

  Future<void> _showAddTunerDialog({Map<String, dynamic>? seed}) async {
    final source = seed ?? const <String, dynamic>{};
    final existingId = _display(source, const ['Id'], fallback: '');
    final isEdit = existingId.isNotEmpty;
    final deviceId = _display(source, const ['DeviceId'], fallback: '');

    final types = await _loadTunerTypes();
    if (!mounted) return;

    var type = _display(source, const ['Type', 'TunerType'], fallback: types.first.$1);
    if (!types.any((t) => t.$1 == type)) type = types.first.$1;

    final urlController = TextEditingController(
      text: _display(source, const ['Url', 'Path', 'ImportUrl'], fallback: ''),
    );
    final nameController = TextEditingController(
      text: _display(source, const ['FriendlyName', 'Name'], fallback: ''),
    );
    final userAgentController = TextEditingController(
      text: _display(source, const ['UserAgent'], fallback: ''),
    );
    final tunerCountController = TextEditingController(
      text: (_intValue(source['TunerCount'])).toString(),
    );
    final fallbackBitrate = _intValue(source['FallbackMaxStreamingBitrate']);
    final fallbackBitrateController = TextEditingController(
      text: fallbackBitrate > 0 ? (fallbackBitrate / 1000000).toString() : '',
    );

    var importFavoritesOnly = source['ImportFavoritesOnly'] as bool? ?? false;
    var allowHwTranscoding = source['AllowHWTranscoding'] as bool? ?? false;
    var allowFmp4 = source['AllowFmp4TranscodingContainer'] as bool? ?? false;
    var allowStreamSharing = source['AllowStreamSharing'] as bool? ?? true;
    var enableStreamLooping = source['EnableStreamLooping'] as bool? ?? false;
    var ignoreDts = source['IgnoreDts'] as bool? ?? true;
    var readAtNativeFramerate = source['ReadAtNativeFramerate'] as bool? ?? true;

    final l10n = AppLocalizations.of(context);
    final payload = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(isEdit ? l10n.adminEditTuner : l10n.adminAddTuner),
        content: SizedBox(
          width: 400,
          child: StatefulBuilder(
            builder: (ctx, setLocal) {
              final isHd = type == 'hdhomerun';
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: type,
                      decoration: adminInputDecoration(label: l10n.adminTunerType),
                      items: types
                          .map((t) => DropdownMenuItem(
                                value: t.$1,
                                child: Text(t.$2),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) setLocal(() => type = value);
                      },
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: urlController,
                      decoration: adminInputDecoration(
                        label: isHd
                            ? l10n.adminTunerIpAddress
                            : l10n.adminTunerFileOrUrl,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: nameController,
                      decoration: adminInputDecoration(
                        label: l10n.adminTunerFriendlyName,
                      ),
                    ),
                    if (!isHd) ...[
                      const SizedBox(height: 12),
                      TextField(
                        controller: userAgentController,
                        decoration: adminInputDecoration(
                          label: l10n.adminTunerUserAgent,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: tunerCountController,
                        keyboardType: TextInputType.number,
                        decoration: adminInputDecoration(
                          label: l10n.adminTunerCount,
                          helper: l10n.adminTunerCountHelp,
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    TextField(
                      controller: fallbackBitrateController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: adminInputDecoration(
                        label: l10n.adminTunerFallbackBitrate,
                        suffixText: 'Mbps',
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (isHd) ...[
                      adminSwitchRow(
                        title: l10n.adminTunerImportFavoritesOnly,
                        value: importFavoritesOnly,
                        onChanged: (v) => setLocal(() => importFavoritesOnly = v),
                      ),
                      adminSwitchRow(
                        title: l10n.adminTunerAllowHwTranscoding,
                        value: allowHwTranscoding,
                        onChanged: (v) => setLocal(() => allowHwTranscoding = v),
                      ),
                    ] else ...[
                      adminSwitchRow(
                        title: l10n.adminTunerAllowFmp4,
                        value: allowFmp4,
                        onChanged: (v) => setLocal(() => allowFmp4 = v),
                      ),
                      adminSwitchRow(
                        title: l10n.adminTunerAllowStreamSharing,
                        value: allowStreamSharing,
                        onChanged: (v) => setLocal(() => allowStreamSharing = v),
                      ),
                      adminSwitchRow(
                        title: l10n.adminTunerEnableStreamLooping,
                        value: enableStreamLooping,
                        onChanged: (v) => setLocal(() => enableStreamLooping = v),
                      ),
                      adminSwitchRow(
                        title: l10n.adminTunerIgnoreDts,
                        value: ignoreDts,
                        onChanged: (v) => setLocal(() => ignoreDts = v),
                      ),
                      adminSwitchRow(
                        title: l10n.adminTunerReadAtNativeFramerate,
                        value: readAtNativeFramerate,
                        onChanged: (v) => setLocal(() => readAtNativeFramerate = v),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              final url = urlController.text.trim();
              final name = nameController.text.trim();
              final userAgent = userAgentController.text.trim();
              final mbps = double.tryParse(fallbackBitrateController.text.trim());
              Navigator.pop(ctx, <String, dynamic>{
                if (isEdit) 'Id': existingId,
                if (deviceId.isNotEmpty) 'DeviceId': deviceId,
                'Type': type,
                'Url': url.isEmpty ? null : url,
                'FriendlyName': name.isEmpty ? null : name,
                'UserAgent': userAgent.isEmpty ? null : userAgent,
                'TunerCount':
                    int.tryParse(tunerCountController.text.trim()) ?? 0,
                'FallbackMaxStreamingBitrate':
                    mbps == null ? null : (mbps * 1000000).round(),
                'ImportFavoritesOnly': importFavoritesOnly,
                'AllowHWTranscoding': allowHwTranscoding,
                'AllowFmp4TranscodingContainer': allowFmp4,
                'AllowStreamSharing': allowStreamSharing,
                'EnableStreamLooping': enableStreamLooping,
                'IgnoreDts': ignoreDts,
                'ReadAtNativeFramerate': readAtNativeFramerate,
              });
            },
            child: Text(isEdit ? l10n.save : l10n.add),
          ),
        ],
      ),
    );

    urlController.dispose();
    nameController.dispose();
    userAgentController.dispose();
    tunerCountController.dispose();
    fallbackBitrateController.dispose();

    if (payload == null || !mounted) return;
    try {
      await _api.addTunerHost(payload);
      await _loadAll();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminTunerAdded)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminTunerAddFailed(_friendlyError(e)))),
      );
    }
  }

  List<String> _splitCategories(String text) {
    return text
        .split('|')
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toList();
  }

  Future<void> _showAddProviderDialog({Map<String, dynamic>? seed}) async {
    final source = seed ?? const <String, dynamic>{};
    final existingId = _display(source, const ['Id'], fallback: '');
    final isEdit = existingId.isNotEmpty;

    final seedType = _display(source, const ['Type'], fallback: 'xmltv');
    var kind = seedType.toLowerCase() == 'schedulesdirect'
        ? 'SchedulesDirect'
        : 'xmltv';

    // XMLTV fields.
    final pathController = TextEditingController(
      text: _display(source, const ['Path', 'Url'], fallback: ''),
    );
    final moviePrefixController = TextEditingController(
      text: _display(source, const ['MoviePrefix'], fallback: ''),
    );
    final userAgentController = TextEditingController(
      text: _display(source, const ['UserAgent'], fallback: ''),
    );
    final moviesController = TextEditingController(
      text: (source['MovieCategories'] as List?)?.join('|') ?? '',
    );
    final kidsController = TextEditingController(
      text: (source['KidsCategories'] as List?)?.join('|') ?? '',
    );
    final newsController = TextEditingController(
      text: (source['NewsCategories'] as List?)?.join('|') ?? '',
    );
    final sportsController = TextEditingController(
      text: (source['SportsCategories'] as List?)?.join('|') ?? '',
    );

    // Schedules Direct fields.
    final usernameController = TextEditingController(
      text: _display(source, const ['Username'], fallback: ''),
    );
    final passwordController = TextEditingController();
    final zipController = TextEditingController(
      text: _display(source, const ['ZipCode'], fallback: ''),
    );
    var enableAllTuners = source['EnableAllTuners'] as bool? ?? true;
    var country = _display(source, const ['Country'], fallback: '');
    var listingsId = _display(source, const ['ListingsId'], fallback: '');
    var providerId = existingId;
    var loadingListings = false;
    String? listingsError;
    var countries = <Map<String, dynamic>>[];
    var listings = <Map<String, dynamic>>[];

    try {
      countries = await _api.getSchedulesDirectCountries();
    } catch (_) {}
    if (!mounted) return;

    final l10n = AppLocalizations.of(context);
    final payload = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(isEdit ? l10n.adminEditProvider : l10n.adminAddProvider),
        content: SizedBox(
          width: 400,
          child: StatefulBuilder(
            builder: (ctx, setLocal) {
              Future<void> fetchListings() async {
                setLocal(() {
                  loadingListings = true;
                  listingsError = null;
                });
                try {
                  final login = await _api.addListingProvider(
                    {
                      if (providerId.isNotEmpty) 'Id': providerId,
                      'Type': 'SchedulesDirect',
                      'Username': usernameController.text.trim(),
                      'Password': passwordController.text,
                    },
                    validateLogin: true,
                  );
                  final id = _display(login, const ['Id'], fallback: providerId);
                  final found = await _api.getListingProviderLineups(
                    providerId: id,
                    location: zipController.text.trim(),
                    country: country,
                  );
                  setLocal(() {
                    providerId = id;
                    listings = found;
                    loadingListings = false;
                    if (!found.any((e) => _display(e, const ['Id']) == listingsId)) {
                      listingsId = '';
                    }
                  });
                } catch (e) {
                  setLocal(() {
                    loadingListings = false;
                    listingsError = _friendlyError(e);
                  });
                }
              }

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: kind,
                      decoration: adminInputDecoration(label: l10n.adminProviderType),
                      items: [
                        DropdownMenuItem(
                          value: 'xmltv',
                          child: Text(l10n.adminProviderXmltv),
                        ),
                        DropdownMenuItem(
                          value: 'SchedulesDirect',
                          child: Text(l10n.adminProviderSchedulesDirect),
                        ),
                      ],
                      onChanged: isEdit
                          ? null
                          : (value) {
                              if (value != null) setLocal(() => kind = value);
                            },
                    ),
                    const SizedBox(height: 12),
                    if (kind == 'xmltv') ...[
                      TextField(
                        controller: pathController,
                        decoration:
                            adminInputDecoration(label: l10n.adminXmltvPath),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: userAgentController,
                        decoration: adminInputDecoration(
                          label: l10n.adminTunerUserAgent,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: moviePrefixController,
                        decoration: adminInputDecoration(
                          label: l10n.adminXmltvMoviePrefix,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: moviesController,
                        decoration: adminInputDecoration(
                          label: l10n.adminXmltvMovieCategories,
                          helper: l10n.adminXmltvCategoriesHelp,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: kidsController,
                        decoration: adminInputDecoration(
                          label: l10n.adminXmltvKidsCategories,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: newsController,
                        decoration: adminInputDecoration(
                          label: l10n.adminXmltvNewsCategories,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: sportsController,
                        decoration: adminInputDecoration(
                          label: l10n.adminXmltvSportsCategories,
                        ),
                      ),
                    ] else ...[
                      TextField(
                        controller: usernameController,
                        decoration:
                            adminInputDecoration(label: l10n.adminSdUsername),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration:
                            adminInputDecoration(label: l10n.adminSdPassword),
                      ),
                      const SizedBox(height: 12),
                      adminCodeDropdown(
                        label: l10n.adminSdCountry,
                        defaultLabel: l10n.adminSdCountrySelect,
                        current: country,
                        rawItems: countries.map((c) => (
                              _display(c, const ['ShortName', 'Id'], fallback: ''),
                              _display(c, const ['FullName', 'Name'], fallback: ''),
                            )),
                        onChanged: (value) =>
                            setLocal(() => country = value ?? ''),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: zipController,
                        decoration:
                            adminInputDecoration(label: l10n.adminSdPostalCode),
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                        onPressed: loadingListings ? null : fetchListings,
                        icon: loadingListings
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.download),
                        label: Text(l10n.adminSdGetListings),
                      ),
                      if (listingsError != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          listingsError!,
                          style: TextStyle(color: Theme.of(ctx).colorScheme.error),
                        ),
                      ],
                      if (listings.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          initialValue: listingsId.isEmpty ? null : listingsId,
                          isExpanded: true,
                          decoration:
                              adminInputDecoration(label: l10n.adminSdListings),
                          items: listings
                              .map((e) => DropdownMenuItem(
                                    value: _display(e, const ['Id']),
                                    child: Text(_display(e, const ['Name', 'Id'])),
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setLocal(() => listingsId = value ?? ''),
                        ),
                      ],
                    ],
                    adminSwitchRow(
                      title: l10n.adminEnableAllTuners,
                      value: enableAllTuners,
                      onChanged: (v) => setLocal(() => enableAllTuners = v),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              if (kind == 'xmltv') {
                Navigator.pop(ctx, <String, dynamic>{
                  if (isEdit) 'Id': existingId,
                  'Type': 'xmltv',
                  'Path': pathController.text.trim(),
                  'MoviePrefix': moviePrefixController.text.trim().isEmpty
                      ? null
                      : moviePrefixController.text.trim(),
                  'UserAgent': userAgentController.text.trim().isEmpty
                      ? null
                      : userAgentController.text.trim(),
                  'MovieCategories': _splitCategories(moviesController.text),
                  'KidsCategories': _splitCategories(kidsController.text),
                  'NewsCategories': _splitCategories(newsController.text),
                  'SportsCategories': _splitCategories(sportsController.text),
                  'EnableAllTuners': enableAllTuners,
                });
              } else {
                Navigator.pop(ctx, <String, dynamic>{
                  if (providerId.isNotEmpty) 'Id': providerId,
                  'Type': 'SchedulesDirect',
                  'Username': usernameController.text.trim(),
                  if (passwordController.text.isNotEmpty)
                    'Password': passwordController.text,
                  'ListingsId': listingsId,
                  'Country': country,
                  'ZipCode': zipController.text.trim(),
                  'EnableAllTuners': enableAllTuners,
                });
              }
            },
            child: Text(isEdit ? l10n.save : l10n.add),
          ),
        ],
      ),
    );

    pathController.dispose();
    moviePrefixController.dispose();
    userAgentController.dispose();
    moviesController.dispose();
    kidsController.dispose();
    newsController.dispose();
    sportsController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    zipController.dispose();

    if (payload == null || !mounted) return;

    try {
      await _api.addListingProvider(
        payload,
        validateListings: payload['Type'] == 'SchedulesDirect',
      );
      await _loadAll();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminProviderAdded)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminProviderAddFailed(_friendlyError(e)))),
      );
    }
  }

  Future<void> _removeTuner(Map<String, dynamic> tuner) async {
    final id = _idOf(tuner);
    if (id.isEmpty) return;
    try {
      await _api.removeTunerHost(id);
      await _loadAll();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminTunerRemoveFailed(_friendlyError(e)))),
      );
    }
  }

  Future<void> _resetTuner(Map<String, dynamic> tuner) async {
    final id = _idOf(tuner);
    if (id.isEmpty) return;
    try {
      await _api.resetTuner(id);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminTunerResetRequested)),
      );
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      final message = e is DioException && e.response?.statusCode == 400
          ? l10n.adminTunerResetNotSupported
          : l10n.adminTunerResetFailed(_friendlyError(e));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Future<void> _refreshGuideData() async {
    if (_refreshingGuide) return;
    setState(() => _refreshingGuide = true);
    final l10n = AppLocalizations.of(context);
    try {
      final tasksApi = GetIt.instance<MediaServerClient>().adminTasksApi;
      final tasks = await tasksApi.getTasks();
      final task = tasks.firstWhere(
        (t) => t['Key'] == 'RefreshGuide',
        orElse: () => const <String, dynamic>{},
      );
      final id = (task['Id'] ?? '').toString();
      if (id.isEmpty) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminGuideRefreshUnavailable)),
        );
        return;
      }
      await tasksApi.startTask(id);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminGuideRefreshStarted)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_friendlyError(e))),
      );
    } finally {
      if (mounted) setState(() => _refreshingGuide = false);
    }
  }

  Future<void> _removeProvider(Map<String, dynamic> provider) async {
    final id = _idOf(provider);
    if (id.isEmpty) return;
    try {
      await _api.removeListingProvider(id);
      await _loadAll();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminProviderRemoveFailed(_friendlyError(e)))),
      );
    }
  }

  Future<void> _saveRecordingSettings() async {
    final prePadding = _intValue(
      _config['PrePaddingSeconds'] ?? _config['PrePaddingMinutes'],
    );
    final postPadding = _intValue(
      _config['PostPaddingSeconds'] ?? _config['PostPaddingMinutes'],
    );
    final recordingPath = (_config['RecordingPath'] ?? '').toString();
    final seriesPath = (_config['SeriesRecordingPath'] ?? '').toString();

    final preController = TextEditingController(
      text: (prePadding ~/ 60).toString(),
    );
    final postController = TextEditingController(
      text: (postPadding ~/ 60).toString(),
    );
    final recPathController = TextEditingController(text: recordingPath);
    final seriesPathController = TextEditingController(text: seriesPath);
    final moviePathController = TextEditingController(
      text: (_config['MovieRecordingPath'] ?? '').toString(),
    );
    final postProcessorController = TextEditingController(
      text: (_config['RecordingPostProcessor'] ?? '').toString(),
    );
    final postProcessorArgsController = TextEditingController(
      text: (_config['RecordingPostProcessorArguments'] ?? '').toString(),
    );

    const guideDayOptions = <int?>[null, 1, 2, 3, 5, 7, 14];
    final rawGuideDays = (_config['GuideDays'] as num?)?.toInt();
    var guideDays = guideDayOptions.contains(rawGuideDays) ? rawGuideDays : null;
    var saveNfo = _config['SaveRecordingNFO'] as bool? ?? true;
    var saveImages = _config['SaveRecordingImages'] as bool? ?? true;

    final l10n = AppLocalizations.of(context);
    final updated = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(l10n.adminRecordingSettings),
        content: SizedBox(
          width: 400,
          child: StatefulBuilder(
            builder: (ctx, setLocal) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _dialogSectionLabel(l10n.adminLiveTvSectionTiming),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: preController,
                          keyboardType: TextInputType.number,
                          decoration:
                              adminInputDecoration(label: l10n.adminPrePadding),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: postController,
                          keyboardType: TextInputType.number,
                          decoration:
                              adminInputDecoration(label: l10n.adminPostPadding),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<int?>(
                    initialValue: guideDays,
                    decoration: adminInputDecoration(label: l10n.adminGuideDays),
                    items: [
                      for (final d in guideDayOptions)
                        DropdownMenuItem(
                          value: d,
                          child: Text(d == null
                              ? l10n.adminGuideDaysAuto
                              : l10n.adminGuideDaysValue(d)),
                        ),
                    ],
                    onChanged: (v) => setLocal(() => guideDays = v),
                  ),
                  _dialogSectionLabel(l10n.adminLiveTvSectionPaths),
                  TextField(
                    controller: recPathController,
                    decoration:
                        adminInputDecoration(label: l10n.adminRecordingPath),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: seriesPathController,
                    decoration: adminInputDecoration(
                        label: l10n.adminSeriesRecordingPath),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: moviePathController,
                    decoration: adminInputDecoration(
                        label: l10n.adminMovieRecordingPath),
                  ),
                  _dialogSectionLabel(l10n.adminLiveTvSectionPostProcessing),
                  TextField(
                    controller: postProcessorController,
                    decoration: adminInputDecoration(
                        label: l10n.adminRecordingPostProcessor),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: postProcessorArgsController,
                    decoration: adminInputDecoration(
                        label: l10n.adminRecordingPostProcessorArgs),
                  ),
                  const SizedBox(height: 16),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.05),
                      borderRadius: AppRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        adminSwitchRow(
                          title: l10n.adminSaveRecordingNfo,
                          value: saveNfo,
                          onChanged: (v) => setLocal(() => saveNfo = v),
                        ),
                        Divider(
                          height: 0.5,
                          thickness: 0.5,
                          indent: 16,
                          color:
                              AppColorScheme.onSurface.withValues(alpha: 0.10),
                        ),
                        adminSwitchRow(
                          title: l10n.adminSaveRecordingImages,
                          value: saveImages,
                          onChanged: (v) => setLocal(() => saveImages = v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              final preMinutes = int.tryParse(preController.text.trim()) ?? 0;
              final postMinutes = int.tryParse(postController.text.trim()) ?? 0;
              Navigator.pop(ctx, {
                ..._config,
                'PrePaddingSeconds': preMinutes * 60,
                'PostPaddingSeconds': postMinutes * 60,
                'GuideDays': guideDays,
                'RecordingPath': recPathController.text.trim(),
                'SeriesRecordingPath': seriesPathController.text.trim(),
                'MovieRecordingPath': moviePathController.text.trim(),
                'RecordingPostProcessor': postProcessorController.text.trim(),
                'RecordingPostProcessorArguments':
                    postProcessorArgsController.text.trim(),
                'SaveRecordingNFO': saveNfo,
                'SaveRecordingImages': saveImages,
              });
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );

    preController.dispose();
    postController.dispose();
    recPathController.dispose();
    seriesPathController.dispose();
    moviePathController.dispose();
    postProcessorController.dispose();
    postProcessorArgsController.dispose();

    if (updated == null || !mounted) return;

    setState(() => _savingConfig = true);
    try {
      await _api.updateLiveTvConfiguration(updated);
      if (!mounted) return;
      setState(() {
        _config = updated;
        _savingConfig = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminRecordingSettingsSaved)),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _savingConfig = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminSettingsSaveFailed(_friendlyError(e)))),
      );
    }
  }

  Future<void> _setChannelMappings() async {
    final controller = TextEditingController();
    final payload = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(AppLocalizations.of(context).adminSetChannelMappings),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).adminMappingJson,
            hintText: AppLocalizations.of(context).adminMappingJsonHint,
            border: OutlineInputBorder(),
          ),
          minLines: 4,
          maxLines: 8,
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx),
            child: Text(AppLocalizations.of(context).cancel),
          ),
          FilledButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isEmpty) {
                Navigator.pop(ctx, const <String, dynamic>{});
                return;
              }
              try {
                final decoded = jsonDecode(text);
                if (decoded is Map<String, dynamic>) {
                  Navigator.pop(ctx, decoded);
                } else {
                  Navigator.pop(ctx, {'Mappings': decoded});
                }
              } catch (_) {
                Navigator.pop(ctx, null);
              }
            },
            child: Text(AppLocalizations.of(context).adminApply),
          ),
        ],
      ),
    );
    controller.dispose();

    if (payload == null || !mounted) return;

    try {
      await _api.setChannelMappings(payload);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminChannelMappingsUpdated)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).adminChannelMappingsUpdateFailed(_friendlyError(e)))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context).adminLiveTvLoadFailed),
            const SizedBox(height: 8),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            FilledButton.tonal(
              onPressed: _loadAll,
              child: Text(AppLocalizations.of(context).retry),
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context).adminLiveTvTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            IconButton(
              tooltip: AppLocalizations.of(context).refresh,
              onPressed: _loadAll,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _sectionCard(
          context,
          title: AppLocalizations.of(context).adminTunerDevices,
          action: FilledButton.tonalIcon(
            onPressed: () => _showAddTunerDialog(),
            icon: const Icon(Icons.add),
            label: Text(AppLocalizations.of(context).adminAddTuner),
          ),
          child: _tuners.isEmpty
              ? Text(AppLocalizations.of(context).adminNoTunerHosts)
              : Column(
                  children: _tuners.map((tuner) {
                    final name = _display(tuner, const ['FriendlyName', 'Name']);
                    final type = _display(tuner, const ['Type', 'TunerType']);
                    final id = _idOf(tuner);
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(name),
                      subtitle: Text(type),
                      trailing: Wrap(
                        spacing: 4,
                        children: [
                          IconButton(
                            tooltip: AppLocalizations.of(context).edit,
                            onPressed: id.isEmpty
                                ? null
                                : () => _showAddTunerDialog(seed: tuner),
                            icon: const Icon(Icons.edit_outlined),
                          ),
                          IconButton(
                            tooltip: AppLocalizations.of(context).adminReset,
                            onPressed: id.isEmpty ? null : () => _resetTuner(tuner),
                            icon: const Icon(Icons.restart_alt),
                          ),
                          IconButton(
                            tooltip: AppLocalizations.of(context).delete,
                            onPressed: id.isEmpty ? null : () => _removeTuner(tuner),
                            icon: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
        ),
        const SizedBox(height: 12),
        _sectionCard(
          context,
          title: AppLocalizations.of(context).adminGuideProviders,
          action: FilledButton.tonalIcon(
            onPressed: _showAddProviderDialog,
            icon: const Icon(Icons.add),
            label: Text(AppLocalizations.of(context).adminAddGuideProvider),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton.icon(
                  onPressed: _refreshingGuide ? null : _refreshGuideData,
                  icon: _refreshingGuide
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.refresh),
                  label: Text(AppLocalizations.of(context).adminRefreshGuideData),
                ),
              ),
              const SizedBox(height: 8),
              if (_providers.isEmpty)
                Text(AppLocalizations.of(context).adminNoListingProviders)
              else
                ..._providers.map((provider) {
                  final name = _display(provider, const ['Name', 'Type']);
                  final url =
                      _display(provider, const ['Url', 'Path'], fallback: '');
                  final id = _idOf(provider);
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(name),
                    subtitle: url.isEmpty ? null : Text(url),
                    trailing: Wrap(
                      spacing: 4,
                      children: [
                        IconButton(
                          tooltip: AppLocalizations.of(context).edit,
                          onPressed: id.isEmpty
                              ? null
                              : () => _showAddProviderDialog(seed: provider),
                          icon: const Icon(Icons.edit_outlined),
                        ),
                        IconButton(
                          tooltip: AppLocalizations.of(context).delete,
                          onPressed:
                              id.isEmpty ? null : () => _removeProvider(provider),
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ],
                    ),
                  );
                }),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _sectionCard(
          context,
          title: AppLocalizations.of(context).adminRecordingSettings,
          action: FilledButton.tonalIcon(
            onPressed: _savingConfig ? null : _saveRecordingSettings,
            icon: const Icon(Icons.save),
            label: Text(AppLocalizations.of(context).edit),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context).adminRecordingPathDisplay(_display(_config, const ['RecordingPath'], fallback: AppLocalizations.of(context).adminNotSet))),
              const SizedBox(height: 4),
              Text(AppLocalizations.of(context).adminSeriesPathDisplay(_display(_config, const ['SeriesRecordingPath'], fallback: AppLocalizations.of(context).adminNotSet))),
              const SizedBox(height: 4),
              Text(AppLocalizations.of(context).adminPrePaddingDisplay(_intValue(_config['PrePaddingSeconds']) ~/ 60)),
              const SizedBox(height: 4),
              Text(AppLocalizations.of(context).adminPostPaddingDisplay(_intValue(_config['PostPaddingSeconds']) ~/ 60)),
              const SizedBox(height: 4),
              Text(AppLocalizations.of(context)
                  .adminGuideDaysDisplay(_guideDaysText())),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _sectionCard(
          context,
          title: AppLocalizations.of(context).adminTunerDiscovery,
          actionBelowTitle: true,
          action: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton.tonalIcon(
                onPressed: _discovering ? null : _discoverTuners,
                icon: const Icon(Icons.radar),
                label: Text(AppLocalizations.of(context).adminDiscover),
              ),
              const SizedBox(width: 8),
              FilledButton.tonal(
                onPressed: _setChannelMappings,
                child: Text(AppLocalizations.of(context).adminChannelMappings),
              ),
            ],
          ),
          child: _discovering
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: LinearProgressIndicator(),
                )
              : _discoveredTuners.isEmpty
                  ? Text(AppLocalizations.of(context).adminNoDiscoveredTuners)
                  : Column(
                      children: _discoveredTuners.map((item) {
                        final name = _display(item, const ['FriendlyName', 'Name']);
                        final type = _display(item, const ['Type', 'TunerType']);
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(name),
                          subtitle: Text(type),
                          trailing: FilledButton.tonal(
                            onPressed: () => _showAddTunerDialog(seed: item),
                            child: Text(AppLocalizations.of(context).add),
                          ),
                        );
                      }).toList(),
                    ),
        ),
      ],
    );
  }

  Widget _sectionCard(
    BuildContext context, {
    required String title,
    required Widget child,
    Widget? action,
    bool actionBelowTitle = false,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!actionBelowTitle)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  ?action,
                ],
              )
            else ...[
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (action != null) ...[
                const SizedBox(height: 8),
                action,
              ],
            ],
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}
