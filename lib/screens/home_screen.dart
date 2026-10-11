import 'package:flutter/material.dart';

import 'calculator.dart';
import 'bill_split.dart';
import 'password_generator.dart';
import 'cows_bulls.dart';
import 'product_list.dart';
import 'profile_animation.dart';
import 'student_registration.dart';
import 'instagram_profile.dart';
import 'firestore_student.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Lab"),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            children: [
              // Dashboard Header Card
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                padding: const EdgeInsets.all(20),
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
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.school_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "MCA Semester 3",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Flutter Lab Experiments",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // CO1 Section
              _buildSectionHeader(
                badge: "CO1",
                title: "Basics & Fundamentals",
                icon: Icons.code,
              ),
              const SizedBox(height: 10),
              _buildMenuTile(
                context,
                title: "Simple Calculator",
                subtitle: "Addition, Subtraction, Multiplication & Division",
                icon: Icons.calculate_outlined,
                screen: const Calculator(),
                tag: "Exp 1",
              ),

              const SizedBox(height: 24),

              // CO2 Section
              _buildSectionHeader(
                badge: "CO2",
                title: "Dart Programming & Logic",
                icon: Icons.psychology_outlined,
              ),
              const SizedBox(height: 10),
              _buildMenuTile(
                context,
                title: "Bill Split Calculator",
                subtitle: "Calculate amount per person with tip/split logic",
                icon: Icons.receipt_long_outlined,
                screen: const BillSplit(),
                tag: "Exp 2",
              ),
              _buildMenuTile(
                context,
                title: "Password Generator",
                subtitle: "Generate randomized secure passwords",
                icon: Icons.password_outlined,
                screen: const PasswordGenerator(),
                tag: "Exp 3",
              ),
              _buildMenuTile(
                context,
                title: "Cows & Bulls Game",
                subtitle: "Guess the hidden 4-digit number",
                icon: Icons.sports_esports_outlined,
                screen: const CowsBulls(),
                tag: "Exp 4",
              ),

              const SizedBox(height: 24),

              // CO3 & CO4 Section
              _buildSectionHeader(
                badge: "CO3 & CO4",
                title: "UI Design, Animations & Forms",
                icon: Icons.palette_outlined,
              ),
              const SizedBox(height: 10),
              _buildMenuTile(
                context,
                title: "Product List",
                subtitle: "Catalog view, product cards, and cart interaction",
                icon: Icons.shopping_bag_outlined,
                screen: const ProductList(),
                tag: "Exp 5",
              ),
              _buildMenuTile(
                context,
                title: "Animated Profile",
                subtitle: "Interactive animation, details reveal & follow toggle",
                icon: Icons.account_circle_outlined,
                screen: const ProfileAnimation(),
                tag: "Exp 6",
              ),
              _buildMenuTile(
                context,
                title: "Student Registration",
                subtitle: "Form validation, radio fields & dropdown selection",
                icon: Icons.how_to_reg_outlined,
                screen: const StudentRegistration(),
                tag: "Exp 7",
              ),
              _buildMenuTile(
                context,
                title: "Instagram Profile",
                subtitle: "Real-world profile clone with statistics & grid",
                icon: Icons.photo_library_outlined,
                screen: const InstagramProfile(),
                tag: "Exp 8",
              ),

              const SizedBox(height: 24),

              // CO5 Section
              _buildSectionHeader(
                badge: "CO5 - Database",
                title: "Cloud Firestore Integration",
                icon: Icons.cloud_done_outlined,
              ),
              const SizedBox(height: 10),
              _buildMenuTile(
                context,
                title: "Firestore Student",
                subtitle: "Store student records directly into Firebase collection",
                icon: Icons.cloud_upload_outlined,
                screen: const FirestoreStudent(),
                tag: "Exp 9",
              ),

              const SizedBox(height: 32),

              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppTheme.primaryLight,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "MCA Mobile Application Development Lab",
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String badge,
    required String title,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.accentBlue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.primaryLight.withValues(alpha: 0.3)),
            ),
            child: Text(
              badge,
              style: const TextStyle(
                color: AppTheme.primaryDark,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary,
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
    required String tag,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.accentBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 24,
                  color: AppTheme.primaryBlue,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12.5,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFFB0B7C3),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}