// import 'package:flutter/material.dart';

// class ShowBusinessModal extends StatefulWidget {
//   const ShowBusinessModal({
//     Key? key,
//     // required this.businessPartnerController,
//     // required this.businessTINController,
//     // required this.emailController,
//     // required this.contactController,
//     // required this.businessPartnerOptions,
//     // required this.selectedBusinessPartner,
//     // required this.onAddPartner,
//   }) : super(key: key);

//   @override
//   _ShowBusinessModalState createState() => _ShowBusinessModalState();
// }

// class _ShowBusinessModalState extends State<ShowBusinessModal> {
//   final TextEditingController businessPartnerController =
//       TextEditingController();
//   final TextEditingController businessTINController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();

//   final List<String> businessPartnerOptions = [
//     'Customer',
//     'Supplier',
//     "Exempt"
//   ];
//   final String selectedBusinessPartner = "Customer";
//   // final VoidCallback onAddPartner;
//   late String selectedPartner;
//   List<Map<String, dynamic>> partners = [];
//   List<Map<String, dynamic>> filteredPartners = [];

//   @override
//   void initState() {
//     super.initState();
//     selectedPartner = selectedBusinessPartner;
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return SafeArea(
//   //     child: Scaffold(
//   //       body: _showBusinessModal(),
//   //     ),
//   //   );
//   // }

//   // Widget _showBusinessModal() {

//   // }

//   // Adds new items to the items list
//   void _addPartner() {
//     if (businessPartnerController.text.isEmpty &&
//         businessTINController.text.isEmpty &&
//         emailController.text.isEmpty &&
//         contactController.text.isEmpty) {
//       "Please fill in the required fields";
//     }

//     final newPartner = {
//       'businessName': businessPartnerController.text,
//       'businessTIN': businessTINController.text,
//       'businessOptions': businessPartnerOptions,
//       'email': emailController.text,
//       'contact': contactController.text,
//     };

//     partners.add(newPartner);

//     setState(() {
//       // itemNameController.clear();
//       // priceController.clear();
//       // currencyController.clear();
//       // isTaxInclusive = true;
//       // itemDescriptionController.clear();
//       // isTaxable = true;
//       // selectedTourismOrCST = "None";
//       // selectedItemCategory = "Regular VAT";
//     });
//   }
// }
