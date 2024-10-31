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
        body: Center(
          child: AppText(
            title: "Welcome to taxpayer page",
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
