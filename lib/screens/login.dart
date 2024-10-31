import 'package:flutter/material.dart';
import 'package:invoicify/widgets/app_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 38.0, left: 20, right: 20),
              child: AppText(
                title: "Ghana Revenue Authority E-VAT",
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const AppText(
              title: "Please sign-in to your account",
              fontSize: 18,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: TextFormField(
                onChanged: (value) {
                  // setState(() {
                  //   _username = value;
                  // });
                },
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextFormField(
              onChanged: (value) {
                // setState(() {
                //   _password = value;
                // });
              },
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     if (_username.isEmpty || _password.isEmpty) {
            //       showDialog(
            //         context: context,
            //         child: AlertDialog(
            //           title: Text('Error'),
            //           content: Text('Please enter both username and password.'),
            //         ),
            //       );
            //     } else {
            // Simulate login success
            // setState(() {
            //   _username = '';
            //   _password = '';
            // });
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder:

            // }}
          ],
        ),
      ),
    );
  }
}
