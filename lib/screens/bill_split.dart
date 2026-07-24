import 'package:flutter/material.dart';

class BillSplit extends StatefulWidget {
  const BillSplit({super.key});

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  final TextEditingController billController = TextEditingController();
  final TextEditingController peopleController = TextEditingController();

  String result = "";

  void calculateSplit() {
    double? bill = double.tryParse(billController.text);
    int? people = int.tryParse(peopleController.text);

    if (bill == null || people == null) {
      setState(() {
        result = "Please enter valid values";
      });
      return;
    }

    if (people <= 0) {
      setState(() {
        result = "Number of people must be greater than 0";
      });
      return;
    }

    double splitAmount = bill / people;

    setState(() {
      result = "Each Person Pays ₹${splitAmount.toStringAsFixed(2)}";
    });
  }

  void clearFields() {
    billController.clear();
    peopleController.clear();

    setState(() {
      result = "";
    });
  }

  @override
  void dispose() {
    billController.dispose();
    peopleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bill Split Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: billController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Total Bill Amount",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: peopleController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Number of People",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculateSplit,
              child: const Text("Calculate"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: clearFields,
              child: const Text("Clear"),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  result,
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