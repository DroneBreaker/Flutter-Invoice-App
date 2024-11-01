import 'package:flutter/material.dart';
import 'package:invoicify/widgets/app_text.dart';

class TaxpayerPage extends StatefulWidget {
  const TaxpayerPage({super.key});

  @override
  State<TaxpayerPage> createState() => _TaxpayerPageState();
}

class _TaxpayerPageState extends State<TaxpayerPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 28, 151, 196),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 380.0),
              child: Center(
                child: AppText(
                  title: "Welcome to taxpayer page",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: AppText(
                title: "We goin' for a short commercial brea k....",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
