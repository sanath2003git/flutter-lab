import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();

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
  void dispose() {
    num1.dispose();
    num2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "First Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Second Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => calculate("+"),
                  child: const Text("Add"),
                ),
                ElevatedButton(
                  onPressed: () => calculate("-"),
                  child: const Text("Subtract"),
                ),
                ElevatedButton(
                  onPressed: () => calculate("*"),
                  child: const Text("Multiply"),
                ),
                ElevatedButton(
                  onPressed: () => calculate("/"),
                  child: const Text("Divide"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: clear,
              child: const Text("Clear"),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Result: $result",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}