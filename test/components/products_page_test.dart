import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product_app/bloc/bloc_provider.dart';
import 'package:product_app/bloc/product_bloc.dart';
import 'package:product_app/components/products_page.dart';
import 'package:product_app/models/products.dart';

import '../bloc/bloc_test.mocks.dart';

void main() {
  testWidgets('ProductPage | smoke test', (WidgetTester tester) async {
    ProductBloc mockProductBloc = MockProductBloc();

    final testStream = StreamController<Products>();

    when(mockProductBloc.productStream).thenAnswer((_) {
      return testStream.stream;
    });

    await tester.pumpWidget(
      BlocProvider(
        bloc: mockProductBloc,
        child: MaterialApp(
          home: Material(
            child: ProductPage(title: 'Test Product Page'),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 1));
    testStream.close();

    expect(find.text('Test Product Page'), findsOneWidget);
  });
}
