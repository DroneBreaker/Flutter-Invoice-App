import 'package:flutter/material.dart';

class ShowBusinessModal extends StatefulWidget {
  const ShowBusinessModal({
    Key? key,
    // required this.businessPartnerController,
    // required this.businessTINController,
    // required this.emailController,
    // required this.contactController,
    // required this.businessPartnerOptions,
    // required this.selectedBusinessPartner,
    // required this.onAddPartner,
  }) : super(key: key);

  @override
  _ShowBusinessModalState createState() => _ShowBusinessModalState();
}

class _ShowBusinessModalState extends State<ShowBusinessModal> {
  final TextEditingController businessPartnerController =
      TextEditingController();
  final TextEditingController businessTINController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  final List<String> businessPartnerOptions = [
    'Customer',
    'Supplier',
    "Exempt"
  ];
  final String selectedBusinessPartner = "Customer";
  // final VoidCallback onAddPartner;
  late String selectedPartner;
  List<Map<String, dynamic>> partners = [];
  List<Map<String, dynamic>> filteredPartners = [];

  @override
  void initState() {
    super.initState();
    selectedPartner = selectedBusinessPartner;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Setup a Business Partner",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Business Partner text field
            Form(
              child: TextFormField(
                controller: businessPartnerController,
                decoration: InputDecoration(
                  labelText: 'Business Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // VAT Type Dropdown
            DropdownButtonFormField<String>(
              value: selectedPartner,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Type',
              ),
              items: businessPartnerOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPartner = newValue!;
                });
              },
            ),
            const SizedBox(height: 15),

            // Business TIN text field
            Form(
              child: TextFormField(
                controller: businessTINController,
                decoration: InputDecoration(
                  labelText: 'Business TIN',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Email text field
            Form(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Phone Number text field
            Form(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: contactController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            _addPartner();
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
          ),
          child: const Text("Add"),
        ),
      ],
    );
  }

  // Adds new items to the items list
  void _addPartner() {
    if (businessPartnerController.text.isEmpty &&
        businessTINController.text.isEmpty &&
        emailController.text.isEmpty &&
        contactController.text.isEmpty) {
      "Please fill in the required fields";
    }

    final newPartner = {
      'businessName': businessPartnerController.text,
      'businessTIN': businessTINController.text,
      'businessOptions': businessPartnerOptions,
      'email': emailController.text,
      'contact': contactController.text,
    };

    partners.add(newPartner);

    setState(() {
      // itemNameController.clear();
      // priceController.clear();
      // currencyController.clear();
      // isTaxInclusive = true;
      // itemDescriptionController.clear();
      // isTaxable = true;
      // selectedTourismOrCST = "None";
      // selectedItemCategory = "Regular VAT";
    });
  }
}
