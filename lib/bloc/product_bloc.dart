import 'dart:async';

import 'package:product_app/bloc/bloc_provider.dart';
import 'package:product_app/models/product_details.dart';
import 'package:product_app/models/products.dart';
import 'package:product_app/webservices/product_webservice.dart';

class ProductBloc implements Bloc {
  ProductWebService service = ProductWebService();

  final _productListController = StreamController<Products>();
  Stream<Products> get productStream => _productListController.stream;

  final _pageController = StreamController<num>();
  Stream<num?> get pageStream => _pageController.stream;

  void onPageChanged(num page) {
    print(page);
  }

  Future<void> getProducts({num limit = 10, num skip = 0}) async {
    try {
      Products products = await service.getProducts(limit, skip);
      _productListController.sink.add(products);
    } catch (e) {
      _productListController.sink.addError(e);
    }
  }

  Future<ProductDetails> getProductDetails(num id) async {
    try {
      ProductDetails details = await service.getProductDetails(id);
      return details;
    } catch (e) {
      throw e;
    }
  }

  @override
  void dispose() {
    _productListController.close();
    _pageController.close();
  }
}
