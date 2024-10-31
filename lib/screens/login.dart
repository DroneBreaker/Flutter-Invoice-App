import 'package:flutter/material.dart';
import 'package:invoicify/widgets/app_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selected = 'Select User Type';
  final _formKey = GlobalKey<FormState>();

  // Controllers for different form fields
  final TextEditingController businessTINController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController educationController = TextEditingController();

  final List<String> dropdownOptions = [
    'Select User Type',
    'Taxpayer',
    'Authority',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 28, 151, 196),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 110.0, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 38),
                  const AppText(
                    title: "Droners Invoicify",
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  const AppText(
                    title: "Please sign-in to your account",
                    fontSize: 18,
                  ),
                  const SizedBox(height: 25),
                  DropdownButtonFormField<String>(
                    value: selected,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'User Type',
                    ),
                    items: dropdownOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selected = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildDynamicFields(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle form submission
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Processing Login...'),
                            ),
                          );
                          // Add your login logic here
                        }
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDynamicFields() {
    switch (selected) {
      case 'Select User Type':
        return const SizedBox();
      case 'Taxpayer':
        return Column(
          children: [
            // business TIN for TP
            TextFormField(
              controller: businessTINController,
              decoration: InputDecoration(
                labelText: 'Business TIN',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your TIN';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            // Username section for TP
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            // Password section for TP
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        );

      case 'Authority':
        return Column(
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }

  @override
  void dispose() {
    businessTINController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    companyController.dispose();
    roleController.dispose();
    educationController.dispose();
    super.dispose();
  }
}
