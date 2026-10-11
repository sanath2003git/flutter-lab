import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BillSplit extends StatefulWidget {
  const BillSplit({super.key});

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  final TextEditingController billController = TextEditingController();
  final TextEditingController peopleController = TextEditingController();

  String result = "";
  double? perPersonAmount;
  String? errorMessage;

  void calculateSplit() {
    setState(() {
      errorMessage = null;
    });

    double? bill = double.tryParse(billController.text.trim());
    int? people = int.tryParse(peopleController.text.trim());

    if (bill == null || people == null) {
      setState(() {
        errorMessage = "Please enter valid values";
        result = "Please enter valid values";
        perPersonAmount = null;
      });
      return;
    }

    if (people <= 0) {
      setState(() {
        errorMessage = "Number of people must be greater than 0";
        result = "Number of people must be greater than 0";
        perPersonAmount = null;
      });
      return;
    }

    double splitAmount = bill / people;

    setState(() {
      perPersonAmount = splitAmount;
      result = "Each Person Pays ₹${splitAmount.toStringAsFixed(2)}";
      errorMessage = null;
    });
  }

  void clearFields() {
    billController.clear();
    peopleController.clear();

    setState(() {
      result = "";
      perPersonAmount = null;
      errorMessage = null;
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Result Hero Card
                Card(
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppTheme.primaryDark, AppTheme.primaryBlue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryBlue.withValues(alpha: 0.25),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.payments_outlined, color: Colors.white70, size: 20),
                            SizedBox(width: 8),
                            Text(
                              "SPLIT BREAKDOWN",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        if (perPersonAmount != null) ...[
                          const Text(
                            "Each Person Pays",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "₹${perPersonAmount!.toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ] else if (errorMessage != null) ...[
                          Text(
                            errorMessage!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFFFFCDD2),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ] else ...[
                          const Text(
                            "₹0.00",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Enter the bill total & group count below",
                            style: TextStyle(color: Colors.white60, fontSize: 13),
                          ),
                        ],
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
                          "Bill Details",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: billController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: const InputDecoration(
                            labelText: "Total Bill Amount",
                            hintText: "e.g. 1500.00",
                            prefixIcon: Icon(Icons.currency_rupee),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: peopleController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Number of People",
                            hintText: "e.g. 4",
                            prefixIcon: Icon(Icons.groups_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Actions Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton.icon(
                          onPressed: calculateSplit,
                          icon: const Icon(Icons.calculate_outlined),
                          label: const Text("Calculate Split"),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                        const SizedBox(height: 10),
                        OutlinedButton.icon(
                          onPressed: clearFields,
                          icon: const Icon(Icons.refresh, size: 18),
                          label: const Text("Clear Fields"),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.textSecondary,
                            side: BorderSide(color: Colors.grey.shade300),
                            padding: const EdgeInsets.symmetric(vertical: 12),
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
}