import 'package:flutter/material.dart';
import 'package:invoicify/widgets/app_text.dart';
import 'package:invoicify/widgets/button.dart';

class TaxpayerPage extends StatefulWidget {
  const TaxpayerPage({super.key});

  @override
  State<TaxpayerPage> createState() => _TaxpayerPageState();
}

class _TaxpayerPageState extends State<TaxpayerPage> {
  // Controllers for different form fields
  final TextEditingController vendorTINController = TextEditingController();
  final TextEditingController invoiceNumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 28, 151, 196),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  title: "Enter details to issue an invoice",
                  fontSize: 25,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const AppText(
                  title: "Please select document type",
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
                const SizedBox(
                  height: 15,
                ),
                Form(
                  child: TextFormField(
                    controller: vendorTINController,
                    decoration: InputDecoration(
                        labelText: 'Vendor TIN',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  child: TextFormField(
                    controller: invoiceNumberController,
                    decoration: InputDecoration(
                        labelText: 'Invoice Number',
                        focusColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Total Amount',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Button(
                    buttonText: 'Submit Invoice',
                    onTap: () => {},
                    size: const Size(160, 55),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
