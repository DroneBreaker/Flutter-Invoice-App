import 'package:flutter/material.dart';
import 'package:invoicify/screens/taxpayer.dart';
import 'package:invoicify/widgets/app_text.dart';
import 'package:invoicify/widgets/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController businessTINController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String selected = "Select User Type";
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
              padding: const EdgeInsets.only(top: 80, left: 20.0, right: 20),
              child: Form(
                child: Column(
                  children: [
                    const SizedBox(height: 38),
                    const AppText(
                      title: "Droners Invoicify",
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      colors: Colors.white,
                    ),
                    const AppText(
                      title: "Please register your account",
                      fontSize: 17,
                      colors: Colors.white,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      child: TextFormField(
                        controller: firstNameController,
                        // onChanged: (value) => setState(() => firstNameController = value),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            // labelStyle: const TextStyle(color: Colors.white),
                            labelText: 'First Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // Last name text field
                    Form(
                      child: TextFormField(
                        controller: lastNameController,
                        // onChanged: (value) => setState(() => firstNameController = value),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            // labelStyle: const TextStyle(color: Colors.white),
                            labelText: 'Last Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Business TIN text field
                    Form(
                      child: TextFormField(
                        controller: businessTINController,
                        // onChanged: (value) => setState(() => firstNameController = value),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            // labelStyle: const TextStyle(color: Colors.white),
                            labelText: 'Business TIN',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Username controller
                    Form(
                      child: TextFormField(
                        controller: usernameController,
                        // onChanged: (value) => setState(() => firstNameController = value),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            // labelStyle: const TextStyle(color: Colors.white),
                            labelText: 'Username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Password controller
                    Form(
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        // onChanged: (value) => setState(() => firstNameController = value),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            // labelStyle: const TextStyle(color: Colors.white),
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Confirm password controller
                    Form(
                      child: TextFormField(
                        obscureText: true,
                        controller: confirmPasswordController,
                        // onChanged: (value) => setState(() => firstNameController = value),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            // labelStyle: const TextStyle(color: Colors.white),
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Button(
                      buttonText: "Register",
                      // size: const Size(160, 55),
                      colors: Colors.blueGrey,
                      fontSize: 20,
                      onTap: () => {
                        // TODO: Implement registration logic here
                        handleRegister()
                      },
                      // setState(() {});
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

  @override
  void dispose() {
    businessTINController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleRegister() {
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
