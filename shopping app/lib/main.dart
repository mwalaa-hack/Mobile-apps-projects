import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
import 'screens/cart.dart';
import 'screens/login.dart';
import 'screens/signup.dart'; 
import 'providers/cartadd.dart';
import 'providers/allowed.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture Shop',
      theme: ThemeData(primarySwatch: Colors.blue),
      
      home: const LoginScreen(), //start app at LoginScreen
      
      routes: {
        '/cart': (context) => const CartScreen(),
        '/home': (context) => const HomeScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
