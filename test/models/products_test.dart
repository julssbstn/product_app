import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:product_app/models/products.dart';

void main() {
  testWidgets(
      'Products | should return correct data when valid param is passed',
      (WidgetTester tester) async {
    String rawData =
        '{"products":[{"id":11,"title":"perfume Oil","price":13,"thumbnail":"https://i.dummyjson.com/data/products/11/thumbnail.jpg","stock":65,"discountPercentage":8.4}]}';

    final fromJson = Products.fromJson(jsonDecode(rawData));

    expect(fromJson.products.first.id, 11);
    expect(fromJson.products.first.title, "perfume Oil");
  });
  testWidgets('Products | should return empty list when param passed is null',
      (WidgetTester tester) async {
    Map<String, dynamic> rawData = {};
    final fromJson = Products.fromJson(rawData);

    expect(fromJson, isA<Products>());
    expect(fromJson.toString(), Products(products: []).toString());
  });
}
