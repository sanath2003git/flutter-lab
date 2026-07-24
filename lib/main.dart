import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  String result = "";

  void calculate(String op) {
  double? a = double.tryParse(num1.text);
  double? b = double.tryParse(num2.text);

  if (a == null || b == null) {
    setState(() {
      result = "Please enter valid numbers";
    });
    return;
  }

  double ans = 0;

  switch (op) {
    case "+":
      ans = a + b;
      break;
    case "-":
      ans = a - b;
      break;
    case "*":
      ans = a * b;
      break;
    case "/":
      if (b == 0) {
        setState(() {
          result = "Cannot divide by zero";
        });
        return;
      }
      ans = a / b;
      break;
  }

  setState(() {
    result = ans.toString();
  });
}

  void clear() {
    num1.clear();
    num2.clear();

    setState(() {
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "First Number",
              ),
            ),

            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Second Number",
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                    onPressed: () => calculate("+"),
                    child: const Text("+")),

                ElevatedButton(
                    onPressed: () => calculate("-"),
                    child: const Text("-")),

                ElevatedButton(
                    onPressed: () => calculate("*"),
                    child: const Text("*")),

                ElevatedButton(
                    onPressed: () => calculate("/"),
                    child: const Text("/")),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: clear,
              child: const Text("Clear"),
            ),

            const SizedBox(height: 20),

            Text(
              "Result : $result",
              style: const TextStyle(
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}