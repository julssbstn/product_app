import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product_app/bloc/product_bloc.dart';
import 'package:product_app/models/product_details.dart';
import 'package:product_app/models/products.dart';

import '../webservices/webservice_test.mocks.dart';

void main() {
  test(
      'ProductBloc | productStream should return correct Products result when getProducts() is called',
      () async {
    final mockProductWebService = MockProductWebService();
    final productBloc = ProductBloc(service: mockProductWebService);

    final limit = 3;
    final skip = 0;

    final rawData =
        '{"products":[{"id":1,"title":"iPhone 9","price":549,"thumbnail":"https://i.dummyjson.com/data/products/1/thumbnail.jpg","stock":94,"discountPercentage":12.96},{"id":2,"title":"iPhone X","price":899,"thumbnail":"https://i.dummyjson.com/data/products/2/thumbnail.jpg","stock":34,"discountPercentage":17.94},{"id":3,"title":"Samsung Universe 9","price":1249,"thumbnail":"https://i.dummyjson.com/data/products/3/thumbnail.jpg","stock":36,"discountPercentage":15.46}],"total":100,"skip":0,"limit":3}';

    when(mockProductWebService.getProducts(limit, skip)).thenAnswer((_) async {
      return Products.fromJson(jsonDecode(rawData));
    });

    productBloc.productStream.listen((e) {
      expect(e, isNot(Exception));
      expect(e, isNotNull);

      if (e.products.isNotEmpty) {
        expect(e.products.length, limit);
      }
    });

    await productBloc.getProducts(limit: limit, skip: skip);
  });

  test(
      'ProductBloc | getProductDetails() should return  Product Details matched from id is passed',
      () async {
    final mockProductWebService = MockProductWebService();
    final productBloc = ProductBloc(service: mockProductWebService);
    final id = 12;

    final rawData =
        '{"id":12,"title":"Brown Perfume","description":"Royal_Mirage Sport Brown Perfume for Men & Women - 120ml","price":40,"discountPercentage":15.66,"rating":4,"stock":52,"brand":"Royal_Mirage","category":"fragrances","thumbnail":"https://i.dummyjson.com/data/products/12/thumbnail.jpg","images":["https://i.dummyjson.com/data/products/12/1.jpg","https://i.dummyjson.com/data/products/12/2.jpg","https://i.dummyjson.com/data/products/12/3.png","https://i.dummyjson.com/data/products/12/4.jpg","https://i.dummyjson.com/data/products/12/thumbnail.jpg"]}';

    when(mockProductWebService.getProductDetails(id)).thenAnswer((_) async {
      return ProductDetails.fromJson(jsonDecode(rawData));
    });

    final actualDetails = await productBloc.getProductDetails(id);

    expect(actualDetails, isA<ProductDetails>());
    expect(actualDetails.id, id);
  });
}
