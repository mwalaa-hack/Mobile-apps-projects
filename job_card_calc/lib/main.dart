import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

/*
To save the input data i will use controllers it should be used in the text fields stateful widget

 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //creating controllers to read inputs
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController jobDescriptionController = TextEditingController();

  @override
  void dispose() {
    //dispose frees the memory used by your controllers in text fields.
    nameController.dispose();
    emailController.dispose();
    jobTitleController.dispose();
    jobDescriptionController.dispose();
    super.dispose(); //a must to clean parent class memory too
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //imp error fix: wrap the home in a Builder so the inner
      //context is under the materialapp so it can have a navigator
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.black, //Black outer background
            body: Center(
              child: Container(
                width: 500, //Width of the white register area
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
                      "Register",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 20),

                    //Name
                    TextField(
                      controller: nameController, //connect controller
                      style: const TextStyle(
                        fontFamily: 'Poppins', //text input
                      ),
                      decoration: const InputDecoration( //subtitle
                        labelText: "Name",
                        labelStyle: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 10),

                    //Email
                    TextField(
                      controller: emailController, //connect controller
                      style: const TextStyle(
                        fontFamily: 'Poppins', //text input
                      ),
                      decoration: const InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontFamily: 'Roboto', //subtitle
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 10),

                    //job title
                    TextField(
                      controller: jobTitleController, //connect controller
                      style: const TextStyle(
                        fontFamily: 'Poppins', //text input
                      ),
                      decoration: const InputDecoration(
                        labelText: "Job Title",
                        labelStyle: TextStyle(
                          fontFamily: 'Roboto', //subtitle
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 10),

                    //job description
                    TextField(
                      controller: jobDescriptionController, //connect controller
                      style: const TextStyle(
                        fontFamily: 'Poppins', //text input
                      ),
                      decoration: const InputDecoration(
                        labelText: "Job Description",
                        labelStyle: TextStyle(
                          fontFamily: 'Roboto', //subtitle
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 10),

                    //register button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {
                          //print for debugging only
                          debugPrint('Name: ${nameController.text}');
                          debugPrint('Email: ${emailController.text}');
                          debugPrint('Job Title: ${jobTitleController.text}');
                          debugPrint('Job Description: ${jobDescriptionController.text}');

                          //to navigate to the card screen with the data from text fields
                          Navigator.push(
                            context, //context have a Navigator
                            MaterialPageRoute(
                              builder: (context) => ProfileCard(
                                name: nameController.text,
                                email: emailController.text,
                                jobTitle: jobTitleController.text,
                                jobDescription: jobDescriptionController.text,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Register",
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
          );
        },
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////
//Card screen
class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String jobTitle;
  final String jobDescription;

  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.jobTitle,
    required this.jobDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCDE7D),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Card container
              Container(
                width: 300,
                //height: 400,
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
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/bmprof.jpg'),
                    ),

                    const SizedBox(height: 15),

                    //Name
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1.5),
                      ),
                      child: Text(
                        name.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cinzel',
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    //email
                    Text(
                      email.toLowerCase(),
                      style: const TextStyle(
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
                    Text(
                      '- $jobTitle -',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                    ),

                    const SizedBox(height: 15),

                    //Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        jobDescription,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
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

                    //Icons Row
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

                    //Bottom pattern
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

              const SizedBox(height: 20),

              //navigate to Calculator button
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 30, 55),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    debugPrint('Navigate to Calculator');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalculatorApp(),
                      ),
                    );
                  },
                  child: const Text(
                    "Calculator",
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
    );
  }
}






//////////////////////////////////////////////////////////////////
///calculator
class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String operation = '';
  String result = '0';

void onButtonPressed(String value) {
  setState(() {
    if (value == 'C') {
      operation = '';
      result = '0';
    } else if (value == '⌫') { //backspace (delete) button == \u232B
      if (operation.isNotEmpty) {
        operation = operation.substring(0, operation.length - 1);
      }
    } else if (value == '=') {
      try {
        String finalOperation = operation.replaceAll('×', '*').replaceAll('÷', '/');
        final parser = ShuntingYardParser();
        final exp = parser.parse(finalOperation);

        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        result = eval.toString();
      } catch (e) {
        result = 'Error';
      }
    } else {
      operation += value;
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      operation,
                      style: const TextStyle(fontSize: 30, color: Colors.blueGrey),
                    ),
                    Text(
                      result,
                      style: const TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  buildButton('C', color: Colors.red, textColor: Colors.white),
                  buildButton('⌫', color: Colors.lightBlue, textColor: Colors.white),
                  buildButton('%'),
                  buildButton('÷'),
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('×'),
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('-'),
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('+'),
                  buildButton('0'),
                  buildButton('.'),
                  buildButton('=', color: Colors.green, textColor: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(
    String text, 
    {int size = 1,
    Color? color, Color? textColor}) {
    return Expanded(
      flex: size,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Material(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => onButtonPressed(text),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 28,
                  color: textColor ?? Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
