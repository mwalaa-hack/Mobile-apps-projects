import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/cart.dart';
import 'package:provider/provider.dart';
import 'providers/cartadd.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),  //create provider
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //to hide debugs
      title: 'Furniture Shop',
      theme: ThemeData(primarySwatch: Colors.blue),
      
      home: const HomeScreen(),
      
      routes: {
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
