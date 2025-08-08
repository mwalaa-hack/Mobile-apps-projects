import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(const CalculatorApp());

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
