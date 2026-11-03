/// Optional extra for an `ItemsApi` whose server can say where a letter's
/// titles start in a list sorted by name.
///
/// The alphabet bar walks a library page by page until the letter turns up.
/// On a server with a letter index, the app asks for the position first and
/// loads up to it in one request (Silo). The app checks for it with
/// `itemsApi is LetterPositionApi`, and servers without one need nothing.
abstract interface class LetterPositionApi {
  /// The zero-based position of the first title filed under [letter] (`#`
  /// for anything not starting with a letter) in the list last read with
  /// `getItems` for [parentId], when that list was sorted by name. Null when
  /// unknown: no such list, another sort, or the letter has no titles.
  Future<int?> letterPosition(String letter, {required String parentId});
}
