import 'package:moonfin_mobile_ui/moonfin_mobile_ui.dart';

// Preview fixtures only. The application uses authenticated server data.
const demoCatalog = <MobileMedia>[
  MobileMedia(
    id: 'dune',
    title: 'Dune: Part Two',
    titleArt: 'DUNE',
    titleArtSubtitle: 'PART TWO',
    kind: MobileMediaKind.movie,
    metadata: '2024  ·  Science fiction  ·  PG-13',
    subtitle: '2024 · Science fiction',
    overview:
        'Beyond fear, destiny awaits. Paul Atreides joins the Fremen on a journey that will change the universe.',
    posterUrl: 'assets/dune-poster.jpg',
    backdropUrl: 'assets/dune-backdrop.jpg',
  ),
  MobileMedia(
    id: 'severance',
    title: 'Severance',
    kind: MobileMediaKind.series,
    metadata: '2022  ·  Thriller  ·  TV-MA',
    subtitle: 'S1 E4 · The You You Are',
    overview:
        'There is more to work than meets the eye. A team begins to question the boundary between their two lives.',
    posterUrl: 'assets/severance-poster.jpg',
    backdropUrl: 'assets/severance-backdrop.jpg',
    progress: .43,
    saved: true,
  ),
  MobileMedia(
    id: 'interstellar',
    title: 'Interstellar',
    kind: MobileMediaKind.movie,
    metadata: '2014  ·  Adventure  ·  PG-13',
    subtitle: '2014 · Adventure',
    overview:
        'A journey beyond this galaxy to discover whether mankind has a future among the stars.',
    posterUrl: 'assets/interstellar-poster.jpg',
    backdropUrl: 'assets/interstellar-backdrop.jpg',
    progress: .62,
  ),
  MobileMedia(
    id: 'the-bear',
    title: 'The Bear',
    kind: MobileMediaKind.series,
    metadata: '2022  ·  Drama  ·  TV-MA',
    subtitle: 'S2 E6 · Fishes',
    overview:
        'Every second counts. A young chef returns to Chicago to run his family’s sandwich shop.',
    posterUrl: 'assets/bear-poster.jpg',
    backdropUrl: 'assets/bear-backdrop.jpg',
    progress: .24,
    saved: true,
  ),
  MobileMedia(
    id: 'arrival',
    title: 'Arrival',
    kind: MobileMediaKind.movie,
    metadata: '2016  ·  Science fiction  ·  PG-13',
    subtitle: '2016 · Science fiction',
    overview:
        'A linguist searches for meaning when mysterious spacecraft arrive on Earth.',
    posterUrl: 'assets/arrival-poster.jpg',
    backdropUrl: 'assets/arrival-backdrop.jpg',
  ),
  MobileMedia(
    id: 'foundation',
    title: 'Foundation',
    kind: MobileMediaKind.series,
    metadata: '2021  ·  Science fiction  ·  TV-14',
    subtitle: '2021 · Science fiction',
    overview:
        'The future is a story yet to be written. A band of exiles sets out to save civilization.',
    posterUrl: 'assets/foundation-poster.jpg',
    backdropUrl: 'assets/foundation-backdrop.jpg',
  ),
];
