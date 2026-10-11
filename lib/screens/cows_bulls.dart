import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

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
  int? lastCows;
  int? lastBulls;
  bool isSolved = false;

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
    String guess = guessController.text.trim();

    if (guess.length != 4 || int.tryParse(guess) == null) {
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

    setState(() {
      lastCows = cows;
      lastBulls = bulls;
    });

    if (guess == secretNumber) {
      setState(() {
        isSolved = true;
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
    lastCows = null;
    lastBulls = null;
    isSolved = false;
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Game Score & Stats Card
                Card(
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isSolved
                            ? [const Color(0xFF0D9488), const Color(0xFF10B981)]
                            : [AppTheme.primaryDark, AppTheme.primaryBlue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: (isSolved ? Colors.green : AppTheme.primaryBlue)
                              .withValues(alpha: 0.25),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Attempts: $attempts",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "4-Digit Code",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Score metrics indicators
                        if (lastCows != null && lastBulls != null && !isSolved) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildMetricBadge(
                                label: "Cows (Exact)",
                                count: "$lastCows",
                                icon: Icons.check_circle_outline,
                              ),
                              _buildMetricBadge(
                                label: "Bulls (Misplaced)",
                                count: "$lastBulls",
                                icon: Icons.help_outline,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                        ],

                        Text(
                          message.isEmpty ? "Enter your 4-digit guess below!" : message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isSolved ? 20 : 16,
                            fontWeight: isSolved ? FontWeight.bold : FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Rules Helper Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.lightbulb_outline, size: 20, color: AppTheme.primaryBlue),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Cow = correct digit & position. Bull = correct digit, wrong position.",
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Controls Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          controller: guessController,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 8,
                          ),
                          decoration: const InputDecoration(
                            labelText: "Enter 4-digit Number",
                            counterText: "",
                            prefixIcon: Icon(Icons.dialpad),
                          ),
                        ),

                        const SizedBox(height: 18),

                        ElevatedButton.icon(
                          onPressed: checkGuess,
                          icon: const Icon(Icons.done_all),
                          label: const Text("Check Guess"),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),

                        const SizedBox(height: 10),

                        OutlinedButton.icon(
                          onPressed: newGame,
                          icon: const Icon(Icons.replay),
                          label: const Text("New Game"),
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

  Widget _buildMetricBadge({
    required String label,
    required String count,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            "$label: $count",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}