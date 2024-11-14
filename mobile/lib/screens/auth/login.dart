import 'package:flutter/material.dart';
import 'package:invoicify/screens/taxpayer.dart';
import 'package:invoicify/widgets/app_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selected = 'Select User Type';
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  // Controllers for different form fields
  final TextEditingController businessTINController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(163, 201, 226, 1.5),
              Color.fromRGBO(150, 24, 247, 0.5),
              Color.fromRGBO(246, 239, 167, 0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: SingleChildScrollView(
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

                    // Dropdown field
                    DropdownButtonFormField<String>(
                      value: selected,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
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
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black54,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle form submission
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Login been processed...'),
                              ),
                            );
                            // Add your login logic here
                            if (_formKey.currentState!.validate()) {
                              _handleLogin();
                            }
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
            Form(
              child: TextFormField(
                controller: businessTINController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
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
            ),
            const SizedBox(height: 15),

            // Username section for TP
            Form(
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
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
            ),
            const SizedBox(height: 15),

            // Password section for TP
            Form(
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(_isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        );

      case 'Authority':
        return Column(
          children: [
            Form(
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
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
            ),
            const SizedBox(height: 15),

            // Passwowrd section for Authority
            Form(
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
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
    super.dispose();
  }

  void _showPasswordToggle() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  // Login functionality
  void _handleLogin() {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Remove loading indicator

      // Here you would typically make your actual API call
      // For now, we'll just show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Successful!'),
          backgroundColor: Colors.green,
        ),
      );

      // Add your navigation logic here
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TaxpayerPage()),
      );
    });
  }
}
