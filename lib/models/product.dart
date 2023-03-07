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
