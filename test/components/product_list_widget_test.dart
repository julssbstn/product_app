import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_app/components/product_list_widget.dart';
import 'package:product_app/models/product_details.dart';
import 'package:product_app/models/products.dart';

void main() {
  testWidgets(
      'ProductListWidget | should display correct list when valid data is passed into the stream',
      (WidgetTester tester) async {
    final testStream = StreamController<Products>();
    String rawData =
        '{"products":[{"id":11,"title":"perfume Oil","price":13,"thumbnail":null,"stock":65,"discountPercentage":8.4}]}';

    Products testData = Products.fromJson(jsonDecode(rawData));

    Future<ProductDetails> getProductDetail(num id) {
      return Future.value(ProductDetails(id: id));
    }

    Future getProductList(num skip) {
      return Future.value();
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ProductListWidget(
            stream: testStream.stream,
            getProductDetail: getProductDetail,
            getProductList: getProductList,
          ),
        ),
      ),
    );

    testStream.sink.add(testData);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    testStream.close();

    expect(find.text("perfume Oil"), findsOneWidget);
    expect(find.text("8.4% OFF"), findsOneWidget);
    expect(find.text("65 left"), findsOneWidget);
  });
  testWidgets(
      'ProductListWidget | should diplay loading widget when stream has no data',
      (WidgetTester tester) async {
    final testStream = StreamController<Products>();

    Future<ProductDetails> getProductDetail(num id) {
      return Future.value(ProductDetails(id: id));
    }

    Future getProductList(num skip) {
      return Future.value();
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ProductListWidget(
            stream: testStream.stream,
            getProductDetail: getProductDetail,
            getProductList: getProductList,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 1));
    testStream.close();

    expect(find.byKey(const Key("LoadingWidget")), findsOneWidget);
  });
}
