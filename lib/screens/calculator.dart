import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();

  String result = "";
  String? activeOp;

  void calculate(String op) {
    setState(() {
      activeOp = op;
    });

    double? a = double.tryParse(num1.text.trim());
    double? b = double.tryParse(num2.text.trim());

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
      // If it's an integer, display cleanly without extra zeros
      if (ans == ans.roundToDouble()) {
        result = ans.toInt().toString();
      } else {
        result = ans.toString();
      }
    });
  }

  void clear() {
    num1.clear();
    num2.clear();

    setState(() {
      result = "";
      activeOp = null;
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Display / Result Card
                Card(
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.accentBlue.withValues(alpha: 0.6),
                          Colors.white,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.calculate_outlined,
                                  color: AppTheme.primaryBlue,
                                  size: 18,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "OUTPUT",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.primaryDark,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ],
                            ),
                            if (activeOp != null)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryBlue,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "Op: $activeOp",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        SelectableText(
                          result.isEmpty ? "0" : result,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: result.contains("Please") || result.contains("Cannot")
                                ? AppTheme.errorRed
                                : AppTheme.textPrimary,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Input Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter Operands",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: num1,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: const InputDecoration(
                            labelText: "First Number",
                            hintText: "e.g. 24",
                            prefixIcon: Icon(Icons.pin_outlined),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: num2,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: const InputDecoration(
                            labelText: "Second Number",
                            hintText: "e.g. 8",
                            prefixIcon: Icon(Icons.pin_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Operation buttons
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Operations",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textSecondary,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildOperationButton(
                                label: "Add (+)",
                                op: "+",
                                icon: Icons.add,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildOperationButton(
                                label: "Subtract (-)",
                                op: "-",
                                icon: Icons.remove,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: _buildOperationButton(
                                label: "Multiply (×)",
                                op: "*",
                                icon: Icons.close,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildOperationButton(
                                label: "Divide (÷)",
                                op: "/",
                                icon: Icons.safety_divider,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        OutlinedButton.icon(
                          onPressed: clear,
                          icon: const Icon(Icons.refresh, size: 18),
                          label: const Text("Clear Fields"),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.textSecondary,
                            side: BorderSide(color: Colors.grey.shade300),
                            padding: const EdgeInsets.symmetric(vertical: 13),
                          ),
                        ),
                      ],
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

  Widget _buildOperationButton({
    required String label,
    required String op,
    required IconData icon,
  }) {
    final isCurrent = activeOp == op;
    return ElevatedButton.icon(
      onPressed: () => calculate(op),
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isCurrent ? AppTheme.primaryDark : AppTheme.primaryBlue,
        padding: const EdgeInsets.symmetric(vertical: 13),
        textStyle: const TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}