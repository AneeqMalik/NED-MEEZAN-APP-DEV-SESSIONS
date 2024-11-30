import 'package:flutter/material.dart';
import 'package:meezan_commerce/models/products_model.dart';
import 'package:meezan_commerce/services/products_service.dart';

class ProductsProvider extends ChangeNotifier {
  final ProductsService _service = ProductsService();

  List<ProductModel> _products = [];
  List<ProductModel> _cartItems = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ProductModel> get products => _products;
  List<ProductModel> get cartItems => _cartItems;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Fetch Products
  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;

    try {
      _products = await _service.getProducts();
    } catch (e) {
      _errorMessage = 'Failed to fetch products: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add Item to Cart
  void addToCart(ProductModel product) {
    _cartItems.add(product);
    _products.remove(product);
    notifyListeners();
  }

  // Remove Item from Cart
  void removeFromCart(ProductModel product) {
    _cartItems.remove(product);
    _products.add(product);
    notifyListeners();
  }

  // Clear the Cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
