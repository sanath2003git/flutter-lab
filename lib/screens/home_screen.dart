import 'package:flutter/material.dart';

import 'calculator.dart';
import 'bill_split.dart';
import 'password_generator.dart';
import 'cows_bulls.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Lab"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "CO1",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          _buildMenuTile(
            context,
            title: "Simple Calculator",
            subtitle: "Addition, Subtraction, Multiplication & Division",
            icon: Icons.calculate,
            screen: const Calculator(),
          ),

          const SizedBox(height: 25),

          const Text(
            "CO2",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          _buildMenuTile(
            context,
            title: "Bill Split Calculator",
            subtitle: "Calculate amount per person",
            icon: Icons.receipt_long,
            screen: const BillSplit(),
          ),

          _buildMenuTile(
            context,
            title: "Password Generator",
            subtitle: "Generate secure random passwords",
            icon: Icons.lock,
            screen: const PasswordGenerator(),
          ),

          _buildMenuTile(
            context,
            title: "Cows & Bulls Game",
            subtitle: "Guess the 4-digit number",
            icon: Icons.sports_esports,
            screen: const CowsBulls(),
          ),

          const SizedBox(height: 30),

          const Center(
            child: Text(
              "More experiments will be added here...",
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget screen,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          icon,
          size: 32,
          color: Colors.blue,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ),
          );
        },
      ),
    );
  }
}