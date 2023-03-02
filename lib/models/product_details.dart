class ProductDetails {
  num id;
  String? title;
  String? description;
  num? price;
  num? discountPercentage;
  num? rating;
  num? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  ProductDetails({
    required this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    List<String> _images = [];
    if (json['images'] != null) {
      final list = json['images'] as List;
      list.forEach((e) {
        _images.add(e);
      });
    }

    return ProductDetails(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      discountPercentage: json["discountPercentage"],
      rating: json["rating"],
      stock: json["stock"],
      brand: json["brand"],
      category: json["category"],
      thumbnail: json["thumbnail"],
      images: _images,
    );
  }
}
