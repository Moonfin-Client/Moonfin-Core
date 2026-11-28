import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/bounded_network_image.dart';
import 'package:moonfin/ui/widgets/media_card.dart';

void main() {
  Future<BoxFit> fitOf(WidgetTester tester, {required bool fitImage}) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MediaCard(
            title: 'Show',
            width: 150,
            aspectRatio: 2 / 3,
            imageUrl: 'http://fake/wide.jpg',
            fitImage: fitImage,
            onTap: () {},
          ),
        ),
      ),
    );
    return tester
        .widget<BoundedNetworkImage>(find.byType(BoundedNetworkImage))
        .fit;
  }

  testWidgets('a fitted image shows whole inside the card', (tester) async {
    expect(await fitOf(tester, fitImage: true), BoxFit.contain);
  });

  testWidgets('an image fills the card by default', (tester) async {
    expect(await fitOf(tester, fitImage: false), BoxFit.cover);
  });
}
