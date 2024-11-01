import 'package:flutter/material.dart';
import 'package:invoicify/screens/login.dart';
import 'package:invoicify/widgets/app_text.dart';
import 'package:invoicify/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 28, 151, 196),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 320.0, left: 90, right: 90),
              child: SizedBox(
                height: 55,
                child: AppText(
                  title: "EVAT SUITE",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: SizedBox(
                height: 70,
                child: AppText(
                  title:
                      "E-VAT Suite enhances efficiency and compliance with VAT regulations, making VAT transactions easier and more efficient for businesses.",
                  fontSize: 17,
                  colors: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
                buttonText: "Click to Login",
                fontSize: 18,
                colors: Colors.white,
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      ),
                    })
          ],
        ),
      ),
    );
  }
}
