import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; //for .watch
import '../providers/cartadd.dart'; 

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    //get the current CartProvider and rebuild automatically when the cart changes.
    final cart = context.watch<CartProvider>();
    final cartItems = cart.cartItems;              //get products list in cart items

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index].name),
          );
        },
      ),
    );
  }
}
