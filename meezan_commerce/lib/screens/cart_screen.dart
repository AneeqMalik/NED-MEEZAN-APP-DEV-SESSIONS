import 'package:flutter/material.dart';
import 'package:meezan_commerce/providers/products_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Consumer<ProductsProvider>(
        builder: (context, provider, _) {
          if (provider.cartItems.isEmpty) {
            return Center(child: Text('Your cart is empty.'));
          } else {
            return ListView.builder(
              itemCount: provider.cartItems.length,
              itemBuilder: (context, index) {
                final product = provider.cartItems[index];
                return ListTile(
                  leading: Image.network(product.image, width: 50, height: 50),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      provider.removeFromCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.name} removed from cart!')),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Consumer<ProductsProvider>(
        builder: (context, provider, _) {
          final totalPrice = provider.cartItems.fold(
            0.0,
            (sum, item) => sum + item.price,
          );
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
