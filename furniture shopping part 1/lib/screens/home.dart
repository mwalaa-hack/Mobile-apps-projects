import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/cartadd.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //products list
  final List<Product> products = const [
    Product(
      name: "Double Seat Sofa",
      price: 8000.00,
      rating: 4.2,
      image: "assets/images/Rectangle 10.png",
      description: "Comfortable white sofa with 2 seats.",
    ),
    Product(
      name: "Matcha Chair",
      price: 2650.00,
      rating: 3.8,
      image: "assets/images/Rectangle 14.png",
      description: "Chair matcha coloured .",
    ),
    Product(
      name: "Aesthetic Single Seat",
      price: 2800.00,
      rating: 3.5,
      image: "assets/images/Rectangle 20.png",
      description: "White chair with 4 legs.",
    ),
    Product(
      name: "Coffee Sofa",
      price: 8300.00,
      rating: 4.1,
      image: "assets/images/Rectangle 22.png",
      description: "Latte coloured big sofa.",
    ),
  
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),

      //show products list
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card( //card is a widget that shows a material design card
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(product.image, width: 50, height: 50),
              title: Text(product.name),
              subtitle: Text("\$${product.price}"),
              trailing: ElevatedButton( //button to add product to cart,trailing is the right most widget
                
                onPressed: () {
                //add product to cart provider
                Provider.of<CartProvider>(context, listen: false).addItem(product);

                //Show feedback
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} added to cart')),
                );
              },


                child: const Text("Add"),
              ),
            ),
          );
        },
      ),
    );
  }
}
