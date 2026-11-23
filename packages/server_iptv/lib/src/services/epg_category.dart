enum EpgCategory { general, movie, series, sports, news, kids }

EpgCategory classifyEpg(String? text) {
  final t = text?.toLowerCase().trim() ?? '';
  if (t.isEmpty) return EpgCategory.general;
  if (t.contains('sport')) return EpgCategory.sports;
  if (t.contains('news')) return EpgCategory.news;
  if (t.contains('kid') || t.contains('child') || t.contains('cartoon')) {
    return EpgCategory.kids;
  }
  if (t.contains('movie') || t.contains('film')) return EpgCategory.movie;
  if (t.contains('series') || t.contains('show')) return EpgCategory.series;
  return EpgCategory.general;
}

class EpgCategoryFlags {
  const EpgCategoryFlags(this.category);
  final EpgCategory category;

  factory EpgCategoryFlags.fromText(String? text) =>
      EpgCategoryFlags(classifyEpg(text));

  bool get isMovie => category == EpgCategory.movie;
  bool get isSeries => category == EpgCategory.series;
  bool get isSports => category == EpgCategory.sports;
  bool get isNews => category == EpgCategory.news;
  bool get isKids => category == EpgCategory.kids;
}
