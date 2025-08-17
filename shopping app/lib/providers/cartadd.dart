import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier { //ChangeNotifier ---> notify when data changes
  //store each product with its quantity instead of a simple list
  final Map<Product, int> _cartItems = {};
  Map<Product, int> get cartItems => _cartItems; //getter only read cart item (cant edit)

  //adding a product to cart (increase quantity if it already exists)
  void addItem(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1; //! == sure it is not null
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners(); //rebuild
  }

  //removing a product from cart (decrease quantity or remove completely if 1)
  void removeItem(Product product) {
    if (_cartItems.containsKey(product)) {
      if (_cartItems[product]! > 1) { 
        _cartItems[product] = _cartItems[product]! - 1; //! == sure it is not null
      } else {
        _cartItems.remove(product);
      }
      notifyListeners(); //rebuild
    }
  }

  //calculate total price
  double get totalPrice {
    double total = 0.0;
    _cartItems.forEach((product, qty) {
      total += product.price * qty;
    });
    return total;
  }

  //get number of items in cart
  int get count {
    int totalCount = 0;
    _cartItems.forEach((_, qty) => totalCount += qty);
    return totalCount;
  }

  //clear cart
  void clear() {
    _cartItems.clear();
    notifyListeners();
  }
}
