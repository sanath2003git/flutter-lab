import 'dart:math';
import 'package:flutter/material.dart';

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({super.key});

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  final String chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*()_+';

  String password = "";

  void generatePassword() {
    Random random = Random();

    String newPassword = "";

    for (int i = 0; i < 12; i++) {
      newPassword += chars[random.nextInt(chars.length)];
    }

    setState(() {
      password = newPassword;
    });
  }

  void clearPassword() {
    setState(() {
      password = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password Generator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: generatePassword,
              child: const Text("Generate Password"),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: clearPassword,
              child: const Text("Clear"),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SelectableText(
                  password.isEmpty
                      ? "Generated password will appear here"
                      : password,
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