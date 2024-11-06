import 'package:flutter/material.dart';
import 'package:invoicify/screens/auth/register.dart';
import 'package:invoicify/screens/home.dart';
import 'package:invoicify/screens/auth/login.dart';
import 'package:invoicify/screens/taxpayer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/taxpayer': (context) => const TaxpayerPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
