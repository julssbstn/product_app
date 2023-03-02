import 'package:http/http.dart' as http;
import 'package:product_app/models/product_details.dart';
import 'dart:convert';

import 'package:product_app/models/products.dart';

class ProductWebService {
  Future<Products> getProducts(num limit, num skip) async {
    try {
      final url =
          "https://dummyjson.com/products?limit=$limit&skip=$skip&select=title,price,thumbnail,stock,discountPercentage";

      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody =
            json.decode(response.body) as Map<String, dynamic>;
        Products result = Products.fromJson(responseBody);
        return result;
      } else {
        throw Exception("failed to fetch Products");
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<ProductDetails> getProductDetails(num id) async {
    try {
      final url = "https://dummyjson.com/products/$id";

      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody =
            json.decode(response.body) as Map<String, dynamic>;
        ProductDetails result = ProductDetails.fromJson(responseBody);
        return result;
      } else {
        throw Exception("failed to fetch Products");
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
