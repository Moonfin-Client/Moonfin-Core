import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/repositories/tmdb_repository.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/detail_section_layout.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/detail_trailer.dart';
import '../../../util/platform_detection.dart';

enum PersonSite { imdb, tmdb, instagram, x, facebook, tiktok, youtube, website }

/// One of a person's own pages, and the handle its tooltip shows.
typedef PersonLink = ({PersonSite site, String url, String? handle});

final _imdbPerson = RegExp(r'^nm\d+$');
final _tmdbPerson = RegExp(r'^\d+$');
final _handle = RegExp(r'^@?[A-Za-z0-9._-]{1,100}$');

/// The pages to link for [item], IMDb and TMDB from the server's ids and the
/// rest from the TMDB [accounts] the plugin found, in the order they show.
List<PersonLink> personLinksFor(
  AggregatedItem item,
  TmdbPersonAccounts? accounts,
) {
  final links = <PersonLink>[];

  final imdbId = item.imdbId ?? accounts?.imdbId;
  if (imdbId != null && _imdbPerson.hasMatch(imdbId)) {
    links.add((
      site: PersonSite.imdb,
      url: 'https://www.imdb.com/name/$imdbId/',
      handle: null,
    ));
  }
  final tmdbId = item.tmdbId;
  if (tmdbId != null && _tmdbPerson.hasMatch(tmdbId)) {
    links.add((
      site: PersonSite.tmdb,
      url: 'https://www.themoviedb.org/person/$tmdbId',
      handle: null,
    ));
  }

  void social(String? raw, PersonLink Function(String handle) make) {
    if (raw == null || !_handle.hasMatch(raw)) return;
    links.add(make(raw.startsWith('@') ? raw.substring(1) : raw));
  }

  social(accounts?.instagram, (h) => (
    site: PersonSite.instagram,
    url: 'https://www.instagram.com/$h/',
    handle: '@$h',
  ));
  social(accounts?.twitter, (h) => (
    site: PersonSite.x,
    url: 'https://x.com/$h',
    handle: '@$h',
  ));
  social(accounts?.facebook, (h) => (
    site: PersonSite.facebook,
    url: 'https://www.facebook.com/$h',
    handle: h,
  ));
  social(accounts?.tiktok, (h) => (
    site: PersonSite.tiktok,
    url: 'https://www.tiktok.com/@$h',
    handle: '@$h',
  ));
  // TMDB keeps an @handle, an older custom name or a channel id here, and its
  // own site links the first two as they are.
  final youtube = accounts?.youtube;
  if (youtube != null && _handle.hasMatch(youtube)) {
    final isChannel = youtube.startsWith('UC') && youtube.length == 24;
    links.add((
      site: PersonSite.youtube,
      url: isChannel
          ? 'https://www.youtube.com/channel/$youtube'
          : 'https://www.youtube.com/$youtube',
      handle: isChannel ? null : youtube,
    ));
  }

  final homepage = Uri.tryParse(accounts?.homepage ?? '');
  if (homepage != null &&
      (homepage.scheme == 'https' || homepage.scheme == 'http') &&
      homepage.host.isNotEmpty) {
    links.add((
      site: PersonSite.website,
      url: homepage.toString(),
      handle: homepage.host,
    ));
  }

  return links;
}

/// A person's own pages as a row of round brand buttons. Shows nothing when
/// there are none or the user switched the links off, and nothing on TV,
/// which has no browser to open them in.
class PersonLinksRow extends StatelessWidget {
  final AggregatedItem item;
  final TmdbPersonAccounts? accounts;
  final WrapAlignment alignment;

  /// Space around the row, left out along with the row when there's nothing
  /// to link.
  final EdgeInsetsGeometry padding;

  const PersonLinksRow({
    super.key,
    required this.item,
    this.accounts,
    this.alignment = WrapAlignment.center,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    if (PlatformDetection.isTV ||
        !DetailSectionVisibility.of(
          GetIt.instance<UserPreferences>(),
        ).shows(DetailSection.personLinks)) {
      return const SizedBox.shrink();
    }
    final links = personLinksFor(item, accounts);
    if (links.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: padding,
      child: Wrap(
        alignment: alignment,
        spacing: 8,
        runSpacing: 8,
        children: [for (final link in links) _PersonLinkButton(link: link)],
      ),
    );
  }
}

class _PersonLinkButton extends StatefulWidget {
  final PersonLink link;

  const _PersonLinkButton({required this.link});

  @override
  State<_PersonLinkButton> createState() => _PersonLinkButtonState();
}

class _PersonLinkButtonState extends State<_PersonLinkButton> {
  bool _hovered = false;
  bool _focused = false;

  String _siteName(AppLocalizations l10n) => switch (widget.link.site) {
    PersonSite.imdb => 'IMDb',
    PersonSite.tmdb => 'TMDB',
    PersonSite.instagram => 'Instagram',
    PersonSite.x => 'X',
    PersonSite.facebook => 'Facebook',
    PersonSite.tiktok => 'TikTok',
    PersonSite.youtube => 'YouTube',
    PersonSite.website => l10n.personWebsite,
  };

  Widget _mark(bool highlighted) {
    // The white marks would vanish on the white highlight.
    final plain = highlighted ? Colors.black : Colors.white;
    Widget svg(String name, Color color, double size) => SvgPicture.asset(
      'assets/icons/social/$name.svg',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
    return switch (widget.link.site) {
      PersonSite.imdb => Image.asset(
        'assets/icons/ratings/imdb.png',
        width: 30,
        height: 15,
      ),
      PersonSite.tmdb => Image.asset(
        'assets/icons/ratings/tmdb.png',
        width: 22,
        height: 22,
      ),
      PersonSite.instagram => svg('instagram', const Color(0xFFFF0069), 20),
      PersonSite.x => svg('x', plain, 18),
      PersonSite.facebook => svg('facebook', const Color(0xFF0866FF), 20),
      PersonSite.tiktok => svg('tiktok', plain, 19),
      PersonSite.youtube => svg('youtube', const Color(0xFFFF0000), 21),
      PersonSite.website => Icon(Icons.language, size: 22, color: plain),
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final handle = widget.link.handle;
    final label = handle == null
        ? _siteName(l10n)
        : '${_siteName(l10n)} · $handle';
    final highlighted = _hovered || _focused;
    final focusColor = Color(
      GetIt.instance<UserPreferences>().get(UserPreferences.focusColor).colorValue,
    );

    return Tooltip(
      message: label,
      excludeFromSemantics: true,
      child: Semantics(
        link: true,
        label: label,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () => launchTrailerExternally(widget.link.url),
            onHover: (value) => setState(() => _hovered = value),
            onFocusChange: (value) => setState(() => _focused = value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: highlighted
                    ? AppColorScheme.buttonFocused
                    : Colors.white.withValues(alpha: 0.06),
                border: Border.all(
                  color: highlighted
                      ? focusColor
                      : AppColorScheme.onSurface.withValues(alpha: 0.35),
                  width: highlighted ? 2.5 : 1.5,
                ),
              ),
              child: Center(child: _mark(highlighted)),
            ),
          ),
        ),
      ),
    );
  }
}
