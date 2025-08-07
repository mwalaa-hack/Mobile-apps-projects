import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black, //Black outer background
        body: Center(
          child: Container(
            width: 500, //Width of the white login area
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white, //White inner
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Image
                Image.asset(
                  'assets/images/Mobile login-rafiki.png',
                  height: 150,
                ),
                const SizedBox(height: 20),

                //title
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 20),


                // Email
                const TextField(
                  style: TextStyle(
                    fontFamily: 'Poppins', //text input
                  ),
                  decoration: InputDecoration( //subtitle
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                    ),
                    border: UnderlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 10),

                //Password
                const TextField(
                  obscureText: true,
                  style: TextStyle(
                    fontFamily: 'Poppins', //text input
                  ),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto', //subtitle
                    ),
                    border: UnderlineInputBorder(),
                  ),
                ),


                //Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 49, 87),
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),


                //Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
