import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/cartadd.dart';
import 'product_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //product list
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
      description: "Chair matcha coloured.",
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
                child: GridView.builder(
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
                            //rating and favorite
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.star, color: Colors.orange, size: 16),
                                      const SizedBox(width: 4),
                                      Text(product.rating.toString(),
                                          style: const TextStyle(fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  const Icon(Icons.favorite_border, size: 18),
                                ],
                              ),
                            ),

                            //image
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  product.image,
                                  fit: BoxFit.contain,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),

                            //name
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                              child: Text(product.name,
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
                                        SnackBar(content: Text('${product.name} added to cart')),
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
