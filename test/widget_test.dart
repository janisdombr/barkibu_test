// This is a basic Flutter widget test.
//

import 'package:barkibu_test/models/cat_model.dart';
import 'package:barkibu_test/screens/cat_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  /// Test for CatDetailsScreen widget
  /// Compare this snippet from lib/screens/cat_details_screen.dart:
  testWidgets(
    'List widget test',
    (WidgetTester tester) async {
      Cat cat = const Cat(
          id: 'Rn6xqsiHb9B7qgLw',
          tags: ['tag1', 'tag2'],
          owner: 'owner1',
          createdAt: 'Fri Sep 02 2022 20:19:48 GMT+0000 (Coordinated Universal Time)',
          updatedAt: 'Fri Sep 02 2022 20:19:48 GMT+0000 (Coordinated Universal Time)',
        );
      await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(home: CatDetailsScreen(cat: cat, imagePathUrl: 'https://cataas.com/cat'))));
      expect(find.text('Owner: owner1'), findsOneWidget);
      expect(find.text('Tags: tag1, tag2'), findsOneWidget);
      expect(find.text('Created at: Fri Sep 02 2022 20:19:48 GMT+0000 (Coordinated Universal Time)'), findsOneWidget);
      expect(find.text('Updated at: Fri Sep 02 2022 20:19:48 GMT+0000 (Coordinated Universal Time)'), findsOneWidget);
    },
  );
}
