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

class Product {
  num id;
  String? title;
  num? price;
  String? thumbnail;
  num? stock;
  num? discountPercentage;

  Product({
    required this.id,
    this.title,
    this.price,
    this.thumbnail,
    this.stock,
    this.discountPercentage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      thumbnail: json["thumbnail"],
      stock: json["stock"],
      discountPercentage: json["discountPercentage"],
    );
  }
}
