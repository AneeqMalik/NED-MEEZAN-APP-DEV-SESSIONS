import 'dart:convert';
import 'package:meezan_commerce/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsService {
  final String url = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      // Log the error or handle it accordingly
      print('Error fetching products: $e');
      rethrow;
    }
  }
}