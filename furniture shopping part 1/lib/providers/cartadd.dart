
import 'package:flutter/material.dart';
import '../models/product.dart';


class CartProvider with ChangeNotifier{ //ChangeNotifier ---> notify when data changes
  final List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems; //getter only read cart item (cant edit)

  //adding a product to cart
  void addItem(Product product) {
    _cartItems.add(product);
    notifyListeners(); //rebuild
  }

  //removing a product from cart
  void removeItem(Product product) {
    _cartItems.remove(product);
    notifyListeners(); //rebuild
  }

  //calculate total price
  double get totalPrice{
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.price;
    }
    return total;
  }
}
