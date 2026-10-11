import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileAnimation extends StatefulWidget {
  const ProfileAnimation({super.key});

  @override
  State<ProfileAnimation> createState() => _ProfileAnimationState();
}

class _ProfileAnimationState extends State<ProfileAnimation> {
  bool isExpanded = false;
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Animated Profile Image with glow & ring
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        width: isExpanded ? 190 : 130,
                        height: isExpanded ? 190 : 130,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isExpanded ? AppTheme.successGreen : AppTheme.primaryBlue,
                            width: isExpanded ? 4 : 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (isExpanded ? AppTheme.successGreen : AppTheme.primaryBlue)
                                  .withValues(alpha: 0.25),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppTheme.accentBlue,
                                child: const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: AppTheme.primaryBlue,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Sanath Sreekumar",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                        letterSpacing: -0.2,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.accentBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Flutter Developer",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.primaryDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Additional Details with smooth expand animation
                    AnimatedSize(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      child: isExpanded
                          ? Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: AppTheme.surfaceBg,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: AppTheme.borderColor),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    leading: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: AppTheme.accentBlue,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.email_outlined,
                                        color: AppTheme.primaryBlue,
                                        size: 18,
                                      ),
                                    ),
                                    title: const Text(
                                      "Email Address",
                                      style: TextStyle(fontSize: 11, color: AppTheme.textSecondary),
                                    ),
                                    subtitle: const Text(
                                      "sanathsreekumar@gmail.com",
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.textPrimary,
                                      ),
                                    ),
                                  ),
                                  const Divider(height: 1, indent: 16, endIndent: 16),
                                  ListTile(
                                    dense: true,
                                    leading: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD1FAE5),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.phone_outlined,
                                        color: AppTheme.successGreen,
                                        size: 18,
                                      ),
                                    ),
                                    title: const Text(
                                      "Phone Number",
                                      style: TextStyle(fontSize: 11, color: AppTheme.textSecondary),
                                    ),
                                    subtitle: const Text(
                                      "+91 98765 43210",
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.textPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(width: double.infinity),
                    ),

                    const SizedBox(height: 16),

                    // Animated Follow Button
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: isFollowing ? 160 : 140,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            isFollowing = !isFollowing;
                          });
                        },
                        icon: Icon(
                          isFollowing ? Icons.check_circle_outline : Icons.person_add_outlined,
                          size: 18,
                        ),
                        label: Text(
                          isFollowing ? "Following" : "Follow",
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isFollowing ? AppTheme.successGreen : AppTheme.primaryBlue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.touch_app_outlined,
                          size: 14,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isExpanded
                              ? "Tap image to collapse details"
                              : "Tap the profile image to expand",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}