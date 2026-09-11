/// TMDB image bases for the artwork Seerr hands back as bare paths. The widths
/// are picked per slot, so a poster never downloads at backdrop size.
const seerrPosterBase = 'https://image.tmdb.org/t/p/w342';
const seerrBackdropBase = 'https://image.tmdb.org/t/p/w1280';
const seerrProfileBase = 'https://image.tmdb.org/t/p/w185';

/// Portrait size for slots that show a person at card size (200 to 355px
/// wide), where w185 would upscale.
const seerrProfileLargeBase = 'https://image.tmdb.org/t/p/w500';

/// Poster size for the larger cards, where w342 upscales visibly.
const seerrPosterLargeBase = 'https://image.tmdb.org/t/p/w500';

/// Backdrop size for slots that show one inside a card rather than behind the
/// whole page, where w1280 is far more than the space needs.
const seerrBackdropSmallBase = 'https://image.tmdb.org/t/p/w780';
