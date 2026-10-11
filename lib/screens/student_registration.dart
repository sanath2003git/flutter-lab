import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({super.key});

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String? selectedCourse;
  String? selectedGender;

  final List<String> courses = [
    'MCA',
    'BCA',
    'B.Tech',
    'M.Tech',
    'MBA',
  ];

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      if (selectedGender == null) {
        setState(() {}); // trigger UI update to show gender error
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white, size: 20),
              SizedBox(width: 10),
              Text('Student registered successfully!'),
            ],
          ),
          backgroundColor: AppTheme.successGreen,
        ),
      );

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 40,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Registration Successful',
                    style: Theme.of(context).textTheme.headlineSmall,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          content: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.surfaceBg,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.borderColor),
            ),
            child: Text(
              'Name: ${nameController.text}\n'
              'Roll Number: ${rollController.text}\n'
              'Email: ${emailController.text}\n'
              'Phone: ${phoneController.text}\n'
              'Course: $selectedCourse\n'
              'Gender: $selectedGender',
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void clearForm() {
    _formKey.currentState?.reset();

    nameController.clear();
    rollController.clear();
    emailController.clear();
    phoneController.clear();

    setState(() {
      selectedCourse = null;
      selectedGender = null;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    rollController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Registration'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Form Header
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.accentBlue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.school_outlined,
                            size: 40,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Student Registration Form',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Please fill in all candidate details accurately',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.5,
                          color: AppTheme.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Student Name
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Student Name',
                          hintText: 'e.g. Sanath Sreekumar',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter student name';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Roll Number
                      TextFormField(
                        controller: rollController,
                        decoration: const InputDecoration(
                          labelText: 'Roll Number',
                          hintText: 'e.g. 23MCA101',
                          prefixIcon: Icon(Icons.badge_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter roll number';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Email
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                          hintText: 'e.g. student@college.edu',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter email address';
                          }

                          if (!RegExp(
                            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                          ).hasMatch(value.trim())) {
                            return 'Please enter a valid email';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Phone Number
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          hintText: '10-digit mobile number',
                          prefixIcon: Icon(Icons.phone_outlined),
                          counterText: '',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter phone number';
                          }

                          if (!RegExp(r'^[0-9]{10}$').hasMatch(value.trim())) {
                            return 'Enter a valid 10-digit number';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Course Dropdown
                      DropdownButtonFormField<String>(
                        initialValue: selectedCourse,
                        decoration: const InputDecoration(
                          labelText: 'Select Course',
                          prefixIcon: Icon(Icons.menu_book_outlined),
                        ),
                        items: courses.map((course) {
                          return DropdownMenuItem(
                            value: course,
                            child: Text(course),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCourse = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a course';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // Gender Section
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selectedGender == null && _formKey.currentState?.validate() == false
                                ? AppTheme.errorRed
                                : AppTheme.borderColor,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.people_outline, size: 18, color: AppTheme.primaryBlue),
                                SizedBox(width: 8),
                                Text(
                                  'Gender Selection',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            RadioGroup<String>(
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _buildGenderOption('Male'),
                                  ),
                                  Expanded(
                                    child: _buildGenderOption('Female'),
                                  ),
                                  Expanded(
                                    child: _buildGenderOption('Other'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      if (selectedGender == null)
                        const Padding(
                          padding: EdgeInsets.only(left: 8, top: 6),
                          child: Text(
                            'Please select gender',
                            style: TextStyle(
                              color: AppTheme.errorRed,
                              fontSize: 12,
                            ),
                          ),
                        ),

                      const SizedBox(height: 24),

                      // Submit Button
                      ElevatedButton.icon(
                        onPressed: submitForm,
                        icon: const Icon(Icons.check_circle_outline, size: 20),
                        label: const Text('Register Student'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Clear Button
                      OutlinedButton.icon(
                        onPressed: clearForm,
                        icon: const Icon(Icons.refresh, size: 18),
                        label: const Text('Clear Form'),
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
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderOption(String label) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        setState(() {
          selectedGender = label;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<String>(
            value: label,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: AppTheme.primaryBlue,
          ),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}