import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:product_app/models/product_details.dart';
import 'package:product_app/models/products.dart';
import 'package:product_app/webservices/product_webservice.dart';

import 'webservice_test.mocks.dart' as mock;

void main() {
  test('ProductWebService | getProducts should return valid data from id 1-3',
      () async {
    final mockClient = mock.MockClient();
    final productWebService = ProductWebService();

    final limit = 3;
    final skip = 0;

    final url =
        "https://dummyjson.com/products?limit=$limit&skip=$skip&select=title,price,thumbnail,stock,discountPercentage";
    Uri uri = Uri.parse(url);

    final result =
        '{"products":[{"id":1,"title":"iPhone 9","price":549,"thumbnail":"https://i.dummyjson.com/data/products/1/thumbnail.jpg","stock":94,"discountPercentage":12.96},{"id":2,"title":"iPhone X","price":899,"thumbnail":"https://i.dummyjson.com/data/products/2/thumbnail.jpg","stock":34,"discountPercentage":17.94},{"id":3,"title":"Samsung Universe 9","price":1249,"thumbnail":"https://i.dummyjson.com/data/products/3/thumbnail.jpg","stock":36,"discountPercentage":15.46}],"total":100,"skip":0,"limit":3}';

    when(mockClient.get(uri, headers: {"Content-Type": "application/json"}))
        .thenAnswer((_) async {
      return Response(result, 200);
    });

    final productResult =
        await productWebService.getProducts(limit, skip, client: mockClient);

    expect(productResult, isA<Products>());
    expect(productResult.products.length, limit);
  });

  test(
      'ProductWebService | getProductDetails should return valid data matched from ID passed',
      () async {
    final mockClient = mock.MockClient();
    final productWebService = ProductWebService();

    final id = 12;

    final url = "https://dummyjson.com/products/$id";
    Uri uri = Uri.parse(url);

    final result =
        '{"id":12,"title":"Brown Perfume","description":"Royal_Mirage Sport Brown Perfume for Men & Women - 120ml","price":40,"discountPercentage":15.66,"rating":4,"stock":52,"brand":"Royal_Mirage","category":"fragrances","thumbnail":"https://i.dummyjson.com/data/products/12/thumbnail.jpg","images":["https://i.dummyjson.com/data/products/12/1.jpg","https://i.dummyjson.com/data/products/12/2.jpg","https://i.dummyjson.com/data/products/12/3.png","https://i.dummyjson.com/data/products/12/4.jpg","https://i.dummyjson.com/data/products/12/thumbnail.jpg"]}';

    when(mockClient.get(uri, headers: {"Content-Type": "application/json"}))
        .thenAnswer((_) async {
      return Response(result, 200);
    });

    final detailsResult =
        await productWebService.getProductDetails(id, client: mockClient);

    expect(detailsResult, isA<ProductDetails>());
    expect(detailsResult.id, id);
  });
}
