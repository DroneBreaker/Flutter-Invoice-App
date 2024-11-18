import 'package:flutter/material.dart';
import 'package:invoicify/screens/auth/login.dart';
import 'package:invoicify/screens/auth/register.dart';
import 'package:invoicify/widgets/app_text.dart';
import 'package:invoicify/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color.fromARGB(255, 28, 151, 196),
        body: Container(
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
          child: Column(
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
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Button(
                        buttonText: "Click to Login",
                        // size: const Size(160, 55),
                        fontSize: 18,
                        colors: Colors.blueGrey,
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              ),
                            }),
                    Button(
                        buttonText: "Click to Register",
                        // size: const Size(160, 55),
                        fontSize: 18,
                        colors: Colors.blueGrey,
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              ),
                            }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
