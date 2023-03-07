import 'package:product_app/models/product.dart';

class Products {
  List<Product> products;

  Products({required this.products});

  factory Products.fromJson(Map<String, dynamic> json) {
    List<Product> _products = [];
    if (json['products'] != null) {
      final list = json['products'] as List;
      list.forEach((e) {
        _products.add(Product.fromJson(e));
      });
    }

    return Products(products: _products);
  }
}
