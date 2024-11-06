import 'package:flutter/material.dart';
import 'package:invoicify/widgets/app_text.dart';
import 'package:invoicify/widgets/button.dart';

class TaxpayerPage extends StatefulWidget {
  const TaxpayerPage({super.key});

  @override
  State<TaxpayerPage> createState() => _TaxpayerPageState();
}

class _TaxpayerPageState extends State<TaxpayerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 28, 151, 196),
        body: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                title: "Please select invoice type",
                fontSize: 18,
              ),
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: [
                  Button(buttonText: "Invoice", onTap: () => {}),
                  Button(buttonText: "Purchase", onTap: () => {}),
                  Button(buttonText: "Refund", onTap: () => {}),
                  Button(buttonText: "Credit Note", onTap: () => {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
