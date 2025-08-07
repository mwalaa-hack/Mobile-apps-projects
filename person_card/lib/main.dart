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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Center(
            child: Container(
              width: 229,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F3D0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Top Pattern
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      'assets/images/bk.png',
                      fit: BoxFit.cover,
                      height: 40,
                      width: double.infinity,
                    ),
                  ),

                  const SizedBox(height: 20),

                  //person image
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/person.png'),
                  ),

                  const SizedBox(height: 15),

                  //Name
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.5),
                    ),
                    child: const Text(
                      'EMMANUELLA OBOH',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cinzel',
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  //email
                  const Text(
                    '@obohemmanuella',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontFamily: 'Lato',
                    ),
                  ),
                  
                  //seperator
                  Container(
                    width: 40,
                    height: 2,
                    color: Colors.teal,
                  ),

                  const SizedBox(height: 8),

                  //job
                  const Text(
                    '- Product Design Track',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),

                  const SizedBox(height: 15),

                  //Description
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'I have chosen the product design full-time track as I hope to become '
                      'an entry level designer within the next 6 months. I believe this program '
                      'will help me achieve my goals.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Lato',
                        ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  //second seperator
                  Container(
                    width: 40,
                    height: 2,
                    color: Colors.teal,
                  ),

                  const SizedBox(height: 10),


                 //Icons Row ,I used images instead of icons becuz they are not default
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Instagram.png', width: 20, height: 20),
                    const SizedBox(width: 10),
                    Image.asset('assets/images/Twitter Squared.png', width: 20, height: 20),
                    const SizedBox(width: 10),
                    Image.asset('assets/images/LinkedIn.png', width: 20, height: 20),
                    const SizedBox(width: 10),
                    Image.asset('assets/images/Behance.png', width: 20, height: 20),

                  ],
                ),
                  const SizedBox(height: 20),

                  //Bottom Pattern
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                    child: Image.asset(
                      'assets/images/bk.png',
                      fit: BoxFit.cover,
                      height: 40,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
