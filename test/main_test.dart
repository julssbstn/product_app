// This is a basic Flutter widget test.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:product_app/main.dart';

void main() {
  testWidgets('MyApp smoke test | should display ProductsPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byKey(const Key("ProductsPage")), findsOneWidget);
  });
}
