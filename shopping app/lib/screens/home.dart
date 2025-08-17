import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_details.dart';
import 'package:provider/provider.dart';
import '../providers/cartadd.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = []; //list of products

  //fetch products from Fake Store API
  Future<void> fetchProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      setState(() {
        products = data.map((json) => Product.fromJson(json)).toList();
      });
    } else {
      //error handling
      if(!mounted) return; //prevents context error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load products')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFbcc3c3),

      //bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 2) {
            //go to cart screen
            Navigator.pushNamed(context, '/cart');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Likes'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Bag'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Setting'),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Explore",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.view_agenda_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.grid_view),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              //products grid
              Expanded(
                child: products.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        itemCount: products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return GestureDetector(
                            //go to product details
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetailsScreen(product: product),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //image
                                  Expanded(
                                    child: Center(
                                      child: Image.network(
                                        product.image,
                                        fit: BoxFit.contain,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),

                                  //title
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                    child: Text(product.title,
                                        style: const TextStyle(fontWeight: FontWeight.bold)),
                                  ),

                                  //price and add button
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "₱${product.price.toStringAsFixed(2)}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 14),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            //add to cart
                                            Provider.of<CartProvider>(context, listen: false)
                                                .addItem(product);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('${product.title} added to cart')),
                                            );
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.amber,
                                              shape: BoxShape.circle,
                                            ),
                                            padding: const EdgeInsets.all(6),
                                            child: const Icon(Icons.add, size: 18, color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
