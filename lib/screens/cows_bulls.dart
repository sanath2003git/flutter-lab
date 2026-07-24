import 'dart:math';
import 'package:flutter/material.dart';

class CowsBulls extends StatefulWidget {
  const CowsBulls({super.key});

  @override
  State<CowsBulls> createState() => _CowsBullsState();
}

class _CowsBullsState extends State<CowsBulls> {
  final TextEditingController guessController = TextEditingController();

  late String secretNumber;

  String message = "";
  int attempts = 0;

  @override
  void initState() {
    super.initState();
    generateSecret();
  }

  void generateSecret() {
    Random random = Random();
    secretNumber = (1000 + random.nextInt(9000)).toString();
  }

  void checkGuess() {
    String guess = guessController.text;

    if (guess.length != 4) {
      setState(() {
        message = "Enter a 4-digit number";
      });
      return;
    }

    attempts++;

    int cows = 0;
    int bulls = 0;

    for (int i = 0; i < 4; i++) {
      if (guess[i] == secretNumber[i]) {
        cows++;
      } else if (secretNumber.contains(guess[i])) {
        bulls++;
      }
    }

    if (guess == secretNumber) {
      setState(() {
        message =
            "🎉 Correct!\nSecret Number: $secretNumber\nAttempts: $attempts";
      });
    } else {
      setState(() {
        message =
            "Cows: $cows   Bulls: $bulls\nAttempts: $attempts";
      });
    }
  }

  void newGame() {
    guessController.clear();
    attempts = 0;
    generateSecret();

    setState(() {
      message = "New Game Started!";
    });
  }

  @override
  void dispose() {
    guessController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cows & Bulls"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: guessController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter 4-digit Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: checkGuess,
              child: const Text("Check Guess"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: newGame,
              child: const Text("New Game"),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
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