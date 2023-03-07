import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:product_app/models/product.dart';

void main() {
  testWidgets('Product | should return correct data when valid param is passed',
      (WidgetTester tester) async {
    String rawData =
        '{"id":11,"title":"perfume Oil","price":13,"thumbnail":"https://i.dummyjson.com/data/products/11/thumbnail.jpg","stock":65,"discountPercentage":8.4}';

    final fromJson = Product.fromJson(jsonDecode(rawData));

    expect(fromJson.id, 11);
    expect(fromJson.title, "perfume Oil");
  });
  testWidgets(
      'Products | should not throw an error when one of the properties is null',
      (WidgetTester tester) async {
    String rawData =
        '{"id":11,"title":"perfume Oil","price":13,"thumbnail":null,"stock":65,"discountPercentage":null}';
    final fromJson = Product.fromJson(jsonDecode(rawData));

    expect(fromJson.thumbnail, isNull);
    expect(fromJson.discountPercentage, isNull);
  });
}
