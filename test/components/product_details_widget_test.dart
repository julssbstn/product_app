import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_app/components/product_details_widget.dart';
import 'package:product_app/models/product_details.dart';

void main() {
  testWidgets(
      'ProductDetailsWidget | should display correct details when valid data is passed into the stream',
      (WidgetTester tester) async {
    String rawData =
        '{"id":12,"title":"Brown Perfume","description":"Royal_Mirage Sport Brown Perfume for Men & Women - 120ml","price":40,"discountPercentage":15.66,"rating":4,"stock":52,"brand":"Royal_Mirage","category":"fragrances","thumbnail":"https://i.dummyjson.com/data/products/12/thumbnail.jpg","images":[]}';

    final fromJson = ProductDetails.fromJson(jsonDecode(rawData));

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ProductDetailsWidget(details: fromJson),
        ),
      ),
    );

    expect(find.text("Brown Perfume"), findsOneWidget);
    expect(find.text("15.66% OFF"), findsOneWidget);
    expect(find.text("52 left"), findsOneWidget);
  });
}
