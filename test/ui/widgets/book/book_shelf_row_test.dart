import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/book/book_shelf_row.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';

void main() {
  const row = HomeRow(
    id: 'genres',
    title: 'Genres',
    rowType: HomeRowType.genres,
    items: [
      AggregatedItem(
        id: 'g1',
        serverId: 's1',
        rawData: {'Id': 'g1', 'Name': 'Fantasy', 'Type': 'Genre'},
      ),
    ],
  );

  Future<void> pumpRow(WidgetTester tester, double leadingInset) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: BookShelfRow(
            row: row,
            title: row.title,
            variant: BookShelfVariant.chip,
            hubKey: 'books_genres',
            rowKey: GlobalKey<LockedFocusRowState<AggregatedItem>>(),
            onItemTap: (_) {},
            imageUrlFor: (_) => null,
            leadingInset: leadingInset,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('the leading inset moves the title and first item together', (
    tester,
  ) async {
    await pumpRow(tester, 16);
    final item = tester.getTopLeft(find.text('Fantasy')).dx;
    expect(tester.getTopLeft(find.text('Genres')).dx, 16);

    await pumpRow(tester, 60);
    expect(tester.getTopLeft(find.text('Genres')).dx, 60);
    expect(tester.getTopLeft(find.text('Fantasy')).dx, item + 44);
  });
}
