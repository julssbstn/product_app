import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_app/models/product_details.dart';

void main() {
  testWidgets(
      'ProductDetails | should return correct data when valid param is passed',
      (WidgetTester tester) async {
    String rawData =
        '{"id":12,"title":"Brown Perfume","description":"Royal_Mirage Sport Brown Perfume for Men & Women - 120ml","price":40,"discountPercentage":15.66,"rating":4,"stock":52,"brand":"Royal_Mirage","category":"fragrances","thumbnail":"https://i.dummyjson.com/data/products/12/thumbnail.jpg","images":["https://i.dummyjson.com/data/products/12/1.jpg"]}';

    final fromJson = ProductDetails.fromJson(jsonDecode(rawData));

    expect(fromJson.id, 12);
    expect(fromJson.title, "Brown Perfume");
  });
  testWidgets(
      'ProductDetails | should not throw an error when one of the properties is null',
      (WidgetTester tester) async {
    String rawData =
        '{"id":12,"title":"Brown Perfume","description":"Royal_Mirage Sport Brown Perfume for Men & Women - 120ml","price":40,"discountPercentage":null,"rating":4,"stock":52,"brand":"Royal_Mirage","category":null,"thumbnail":"https://i.dummyjson.com/data/products/12/thumbnail.jpg","images":null}';
    final fromJson = ProductDetails.fromJson(jsonDecode(rawData));

    expect(fromJson.category, isNull);
    expect(fromJson.discountPercentage, isNull);
    expect(fromJson.images, isEmpty);
  });
}
